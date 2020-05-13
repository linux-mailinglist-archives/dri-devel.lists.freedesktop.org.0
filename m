Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7971D1524
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364326EA2D;
	Wed, 13 May 2020 13:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFA96EA36
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:10 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133309euoutp0116288256298e8985bc4f0756b68db5a2~OmcTpuBsG2196121961euoutp01r
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200513133309euoutp0116288256298e8985bc4f0756b68db5a2~OmcTpuBsG2196121961euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376789;
 bh=BqNldBb33cMwmWvoqM/jBTxhzBWgAGhI9NhIOAfKnDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zku6+QRe4AQZR/j48qv8voBGQVB9MHW97EYZdaUR0XWjJnX6kbyZUkaCseLvEXb1d
 Ohl/rPEZfw1cJtopp6H9CdHzXbmby0hIDQH10KmGRgY8Vwo3gjcm/mfNlVXz0SoS/+
 lxkEhU9pebFk+yCIPlssPRTnqukJWcuy2ybqUz4o=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200513133309eucas1p27c87b06c0c27ce4b8596ba1ae5b38578~OmcTYruNb2972029720eucas1p2y;
 Wed, 13 May 2020 13:33:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 5B.C5.61286.517FBBE5; Wed, 13
 May 2020 14:33:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200513133308eucas1p248892466634483dfa3b23f11e4da0e68~OmcTGQsgp0359403594eucas1p2b;
 Wed, 13 May 2020 13:33:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133308eusmtrp1be8d0aac5e2020d489ea5187deff7e5a~OmcTFkiAE1049110491eusmtrp1R;
 Wed, 13 May 2020 13:33:08 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-53-5ebbf71590b3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1D.37.07950.417FBBE5; Wed, 13
 May 2020 14:33:08 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133308eusmtip17de24666b15bff0680978334a3b7af82~OmcSb531w0131701317eusmtip1D;
 Wed, 13 May 2020 13:33:08 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 17/38] drm: omapdrm: use common helper for extracting
 pages array
Date: Wed, 13 May 2020 15:32:24 +0200
Message-Id: <20200513133245.6408-17-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djP87qi33fHGfxZy2nRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGG1WD//FpsD
 j8eaeWsYPfZ+W8Disf3bA1aP+93HmTw2L6n3uP3vMbPH5BvLGT1232xg8+jbsorR4/iN7Uwe
 nzfJBXBHcdmkpOZklqUW6dslcGV8PJVdcJWn4sxK1wbGNVxdjJwcEgImElc2b2XpYuTiEBJY
 wSix99kCJgjnC6PEjvU/mSGcz4wSB08fZeti5ABraWpkBekWEljOKPGhRwiu4ez2HywgCTYB
 Q4mut11sILaIQCujxIleHpAiZoFDTBJbWq+CFQkLhEkcnL0RrIhFQFXi0J+7TCA2r4CtxK17
 b9gh7pOXWL3hADOIzQkUf3VnPwtEfB+7xK5DChC2i8Tx3XtZIWxhiVfHt0D1ykicntwD9puE
 QDOjxMNza9khnB5GictNMxghqqwl7pz7BfYas4CmxPpd+hBhR4n5f6ayQHzMJ3HjrSBImBnI
 nLRtOjNEmFeio00IolpNYtbxdXBrD164xAxhe0j0nOmBBu9hYCD+2sI+gVF+FsKyBYyMqxjF
 U0uLc9NTiw3zUsv1ihNzi0vz0vWS83M3MQJT0el/xz/tYPx6KekQowAHoxIPr8Wt3XFCrIll
 xZW5hxglOJiVRHj91gOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoE
 k2Xi4JRqYGSyjto0/+O66oDJpxg0mL8nzaw/0OyruvjvRm/LEyt+tBwUM+2IvLSocmfwh6tN
 IkekZhyUNN71pP2jmAGDjKD15qhF0pILHp4rNWLKMdfIu1uU7rKjN1lhB2fWrKLJx9LTfc7e
 YDgrqLq/X7H3xvUpH98wLLJfbSGjeeDlve1OuS437/w2ClJiKc5INNRiLipOBACZ16MhQQMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsVy+t/xu7oi33fHGXz+YmzRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGG1WD//FpsD
 j8eaeWsYPfZ+W8Disf3bA1aP+93HmTw2L6n3uP3vMbPH5BvLGT1232xg8+jbsorR4/iN7Uwe
 nzfJBXBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl
 6GV8PJVdcJWn4sxK1wbGNVxdjBwcEgImEk2NrF2MXBxCAksZJVZ/7wByOIHiMhInpzVA2cIS
 f651sUEUfWKUmNy5kgkkwSZgKNH1FiIhItDJKDGt+yM7iMMscIJJ4t7e+YwgVcICIRLL185j
 B7FZBFQlDv25C9bNK2ArceveG3aIFfISqzccYAaxOYHir+7sZwGxhQTyJfYu3sc2gZFvASPD
 KkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMDo2Hbs55YdjF3vgg8xCnAwKvHwWtzaHSfEmlhW
 XJl7iFGCg1lJhNdvPVCINyWxsiq1KD++qDQntfgQoynQUROZpUST84GRm1cSb2hqaG5haWhu
 bG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgTFEfVVGiUJNudmZT/Z/hQujxe10Pz5K
 CFly9YPDpFX/+zYXRZj+c1j82eXgkZevcr0YlFw/Jl532q1p6/tj+Yfa5VLPK3MfLFimmiDI
 m9qu19K4renHuzRH4duz2OJWf72T7pV/f8KH4++4Pz/gWyJ+q39vVNmek89jXRIUX8z4eOvk
 hM9zXtcosRRnJBpqMRcVJwIA+OxVUqQCAAA=
X-CMS-MailID: 20200513133308eucas1p248892466634483dfa3b23f11e4da0e68
X-Msg-Generator: CA
X-RootMTR: 20200513133308eucas1p248892466634483dfa3b23f11e4da0e68
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133308eucas1p248892466634483dfa3b23f11e4da0e68
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133308eucas1p248892466634483dfa3b23f11e4da0e68@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use common helper for converting a sg_table object into struct
page pointer array.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index d08ae95..c259411 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -1297,10 +1297,9 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 		omap_obj->dma_addr = sg_dma_address(sgt->sgl);
 	} else {
 		/* Create pages list from sgt */
-		struct sg_page_iter iter;
 		struct page **pages;
 		unsigned int npages;
-		unsigned int i = 0;
+		unsigned int ret;
 
 		npages = DIV_ROUND_UP(size, PAGE_SIZE);
 		pages = kcalloc(npages, sizeof(*pages), GFP_KERNEL);
@@ -1311,14 +1310,9 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 		}
 
 		omap_obj->pages = pages;
-
-		for_each_sg_page(sgt->sgl, &iter, sgt->orig_nents, 0) {
-			pages[i++] = sg_page_iter_page(&iter);
-			if (i > npages)
-				break;
-		}
-
-		if (WARN_ON(i != npages)) {
+		ret = drm_prime_sg_to_page_addr_arrays(sgt, pages, NULL,
+						       npages);
+		if (WARN_ON(ret)) {
 			omap_gem_free_object(obj);
 			obj = ERR_PTR(-ENOMEM);
 			goto done;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
