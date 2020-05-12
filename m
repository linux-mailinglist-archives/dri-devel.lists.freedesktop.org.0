Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129751CF09E
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AF36E8F0;
	Tue, 12 May 2020 09:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297866E8DE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:19 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090117euoutp02d5698dc87bdfbee835c7670662c310c2~OPFp8BfMu0482404824euoutp02j
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200512090117euoutp02d5698dc87bdfbee835c7670662c310c2~OPFp8BfMu0482404824euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274077;
 bh=14VzeENnjcV2TT/ICHRzDhrJSJrLEx2NP2xTv7h5SRI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=exLZ8P2W+lxckU5xjGhldkdPzVtt95ccj3JemTcZPv8edJXbToP39ZjWagkjU4w8j
 f8uQud2kvj/Q1fpPqQ60NK/yzFbSz7DsbPl9g9cumiW2Fg2EcclyTWkdZAA74A3iVM
 CXel+IQYEXevbAjDvWZGVK+3k236hIRLztqEcTJU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200512090117eucas1p1b54df08a47fba074693ed451d2e38367~OPFpsf5fF2840028400eucas1p1s;
 Tue, 12 May 2020 09:01:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C8.22.60679.DD56ABE5; Tue, 12
 May 2020 10:01:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090117eucas1p1acf4ddfe65242d28eee247ab2ca21454~OPFpVWDZz1612616126eucas1p1d;
 Tue, 12 May 2020 09:01:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512090117eusmtrp2474be8291d69938040754fdef0566948~OPFpUjSNO0472704727eusmtrp2F;
 Tue, 12 May 2020 09:01:17 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-a1-5eba65dd0b9e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 70.45.08375.DD56ABE5; Tue, 12
 May 2020 10:01:17 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090116eusmtip14759e747705a1004eda1f60d54138496~OPFo1m7oq1352813528eusmtip1I;
 Tue, 12 May 2020 09:01:16 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 17/38] drm: omapdrm: use common helper for extracting
 pages array
Date: Tue, 12 May 2020 11:00:37 +0200
Message-Id: <20200512090058.14910-17-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7djPc7p3U3fFGby4KGPRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGG1WD//FpsD
 j8eaeWsYPfZ+W8Disf3bA1aP+93HmTw2L6n3uP3vMbPH5BvLGT1232xg8+jbsorR4/iN7Uwe
 nzfJBXBHcdmkpOZklqUW6dslcGV8/HCPveAKT8X/fw/ZGhhXc3UxcnJICJhIXNl4mrmLkYtD
 SGAFo8T2O7+ZIJwvjBKXH+5mA6kSEvjMKHH3qA1Mx7G7jxkh4ssZJZ5uUIBreD7xBFiCTcBQ
 outtF1iziEAro8SJXh6QImaBQ0wSW1qvsoAkhAXCJF62rGUFsVkEVCV2TWgAs3kF7CTunj/H
 BLFNXmL1hgPMIDYnUPz+/D8sIIMkBPaxSzxfuYsZoshF4uuyh2wQtrDEq+Nb2CFsGYn/O+cz
 QTQ0M0o8PLeWHcLpAXquaQYjRJW1xJ1zv4C6OYDu05RYv0sfIuwo0f5gHTtIWEKAT+LGW0GQ
 MDOQOWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxwCeo0D4nHt94wQULrKKPEywkhExjlZyHsWsDI
 uIpRPLW0ODc9tdgoL7Vcrzgxt7g0L10vOT93EyMwHZ3+d/zLDsZdf5IOMQpwMCrx8BoY7IwT
 Yk0sK67MPcQowcGsJMLbkgkU4k1JrKxKLcqPLyrNSS0+xCjNwaIkzmu86GWskEB6Yklqdmpq
 QWoRTJaJg1OqgVEp+eneuM23Vm3t3HAlKWDPjiMlKQe6Mz9MOBrQkqhuN9Wg4M3OurDXZxY4
 vv73Tlgh/O5+xV9ZsgFn2ftr1QPuf2fnqArrONDKGX14R+LO8EV8S4Wni6+ND5KVWDkv+rBm
 t4eqV/vqDeGTLf3jJH9UXrd88/546feYaWXmpjcSe1z1a+r21SmxFGckGmoxFxUnAgD003EC
 QwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsVy+t/xu7p3U3fFGby6yGnRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzWLtkbvsFgc/PGG1WD//FpsD
 j8eaeWsYPfZ+W8Disf3bA1aP+93HmTw2L6n3uP3vMbPH5BvLGT1232xg8+jbsorR4/iN7Uwe
 nzfJBXBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl
 6GV8/HCPveAKT8X/fw/ZGhhXc3UxcnJICJhIHLv7mLGLkYtDSGApo8SJTbvYIBIyEienNbBC
 2MISf651sUEUfWKU+Hj9J1gRm4ChRNdbiISIQCejxLTuj+wgDrPACSaJe3vnM4JUCQuESBye
 3wXWwSKgKrFrAsRYXgE7ibvnzzFBrJCXWL3hADOIzQkUvz//DwuILSRQKPHo6luWCYx8CxgZ
 VjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgTGyLZjPzfvYLy0MfgQowAHoxIPb4fRzjgh1sSy
 4srcQ4wSHMxKIrwtmUAh3pTEyqrUovz4otKc1OJDjKZAR01klhJNzgfGb15JvKGpobmFpaG5
 sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsbk26+SIpxMFWdFTJbfUXwnRbGu2C7E
 8uevg/y3b/GkebJ05c11f/a33qk70jjhiMv7C2yF8+YzKfGZPnMp33rv/5s35WviH/y+Oq0n
 I2MihxnbPgfvXUECeixSvzY+ttBd3hc3a80tectrOzIWr+g+/Pmt2sanebN7It2a1FjvvZkg
 uGG6Q40SS3FGoqEWc1FxIgDa6lWypwIAAA==
X-CMS-MailID: 20200512090117eucas1p1acf4ddfe65242d28eee247ab2ca21454
X-Msg-Generator: CA
X-RootMTR: 20200512090117eucas1p1acf4ddfe65242d28eee247ab2ca21454
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090117eucas1p1acf4ddfe65242d28eee247ab2ca21454
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090117eucas1p1acf4ddfe65242d28eee247ab2ca21454@eucas1p1.samsung.com>
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
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
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
