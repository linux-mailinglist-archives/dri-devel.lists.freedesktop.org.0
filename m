Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1A59C1F73
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A3110E9D6;
	Fri,  8 Nov 2024 14:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="GoZbh8LD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1540C10E9D6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:37:12 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1731076630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=z+RsATegg/V/A7cLrYIbSsXAjRY54K8xgAdFBEZuIYo=;
 b=GoZbh8LDPZ/qu/5FkjavYIDSt/lOAWp2exFX1xisYioGREf5A/l1pnzpWwQA1P0r2DjNj5
 9oyU+D6dBuHTVuOHaHNUSmdzYcA9rF6kC9wmY2lqWA/E1xiW2IZJVv0lKx1JlmvlOxY3Cp
 Z985vn+xFrzVYK2PzFEgHPJVg/W+E8I=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 1/2] drm/etnaviv: Preallocate STLB according to CPU PAGE_SIZE
Date: Fri,  8 Nov 2024 22:36:57 +0800
Message-Id: <20241108143658.2229786-1-sui.jingfeng@linux.dev>
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

The dma_direct_alloc() allocate one page at minmium, which size is the CPU
PAGE_SIZE. while the etnaviv_iommuv2_ensure_stlb() only ask for 4KiB. The
rest memory space that beyond 4KiB gets wasted on bigger page size systems.
For example, on 16KiB CPU page size systems, we will waste the rest 12KiB.
On 64KiB CPU page size systems, we will waste the rest 60KiB.

Since addresses within one page are always contiguous, the rest memory can
be used to store adjacent slave TLB entries. Then, when the neighbourhoods
TLB is being hit on the next time, we don't have to ask another one page
from the system. Saving both memorys and times overhead because of that.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 64 +++++++++++++++++++---
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
index d664ae29ae20..fa6eed1ae1be 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
@@ -44,19 +44,66 @@ to_v2_context(struct etnaviv_iommu_context *context)
 	return container_of(context, struct etnaviv_iommuv2_context, base);
 }
 
+static int etnaviv_iommuv2_stlb_free(struct etnaviv_iommuv2_context *context)
+{
+	struct device *dev = context->base.global->dev;
+	unsigned int i;
+
+	for (i = 0; i < MMUv2_MAX_STLB_ENTRIES; ++i) {
+		u32 *vaddr = context->stlb_cpu[i];
+
+		if (!vaddr)
+			continue;
+
+		context->stlb_cpu[i] = NULL;
+
+		if (i % (PAGE_SIZE / SZ_4K))
+			continue;
+
+		dma_free_wc(dev, PAGE_SIZE, vaddr, context->stlb_dma[i]);
+	}
+
+	return 0;
+}
+
+static int
+etnaviv_iommuv2_ensure_stlb_new(struct etnaviv_iommuv2_context *context,
+				unsigned int stlb)
+{
+	struct device *dev = context->base.global->dev;
+	void *vaddr;
+	dma_addr_t daddr;
+	unsigned int i;
+
+	if (context->stlb_cpu[stlb])
+		return 0;
+
+	vaddr = dma_alloc_wc(dev, PAGE_SIZE, &daddr, GFP_KERNEL);
+	if (!vaddr)
+		return -ENOMEM;
+
+	memset32(vaddr, MMUv2_PTE_EXCEPTION, PAGE_SIZE / sizeof(u32));
+
+	stlb &= ~(PAGE_SIZE / SZ_4K - 1);
+
+	for (i = 0; i < PAGE_SIZE / SZ_4K; ++i) {
+		context->stlb_cpu[stlb + i] = vaddr;
+		context->stlb_dma[stlb + i] = daddr;
+		context->mtlb_cpu[stlb + i] = daddr | MMUv2_PTE_PRESENT;
+		vaddr += SZ_4K;
+		daddr += SZ_4K;
+	}
+
+	return 0;
+}
+
 static void etnaviv_iommuv2_free(struct etnaviv_iommu_context *context)
 {
 	struct etnaviv_iommuv2_context *v2_context = to_v2_context(context);
-	int i;
 
 	drm_mm_takedown(&context->mm);
 
-	for (i = 0; i < MMUv2_MAX_STLB_ENTRIES; i++) {
-		if (v2_context->stlb_cpu[i])
-			dma_free_wc(context->global->dev, SZ_4K,
-				    v2_context->stlb_cpu[i],
-				    v2_context->stlb_dma[i]);
-	}
+	etnaviv_iommuv2_stlb_free(v2_context);
 
 	dma_free_wc(context->global->dev, SZ_4K, v2_context->mtlb_cpu,
 		    v2_context->mtlb_dma);
@@ -65,6 +112,7 @@ static void etnaviv_iommuv2_free(struct etnaviv_iommu_context *context)
 
 	vfree(v2_context);
 }
+
 static int
 etnaviv_iommuv2_ensure_stlb(struct etnaviv_iommuv2_context *v2_context,
 			    int stlb)
@@ -109,7 +157,7 @@ static int etnaviv_iommuv2_map(struct etnaviv_iommu_context *context,
 	mtlb_entry = (iova & MMUv2_MTLB_MASK) >> MMUv2_MTLB_SHIFT;
 	stlb_entry = (iova & MMUv2_STLB_MASK) >> MMUv2_STLB_SHIFT;
 
-	ret = etnaviv_iommuv2_ensure_stlb(v2_context, mtlb_entry);
+	ret = etnaviv_iommuv2_ensure_stlb_new(v2_context, mtlb_entry);
 	if (ret)
 		return ret;
 
-- 
2.34.1

