Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E8E1CF095
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DA86E8FC;
	Tue, 12 May 2020 09:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769666E8EF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:27 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090125euoutp016dc1e6188c2ebaac7e13b77e23737bae~OPFxKC97j2633726337euoutp01b
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200512090125euoutp016dc1e6188c2ebaac7e13b77e23737bae~OPFxKC97j2633726337euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274085;
 bh=HXV6DfP6M7MgobG4aNw3GNaiHgLAyi6PJREq1GSuo24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VUCS8q9PAiyMYgWOeo+p5FYDrOhvM6SOO7Gi5n8hAr66td+Z0Cq2KyAVELa7fv/D2
 7edTcIv4Rj1k+WoqtCl43WynLFMSBEzwiFwLKhobrucD7FuQhQvlwyRklHWYhqwomf
 +IVW2+o9li6OQd6qJHFb/h9kSxiwWqrvVPjQ3b40=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200512090125eucas1p237325d75171e6cbb4ace54131e46acf9~OPFw2PZHn1371013710eucas1p2Y;
 Tue, 12 May 2020 09:01:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id FA.67.61286.5E56ABE5; Tue, 12
 May 2020 10:01:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200512090124eucas1p20509113bdbdd1070d8265aa1af80e64a~OPFwlssNg2180021800eucas1p2t;
 Tue, 12 May 2020 09:01:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512090124eusmtrp21a85ccdb539dc0869f960dc228bdd281~OPFwk-FMW0472504725eusmtrp2X;
 Tue, 12 May 2020 09:01:24 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-a3-5eba65e5ff71
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6B.45.08375.4E56ABE5; Tue, 12
 May 2020 10:01:24 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090124eusmtip13b83891d533f757d460e4af869f099c5~OPFwA9rAH1257212572eusmtip1v;
 Tue, 12 May 2020 09:01:24 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 30/38] dmabuf: fix common struct sg_table related issues
