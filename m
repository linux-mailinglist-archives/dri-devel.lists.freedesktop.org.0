Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38621BBEED
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 15:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4216E3EE;
	Tue, 28 Apr 2020 13:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035526E3AE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:20:30 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200428132029euoutp0157cfb3957b83c8452f1b9da90205821b~J-l9845Op1886118861euoutp01C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:20:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200428132029euoutp0157cfb3957b83c8452f1b9da90205821b~J-l9845Op1886118861euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588080029;
 bh=/sknGbuF2xKiJ1sV3keYuIADVQG1URCk7vW1XbZiyec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J6CEOn4dWMY2T7MPxT7SELAFLkpLVwsGrF4MizVH7dx7Rn7m6GXwQLShdO2wsk2ho
 IBXRwrbuo7K/nYb6bKsnQESr/U2dJh/f64oOFCfQ/TjltqTzr/j+AUH0a2uqzO8Nzd
 ydQod6xYmFZkjPZdxBxLZgi3MTY6AiuyEk+pfaF4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200428132029eucas1p15ebf8ee46b248dce1729226b890ee7bd~J-l9cY4YL3064130641eucas1p1X;
 Tue, 28 Apr 2020 13:20:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 99.B4.61286.D9D28AE5; Tue, 28
 Apr 2020 14:20:29 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200428132028eucas1p2310cd19b879962d5241604dd13909255~J-l9MHt4C2651826518eucas1p2R;
 Tue, 28 Apr 2020 13:20:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200428132028eusmtrp2955b6ead3ca0b1462357869626b9221b~J-l9Lhzga2140321403eusmtrp2O;
 Tue, 28 Apr 2020 13:20:28 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-7e-5ea82d9d6328
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 61.A6.08375.C9D28AE5; Tue, 28
 Apr 2020 14:20:28 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200428132028eusmtip28529c37fc88a79690be32e36cffb4ed4~J-l8m9CKM1116911169eusmtip2Y;
 Tue, 28 Apr 2020 13:20:28 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [RFC 11/17] drm: rockchip: fix sg_table nents vs. orig_nents misuse
Date: Tue, 28 Apr 2020 15:19:59 +0200
Message-Id: <20200428132005.21424-12-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428132005.21424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSWUwTURTN63SmA1IYC5EXIJI0YJCkLMrHGAxq4sd8EKMfJsREZIARCLSQ
 liKIUTYNuwWiAlooBGQpayFFECNUoIqRKFtqhLAVFCKgsghKwJYp+Hfuuefcc9/NwxFBL+qE
 R0niGamEjhFi1lztwPaQSCmqDfbJVWNk3tA7DlndnMojW4ubUTJNN4iRe9oChBzdWMXIOnU/
 h3yqaOOQqtf+5ProDIfUzI2j5EjXM4xs7Jvkkb0/jCg5OLnGO29HNZQ1AOrVpopLTYx3Y1TH
 5jRKTeXoOVRb1T3qy+4cQhUZagD18nMKRuW31wNqTXP88pFr1mfDmZioBEbqHRBiHZle9QGL
 mz2WuKXpASnguyAbWOGQ8IML3Y9BNrDGBUQtgH8XsyzFOoD6zDqELdYALMpqAAeWQvUmj23U
 ADjdWYkeWlqmx3hmFUb4wuzlbMyMHYj7AL7NszGLEEKLQGNN377IngiEKRuL+yIu4Q6Vvyv2
 MZ8IgFNjeSgb5wrVLT2IGVuZ+OrZecw8CBLDPNg5tcplRRehsaufx2J7uKRvt2AXuNdZzmEN
 6QDODDXy2CIXwJG0YsuL/OHE0B/TWNy030nY3OXN0hfglnIXNdOQsIWG5aNmGjHBQu0ThKX5
 MPOB5ZInYKm+6TC29+OwRUJBhTGaPVABgDuNFUABXEv/Z6kAqAeOjFwmjmBkvhLmlpeMFsvk
 kgivsFixBpg+1vtd/a8XYGM4VAcIHAht+C02tcEClE6QJYl1AOKI0IE/G/k8WMAPp5NuM9LY
 G1J5DCPTAWecK3Tkn65cvC4gIuh4Jpph4hjpQZeDWzmlABFyhqZbOq7e8bj0zdmLyk9UOicP
 8Jc16XZ7bxbO5biUZYSVbxft+P8UXfENdH/0sBV6zjcGZax+wiYcVuTtHnmG2E4UK4loN+C6
 leSRubTUDGWOKjSh4664JEjRlH8zxK1LJEleavuKEqd2SDejnzLZVuvW2621WfNJpWghVxZJ
 +3oiUhn9D9EiVUBUAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7pzdFfEGXSeNLboPXeSyWLp+kZ2
 i40z1rNaNB06xWbxf9tEZosrX9+zWaxcfZTJYvaEzUwWC/ZbW3y58pDJYtPja6wWl3fNYbNY
 e+Quu8XBD09YLU7d/czuwO+xZt4aRo+93xaweNy5tofNY/u3B6we97uPM3lsXlLvcfvfY2aP
 yTeWM3rsvtnA5tG3ZRWjx+dNcgHcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFW
 RqZK+nY2Kak5mWWpRfp2CXoZzUvOshU8Eqv4sekAYwPjG6EuRk4OCQETiUmrv7F3MXJxCAks
 ZZRomvmSGSIhI3FyWgMrhC0s8edaFxuILSTwiVHi9mZFEJtNwFCi6y1InItDRKCTUWJa90ew
 ScwCB5glus+fZAKpEhbwkWj4+hKsm0VAVWLu94VgNq+AncT9q71QG+QlVm84ALaZEyi+9NFT
 oBoOoG22Epdbcicw8i1gZFjFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGD3bjv3cvIPx0sbg
 Q4wCHIxKPLwbeFbECbEmlhVX5h5ilOBgVhLhfZSxLE6INyWxsiq1KD++qDQntfgQoynQTROZ
 pUST84GRnVcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgZH5X77J
 pAUJzbF9HQYnSlefCP+QWL3dacUVrbNeig/NnI7u3glMM6rPbrnm7EuqZ3D+qCccpRBUY2K5
 d+dp9Zz513brJ/11OrAibmLeU2Hh2FXfVGb1rjibUnA//FryDaNDR2z3ahbxncw+k5DKWfNc
 d2n4FCtGfvbjaZuqXifEqW6avkKwXImlOCPRUIu5qDgRACirU1S0AgAA
