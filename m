Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD127651E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5236B6EA25;
	Thu, 24 Sep 2020 00:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A686EA1F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:33 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id r19so686928pls.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OhCNiGI9NYjEwyuNbdCt8zktPQl+shbeSod2slXCdug=;
 b=FR0ko5QZLAoc8fbTZ9kx4ML56hXLjfl/CvISyxBkKhyWntg0aLsG5wiPwfEHvCpgjN
 yWZXDZ+mqwDpFjEbuV6KwYi7EXnvGE7zUtzGbqMH92956nIXw0StK7yjnJIhejRyWGDP
 UFjd7ZBECnOTT2pJ+Si8ByhxS08zhtKhVCOWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OhCNiGI9NYjEwyuNbdCt8zktPQl+shbeSod2slXCdug=;
 b=tq3CNoZmQcgmzVUGnBNiJkLrOunCchdcl+5LZBZP1UJ7PnG/21pPbluFqW7KjEMCgI
 KCRcGOt3Y73Cd2saf4irB06uanL0fqKxztZI5qeXgKU6uFfMso/odanZKV6lKcGPqUoR
 2fQF52laGs/c5TvIbzAvgx4LSFsDd7UjGWdwnRxXZfUI9JX3qd2bf8P0/b6VEPX3A/qw
 5tsdyDbr+jQ9LhjxAQE1jM7K2xcSYHA5kzA9Cxtk4qXW3oAlphcv/6zbdpo998X5jwq8
 U9cb7uu8iFKupX17EhPXkiOOpz/3x3xTWTFUBfm291naekMgNlI767WZV6xdOEPvFRDH
 MbdQ==
X-Gm-Message-State: AOAM531HjhjIyXS81613OHOCMqhRASz8XkHoSDSizzVQBtD6q1kCeRre
 WaWKDBzF/1BX8wLgad+5Mi7d56SulB6mzA==
X-Google-Smtp-Source: ABdhPJwU2iOqQ/Iqq5lPf6P6ViUfUO+I8Jvx4sii94VoxhsCHle9MfKaMVpA+xaCEJ7BUDOpgmzWbQ==
X-Received: by 2002:a17:90b:d8f:: with SMTP id
 bg15mr1640400pjb.90.1600907552514; 
 Wed, 23 Sep 2020 17:32:32 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:31 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 16/19] drm/virtio: implement blob resources: fix stride
 discrepancy
Date: Wed, 23 Sep 2020 17:32:11 -0700
Message-Id: <20200924003214.662-16-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924003214.662-1-gurchetansingh@chromium.org>
References: <20200924003214.662-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The old transfer ioctls may work on blob resources, and there is no
TRANSFER_BLOB hypercall now for simplicity.

The guest may have a image view on the blob resources such that the
stride is not equal to width * bytes_per_pixel.

For host-only blobs, we can repurpose the transfer ioctls to synchronize
caches as well.  For guest-only blobs, these operations are undefined
for now so leave them out.

Also, with seamless Wayland integration between guest/host looking
increasingly attractive, it also makes sense to keep track of
one value for stride.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  4 +++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 35 +++++++++++++++++++++++---
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 14 +++++++++--
 3 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index bbbe28f8b9436..ad16cef9a39b8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -351,12 +351,16 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 					  uint32_t ctx_id,
 					  uint64_t offset, uint32_t level,
+					  uint32_t stride,
+					  uint32_t layer_stride,
 					  struct drm_virtgpu_3d_box *box,
 					  struct virtio_gpu_object_array *objs,
 					  struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 					uint32_t ctx_id,
 					uint64_t offset, uint32_t level,
+					uint32_t stride,
+					uint32_t layer_stride,
 					struct drm_virtgpu_3d_box *box,
 					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence);
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c8da7adc6b307..0bf789f2bfdec 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -312,6 +312,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct drm_virtgpu_3d_transfer_from_host *args = data;
+	struct virtio_gpu_object *bo;
 	struct virtio_gpu_object_array *objs;
 	struct virtio_gpu_fence *fence;
 	int ret;
