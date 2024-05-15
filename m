Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B4E8C67F4
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 15:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9E110E95A;
	Wed, 15 May 2024 13:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tOp4lR8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C1810E3F8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:57:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C501F614C8;
 Wed, 15 May 2024 13:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B28C116B1;
 Wed, 15 May 2024 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715781471;
 bh=WlatdzDn5ln9onnNggxk+fyl1HpLY51fWYKvzy2mHOg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tOp4lR8Xi9y7SXrlPN4RRDtbbEihJDZsXFsYuT50HqukD2dqQDCKdRN12/0+EMRKb
 4GxcHkEYYQwNTs55WBFKc3l8txKL7m7sWXy58yR6ih2EpH7fbVOpRIbmJzLB6y7L43
 z3tzAMtENCjfDLcFGgLMxefwVbI2x/Ra7oqPq5kA6UeMNjS2ontIRJ7DJYf23xlGTD
 xRqA61OBzd3oV7HWy8to7fJOtP3opiZ9MdMxQw1dt2zDLuA0DQztG0HIZC/g1962Us
 k5i+gtEJav11An/G8O6Hb/Kv3zajjRErguxEBm1vDSs9KJn7+vjtGWzAjdYB9tbZ1E
 XDf25KvPwtkxA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:56:58 +0200
Subject: [PATCH 3/8] dma-buf: heaps: Import uAPI header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-3-54cbbd049511@kernel.org>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=mripard@kernel.org;
 h=from:subject:message-id; bh=WlatdzDn5ln9onnNggxk+fyl1HpLY51fWYKvzy2mHOg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+/3e/CltXrZHt3vnu0l/DhuoJs0MtQxoT13VdKcst
 2F5oU55x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI9cmMDY8aVp+d+WfjezXZ
 BxK7Ww+09n27yvEt6mCamVPDJU9H0ef93XVdB32ttZZOu7j37cmVVxnrPdJ8JPqMt8d3xXZP5t7
 xT1xa/dZ8lb1mKvf895zO+z7ZtenGhg5hzzuPwsUUkhKear4GAA==
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

The uAPI header has a bunch of constants and structures that might be
handy in drivers.

Let's include the header in the driver-side dma-heap header.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/dma-heap.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..e7cf110c5fdc 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -10,10 +10,12 @@
 #define _DMA_HEAPS_H
 
 #include <linux/cdev.h>
 #include <linux/types.h>
 
+#include <uapi/linux/dma-heap.h>
+
 struct dma_heap;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
  * @allocate:		allocate dmabuf and return struct dma_buf ptr

-- 
2.44.0

