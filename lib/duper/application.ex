defmodule Duper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias Duper.{Results, PathFinder, WorkerSupervisor, Gatherer}

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Results,
      {PathFinder, "."},
      WorkerSupervisor,
      {Gatherer, 1}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: Duper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
