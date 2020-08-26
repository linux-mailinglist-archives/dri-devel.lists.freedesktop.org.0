Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE1B252726
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EAA6EA0C;
	Wed, 26 Aug 2020 06:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709FF6E9FB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:40 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063539euoutp015a36157513876149a127c9c31f9878ea~uvewGS4VS2036820368euoutp01C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826063539euoutp015a36157513876149a127c9c31f9878ea~uvewGS4VS2036820368euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423739;
 bh=K8WauyWZpBeq2D2r7BbzNi1MYRG/0EoLqKQFFi23SdI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AFjsDIo0LBdsttBNfXxIsaOFImeJUGxfSML+WLXwTZmokgYgyosCYevvMr7uXhx6Y
 TechSEy399Uvzzce7ClXGFHhF9HwGZwv/GEP1Lmr6vU4sm9QPkhUkucRatjupZHnzK
 FdIFNXk3l/rN9tRJvP2ISsbfo55T9b62aC7g28fA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200826063538eucas1p2e9e1cdfcf5985bbc1e3ad10a1db535e2~uvev3_7fR0398803988eucas1p2w;
 Wed, 26 Aug 2020 06:35:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 92.BD.05997.AB2064F5; Wed, 26
 Aug 2020 07:35:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063538eucas1p2a9fe42c2ccee634c41ba9f3dd43dc3c4~uvevgXOtB0401704017eucas1p2L;
 Wed, 26 Aug 2020 06:35:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826063538eusmtrp1a1e01bc01c2bc6b2d67efc7b5b7ed37d~uvevfjzaA1091110911eusmtrp1e;
 Wed, 26 Aug 2020 06:35:38 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-d7-5f4602ba5eef
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A8.D0.06314.AB2064F5; Wed, 26
 Aug 2020 07:35:38 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063537eusmtip2d4343728a76da4fa08b84faadf6dd01f~uveu5zY420092200922eusmtip21;
 Wed, 26 Aug 2020 06:35:37 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 18/32] drm: tegra: fix common struct sg_table related issues
