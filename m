Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A86774E139
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 00:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B87010E18A;
	Mon, 10 Jul 2023 22:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC3A10E18A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 22:33:37 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-573cacf4804so55096417b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 15:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689028416; x=1691620416;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vww/pYdC1DJeva2AfnXbGu4C5u6TgbMhBMBTAdXoxfg=;
 b=tYuqkf1i1ML5V4o25T0vWw2AWYvTHmOdYjkPseY2zygasjrULUgRP0lpwslZq4BlNn
 r1p4R05iJaCaBeDKpj43UQs0ywurMXa8xm/jLGob/nvAh3tjpHM1PVLFapsJwR/ka1YV
 OCsLUyi/uoR6UBz4oCwsZPYuOl7NB6tSRitea5cmk6T+xQOOyfhtosCAuCmmHP3pASl3
 FTJcJXa6DUCUieE5FhnpIjd11iJE7Eyy6HtGjsye3wuVkng9TA1g9wlYGDtVF3B0KaVO
 3HzZZK95D11PQUMva7mNWvWl66mMUrB5ooxHO0g24qTp1JovuF4cWpSDU4WzfBUUTKLM
 wSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689028416; x=1691620416;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vww/pYdC1DJeva2AfnXbGu4C5u6TgbMhBMBTAdXoxfg=;
 b=aWaFsFvb/q30NvH3NZ8r7mkYR/vjGpmFnqRd2/8p05AfBB5FUWwwbJDDwpBdoDF4cw
 aZRKIxnuMBafcezhRwK5PtbWYw9FTl2G5n734L6NKTStBuWEpbGI4nKkKgTIiieY0MJB
 ubZqvOuO5T2Ki3qD1DSVzT6VPzohqUKq1AtXE4+cpBK5nspjRcDvbMipYGAlhJ1QSFxQ
 u77gYVTwM5vfilutrVEljLZBEv9A3qQZ14GRtR2BlQNngFBdMrTSjNzKFdSWK77Ykn/Q
 Zb7y6jxXMVdMoLzX27v5TyDp2Dlt3jszi1rIFJVo/chugePMzkfHMOTSRSkjetiLK+Bm
 hJQg==
X-Gm-Message-State: ABy/qLYbzyg1kURwzniwM5eSOesVanon2eWHTy0GAfjz3dE7cDzjd0nV
 VN7vdgA/nPqQcBmnT8BJwhLsEW5jNxAWbjIN4g==
X-Google-Smtp-Source: APBJJlEO8eLcuFuH8wVnMQWAHkbzZWQHuwFwsGmDwYpzfNPSGiEWAwrAUfjiTOVp1l1HiHVrM6vyb9Q+AKeZ71Ccyg==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:4c0f:bfb6:9942:8c53])
 (user=almasrymina job=sendgmr) by 2002:a81:ad44:0:b0:565:9e73:f937 with SMTP
 id l4-20020a81ad44000000b005659e73f937mr67586ywk.4.1689028416099; Mon, 10 Jul
 2023 15:33:36 -0700 (PDT)
Date: Mon, 10 Jul 2023 15:32:51 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.390.g38632f3daf-goog
Message-ID: <20230710223304.1174642-1-almasrymina@google.com>
Subject: [RFC PATCH 00/10] Device Memory TCP
From: Mina Almasry <almasrymina@google.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 netdev@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, jgg@ziepe.ca,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* TL;DR:

Device memory TCP (devmem TCP) is a proposal for transferring data to and/o=
r
from device memory efficiently, without bouncing the data to a host memory
buffer.

* Problem:

A large amount of data transfers have device memory as the source and/or
destination. Accelerators drastically increased the volume of such transfer=
s.
Some examples include:
- ML accelerators transferring large amounts of training data from storage =
into
  GPU/TPU memory. In some cases ML training setup time can be as long as 50=
% of
  TPU compute time, improving data transfer throughput & efficiency can hel=
p
  improving GPU/TPU utilization.

- Distributed training, where ML accelerators, such as GPUs on different ho=
sts,
  exchange data among them.

- Distributed raw block storage applications transfer large amounts of data=
 with
  remote SSDs, much of this data does not require host processing.

Today, the majority of the Device-to-Device data transfers the network are
implemented as the following low level operations: Device-to-Host copy,
Host-to-Host network transfer, and Host-to-Device copy.

The implementation is suboptimal, especially for bulk data transfers, and c=
an
put significant strains on system resources, such as host memory bandwidth,
PCIe bandwidth, etc. One important reason behind the current state is the
kernel=E2=80=99s lack of semantics to express device to network transfers.=
=C2=A0

* Proposal:

In this patch series we attempt to optimize this use case by implementing
socket APIs that enable the user to:

1. send device memory across the network directly, and
2. receive incoming network packets directly into device memory.

Packet _payloads_ go directly from the NIC to device memory for receive and=
 from
device memory to NIC for transmit.
Packet _headers_ go to/from host memory and are processed by the TCP/IP sta=
ck
normally. The NIC _must_ support header split to achieve this.

Advantages:

- Alleviate host memory bandwidth pressure, compared to existing
 network-transfer + device-copy semantics.

- Alleviate PCIe BW pressure, by limiting data transfer to the lowest level
  of the PCIe tree, compared to traditional path which sends data through t=
he
  root complex.

