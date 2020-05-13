Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873A1D154C
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909066EA55;
	Wed, 13 May 2020 13:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DCA6EA3B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:20 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133319euoutp027ee8b306650f9b59c9bbc79fc35b0163~Omcc5d7bn0033500335euoutp02e
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200513133319euoutp027ee8b306650f9b59c9bbc79fc35b0163~Omcc5d7bn0033500335euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376799;
 bh=Lxat/cHNFCaPnCTiGbzTboPtTOwp4VgCujx0aicrwjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D7jEl/Ue5PRCgr4GrfQUCJr+LsbqHZTJXqQliW1b1HXFTFDSgU0bsicvBCtHItGQP
 HFTM2m8A/zP2enmuMRLPiR/qDLOuRBJvQa4ZKQ/yDhXQ31YHP8ggS6pq7XRCLO4Fuf
 4toTu7d+fRXYX8QVDx1WIgvP6IC57CBcWaNXz5KQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200513133319eucas1p22be5456f62df1768a9c90da8a4cd4d85~OmcchOCrT1832718327eucas1p2k;
 Wed, 13 May 2020 13:33:19 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 25.D5.61286.E17FBBE5; Wed, 13
 May 2020 14:33:19 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133318eucas1p1dd6c1ac6a777874c115070d8b5197f34~OmccOWi5C0874908749eucas1p1C;
 Wed, 13 May 2020 13:33:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133318eusmtrp15d3d3fa1fbb26e7094d0a572b26e0a71~OmccNgAPR1050610506eusmtrp1Y;
 Wed, 13 May 2020 13:33:18 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-74-5ebbf71e36bb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D8.47.07950.E17FBBE5; Wed, 13
 May 2020 14:33:18 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133317eusmtip1357abafa80a7b15e4d3caea89056f39b~OmcbgtxCp0693306933eusmtip1J;
 Wed, 13 May 2020 13:33:17 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 30/38] dmabuf: fix common struct sg_table related issues
Date: Wed, 13 May 2020 15:32:37 +0200
Message-Id: <20200513133245.6408-30-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSeUhUURTGufNWl7HXqHgxSRoySEuTgh6YoVTwIAohAg0yR32ouc9zSQ0c
 l8RGLU1MEZPBMh3XcUnDbVxSU8lkNHOtTNMSTXHF/tDm9dT++87vfOd+h8MlEUkbZkkGhESw
 8hBZkBQ3RBt6dj6etd5u9jw3eoLOGOwT0TV51Ri915CF0CObKzitLu8W0SqtEz0/0YfQGyMz
 Irp2dhSjh5sKcDpd8wajK99NE3TH6hxG90+vEy4mTEVhBWBat1QoMzXagjONW98w5mtar4ip
 exXPTO7OIkz2WAlgmscVOLPS9glnntSXAWa99rib8R3DS75sUEAUK3e47GXoP5IXF/bc6oEm
 ux9VgGoLJTAgIXUB5vbsYLyWUKUAdn+4pgSGer0BYMnCPC4U6wAqcypFBxMNKiUhNEoATJlM
 Jg5Hmp+uE7wLpxyhclmJ89qMegTg+wxj3oRQyQgs0yb8a5hS12Hij0Z9OEmilA3UlMt5LKac
 YX5aOyakWcNyTTvCawM9X5zSovw7kNIRUF1TgwumqzBP+RIRtClc7K0nBG0FB7LT9weSAJwZ
 rCSEIh3A4cQ8ILic4NTgH5zfAqFOw+omBwG7wv6CJBGPIWUCx5aP8hjRy2cNuYiAxTA1RSK4
 T8H83qrD2I4h3f46DJxRLKDCgbr09y1NwDKBdf7/MBUAZcCCjeSC/VjOMYSNtudkwVxkiJ+9
 T2hwLdD/qoHd3rW3YFPn3QkoEkiNxfREs6cEk0VxMcGdAJKI1Ex8s1qPxL6ymFhWHnpPHhnE
 cp3gGIlKLcTni37dlVB+sgg2kGXDWPlBV0QaWCqAOXHb8vfojfaiCS8fjbfdkYvxQ7ZGS+Ir
 85ld8Taq7bnJYbdc98zHUe66/qrA6JxNZxtXbaJ5rCzcpKUlq9DVZG2esFMvjbx04s54JFkU
 n7TVDrl47H158d0LjbtV8VoRIw/TTf582Jn12Sg7ubVmtTg81Vhl5TCuRuvuJ7lHKKQo5y9z
 tEXknOwvAN1Qr1EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xu7py33fHGXT+UbfoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2eHbrJLPFlysPmSw2Pb7GanF51xw2i54NW1kt1h65y25x
 8MMTVotTdz+zO/B5rJm3htFj77cFLB53ru1h89j+7QGrx/3u40wem5fUe9z+95jZY/KN5Ywe
 u282sHm833eVzaNvyypGj8+b5AJ4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOt
 jEyV9O1sUlJzMstSi/TtEvQyrsyoLpgmU7Fh8imWBsb14l2MnBwSAiYS2xZ0sXcxcnEICSxl
 lDj/+xYTREJG4uS0BlYIW1jiz7UuNoiiT4wSs1q3gBWxCRhKdL2FSIgIdDJKTOv+CDaKWaCH
 WeLSwi+MIFXCAt4STU+3A43i4GARUJXYsLoIJMwrYCsxq/sA1AZ5idUbDjCD2JxA8Vd39rOA
 2EIC+RJ7F+9jm8DIt4CRYRWjSGppcW56brGRXnFibnFpXrpecn7uJkZg9Gw79nPLDsaud8GH
 GAU4GJV4eC1u7Y4TYk0sK67MPcQowcGsJMLrtx4oxJuSWFmVWpQfX1Sak1p8iNEU6KaJzFKi
 yfnAyM4riTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cCoX5b0/O8x
 /4D676crGiu8bMz/mR+3F872yyn7u1DW+HWeoqB7cC7PpZc2GqeOr9z+bn+Z//H7Lx9Ov7Jv
 R+LN2ger/n1qve2v3abtFmModNfypqvGZgvLw1tMb/FucF1iuPDUx5Y6O6PeC9NP7ApUZSmK
 kmn58k471Xzr0tsz29Ty7O6ceMKhxFKckWioxVxUnAgAnEr/zbQCAAA=
