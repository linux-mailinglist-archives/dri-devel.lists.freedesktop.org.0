Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54DF1BBEE9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 15:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FF06E3DF;
	Tue, 28 Apr 2020 13:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C572E6E3AE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:20:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200428132023euoutp024c6305ba7b01f39a94ba9aadd8463153~J-l4BHHaS2985029850euoutp02K
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:20:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200428132023euoutp024c6305ba7b01f39a94ba9aadd8463153~J-l4BHHaS2985029850euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588080023;
 bh=axunh1IQkLSrq+yQ6b8oQPSu9vjhL9vwC+tOp/2Weyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TML9tl/Xgu/AEd6ublPNysLvZjG8MLW/uzyu2bl3bNgJJIN+4JVBk+HZLOKP3J5vU
 SE/0dA5q2j5vVFHjHkzbxxFpnofcUHL23TPoIcYaiTjoTAWZjdRLDLATa0daatAXkf
 fzdD3EP7XPw/zZxYpA6pRDyD7blJSocc1UHoUQ6w=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200428132022eucas1p21ce0b832f79f0c400af0ca3e360302c7~J-l3m31dU2651426514eucas1p2G;
 Tue, 28 Apr 2020 13:20:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5E.B1.60679.69D28AE5; Tue, 28
 Apr 2020 14:20:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200428132022eucas1p22f64f56bb61cf6ee73892a9fc9ce7e09~J-l3W-MeP1084310843eucas1p2P;
 Tue, 28 Apr 2020 13:20:22 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200428132022eusmtrp2ba1c070d9430d2c29256255a6a80a586~J-l3WMKUw2076720767eusmtrp2g;
 Tue, 28 Apr 2020 13:20:22 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-83-5ea82d96ecb7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 76.96.08375.69D28AE5; Tue, 28
 Apr 2020 14:20:22 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200428132021eusmtip2cb467ccb74ffa948702f50d5df3361ca~J-l2xWzcX1116911169eusmtip2T;
 Tue, 28 Apr 2020 13:20:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [RFC 01/17] drm: core: fix sg_table nents vs. orig_nents misuse
Date: Tue, 28 Apr 2020 15:19:49 +0200
Message-Id: <20200428132005.21424-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428132005.21424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIKsWRmVeSWpSXmKPExsWy7djP87rTdFfEGbTdMLboPXeSyWLp+kZ2
 i40z1rNaNB06xWbxf9tEZosrX9+zWaxcfZTJYvaEzUwWC/ZbW3y58pDJYtPja6wWl3fNYbNY
 e+Quu8XBD09YLU7d/czuwO+xZt4aRo+93xaweNy5tofNY/u3B6we97uPM3lsXlLvcfvfY2aP
 yTeWM3rsvtnA5tG3ZRWjx+dNcgHcUVw2Kak5mWWpRfp2CVwZvXcjCtrkKtZMusnawNgl2cXI
 ySEhYCJx+PZG1i5GLg4hgRWMEisu/GODcL4wSlx8/o0ZwvnMKNFxfQ4jTMuqE73sEInljBL7
 l21igmv5snA+M0gVm4ChRNfbLjYQW0SglVHiRC8PSBGzwDZmiSfLj7CDJIQFPCR6nv8Ga2AR
 UJVovLcBrIFXwFZi3eKJzBDr5CVWbzgAZnMK2EksffQU7EAJgWvsErfn/WaBKHKReNe1nAnC
 FpZ4dXwLO4QtI/F/53wmiIZmRomH59ayQzg9jBKXm2ZAfWQtcefcL6CxHED3aUqs36UPEXaU
 WP/zDgtIWEKAT+LGW0GQMDOQOWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxwCep+D4lnxzexQEJo
 IqPElm9HWScwys9CWLaAkXEVo3hqaXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYMI6/e/4lx2M
 u/4kHWIU4GBU4uHdwLMiTog1say4MvcQowQHs5II76OMZXFCvCmJlVWpRfnxRaU5qcWHGKU5
 WJTEeY0XvYwVEkhPLEnNTk0tSC2CyTJxcEo1MPokdkzmqYpJdxXc8qip/uF8D3O5+W3TeM1f
 t2Vut+QrnXh9mWlaeCxzmo1y/eWF+4qvT5YK+pnDtu+H1PLztTbKmr4bdpZrbLj0weXxmv3a
 Wy/7ttwWWmhwTbCssYpfrKbSP9Oxx8n3coSLS3n3wu6W1+brrv2OYWP6l7M7VC86Rvr6l1tr
 lViKMxINtZiLihMBMjcQ91QDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7rTdFfEGWy4oGTRe+4kk8XS9Y3s
 FhtnrGe1aDp0is3i/7aJzBZXvr5ns1i5+iiTxewJm5ksFuy3tvhy5SGTxabH11gtLu+aw2ax
 9shddouDH56wWpy6+5ndgd9jzbw1jB57vy1g8bhzbQ+bx/ZvD1g97ncfZ/LYvKTe4/a/x8we
 k28sZ/TYfbOBzaNvyypGj8+b5AK4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOt
 jEyV9O1sUlJzMstSi/TtEvQyeu9GFLTJVayZdJO1gbFLsouRk0NCwERi1Yle9i5GLg4hgaWM
 ElPm7WSCSMhInJzWwAphC0v8udbFBlH0iVFi7obX7CAJNgFDia63EAkRgU5GiWndH8FGMQsc
 YJboPn8SbJSwgIdEz/PfzCA2i4CqROO9DWwgNq+ArcS6xROZIVbIS6zecADM5hSwk1j66ClQ
 DQfQOluJyy25Exj5FjAyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMnm3Hfm7ewXhpY/Ah
 RgEORiUe3g08K+KEWBPLiitzDzFKcDArifA+ylgWJ8SbklhZlVqUH19UmpNafIjRFOimicxS
 osn5wMjOK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAmDOx+qnA
 0xyzsJxl/Qvs6uaeLnrenZ50wKe08uDGcoYtGc8KT805Ub8ge3XGH0N5Ro2tOz8lVthNvb/I
 1PjFtyXfHM+UZ+75ahvG8ucY65ylP5VuP/vZoS06e1XgNA0b/n8vCne987FT/n1283eJU9ca
 F01cnx1a9bzTctWe2QmiVdoz6799zVZiKc5INNRiLipOBADvNBb8tAIAAA==
