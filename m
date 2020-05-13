Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BE41D153E
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 15:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD50D6EA3F;
	Wed, 13 May 2020 13:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E656EA3B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133316euoutp01434d5c315af7ebd00e1870a57fe99eaa~OmcZvgv-l2196321963euoutp01s
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 13:33:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200513133316euoutp01434d5c315af7ebd00e1870a57fe99eaa~OmcZvgv-l2196321963euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376796;
 bh=Z5gLJkSljhXNmPQ9jWUv3fhUlCfeFe9FNfcdvIxJHq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ri0JSXEnow+2gYdxavVmpedWPwdIz6DOXp7wTE8gR4J94fn0YIZrHCS9d/svkdbnX
 /4wamV8w2jz6aYakXbIdFzPb1RkyelLzdDvFw4TLaxBDLHehv5mNjQfgw+SlO2UeUu
 yZU8ZGXooJUiCPI1G+F9vu+ZeiKppv1UQw2vt9YQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200513133315eucas1p177968e928dcbb85dcadee53b0928885b~OmcZd7N-C0874908749eucas1p16;
 Wed, 13 May 2020 13:33:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id ED.D8.60698.B17FBBE5; Wed, 13
 May 2020 14:33:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200513133314eucas1p2f04e32d65e71c613a2a9aacb29064a7d~OmcYtUobS0359403594eucas1p2k;
 Wed, 13 May 2020 13:33:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133314eusmtrp1c87ff60195527af7bef8ce6ddc12e04c~OmcYsj-Ts1011910119eusmtrp1X;
 Wed, 13 May 2020 13:33:14 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-eb-5ebbf71bd417
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6D.1A.08375.A17FBBE5; Wed, 13
 May 2020 14:33:14 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133314eusmtip10bf7228f3d2f55fc25adf62669a28600~OmcYD2jvS3222032220eusmtip1-;
 Wed, 13 May 2020 13:33:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 25/38] drm: virtio: fix common struct sg_table related
 issues
Date: Wed, 13 May 2020 15:32:32 +0200
Message-Id: <20200513133245.6408-25-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfyyUcRzH973nnueec649HeU7knWLZEXSH8+Gph/a85da/ZG1urp4diyO
 3YNitaz8yCFixkxmMuTX+ZWfIUfOdXPyM0QYK9RNy49ofnTnif57fV+f92fvfb/74oioFrXG
 A+VhtEIuDRJjZty6rnX9SZvfzZJT870nyGS9lkNWZalQcrvuBUIOrixi5OvS9xwyr82d/Dqm
 RcjlwWkOWT0zjJIDTTkYWd45wSPbf86iZFFPLuYlpMpyywDVsprHpepXp1BqMlHDoWoKHlOf
 t2YQKn2kCFDNo9EYtdg6hFHPa0sAtVR9+IrghpmHPx0UGEErXM7eMQuYVK9zQlcdH+TnFKDR
 oPeIEvBxSJyBHYUTPBOLiGIAB+IdlcDMyMsANmZkctnBEoDjw4LdhbcbYwgbKgJwrduA7W18
 61MhphRGuEKlQYmZ2JKIBbA72dwUQog5DozbrAGmgQVxFQ6VGXYWuIQ9/FBQbPQ4LiQ8YY3O
 m22zg6WV73YifKNeGG/jsr6LB6tqAli+CEvXEgHLFnBBU8tj+RDUpSdxTb2QeArgtL6cxx6S
 jPd8kvVvwx2O6/9gpmKEOA5VTS6sPgeV2sUdDYl9cMSw36QRI6bVZSKsFsJncSI27QCzNRV7
 te0f+xGWKZjaGYuy79MBoD4xnpcK7LL/l+UBUAKs6HAmWEYzbnL6vjMjDWbC5TJnv5DgamD8
 S7otzUoDaN24qwYEDsTmwqlPzRIRKo1gIoPVAOKI2FLoozIqob80MopWhNxWhAfRjBrY4Fyx
 ldAtf/6WiJBJw+h7NB1KK3anHJxvHQ04HTmzrRU+vy4lezc5+F/zefSjkCcWRFL9uSsH52as
 UzZuYobtzWjfow+1FhNfJOF+o14ptt+3x2Uzpy/HhvbU6/iChjeTsoStaVXvBSZS4nugrSHp
 WI4kG1c79bXkJmRez/CLEaA2L5vBq7Sm8x6V+vzBGNuo3tkItJGw99SJuUyA1NUJUTDSvxPL
 0r1HAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsVy+t/xu7pS33fHGWz/YW7Re+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlks2G9t8ezWSWaLL1ceMllsenyN1eLyrjlsFmuP3GW3OPjhCavF
 8rPz2Bx4PdbMW8PosffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7ZgObx/t9V9k8
 +rasYvT4vEkugDtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSez
 LLVI3y5BL+P+oZ9MBd80KhbNWcLawHhesYuRk0NCwERiz59bzF2MXBxCAksZJVq3vmGDSMhI
 nJzWwAphC0v8udbFBlH0iVFi5c3JTCAJNgFDia63EAkRgU5GiWndH9lBHGaBD0wS//7+Axsl
 LBAg0fp0I9goFgFViVNLVjB2MXJw8ArYSmw+7QqxQV5i9YYDzCA2J1D41Z39LCC2kEC+xN7F
 +9gmMPItYGRYxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERgr24793LyD8dLG4EOMAhyMSjy8
 Frd2xwmxJpYVV+YeYpTgYFYS4fVbDxTiTUmsrEotyo8vKs1JLT7EaAp000RmKdHkfGAc55XE
 G5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYNRWiFnaZerw9ec1d0Ff
 Rvm/uUFBM7TYcr0bVL2i4+9ZKGmE7bF8XPMosPyy4ELnrenle6aIuQqfjtD+caRrcW7Z/wX3
 fztueerx4TDbZIXoJ5wa0e4bNprobZ51lHeLyLwgr0/SoW93qH8ustqnyb5p+/ugx0rrCkSF
 fH66ZAbLPY7SPmwhqMRSnJFoqMVcVJwIAG792A6rAgAA
X-CMS-MailID: 20200513133314eucas1p2f04e32d65e71c613a2a9aacb29064a7d
X-Msg-Generator: CA
X-RootMTR: 20200513133314eucas1p2f04e32d65e71c613a2a9aacb29064a7d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133314eucas1p2f04e32d65e71c613a2a9aacb29064a7d
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133314eucas1p2f04e32d65e71c613a2a9aacb29064a7d@eucas1p2.samsung.com>
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
---
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 36 +++++++++++++++++++--------------
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 12 +++++------
 2 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 6ccbd01..399556f 100644
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
index 9e663a5..e5765db 100644
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
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
