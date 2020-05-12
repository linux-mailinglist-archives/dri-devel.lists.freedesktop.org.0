Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C07CE1CF04A
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F526E8D0;
	Tue, 12 May 2020 09:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A596E8C0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:13 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090111euoutp0264208c1eaf23652af547e486964fa821~OPFj-lb6e0453404534euoutp02A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200512090111euoutp0264208c1eaf23652af547e486964fa821~OPFj-lb6e0453404534euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274071;
 bh=v1NY4pbtYG+juWgfrfxrCjmXAIPdJOdpmFsCdy/mpko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UTuKroDYFG+Ztb9VeQiVrStBDoCIzw8Cv5OoM4uG8agYG+NvJjX0f04Sja0xnYKE/
 3WHn5I5AWxjWmjtNw4ytAd664jXdTP3nGO5VqRQqizz4e/X2tmgX2ytrcC+VjxCaUf
 YiYEerp1lQITYY6aubW4KtnfvqlB8TVCxFBD4sc4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200512090111eucas1p29d2808f50f3acaaf8ab3f7915123cc9b~OPFjufSKA2180321803eucas1p2s;
 Tue, 12 May 2020 09:01:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 43.6B.60698.6D56ABE5; Tue, 12
 May 2020 10:01:11 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090110eucas1p1b8de7671df480c071718c96f8ebdbc42~OPFjQF0c21612616126eucas1p1R;
 Tue, 12 May 2020 09:01:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512090110eusmtrp2d8014dc9f85646e24c2f56e4489d5b22~OPFjPDRdS0472504725eusmtrp29;
 Tue, 12 May 2020 09:01:10 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-01-5eba65d68291
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B6.35.08375.6D56ABE5; Tue, 12
 May 2020 10:01:10 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090110eusmtip1f11cf2af42f26902c242496f1c645079~OPFiqnM4i1352513525eusmtip1D;
 Tue, 12 May 2020 09:01:09 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/38] drm: core: fix common struct sg_table related issues
Date: Tue, 12 May 2020 11:00:26 +0200
Message-Id: <20200512090058.14910-6-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djPc7rXU3fFGSy6zmTRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgs/bmWxaOtcxmpx
 8MMTVostbyayOvB5rJm3htFj77cFLB6bVnWyeWz/9oDVY97JQI/73ceZPDYvqfe4/e8xs8fk
 G8sZPXbfbGDz6NuyitFj8+lqj8+b5AJ4o7hsUlJzMstSi/TtErgy2vcfYyp4qVax7EkLYwPj
 KoUuRk4OCQETieWrD7GA2EICKxglfr/w7mLkArK/MEq8+H+FGcL5zCjxuOkSC0zH2b7/LBCJ
 5YwS59Y9ZoJrOfLyHCNIFZuAoUTX2y42EFtEoJVR4kQvD0gRs8ACZomfn9vAioQFAiR+//sI
 NpZFQFXizaGHTCA2r4CtxOWlh5kg1slLrN5wgBnE5hSwk7g//w/YagmBa+wSF9d8B0pwADku
 EieucEHUC0u8Or6FHcKWkfi/cz4TRH0zo8TDc2vZIZweRonLTTMYIaqsJe6c+8UGMohZQFNi
 /S59iLCjxLGZe9gh5vNJ3HgrCBJmBjInbZsOtZZXoqNNCKJaTWLW8XVwaw9euMQMYXtI9F1Z
 AQ2go4wSsxc8YZnAKD8LYdkCRsZVjOKppcW56anFxnmp5XrFibnFpXnpesn5uZsYgUnr9L/j
 X3cw7vuTdIhRgINRiYe3w2hnnBBrYllxZe4hRgkOZiUR3pZMoBBvSmJlVWpRfnxRaU5q8SFG
 aQ4WJXFe40UvY4UE0hNLUrNTUwtSi2CyTBycUg2M2/J7FWq0T/S4h3QafIsujdheLLEy+vKG
 6/PUTvJcO+BRX+wR/mf1RKdacbkMH9cnKsF5GiqL9+VsKrqTc1G2XXyjZu17nsPnt5uoWxhY
 PpNJTFgXm79dxaFJiddHftej/772Hs01f992n3o2R6fr+cwbe3ZMFVx0k419d8nkmy6PzfVS
 GjKVWIozEg21mIuKEwH7tmjVVgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xu7rXUnfFGVx8omrRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgs/bmWxaOtcxmpx
 8MMTVostbyayOvB5rJm3htFj77cFLB6bVnWyeWz/9oDVY97JQI/73ceZPDYvqfe4/e8xs8fk
 G8sZPXbfbGDz6NuyitFj8+lqj8+b5AJ4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyN
 zWOtjEyV9O1sUlJzMstSi/TtEvQy2vcfYyp4qVax7EkLYwPjKoUuRk4OCQETibN9/1m6GLk4
 hASWMkocu/uNFSIhI3FyWgOULSzx51oXG0TRJ0aJo++XsoAk2AQMJbreQiREBDoZJaZ1f2QH
 cZgFVjBLvNo3F6xKWMBP4vTB/0wgNouAqsSbQw/BbF4BW4nLSw8zQayQl1i94QAziM0pYCdx
 f/4fsF4hgUKJR1ffskxg5FvAyLCKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMI62Hfu5eQfj
 pY3BhxgFOBiVeHg7jHbGCbEmlhVX5h5ilOBgVhLhbckECvGmJFZWpRblxxeV5qQWH2I0BTpq
 IrOUaHI+MMbzSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUw1jRV
 s698x8ixcK6H3TPhprSLbyUS133TV69Yx3LK8ZJAhGVU+PaZj5/tfsQoIM5hmtTb8/fYpicB
 Zw7I+/O1BMi9dPoXfuD191UMW99/2stxdVuHRv8Byz3VD8wn5b1o/7WKa4ZqrPr7j7Nf3thp
 /P6UtpDLrcKTXY8P8h8/dV16tqD+Cl1/OSWW4oxEQy3mouJEACasQyO5AgAA
