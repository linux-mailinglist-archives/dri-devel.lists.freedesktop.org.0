Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C21FF750
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EB86EB67;
	Thu, 18 Jun 2020 15:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FC86EB74
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154030euoutp011614f70e31e6645dfb0e9c446ff69206~ZrZxZyeJs1844818448euoutp01C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:40:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200618154030euoutp011614f70e31e6645dfb0e9c446ff69206~ZrZxZyeJs1844818448euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494830;
 bh=uyLNNIvv2MacHWbC1kIyq87V6/1Lwqz4qF9sgZlX0go=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MbUSiVuaY+b6DEnudKkL37uaf5cbFec1tCDdi9zMniq/D1aYAIBi//w1G6hwrvRX0
 mAu0XleHPRNelbitAtiGxKvLCAYTDE4yIf8R1Gn2dQeJOlgrI9/vGz1dtfxXd997mG
 mkmQV3a3V6nz7ua3TC7++Kj5Gte5vw2/o9+PuC/c=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200618154029eucas1p1df4d85ef3db4ff468eae1dcfbcf846bf~ZrZxEwJZF1949419494eucas1p1I;
 Thu, 18 Jun 2020 15:40:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 39.60.60698.DEA8BEE5; Thu, 18
 Jun 2020 16:40:29 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154029eucas1p17fb1ca5aa5a7e12fbffd1ddb15632340~ZrZweWApC1248212482eucas1p1x;
 Thu, 18 Jun 2020 15:40:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200618154029eusmtrp2e6658a4cf23e96db2e3704d427dc9f33~ZrZwdufXz0399203992eusmtrp2g;
 Thu, 18 Jun 2020 15:40:29 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-3b-5eeb8aed183a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 01.FE.08375.DEA8BEE5; Thu, 18
 Jun 2020 16:40:29 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154028eusmtip19e3da39e73d31cc3970245060db901af~ZrZvzQ29e0833608336eusmtip1S;
 Thu, 18 Jun 2020 15:40:28 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 22/36] drm: virtio: fix common struct sg_table related
 issues
Date: Thu, 18 Jun 2020 17:39:43 +0200
Message-Id: <20200618153956.29558-23-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSeUhTcRzn997e2/NYvablD4uMhV2gJqt45pFGyaO/IiIkarryoZKbsnlk
 CIoXOrVSiVTKo5SZd1M20zLvKeZBXtOMspV4LTMPUDzafGr/fb6fg8+XL18C5WswWyJIGsbI
 pOJgAW7OUXes9jkYFLOis+qU81R6bxdCvc2uwqgtdQZKDS7P49SbsnaEKvjoSk2OdaHU0uAE
 Qqn0wxg1UP8CpyravnKp5j8/MUrZk4d78ujyvHJAf1gp4NCale8Y/S1Vi9A1RTH0l009Smfp
 lIBuGI3F6fnGIZx+XFsK6EXV0esWt83d/JngoAhG5uThZx6oy0rCQydPPqws0nNjQf8xBTAj
 IHkO/s1QYQpgTvDJEgBb+8a57LAEYMNGJ2CHRQDjWtPQ3UhOctyOoARQGRuP7EUyC8s5JhdO
 OkOFQYGbsDWZCGBnuqXJhJJTCEzaqAEmwYq8Aeea6rcxh7SH1cMjiAnzSA+YMj3CZevsYFl1
 03a1mZHv1iZiLN/BhTklIhZfgQvvh3EWW8EZbe1O9gjcepe/vR0k4wGc6K3gskMagANx2YB1
 ucLx3jVjmjCudxpW1TuxtBf8narDTDQk90Gd4YCJRo0wU/0cZWkeTE7is+4TMFdbuVfb3P95
 51o0LBo17Bw4A0B94Rr3KbDL/V9WAEApsGHC5ZIARi6UMpGOcrFEHi4NcLwfIlEB4zt1b2qX
 60Dj+r0WQBJAYMmbujkr4mPiCHmUpAVAAhVY8y73dIv4PH9x1CNGFuIrCw9m5C3gMMER2PCE
 r6bv8skAcRjzgGFCGdmuihBmtrHAxdtbrNToa7g+ditNngPlx21yferTHWpu5f+aKSq29x58
 fbXuULTPMy+z5kuubcUdVRdEnwzkD4v+yDtTC0L+/lG8wvei29Am70miX/fSque6/Vj7XFeC
 LvulS6ZlTvq6sCPaPdJu4NoyonEPTGixWPYQSvB+jI5xO3WQmlBtCjjyQLHzGVQmF/8DpcnI
 qUoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsVy+t/xu7pvu17HGXw7z2PRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8ezWSWaLL1ceMllsenyN1eLyrjlsFmuP3GW3OPjhCavF
 8rPz2Bx4PdbMW8PosffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7ZgObx/t9V9k8
 +rasYvT4vEkugDtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSez
 LLVI3y5BL+PG5Da2gmfqFeuWPGZvYLyg0MXIySEhYCIxs6OJsYuRi0NIYCmjxIcHW5kgEjIS
 J6c1sELYwhJ/rnWxQRR9YpSY3LQZrIhNwFCi6y1EQkSgk1FiWvdHdhCHWeADk8S/v/+AMhwc
 wgIBEs8aq0EaWARUJTZcuw7WzCtgJ9H58jo7xAZ5idUbDjCD2JxA8dPHW8E2CwnYSjz/0MY2
 gZFvASPDKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMBY2Xbs5+YdjJc2Bh9iFOBgVOLhfRHy
 Ok6INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxhNgY6ayCwlmpwPjOO8knhD
 U0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2MdrPuWE0+suTozJAFU3RD
 /upuFf//OYYn9tLugPTWhQv5gkqZX3zP3ST1vKRkjvxN+W2rX8e6f/zHNnGa0oR3xREOP1b6
 192vu83GMTdk8467pyV/Vn1nbxJ4HlPI/PFjQOGH9bHdEnUHMnJFbY5ONG1bnzrpmZnIlxsl
 t1keTRPSvNKZdefUZCWW4oxEQy3mouJEAJn1cl2rAgAA
