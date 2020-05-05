Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C758E1C50D0
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F526E23B;
	Tue,  5 May 2020 08:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E4389D02
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:28 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084626euoutp01b237e763695a289bb6778347b867522c~MFXsOpITa0319103191euoutp01k
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200505084626euoutp01b237e763695a289bb6778347b867522c~MFXsOpITa0319103191euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668386;
 bh=vQq9T4bTE7tH357A+pikqq6dXm/wFYLJv6oWt24FC3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cLrRnK7SPIex65u5aWDIqxUgCh6LL9/7XYbMu/JTi2bZu+cEyjUNiPex36nBT/q08
 99tL+z8Gs8H9KWzArbEPVqfM/vR7PgjShTKjVIt1pczizUXAyKDwTNAVmmya5AkHBj
 g8AChaHXgrTez5Cdd5n5E3KeDq8L/WfoLOfymBpQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200505084626eucas1p1325eb9a146d93c42f9c6bbe0718d6c57~MFXr2WheI2432424324eucas1p1y;
 Tue,  5 May 2020 08:46:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CF.BF.61286.2E721BE5; Tue,  5
 May 2020 09:46:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200505084626eucas1p20753456727333c09718253ca5c32d98c~MFXresudS1348713487eucas1p2S;
 Tue,  5 May 2020 08:46:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084626eusmtrp1e1643544281fa3d0966324c1a3e1600a~MFXrd60qK0942509425eusmtrp13;
 Tue,  5 May 2020 08:46:26 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-94-5eb127e28dd9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C1.14.08375.1E721BE5; Tue,  5
 May 2020 09:46:25 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084625eusmtip183ea40c2ecca9ab414f2ba869cca3540~MFXq_Tir40580805808eusmtip15;
 Tue,  5 May 2020 08:46:25 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/25] drm: armada: fix common struct sg_table related
 issues
Date: Tue,  5 May 2020 10:45:53 +0200
Message-Id: <20200505084614.30424-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRmVeSWpSXmKPExsWy7djP87qP1DfGGWw7LmzRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8eXKQyaLTY+vsVpc3jWHzeLQ1L2MFmuP3GW3OPjhCasD
 j8eaeWsYPS5fu8jssffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7ZgObR9+WVYwe
 nzfJBXBHcdmkpOZklqUW6dslcGX8XbiateC0UMX0d8eYGxg38XcxcnBICJhI3NqS1MXIxSEk
 sIJR4uGy7YxdjJxAzhdGiedzxSASnxklJpxoBkuANMzpX8oMkVjOKPHl4QYWCAeo43jnTVaQ
 KjYBQ4mut11sILaIQCujxIleHpAiZoEDTBJt714zgSSEBYIk3hy5xAJiswioSixf8JoN5CZe
 AVuJX2tFIbbJS6zecIAZxOYUsJN4fOkOG8gcCYFD7BJTbqxjhyhykfh+cz4rhC0s8er4Fqi4
 jMTpyT0sEA3NQM+dW8sO4fQwSlxumgH1kLXEnXO/wDYzC2hKrN+lDwkYR4n3UzUgTD6JG28F
 QYqZgcxJ26YzQ4R5JTrahCBmqEnMOr4ObuvBC5eYIWwPicOzd7FDwucoo8S33kvMExjlZyHs
 WsDIuIpRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMwGZ3+d/zTDsavl5IOMQpwMCrx8EZ8
 Xh8nxJpYVlyZe4hRgoNZSYR32Y8NcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUSSE8s
 Sc1OTS1ILYLJMnFwSjUwOmw9EHnPOrfkyq1VaX/CImP/XZ3yYNO8qX6XV5d+vXBra8JLUaND
 k5yytloZfJgk9eBBXvqS771Zmi11p4rLDp4N7NvJuflupGyN6/E5MismuHA3vp/a3pqlG3LZ
 8x3QqmXP9eMudG3eOc/8zdNP9nrrCpS8sji26pR6xEssaNh97+geoVuHlViKMxINtZiLihMB
 FNKWGUIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsVy+t/xu7oP1TfGGexpsLHoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZnFo6l5Gi7VH7rJbHPzwhNWB
 x2PNvDWMHpevXWT22PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HNo2/LKkaP
 z5vkArij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S
 9DL+LlzNWnBaqGL6u2PMDYyb+LsYOTkkBEwk5vQvZQaxhQSWMkocumUOEZeRODmtgRXCFpb4
 c62LrYuRC6jmE6PEwQfHwBJsAoYSXW8hEiICnYwS07o/soM4zALHmCQW/vrIAlIlLBAg8Xzm
 RyYQm0VAVWL5gtdAHRwcvAK2Er/WikJskJdYveEA2BWcAnYSjy/dYYO4qFDiw/nvrBMY+RYw
 MqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjI9tx35u3sF4aWPwIUYBDkYlHt6Iz+vjhFgT
 y4orcw8xSnAwK4nwLvuxIU6INyWxsiq1KD++qDQntfgQoynQTROZpUST84Gxm1cSb2hqaG5h
 aWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgVEjfW/Q9Y9ZTm3s+/I/aQXsXcjM
 4Vc+0fbgsXfbjJYWJYSd/smfopr4oTTS/LPi9RO2d1Uq/u1mvLfIZLPIugNVi1pfM504O/Xh
 8vsVDPLKCyNfq7tpL3zGeJqzK6RUgd1lz/8dL0884LqxTj436+hrhUuBjDuTl9U8/X35eILP
 qvkuJxZ0T01XYinOSDTUYi4qTgQAs9th7aUCAAA=
X-CMS-MailID: 20200505084626eucas1p20753456727333c09718253ca5c32d98c
X-Msg-Generator: CA
X-RootMTR: 20200505084626eucas1p20753456727333c09718253ca5c32d98c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084626eucas1p20753456727333c09718253ca5c32d98c
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084626eucas1p20753456727333c09718253ca5c32d98c@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
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
 drivers/gpu/drm/armada/armada_gem.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 976685f..5b4f48c 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -407,8 +407,8 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 			sg_set_page(sg, page, PAGE_SIZE, 0);
 		}
 
-		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0) {
-			num = sgt->nents;
+		if (dma_map_sgtable(attach->dev, sgt, dir)) {
+			num = count;
 			goto release;
 		}
 	} else if (dobj->page) {
@@ -418,7 +418,7 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 
 		sg_set_page(sgt->sgl, dobj->page, dobj->obj.size, 0);
 
-		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0)
+		if (dma_map_sgtable(attach->dev, sgt, dir))
 			goto free_table;
 	} else if (dobj->linear) {
 		/* Single contiguous physical region - no struct page */
@@ -449,11 +449,11 @@ static void armada_gem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
 	int i;
 
 	if (!dobj->linear)
-		dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
+		dma_unmap_sgtable(attach->dev, sgt, dir);
 
 	if (dobj->obj.filp) {
 		struct scatterlist *sg;
-		for_each_sg(sgt->sgl, sg, sgt->nents, i)
+		for_each_sg(sgt->sgl, sg, sgt->orig_nents, i)
 			put_page(sg_page(sg));
 	}
 
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