X-CMS-MailID: 20200513133318eucas1p1dd6c1ac6a777874c115070d8b5197f34
X-Msg-Generator: CA
X-RootMTR: 20200513133318eucas1p1dd6c1ac6a777874c115070d8b5197f34
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133318eucas1p1dd6c1ac6a777874c115070d8b5197f34
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133318eucas1p1dd6c1ac6a777874c115070d8b5197f34@eucas1p1.samsung.com>
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
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
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
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/dma-buf/heaps/heap-helpers.c | 13 ++++++-------
 drivers/dma-buf/udmabuf.c            |  7 +++----
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index 9f964ca..d0696cf 100644
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ b/drivers/dma-buf/heaps/heap-helpers.c
@@ -140,13 +140,12 @@ struct sg_table *dma_heap_map_dma_buf(struct dma_buf_attachment *attachment,
 				      enum dma_data_direction direction)
 {
 	struct dma_heaps_attachment *a = attachment->priv;
-	struct sg_table *table;
-
-	table = &a->table;
+	struct sg_table *table = &a->table;
+	int ret;
 
-	if (!dma_map_sg(attachment->dev, table->sgl, table->nents,
-			direction))
-		table = ERR_PTR(-ENOMEM);
+	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	if (ret)
+		table = ERR_PTR(ret);
 	return table;
 }
 
@@ -154,7 +153,7 @@ static void dma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				   struct sg_table *table,
 				   enum dma_data_direction direction)
 {
-	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
+	dma_unmap_sgtable(attachment->dev, table, direction, 0);
 }
 
 static vm_fault_t dma_heap_vm_fault(struct vm_fault *vmf)
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index acb26c6..89e293b 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -63,10 +63,9 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 					GFP_KERNEL);
 	if (ret < 0)
 		goto err;
-	if (!dma_map_sg(dev, sg->sgl, sg->nents, direction)) {
-		ret = -EINVAL;
+	ret = dma_map_sgtable(dev, sg, direction, 0);
+	if (ret < 0)
 		goto err;
-	}
 	return sg;
 
 err:
@@ -78,7 +77,7 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 static void put_sg_table(struct device *dev, struct sg_table *sg,
 			 enum dma_data_direction direction)
 {
-	dma_unmap_sg(dev, sg->sgl, sg->nents, direction);
+	dma_unmap_sgtable(dev, sg, direction, 0);
 	sg_free_table(sg);
 	kfree(sg);
 }
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
