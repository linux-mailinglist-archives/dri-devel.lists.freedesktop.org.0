Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95167776DAF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 03:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C5E10E147;
	Thu, 10 Aug 2023 01:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EAB10E147
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 01:57:59 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d1ef7a6abacso424902276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 18:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691632678; x=1692237478;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C1eUR+i8ywidiH3Q/hZ5RblhFb7NEutEyHCiHQNNJFs=;
 b=KtezmRX6B/be0QfAMpUbeEwFXA3taU6DiclFDTRM3WYFX6tlgjBSs7T+00SKqYYiDO
 7ouOum4rt/r91Q9cFGZKgmHfZhElzuydgtT1lih9tWRgpU+GvhwxcUW54EI8TgE0OTRE
 THaH5QJMkTy9c2R8Q0lUqtMj39qCXGMMBblGNjeQkCim5gjoiJFxcJJDR4eNg2Vpy1PV
 U4BaJqB8xsd0bxrgy2LXPIPNa6YukB80Ha1p2UHK8d0ZucyC557QPhHyAn01jX92m6tL
 cTrwc8Zl0K8HyCNzugUzTCfey5ptmYi+IGCwO6ztd73vtXPfvm8YJ3mpEzR8JCh5lJuz
 F/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691632678; x=1692237478;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1eUR+i8ywidiH3Q/hZ5RblhFb7NEutEyHCiHQNNJFs=;
 b=iTRNq9O6GYGjLOhLXvdVZTvo3Aa2PSiDo1dt9BwTDCtzWYSiWrL9xUcIuaveUTtlgY
 vpYubaN3QXz0DZ7At7mq3bJ9t8wi8BrU4hFvDBiqIUklpTcXtP+dAoN30Z1rBw5ZVQrR
 lcf/hNzwUKM7mbcRpX6MAp+mdndbJHTT/JhcYFAorY3qRV5Y7nuz1HIQ0IE8Uo+Acx/I
 6otM+Vr+H8TBN2pGiLilIrWXlQLk6UVAz119d0tidbnnK+rJIrqnmwKHiUVZ98Onn/hC
 TnLxObi3+k5ffrGNaCgB7cRUMxx0ibtfc4O7qhHXzxiI9k7ay5U0aonkKsUFB747vv9N
 o7DQ==
X-Gm-Message-State: AOJu0YzNRyDJhtcs+YnFoPRyhwD+yxuupurG8xzG9yz1VDnoJTo9aw0f
 xXtPC/Epnncx2zDmzY0f0dn0g4YG07cPI92veg==
X-Google-Smtp-Source: AGHT+IEHRcXmliHnBk1RHJNGGa5HzyhaqUgdTmjX5FtiHcMdwonj8qLg/el37HVywankDq3LaPvjaelxJFP2NKgeEg==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a25:cb89:0:b0:d5d:b03c:49b2 with SMTP
 id b131-20020a25cb89000000b00d5db03c49b2mr19668ybg.11.1691632678141; Wed, 09
 Aug 2023 18:57:58 -0700 (PDT)
Date: Wed,  9 Aug 2023 18:57:36 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-1-almasrymina@google.com>
Subject: [RFC PATCH v2 00/11] Device Memory TCP
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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
 Sumit Semwal <sumit.semwal@linaro.org>, stephen@networkplumber.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Eric Dumazet <edumazet@google.com>,
 sdf@google.com, Andy Lutomirski <luto@kernel.org>,
 Hari Ramakrishnan <rharix@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in RFC v2:
------------------

The sticking point in RFC v1[1] was the dma-buf pages approach we used to
deliver the device memory to the TCP stack. RFC v2 is a proof-of-concept
that attempts to resolve this by implementing scatterlist support in the
networking stack, such that we can import the dma-buf scatterlist
directly. This is the approach proposed at a high level here[2].

Detailed changes:
1. Replaced dma-buf pages approach with importing scatterlist into the
   page pool.
2. Replace the dma-buf pages centric API with a netlink API.
3. Removed the TX path implementation - there is no issue with
   implementing the TX path with scatterlist approach, but leaving
   out the TX path makes it easier to review.
4. Functionality is tested with this proposal, but I have not conducted
   perf testing yet. I'm not sure there are regressions, but I removed
   perf claims from the cover letter until they can be re-confirmed.
5. Added Signed-off-by: contributors to the implementation.
6. Fixed some bugs with the RX path since RFC v1.

Any feedback welcome, but specifically the biggest pending questions
needing feedback IMO are:

1. Feedback on the scatterlist-based approach in general.
2. Netlink API (Patch 1 & 2).
3. Approach to handle all the drivers that expect to receive pages from
   the page pool (Patch 6).

