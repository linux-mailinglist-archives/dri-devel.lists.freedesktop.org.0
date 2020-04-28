Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7291BBF03
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 15:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76B96E422;
	Tue, 28 Apr 2020 13:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86ED86E423
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:20:34 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200428132033euoutp01702c615ee28a12583aef9c4e8e165008~J-mBPCa3s1886118861euoutp01I
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:20:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200428132033euoutp01702c615ee28a12583aef9c4e8e165008~J-mBPCa3s1886118861euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588080033;
 bh=W1cooQvBlT6u8ezdjLvm+dB0V90PbzJlXZ1A87QbWGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B1o9LdgvkDl+bDAQ1Zo3mJbGWjVT0tYh4GM+CZD2JHRmJBxDNNEszg2LFTkraaWQ9
 7va8eiqBhfaUfZu8KiXs12f7fuMJkDg8HFRleGQoLyPQZC06WgEM7ne0NWZqYwaTjg
 L/DZpwq+ENhDM7AszBmFtVyHapNiuUo/r7OdfGRE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200428132032eucas1p2488259606ff3e4dad28e7de81cfe4baa~J-mA2SEnw2653326533eucas1p2S;
 Tue, 28 Apr 2020 13:20:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AE.26.60698.0AD28AE5; Tue, 28
 Apr 2020 14:20:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200428132032eucas1p17c2b93daf91c95c41650e75b251d525c~J-mAm0ZZa1368113681eucas1p1R;
 Tue, 28 Apr 2020 13:20:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200428132032eusmtrp2a527f876c3f2d680c57d874708de8d31~J-mAmDBus2140221402eusmtrp2b;
 Tue, 28 Apr 2020 13:20:32 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-9d-5ea82da01ffa
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A7.E3.07950.0AD28AE5; Tue, 28
 Apr 2020 14:20:32 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200428132031eusmtip2b5690c9c67116c2ec0e00c4bc3216f63~J-mACdxOH1116911169eusmtip2b;
 Tue, 28 Apr 2020 13:20:31 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [RFC 17/17] dmabuf: fix sg_table nents vs. orig_nents misuse
Date: Tue, 28 Apr 2020 15:20:05 +0200
Message-Id: <20200428132005.21424-18-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428132005.21424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRmVeSWpSXmKPExsWy7djPc7oLdFfEGVzr0rPoPXeSyWLp+kZ2
 i40z1rNaNB06xWbxf9tEZosrX9+zWaxcfZTJYvaEzUwWC/ZbW3y58pDJYtPja6wWl3fNYbNY
 e+Quu8XBD09YLU7d/czuwO+xZt4aRo+93xaweNy5tofNY/u3B6we97uPM3lsXlLvcfvfY2aP
 yTeWM3rsvtnA5tG3ZRWjx+dNcgHcUVw2Kak5mWWpRfp2CVwZJ88sYirYL1yxaGYjYwPjSoEu
 Rk4OCQETiTMn3jB2MXJxCAmsYJR40ToVyvnCKDH35wVmCOczo8Sdr2uZYFquPLzHApFYziix
 Zdt3JriWhm9LwKrYBAwlut52sYHYIgKtjBInenlAipgFtjFLPFl+hB0kISzgKrFjywJWEJtF
 QFVi8+atzCA2r4CdxNKGh2wQ6+QlVm84ABbnBIk/egoVv8Qu8aMlDMJ2kbhzcA/UecISr45v
 YYewZST+75wPdp2EQDOjxMNza9khnB5GictNMxghqqwl7pz7BTSVA+g8TYn1u/RBTAkBR4kr
 h1ghTD6JG28FQYqZgcxJ26YzQ4R5JTrahCBmqEnMOr4ObuvBC5eYIWwPiTe3prBDwmcio8TR
 LW9YJzDKz0LYtYCRcRWjeGppcW56arFxXmq5XnFibnFpXrpecn7uJkZgujr97/jXHYz7/iQd
 YhTgYFTi4d3AsyJOiDWxrLgy9xCjBAezkgjvo4xlcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5
 jRe9jBUSSE8sSc1OTS1ILYLJMnFwSjUw8tTcmldqUOKySi/5gHlzgK3j39s87tPS4/uCNEyE
 Vt249jf58qqXa/yee/kYcbz1rX5jcKqLaZPW9pUX/aYxBvks7k7RfvIuYUP1Bv3nxn2Xy3UW
 z/my1i8wOfvR2YAPMw9tqbMzX1g5R8hDZJHGqbkyN533TW1++smWu3xiTLmB23vW6L7zSizF
 GYmGWsxFxYkAKWHGIVMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xe7oLdFfEGUzZJ2/Re+4kk8XS9Y3s
 FhtnrGe1aDp0is3i/7aJzBZXvr5ns1i5+iiTxewJm5ksFuy3tvhy5SGTxabH11gtLu+aw2ax
 9shddouDH56wWpy6+5ndgd9jzbw1jB57vy1g8bhzbQ+bx/ZvD1g97ncfZ/LYvKTe4/a/x8we
 k28sZ/TYfbOBzaNvyypGj8+b5AK4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOt
 jEyV9O1sUlJzMstSi/TtEvQyTp5ZxFSwX7hi0cxGxgbGlQJdjJwcEgImElce3mPpYuTiEBJY
 yihx79VJZoiEjMTJaQ2sELawxJ9rXWwQRZ8YJZ5sfsMIkmATMJToeguREBHoZJSY1v2RHcRh
 FjjALNF9/iQTSJWwgKvEji0LwEaxCKhKbN68FWwFr4CdxNKGh2wQK+QlVm84ABbnBIk/egoU
 5wBaZytxuSV3AiPfAkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIHxs+3Yzy07GLveBR9i
 FOBgVOLh3cCzIk6INbGsuDL3EKMEB7OSCO+jjGVxQrwpiZVVqUX58UWlOanFhxhNgW6ayCwl
 mpwPjO28knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2MfTW39hzO
 mxy01EE76EWz3dGUqnuftJNOBSv8ebYjt4dt2cwXa/9s+f2j8pVC7MWVX4RU76qtNNMp/r+1
 t8thX422iuiukxu6pBMLDq2J/vJtxYcbTwvv9TPk3N3+5QyDzb8tjhN3eWy4Xf+n8qRsV6mF
 qf3XUvX82csYS+3/FtWUXZp/ZtriO0osxRmJhlrMRcWJAGKr1d21AgAA
X-CMS-MailID: 20200428132032eucas1p17c2b93daf91c95c41650e75b251d525c
X-Msg-Generator: CA
X-RootMTR: 20200428132032eucas1p17c2b93daf91c95c41650e75b251d525c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200428132032eucas1p17c2b93daf91c95c41650e75b251d525c
References: <20200428132005.21424-1-m.szyprowski@samsung.com>
 <CGME20200428132032eucas1p17c2b93daf91c95c41650e75b251d525c@eucas1p1.samsung.com>
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
