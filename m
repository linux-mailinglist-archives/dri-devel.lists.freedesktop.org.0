Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760961BBEF0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 15:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2005D6E3AE;
	Tue, 28 Apr 2020 13:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF486E3AE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:20:25 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200428132024euoutp022f1d75aa2c8b60554ba5a90cd1065977~J-l5UAquO2992529925euoutp02B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:20:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200428132024euoutp022f1d75aa2c8b60554ba5a90cd1065977~J-l5UAquO2992529925euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588080024;
 bh=4V5EWHU51lrmO9OpsszXaCoiSrCUGE+t44s1P6BJsQU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e4B3FkCfhSezAmTW33v5ddQ+Hq2jX8tQRvP7VoDw4P2HHETMt6rlN1vMMfmYpOROg
 EodiQNAsWAkejTzVNJizaZvU7dDlhE7ZGMRUeCRwAZgQn5ekar8EmM71SLuhXyB2yp
 N15hkbLux5VNoBjw1KzF2gGs6zIIYclJdqW5+bVE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200428132024eucas1p15062f4f48b3c3f63ba9f9384f7f36ae5~J-l46X3sQ3055730557eucas1p1U;
 Tue, 28 Apr 2020 13:20:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 41.C1.60679.89D28AE5; Tue, 28
 Apr 2020 14:20:24 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200428132023eucas1p1a894986ab95ac3208c19878c6a04c0e1~J-l4oC-4L3064530645eucas1p1J;
 Tue, 28 Apr 2020 13:20:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200428132023eusmtrp22df37bbd0b0862da59bf0f32ef70decb~J-l4nVy1g2140221402eusmtrp2E;
 Tue, 28 Apr 2020 13:20:23 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-8b-5ea82d98a24e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 6A.D3.07950.79D28AE5; Tue, 28
 Apr 2020 14:20:23 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200428132023eusmtip25f9c33cb573d33ee412417a1847bd9a2~J-l3-P9IZ1062310623eusmtip2j;
 Tue, 28 Apr 2020 13:20:23 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [RFC 03/17] drm: armada: fix sg_table nents vs. orig_nents misuse