Date: Wed, 26 Aug 2020 08:33:02 +0200
Message-Id: <20200826063316.23486-19-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRjmO7cdl5PTDPuyizTQMslLFn6hSUXG+ZdFEVSmKw9TdCo7aplB
 K7NMp3kBlSW2LNFmaZpOXdSmVFOsGVmi1FDRH91WkVPRwto80/497/M+7/s878dH49Ie0pdO
 TsvkVGnyVBklJgwv5we3G7GD8aG2X+Go2NqPodbqFhL9NZTh6N3MDwrdb3qBIZ0pEl3V1hHI
 8W4CQ22TwyQaMtZQ6IZDS6GHz20i1PNzikTzxlpirxf7oPYBYJ/O6gi2W2sTsZ2z4yQ7VmTB
 2Mf3LrEfFidxtmKkAbBPRtUUW5z3nWJL2vWAnW7bFOt5QhyVyKUmZ3OqkOgEcVL1LZRREHq+
 pNROqsHXgELgQUNmJ7wypRYVAjEtZRoBHLw75i4cAE50jOBCMQ3gwBcTvjxy57cNExoNABZf
 HyFWRi47ykiXimLCYKG9kHLhNUw+gH3Fni4RzmhwaK6cA66GN3MY6u7Yl9YSjD8cdvQTLixh
 oqHutgYIdn6w6ZF5SePh5C1FNynXIsgMi+Cz92Z3pgOwddSECdgbfrG0iwS8AQ5UaAhhIM95
 kfWhSCg0AA5dqXZbRMKP1gXnWtqZLxC2GEMEeh9s1neQLhoyXnDEvtpF405YbqjCBVoCC65J
 BXUA1FqaV2x73rx1R2Nh3at89wuVAaj+pgGlwE/730wHgB6s5bJ4pYLjd6Rx54J5uZLPSlME
 n01XtgHnxxpYtDi6gPHPmV7A0EDmKdFRMfFSUp7N5yh7AaRx2RrJ/tcDp6WSRHnOBU6VHq/K
 SuX4XrCeJmRrJeF1n+OkjEKeyaVwXAanWu5itIevGqzy6u+cyAu+Z6X0JZtT5qL2xKH6rYaI
 BHtg68U+n5P2xIWZ9PGUGJQeUd7cxR3H+oMUtgBVZ2zuqgCvQ7k56xj/vKDYpx6V5qpjn8a3
 MOgoWTmRw9dsBH21ESjQ33hqV2VcqClw3dTM/PUj5t2lgzUhwOSjHq3vllgbfYsUMoJPkodt
 w1W8/B/XsAlEVAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7q7mNziDf4slbXoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2aJm1iMXiy5WHTBabHl9jtbi8aw6bReeXWWwWa4/cZbc4
 +OEJq8XPXfNYHPg81sxbw+ix99sCFo+ds+6ye2z/9oDV4373cSaPzUvqPW7/e8zsMfnGckaP
 3Tcb2Dx6m9+xefRtWcXo8XmTXABPlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayV
 kamSvp1NSmpOZllqkb5dgl7GjNkWBR0GFX0T3rI2ML5W62Lk5JAQMJFY+PsuUxcjF4eQwFJG
 ifdbDjJBJGQkTk5rYIWwhSX+XOtiA7GFBD4xSjzpDwGx2QQMJbregsS5OEQEOhklpnV/ZAdx
 mAWmMEtMvd/ACFIlLOAv8fjgWnYQm0VAVeLal5MsIDavgJ3Egvk9jBAb5CVWbzjADGJzAsWP
 d/dDbbOVOL12BvMERr4FjAyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAqNn27Gfm3cwXtoY
 fIhRgINRiYd3AZtrvBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMZoCHTWR
 WUo0OR8Y2Xkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhijliSt
 VXxQffzv4vnTdY6YdARLGDzee/ZooMGcj49WG/0TEH6cXLJ2ey+fiBl7VpbvVN7Oj3U5l2fJ
 Olb82ej3KjDcKvhl4MGDjO92VzDsm6FpH5xVtfiY++0N1j/fv3i9aCHbgwSNop+GDzhZDm49
 l52zqrNUb37VFRWbe/wF/ncEpV8tCpZVYinOSDTUYi4qTgQA16B27bQCAAA=
X-CMS-MailID: 20200826063538eucas1p2a9fe42c2ccee634c41ba9f3dd43dc3c4
X-Msg-Generator: CA
X-RootMTR: 20200826063538eucas1p2a9fe42c2ccee634c41ba9f3dd43dc3c4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063538eucas1p2a9fe42c2ccee634c41ba9f3dd43dc3c4
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063538eucas1p2a9fe42c2ccee634c41ba9f3dd43dc3c4@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
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
 drivers/gpu/drm/tegra/gem.c   | 27 ++++++++++-----------------
 drivers/gpu/drm/tegra/plane.c | 15 +++++----------
 2 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 723df142a981..01d94befab11 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -98,8 +98,8 @@ static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
 		 * the SG table needs to be copied to avoid overwriting any
 		 * other potential users of the original SG table.
 		 */
