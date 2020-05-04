Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F281C3A06
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640E0896C4;
	Mon,  4 May 2020 12:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594AE89622
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200504125413euoutp02367d3bc7093ca60fd8054a113401accc~L1GvQSrIj1833318333euoutp02u
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200504125413euoutp02367d3bc7093ca60fd8054a113401accc~L1GvQSrIj1833318333euoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588596853;
 bh=3AsDN+Ip+DfttKjzscLc7jI+YsnIB2JKbA1xgPMfI2w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Otjz/aruMzbJosj+k+Bs7pVQbG7s+jioZpb+8mHQjI1vq6ZOBkoLpie3dsszj3qNL
 VRELBHAD+35iW0dTJVQgVT8S05to5AEzVxCGSFbbRQe5wR1cPF+aPfFIjj+HdI1U+P
 KImVFQ/6ZsleD5AH9R0qqh1S8wPGUupFb2vnsRGA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200504125412eucas1p14c9a533433ce915e288a960b880d3fd7~L1GuxxnZU0159401594eucas1p1x;
 Mon,  4 May 2020 12:54:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 53.12.60698.47010BE5; Mon,  4
 May 2020 13:54:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125412eucas1p263f2029c4fd299db92b365d7b66316a0~L1GuaZfff2246922469eucas1p2c;
 Mon,  4 May 2020 12:54:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200504125412eusmtrp1b440a81df43aafbd62abc5eb12095fc8~L1GuZc1Ua2497724977eusmtrp1U;
 Mon,  4 May 2020 12:54:12 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-44-5eb010743d0d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B3.06.07950.47010BE5; Mon,  4
 May 2020 13:54:12 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125411eusmtip2951048608315bac83b0939c8772239f8~L1Gtnq0EO0350103501eusmtip20;
 Mon,  4 May 2020 12:54:11 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/21] drm: etnaviv: fix sg_table nents vs. orig_nents
 misuse
Date: Mon,  4 May 2020 14:53:42 +0200
Message-Id: <20200504125359.5678-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200504125359.5678-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSaUgUURzvzezsjuLmtAo+PBIXOsU7ZEjTRD9MhNGBIIHmlpOK947rFZRr
 Xq26mhYepZhEmkfrlZmWx5raolieaGlqlqUgJR5lm5bTqH37ne8Hfx6OiroxYzwoLIqWhklC
 xHxdXmP3+hurKKLG17Z13YLM7NcgZG2+CiNzXowj5J/G2yg5vPqNTzbnTwjIx5VdCFnS5kRO
 F22ZK8MzCPkzrxgh62ZHMXKo+T6frH41KSA7vn/CTupTVcVVgBoaHUCpl2slPOp54aSAerY2
 jVFT6T0IVf/wBvV+cxalcsfKANUynsCnsjZsKWVDBaCW6/afFV7UdfanQ4KiaamNi59u4K3c
 4IgHhrFTIxosAaTvUwAdHBLHYLe8CFEAXVxElAM4vyQHHFkB8HNbO48jywCObI4hO5XyibsY
 i0VEGYCpcmy30Zc2y2MNPmEHFYsKPosNiWQAX2fqsSGUUKOwtqUcsIYBcR6WpdwRKACO84gD
 UKGyZ2Uh4Qy/KDWAGzOHlTXtKBvRIU7AgsxD7DOQ+CiAj7KX+VzGAw7UtmznDeBCT4OAw6aw
 NzeDxxVuAjjTXy3gSAaAQ4n52w0nONH/i88uoMQRqGq24WQ3+LS/FbAyJPbCscV/90K3YE5j
 HsrJQpiWIuLSB2Fhz5Pd2Y63g9sRCo4pvbjzdAKoTd0QZAPzwv9bJQBUACNaxoQG0IxDGB1j
 zUhCGVlYgPWV8NA6sPW7ejd7VptA6+/LakDgQKwn9F5W+YowSTQTF6oGEEfFhsKmpC1J6C+J
 i6el4ZekshCaUQMTnCc2EjqUzvuIiABJFB1M0xG0dMdFcB3jBHAKqAKNnFxWve3PmVpSenMX
 OgcSPwRV99VrGc/YMx2N0PWwzKQ5wvF0gTLZc0K7Z3WxXi4ueNeNyGYRH/X6nLV+qUSL6t2L
 cb9qZvn1mrzUUf96qcZNW+Y6GD8Z7mEWuWTi5a8J6kpJyVLaukda2VpE+1f4JR1f+JE8qqMp
 XBPzmECJ3VFUykj+AmX0RJ5ZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xe7olAhviDLZ2sVn0njvJZLFxxnpW
 i0l7bjJZ/N82kdniytf3bBa7Ztxht1i5+iiTxYL91hYP5gIlv1x5yGTxY/o8JotNj6+xWlze
 NYfNYu2Ru+wWBz88YXXg91gzbw2jx+VrF5k99n5bwOKxc9Zddo/t3x6wetzvPs7ksXlJvcft
 f4+ZPSbfWM7osftmA5tH/18Dj74tqxg9Pm+SC+CN0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAz
 MrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MvonJxdsFCk4v7Vk6wNjN2CXYycHBICJhIr7kxl
 7WLk4hASWMooceD5RHaIhIzEyWkNrBC2sMSfa11sEEWfGCX2/G5kAkmwCRhKdL2FSIgIdDJK
 TOv+yA7iMAucYpbYsHs+WJWwQIDE0XMHmbsYOThYBFQlutYbgYR5BWwknvedZITYIC+xesMB
 sBJOAVuJmb3qIGEhgXyJu0//sUxg5FvAyLCKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMJq2
 Hfu5ZQdj17vgQ4wCHIxKPLwbvq6PE2JNLCuuzD3EKMHBrCTCu6MFKMSbklhZlVqUH19UmpNa
 fIjRFOikicxSosn5wEjPK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TB
 KdXAyKd+Oj3TMXn5vKiXRxL/39b56VbempD5eh3P7f7AtKTvd77d1H85Z5rYprWr7n9+dUTZ
 Zeey8G3v9uVuvhSqdePzxjVVjAYG57cKz7fk0NzK17bK8ryRygmf8DULFqb9P3i+qrHus8Hc
 Z1W71vyS409oa+9btXHq/S2N8YtdXE1/7ZSa8yHaaZUSS3FGoqEWc1FxIgBZbF/WvAIAAA==
