Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409ED990ECE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 21:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EB810EAAC;
	Fri,  4 Oct 2024 19:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ftNsIPXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3915110EAAB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 19:42:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1728070956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EJrsyNwIp588IXKZBIiuIXp7P16IHtnrPh4MNvjTGI=;
 b=ftNsIPXu5yWFK5uGKVBVxFtlhQMVwwI0ePFe+xZi3HbLkOE17uCdKrM1oX6jrWkJ0uZmqW
 aZ97YrwoK0+6sp0lKOurPgC0n50nFt1cHRVbeIQ2qufLOpCNCQj9mX7f50q2BqtVJpPLbb
 id/P7nbCsaZred0PGd95KyMoBWyAFfA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 2/3] drm/etnaviv: Map and unmap the GPU VA range with respect
 to its user size
Date: Sat,  5 Oct 2024 03:42:06 +0800
Message-Id: <20241004194207.1013744-3-sui.jingfeng@linux.dev>
In-Reply-To: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
References: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
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

Since the GPU VA space is compact in terms of 4KiB unit, map and/or unmap
the area that doesn't belong to a context breaks the philosophy of PPAS.
That results in severe errors: GPU hang and MMU fault (page not present)
and such.

Shrink the usuable size of etnaviv GEM buffer object to its user size,
instead of the original physical size of its backing memory.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 28 +++++++++------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 6fbc62772d85..a52ec5eb0e3d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -70,8 +70,10 @@ static int etnaviv_context_map(struct etnaviv_iommu_context *context,
 }
 
 static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
+			     unsigned int user_len,
 			     struct sg_table *sgt, int prot)
-{	struct scatterlist *sg;
+{
+	struct scatterlist *sg;
 	unsigned int da = iova;
 	unsigned int i;
 	int ret;
@@ -81,7 +83,8 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
 
 	for_each_sgtable_dma_sg(sgt, sg, i) {
 		phys_addr_t pa = sg_dma_address(sg) - sg->offset;
-		size_t bytes = sg_dma_len(sg) + sg->offset;
+		unsigned int phys_len = sg_dma_len(sg) + sg->offset;
+		size_t bytes = MIN(phys_len, user_len);
 
 		VERB("map[%d]: %08x %pap(%zx)", i, iova, &pa, bytes);
 
@@ -89,6 +92,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
 		if (ret)
 			goto fail;
 
+		user_len -= bytes;
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
+			    etnaviv_obj->sgt, etnaviv_obj->user_size);
 	drm_mm_remove_node(&mapping->vram_node);
 }
 
@@ -314,7 +304,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 		goto unlock;
 
 	mapping->iova = node->start;
-	ret = etnaviv_iommu_map(context, node->start, sgt,
+	ret = etnaviv_iommu_map(context, node->start, user_size, sgt,
 				ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE);
 
 	if (ret < 0) {
-- 
2.34.1

