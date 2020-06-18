Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A521FF76C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3946EB8A;
	Thu, 18 Jun 2020 15:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F4C6EB70
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154024euoutp022379108266c1ffed22f6da315dcca45d~ZrZsWnrVY1254412544euoutp02g
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200618154024euoutp022379108266c1ffed22f6da315dcca45d~ZrZsWnrVY1254412544euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494824;
 bh=O2c3Dg/Bmu5P4+TijqQ9XUF6ALcxyDRv7MgKZ032jSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s2crpX7u1ONxwR9uUm87tNqpDtI2QoNvSRUECMed6MnblY7ZFoQa5MWphf6DmquFb
 CsvxSQaTsH0FOt3+/8gb7SvTsekIn+QadraylTz3pUu3nKpwUixfvvHbdDPKRr3Llj
 jvNPTENCq1+SOvc0iJrvi+sKRlAlTFAvqhrIS4qA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200618154024eucas1p1f33e944e515a02431b4b75fd40324de1~ZrZsIYXz21545515455eucas1p1X;
 Thu, 18 Jun 2020 15:40:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F1.DE.60679.8EA8BEE5; Thu, 18
 Jun 2020 16:40:24 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154024eucas1p103fa1a3752801874ae883d366639f233~ZrZr0HH3c1543415434eucas1p1V;
 Thu, 18 Jun 2020 15:40:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200618154024eusmtrp25249819e8665fc100847ad755d879c13~ZrZrzgH6s0399203992eusmtrp2b;
 Thu, 18 Jun 2020 15:40:24 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-35-5eeb8ae888af
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 9C.EE.08375.8EA8BEE5; Thu, 18
 Jun 2020 16:40:24 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154023eusmtip1ea5fd9024a12670cb8e53473be74f031~ZrZrMuxB90864308643eusmtip1J;
 Thu, 18 Jun 2020 15:40:23 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 15/36] drm: omapdrm: fix common struct sg_table related
 issues
Date: Thu, 18 Jun 2020 17:39:36 +0200
Message-Id: <20200618153956.29558-16-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djP87ovul7HGdy/rmLRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGG1WD//FpsD
 j8eaeWsYPfZ+W8Disf3bA1aP+93HmTw2L6n3uP3vMbPH5BvLGT1232xg8+jbsorR4/iN7Uwe
 nzfJBXBHcdmkpOZklqUW6dslcGWsftbMXvBZuGLijNoGxkUCXYycHBICJhJ35u9lA7GFBFYw
 Ssz8ldLFyAVkf2GU2L14LTuE85lRYvPdCawwHdeuTmGC6FjOKLFlji5cx5cnb8GK2AQMJbre
 doGNFRFoZZQ40csDUsQscIhJYkvrVRaQhLBAsMSKJS1gk1gEVCU2resHa+AVsJOYP3EVI8Q2
 eYnVGw4wg9icQPHTx1uhrtjHLrH3YS2E7SLxd3IPE4QtLPHq+BZ2CFtG4v/O+UwgiyUEmhkl
 Hp6D+EdCoIdR4nLTDKgN1hJ3zv0C2swBdJ6mxPpd+hBhR4lJrz6ygIQlBPgkbrwVBAkzA5mT
 tk1nhgjzSnS0CUFUq0nMOr4Obu3BC5egSjwk7s52hoTPREaJtlez2Ccwys9C2LWAkXEVo3hq
 aXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYCo6/e/4lx2Mu/4kHWIU4GBU4uF9EfI6Tog1say4
 MvcQowQHs5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY0XvYwVEkhPLEnNTk0tSC2C
 yTJxcEo1MCrzvV1Trl2yOdLLIfAl+7zZRxednic0593+lMcyisemsbZz7mUP2F7is97xwM64
 ulc+C/yMj7HLBzv8N9y7tK9lX+d+83W+kxYckLklY/rE+RrnsyUHwzk0P+7V9+VJuqA/wT95
 Tn3iFo5PF23X27daR+UWnQ7p+87n4Pg7Pv/m558bE7b4fVdiKc5INNRiLipOBAAJdHuuQQMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsVy+t/xu7ovul7HGfzYwWPRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGG1WD//FpsD
 j8eaeWsYPfZ+W8Disf3bA1aP+93HmTw2L6n3uP3vMbPH5BvLGT1232xg8+jbsorR4/iN7Uwe
 nzfJBXBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl
 6GWsftbMXvBZuGLijNoGxkUCXYycHBICJhLXrk5hArGFBJYySnw4xQ0Rl5E4Oa2BFcIWlvhz
 rYuti5ELqOYTo8TpTTvAEmwChhJdbyESIgKdjBLTuj+ygzjMAieYJO7tnc8IUiUsECjRM+sB
 M4jNIqAqsWldPxuIzStgJzF/4ipGiBXyEqs3HACr4QSKnz7eygpxkq3E8w9tbBMY+RYwMqxi
 FEktLc5Nzy021CtOzC0uzUvXS87P3cQIjI9tx35u3sF4aWPwIUYBDkYlHt4XIa/jhFgTy4or
 cw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RToqInMUqLJ+cDYzSuJNzQ1NLewNDQ3
 Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwDhB+WhKx9yW9pA9YXsPCDwp89545fKF
 Ganvkivnsh+e847tV1zkYafq6iW/rhpmXU+J2X/CZ3oj791zHs9zGP9L+q7SFmxz7l6zZe6n
 /mOWrfpfJc6Ksa7f7hyt7/t1rvGPOYwXZMUit2+62NS9c+sK0Z225rmzGPSLun1XXwx4MNMm
 leNRiKASS3FGoqEWc1FxIgD84oXCpQIAAA==
X-CMS-MailID: 20200618154024eucas1p103fa1a3752801874ae883d366639f233
X-Msg-Generator: CA
X-RootMTR: 20200618154024eucas1p103fa1a3752801874ae883d366639f233
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154024eucas1p103fa1a3752801874ae883d366639f233
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154024eucas1p103fa1a3752801874ae883d366639f233@eucas1p1.samsung.com>
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
 drivers/gpu/drm/omapdrm/omap_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index ff0c4b0c3fd0..a7a9a0afe2b6 100644
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
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