-		err = sg_alloc_table_from_sg(sgt, obj->sgt->sgl, obj->sgt->nents,
-					     GFP_KERNEL);
+		err = sg_alloc_table_from_sg(sgt, obj->sgt->sgl,
+					     obj->sgt->orig_nents, GFP_KERNEL);
 		if (err < 0)
 			goto free;
 	} else {
@@ -196,8 +196,7 @@ static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
 
 	bo->iova = bo->mm->start;
 
-	bo->size = iommu_map_sg(tegra->domain, bo->iova, bo->sgt->sgl,
-				bo->sgt->nents, prot);
+	bo->size = iommu_map_sgtable(tegra->domain, bo->iova, bo->sgt, prot);
 	if (!bo->size) {
 		dev_err(tegra->drm->dev, "failed to map buffer\n");
 		err = -ENOMEM;
@@ -264,8 +263,7 @@ static struct tegra_bo *tegra_bo_alloc_object(struct drm_device *drm,
 static void tegra_bo_free(struct drm_device *drm, struct tegra_bo *bo)
 {
 	if (bo->pages) {
-		dma_unmap_sg(drm->dev, bo->sgt->sgl, bo->sgt->nents,
-			     DMA_FROM_DEVICE);
+		dma_unmap_sgtable(drm->dev, bo->sgt, DMA_FROM_DEVICE, 0);
 		drm_gem_put_pages(&bo->gem, bo->pages, true, true);
 		sg_free_table(bo->sgt);
 		kfree(bo->sgt);
@@ -290,12 +288,9 @@ static int tegra_bo_get_pages(struct drm_device *drm, struct tegra_bo *bo)
 		goto put_pages;
 	}
 
-	err = dma_map_sg(drm->dev, bo->sgt->sgl, bo->sgt->nents,
-			 DMA_FROM_DEVICE);
-	if (err == 0) {
-		err = -EFAULT;
+	err = dma_map_sgtable(drm->dev, bo->sgt, DMA_FROM_DEVICE, 0);
+	if (err)
 		goto free_sgt;
-	}
 
 	return 0;
 
@@ -571,7 +566,7 @@ tegra_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 			goto free;
 	}
 
-	if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0)
+	if (dma_map_sgtable(attach->dev, sgt, dir, 0))
 		goto free;
 
 	return sgt;
@@ -590,7 +585,7 @@ static void tegra_gem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
 	struct tegra_bo *bo = to_tegra_bo(gem);
 
 	if (bo->pages)
-		dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
+		dma_unmap_sgtable(attach->dev, sgt, dir, 0);
 
 	sg_free_table(sgt);
 	kfree(sgt);
@@ -609,8 +604,7 @@ static int tegra_gem_prime_begin_cpu_access(struct dma_buf *buf,
 	struct drm_device *drm = gem->dev;
 
 	if (bo->pages)
-		dma_sync_sg_for_cpu(drm->dev, bo->sgt->sgl, bo->sgt->nents,
-				    DMA_FROM_DEVICE);
+		dma_sync_sgtable_for_cpu(drm->dev, bo->sgt, DMA_FROM_DEVICE);
 
 	return 0;
 }
@@ -623,8 +617,7 @@ static int tegra_gem_prime_end_cpu_access(struct dma_buf *buf,
 	struct drm_device *drm = gem->dev;
 
 	if (bo->pages)
-		dma_sync_sg_for_device(drm->dev, bo->sgt->sgl, bo->sgt->nents,
-				       DMA_TO_DEVICE);
+		dma_sync_sgtable_for_device(drm->dev, bo->sgt, DMA_TO_DEVICE);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 4cd0461cc508..539d14935728 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -131,12 +131,9 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 		}
 
 		if (sgt) {
-			err = dma_map_sg(dc->dev, sgt->sgl, sgt->nents,
-					 DMA_TO_DEVICE);
-			if (err == 0) {
-				err = -ENOMEM;
+			err = dma_map_sgtable(dc->dev, sgt, DMA_TO_DEVICE, 0);
+			if (err)
 				goto unpin;
-			}
 
 			/*
 			 * The display controller needs contiguous memory, so
@@ -144,7 +141,7 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 			 * map its SG table to a single contiguous chunk of
 			 * I/O virtual memory.
 			 */
-			if (err > 1) {
+			if (sgt->nents > 1) {
 				err = -EINVAL;
 				goto unpin;
 			}
@@ -166,8 +163,7 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 		struct sg_table *sgt = state->sgt[i];
 
 		if (sgt)
-			dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
-				     DMA_TO_DEVICE);
+			dma_unmap_sgtable(dc->dev, sgt, DMA_TO_DEVICE, 0);
 
 		host1x_bo_unpin(dc->dev, &bo->base, sgt);
 		state->iova[i] = DMA_MAPPING_ERROR;
@@ -186,8 +182,7 @@ static void tegra_dc_unpin(struct tegra_dc *dc, struct tegra_plane_state *state)
 		struct sg_table *sgt = state->sgt[i];
 
 		if (sgt)
-			dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
-				     DMA_TO_DEVICE);
+			dma_unmap_sgtable(dc->dev, sgt, DMA_TO_DEVICE, 0);
 
 		host1x_bo_unpin(dc->dev, &bo->base, sgt);
 		state->iova[i] = DMA_MAPPING_ERROR;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
