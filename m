Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9884E1C3A31
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903D36E3D3;
	Mon,  4 May 2020 12:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DA06E3D8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:25 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200504125424euoutp01af9211358badc90b432c6c3c57b96958~L1G6CC0qZ2860028600euoutp013
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:54:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200504125424euoutp01af9211358badc90b432c6c3c57b96958~L1G6CC0qZ2860028600euoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588596864;
 bh=zHKjZwTbMZQRumKBMI2AAMfiZVQYV7hkyoAsi6A5YUc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fa4K6YxE0WKI8AbXSk+jj/nQOBw9hyMeKhrzJ57J2LSfAawk4LRm/0lMKMOQGcVul
 sdB6vOA5qQwaPFi5go8O5pD7YEK4WFfaI4ZwWytk19LrGrY/LgTVPEYSUW22upxjsm
 05tVFRr3GJ03XaCYaJ7oJ7GRNgTbwpVe0T7suRBc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200504125424eucas1p2e4b016b14b89fc7a00c20e03f6732b26~L1G5no84j2227522275eucas1p2y;
 Mon,  4 May 2020 12:54:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BE.12.60698.08010BE5; Mon,  4
 May 2020 13:54:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125423eucas1p24639a2eae17ebc634e022a6c7d448981~L1G42B__p0599805998eucas1p2I;
 Mon,  4 May 2020 12:54:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200504125423eusmtrp11a647a9bbbb95e4ac1ed778c7a476de2~L1G4wG4_32470624706eusmtrp1r;
 Mon,  4 May 2020 12:54:23 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-64-5eb01080774f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 0E.06.07950.F7010BE5; Mon,  4
 May 2020 13:54:23 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200504125422eusmtip2100181fd77b643d825ae7bf11205545f~L1G4FjbSs0350103501eusmtip23;
 Mon,  4 May 2020 12:54:22 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/21] dmabuf: fix sg_table nents vs. orig_nents misuse
Date: Mon,  4 May 2020 14:53:57 +0200
Message-Id: <20200504125359.5678-19-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200504125359.5678-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSeUgUURzm7Rw7mmvjavo8StjohDywPyYsSTIYwkIIyYSsTcdVctV2PFIK
 Fy2pzU1bwysr3QTvM9nEtPLIzQwrNbF0PVNREI1dlUy0Hafsv+/3He9778cjEHEd5kRERscx
 imhplAS3RHVdvz4dUZJ1IR5TkxaUurdbQNXn1WLUpu4hQg0sL+JUeeU7AVX0xpsyDUwIqIap
 QYzqby7EqepOg5BqW/qBUR8MRuFJK7rqaRWgW1eKUHpksAWnX66MY/TYfb2AflGSQg9vTCF0
 9lApoF99U+L0g8YKQBsb9gTsCLY8HsZERSYwCnefK5YR+o4NPLbf7oZu/IlQCcpsVIAgIHkU
 akuCVcCCEJNlAE7cC1cBSzM2AdinbcH4wQhgTv4zAefiAgVjmUJeKAVw9bsJ3Y4Y1KsI58JJ
 T6haUOEctiPvAPhebcWZELJdAAvLZ1FOsCXPwN+auS0TSu6DxqrhrbCIPAGzTCrA17nCyrq3
 CHdXCzOfrz7AnQPJZiHcrO/GeI8fbH2kw3lsC+f1jUIeu8Ce7AyUD6SZH9dbLeSHDAD7U/P+
 NnjDkd41nGtAyEOwttmdp33hUs60kF+SNRxasOFoxAw1ulyEp0XwbrqYd++HBfqa7dq2z30I
 j2mYVrOC8wvqAHCyqQvLAq4F/8uKAKgADkw8K5cxrFc0k+jGSuVsfLTMLTRG3gDM/6hnQ7/c
 BF6vX20HJAEkVqIgY22IGJMmsEnydgAJRGInarptpkRh0qRkRhFzWREfxbDtwJlAJQ4iL+3c
 JTEpk8Yx1xgmllH8UwWEhZMSOMdHgVSf0ZmYusngNHt9TfZ8oNbdtJo7mizTNIV3soljaY4V
 gW0X7DNtRnel+z8n4tCUtfPKvbpzM1/VnY+Lj20khCnO7tQaDqY2BgRZe4j7YvxdRsp6nKdV
 twbtPK47WnnN3vy4Lve9uDjZEKr5ojEsa36KunefCj1dWewn0EpQNkLqeRhRsNI/Td9DXUMD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsVy+t/xe7r1AhviDFqfc1v0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hs1h75C67xcEPT1gtTt39zO7A
 47Fm3hpGj73fFrB43Lm2h81j+7cHrB73u48zeWxeUu9x+99jZo/JN5Yzeuy+2cDm0bdlFaPH
 501yAdxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJ
 ehnHD/9jK7gsUrHtwVz2BsYVgl2MnBwSAiYSs+73s4PYQgJLGSVezY2BiMtInJzWwAphC0v8
 udbFBlHziVFieoMFiM0mYCjR9RYkzsUhItDJKDGt+yM7iMMscIJJ4vSMr2DdwgJeEr8nvQTr
 ZhFQlfi85jYziM0rYCsx4UsXI8QGeYnVGw4AxTk4OIHiM3vVIZblS9x9+o9lAiPfAkaGVYwi
 qaXFuem5xUZ6xYm5xaV56XrJ+bmbGIHRse3Yzy07GLveBR9iFOBgVOLh3fB1fZwQa2JZcWXu
 IUYJDmYlEd4dLUAh3pTEyqrUovz4otKc1OJDjKZAN01klhJNzgdGbl5JvKGpobmFpaG5sbmx
 mYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsbNIkfXX3qY9v72YdG68hU6OwI0fqYdSHm3
 qP2OuOXJoPV1HOm6Tu7rYyZInng2K+wDB3duzM8kW6ZVh5tipb4vcNF8I/c3ubnz/jKzxdl2
 IVO+ec9k2uyVXrJb1aPH+eXGpwdmLy7bo+N26sm7vuNv3ioViuornMyadsQp8MYMRrbbHad5
 6nqVWIozEg21mIuKEwF/RK8UpAIAAA==