Date: Tue, 28 Apr 2020 15:19:51 +0200
Message-Id: <20200428132005.21424-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428132005.21424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSeyyVYRzH95z3vBdy9HYoz1C207LUELK9jUwqe1f+KJva2sjBG+a686Lw
 R9LVcZnLzEnlUuSeO+WyjtNB2GguxyXKddJGmpOWjLxe9N/n930+v32fPXsIRKxEjYnA0AhG
 FioNlmC6woaOP32WCstir1PaTX0qubdLQBVW3sOpakUlSsWrujFqsyENoQZ//cCokrJ2AfUs
 tVZA5b13oLSDUwKqZkaDUgNNzzGqQj2BU23LsyjVPbGCO++ny3PKAd26miekxzUtGN24OonS
 XxM7BXRtwV3688YMQmeMFAG6eTQOo1PqSgG9UnPkyr4buo5+THBgFCOzdvLWDVBoqvHwDvKO
 IncUjwN9IjnQISB5GvaN9yFyoEuIyWIAu0rzUX7QAjiq7hFylphcAbC0x3t3I2+wH/BSEYCp
 8QXY3kZPfgbgLIy0gfJFOcaxIfkQwI/JepyEkA0InC1S43JAEAbkJVj/4RrnCMljsLWxdrtN
 RJ6FJQlDKN9mBsuqlAjHOqQTLJye2y6DpAaHWcMDO9IFOPt0Y4cN4PfOOpxnU7j5LlfAL9wH
 cKq3AueHJAAH4hWAtxzgeO8axt0IIS1gZZM1H5+DU9NKARdDUh+OLB7gYmQL0xuyED4WwSeP
 xLxtDrM73+zVtn3qR3im4cKLbCH/QGkADvcmYqnALPt/WR4ApcCIiWRD/BnWNpS5bcVKQ9jI
 UH8r37CQGrD1r3o2OrVvQdO6jwqQBJDoiar0ir3EqDSKjQ5RAUggEkPRdMBrL7HITxodw8jC
 bsoigxlWBUwIocRIZPdywVNM+ksjmCCGCWdku6cCQsc4DlS0z5c5xpmWszEWWlm676HglBzn
 pUzXuTXzseT6GbeSk4vuCjQh44t9/VKNabKLm+v5Zu+Ckgc+6ZWPTSwvz2vdf1pPZoZ9E71S
 mXgOBKT0XzSyfGrbkuS4/LdJbT5xy3tsSfO71u5w1+pVVfGZ9OMuQbEeR68PHVwXVyg9Yu3D
 1RIhGyC1OYHIWOk/+8puuVMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7rTdVfEGVyYaGrRe+4kk8XS9Y3s
 FhtnrGe1aDp0is3i/7aJzBZXvr5ns1i5+iiTxewJm5ksFuy3tvhy5SGTxabH11gtLu+aw2ax
 9shddouDH56wWpy6+5ndgd9jzbw1jB57vy1g8bhzbQ+bx/ZvD1g97ncfZ/LYvKTe4/a/x8we
 k28sZ/TYfbOBzaNvyypGj8+b5AK4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOt
 jEyV9O1sUlJzMstSi/TtEvQyZlzbyF5wTKBixvyb7A2M53m7GDk5JARMJBZcucTYxcjFISSw
 lFFi6tmtbBAJGYmT0xpYIWxhiT/Xutggij4xSrQfbAUrYhMwlOh6C5EQEehklJjW/ZEdxGEW
 OMAs0X3+JFMXIweHsICXxNbDYSANLAKqEnu3b2YBsXkFbCVWdl6F2iAvsXrDAWYQm1PATmLp
 o6dsIK1CQDWXW3InMPItYGRYxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERg924793LKDsetd
 8CFGAQ5GJR7eDTwr4oRYE8uKK3MPMUpwMCuJ8D7KWBYnxJuSWFmVWpQfX1Sak1p8iNEU6KaJ
 zFKiyfnAyM4riTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cAY8rPw
 /4FVz0/nKckpOrm73znoVymZWXtxo9u+B4LbmfmZ7Xm7XXc5f0h8Hh+X9P6LhWGvgifjic4j
 vsmR3XpiJmlbAjtfKIbujZ/8ok7f5ePerCe+h/7kPzEq/SsbWCJ5MO+rq3KR16/dV2Vib3MX
 zqpszdW55KZ0cPui1qeT+LW5UxkOFCixFGckGmoxFxUnAgB/3dKrtAIAAA==
X-CMS-MailID: 20200428132023eucas1p1a894986ab95ac3208c19878c6a04c0e1
X-Msg-Generator: CA
X-RootMTR: 20200428132023eucas1p1a894986ab95ac3208c19878c6a04c0e1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200428132023eucas1p1a894986ab95ac3208c19878c6a04c0e1
References: <20200428132005.21424-1-m.szyprowski@samsung.com>
 <CGME20200428132023eucas1p1a894986ab95ac3208c19878c6a04c0e1@eucas1p1.samsung.com>
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
 drivers/gpu/drm/armada/armada_gem.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 976685f..749647f 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -407,8 +407,10 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 			sg_set_page(sg, page, PAGE_SIZE, 0);
 		}
 
-		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0) {
-			num = sgt->nents;
+		sgt->nents = dma_map_sg(attach->dev, sgt->sgl, sgt->orig_nents,
+					dir);
+		if (sgt->nents == 0) {
+			num = sgt->orig_nents;
 			goto release;
 		}
 	} else if (dobj->page) {
@@ -418,7 +420,9 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 
 		sg_set_page(sgt->sgl, dobj->page, dobj->obj.size, 0);
 
-		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0)
+		sgt->nents = dma_map_sg(attach->dev, sgt->sgl, sgt->orig_nents,
+					dir);
+		if (sgt->nents == 0)
 			goto free_table;
 	} else if (dobj->linear) {
 		/* Single contiguous physical region - no struct page */
@@ -449,11 +453,11 @@ static void armada_gem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
 	int i;
 
 	if (!dobj->linear)
-		dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
+		dma_unmap_sg(attach->dev, sgt->sgl, sgt->orig_nents, dir);
 
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
