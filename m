Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9CA1D1551
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898546EA59;
	Wed, 13 May 2020 13:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851646EA4C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:15 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133314euoutp0149a4a840d97522e911556e044ebbdc21~OmcYDHpo22269422694euoutp01R
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200513133314euoutp0149a4a840d97522e911556e044ebbdc21~OmcYDHpo22269422694euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376794;
 bh=iqC2oZVnJgaJChFW8LQHxExYeOIzSgeJYogJZzzQn9Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kgIvu14JDUiA6XMVvB+L2rK/rQIv+zgZPM1DTeVrqdZCCzJ52vnbMFOLe3tfW9dha
 NUdHJYmPGQb0UVDphmOnYRcnKPZaUnSZuVYFU6NSUdfzGcysoyPuway6l1cXDQS7Fc
 qUxF9T0mSfujqR7e8LZAhOfwMKBN/p/p84lEPz1I=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200513133313eucas1p18c946e34516da0bf0109837ddcf87b07~OmcX0iILA2350723507eucas1p1A;
 Wed, 13 May 2020 13:33:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 9C.D8.60698.917FBBE5; Wed, 13
 May 2020 14:33:13 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133313eucas1p1fa06e23680b6d983578f598166e64cd0~OmcXdpie62350623506eucas1p1T;
 Wed, 13 May 2020 13:33:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133313eusmtrp1a5b124bc0916ae01fb7b792bf802b311~OmcXcx3q41049110491eusmtrp1W;
 Wed, 13 May 2020 13:33:13 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-e6-5ebbf7196fbc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 91.47.07950.917FBBE5; Wed, 13
 May 2020 14:33:13 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133312eusmtip1e20ffe8ef0b7d0f61e3e6209279d8122~OmcWwSNw30131701317eusmtip1H;
 Wed, 13 May 2020 13:33:12 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 23/38] drm: tegra: fix common struct sg_table related issues
Date: Wed, 13 May 2020 15:32:30 +0200
Message-Id: <20200513133245.6408-23-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSe0hTURzm7N7d3Y1NblPy2BMmmUVlVsahFxUhN6IXRJHV9JYXldyMLS0j
 fM1HTldLqWSaLXGY81VmZhPf1ozKRK2MtDLtoWRWbmoS2rZr9d/35Dv8OCQmbeDPIyOUp1mV
 komUESK8+tGv5yu9Jmrlq62fNyBd+2MeupNTwUcz1Zcx1G0fJVBxyUMeMjZsRMmGAhzZuvt5
 qHLgJR91WfIIlG4zEKistU+Amr4P8tEvSz6+1Y0uzS8FdN24EacfGPoE9P3x93z6XYaVR98t
 jKffTA9gdHZPEaBrXycQtE7zjaAvVpkBPVa5aJ84SLQplI2MiGFVfltCROEdzStP1fuf/fL2
 EpEA0ny1gCQhtQ7e/KTQAhEppW4B+NQ4yuOIDUB7yxuMI2MAptXfILRA6GpkDFtwzigC8Fq6
 +X8lqydJ4EwRlD/UjmhdDQ8qBcA2ndgZwqhMDDZenQBOw53aD01Xu3hOjFNLYFHidZcuoTbD
 BEv/7NxiWHK7EXNioUMf7m1wTUOqUwBNz3p5XGgHfJGcPYvd4bC1SsDhBfBJduZsQQNgf3uZ
 gCOZAHYl5QAutRH2tk8Rzntg1DJYYfHj5G1Qk1WDcWdygz0jc5wy5oBZ1ddmZQm8kCrl0j7Q
 YC3/N9vU0YlxmIY1l3JcT5NSLQCOaig9WGz4v2UEwAw82Wi1IoxVr1WyZ1apGYU6Whm26kSU
 ohI4vtWTaau9BtT/Pt4MKBLIxJL3r2rlUj4To45VNANIYjIPyZ4KhyQJZWLPsaqoYFV0JKtu
 BvNJXOYpWVswdExKhTGn2ZMse4pV/XV5pHBeAkA7x+1ieb/yo9tcvU/erng0FIJr8giR8ZBX
 a2G5mYkbtOmvlE9ua0N9GYEBfh+afLd7hwq1yhXy3dLg1NyAe6b8uDULjwzNHI4JSYv/6Y3W
 H5VPLTUdTDR99YDdAXW3bV+892p+FKfkyY8O6AIvj+hR0Pm21kVRKbmT280HvGS4OpzxX46p
 1MwfefO9OVIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xu7qS33fHGex6qWjRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t0TJrEYvFlysPmSw2Pb7GanF51xw2i84vs9gs1h65y25x
 8MMTVoufu+axOPB5rJm3htFj77cFLB47Z91l99j+7QGrx/3u40wem5fUe9z+95jZY/KN5Ywe
 u282sHn0Nr9j8+jbsorR4/MmuQCeKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81gr
 I1MlfTublNSczLLUIn27BL2MC4d0C/YZVry418/WwNiu0cXIySEhYCLR/WoXSxcjF4eQwFJG
 iZP7b7FAJGQkTk5rYIWwhSX+XOtigyj6xCgxq/kPE0iCTcBQoustREJEoJNRYlr3R3YQh1lg
 CrPE1PsNjCBVwgL+Ek+nPwIbxSKgKrG8cS5YnFfAVqJh10M2iBXyEqs3HGAGsTmB4q/u7Ac7
 Q0ggX2Lv4n1sExj5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMn23Hfm7Zwdj1LvgQ
 owAHoxIPr8Wt3XFCrIllxZW5hxglOJiVRHj91gOFeFMSK6tSi/Lji0pzUosPMZoCHTWRWUo0
 OR8Y23kl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhh37ypt3fog
 hzl5Se+HiP4/1aKTTNkOXxT58OCIZT/TqZDLfQGCt2t6zzQ6bTzn9VDGXou93/oGe4PwtaRJ
 c5Qeboj/4ZqS9uLRyrf3d7MaJFrJu95W+T71ueGfd4blNd68+54Xtty8s3bRN89jq4LrLh5r
 9f7wqvPP27Klt18uzPU5YVbgkHpeiaU4I9FQi7moOBEAmWHw7rUCAAA=