With this proposal we're able to reach ~96.6% line rate speeds with data se=
nt
and received directly from/to device memory.

* Patch overview:

** Part 1: struct paged device memory

Currently the standard for device memory sharing is DMABUF, which doesn't
generate struct pages. On the other hand, networking stack (skbs, drivers, =
and
page pool) operate on pages. We have 2 options:

1. Generate struct pages for dmabuf device memory, or,
2. Modify the networking stack to understand a new memory type.

This proposal implements option #1. We implement a small framework to gener=
ate
struct pages for an sg_table returned from dma_buf_map_attachment(). The su=
pport
added here should be generic and easily extended to other use cases interes=
ted
in struct paged device memory. We use this framework to generate pages that=
 can
be used in the networking stack.

** Part 2: recvmsg() & sendmsg() APIs

We define user APIs for the user to send and receive these dmabuf pages.

** part 3: support for unreadable skb frags

Dmabuf pages are not accessible by the host; we implement changes throughpu=
t the
networking stack to correctly handle skbs with unreadable frags.

** part 4: page pool support

We piggy back on Jakub's page pool memory providers idea:
https://github.com/kuba-moo/linux/tree/pp-providers

It allows the page pool to define a memory provider that provides the
page allocation and freeing. It helps abstract most of the device memory TC=
P
changes from the driver.

This is not strictly necessary, the driver can choose to allocate dmabuf pa=
ges
and use them directly without going through the page pool (if acceptable to
their maintainers).

Not included with this RFC is the GVE devmem TCP support, just to
simplify the review. Code available here if desired:
https://github.com/mina/linux/tree/tcpdevmem

This RFC is built on top of v6.4-rc7 with Jakub's pp-providers changes
cherry-picked.

* NIC dependencies:

1. (strict) Devmem TCP require the NIC to support header split, i.e. the
   capability to split incoming packets into a header + payload and to put
   each into a separate buffer. Devmem TCP works by using dmabuf pages
   for the packet payload, and host memory for the packet headers.

2. (optional) Devmem TCP works better with flow steering support & RSS supp=
ort,
   i.e. the NIC's ability to steer flows into certain rx queues. This allow=
s the
   sysadmin to enable devmem TCP on a subset of the rx queues, and steer
   devmem TCP traffic onto these queues and non devmem TCP elsewhere.

The NIC I have access to with these properties is the GVE with DQO support
running in Google Cloud, but any NIC that supports these features would suf=
fice.
I may be able to help reviewers bring up devmem TCP on their NICs.

* Testing:

The series includes a udmabuf kselftest that show a simple use case of
devmem TCP and validates the entire data path end to end without
a dependency on a specific dmabuf provider.

Not included in this series is our devmem TCP benchmark, which
transfers data to/from GPU dmabufs directly.

With this implementation & benchmark we're able to reach ~96.6% line rate
speeds with 4 GPU/NIC pairs running bi-direction traffic, with all the
packet payloads going straight to the GPU memory (no host buffer bounce).

** Test Setup

Kernel: v6.4-rc7, with this RFC and Jakub's memory provider API
cherry-picked locally.

Hardware: Google Cloud A3 VMs.

NIC: GVE with header split & RSS & flow steering support.

Benchmark: custom devmem TCP benchmark not yet open sourced.

Mina Almasry (10):
  dma-buf: add support for paged attachment mappings
  dma-buf: add support for NET_RX pages
  dma-buf: add support for NET_TX pages
  net: add support for skbs with unreadable frags
  tcp: implement recvmsg() RX path for devmem TCP
  net: add SO_DEVMEM_DONTNEED setsockopt to release RX pages
  tcp: implement sendmsg() TX path for for devmem tcp
  selftests: add ncdevmem, netcat for devmem TCP
  memory-provider: updates core provider API for devmem TCP
  memory-provider: add dmabuf devmem provider

 drivers/dma-buf/dma-buf.c              | 444 ++++++++++++++++
 include/linux/dma-buf.h                | 142 +++++
 include/linux/netdevice.h              |   1 +
 include/linux/skbuff.h                 |  34 +-
 include/linux/socket.h                 |   1 +
 include/net/page_pool.h                |  21 +
 include/net/sock.h                     |   4 +
 include/net/tcp.h                      |   6 +-
 include/uapi/asm-generic/socket.h      |   6 +
 include/uapi/linux/dma-buf.h           |  12 +
 include/uapi/linux/uio.h               |  10 +
 net/core/datagram.c                    |   3 +
 net/core/page_pool.c                   | 111 +++-
 net/core/skbuff.c                      |  81 ++-
 net/core/sock.c                        |  47 ++
 net/ipv4/tcp.c                         | 262 +++++++++-
 net/ipv4/tcp_input.c                   |  13 +-
 net/ipv4/tcp_ipv4.c                    |   8 +
 net/ipv4/tcp_output.c                  |   5 +-
 net/packet/af_packet.c                 |   4 +-
 tools/testing/selftests/net/.gitignore |   1 +
 tools/testing/selftests/net/Makefile   |   1 +
 tools/testing/selftests/net/ncdevmem.c | 693 +++++++++++++++++++++++++
 23 files changed, 1868 insertions(+), 42 deletions(-)
 create mode 100644 tools/testing/selftests/net/ncdevmem.c

--=20
2.41.0.390.g38632f3daf-goog

