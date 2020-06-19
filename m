Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC1320067E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AC66EC65;
	Fri, 19 Jun 2020 10:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B416EC62
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:36:58 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103657euoutp01f768352abc1921b048229b8b36135960~Z66B0dJQ41680716807euoutp01U
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:36:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103657euoutp01f768352abc1921b048229b8b36135960~Z66B0dJQ41680716807euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563017;
 bh=BUDsnzPfM8pecFmTHTRzLrmx2aEqpYyXAUW4mvYfV28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SNlWrTnYkCz7Zb8VPzTwcHyz+TL1RVLW8iEGWAIeHI8n7G8OwAl4X+S/LayHPg0g4
 /TX3ZtiKn5cUKrP11lOSH18RCjUZ8hyzbaRZsD6ZDVfCjoKITf/s3qJAg6Vu5cR1Ta
 hxLKamFeUQHPFcY0FdYxCdXcrSoguY62SQMKD0V0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200619103657eucas1p1acec81d0405a3000b1e3cfde96d01e0d~Z66BlNJnW3246432464eucas1p1j;
 Fri, 19 Jun 2020 10:36:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 1F.8D.05997.9459CEE5; Fri, 19
 Jun 2020 11:36:57 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103657eucas1p2b7cec8f7b477c9574e2594ad6644a780~Z66BQrYY02889228892eucas1p2k;
 Fri, 19 Jun 2020 10:36:57 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103657eusmtrp169f64dd2b8cad524390c196ceea91b8d~Z66BQB5I40959609596eusmtrp1w;
 Fri, 19 Jun 2020 10:36:57 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-d3-5eec954909d8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CC.DA.06314.8459CEE5; Fri, 19
 Jun 2020 11:36:56 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103656eusmtip2c6c962eea3bd07d12b3e049b89c1473c~Z66Aon5lM3164531645eusmtip2T;
 Fri, 19 Jun 2020 10:36:56 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 06/36] drm: etnaviv: fix common struct sg_table related
 issues
Date: Fri, 19 Jun 2020 12:36:06 +0200
Message-Id: <20200619103636.11974-7-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSWUwTYRSF/Wc6C0h1rBiuKJiUKHEB3BInQYkaH8bERCO+SGJ1hBFQtrSC
 awJuVSqCgCKCGlwiIFW0LGIrS1Go2lAVidqAsiiE1Y1NEUHGAXz77vnvyTm5+WlcUUS40qER
 +wV1BB+mJB1lxdW/XnptvNitWvrkh4I9Z3uOsQ/S8wl2tDgZZ+v6v5KsMb2BYnPzqjA2q9yX
 bbpqx9i+umaMNXx6S7BvjFdI9u7TDxRr/vaZWCvn9Nf0iCsdyJJxDweaCK7xrAXjCm7FcvUj
 n3Au9X024kz2OJJL+rOUSyy8g7heg/uWqQGOq4OEsNAYQe3jt8sxZLBAS0UNehy8Xf2ajEOJ
 7jrkQAOzEsrjz5A65EgrmBwEZm0iIQ19CM432Slp6EWQ0piCTVgsQ+ZxSzaCr/WZ5KSl84IB
 iVskswx0PTpSZGfmFIJn55xExplGDH537BV5JuMPqcNVlMgyZj58L63/lyBn1oDpZSYlpc2D
 vPsVuMgOjB90nTQTkl5JweNXnhJvgI5W23i7mdBpKRz3zgVraoJMLAfMCQTNtruUNCQgeHM8
 HUlbvtBgGxprSo+1Wwj5Rh9JXgdPTYOUKAMzDd73zJD6T4OU4ku4JMvhjFYhbS+ADMu9yVjz
 q1pcYg46zpZi0n2SEYw2f5SdR/My/odlIXQHuQjRmvBgQbM8QjjgreHDNdERwd6BkeEGNPaZ
 rCOWvhJkHN5diRgaKZ3k7du6VAqCj9EcCq9EQONKZ/n6GqtKIQ/iDx0W1JE71dFhgqYSzaFl
 Shf5ihsdOxRMML9f2CcIUYJ64hWjHVzj0NE95f69uXlp/qejfkKNNdR2+hYnu1nk+6W2Ik17
 O8Rt6MXB68c8TG3x6n5/tnWVp4+rGxFrL9Prg6q8NnfOfhSTPNAyvS3JK+GDPWfFEhdhk7Xl
 Xb+NDywbVXXrPLZGWrXeSZdRY+ustSMZo1NKGg7oW7anta+2HpmVHGDLd16slGlC+GWLcLWG
 /wur3wDWSAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xe7oeU9/EGVy9YG3Re+4kk8XGGetZ
 Lf5vm8hsceXrezaLXTPusFusXH2UyWLBfmuLB3NvMll8ufKQyWLT42usFpd3zWGzWHvkLrvF
 wQ9PWB14PdbMW8PosffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7ZgObR/9fA4++
 LasYPT5vkgvgjtKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxL
 LdK3S9DL+L65jb3gu3LFsmMX2RoY++S6GDk5JARMJI7/OsjWxcjFISSwlFHi6pt+VoiEjMTJ
 aQ1QtrDEn2tdUEWfGCU+zO1mA0mwCRhKdL2FSIgIdDJKTOv+yA6SYBZ4ziTxskUfxBYWCJTo
 3NzKDGKzCKhKfNx7mwnE5hWwldh9fjY7xAZ5idUbDoDVcArYSbxuOQi2WQioZvmC98wTGPkW
 MDKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIyUbcd+bt7BeGlj8CFGAQ5GJR7eFyGv44RY
 E8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEU6KiJzFKiyfnAKM4riTc0NTS3
 sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cDolej6/2HauseaUst2FSsYr964
 duqu1xNt01d7r3F6XbS50DJ8zZegDRdfFnUa7qthkurq6DSeHqgwM3JPpuTVDU8/Rm+wPrUg
 4OmNoH7bKYqK5fJqjVov7j5jZtUOvKIi7XSN/XvPp+YprpuNkh4eYjaKOVP39M3uLs5I9/db
 m+KW+6yT++6gxFKckWioxVxUnAgAMgFcwKoCAAA=
X-CMS-MailID: 20200619103657eucas1p2b7cec8f7b477c9574e2594ad6644a780
X-Msg-Generator: CA
X-RootMTR: 20200619103657eucas1p2b7cec8f7b477c9574e2594ad6644a780
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103657eucas1p2b7cec8f7b477c9574e2594ad6644a780
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103657eucas1p2b7cec8f7b477c9574e2594ad6644a780@eucas1p2.samsung.com>
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
