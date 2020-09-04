Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6535D25D9DC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3622D6E2EA;
	Fri,  4 Sep 2020 13:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E4D6E2B1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:34:58 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133457euoutp01958bee2a6b690c22066351394cf90cb5~xmAam4WlH0637106371euoutp015
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 13:34:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200904133457euoutp01958bee2a6b690c22066351394cf90cb5~xmAam4WlH0637106371euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226497;
 bh=Jqso+4bTDsmQXRdsE1uC1DJyWvKiAsqf3Oy0GQ+Xf/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fj2TrcKf9R10JjdPmn+rEu3DyFqBxhluYIcuV115IcoXWRztmlLMmR8/O8Intlaxt
 TDmaVragrqng7YJZ6tb7IYNgn6QEY5FOk7L3fLWZt+9oJAu9UDJ/fXuNQGXNxnIz/O
 MK/nVgFnENb1wEYJ7bD6W5QfHKNNUXkwzIrRp+Nc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200904133456eucas1p19e8a254b2d7cec37aae8e5060a65da78~xmAaaCCDv1681116811eucas1p1Z;
 Fri,  4 Sep 2020 13:34:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 81.39.06318.082425F5; Fri,  4
 Sep 2020 14:34:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133456eucas1p10d0fe1628474fcd4803a7af4437be4e1~xmAZ8PRD70114501145eucas1p1m;
 Fri,  4 Sep 2020 13:34:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133456eusmtrp21e5fcd9c9d86afb3994231902fa9fe43~xmAZ7evrQ0905709057eusmtrp2b;
 Fri,  4 Sep 2020 13:34:56 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-89-5f5242803992
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4E.90.06017.082425F5; Fri,  4
 Sep 2020 14:34:56 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133455eusmtip1bb4917684ef6f6bef142062880ad386c~xmAZXYpvM1683116831eusmtip1W;
 Fri,  4 Sep 2020 13:34:55 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 05/30] drm: etnaviv: fix common struct sg_table related
 issues
Date: Fri,  4 Sep 2020 15:16:46 +0200
Message-Id: <20200904131711.12950-6-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRj229k5Oy4nxznYh4nCQNEsL5hwwGsmdCIiE6UbaTNPU9NpO86y
 iLRQwrJ0SZqt1BA0bzM1b2Veqq0SZzgz75f0hxZSOB1YXnIerX/P9z7vc+HlwxFhA2qHx8lT
 aIVcmiDB+Nwm7UrfvvTgsCjP1Uk3Mkf/kUO+KNSg5EZTHkIOLP/EyLbCMR75vOo9hyzp8CWn
 ngxzyKWBaQ5ZPzOIkoY2NUbWvBvnkV2/ZtEgAVX9tBpQ7aYSLtVsmkKpyTs6DtVQdoMaXZ9B
 qAdD5YB6NZyOUffXPKl7jZWAMtY7hO46zfeLoRPiUmmFR8A5fmx+3TyWPOB0xdSl5aWDRsds
 YIlDYj/MH6wF2YCPC4kKAIdWajAzISSWAGw0HmIJI4BZZc3IjmJc38FjiXIAc4rNCj6rUBu+
 bm1hhBfMXsjeshIRmQB+yLEyY4SY5MA/8/FmbEuEw8X2Da4ZcwknaGod3HTFcQHhD9VDrmyY
 I6yq69yytCQC4MvCWdScBQktD5a91mw3CoFd2gXAYlv4XdfIY7E93Ggt5rCCWwBO62t47OMu
 gIabhdsKXzim/42ZkxHCFWraPNjxATj8RYeYx5CwhkMLNmx/a6hqKtgeC+DtLCG77QyLdLX/
 Yrs+929Xo6BhpAVlL5oHYMajvbnAseh/VgkAlUBMK5lEGc14y+nL7ow0kVHKZe7nkxLrweZX
 6lnXLbeAN6vR3YDAgcRKYBEYFiVEpalMWmI3gDgiEQmCe3sihYIYadpVWpEUpVAm0Ew32I1z
 JWKB97P5s0JCJk2hL9J0Mq3YYTm4pV06SHYLPxENVNfXgwKdF/3QS6Ei3Te+V2ZQyDEbruHw
 JGpxykdd2vlQI+aJ/fvfGo/EYDJVBHXwcZ7cTyKamHMovcbvl8z5eP3oY9Ta8gtrGcKKiAlv
 WcPJrMoV26NnMHFceKe8IVIpOF6goqpTZj6FdthH9+aOuMSPGj00wS4SLhMr9dqDKBjpX7CY
 1PFGAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsVy+t/xu7oNTkHxBq8OCVj0njvJZLFxxnpW
 i//bJjJbXPn6ns1i14w77BYrVx9lsliw39riwdybTBZfrjxkstj0+BqrxeVdc9gs1h65y25x
 8MMTVgdejzXz1jB67P22gMVj+7cHrB73u48zeWxeUu9x+99jZo/JN5Yzeuy+2cDm0f/XwKNv
 yypGj8+b5AK4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstS
 i/TtEvQypmx4yVZwRbXi28Fj7A2MW+S7GDk5JARMJO6e28/excjFISSwlFFixaI9TBAJGYmT
 0xpYIWxhiT/Xutggij4xStzq3cQCkmATMJToeguREBHoZJSY1v2RHSTBLPCcSeJliz6ILSwQ
 JHH15WOwSSwCqhLfdl4DquHg4BWwlZhzQxNigbzE6g0HmEFsTgE7ia0znoCVCwGVfJizmGUC
 I98CRoZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgXGy7djPLTsYu94FH2IU4GBU4uFlsA+K
 F2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRlOgmyYyS4km5wNjOK8k3tDU
 0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA+OBTO+fRbJqCUqrHu68VKw4
 b7/k8cnq4gHrvldLW9u/3Pvr08d90/nfS7psd1xTsPCy/+kDgao7bqz3+/g++9ekvU/dtsYy
 P73KmmTqaXj1wSeGs0UHk672z3f//N5fva7i/RPPNTfO/P6b4bDnXA0nH1PiXpVXnio3zm07
 ppXPkea9chXP0dd8SizFGYmGWsxFxYkAzNO77qkCAAA=
