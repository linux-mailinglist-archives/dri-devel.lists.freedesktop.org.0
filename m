Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE922006AE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEA66EC79;
	Fri, 19 Jun 2020 10:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A1A6EC6F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:14 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103712euoutp021184861780b6dd710b5d5028e358bd7b~Z66P7PrSN2363023630euoutp02y
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200619103712euoutp021184861780b6dd710b5d5028e358bd7b~Z66P7PrSN2363023630euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563032;
 bh=oVvlfd4BWRvKpcZfemLuoBrPFcZ7vE33qi6qHPEMJzU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b9b4t8RXCv4eGlip0R3niGLbD/TJKwtr6BXqAS3B7EO4F/+ETNuMa3K81APrsp9cc
 9hinrEJQrUJLV/szadYpoWvnrKYc2jMyFOFYK9RbXYpqFMeQ/7j2XXyGVK5tyXZlvV
 +SJ900HqJI5t0kq+qwWRckYwE10haPsDLLtXzFYw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200619103712eucas1p2d53ba69124a5199f3c71a2015cd133bc~Z66Ps17751691016910eucas1p2H;
 Fri, 19 Jun 2020 10:37:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3A.AC.06456.8559CEE5; Fri, 19
 Jun 2020 11:37:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200619103712eucas1p1a29d1fe41061ed5b138a9cdd5d811419~Z66PVqbsQ0493704937eucas1p11;
 Fri, 19 Jun 2020 10:37:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103712eusmtrp1649acacc4079e1add3bb1309d8616cdc~Z66PU8nK20959609596eusmtrp1Y;
 Fri, 19 Jun 2020 10:37:12 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-69-5eec95584d02
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id EC.EA.06314.8559CEE5; Fri, 19
 Jun 2020 11:37:12 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103711eusmtip21a8ef39ebb1b53047eee9c0cc294336b~Z66OpqA0T0302603026eusmtip2T;
 Fri, 19 Jun 2020 10:37:11 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 28/36] dmabuf: fix common struct sg_table related issues
Date: Fri, 19 Jun 2020 12:36:28 +0200
Message-Id: <20200619103636.11974-29-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0gUYRTlm5mdGRfXpvX1pZa0YWCgJglNaGYiMeAfg8hIMtecVHTVdtSy
 P5ltFqv5TDIrWUIwd30/dsN8o22mruUrNc1nkS+sfIAW2q5j9u/cc869536Xj0TFLQI7MjIm
 npXHSKMluBDTvt0wuFzKWww+njPnQD8ydCJ0VX6FgN7WZqP0wNoyTpdoOhBa1exJfxvtROnV
 gSmErp4ZEtD99c9xOr2yTkCXtY8TdOuPWQH9fnyF8LFgSgtLAdO4rsKYsaEGnNGtTwqYiTQ9
 wtQU3WE+b82gTO5wMWDejCTjzHLTIM5k1KoBs1J9KMD8stArjI2OTGTlbt4hwojtnm4iLsv+
 VqWqGUkG9TZKQJKQ8oALSzIlMCPF1CsA11aClEBoxKsA9mvGCL5YATCvR0OYXKaGnrZynBeK
 Acws6ib2WrYfK1CTC6fcoXJJiZuwFXUfwHePzE0mlFKgUN18d0ewpPxh0UjjzliMcoKKBt0O
 FlHeMGtwHfBxjlBT2bIz1MzILyhaBaZBkBoi4Op8GsKb/KDmz3eMx5ZwXl+7u6sD7MpNx/iG
 ewBOGcoIvkg3Pi8lfzfCE44ZNnHTOVDKGVbUu/H0Wfgsp5Xgr2QBh5f2m2jUCHO0T1CeFsGH
 qWLefRQW6Mv3Yls/9KE8ZuDvTQPCXygbwMnUT1gWcCz4H6YCQA1s2QROFs5y7jHsTVdOKuMS
 YsJdr8XKqoHxX3Vt6X+9Bmt9oW2AIoHEXOQTuBAsFkgTuSRZG4AkKrES+fZ0BYtFYdKk26w8
 9qo8IZrl2oA9iUlsRSdezl0RU+HSeDaKZeNY+T8VIc3skoGqKqHc5UDDEUlw/cGlnyFuoX61
 Eizz8Iug0A1CNHFu/EG7fFgo7LAd03pkOF/wLW0KOP+xLiXjus65sHDb/4Z20XWi7Onp/ujs
 wK9e+y7G1SZ+KRid9Z9G1PqmHG+dndP0oE1Nbq/1qQmlgpy2rj7TGzXkeNJuMXOdW50q0BEl
 EoyLkLofQ+Wc9C/qpxiFUwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xe7oRU9/EGcxsZLHoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2eHbrJLPFlysPmSw2Pb7GanF51xw2i54NW1kt1h65y25x
 8MMTVotTdz+zO/B5rJm3htFj77cFLB53ru1h89j+7QGrx/3u40wem5fUe9z+95jZY/KN5Ywe
 u282sHm833eVzaNvyypGj8+b5AJ4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOt
 jEyV9O1sUlJzMstSi/TtEvQy/p89w14wQbpiw4L9TA2Mu8S6GDk5JARMJM4eWsfWxcjFISSw
 lFFizvm3LBAJGYmT0xpYIWxhiT/XuqCKPjFKzL+1kBkkwSZgKNH1FiIhItDJKDGt+yM7iMMs
 0MMscWnhF0aQKmEBb4klN/eyg9gsAqoSLXu2g9m8AnYSE65+Y4RYIS+xesMBsKmcQPHXLQfB
 VgsJ2EosX/CeeQIj3wJGhlWMIqmlxbnpucWGesWJucWleel6yfm5mxiBEbTt2M/NOxgvbQw+
 xCjAwajEw/si5HWcEGtiWXFl7iFGCQ5mJRFep7On44R4UxIrq1KL8uOLSnNSiw8xmgIdNZFZ
 SjQ5HxjdeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGBcZBL+d
 eD/hf7fSt95zzX5/A17c/LohyKcw/7zP+jUn4k/e7Ym2WspoafVi1+bqevtfDRm//ERmlPy+
 xleb51/5VydEPamhpvDeI8MpfxWeKx1+q/boybm0xH9hBXOMs4vOGGzbM+uEkyGzvxtL3rVF
 m+dqaXg+KFzNfuZg440NrfyKD2doTVNiKc5INNRiLipOBAAvRGJ1tgIAAA==
X-CMS-MailID: 20200619103712eucas1p1a29d1fe41061ed5b138a9cdd5d811419
X-Msg-Generator: CA
X-RootMTR: 20200619103712eucas1p1a29d1fe41061ed5b138a9cdd5d811419
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103712eucas1p1a29d1fe41061ed5b138a9cdd5d811419
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103712eucas1p1a29d1fe41061ed5b138a9cdd5d811419@eucas1p1.samsung.com>
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
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/dma-buf/heaps/heap-helpers.c | 13 ++++++-------
 drivers/dma-buf/udmabuf.c            |  7 +++----
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index 9f964ca3f59c..d0696cf937af 100644
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
index acb26c627d27..89e293bd9252 100644
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
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
