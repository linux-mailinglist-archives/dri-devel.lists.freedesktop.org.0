Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F21D1539
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F3A6EA51;
	Wed, 13 May 2020 13:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709386EA2D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133310euoutp02552df975f93a3333528e8265dda51f42~OmcUR3fWE3219432194euoutp020
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200513133310euoutp02552df975f93a3333528e8265dda51f42~OmcUR3fWE3219432194euoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376790;
 bh=pIb0nPTrHa/iRpyO7ufWRmGfr7BSDXYV+FMd40F3xBM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UtEAqJTpdD5BP834xhQwV9Mec1QiVhz3UjUgpRkSMcOOpn+FVV/FCucTVqWCWBOlh
 FICW5CQGbRL+SdqJc36PUXnEBFf9OVQwDOD9VjgQx4jTdgshmjjE2Zv5kw9sMnn/R3
 e3ohIQYNjmPLPNkK/V8mxarCF8Q53QQSvQNaULRs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200513133309eucas1p25b78bef1ca867a71b40fd91e10da607b~OmcUDOjQW0616406164eucas1p2Z;
 Wed, 13 May 2020 13:33:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 2D.C5.61286.517FBBE5; Wed, 13
 May 2020 14:33:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133309eucas1p1b5b2505556566570e6fb3433397c6168~OmcTxGNQj0876608766eucas1p1_;
 Wed, 13 May 2020 13:33:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133309eusmtrp1e68a8c1c6d83efe321f433230237ed3a~OmcTwck3M1050610506eusmtrp1K;
 Wed, 13 May 2020 13:33:09 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-57-5ebbf71525ea
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 27.1A.08375.517FBBE5; Wed, 13
 May 2020 14:33:09 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133308eusmtip18920ac7684f9687e1d8df62e18e53f73~OmcTEa_MK0131701317eusmtip1E;
 Wed, 13 May 2020 13:33:08 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 18/38] drm: omapdrm: fix common struct sg_table related
 issues
Date: Wed, 13 May 2020 15:32:25 +0200
Message-Id: <20200513133245.6408-18-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7djP87qi33fHGcy7aGHRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGG1WD//FpsD
 j8eaeWsYPfZ+W8Disf3bA1aP+93HmTw2L6n3uP3vMbPH5BvLGT1232xg8+jbsorR4/iN7Uwe
 nzfJBXBHcdmkpOZklqUW6dslcGVsnHiIrWCDaMW3m8/ZGxhPCnYxcnJICJhIvFq3lrWLkYtD
 SGAFo8SnJdeYIJwvjBJbb/SwQDifGSWatm1kgmlZ9OIjM0RiOaPEi2e9bHAt3+Y+BKtiEzCU
 6HrbxQZiiwi0Mkqc6OUBKWIWOMQksaX1KgtIQlggWOLj+8dgRSwCqhINLxrBbF4BW4lXW9ez
 QayTl1i94QAziM0JEr+zH+wmCYFd7BLP511hhyhykfjSs4sVwhaWeHV8C1RcRuL05B6ohmZG
 iYfn1rJDOD2MEpebZjBCVFlL3Dn3C2gdB9B9mhLrd+lDhB0lts1fyAoSlhDgk7jxFhxkzEDm
 pG3TmSHCvBIdbUIQ1WoSs46vg1t78MIlqBIPia3zbSEBdJhRYu37H6wTGOVnIexawMi4ilE8
 tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzAlnf53/NMOxq+Xkg4xCnAwKvHwWtzaHSfEmlhW
 XJl7iFGCg1lJhNdvPVCINyWxsiq1KD++qDQntfgQozQHi5I4r/Gil7FCAumJJanZqakFqUUw
 WSYOTqkGRlP/x7O2vMtKt2ma8H3D1qbUGPW8pSqPbxav1+7IsnSsP8ujIyhtqjY/9VeC4ZqE
 23JZF23NfidGf7jH8mKyvma7rf8uodwii/lRhyPlb1Xx+mwSvb7mMsPz6p3zNtVLf9153qnV
 Q02Pq/jcuv7uCpMv4Ymrd6xMvMYxu/aysLG/Y2jpc7MfSizFGYmGWsxFxYkAeOGoR0UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsVy+t/xu7qi33fHGZz5Im/Re+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGG1WD//FpsD
 j8eaeWsYPfZ+W8Disf3bA1aP+93HmTw2L6n3uP3vMbPH5BvLGT1232xg8+jbsorR4/iN7Uwe
 nzfJBXBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl
 6GVsnHiIrWCDaMW3m8/ZGxhPCnYxcnJICJhILHrxkbmLkYtDSGApo8T2DxfZIBIyEienNbBC
 2MISf651sUEUfWKUaLg6lx0kwSZgKNH1FiIhItDJKDGt+yM7iMMscIJJ4t7e+YwgVcICgRKr
 +1vBbBYBVYmGF41gK3gFbCVebV0PtU5eYvWGA8wgNidI/M5+FhBbSCBfYu/ifWwTGPkWMDKs
 YhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIyRbcd+bt7BeGlj8CFGAQ5GJR5ei1u744RYE8uK
 K3MPMUpwMCuJ8PqtBwrxpiRWVqUW5ccXleakFh9iNAU6aiKzlGhyPjB+80riDU0NzS0sDc2N
 zY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MOpuTO4Wlcl9odToFeM1ITjs7Zy9RxqM
 vq8Olk+//HRnw4JPk/x2ibQaGqjmV69W1p8Ud9qp2Gf2WoNZx5uTL2f296Ynnv2xvXmy4JQG
 vnbmeVONnrl57xSc+GxJqcov+9V2Cxu+aAcdZYnX3OHUY8KYfm25v/Xi0zH59x7XfSp1fPyS
 OfnkRyWW4oxEQy3mouJEAOXWc2CnAgAA
X-CMS-MailID: 20200513133309eucas1p1b5b2505556566570e6fb3433397c6168
X-Msg-Generator: CA
X-RootMTR: 20200513133309eucas1p1b5b2505556566570e6fb3433397c6168
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133309eucas1p1b5b2505556566570e6fb3433397c6168
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133309eucas1p1b5b2505556566570e6fb3433397c6168@eucas1p1.samsung.com>
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

Fix the code to refer to proper nents or orig_nents entries. This driver
checks for a buffer contiguity in DMA address space, so it should test
sg_table->nents entry.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index c259411..cbcb361 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -48,7 +48,7 @@ struct omap_gem_object {
 	 *   OMAP_BO_MEM_DMA_API flag set)
 	 *
 	 * - buffers imported from dmabuf (with the OMAP_BO_MEM_DMABUF flag set)
-	 *   if they are physically contiguous (when sgt->orig_nents == 1)
+	 *   if they are physically contiguous (when sgt->nents == 1)
 	 *
 	 * - buffers mapped through the TILER when dma_addr_cnt is not zero, in
 	 *   which case the DMA address points to the TILER aperture
@@ -1279,7 +1279,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 	union omap_gem_size gsize;
 
 	/* Without a DMM only physically contiguous buffers can be supported. */
-	if (sgt->orig_nents != 1 && !priv->has_dmm)
+	if (sgt->nents != 1 && !priv->has_dmm)
 		return ERR_PTR(-EINVAL);
 
 	gsize.bytes = PAGE_ALIGN(size);
@@ -1293,7 +1293,7 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 
 	omap_obj->sgt = sgt;
 
-	if (sgt->orig_nents == 1) {
+	if (sgt->nents == 1) {
 		omap_obj->dma_addr = sg_dma_address(sgt->sgl);
 	} else {
 		/* Create pages list from sgt */
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