X-CMS-MailID: 20200504125423eucas1p24639a2eae17ebc634e022a6c7d448981
X-Msg-Generator: CA
X-RootMTR: 20200504125423eucas1p24639a2eae17ebc634e022a6c7d448981
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504125423eucas1p24639a2eae17ebc634e022a6c7d448981
References: <20200504125017.5494-1-m.szyprowski@samsung.com>
 <20200504125359.5678-1-m.szyprowski@samsung.com>
 <CGME20200504125423eucas1p24639a2eae17ebc634e022a6c7d448981@eucas1p2.samsung.com>
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
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
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
called with the original number of entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. Adapt the code to obey those rules.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v2 00/21] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/4/373
---
 drivers/dma-buf/heaps/heap-helpers.c | 7 ++++---
 drivers/dma-buf/udmabuf.c            | 5 +++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index 9f964ca..b923863 100644
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ b/drivers/dma-buf/heaps/heap-helpers.c
@@ -144,8 +144,9 @@ struct sg_table *dma_heap_map_dma_buf(struct dma_buf_attachment *attachment,
 
 	table = &a->table;
 
-	if (!dma_map_sg(attachment->dev, table->sgl, table->nents,
-			direction))
+	table->nents = dma_map_sg(attachment->dev, table->sgl,
+				  table->orig_nents, direction);
+	if (!table->nents)
 		table = ERR_PTR(-ENOMEM);
 	return table;
 }
@@ -154,7 +155,7 @@ static void dma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				   struct sg_table *table,
 				   enum dma_data_direction direction)
 {
-	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
+	dma_unmap_sg(attachment->dev, table->sgl, table->orig_nents, direction);
 }
 
 static vm_fault_t dma_heap_vm_fault(struct vm_fault *vmf)
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index acb26c6..ea0cf71 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -63,7 +63,8 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 					GFP_KERNEL);
 	if (ret < 0)
 		goto err;
-	if (!dma_map_sg(dev, sg->sgl, sg->nents, direction)) {
+	sg->nents = dma_map_sg(dev, sg->sgl, sg->orig_nents, direction);
+	if (!sg->nents) {
 		ret = -EINVAL;
 		goto err;
 	}
@@ -78,7 +79,7 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 static void put_sg_table(struct device *dev, struct sg_table *sg,
 			 enum dma_data_direction direction)
 {
-	dma_unmap_sg(dev, sg->sgl, sg->nents, direction);
+	dma_unmap_sg(dev, sg->sgl, sg->orig_nents, direction);
 	sg_free_table(sg);
 	kfree(sg);
 }
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
