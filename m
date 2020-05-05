Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39E61C50DE
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E11C6E563;
	Tue,  5 May 2020 08:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C97689D9B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084629euoutp01da442317dc2e049f3e16410fc8482c50~MFXu-PtpB0378903789euoutp01D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:46:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200505084629euoutp01da442317dc2e049f3e16410fc8482c50~MFXu-PtpB0378903789euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668389;
 bh=stF2WLNPiLbjXqAhwvq6b+uszoAILe84l0EC6jg4EIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xjs0aXIP7S4F3RaMuwL6nTXHrGsFWtfPc8Y8Mil9UO6lpUoAXS6JszKHOovAaUWoH
 nopwgPPzWhqf4FTcpSH1K6jzKx6j0qVf+alkDAMad5+QOh1/ZkTarWx5lrBvtxCUAr
 Z72YKeDloaILT3c9dWIi4OUSS4zv2tCaZpr3qtOc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200505084629eucas1p1bc660181198e14441b2cd36ed4bc4769~MFXuqKYrY1829518295eucas1p1B;
 Tue,  5 May 2020 08:46:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3D.01.60698.5E721BE5; Tue,  5
 May 2020 09:46:29 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084629eucas1p12e882329da88edd155ba9f9f952889a0~MFXuXNqZI0601906019eucas1p1J;
 Tue,  5 May 2020 08:46:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084629eusmtrp1741f8c6f136467c00fd54c3f038dae88~MFXuWedlH0942509425eusmtrp1B;
 Tue,  5 May 2020 08:46:29 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-32-5eb127e56b1a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 57.21.07950.4E721BE5; Tue,  5
 May 2020 09:46:28 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084628eusmtip1b2ab630b653f32d48173e1404386a386~MFXtsp_Si0580805808eusmtip17;
 Tue,  5 May 2020 08:46:28 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/25] drm: msm: fix common struct sg_table related issues