Date: Tue, 12 May 2020 11:00:50 +0200
Message-Id: <20200512090058.14910-30-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRmVeSWpSXmKPExsWy7djP87pPU3fFGVybxWPRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8ezWSWaLL1ceMllsenyN1eLyrjlsFj0btrJarD1yl93i
 4IcnrBan7n5md+DzWDNvDaPH3m8LWDzuXNvD5rH92wNWj/vdx5k8Ni+p97j97zGzx+Qbyxk9
 dt9sYPN4v+8qm0ffllWMHp83yQXwRHHZpKTmZJalFunbJXBlvPx2gLWgU6bi4eLYBsZl4l2M
 nBwSAiYSc/etYO5i5OIQEljBKPGw/S4jhPOFUeLSrK9Qmc+MEpdfrWeGaZn44QUbRGI5o8TJ
 fc1scC0nN9xkAaliEzCU6HrbxQZiiwi0Mkqc6OUBKWIWaGGWWLW/ESwhLOAtcfHmLzCbRUBV
 4lvLSbAVvAJ2EnMvr2WCWCcvsXrDAbA4J1D8/vw/LCCDJATOsUu0P9gFVeQiMWvHOhYIW1ji
 1fEt7BC2jMT/nfOZIBqagd47t5YdwukB+qhpBiNElbXEnXMgZ3AA3acpsX6XPkTYUeJc9ylG
 kLCEAJ/EjbeCIGFmIHPStunMEGFeiY42IYhqNYlZx9fBrT144RJUiYfE26XZkAA6yihx/cha
 pgmM8rMQdi1gZFzFKJ5aWpybnlpsmJdarlecmFtcmpeul5yfu4kRmK5O/zv+aQfj10tJhxgF
 OBiVeHg7jHbGCbEmlhVX5h5ilOBgVhLhbckECvGmJFZWpRblxxeV5qQWH2KU5mBREuc1XvQy
 VkggPbEkNTs1tSC1CCbLxMEp1cCoPGuV2TvZYK57HwI/b7+Z+erLyu7v6dcSd7ZMP3bWWd70
 kvmDqj5De74rgdLJS7XfuDJx7/ywfKVrxrGNb73XNv7x6O3/9GU9Oz/T4tXunduNpxt0GNkt
 +2nbpNjkrLu6XdvXIuOvSbzbM4XjTJxCXzestg37+cHJYu6yowEx5XVWFno7LGuUWIozEg21
 mIuKEwF7szfpUwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xu7pPUnfFGUx4aWHRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8ezWSWaLL1ceMllsenyN1eLyrjlsFj0btrJarD1yl93i
 4IcnrBan7n5md+DzWDNvDaPH3m8LWDzuXNvD5rH92wNWj/vdx5k8Ni+p97j97zGzx+Qbyxk9
 dt9sYPN4v+8qm0ffllWMHp83yQXwROnZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8da
 GZkq6dvZpKTmZJalFunbJehlvPx2gLWgU6bi4eLYBsZl4l2MnBwSAiYSEz+8YAOxhQSWMkrc
 nB0KEZeRODmtgRXCFpb4c60LqIYLqOYTo8S1O0/AEmwChhJdbyESIgKdjBLTuj+ygzjMAj3M
 EpcWfmEEqRIW8Ja4ePMX2AoWAVWJby0nmUFsXgE7ibmX1zJBrJCXWL3hAFicEyh+f/4fFoiT
 CiUeXX3LMoGRbwEjwypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzA6Nl27OfmHYyXNgYfYhTg
 YFTi4e0w2hknxJpYVlyZe4hRgoNZSYS3JRMoxJuSWFmVWpQfX1Sak1p8iNEU6KiJzFKiyfnA
 yM4riTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cDYYvJur+1+Ez7X
 Bh/uDZkP2dP3XP0lLiywPnl+XfCvZzWHRIMObm22mCuxZ/bec0yyuar2n3vmOYQxv5lY8ipK
 e7F2M7vCvYT1AacyTh8wXakRuGzSvLtFN/+7LrDJbX++jvlDAf/+hxFTZxgcYt/xbecm43pe
 a9kz01q3tCnoB64UaNZvvDRfiaU4I9FQi7moOBEA3Lt3Y7QCAAA=
X-CMS-MailID: 20200512090124eucas1p20509113bdbdd1070d8265aa1af80e64a
X-Msg-Generator: CA
X-RootMTR: 20200512090124eucas1p20509113bdbdd1070d8265aa1af80e64a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090124eucas1p20509113bdbdd1070d8265aa1af80e64a
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090124eucas1p20509113bdbdd1070d8265aa1af80e64a@eucas1p2.samsung.com>
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
For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
---
 drivers/dma-buf/heaps/heap-helpers.c | 13 ++++++-------
 drivers/dma-buf/udmabuf.c            |  7 +++----
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index 9f964ca..be9523a 100644
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
+	ret = dma_map_sgtable(attachment->dev, table, direction);
+	if (ret)
+		table = ERR_PTR(ret);
 	return table;
 }
 
@@ -154,7 +153,7 @@ static void dma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				   struct sg_table *table,
 				   enum dma_data_direction direction)
 {
-	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
+	dma_unmap_sgtable(attachment->dev, table, direction);
 }
 
 static vm_fault_t dma_heap_vm_fault(struct vm_fault *vmf)
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index acb26c6..5bcbf7a 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -63,10 +63,9 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 					GFP_KERNEL);
 	if (ret < 0)
 		goto err;
-	if (!dma_map_sg(dev, sg->sgl, sg->nents, direction)) {
-		ret = -EINVAL;
+	ret = dma_map_sgtable(dev, sg, direction);
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
+	dma_unmap_sgtable(dev, sg, direction);
 	sg_free_table(sg);
 	kfree(sg);
 }
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
