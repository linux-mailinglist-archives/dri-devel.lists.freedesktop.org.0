Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A6252737
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4DE6EA1C;
	Wed, 26 Aug 2020 06:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43F56E9FB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:41 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063540euoutp01a626f405d765c2862f44e915970392a4~uvexSbHrT2036420364euoutp01H
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826063540euoutp01a626f405d765c2862f44e915970392a4~uvexSbHrT2036420364euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423740;
 bh=fkZVc8mxrViKGq1m+SA4AMzfXtvDxoZigCi16n/nZN0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qRhovLhOxhAVGQLNt4TnUVgXkuUjgmJhcFeRVevxr6obRzE9QUouBbm/x0NQRNsxt
 3yKHRlIm7fgS6wtydp+deCionHj8SMFxnZfBoVWEsEC1Qn1PFeWyiGBz0rZ2P7x+dW
 OR9GPDVUDdyPp7M0zkdgiROhm3XJ4bviQaTqFqe0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200826063540eucas1p2c358f2e50627bbbc18d9796acfcdc51c~uvexApwGR0398303983eucas1p2W;
 Wed, 26 Aug 2020 06:35:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C4.BD.05997.CB2064F5; Wed, 26
 Aug 2020 07:35:40 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063539eucas1p2cb72ff20abae82c3e027833f958fd7a1~uvewoaD2e0398803988eucas1p2y;
 Wed, 26 Aug 2020 06:35:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200826063539eusmtrp2b1cd87ced431127ab25c1ac7b6caf444~uvewn0XjF0466204662eusmtrp2X;
 Wed, 26 Aug 2020 06:35:39 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-dc-5f4602bc4c92
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 97.53.06017.BB2064F5; Wed, 26
 Aug 2020 07:35:39 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063539eusmtip214ade432c4e70739a2f2694a482e2769~uvev__IqW0302003020eusmtip2r;
 Wed, 26 Aug 2020 06:35:39 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 20/32] drm: virtio: fix common struct sg_table related
 issues
Date: Wed, 26 Aug 2020 08:33:04 +0200
Message-Id: <20200826063316.23486-21-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djP87p7mNziDdafZ7XoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2eHbrJLPFlysPmSw2Pb7GanF51xw2i7VH7rJbHPzwhNVi
 +dl5bA68HmvmrWH02PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HN4/2+q2we
 fVtWMXp83iQXwB3FZZOSmpNZllqkb5fAlXF36nSmgmfqFY8OmjYwXlDoYuTkkBAwkfi98ilL
 FyMXh5DACkaJX5/XMUI4XxglLm19A+V8ZpSYvPQtO0zL6a7LrBCJ5YwSGz8dZ4Fr+fj3G1gV
 m4ChRNfbLjYQW0SglVHiRC8PSBGzwAsmiba/mxlBEsICQRJ3V/4As1kEVCVu9u8Hsjk4eAXs
 JA51JkFsk5dYveEAM4jNCRQ+3t3PBjJHQuAYu8Sv4wuYIIpcJK7d2cIGYQtLvDq+BepUGYn/
 O+czQTQ0M0o8PLeWHcLpYZS43DSDEaLKWuLOuV9sIJuZBTQl1u/Shwg7SjRe72ICCUsI8Enc
 eCsIEmYGMidtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFD2B4SG5veM0ECaCIwtOZtZJ/AKD8L
 YdkCRsZVjOKppcW56anFRnmp5XrFibnFpXnpesn5uZsYganp9L/jX3Yw7vqTdIhRgINRiYd3
 AZtrvBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCe
 WJKanZpakFoEk2Xi4JRqYKxuq+h02cvpNXd+mpnKvB23lV68eWkvcvTqxncHjghKf9RMqw55
 qXUkac4jw9u9vXo5P2a06Kt9vf9/1WZbxo7fUbcTZz993tQU03QsOWeJaeJCBp9v5ZmNPtX5
 zy87VH7a5xjqJRkkw6RyQVFn82r/eXv1vmU+5Di2z0Am70p4nYNGr5dGhRJLcUaioRZzUXEi
 ALGmim9JAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRmVeSWpSXmKPExsVy+t/xe7q7mdziDbYu1LDoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2eHbrJLPFlysPmSw2Pb7GanF51xw2i7VH7rJbHPzwhNVi
 +dl5bA68HmvmrWH02PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HN4/2+q2we
 fVtWMXp83iQXwB2lZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZ
 llqkb5egl3F36nSmgmfqFY8OmjYwXlDoYuTkkBAwkTjddZm1i5GLQ0hgKaPEyu7ZLBAJGYmT
 0xpYIWxhiT/XuthAbCGBT4wSc9+pgdhsAoYSXW9B4lwcIgKdjBLTuj+ygzjMAh+YJP79/QeU
 4eAQFgiQ+HUlC6SBRUBV4mb/fkaQMK+AncShziSI+fISqzccYAaxOYHCx7v7oXbZSpxeO4N5
 AiPfAkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIFRsu3Yzy07GLveBR9iFOBgVOLhXcDm
 Gi/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQDdNZJYSTc4HRnBeSbyh
 qaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQbGWXxv1p+uaXTR/8ge3Bjv
 8KI7X/LAG27pmUsEZy3+uvDnlO0/TKewPG9XnJYRHHpD16Nx9WOOGTYb9gRYvH5aLMbxuflr
 fkynrMfEqtNt25Z+n5gfbjV3/YoJc6u8C9k7DRg8OMITey33qyy6MHvG6tjk+N21i2TXOh2r
 z59wTNltavAUVaZqJZbijERDLeai4kQAo99vS6gCAAA=
X-CMS-MailID: 20200826063539eucas1p2cb72ff20abae82c3e027833f958fd7a1
X-Msg-Generator: CA
X-RootMTR: 20200826063539eucas1p2cb72ff20abae82c3e027833f958fd7a1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063539eucas1p2cb72ff20abae82c3e027833f958fd7a1
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063539eucas1p2cb72ff20abae82c3e027833f958fd7a1@eucas1p2.samsung.com>
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
index e83651b7747d..a0559d3ed362 100644
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
 
@@ -158,13 +157,13 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
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
@@ -174,13 +173,20 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
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
index 53af60d484a4..7947b1047bd0 100644
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