X-CMS-MailID: 20200428132022eucas1p22f64f56bb61cf6ee73892a9fc9ce7e09
X-Msg-Generator: CA
X-RootMTR: 20200428132022eucas1p22f64f56bb61cf6ee73892a9fc9ce7e09
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200428132022eucas1p22f64f56bb61cf6ee73892a9fc9ce7e09
References: <20200428132005.21424-1-m.szyprowski@samsung.com>
 <CGME20200428132022eucas1p22f64f56bb61cf6ee73892a9fc9ce7e09@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. Adapt the code to obey those rules.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/drm_cache.c            | 2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c | 7 ++++---
 drivers/gpu/drm/drm_prime.c            | 9 +++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

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
index df31e57..f47caa7 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -118,7 +118,7 @@ void drm_gem_shmem_free_object(struct drm_gem_object *obj)
 	} else {
 		if (shmem->sgt) {
 			dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-				     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+				     shmem->sgt->orig_nents, DMA_BIDIRECTIONAL);
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
@@ -396,7 +396,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_object *obj)
 	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
 
 	dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
-		     shmem->sgt->nents, DMA_BIDIRECTIONAL);
+		     shmem->sgt->orig_nents, DMA_BIDIRECTIONAL);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -623,7 +623,8 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj)
 		goto err_put_pages;
 	}
 	/* Map the pages for use by the h/w. */
-	dma_map_sg(obj->dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+	sgt->nents = dma_map_sg(obj->dev->dev, sgt->sgl, sgt->orig_nents,
+				DMA_BIDIRECTIONAL);
 
 	shmem->sgt = sgt;
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 282774e..f3e2d2a 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -626,8 +626,9 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 	else
 		sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
 
-	if (!dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
-			      DMA_ATTR_SKIP_CPU_SYNC)) {
+	sgt->nents = dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->orig_nents,
+				      dir, DMA_ATTR_SKIP_CPU_SYNC);
+	if (!sgt->nents) {
 		sg_free_table(sgt);
 		kfree(sgt);
 		sgt = ERR_PTR(-ENOMEM);
@@ -652,7 +653,7 @@ void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 	if (!sgt)
 		return;
 
-	dma_unmap_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
+	dma_unmap_sg_attrs(attach->dev, sgt->sgl, sgt->orig_nents, dir,
 			   DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sgt);
 	kfree(sgt);
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