[1] https://lore.kernel.org/netdev/dfe4bae7-13a0-3c5d-d671-f61b375cb0b4@gma=
il.com/T/
[2] https://lore.kernel.org/netdev/CAHS8izPm6XRS54LdCDZVd0C75tA1zHSu6jLVO8n=
zTLXCc=3DH7Nw@mail.gmail.com/

----------------------

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
kernel=E2=80=99s lack of semantics to express device to network transfers.

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

* Patch overview:

** Part 1: netlink API

Gives user ability to bind dma-buf to an RX queue.

** Part 2: scatterlist support

Currently the standard for device memory sharing is DMABUF, which doesn't
generate struct pages. On the other hand, networking stack (skbs, drivers, =
and
page pool) operate on pages. We have 2 options:

1. Generate struct pages for dmabuf device memory, or,
2. Modify the networking stack to process scatterlist.

Approach #1 was attempted in RFC v1. RFC v2 implements approach #2.

** part 3: page pool support

We piggy back on page pool memory providers proposal:
https://github.com/kuba-moo/linux/tree/pp-providers

It allows the page pool to define a memory provider that provides the
page allocation and freeing. It helps abstract most of the device memory
TCP changes from the driver.

** part 4: support for unreadable skb frags

Page pool iovs are not accessible by the host; we implement changes
throughput the networking stack to correctly handle skbs with unreadable
frags.

** Part 5: recvmsg() APIs

We define user APIs for the user to send and receive device memory.

Not included with this RFC is the GVE devmem TCP support, just to
simplify the review. Code available here if desired:
https://github.com/mina/linux/tree/tcpdevmem

This RFC is built on top of net-next with Jakub's pp-providers changes
cherry-picked.

* NIC dependencies:

1. (strict) Devmem TCP require the NIC to support header split, i.e. the
   capability to split incoming packets into a header + payload and to put
   each into a separate buffer. Devmem TCP works by using device memory
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

** Test Setup

Kernel: net-next with this RFC and memory provider API cherry-picked
locally.

Hardware: Google Cloud A3 VMs.

NIC: GVE with header split & RSS & flow steering support.

Mina Almasry (11):
  net: add netdev netlink api to bind dma-buf to a net device
  netdev: implement netlink api to bind dma-buf to netdevice
  netdev: implement netdevice devmem allocator
  memory-provider: updates to core provider API for devmem TCP
  memory-provider: implement dmabuf devmem memory provider
  page-pool: add device memory support
  net: support non paged skb frags
  net: add support for skbs with unreadable frags
  tcp: implement recvmsg() RX path for devmem TCP
  net: add SO_DEVMEM_DONTNEED setsockopt to release RX pages
  selftests: add ncdevmem, netcat for devmem TCP

 Documentation/netlink/specs/netdev.yaml |  27 ++
 include/linux/netdevice.h               |  61 +++
 include/linux/skbuff.h                  |  54 ++-
 include/linux/socket.h                  |   1 +
 include/net/page_pool.h                 | 186 ++++++++-
 include/net/sock.h                      |   2 +
 include/net/tcp.h                       |   5 +-
 include/uapi/asm-generic/socket.h       |   6 +
 include/uapi/linux/netdev.h             |  10 +
 include/uapi/linux/uio.h                |  10 +
 net/core/datagram.c                     |   6 +
 net/core/dev.c                          | 214 ++++++++++
 net/core/gro.c                          |   2 +-
 net/core/netdev-genl-gen.c              |  14 +
 net/core/netdev-genl-gen.h              |   1 +
 net/core/netdev-genl.c                  | 103 +++++
 net/core/page_pool.c                    | 171 ++++++--
 net/core/skbuff.c                       |  80 +++-
 net/core/sock.c                         |  36 ++
 net/ipv4/tcp.c                          | 196 ++++++++-
 net/ipv4/tcp_input.c                    |  13 +-
 net/ipv4/tcp_ipv4.c                     |   7 +
 net/ipv4/tcp_output.c                   |   5 +-
 net/packet/af_packet.c                  |   4 +-
 tools/include/uapi/linux/netdev.h       |  10 +
 tools/net/ynl/generated/netdev-user.c   |  41 ++
 tools/net/ynl/generated/netdev-user.h   |  46 ++
 tools/testing/selftests/net/.gitignore  |   1 +
 tools/testing/selftests/net/Makefile    |   5 +
 tools/testing/selftests/net/ncdevmem.c  | 534 ++++++++++++++++++++++++
 30 files changed, 1787 insertions(+), 64 deletions(-)
 create mode 100644 tools/testing/selftests/net/ncdevmem.c

--=20
2.41.0.640.ga95def55d0-goog