X-CMS-MailID: 20200428132028eucas1p2310cd19b879962d5241604dd13909255
X-Msg-Generator: CA
X-RootMTR: 20200428132028eucas1p2310cd19b879962d5241604dd13909255
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200428132028eucas1p2310cd19b879962d5241604dd13909255
References: <20200428132005.21424-1-m.szyprowski@samsung.com>
 <CGME20200428132028eucas1p2310cd19b879962d5241604dd13909255@eucas1p2.samsung.com>
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
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 0d18846..a024c71 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -37,7 +37,7 @@ static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
 	rk_obj->dma_addr = rk_obj->mm.start;
 
 	ret = iommu_map_sg(private->domain, rk_obj->dma_addr, rk_obj->sgt->sgl,
-			   rk_obj->sgt->nents, prot);
+			   rk_obj->sgt->orig_nents, prot);
 	if (ret < rk_obj->base.size) {
 		DRM_ERROR("failed to map buffer: size=%zd request_size=%zd\n",
 			  ret, rk_obj->base.size);
@@ -98,11 +98,11 @@ static int rockchip_gem_get_pages(struct rockchip_gem_object *rk_obj)
 	 * TODO: Replace this by drm_clflush_sg() once it can be implemented
 	 * without relying on symbols that are not exported.
 	 */
-	for_each_sg(rk_obj->sgt->sgl, s, rk_obj->sgt->nents, i)
+	for_each_sg(rk_obj->sgt->sgl, s, rk_obj->sgt->orig_nents, i)
 		sg_dma_address(s) = sg_phys(s);
 
-	dma_sync_sg_for_device(drm->dev, rk_obj->sgt->sgl, rk_obj->sgt->nents,
-			       DMA_TO_DEVICE);
+	dma_sync_sg_for_device(drm->dev, rk_obj->sgt->sgl,
+			       rk_obj->sgt->orig_nents, DMA_TO_DEVICE);
 
 	return 0;
 
@@ -351,7 +351,8 @@ void rockchip_gem_free_object(struct drm_gem_object *obj)
 			rockchip_gem_iommu_unmap(rk_obj);
 		} else {
 			dma_unmap_sg(drm->dev, rk_obj->sgt->sgl,
-				     rk_obj->sgt->nents, DMA_BIDIRECTIONAL);
+				     rk_obj->sgt->orig_nents,
+				     DMA_BIDIRECTIONAL);
 		}
 		drm_prime_gem_destroy(obj, rk_obj->sgt);
 	} else {
@@ -493,14 +494,14 @@ static unsigned long rockchip_sg_get_contiguous_size(struct sg_table *sgt,
 			struct sg_table *sg,
 			struct rockchip_gem_object *rk_obj)
 {
-	int count = dma_map_sg(drm->dev, sg->sgl, sg->nents,
+	int count = dma_map_sg(drm->dev, sg->sgl, sg->orig_nents,
 			       DMA_BIDIRECTIONAL);
 	if (!count)
 		return -EINVAL;
 
 	if (rockchip_sg_get_contiguous_size(sg, count) < attach->dmabuf->size) {
 		DRM_ERROR("failed to map sg_table to contiguous linear address.\n");
-		dma_unmap_sg(drm->dev, sg->sgl, sg->nents,
+		dma_unmap_sg(drm->dev, sg->sgl, sg->orig_nents,
 			     DMA_BIDIRECTIONAL);
 		return -EINVAL;
 	}
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
