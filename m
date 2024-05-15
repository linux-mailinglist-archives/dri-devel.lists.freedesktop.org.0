Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529238C67F6
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 15:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8D310E990;
	Wed, 15 May 2024 13:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="efVBkvUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6833510E3F8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:57:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4F677CE16B6;
 Wed, 15 May 2024 13:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029F0C116B1;
 Wed, 15 May 2024 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715781461;
 bh=0Om0EsLkpFBVKkvz9olitc46qsiUdNn1/n5ZWkf37uM=;
 h=From:Subject:Date:To:Cc:From;
 b=efVBkvUHMwvEPS9v5viutvHv7Nwmm+sJx1bgg68pjDdL5tQOBfNrGoz42YlvUCiAj
 kn9/Q2v6QxgRiNb+6xYMD68qCd3reid6n/aqHUK1/+u2URPhCIsEV/12vnr3ycQvhH
 0X615sQhaDfm/PRn0AnpVG2lmlq4fRLOXY2gH6Yal52hYHSmyhf+K+pMjXbHKAP6/u
 CnZ59ZBD4F6zQ+ImRB82ZBpf4m/Is/rzzkq/FbSk/XwB7v0qyM3VAREipiMF3oxUIk
 hZJcPiSda5+9Wpt+dsWVmhoHvv5Ce8HWDlr5HjCVBPxAidyY1xdcYyuZosqcDBUqa5
 bW1opPrItcBIA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Date: Wed, 15 May 2024 15:56:55 +0200
Message-Id: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACe/RGYC/x3MQQqAIBBA0avIrBtIS6iuEi1Mx5pFJkoRhHdPW
 r7F/y9kSkwZJvFCopszn6FCNgLsbsJGyK4aVKv6VkuN7jC4Xh7JWtzJRFSD6aR0yo49Qc1iIs/
 Pv5yXUj7AlIV2YgAAAA==
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0Om0EsLkpFBVKkvz9olitc46qsiUdNn1/n5ZWkf37uM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+50Tp5XnH/PUiwzWiHWN5qhb6TVvj+JzU9WQlR+vH
 hINFfXtmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABO5OZWxzoZzzf/AWs7XRS8b
 b2ve+P/28/yayTKc7TP4yu8EKcs9T/BblnA2Ni96fpTEgzBOSf0PjA0bdl68zBtx8n3vjmrdCjb
 5sNayFR9yDVdVeth++TrprFWp9qWS08IBj13Lo87oGvAt+QUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi,

This series is the follow-up of the discussion that John and I had a few
months ago here:

https://lore.kernel.org/all/CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com/

The initial problem we were discussing was that I'm currently working on
a platform which has a memory layout with ECC enabled. However, enabling
the ECC has a number of drawbacks on that platform: lower performance,
increased memory usage, etc. So for things like framebuffers, the
trade-off isn't great and thus there's a memory region with ECC disabled
to allocate from for such use cases.

After a suggestion from John, I chose to start using heap allocations
flags to allow for userspace to ask for a particular ECC setup. This is
then backed by a new heap type that runs from reserved memory chunks
flagged as such, and the existing DT properties to specify the ECC
properties.

We could also easily extend this mechanism to support more flags, or
through a new ioctl to discover which flags a given heap supports.

I submitted a draft PR to the DT schema for the bindings used in this
PR:
https://github.com/devicetree-org/dt-schema/pull/138

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (8):
      dma-buf: heaps: Introduce a new heap for reserved memory
      of: Add helper to retrieve ECC memory bits
      dma-buf: heaps: Import uAPI header
      dma-buf: heaps: Add ECC protection flags
      dma-buf: heaps: system: Remove global variable
      dma-buf: heaps: system: Handle ECC flags
      dma-buf: heaps: cma: Handle ECC flags
      dma-buf: heaps: carveout: Handle ECC flags

 drivers/dma-buf/dma-heap.c            |   4 +
 drivers/dma-buf/heaps/Kconfig         |   8 +
 drivers/dma-buf/heaps/Makefile        |   1 +
 drivers/dma-buf/heaps/carveout_heap.c | 330 ++++++++++++++++++++++++++++++++++
 drivers/dma-buf/heaps/cma_heap.c      |  10 ++
 drivers/dma-buf/heaps/system_heap.c   |  29 ++-
 include/linux/dma-heap.h              |   2 +
 include/linux/of.h                    |  25 +++
 include/uapi/linux/dma-heap.h         |   5 +-
 9 files changed, 407 insertions(+), 7 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240515-dma-buf-ecc-heap-28a311d2c94e

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