X-CMS-MailID: 20200504125412eucas1p263f2029c4fd299db92b365d7b66316a0
X-Msg-Generator: CA
X-RootMTR: 20200504125412eucas1p263f2029c4fd299db92b365d7b66316a0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504125412eucas1p263f2029c4fd299db92b365d7b66316a0
References: <20200504125017.5494-1-m.szyprowski@samsung.com>
 <20200504125359.5678-1-m.szyprowski@samsung.com>
 <CGME20200504125412eucas1p263f2029c4fd299db92b365d7b66316a0@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
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
called with the original number of entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. Adapt the code to obey those rules.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v2 00/21] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/4/373
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index dc9ef30..a224a97 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -27,7 +27,8 @@ static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
 	 * because display controller, GPU, etc. are not coherent.
 	 */
 	if (etnaviv_obj->flags & ETNA_BO_CACHE_MASK)
-		dma_map_sg(dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+		sgt->nents = dma_map_sg(dev->dev, sgt->sgl, sgt->orig_nents,
+					DMA_BIDIRECTIONAL);
 }
 
 static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj)
@@ -51,7 +52,8 @@ static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj
 	 * discard those writes.
 	 */
 	if (etnaviv_obj->flags & ETNA_BO_CACHE_MASK)
-		dma_unmap_sg(dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+		dma_unmap_sg(dev->dev, sgt->sgl, sgt->orig_nents,
+			     DMA_BIDIRECTIONAL);
 }
 
 /* called with etnaviv_obj->lock held */
@@ -405,7 +407,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
 
 	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
 		dma_sync_sg_for_cpu(dev->dev, etnaviv_obj->sgt->sgl,
-				    etnaviv_obj->sgt->nents,
+				    etnaviv_obj->sgt->orig_nents,
 				    etnaviv_op_to_dma_dir(op));
 		etnaviv_obj->last_cpu_prep_op = op;
 	}
@@ -422,7 +424,7 @@ int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
 		/* fini without a prep is almost certainly a userspace error */
 		WARN_ON(etnaviv_obj->last_cpu_prep_op == 0);
 		dma_sync_sg_for_device(dev->dev, etnaviv_obj->sgt->sgl,
-			etnaviv_obj->sgt->nents,
+			etnaviv_obj->sgt->orig_nents,
 			etnaviv_op_to_dma_dir(etnaviv_obj->last_cpu_prep_op));
 		etnaviv_obj->last_cpu_prep_op = 0;
 	}
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