Date: Tue,  5 May 2020 10:45:58 +0200
Message-Id: <20200505084614.30424-9-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505084614.30424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHeXd2do7m7DQlXy1UFlmJucRgh7xgYXG+RNGXoshaeVBzU9tR
 U79k5nV5l6HJMBXxNs1LpqmUOdRl4t1E85YsUwuzmA6tmLmdZd9+z/N//jwXHhwR9KJOeFhE
 NC2PkEiFPGtua9/28MmlY01Bp9YTHcmsoX4O2VTUgJI7rXkIObG5ziNVy4OArFH3csjSLh9y
 Y2KRQzbrJlEyr2sQI8c7VDyyvmcOI5fLthCy+8dnlJwr6AEB+6m6kjpAvTaUcqn24jmMajN8
 QqmFJ1oO9aLiITVj1CFUwVQVoDqnE3mUtuMjRmW31AJK3+x82ea6tW8wLQ2LpeUi/9vWoZ0r
 /SAq42CcMrmNkwimBApghUPiNJxZS+MpgDUuIKoBrKjpx9hgA8C6EYNF0QOY3N69G+BmS1NJ
 nMktIKoAzDE67BmajK08k8AjvKBiTWFmeyIFwHdZNqYihChG4Irmt1mwIy7BjsJ8YGIucRQ2
 GHtRE/MJP/iseovHzucC1Y1vERNbEf5QNzZrnggS8xgc2xlB2aJAqPxSg7FsB79qWyx8GA4U
 ZHJZw2MAF4fqMTbIBHA8qQiwVT5wduiXeTeEOAEbOkRs+ixsH1cg7Mq2cGrtgCmN7GJ+a6El
 zYfpqZY7usFi7fO9tt0jYwjLFKw2lKDshXoBrFSmc3KBS/H/ZqUA1AIHOoaRhdCMdwT9wJOR
 yJiYiBDPu5GyZrD7XANG7eYr8ObPHQ0gcCC04V/TNwQJUEksEy/TAIgjQnt+5VZjkIAfLIlP
 oOWRt+QxUprRgEM4V+jA9y5fvSkgQiTRdDhNR9HyfyoHt3JKBOVlk/R7xeg+sYf7B5un26pg
 vzSR/gyThEluLI12SgPFIfzgFbUyx8N1/h6xfeSix7CjTuXyKDQFzx3YrrITB4Rm3F8Vr0+c
 93C7UOkayPXNnk1F1Ppzace/TbukXHmZUpeWTcj6GhdKv4dvXHVO8DJE/tQVqpSr6uEkkatt
 s5DLhEq83BE5I/kLkjTk3lgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xu7pP1TfGGVzjteg9d5LJYuOM9awW
 /7dNZLa48vU9m8Wc52cZLVauPspksWC/tcWXKw+ZLDY9vsZqMXH/WXaLy7vmsFmsPXKX3eL5
 wh/MFgc/PGG1uDv5CKMDv8eaeWsYPfZ+W8DisXPWXXaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m
 31jO6LH7ZgObx/Fdt9g9+rasYvT4vEkugCdKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP
 0Ng81srIVEnfziYlNSezLLVI3y5BL2P3i5OMBZ1iFVNbtjM1MN4Q6mLk4JAQMJHYOK+ii5GL
 Q0hgKaPEuoa9rF2MnEBxGYmT0xqgbGGJP9e62CCKPjFK3Dm9lhkkwSZgKNH1FiIhItDJKDGt
 +yM7iMMssIRZom/qJTaQKmEBX4njL3+AdbAIqEqs/3cUbCyvgK3E/BU/2CBWyEus3nAArIZT
 wE7i8aU7YHEhgUKJD+e/s05g5FvAyLCKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMI62Hfu5
 ZQdj17vgQ4wCHIxKPLwbvq6PE2JNLCuuzD3EKMHBrCTCu+zHhjgh3pTEyqrUovz4otKc1OJD
 jKZAR01klhJNzgfGeF5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6p
 BkaPPbn1oo/PmKWaBrrPXCix+eliWdGs582irisOOGZ8ED1m/dMuwPu5U+j2iQbLvB5dECqd
 4rjqdrFtxJwbt3cJ9iz798w6fRWDZrBQ290XJbsPxN5i3nBwueFefjc7p2Vlefv8tv+1ztkv
 mZVYEsl5dbXT73l+/lGb+HOcvzrI6Cs4K+dI31FiKc5INNRiLipOBADk5cGsuQIAAA==
X-CMS-MailID: 20200505084629eucas1p12e882329da88edd155ba9f9f952889a0
X-Msg-Generator: CA
X-RootMTR: 20200505084629eucas1p12e882329da88edd155ba9f9f952889a0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084629eucas1p12e882329da88edd155ba9f9f952889a0
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084629eucas1p12e882329da88edd155ba9f9f952889a0@eucas1p1.samsung.com>
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
Cc: freedreno@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
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
 drivers/gpu/drm/msm/msm_gem.c   | 13 +++++--------
 drivers/gpu/drm/msm/msm_iommu.c |  2 +-
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a6a79f..ab952d6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -53,11 +53,10 @@ static void sync_for_device(struct msm_gem_object *msm_obj)
 	struct device *dev = msm_obj->base.dev->dev;
 
 	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
-		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+		dma_sync_sgtable_for_device(dev, msm_obj->sgt,
+					    DMA_BIDIRECTIONAL);
 	} else {
-		dma_map_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+		dma_map_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL);
 	}
 }
 
@@ -66,11 +65,9 @@ static void sync_for_cpu(struct msm_gem_object *msm_obj)
 	struct device *dev = msm_obj->base.dev->dev;
 
 	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
-		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+		dma_sync_sgtable_for_cpu(dev, msm_obj->sgt, DMA_BIDIRECTIONAL);
 	} else {
-		dma_unmap_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+		dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index ad58cfe..d322b39 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -43,7 +43,7 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	size_t ret;
 
-	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
+	ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
 	WARN_ON(!ret);
 
 	return (ret == len) ? 0 : -EINVAL;
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
