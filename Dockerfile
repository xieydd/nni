FROM nni_pre:xieydd

RUN mv /nni/src/nni_manager/node_modules /tmp/ && mv /nni/src/nni_manager/dist /tmp/ && mv /nni/src/nni_manager/yarn.lock /tmp/ && mv /nni/src/webui/node_modules /tmp/node_modules_webui && mv /nni/src/webui/yarn.lock /tmp/yarn.lock_webui && rm -rf /nni/

WORKDIR /nni/
COPY . /nni/
RUN mv /tmp/node_modules /nni/src/nni_manager/ && mv /tmp/dist /nni/src/nni_manager/ && mv /tmp/yarn.lock /nni/src/nni_manager/ && mv /tmp/yarn.lock_webui /nni/src/webui/yarn.lock && mv /tmp/node_modules_webui /nni/src/webui/node_modules
RUN make final && make dev-install 

EXPOSE 8080
ENV PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/root/.local/bin:/usr/bin:/bin:/sbin
ENTRYPOINT ["/bin/bash"]