X-CMS-MailID: 20200512090110eucas1p1b8de7671df480c071718c96f8ebdbc42
X-Msg-Generator: CA
X-RootMTR: 20200512090110eucas1p1b8de7671df480c071718c96f8ebdbc42
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090110eucas1p1b8de7671df480c071718c96f8ebdbc42
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090110eucas1p1b8de7671df480c071718c96f8ebdbc42@eucas1p1.samsung.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
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
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/drm_cache.c            |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c | 14 +++++++++-----
 drivers/gpu/drm/drm_prime.c            | 11 ++++++-----
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 03e01b0..0fe3c49 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -127,7 +127,7 @@ static void drm_cache_flush_clflush(struct page *pages[],
 		struct sg_page_iter sg_iter;
 
 		mb(); /*CLFLUSH is ordered only by using memory barriers*/
-		for_each_sg_page(st->sgl, &sg_iter, st->nents, 0)
+		for_each_sgtable_page(st, &sg_iter, 0)
 			drm_clflush_page(sg_page_iter_page(&sg_iter));
 		mb(); /*Make sure that all cache line entry is flushed*/
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index df31e57..00a43e8 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -117,8 +117,8 @@ void drm_gem_shmem_free_object(struct drm_gem_object *obj)
 		kvfree(shmem->pages);
 	} else {
 		if (shmem->sgt) {
-			dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-				     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
+					  DMA_BIDIRECTIONAL, 0);
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
@@ -395,8 +395,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_object *obj)
 
 	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
 
-	dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-		     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+	dma_unmap_sgtable(obj->dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -623,12 +622,17 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj)
 		goto err_put_pages;
 	}
 	/* Map the pages for use by the h/w. */
-	dma_map_sg(obj->dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
+		goto err_free_sgt;
 
 	shmem->sgt = sgt;
 
 	return sgt;
 
+err_free_sgt:
+	sg_free_table(sgt);
+	kfree(sgt);
 err_put_pages:
 	drm_gem_shmem_put_pages(shmem);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index dfdf4d4..5ed22dd 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -617,6 +617,7 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct sg_table *sgt;
+	int ret;
 
 	if (WARN_ON(dir == DMA_NONE))
 		return ERR_PTR(-EINVAL);
@@ -626,11 +627,12 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 	else
 		sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
 
-	if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
-			      DMA_ATTR_SKIP_CPU_SYNC)) {
+	ret = dma_map_sgtable(attach->dev, sgt, dir,
+			      DMA_ATTR_SKIP_CPU_SYNC);
+	if (ret) {
 		sg_free_table(sgt);
 		kfree(sgt);
-		sgt = ERR_PTR(-ENOMEM);
+		sgt = ERR_PTR(ret);
 	}
 
 	return sgt;
@@ -652,8 +654,7 @@ void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 	if (!sgt)
 		return;
 
-	dma_unmap_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
-			   DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sgt);
 	kfree(sgt);
 }
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
