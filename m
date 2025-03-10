Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245EA59377
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9AF10E40A;
	Mon, 10 Mar 2025 12:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qP1HaEej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3908710E3FF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:06:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 342E6A4599F;
 Mon, 10 Mar 2025 12:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881E4C4CEF1;
 Mon, 10 Mar 2025 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741608406;
 bh=NXKrlxOk8nYj3oekFD8GiKq9/u4PNdR9ojkDiIpqr8Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qP1HaEejl3XbM+OS0ZKFaaD86jNWg/27gajc0J541SsR7ZFPhKVTG3ZBJjpoQMliu
 NOawWgEwaEwZ01wa9RTULuZgGivrBBZtKlDVAMzRxJDPnZAoKrNIUz/OMqTxQf68MV
 oyaDfZg98cxeS9aToEfD74iRQdNbpy6aqcpqBlADSmFpsqUKq0cg/k6/MaH2vfGyKW
 6HCbzZuIqVzOOtJXoG2bQpZofznzIf+76AEZdiodRQm3L1e2cymwgusOb2W1/8vrC2
 M1i0C9qr6qkLBJrKtljZQ4kUeY/hyStMuDlAMt7Sh2OLM1pXA2nCBEzZQs2jdbpcFl
 hz5IMtNseNp+g==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:16 +0100
Subject: [PATCH RFC 10/12] dma-buf: cma: Account for allocations in dmem cgroup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-10-2984c1bc9312@kernel.org>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
In-Reply-To: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NXKrlxOk8nYj3oekFD8GiKq9/u4PNdR9ojkDiIpqr8Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm7790W4odtyuqKjtsCfpWvTZgqvnjx9dp4mw4Vnx
 om7O58YdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi4sUM/+OM1uZ9mxg4/6n9
 j+bjKyIYp3zkEPha/IbRz9lBedkrhq0M/5Pe2ZUEOkbWVapK+j80WiT1S7Ppivsji5iFe/Z+XWB
 nwgEA
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

Now that we have a DMEM region per CMA region, we can track the
allocations of the CMA heap through DMEM.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 9512d050563a9ad0a735230c4870c3d3b3b01b25..4951c41db3ba0cbd903b6d62787f51b83f4a1e7e 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -7,10 +7,11 @@
  *
  * Also utilizing parts of Andrew Davis' SRAM heap:
  * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
  *	Andrew F. Davis <afd@ti.com>
  */
+#include <linux/cgroup_dmem.h>
 #include <linux/cma.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
 #include <linux/dma-map-ops.h>
 #include <linux/err.h>
@@ -276,23 +277,31 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 					 unsigned long len,
 					 u32 fd_flags,
 					 u64 heap_flags)
 {
 	struct cma_heap *cma_heap = dma_heap_get_drvdata(heap);
+	struct dmem_cgroup_pool_state *pool;
 	struct cma_heap_buffer *buffer;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	size_t size = PAGE_ALIGN(len);
 	pgoff_t pagecount = size >> PAGE_SHIFT;
 	unsigned long align = get_order(size);
 	struct page *cma_pages;
 	struct dma_buf *dmabuf;
 	int ret = -ENOMEM;
 	pgoff_t pg;
 
+	ret = dmem_cgroup_try_charge(cma_get_dmem_cgroup_region(cma_heap->cma),
+				     size, &pool, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
-	if (!buffer)
-		return ERR_PTR(-ENOMEM);
+	if (!buffer) {
+		ret = -ENOMEM;
+		goto uncharge_cgroup;
+	}
 
 	INIT_LIST_HEAD(&buffer->attachments);
 	mutex_init(&buffer->lock);
 	buffer->len = size;
 
@@ -348,18 +357,23 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(dmabuf)) {
 		ret = PTR_ERR(dmabuf);
 		goto free_pages;
 	}
+
+	dmabuf->cgroup_pool = pool;
+
 	return dmabuf;
 
 free_pages:
 	kfree(buffer->pages);
 free_cma:
 	cma_release(cma_heap->cma, cma_pages, pagecount);
 free_buffer:
 	kfree(buffer);
+uncharge_cgroup:
+	dmem_cgroup_uncharge(pool, len);
 
 	return ERR_PTR(ret);
 }
 
 static const struct dma_heap_ops cma_heap_ops = {

-- 
2.48.1

