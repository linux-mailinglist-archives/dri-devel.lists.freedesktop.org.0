Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC001C50CE
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7199D89D02;
	Tue,  5 May 2020 08:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1F189D02
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:27 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084625euoutp01f683abb1d883d58ce7437f51498e2c40~MFXrQs-Sy0319103191euoutp01i
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200505084625euoutp01f683abb1d883d58ce7437f51498e2c40~MFXrQs-Sy0319103191euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668385;
 bh=FkE2ouvUO0sxf1PqUaWoh8C8y/rOdhVvbXkhiOiJypA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AOjlnepYg18Wb7nJi1S4/eL3OOUSXt6GHRTqK3GHVYYNil1WaqzDp8CCD2uBrgo6P
 LCrYhAVIaCxZPd5WIHUmxXuMmqtvsr+ZxLXQJbmtckazAJ6OBQzqPCVm+HsoopM3j1
 39k5KHBJVOWuVrE1SK0qcMiq4cymCFVa2ZR+R9vw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200505084625eucas1p1f6fe7b33f1925a4db4855b438fcc362a~MFXq_hPmI2423024230eucas1p1y;
 Tue,  5 May 2020 08:46:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 8A.01.60698.1E721BE5; Tue,  5
 May 2020 09:46:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084625eucas1p1a3c25fd171f360e0aab2f76700699454~MFXqmhSpD2425224252eucas1p1v;
 Tue,  5 May 2020 08:46:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200505084624eusmtrp2a2ab3b28b8b1a7bffa5c945cc14fe791~MFXqgTchU0573005730eusmtrp2B;
 Tue,  5 May 2020 08:46:24 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-2a-5eb127e153f1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 81.21.07950.0E721BE5; Tue,  5
 May 2020 09:46:24 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084624eusmtip140abdf1c78ece3571430565e3f0623e1~MFXpt_CRY0686606866eusmtip1F;
 Tue,  5 May 2020 08:46:24 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/25] drm: core: fix common struct sg_table related issues
Date: Tue,  5 May 2020 10:45:51 +0200
Message-Id: <20200505084614.30424-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsWy7djP87oP1TfGGWz9L27Re+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgs/bmWxaOtcxmpx
 8MMTVostbyayOvB5rJm3htFj77cFLB6bVnWyeWz/9oDVY97JQI/73ceZPDYvqfe4/e8xs8fk
 G8sZPXbfbGDz6NuyitFj8+lqj8+b5AJ4o7hsUlJzMstSi/TtErgymj/8YCxYqlpxaul39gbG
 VvkuRk4OCQETickz3jF3MXJxCAmsYJSYNP0iO4TzhVHi5vcbrBDOZ0aJ67M7mGBaFk3eD1W1
 nFHi9o8drHAtL3csYAepYhMwlOh628UGYosItDJKnOjlASliFljALPHzcxsjSEJYIEBi36/T
 YGNZBFQl/n5vBYvzCthKLN53lBlinbzE6g0HwGxOATuJx5fusIEMkhC4xi4x+cZjoAYOIMdF
 4uJSqI+EJV4d38IOYctI/N85nwmivplR4uG5tewQTg+jxOWmGYwQVdYSd879YgMZxCygKbF+
 lz5E2FHiX88bNoj5fBI33gqChJmBzEnbpjNDhHklOtqEIKrVJGYdXwe39uCFS1Dne0h8WbgU
 GkBHGSX+XW5insAoPwth2QJGxlWM4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBaev0v+Nf
 dzDu+5N0iFGAg1GJhzfi8/o4IdbEsuLK3EOMEhzMSiK8y35siBPiTUmsrEotyo8vKs1JLT7E
 KM3BoiTOa7zoZayQQHpiSWp2ampBahFMlomDU6qBUWUVn47RkjRrt7cCItZPJuiIhoQ0uZ24
 lyYqpmUWXchlcilxlyIf+3UFfoWUxVqW3WyHV9Wo87VaZj1hO+vtZnH8/sJlhnqff1tuvxxg
 E7rmY5KuoIFy04cHqj9j86rcF8U8rfbJX1Lw/OCyZOPl3aKhmV/dvaTOq01/uvhU9ySDPbvv
 bKtRYinOSDTUYi4qTgQAV5HhZlcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7oP1DfGGfyca2jRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgs/bmWxaOtcxmpx
 8MMTVostbyayOvB5rJm3htFj77cFLB6bVnWyeWz/9oDVY97JQI/73ceZPDYvqfe4/e8xs8fk
 G8sZPXbfbGDz6NuyitFj8+lqj8+b5AJ4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyN
 zWOtjEyV9O1sUlJzMstSi/TtEvQymj/8YCxYqlpxaul39gbGVvkuRk4OCQETiUWT97N3MXJx
 CAksZZR4eXAhM0RCRuLktAZWCFtY4s+1LjYQW0jgE6NE171SEJtNwFCi6y1InItDRKCTUWJa
 90ewScwCK5glXu2bywJSJSzgJ3G/uRFsKouAqsTf762MIDavgK3E4n1HobbJS6zecADM5hSw
 k3h86Q7UtkKJD+e/s05g5FvAyLCKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMIq2Hfu5ZQdj
 17vgQ4wCHIxKPLwbvq6PE2JNLCuuzD3EKMHBrCTCu+zHhjgh3pTEyqrUovz4otKc1OJDjKZA
 R01klhJNzgdGeF5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkYD
 Vc4VjuGTTrTqSGpe67ab7jan5Xkld7b27fTMLT80XH5d3nX/kNOWqCJx7UkZN+5M85MPlw1y
 fDPJM7fuyBmlO5kTbyp8cmO1SZ/skVAgYeYkvS4x9MUNQWHjgKk28+7/S5bue9DpEN88Q1tI
 wWX3ret75BskM1a7+qjdPvJi2YVbZWqFPEosxRmJhlrMRcWJAFJaOFq4AgAA