X-CMS-MailID: 20200904133456eucas1p10d0fe1628474fcd4803a7af4437be4e1
X-Msg-Generator: CA
X-RootMTR: 20200904133456eucas1p10d0fe1628474fcd4803a7af4437be4e1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133456eucas1p10d0fe1628474fcd4803a7af4437be4e1
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133456eucas1p10d0fe1628474fcd4803a7af4437be4e1@eucas1p1.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
returns the number of the created entries in the DMA address space.
However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
dma_unmap_sg must be called with the original number of the entries
passed to the dma_map_sg().

struct sg_table is a common structure used for describing a non-contiguous
memory buffer, used commonly in the DRM and graphics subsystems. It
consists of a scatterlist with memory pages and DMA addresses (sgl entry),
as well as the number of scatterlist entries: CPU pages (orig_nents entry)
and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg()
function.

To avoid such issues, lets use a common dma-mapping wrappers operating
directly on the struct sg_table objects and use scatterlist page
iterators where possible. This, almost always, hides references to the
nents and orig_nents entries, making the code robust, easier to follow
and copy/paste safe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 12 +++++-------
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 15 ++++-----------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index f06e19e7be04..eaf1949bc2e4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -27,7 +27,7 @@ static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
 	 * because display controller, GPU, etc. are not coherent.
 	 */
 	if (etnaviv_obj->flags & ETNA_BO_CACHE_MASK)
-		dma_map_sg(dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+		dma_map_sgtable(dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
 }
 
 static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj)
@@ -51,7 +51,7 @@ static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj
 	 * discard those writes.
 	 */
 	if (etnaviv_obj->flags & ETNA_BO_CACHE_MASK)
-		dma_unmap_sg(dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+		dma_unmap_sgtable(dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
 }
 
 /* called with etnaviv_obj->lock held */
@@ -404,9 +404,8 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
 	}
 
 	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
-		dma_sync_sg_for_cpu(dev->dev, etnaviv_obj->sgt->sgl,
-				    etnaviv_obj->sgt->nents,
-				    etnaviv_op_to_dma_dir(op));
+		dma_sync_sgtable_for_cpu(dev->dev, etnaviv_obj->sgt,
+					 etnaviv_op_to_dma_dir(op));
 		etnaviv_obj->last_cpu_prep_op = op;
 	}
 
@@ -421,8 +420,7 @@ int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
 	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
 		/* fini without a prep is almost certainly a userspace error */
 		WARN_ON(etnaviv_obj->last_cpu_prep_op == 0);
-		dma_sync_sg_for_device(dev->dev, etnaviv_obj->sgt->sgl,
-			etnaviv_obj->sgt->nents,
+		dma_sync_sgtable_for_device(dev->dev, etnaviv_obj->sgt,
 			etnaviv_op_to_dma_dir(etnaviv_obj->last_cpu_prep_op));
 		etnaviv_obj->last_cpu_prep_op = 0;
 	}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 3607d348c298..15d9fa3879e5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -73,13 +73,13 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
 			     struct sg_table *sgt, unsigned len, int prot)
 {	struct scatterlist *sg;
 	unsigned int da = iova;
-	unsigned int i, j;
+	unsigned int i;
 	int ret;
 
 	if (!context || !sgt)
 		return -EINVAL;
 
-	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+	for_each_sgtable_dma_sg(sgt, sg, i) {
 		u32 pa = sg_dma_address(sg) - sg->offset;
 		size_t bytes = sg_dma_len(sg) + sg->offset;
 
@@ -95,14 +95,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
 	return 0;
 
 fail:
-	da = iova;
-
-	for_each_sg(sgt->sgl, sg, i, j) {
-		size_t bytes = sg_dma_len(sg) + sg->offset;
-
-		etnaviv_context_unmap(context, da, bytes);
-		da += bytes;
-	}
+	etnaviv_context_unmap(context, iova, da - iova);
 	return ret;
 }
 
@@ -113,7 +106,7 @@ static void etnaviv_iommu_unmap(struct etnaviv_iommu_context *context, u32 iova,
 	unsigned int da = iova;
 	int i;
 
-	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+	for_each_sgtable_dma_sg(sgt, sg, i) {
 		size_t bytes = sg_dma_len(sg) + sg->offset;
 
 		etnaviv_context_unmap(context, da, bytes);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
