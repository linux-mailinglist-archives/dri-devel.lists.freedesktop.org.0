Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B823B25B5AE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D88B6E95B;
	Wed,  2 Sep 2020 21:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FD86E95B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:21 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id w186so323307pgb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ioIxThknC1gZGqnEC9i1IB4yZ/CBigPc9G8CEWzO1M=;
 b=AdhEIBdV0qGTZio87I0/A3wdqt7ym4HNzT9tTu/Y3nAnyq8Pg3dO4r5pgJcfyGKIlF
 TV3fLD6jVOhebj/oH2+Er2Se7aAvimrcuda/U8Nvr1puwDxyZmj26MkS1HXhhX8kmprK
 QvDuPm3pXoKFrVv/3KpTFbQeTN4tDsFk+VK/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ioIxThknC1gZGqnEC9i1IB4yZ/CBigPc9G8CEWzO1M=;
 b=aw58zX+B6xUx5ysrLt9RdGwaY3B1DH2e6SPC6G+gCj8ANLEnDGgbc4jQQtgrpWgZ8L
 1GC+4fNipX2fBOIeFcIHGXYBxauOeH6tpMGnlFMY3qM2wnWwkjQAtBLHBTqYk5jif7pE
 vg8yvRC9p1F7wsOZMCV+65hK9BL2oKK0y0sf5y+Rd4UTEwaK0h6okwxlFGPzK21J3y2H
 16hNnYLh7WIS0jWM1InzdyKvtWS6Z/4MJ9fRaCXdBhJOxiJBaYuAu+UCx5lqBKg5gKdA
 IuLldFy4N916cHsXhVRk2QWzfdgJHrX9g8FdSEQ4XqdWh0XnoGArfvhFCQlcuuQ0V/Va
 eLKA==
X-Gm-Message-State: AOAM531tyVcnx43P9TsGi0H1RcHklzsV1zdAkBdKE8+Sm/saw9JhG08r
 AvVWESbhyprNnUULA3GJPlXhnnbp/JAMaQ==
X-Google-Smtp-Source: ABdhPJwKHqX/D66u+xgKfq0FBAMDopip7ChURBAUEx69Q3ZQ2DwiBt9F4VAwEzFLKzHHOtWYLo1KmQ==
X-Received: by 2002:a63:4181:: with SMTP id o123mr3193073pga.387.1599080960860; 
 Wed, 02 Sep 2020 14:09:20 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:20 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 20/23] drm/virtio: implement blob resources: fix stride
 discrepancy
Date: Wed,  2 Sep 2020 14:08:44 -0700
Message-Id: <20200902210847.2689-21-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902210847.2689-1-gurchetansingh@chromium.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The old transfer ioctls may work on blob resources, and the guest
may have a image view on the blob resources such that the stride is
not equal to width * bytes_per_pixel.

For host-only blobs, we can repurpose the transfer ioctls to synchronize
caches as well.

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
index 689297e1fff87..6162865c162df 100644
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
index 7a2430e34e003..0075995a9f5b8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -311,6 +311,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct drm_virtgpu_3d_transfer_from_host *args = data;
+	struct virtio_gpu_object *bo;
 	struct virtio_gpu_object_array *objs;
 	struct virtio_gpu_fence *fence;
 	int ret;
@@ -324,6 +325,17 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
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
@@ -333,9 +345,10 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
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
@@ -353,6 +366,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct drm_virtgpu_3d_transfer_to_host *args = data;
+	struct virtio_gpu_object *bo;
 	struct virtio_gpu_object_array *objs;
 	struct virtio_gpu_fence *fence;
 	int ret;
@@ -362,6 +376,12 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
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
@@ -369,6 +389,12 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
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
@@ -380,8 +406,9 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 
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
index b77d405e56b28..363e30e19db4c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1012,6 +1012,8 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 					uint32_t ctx_id,
 					uint64_t offset, uint32_t level,
+					uint32_t stride,
+					uint32_t layer_stride,
 					struct drm_virtgpu_3d_box *box,
 					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence)
@@ -1020,12 +1022,14 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
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
@@ -1038,6 +1042,8 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	convert_to_hw_box(&cmd_p->box, box);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
+	cmd_p->stride = cpu_to_le32(stride);
+	cmd_p->layer_stride = cpu_to_le32(layer_stride);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
@@ -1045,6 +1051,8 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 					  uint32_t ctx_id,
 					  uint64_t offset, uint32_t level,
+					  uint32_t stride,
+					  uint32_t layer_stride,
 					  struct drm_virtgpu_3d_box *box,
 					  struct virtio_gpu_object_array *objs,
 					  struct virtio_gpu_fence *fence)
@@ -1064,6 +1072,8 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
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