X-CMS-MailID: 20200505084625eucas1p1a3c25fd171f360e0aab2f76700699454
X-Msg-Generator: CA
X-RootMTR: 20200505084625eucas1p1a3c25fd171f360e0aab2f76700699454
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084625eucas1p1a3c25fd171f360e0aab2f76700699454
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084625eucas1p1a3c25fd171f360e0aab2f76700699454@eucas1p1.samsung.com>
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

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of the entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. A common mistake was to ignore a result
of the dma_map_sg function and don't use the sg_table->orig_nents at all.

To avoid such issues, lets use common dma-mapping wrappers operating
directly on the struct sg_table objects and adjust references to the
nents and orig_nents respectively.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v3 00/25] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/5/187
---
 drivers/gpu/drm/drm_cache.c            |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c | 14 +++++++++-----
 drivers/gpu/drm/drm_prime.c            | 13 +++++++------
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 03e01b0..63bd497 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -127,7 +127,7 @@ static void drm_cache_flush_clflush(struct page *pages[],
 		struct sg_page_iter sg_iter;
 
 		mb(); /*CLFLUSH is ordered only by using memory barriers*/
-		for_each_sg_page(st->sgl, &sg_iter, st->nents, 0)
+		for_each_sg_page(st->sgl, &sg_iter, st->orig_nents, 0)
 			drm_clflush_page(sg_page_iter_page(&sg_iter));
 		mb(); /*Make sure that all cache line entry is flushed*/
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index df31e57..cfcfc0d 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -117,8 +117,8 @@ void drm_gem_shmem_free_object(struct drm_gem_object *obj)
 		kvfree(shmem->pages);
 	} else {
 		if (shmem->sgt) {
-			dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-				     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
+					  DMA_BIDIRECTIONAL);
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
@@ -395,8 +395,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_object *obj)
 
 	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
 
-	dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-		     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+	dma_unmap_sgtable(obj->dev->dev, shmem->sgt, DMA_BIDIRECTIONAL);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -623,12 +622,17 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj)
 		goto err_put_pages;
 	}
 	/* Map the pages for use by the h/w. */
-	dma_map_sg(obj->dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL);
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
index 282774e..3e7cb02 100644
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
+	ret = dma_map_sgtable_attrs(attach->dev, sgt, dir,
+				    DMA_ATTR_SKIP_CPU_SYNC);
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
+	dma_unmap_sgtable_attrs(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sgt);
 	kfree(sgt);
 }
@@ -975,7 +976,7 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
 	 */
 	page_index = 0;
 	dma_index = 0;
-	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
+	for_each_sg(sgt->sgl, sg, sgt->orig_nents, count) {
 		page_len = sg->length;
 		page = sg_page(sg);
 		dma_len = sg_dma_len(sg);
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
