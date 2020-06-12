Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E401F71C3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 03:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C62D6E0FA;
	Fri, 12 Jun 2020 01:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A006E0F2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 01:36:30 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id a45so3654429pje.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 18:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gDDZjyDo+my3LlCriwyTEtD1u694B/BCWGFE3c5hYe8=;
 b=I5qtmOqeJLGss0H30YBndWaz2TjxXcnF1/IGKG07M/HgG8XLjal7WJrZj7RdHTdgY/
 TFOWjyE3peSyhFg9BmfeI6PWXVbEW4ds/5qKsby14YvITAtXkVkSbLoytaEbQh4vENSj
 jLO5sjqOkjRUTYnO3T+ilcQO6SYQPSvkjSobM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gDDZjyDo+my3LlCriwyTEtD1u694B/BCWGFE3c5hYe8=;
 b=rJv1OTt6rtWfgZIfryaYRTqC3UftIV98tp0Wv7A6F1wmxpXkVb78NnhgK2KQq6o5W+
 ASr3BJqNCOM4P+8WqWLNDDlGdNOm2PAJcZSeLfETzBKRM+mFEy9td+ATtJXyFsMGVPSX
 udU4k+T21g2Dkydw7lCaWxnpU+ZAFPhuN7WG5TdZJiauaObSbanH86UdXEXRGZkciIFN
 thn2xhD9ddQYKYaZciGBATL3ZGg3spd46EzCeOlVVmT6kBSGLLWfQaNLnhVrMwqEzw/J
 oRl8zUPp6/ykiYA8balc5nEiW0+GQ9zAioeZENXdzMsoihBFIoexPOwRsHnJarM/Agbw
 4jtQ==
X-Gm-Message-State: AOAM530yLepe9qe0JmuYYBW8Axez+3aoEFnq7a1g1hR/J4vFTQGW6vPZ
 z5C15uJHFUjEiOARPG43I+mF95lhzEo=
X-Google-Smtp-Source: ABdhPJw7cpG9RFBZTTPx75vahhmWVKSxNibAtBVjKmmPW/Ss8Ih1rG+9az4sCahNdkLvpc3b3uiYgw==
X-Received: by 2002:a17:902:b187:: with SMTP id
 s7mr8643716plr.188.1591925790214; 
 Thu, 11 Jun 2020 18:36:30 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id c2sm4331535pfi.71.2020.06.11.18.36.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 11 Jun 2020 18:36:29 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/virtio: rely on drm shmem helpers to take care of
 dma_map/dma_unmap
Date: Thu, 11 Jun 2020 18:36:25 -0700
Message-Id: <20200612013625.547-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612013625.547-1-gurchetansingh@chromium.org>
References: <20200612013625.547-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Cc: daniel.vetter@ffwll.ch, kraxel@redhat.com, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes a double-free regression:

[    4.357928]  drm_gem_shmem_free_object+0xb4/0x100
[    4.358983]  virtio_gpu_dequeue_ctrl_func+0xd9/0x290
[    4.360343]  process_one_work+0x1d2/0x3a0
[    4.361581]  worker_thread+0x45/0x3c0
[    4.362645]  kthread+0xf6/0x130
[    4.363543]  ? process_one_work+0x3a0/0x3a0
[    4.364770]  ? kthread_park+0x80/0x80
[    4.365799]  ret_from_fork+0x35/0x40
[    4.367103] Modules linked in:
[    4.367958] CR2: 0000000000000018
[    4.368857] ---[ end trace db84f7a2974d5c79 ]---
[    4.370118] RIP: 0010:dma_direct_unmap_sg+0x1f/0x60

We can also go back to the prior state aswell.

Fixes: d323bb44e4d2 ("drm/virtio: Call the right shmem helpers")
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  1 -
 drivers/gpu/drm/virtio/virtgpu_object.c | 25 ++++++-------------------
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 12 ++++++------
 3 files changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 49bebdee6d91..66af5ea1304b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -78,7 +78,6 @@ struct virtio_gpu_object {
 struct virtio_gpu_object_shmem {
 	struct virtio_gpu_object base;
 	struct sg_table *pages;
-	uint32_t mapped;
 };
 
 #define to_virtio_gpu_shmem(virtio_gpu_object) \
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 346cef5ce251..ec42c5532910 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -69,16 +69,7 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 	if (virtio_gpu_is_shmem(bo)) {
 		struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
-
 		if (shmem->pages) {
-			if (shmem->mapped) {
-				dma_unmap_sg(vgdev->vdev->dev.parent,
-					     shmem->pages->sgl, shmem->mapped,
-					     DMA_TO_DEVICE);
-				shmem->mapped = 0;
-			}
-
-			sg_free_table(shmem->pages);
 			shmem->pages = NULL;
 			drm_gem_shmem_unpin(&bo->base.base);
 		}
@@ -123,6 +114,7 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 						size_t size)
 {
+	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_object_shmem *shmem;
 	struct drm_gem_shmem_object *dshmem;
 
@@ -133,6 +125,7 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 	dshmem = &shmem->base.base;
 	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
 	dshmem->map_cached = true;
+	dshmem->skip_dma_api = virtio_has_iommu_quirk(vgdev->vdev);
 	return &dshmem->base;
 }
 
@@ -141,7 +134,6 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 					struct virtio_gpu_mem_entry **ents,
 					unsigned int *nents)
 {
-	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
 	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 	struct scatterlist *sg;
 	int si, ret;
@@ -156,15 +148,10 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 		return -EINVAL;
 	}
 
-	if (use_dma_api) {
-		shmem->mapped = dma_map_sg(vgdev->vdev->dev.parent,
-					   shmem->pages->sgl,
-					   shmem->pages->nents,
-					   DMA_TO_DEVICE);
-		*nents = shmem->mapped;
-	} else {
+	if (!bo->base.skip_dma_api)
+		*nents = bo->base.dma_map_count;
+	else
 		*nents = shmem->pages->nents;
-	}
 
 	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
 			      GFP_KERNEL);
@@ -174,7 +161,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	}
 
 	for_each_sg(shmem->pages->sgl, sg, *nents, si) {
-		(*ents)[si].addr = cpu_to_le64(use_dma_api
+		(*ents)[si].addr = cpu_to_le64(!bo->base.skip_dma_api
 					       ? sg_dma_address(sg)
 					       : sg_phys(sg));
 		(*ents)[si].length = cpu_to_le32(sg->length);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 9e663a5d9952..117e4aa69ae5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -599,12 +599,12 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
 	struct virtio_gpu_transfer_to_host_2d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
-	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
 	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
-	if (use_dma_api)
+	if (!bo->base.skip_dma_api)
 		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
-				       shmem->pages->sgl, shmem->pages->nents,
+				       shmem->pages->sgl,
+				       bo->base.dma_map_count,
 				       DMA_TO_DEVICE);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
@@ -1015,12 +1015,12 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
 	struct virtio_gpu_transfer_host_3d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
-	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
 	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
-	if (use_dma_api)
+	if (!bo->base.skip_dma_api)
 		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
-				       shmem->pages->sgl, shmem->pages->nents,
+				       shmem->pages->sgl,
+				       bo->base.dma_map_count,
 				       DMA_TO_DEVICE);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
