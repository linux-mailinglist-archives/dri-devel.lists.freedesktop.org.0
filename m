Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589AD25270B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72546E9FF;
	Wed, 26 Aug 2020 06:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE206E9F8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063530euoutp02b3b136e40fb9e657d8031923343bc7c6~uven0A8b91510015100euoutp02G
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200826063530euoutp02b3b136e40fb9e657d8031923343bc7c6~uven0A8b91510015100euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423730;
 bh=xw3K0/aFzn0fQ2snK5+3dg6k1O9SvppyMhipy/j8VoM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WZrUdgufa0Uq/qpOynGBNDc91Q+Nk+dtaNzEjQta8nsiMhtcMUFeb/oeOw57hvZRx
 Vd08AlVZEfooZESCC9S8mAOMAJpXr3abgckEeO6q1qzRNNdazGkYXkKtJuySINAtAV
 zJWVuxgfcokPMgzoDdl1S/MCOb3wGQd/bWRNAm74=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826063530eucas1p151753ef591c0baf0d38df8c6e74b012d~uvenoXLKX1803218032eucas1p1-;
 Wed, 26 Aug 2020 06:35:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 91.AD.05997.1B2064F5; Wed, 26
 Aug 2020 07:35:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063529eucas1p24a398fd2bacf53a33a14d7977a097f61~uvenQGe6O0403504035eucas1p2l;
 Wed, 26 Aug 2020 06:35:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826063529eusmtrp163a34829564d463bac5d5866e10a4d2f~uvenPT1lQ1091110911eusmtrp1G;
 Wed, 26 Aug 2020 06:35:29 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-b9-5f4602b13cfd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 13.C0.06314.1B2064F5; Wed, 26
 Aug 2020 07:35:29 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063529eusmtip2d947f557f7d2c641d8e5eeab19bf2992~uvemtKYcw0302303023eusmtip2u;
 Wed, 26 Aug 2020 06:35:29 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 04/32] drm: armada: fix common struct sg_table related
 issues
Date: Wed, 26 Aug 2020 08:32:48 +0200
Message-Id: <20200826063316.23486-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djPc7qbmNziDU42Mln0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hszg0dS+jxdojd9ktDn54wurA
 47Fm3hpGj8vXLjJ77P22gMVj+7cHrB73u48zeWxeUu9x+99jZo/JN5Yzeuy+2cDm0bdlFaPH
 501yAdxRXDYpqTmZZalF+nYJXBnfJ01gLzgvXnFn5jzmBsY9wl2MnBwSAiYSvzYtY+9i5OIQ
 EljBKHFqyXpGCOcLo0T/753MEM5nRom+bbfZYFr2LWtkg0gsZ5S4NvkcQsvE1bsYQarYBAwl
 ut52gXWICLQySpzo5QEpYhY4wCTR9u41E0hCWCBIYnn3O1YQm0VAVeLQ9W9gzbwCthIHJ01j
 hFgnL7F6wwFmEJtTwE7ieHc/2GoJgX3sEsem3WGBKHKRmP7/NVSDsMSr41vYIWwZidOTe1gg
 GpoZJR6eW8sO4fQwSlxumgHVYS1x59wvoLEcQPdpSqzfpQ8RdpS48/YMM0hYQoBP4sZbQZAw
 M5A5adt0qDCvREebEES1msSs4+vg1h68cIkZwvaQ2PuhGRrCExklln7YwDSBUX4WwrIFjIyr
 GMVTS4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxApPS6X/Hv+xg3PUn6RCjAAejEg/vAjbXeCHW
 xLLiytxDjBIczEoivE5nT8cJ8aYkVlalFuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1
 ILUIJsvEwSnVwNi46kBO9wTtsszAkBsfF7Qr81tebJ9d1t6wsTz8E3PoYw9tc8dntw0XlNw6
 8V5P4qW+XdO7VC8OkYjtvZufH7vqvG0X39+l2pPfRyoVH8zN2uph/7Jl4zzWNNOplWFTAk1s
 LmYu5ehcuOjpvD9z+eczV4Wss55m98poRXmjRZ3aZAET3kd9U5VYijMSDbWYi4oTAUd6ymhG
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsVy+t/xe7obmdziDeY/UrXoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZnFo6l5Gi7VH7rJbHPzwhNWB
 x2PNvDWMHpevXWT22PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HNo2/LKkaP
 z5vkArij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S
 9DK+T5rAXnBevOLOzHnMDYx7hLsYOTkkBEwk9i1rZOti5OIQEljKKLF4/3JmiISMxMlpDawQ
 trDEn2tdUEWfGCWuvbzDCJJgEzCU6HoLkRAR6GSUmNb9kR3EYRY4xiSx8NdHFpAqYYEAia9f
 ZoCNYhFQlTh0/RtYN6+ArcTBSdMYIVbIS6zecABsNaeAncTx7n42EFsIqOb02hnMExj5FjAy
 rGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMkW3Hfm7ewXhpY/AhRgEORiUe3gVsrvFCrIll
 xZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsRoCnTURGYp0eR8YPzmlcQbmhqaW1ga
 mhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpg5FjSVRipvniGslts4xw7uS6XS5+u
 vlub4f3z4fTWC8UeP7u+Wjx5eF/JfO+rBcpKtjEP9Wd2SnirdLlNYeNap/h5le5EpgnL57DI
 yrRv/GAg0fny2u0V75TtTGq0PTfFlf8xm7O+cO7lwAO1zlNnJ9pPMGKeaOl5T3L2PgvfXXsc
 W1n/rY0yUmIpzkg01GIuKk4EACbJ+oKnAgAA
