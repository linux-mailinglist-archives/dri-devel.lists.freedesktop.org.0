Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420051FF734
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB9D6EB70;
	Thu, 18 Jun 2020 15:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3773A6EB6B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:20 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154018euoutp02ec28070f067f5d837e81d10c0d3e8ad0~ZrZmymBQP1250012500euoutp02a
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200618154018euoutp02ec28070f067f5d837e81d10c0d3e8ad0~ZrZmymBQP1250012500euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494818;
 bh=BUDsnzPfM8pecFmTHTRzLrmx2aEqpYyXAUW4mvYfV28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j2ZV2oFRMrGCaywwNNrqCbdbyyW5U75ngXK/V2zR6qmOh/dluGTEVEDky5ITNQEyk
 4g/IpRjRpvljHuRi+CSWA61J6/AoBy/Pxh2Y7DmFG/EnxdhCRKO9NKMfFTE0sDA3r0
 t/q8+U6oz1QKTxGfo5lDIRPeV9wbaXUeHG5lSE/k=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200618154018eucas1p26ba7a8cdc44363cbbd10ab03428eab17~ZrZmi99Za0607806078eucas1p2O;
 Thu, 18 Jun 2020 15:40:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id DE.0F.61286.2EA8BEE5; Thu, 18
 Jun 2020 16:40:18 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154018eucas1p1037a99bc0dc24e0ba61242e7b34c5818~ZrZmBgStb1248212482eucas1p1j;
 Thu, 18 Jun 2020 15:40:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200618154018eusmtrp26611e9f6b80cabf5be0abbf0d9a6e422~ZrZmA3jaW0399203992eusmtrp2T;
 Thu, 18 Jun 2020 15:40:18 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-be-5eeb8ae2fe0e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D3.EE.08375.1EA8BEE5; Thu, 18
 Jun 2020 16:40:17 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154017eusmtip183dd4207368bf9a26fc090eb2dfead5c~ZrZlXRMas0834108341eusmtip1L;
 Thu, 18 Jun 2020 15:40:17 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/36] drm: etnaviv: fix common struct sg_table related
 issues
Date: Thu, 18 Jun 2020 17:39:27 +0200
Message-Id: <20200618153956.29558-7-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSeUgUURzHeTN7jJsr4yr5sFLYyjDIIyOmPNASHEhIyIikNlcd1HJ13VFL
 gxKvbM3byrZLTfK+VtnKWzFXs7wzLUUtz1SSvMpQcx2t/z6/7+/75fve42GoQMk2xHz9gyiZ
 v9hPyOGxVM2/O458lc+ILNbrDhDx7a0IUZZewiY2VMko0bv0g0NUpg9yibyCtwiRUWdNjDwd
 QIjF3lGEUH7rYxM9lU84RFHTEJdomB9j2/PJwmeFgKxZzmCRr5ZH2ORwnBohy7Nvk1/Wv6Fk
 an8OIKsGwjlk4poFmVCRD8gFpZHLLjeejRfl5xtCyczt3Hk+K+UxXOnK/hsvm7s44SDBSA4w
 DOLH4OdZRA54mADPBfBj3xqXGRYBTOjP294sAFhaW8XaSeTdOc7oOQC+z3qwadJiEqooXQ1z
 cEson5NzNKyPRwPYEq+tYRQfRuCf6asa1sPPwdaKrq0sCz8INyI0fgzj47ZQVSTWyBA3hgWl
 9aiGtXA72KaOZmt6Id7Mhfc757mMyRH2KZpZDOvB7+qKbX0v3HjzHGECkQCOthdxmeEegD0R
 6YBxWcPB9tWtZhQ3hSWV5ozsAFdT8jnMhXVg/5wuc34dmKJ6iDIyH8bGCBi3CVSoi//VNnR2
 owyT8PHq+PaDJgO4PDTBTgLGiv9lGQDkAwMqmJZ4U7SlP3XdjBZL6GB/bzPPAIkSbP6ktnX1
 z9dgqdujEeAYEGrz7S/MiARscQgdKmkEEEOF+vxTH9pEAr6XODSMkgVckQX7UXQj2IOxhAZ8
 q6zpywLcWxxEXaMoKSXb2SKYlmE4iJzIjPP0mI1QzJ4NrXB1lwVlOqaLrLJFHqZpTtIT/U7v
 EJdLbia/Wma7jsqNUgrPxOZKs6iO8JsrU8XO9dU9TfPjLxwC9+0Os62+e7pscmkyWZWWVO18
 /uKUzZhra8Cj7BYTM/74J5ZhcI3kkNUtQa40MdBcORyV2nOyVtJC89qELNpHbHkYldHivwPO
 JYZFAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsVy+t/xu7oPu17HGSzYYG3Re+4kk8XGGetZ
 Lf5vm8hsceXrezaLXTPusFusXH2UyWLBfmuLB3NvMll8ufKQyWLT42usFpd3zWGzWHvkLrvF
 wQ9PWB14PdbMW8PosffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7ZgObR/9fA4++
 LasYPT5vkgvgjtKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxL
 LdK3S9DL+L65jb3gu3LFsmMX2RoY++S6GDk4JARMJFa2m3UxcnEICSxllDj0ZwpbFyMnUFxG
 4uS0BlYIW1jiz7UuNoiiT4wS9w6uZQJJsAkYSnS9hUiICHQySkzr/sgOkmAWeM4k8bJFH8QW
 FgiUmLBhOdhUFgFVif9NIA0cHLwCthLb1iZCLJCXWL3hADOIzSlgJ3H6eCvYYiGgkucf2tgm
 MPItYGRYxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERgl24793LyD8dLG4EOMAhyMSjy8L0Je
 xwmxJpYVV+YeYpTgYFYS4XU6ezpOiDclsbIqtSg/vqg0J7X4EKMp0E0TmaVEk/OBEZxXEm9o
 amhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGR087TkcF3lcZ8E9kekdeH
 o9Lv8B/mTBCaxHFvwjzVYK7w9hTNqmyFM+8NN2vuWSx9Nyrc0tLfdG1JueXG17M/71opltFn
 zHBpZvajwDKbs0Iex9euvz3ndnhJhNAt/r21VV9kb3AaH/miOkc9JCZbv/tR9satuw+vaK49
 4OZjf09s0Wo/s5tKLMUZiYZazEXFiQDSfWdeqAIAAA==
X-CMS-MailID: 20200618154018eucas1p1037a99bc0dc24e0ba61242e7b34c5818
X-Msg-Generator: CA
X-RootMTR: 20200618154018eucas1p1037a99bc0dc24e0ba61242e7b34c5818
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154018eucas1p1037a99bc0dc24e0ba61242e7b34c5818
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154018eucas1p1037a99bc0dc24e0ba61242e7b34c5818@eucas1p1.samsung.com>
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
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 12 +++++-------
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 13 +++----------
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index f5e5bb8ba953..9f4613f7e255 100644
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
index 3607d348c298..13b100553a0b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -79,7 +79,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
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