X-CMS-MailID: 20200618154029eucas1p17fb1ca5aa5a7e12fbffd1ddb15632340
X-Msg-Generator: CA
X-RootMTR: 20200618154029eucas1p17fb1ca5aa5a7e12fbffd1ddb15632340
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154029eucas1p17fb1ca5aa5a7e12fbffd1ddb15632340
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154029eucas1p17fb1ca5aa5a7e12fbffd1ddb15632340@eucas1p1.samsung.com>
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
 David Airlie <airlied@linux.ie>, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
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
 drivers/gpu/drm/virtio/virtgpu_object.c | 36 ++++++++++++++-----------
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 12 ++++-----
 2 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 346cef5ce251..c3b9e3cf786e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -72,9 +72,8 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 
 		if (shmem->pages) {
 			if (shmem->mapped) {
-				dma_unmap_sg(vgdev->vdev->dev.parent,
-					     shmem->pages->sgl, shmem->mapped,
-					     DMA_TO_DEVICE);
+				dma_unmap_sgtable(vgdev->vdev->dev.parent,
+					     shmem->pages, DMA_TO_DEVICE, 0);
 				shmem->mapped = 0;
 			}
 
@@ -157,13 +156,13 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	}
 
 	if (use_dma_api) {
-		shmem->mapped = dma_map_sg(vgdev->vdev->dev.parent,
-					   shmem->pages->sgl,
-					   shmem->pages->nents,
-					   DMA_TO_DEVICE);
-		*nents = shmem->mapped;
+		ret = dma_map_sgtable(vgdev->vdev->dev.parent,
+				      shmem->pages, DMA_TO_DEVICE, 0);
+		if (ret)
+			return ret;
+		*nents = shmem->mapped = shmem->pages->nents;
 	} else {
-		*nents = shmem->pages->nents;
+		*nents = shmem->pages->orig_nents;
 	}
 
 	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
@@ -173,13 +172,20 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 		return -ENOMEM;
 	}
 
-	for_each_sg(shmem->pages->sgl, sg, *nents, si) {
-		(*ents)[si].addr = cpu_to_le64(use_dma_api
-					       ? sg_dma_address(sg)
-					       : sg_phys(sg));
-		(*ents)[si].length = cpu_to_le32(sg->length);
-		(*ents)[si].padding = 0;
+	if (use_dma_api) {
+		for_each_sgtable_dma_sg(shmem->pages, sg, si) {
+			(*ents)[si].addr = cpu_to_le64(sg_dma_address(sg));
+			(*ents)[si].length = cpu_to_le32(sg_dma_len(sg));
+			(*ents)[si].padding = 0;
+		}
+	} else {
+		for_each_sgtable_sg(shmem->pages, sg, si) {
+			(*ents)[si].addr = cpu_to_le64(sg_phys(sg));
+			(*ents)[si].length = cpu_to_le32(sg->length);
+			(*ents)[si].padding = 0;
+		}
 	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 9e663a5d9952..e5765db85c20 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -302,7 +302,7 @@ static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
 		return NULL;
 	}
 
-	for_each_sg(sgt->sgl, sg, *sg_ents, i) {
+	for_each_sgtable_sg(sgt, sg, i) {
 		pg = vmalloc_to_page(data);
 		if (!pg) {
 			sg_free_table(sgt);
@@ -603,9 +603,8 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
 	if (use_dma_api)
-		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
-				       shmem->pages->sgl, shmem->pages->nents,
-				       DMA_TO_DEVICE);
+		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
+					    shmem->pages, DMA_TO_DEVICE);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
@@ -1019,9 +1018,8 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
 	if (use_dma_api)
-		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
-				       shmem->pages->sgl, shmem->pages->nents,
-				       DMA_TO_DEVICE);
+		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
+					    shmem->pages, DMA_TO_DEVICE);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