X-CMS-MailID: 20200826063529eucas1p24a398fd2bacf53a33a14d7977a097f61
X-Msg-Generator: CA
X-RootMTR: 20200826063529eucas1p24a398fd2bacf53a33a14d7977a097f61
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063529eucas1p24a398fd2bacf53a33a14d7977a097f61
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063529eucas1p24a398fd2bacf53a33a14d7977a097f61@eucas1p2.samsung.com>
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

To avoid such issues, lets use a common dma-mapping wrappers operating
directly on the struct sg_table objects and use scatterlist page
iterators where possible. This, almost always, hides references to the
nents and orig_nents entries, making the code robust, easier to follow
and copy/paste safe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/armada/armada_gem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 8005614d2e6b..bedd8937d8a1 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -395,7 +395,7 @@ armada_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 
 		mapping = dobj->obj.filp->f_mapping;
 
-		for_each_sg(sgt->sgl, sg, count, i) {
+		for_each_sgtable_sg(sgt, sg, i) {
 			struct page *page;
 
 			page = shmem_read_mapping_page(mapping, i);
@@ -407,8 +407,8 @@ armada_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 			sg_set_page(sg, page, PAGE_SIZE, 0);
 		}
 
-		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0) {
-			num = sgt->nents;
+		if (dma_map_sgtable(attach->dev, sgt, dir, 0)) {
+			num = count;
 			goto release;
 		}
 	} else if (dobj->page) {
@@ -418,7 +418,7 @@ armada_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 
 		sg_set_page(sgt->sgl, dobj->page, dobj->obj.size, 0);
 
-		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0)
+		if (dma_map_sgtable(attach->dev, sgt, dir, 0))
 			goto free_table;
 	} else if (dobj->linear) {
 		/* Single contiguous physical region - no struct page */
@@ -449,11 +449,11 @@ static void armada_gem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
 	int i;
 
 	if (!dobj->linear)
-		dma_unmap_sg(attach->dev, sgt->sgl, sgt->nents, dir);
+		dma_unmap_sgtable(attach->dev, sgt, dir, 0);
 
 	if (dobj->obj.filp) {
 		struct scatterlist *sg;
-		for_each_sg(sgt->sgl, sg, sgt->nents, i)
+		for_each_sgtable_sg(sgt, sg, i)
 			put_page(sg_page(sg));
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