X-CMS-MailID: 20200513133313eucas1p1fa06e23680b6d983578f598166e64cd0
X-Msg-Generator: CA
X-RootMTR: 20200513133313eucas1p1fa06e23680b6d983578f598166e64cd0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133313eucas1p1fa06e23680b6d983578f598166e64cd0
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133313eucas1p1fa06e23680b6d983578f598166e64cd0@eucas1p1.samsung.com>
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
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/tegra/gem.c   | 27 ++++++++++-----------------
 drivers/gpu/drm/tegra/plane.c | 15 +++++----------
 2 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 6237681..2169130 100644
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
 
@@ -571,7 +566,7 @@ int tegra_drm_mmap(struct file *file, struct vm_area_struct *vma)
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
index 9ccfb56..0d2ef16 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -130,12 +130,9 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
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
@@ -143,7 +140,7 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 			 * map its SG table to a single contiguous chunk of
 			 * I/O virtual memory.
 			 */
-			if (err > 1) {
+			if (sgt->nents > 1) {
 				err = -EINVAL;
 				goto unpin;
 			}
@@ -165,8 +162,7 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 		struct sg_table *sgt = state->sgt[i];
 
 		if (sgt)
-			dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
-				     DMA_TO_DEVICE);
+			dma_unmap_sgtable(dc->dev, sgt, DMA_TO_DEVICE, 0);
 
 		host1x_bo_unpin(dc->dev, &bo->base, sgt);
 		state->iova[i] = DMA_MAPPING_ERROR;
@@ -185,8 +181,7 @@ static void tegra_dc_unpin(struct tegra_dc *dc, struct tegra_plane_state *state)
 		struct sg_table *sgt = state->sgt[i];
 
 		if (sgt)
-			dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
-				     DMA_TO_DEVICE);
+			dma_unmap_sgtable(dc->dev, sgt, DMA_TO_DEVICE, 0);
 
 		host1x_bo_unpin(dc->dev, &bo->base, sgt);
 		state->iova[i] = DMA_MAPPING_ERROR;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
