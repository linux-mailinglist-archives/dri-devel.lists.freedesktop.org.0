Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 210EF179D54
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 02:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F2D6E027;
	Thu,  5 Mar 2020 01:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A276E027
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 01:32:18 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id j7so1900163plt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 17:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4UHhd34bD8i5Z30SnRr90EuhkgML0vIOkj+0Jz7yfo=;
 b=CkW67HJbOpTLdppybPh4SsX0QI0O1qqtp3SKoDhASkaFattSzQ0/8IgFvB6jMQILK0
 7RGr2iNBFn9vSjYbjQb8jnCpF5q/zYhpo9H3FAesZLoIP/hx9TneR5llSOqekUnpyvjf
 R5+ul/kPcgl9xUYFEo+g6Bxye5p4TIGHa99eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4UHhd34bD8i5Z30SnRr90EuhkgML0vIOkj+0Jz7yfo=;
 b=N/LalFrAxBiDR0yYIynXb/pWdiKj8y8ufPnhVRZFfMeHRJo1lTmSMF4r+KKsFb3Yp7
 0TC8MqhlIYi8TXCrQFBvbAhcoiBqutJvJ3g3BVcokxOPNx5rD3xL3ts0lKEfxWKdK4QI
 +zgJPnLa125d9KHqrZzCl2Ej3ZhOpkyT5Mc5mhoyS3mq92gj/0F07rOAPJH/bsYoGcoK
 F7AXqiDE0JDBaXDIC0HvyWqbT8cFW5qGPm2PPJtl8LjX6sGVNf9HowiIfdQaW1ztU33q
 +jpN5nnJimeJxGlhR1f9SbzsJ3eG9duRvleKhTaWOVVs/aE8ejknh0+qHCEzl+2xiecE
 G6MA==
X-Gm-Message-State: ANhLgQ2Nw11kV60G+PV1GblR+Xtov32Dp/nrPRMZrU9++9vrllyeLeQR
 gP3cR5FJIqcn7dhcurAlsrhMWkzuyEM=
X-Google-Smtp-Source: ADFU+vuD4tirntFXP9bTwuzLHasIFTByDO98QqmSIphvEF+//Fm8bl8VCf72vVGAGWaj76DDCW2Nyg==
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr5952298pjn.8.1583371937893; 
 Wed, 04 Mar 2020 17:32:17 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id x9sm4763478pfa.60.2020.03.04.17.32.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 04 Mar 2020 17:32:17 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/virtio: factor out the sg_table from
 virtio_gpu_object
Date: Wed,  4 Mar 2020 17:32:11 -0800
Message-Id: <20200305013212.130640-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A resource will be a shmem based resource or a (planned)
vram based resource, so it makes sense to factor out common fields
(resource handle, dumb).

v2: move mapped field to shmem object

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 13 +++++++----
 drivers/gpu/drm/virtio/virtgpu_object.c | 31 ++++++++++++++-----------
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  6 +++--
 3 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index ce73895cf74b..8e2027da6cce 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -69,16 +69,21 @@ struct virtio_gpu_object_params {
 struct virtio_gpu_object {
 	struct drm_gem_shmem_object base;
 	uint32_t hw_res_handle;
-
-	struct sg_table *pages;
-	uint32_t mapped;
-
 	bool dumb;
 	bool created;
 };
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, base.base)
 
+struct virtio_gpu_object_shmem {
+	struct virtio_gpu_object base;
+	struct sg_table *pages;
+	uint32_t mapped;
+};
+
+#define to_virtio_gpu_shmem(virtio_gpu_object) \
+	container_of((virtio_gpu_object), struct virtio_gpu_object_shmem, base)
+
 struct virtio_gpu_object_array {
 	struct ww_acquire_ctx ticket;
 	struct list_head next;
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index c5cad949eb8d..1f8b062bb9eb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -65,16 +65,17 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 {
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
-	if (bo->pages) {
-		if (bo->mapped) {
+	if (shmem->pages) {
+		if (shmem->mapped) {
 			dma_unmap_sg(vgdev->vdev->dev.parent,
-				     bo->pages->sgl, bo->mapped,
+				     shmem->pages->sgl, shmem->mapped,
 				     DMA_TO_DEVICE);
-			bo->mapped = 0;
+			shmem->mapped = 0;
 		}
-		sg_free_table(bo->pages);
-		bo->pages = NULL;
+		sg_free_table(shmem->pages);
+		shmem->pages = NULL;
 		drm_gem_shmem_unpin(&bo->base.base);
 	}
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
@@ -133,6 +134,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 					unsigned int *nents)
 {
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
+	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 	struct scatterlist *sg;
 	int si, ret;
 
@@ -140,19 +142,20 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	if (ret < 0)
 		return -EINVAL;
 
-	bo->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
-	if (!bo->pages) {
+	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
+	if (!shmem->pages) {
 		drm_gem_shmem_unpin(&bo->base.base);
 		return -EINVAL;
 	}
 
 	if (use_dma_api) {
-		bo->mapped = dma_map_sg(vgdev->vdev->dev.parent,
-					bo->pages->sgl, bo->pages->nents,
-					DMA_TO_DEVICE);
-		*nents = bo->mapped;
+		shmem->mapped = dma_map_sg(vgdev->vdev->dev.parent,
+					   shmem->pages->sgl,
+					   shmem->pages->nents,
+					   DMA_TO_DEVICE);
+		*nents = shmem->mapped;
 	} else {
-		*nents = bo->pages->nents;
+		*nents = shmem->pages->nents;
 	}
 
 	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
@@ -162,7 +165,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 		return -ENOMEM;
 	}
 
-	for_each_sg(bo->pages->sgl, sg, *nents, si) {
+	for_each_sg(shmem->pages->sgl, sg, *nents, si) {
 		(*ents)[si].addr = cpu_to_le64(use_dma_api
 					       ? sg_dma_address(sg)
 					       : sg_phys(sg));
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 5e2375e0f7bb..73854915ec34 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -600,10 +600,11 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_transfer_to_host_2d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
+	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
 	if (use_dma_api)
 		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
-				       bo->pages->sgl, bo->pages->nents,
+				       shmem->pages->sgl, shmem->pages->nents,
 				       DMA_TO_DEVICE);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
@@ -1015,10 +1016,11 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_transfer_host_3d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
+	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
 	if (use_dma_api)
 		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
-				       bo->pages->sgl, bo->pages->nents,
+				       shmem->pages->sgl, shmem->pages->nents,
 				       DMA_TO_DEVICE);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
