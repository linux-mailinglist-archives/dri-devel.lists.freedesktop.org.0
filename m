Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D13C9B103F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 22:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AF110EB86;
	Fri, 25 Oct 2024 20:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="QoeNWVEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D919810EB85
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 20:44:26 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729889065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+962+r2Cmig/FghXZjEwbQhCwYeyPYtwliaBbnwkoQA=;
 b=QoeNWVEt8LiByi9WMf3TXS8kEmo3fnlbfDJ4UlLhi1KXnCSB8EIN96t4ucyc3iPDbEYA9k
 sjqsMKNMZhlFevVDZ190+PuEStPiQKfCw7/5q3uaLJy7NYx/jiCkDLTIPlqsX2DN8G2bJt
 BsL8BzOiwVCePd+bKrdYK+Hcq7xymFY=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v2 2/2] drm/etnaviv: Map and unmap GPUVA range with respect to
 the GPUVA size
Date: Sat, 26 Oct 2024 04:43:55 +0800
Message-Id: <20241025204355.595805-3-sui.jingfeng@linux.dev>
In-Reply-To: <20241025204355.595805-1-sui.jingfeng@linux.dev>
References: <20241025204355.595805-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Etnaviv assumes that GPU page size is 4KiB, however, GPUVA ranges collision
when using softpin capable GPUs on a non 4KiB CPU page size configuration.
The root cause is that kernel side BO takes up bigger address space than
userspace expect, the size of backing memory of GEM buffer objects are
required to align to the CPU PAGE_SIZE. Therefore, results in userspace
allocated GPUVA range fails to be inserted to the specified hole exactly.

To solve this problem, record the GPU visiable size of a BO firstly, then
map and unmap the SG entry strictly with respect to the total GPUVA size.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 36 +++++++++------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 1661d589bf3e..a2cd64bd2dc0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -70,8 +70,10 @@ static int etnaviv_context_map(struct etnaviv_iommu_context *context,
 }
 
 static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
+			     unsigned int va_len,
 			     struct sg_table *sgt, int prot)
-{	struct scatterlist *sg;
+{
+	struct scatterlist *sg;
 	unsigned int da = iova;
 	unsigned int i;
 	int ret;
@@ -81,14 +83,16 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
 
 	for_each_sgtable_dma_sg(sgt, sg, i) {
 		phys_addr_t pa = sg_dma_address(sg) - sg->offset;
-		size_t bytes = sg_dma_len(sg) + sg->offset;
+		unsigned int da_len = sg_dma_len(sg) + sg->offset;
+		unsigned int bytes = min_t(unsigned int, da_len, va_len);
 
-		VERB("map[%d]: %08x %pap(%zx)", i, iova, &pa, bytes);
+		VERB("map[%d]: %08x %pap(%x)", i, iova, &pa, bytes);
 
 		ret = etnaviv_context_map(context, da, pa, bytes, prot);
 		if (ret)
 			goto fail;
 
+		va_len -= bytes;
 		da += bytes;
 	}
 
@@ -104,21 +108,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
 static void etnaviv_iommu_unmap(struct etnaviv_iommu_context *context, u32 iova,
 				struct sg_table *sgt, unsigned len)
 {
-	struct scatterlist *sg;
-	unsigned int da = iova;
-	int i;
-
-	for_each_sgtable_dma_sg(sgt, sg, i) {
-		size_t bytes = sg_dma_len(sg) + sg->offset;
-
-		etnaviv_context_unmap(context, da, bytes);
-
-		VERB("unmap[%d]: %08x(%zx)", i, iova, bytes);
-
-		BUG_ON(!PAGE_ALIGNED(bytes));
-
-		da += bytes;
-	}
+	etnaviv_context_unmap(context, iova, len);
 
 	context->flush_seq++;
 }
@@ -131,7 +121,7 @@ static void etnaviv_iommu_remove_mapping(struct etnaviv_iommu_context *context,
 	lockdep_assert_held(&context->lock);
 
 	etnaviv_iommu_unmap(context, mapping->vram_node.start,
-			    etnaviv_obj->sgt, etnaviv_obj->base.size);
+			    etnaviv_obj->sgt, etnaviv_obj->size);
 	drm_mm_remove_node(&mapping->vram_node);
 }
 
@@ -305,16 +295,14 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 	node = &mapping->vram_node;
 
 	if (va)
-		ret = etnaviv_iommu_insert_exact(context, node,
-						 etnaviv_obj->base.size, va);
+		ret = etnaviv_iommu_insert_exact(context, node, etnaviv_obj->size, va);
 	else
-		ret = etnaviv_iommu_find_iova(context, node,
-					      etnaviv_obj->base.size);
+		ret = etnaviv_iommu_find_iova(context, node, etnaviv_obj->size);
 	if (ret < 0)
 		goto unlock;
 
 	mapping->iova = node->start;
-	ret = etnaviv_iommu_map(context, node->start, sgt,
+	ret = etnaviv_iommu_map(context, node->start, etnaviv_obj->size, sgt,
 				ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE);
 
 	if (ret < 0) {
-- 
2.34.1

