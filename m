Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362FB2006A8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87216EC77;
	Fri, 19 Jun 2020 10:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4976EC6A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:10 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103708euoutp01e6e4f06912666eccdd3af596df03c1ff~Z66MOOzKs1849918499euoutp01b
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103708euoutp01e6e4f06912666eccdd3af596df03c1ff~Z66MOOzKs1849918499euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563028;
 bh=uyLNNIvv2MacHWbC1kIyq87V6/1Lwqz4qF9sgZlX0go=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fPglaMcpD1iqvVMRrPccRA8g+OUkJHEssvfUzTUdjVG99+1N2kqDpmEWpnTUEYyFE
 CItD+Km3Y6SKqwr+9eKJ0OU0KfL5elUyU9pK9PsT4fva8cFo0BGsSFv6DdbGoRuSj2
 2yCtdZSFYyhol0knRC11f0DKmz/ERYXUX2xhpNqg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200619103708eucas1p20bd7695ba9ab15e3512198e8a5ef4598~Z66L2FkqX3081430814eucas1p2v;
 Fri, 19 Jun 2020 10:37:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 98.9D.05997.4559CEE5; Fri, 19
 Jun 2020 11:37:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103708eucas1p2207ebc9373b820797675b91060a2a597~Z66LitD-v3081530815eucas1p2f;
 Fri, 19 Jun 2020 10:37:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103707eusmtrp138cd5bb658fd293d222a7d24344a0b3f~Z66LeRRGf0949709497eusmtrp1c;
 Fri, 19 Jun 2020 10:37:07 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-f5-5eec95547b8f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C0.1B.06017.3559CEE5; Fri, 19
 Jun 2020 11:37:07 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103707eusmtip27f073bab198a77cbcf9cf6569ae6a75b~Z66K0OCoz0302303023eusmtip2S;
 Fri, 19 Jun 2020 10:37:07 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 22/36] drm: virtio: fix common struct sg_table related
 issues
Date: Fri, 19 Jun 2020 12:36:22 +0200
Message-Id: <20200619103636.11974-23-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djP87ohU9/EGXSdE7boPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2eHbrJLPFlysPmSw2Pb7GanF51xw2i7VH7rJbHPzwhNVi
 +dl5bA68HmvmrWH02PttAYvH9m8PWD3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9s4HN4/2+q2we
 fVtWMXp83iQXwB3FZZOSmpNZllqkb5fAlXFjchtbwTP1inVLHrM3MF5Q6GLk5JAQMJFY+/c3
 SxcjF4eQwApGieZV35khnC+MEmfuNTB2MXIAOZ8ZJS4rwTSc/L0FqmY5o0TXgrWMcA13bm1g
 BKliEzCU6HrbxQZiiwi0Mkqc6OUBKWIWeMEk0fZ3M1iRsECQxL71R5lBbBYBVYnjx/rAbF4B
 O4mtD/awQqyTl1i94QBYnBMo/rrlICvIIAmBY+wSx2eeYoEocpHYde4QlC0s8er4FnYIW0bi
 9OQeFoiGZkaJh+fWskM4PUD/NM1ghKiylrhz7hcbyKPMApoS63fpQ4QdJV6962YBCUsI8Enc
 eCsIEmYGMidtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFD2B4S53b9YIOE0ERGiS1Xf7FPYJSf
 hbBsASPjKkbx1NLi3PTUYqO81HK94sTc4tK8dL3k/NxNjMDUdPrf8S87GHf9STrEKMDBqMTD
 +yLkdZwQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzFKc7AoifMaL3oZKySQ
 nliSmp2aWpBaBJNl4uCUamA0Mbw7Q0+Ap+2LskKM/sGIuwey3+5YmyCU7Pb+4vxq5ej/Du31
 KQ9bpP4+OarZ9G36RW/+7OLrCx12+97+HRrYePmm2iaZGe/0VZRXVLek/hT880q858dv0Ufc
 WZv2Xpbjv7tg6lzz7nIGnbCfzf7ibufOePFmHm7gm1z6+r7e0nvWx9av3jZHiaU4I9FQi7mo
 OBEA7hm+ukkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsVy+t/xe7rBU9/EGXx4ZW7Re+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8ezWSWaLL1ceMllsenyN1eLyrjlsFmuP3GW3OPjhCavF
 8rPz2Bx4PdbMW8PosffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7ZgObx/t9V9k8
 +rasYvT4vEkugDtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSez
 LLVI3y5BL+PG5Da2gmfqFeuWPGZvYLyg0MXIySEhYCJx8vcWZhBbSGApo8SUpRIQcRmJk9Ma
 WCFsYYk/17rYuhi5gGo+MUqs/juVBSTBJmAo0fUWIiEi0MkoMa37IzuIwyzwgUni399/bCBV
 wgIBEhuf32MCsVkEVCWOH+sDW8crYCex9cEeqBXyEqs3HACLcwLFX7ccZIU4yVZi+YL3zBMY
 +RYwMqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjJVtx35u2cHY9S74EKMAB6MSD++LkNdx
 QqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAp01ERmKdHkfGAc55XEG5oa
 mltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYLThv1RzMELvbONxvuuWm/5I
 7H8z9c/e3mKrRjbFrYWn439WHKzfdlRk8/nVT95lzXwmMuEiq9+dzRbMqxh25K7Wy9rwRrVR
 +4DzMaZQj9XVz+50By5UNNj5IGPTo0vCxwU+WpSFzdPx6r1mdVLo0Ld8s1+sYsfP1LnxeeYq
 Klk/6vjDZvuxL1yJpTgj0VCLuag4EQCZ6W+rqwIAAA==
X-CMS-MailID: 20200619103708eucas1p2207ebc9373b820797675b91060a2a597
X-Msg-Generator: CA
X-RootMTR: 20200619103708eucas1p2207ebc9373b820797675b91060a2a597
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103708eucas1p2207ebc9373b820797675b91060a2a597
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103708eucas1p2207ebc9373b820797675b91060a2a597@eucas1p2.samsung.com>
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
