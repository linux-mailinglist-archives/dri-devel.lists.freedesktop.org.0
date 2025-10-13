Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFBEBD227C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 10:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75F910E407;
	Mon, 13 Oct 2025 08:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ar36uzXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D2710E407
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 08:54:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2813960273;
 Mon, 13 Oct 2025 08:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76092C116B1;
 Mon, 13 Oct 2025 08:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760344526;
 bh=lUw9GHG4vdm6ouZncuqfKqupuE9bzmklFJzA4Z/pqzg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ar36uzXPghn/6XpfCNjCmvOdqTHBYAt0yZtSKxOeTfb8iSPc6AW078/YPCytyh/NK
 uqSMbumS5lFRZDZuunYla3fzj49PpXjYHIwGE9CAtoauqqc75fA/JiXsUpPOjODKSQ
 bXSNYablIiFUbEY2p3OmDDJagf7NxlJf+z+Sf3ZNC2fqzloEFNlluP8+qv1eDZ9OCN
 VndYhufDiZ594L2Tk2lV/tWkgudaAtunB8UDwaIaxf1Xb2oqxQqYY0NKXzXVCnoriT
 LgPfMcZKDgKDCmRJcFocHjSllRSL7zm1CXynLnqk7XZHQjJuUq3Juq8oSOEQzLvLwh
 2Vcoh3qxPMNrg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 13 Oct 2025 10:35:17 +0200
Subject: [PATCH v8 2/5] dma-buf: heaps: cma: Register list of CMA regions
 at boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-dma-buf-ecc-heap-v8-2-04ce150ea3d9@kernel.org>
References: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
In-Reply-To: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
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

In order to create a CMA heap instance for each CMA region found in the
system, we need to register each of these instances.

While it would appear trivial, the CMA regions are created super early
in the kernel boot process, before most of the subsystems are
initialized. Thus, we can't just create an exported function to create a
heap from the CMA region being initialized.

What we can do however is create a two-step process, where we collect
all the CMA regions into an array early on, and then when we initialize
the heaps we iterate over that array and create the heaps from the CMA
regions we collected.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 MAINTAINERS                       |  1 +
 drivers/dma-buf/heaps/cma_heap.c  | 14 ++++++++++++++
 include/linux/dma-buf/heaps/cma.h | 16 ++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968e4f9260263f1574ee29f5ff0de1c..c4edcc29368eec722432a85ac5c420a08c2680ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7306,10 +7306,11 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/driver-api/dma-buf.rst
 F:	Documentation/userspace-api/dma-buf-alloc-exchange.rst
 F:	drivers/dma-buf/
 F:	include/linux/*fence.h
 F:	include/linux/dma-buf.h
+F:	include/linux/dma-buf/
 F:	include/linux/dma-resv.h
 K:	\bdma_(?:buf|fence|resv)\b
 
 DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
 M:	Vinod Koul <vkoul@kernel.org>
diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0df007111975447d555714d61ead9699287fd65a..2a901af635ed76cdb085915c03258c235e302792 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -12,10 +12,11 @@
 
 #define pr_fmt(fmt) "cma_heap: " fmt
 
 #include <linux/cma.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf/heaps/cma.h>
 #include <linux/dma-heap.h>
 #include <linux/dma-map-ops.h>
 #include <linux/err.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
@@ -25,10 +26,23 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
 #define DEFAULT_CMA_NAME "default_cma_region"
 
+static struct cma *dma_areas[MAX_CMA_AREAS] __initdata;
+static unsigned int dma_areas_num __initdata;
+
+int __init dma_heap_cma_register_heap(struct cma *cma)
+{
+	if (dma_areas_num >= ARRAY_SIZE(dma_areas))
+		return -EINVAL;
+
+	dma_areas[dma_areas_num++] = cma;
+
+	return 0;
+}
+
 struct cma_heap {
 	struct dma_heap *heap;
 	struct cma *cma;
 };
 
diff --git a/include/linux/dma-buf/heaps/cma.h b/include/linux/dma-buf/heaps/cma.h
new file mode 100644
index 0000000000000000000000000000000000000000..e751479e21e703e24a5f799b4a7fc8bd0df3c1c4
--- /dev/null
+++ b/include/linux/dma-buf/heaps/cma.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef DMA_BUF_HEAP_CMA_H_
+#define DMA_BUF_HEAP_CMA_H_
+
+struct cma;
+
+#ifdef CONFIG_DMABUF_HEAPS_CMA
+int dma_heap_cma_register_heap(struct cma *cma);
+#else
+static inline int dma_heap_cma_register_heap(struct cma *cma)
+{
+	return 0;
+}
+#endif // CONFIG_DMABUF_HEAPS_CMA
+
+#endif // DMA_BUF_HEAP_CMA_H_

-- 
2.51.0

