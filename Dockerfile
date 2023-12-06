FROM ubuntu:focal
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt-add-repository -y ppa:neovim-ppa/unstable && apt update && apt install -y curl git ansible build-essential neovim
COPY . .
COPY dotfiles/ /root 
RUN ansible-playbook -i localhost, -c local local.yml
CMD ["zsh"]
