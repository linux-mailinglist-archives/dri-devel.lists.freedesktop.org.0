Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1044BABD478
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3DE10E04F;
	Tue, 20 May 2025 10:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FOjh7YS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395A110E04F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 10:24:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B9FD6115E;
 Tue, 20 May 2025 10:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B875DC4CEE9;
 Tue, 20 May 2025 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747736641;
 bh=0QnjGAo7sOd2BF/4aVFYHcBW3acqApl8OAZGSRI8Pjo=;
 h=From:Subject:Date:To:Cc:From;
 b=FOjh7YS8lw5s4E8comfYlVGMn2A/g6YpbozbdFRcWULq2xbtDVtCpjOLpogte719I
 dCMljl57pxsPs9/dLgJlL5hzxPvi7WADwVO+rfLU5iHKKwR8PHPuNaWOSOmRvyr1im
 qhndnc2d6uZjjSmjLrDjTynmxS+vsWI0aSm1TB6qgiOb2BEVJ+hk2+t1QTAEeAZxnI
 K1zQvQK7l22yqodWq7zVxLYewou78LHnQfeb7cfY9LQSGkXc+TdNeBo7KDY8+MENHt
 grcbUAv0Y39gzzghNjRKSmhzkDhjQaoaSQKOTfNiZnq0Tnjyo/bomd+gmlI61LZ1ED
 7fjltvs2Uz3uw==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH RFC net-next 0/5] net: ethernet: ti: am65-cpsw: add AF_XDP
 zero copy support
Date: Tue, 20 May 2025 13:23:49 +0300
Message-Id: <20250520-am65-cpsw-xdp-zc-v1-0-45558024f566@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADVYLGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNT3cRcM1Pd5ILict2KlALdqmRdo8Q0y1STpFRDY1MzJaC2gqLUtMw
 KsJHRSkFuziCxvNQS3bzUihKl2NpaAHAbgmJzAAAA
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: srk@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=0QnjGAo7sOd2BF/4aVFYHcBW3acqApl8OAZGSRI8Pjo=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoLFg8/lm2uxS1tq8aEIrThEIaaMdO/kORclCDs
 tIBvpLVS+GJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCxYPAAKCRDSWmvTvnYw
 kwQ3D/47Ci+RJI7Jm8Qjvox5MHpWdTBIr/TUCYsMKXmhcFdt+Fizbr1MpHi2sAT2xuSnuAonazJ
 SSNRieG/yyud8zKYQbZ0351yBkue87WReTxSyJ0/zBLwz5LanzTbdsXLsJpRAthky29NakDZUkx
 2luYfY6OzaLWtVBwlPyhrFVg6HMeBguOudR5foIWsyzbKZnHhmCmmXF+zyfLH03ZfBlee38zUDV
 AAwjQ+v7y+S/Ngfl+oBK/yGxmXWrlOHq2qYAGhShknacDJAFi1AfTK7OERKXSvZ2PepksqT2bxi
 VYrGzr+A/1/LiiYXoDLA24YBGUx2I7uEJkWp2cgnpmDMrDx7qqce7wU+TZNzktvnm0trJ5lKwS6
 g9GPRHm2mE9CcGLDVzXcfcTFyibEfr1DQFUCA7URKO1221CoAVZYOn41urE7eO5wmAFlblsswoJ
 nXoQNJFzHaBmecD9wPyaWnQWduykxDhSO0PzGGeDKqOmqAjLh3/K0l/J8PfAQKYJyvft+uZjIcH
 ghwY7IFKJJA77UUHlBGaRp/TRXcwV7Rk3wtaSUcXgGjNJqNL8/iMNXuhfRF0yAU0txJHuhC97eE
 ZzQZ9CNuxq0OclA37oxKRaaoPakCZgX7C35o8OjVtETMHBgr/67AZOQDJc9RmEPHHnRbuGvsM4r
 phrgKJdHQYi8NUQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds AF_XDP zero coppy support to am65-cpsw driver.

Tests were performed on AM62x-sk with xdpsock application [1].

A clear improvement is seen in 64 byte packets on Transmit (txonly)
and receive (rxdrop).
1500 byte test seems to be limited by line rate (1G link) so no
improvement seen there in packet rate. A test on higher speed link
(or PHY-less setup) might be worthwile.

There is some issue during l2fwd with 64 byte packets and benchmark
results show 0. I'm still investigating this issue.

AF_XDP performance using 64 byte packets in Kpps.
Benchmark:	XDP-SKB		XDP-Native	XDP-Native(ZeroCopy)
rxdrop		317		504		824
txonly		400		405		757
l2fwd 		207		264		0

AF_XDP performance using 1500 byte packets in Kpps.
Benchmark:	XDP-SKB		XDP-Native	XDP-Native(ZeroCopy)
rxdrop		82		82		82
txonly		82		82		82
l2fwd 		82		82		82

[1]: https://github.com/xdp-project/bpf-examples/tree/master/AF_XDP-example

To: 

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
Roger Quadros (5):
      net: ethernet: ti: am65-cpsw: fix BPF Program change on multi-port CPSW
      net: ethernet: ti: am65-cpsw: add XSK pool helpers
      net: ethernet: ti: am65-cpsw: Add AF_XDP zero copy for RX
      net: ethernet: ti: am65-cpsw: Add AF_XDP zero copy for TX
      net: ethernet: ti: am65-cpsw: enable zero copy in XDP features

 drivers/net/ethernet/ti/Makefile         |   2 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 526 +++++++++++++++++++++++++++----
 drivers/net/ethernet/ti/am65-cpsw-nuss.h |  37 ++-
 drivers/net/ethernet/ti/am65-cpsw-xdp.c  | 155 +++++++++
 4 files changed, 656 insertions(+), 64 deletions(-)
---
base-commit: 9f607dc39b6658ba8ea647bd99725e68c66071b7
change-id: 20250225-am65-cpsw-xdp-zc-2af9e4be1356

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>

