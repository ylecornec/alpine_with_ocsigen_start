FROM alpine_with_opam 
MAINTAINER Yves-Stan Le Cornec "yves.stan.lecornec@gmail.com"

USER root
RUN apk add --no-cache gcc
RUN apk add --no-cache musl-dev
RUN apk add --no-cache m4
RUN apk add --no-cache perl
RUN apk add --no-cache gdbm-dev
RUN apk add --no-cache libressl-dev
RUN npm install -g sass
RUN apk add --no-cache postgresql-contrib
RUN apk add --no-cache jq

USER postgres
RUN opam init --disable-sandboxing
RUN opam update
RUN opam switch install 4.11.1+flambda
RUN opam install -y ppx_deriving_yojson
RUN opam install -y ocsigen-start
