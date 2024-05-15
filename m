Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037F88C67FB
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 15:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B9510E992;
	Wed, 15 May 2024 13:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QXu68TXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A665610E0D4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:57:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EFC81614B0;
 Wed, 15 May 2024 13:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF92C116B1;
 Wed, 15 May 2024 13:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715781474;
 bh=3a1PkEj7cE+sch219RIbB9Jk0bMgUp62q1dLoyBXtNE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QXu68TXftiz2lZOlszefjpiO6hArafdb17Coy3vmlIKkWX1OTyUhmaxRP9Gkg92cH
 htkRgOtHMIewMzwPQE9UXTJz7jkSgrRdaRpNs0HD7mkSCmw/NSbr2Me1iPuizOTvpX
 xjJWdWNZYkbmCExVJkX80T7at917TAo29YHxraWuxwC2hZpBJgWFRWj74MZU/a8K62
 QTjhcN9n27uj0cTaUj/VBMnC+dlSa1CYn1E21Pyj6lT5FL6CFXiVAOC/didMJdwlPG
 RBqhC1ZopZGwWC3mrWGmGpxAHYPFEWTByZ60XzEqdIDZGy3iq3Xe5j9uxQt4n+DeHT
 R9aKXFT8gVe5g==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:56:59 +0200
Subject: [PATCH 4/8] dma-buf: heaps: Add ECC protection flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-4-54cbbd049511@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3a1PkEj7cE+sch219RIbB9Jk0bMgUp62q1dLoyBXtNE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+/2nKmw4Xr3PpCAtJ9HX6rfW47R9Dit2ez1IiU7p5
 phpe8G3YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEykhImxYfev3IBfD6+9YDuc
 2t2+614VF/dWOcUVfXc41n2rveHQrVlV4x7Qz73kL6f+39v2hZt6GRv+mvRsZot9yu0tP9m/82P
 TvNeat1UCvjcpnVfI+cYVKSlxuihVdOniK7tfLn0moneHYxYA
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

Some systems run with ECC enabled on the memory by default, but with
some memory regions with ECC disabled to mitigate the downsides of
enabling ECC (reduced performances, increased memory usage) for buffers
that don't require it.

Let's create some allocation flags to ask for a particular ECC setup
when allocate a dma-buf through a heap.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/dma-heap.c    | 4 ++++
 include/uapi/linux/dma-heap.h | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 84ae708fafe7..a96c1865b627 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -106,10 +106,14 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
 		return -EINVAL;
 
 	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
 		return -EINVAL;
 
+	if ((heap_allocation->heap_flags & DMA_HEAP_FLAG_ECC_PROTECTED) &&
+	    (heap_allocation->heap_flags & DMA_HEAP_FLAG_ECC_UNPROTECTED))
+		return -EINVAL;
+
 	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
 				   heap_allocation->fd_flags,
 				   heap_allocation->heap_flags);
 	if (fd < 0)
 		return fd;
diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
index 6f84fa08e074..677b6355552d 100644
--- a/include/uapi/linux/dma-heap.h
+++ b/include/uapi/linux/dma-heap.h
@@ -16,12 +16,13 @@
  */
 
 /* Valid FD_FLAGS are O_CLOEXEC, O_RDONLY, O_WRONLY, O_RDWR */
 #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
 
-/* Currently no heap flags */
-#define DMA_HEAP_VALID_HEAP_FLAGS (0)
+#define DMA_HEAP_FLAG_ECC_PROTECTED	BIT(0)
+#define DMA_HEAP_FLAG_ECC_UNPROTECTED	BIT(1)
+#define DMA_HEAP_VALID_HEAP_FLAGS (DMA_HEAP_FLAG_ECC_PROTECTED | DMA_HEAP_FLAG_ECC_UNPROTECTED)
 
 /**
  * struct dma_heap_allocation_data - metadata passed from userspace for
  *                                      allocations
  * @len:		size of the allocation

-- 
2.44.0