@@ -325,6 +326,17 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (objs == NULL)
 		return -ENOENT;
 
+	bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	if (bo->guest_blob && !bo->host3d_blob) {
+		ret = -EINVAL;
+		goto err_put_free;
+	}
+
+	if (!bo->host3d_blob && (args->stride || args->layer_stride)) {
+		ret = -EINVAL;
+		goto err_put_free;
+	}
+
 	ret = virtio_gpu_array_lock_resv(objs);
 	if (ret != 0)
 		goto err_put_free;
@@ -334,9 +346,10 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 		ret = -ENOMEM;
 		goto err_unlock;
 	}
+
 	virtio_gpu_cmd_transfer_from_host_3d
-		(vgdev, vfpriv->ctx_id, offset, args->level,
-		 &args->box, objs, fence);
+		(vgdev, vfpriv->ctx_id, offset, args->level, args->stride,
+		 args->layer_stride, &args->box, objs, fence);
 	dma_fence_put(&fence->f);
 	virtio_gpu_notify(vgdev);
 	return 0;
@@ -354,6 +367,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct drm_virtgpu_3d_transfer_to_host *args = data;
+	struct virtio_gpu_object *bo;
 	struct virtio_gpu_object_array *objs;
 	struct virtio_gpu_fence *fence;
 	int ret;
@@ -363,6 +377,12 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 	if (objs == NULL)
 		return -ENOENT;
 
+	bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	if (bo->guest_blob && !bo->host3d_blob) {
+		ret = -EINVAL;
+		goto err_put_free;
+	}
+
 	if (!vgdev->has_virgl_3d) {
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, offset,
@@ -370,6 +390,12 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			 objs, NULL);
 	} else {
 		virtio_gpu_create_context(dev, file);
+
+		if (!bo->host3d_blob && (args->stride || args->layer_stride)) {
+			ret = -EINVAL;
+			goto err_put_free;
+		}
+
 		ret = virtio_gpu_array_lock_resv(objs);
 		if (ret != 0)
 			goto err_put_free;
@@ -381,8 +407,9 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 
 		virtio_gpu_cmd_transfer_to_host_3d
 			(vgdev,
-			 vfpriv ? vfpriv->ctx_id : 0, offset,
-			 args->level, &args->box, objs, fence);
+			 vfpriv ? vfpriv->ctx_id : 0, offset, args->level,
+			 args->stride, args->layer_stride, &args->box, objs,
+			 fence);
 		dma_fence_put(&fence->f);
 	}
 	virtio_gpu_notify(vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index e71c8eec0b914..6434b9fb38a65 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1017,6 +1017,8 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 					uint32_t ctx_id,
 					uint64_t offset, uint32_t level,
+					uint32_t stride,
+					uint32_t layer_stride,
 					struct drm_virtgpu_3d_box *box,
 					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence)
@@ -1025,12 +1027,14 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_transfer_host_3d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
-	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
-	if (use_dma_api)
+	if (virtio_gpu_is_shmem(bo) && use_dma_api) {
+		struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
+
 		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
 				       shmem->pages->sgl, shmem->pages->nents,
 				       DMA_TO_DEVICE);
+	}
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
@@ -1043,6 +1047,8 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	convert_to_hw_box(&cmd_p->box, box);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
+	cmd_p->stride = cpu_to_le32(stride);
+	cmd_p->layer_stride = cpu_to_le32(layer_stride);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
@@ -1050,6 +1056,8 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 					  uint32_t ctx_id,
 					  uint64_t offset, uint32_t level,
+					  uint32_t stride,
+					  uint32_t layer_stride,
 					  struct drm_virtgpu_3d_box *box,
 					  struct virtio_gpu_object_array *objs,
 					  struct virtio_gpu_fence *fence)
@@ -1069,6 +1077,8 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 	convert_to_hw_box(&cmd_p->box, box);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
+	cmd_p->stride = cpu_to_le32(stride);
+	cmd_p->layer_stride = cpu_to_le32(layer_stride);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
