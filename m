Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2655244323
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9956EAD3;
	Fri, 14 Aug 2020 02:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07296EACE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:29 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id r4so3531131pls.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F9zefyZOZSYvQHr0DuTf0+Iuwgvl7kpfPlKBfRnn3Wc=;
 b=jNF2Tn8D7gMfeVe94f7fTfvRI1UNnxjKgzJmmBMgz5m82QQIoYFj0JUDAY6dY4cTyI
 q30nHA6CZ3KsDnjDPD15MBGTVKxF2JnMPxa889U794d8KhGq+bQ/2AleUSGQb/obr7Vn
 3jqrQ1feBl/XF3trnayC/zddtKhFkXQhO1qQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F9zefyZOZSYvQHr0DuTf0+Iuwgvl7kpfPlKBfRnn3Wc=;
 b=hQqOjAC/YGTEQ9r1sL3pHOlVV45v+SIjX6MjOD7CC211P+5tz6rsgxJayxZyx6tkcH
 S22IkEb/AA3IEq0ptt+IF/Xq+BwXr5PeC7WFMSxhGtG5F4n7B3zYPrlxeV/xprHqyZ5a
 vYzh3+DFrqo85nG7RVYObIwH4gGqp7Y1Tkf9qBkFKhWoq04u70oxueY6wwgJODOnUPAu
 JruFATVuisou9d3NqM+T9P3O4vx/L3Ux/aVdhsGsX+N/ZqX3ZkKKAGNMJSAMtm3aTP6/
 ogzRQOhqiBvN1qU2W1pct6cqKiSB3EYOLWiHW2byARKnvwaH4u8h1JrbMsRav3g8QWRd
 BORg==
X-Gm-Message-State: AOAM530DUuviKTi1AQrAHq6hYz7WprQ8iezFAHNaeL6oLFkMTSPS4yjX
 yll82MZd+kIo4hzafqagX3Cv+k64knE=
X-Google-Smtp-Source: ABdhPJwd0piQxTyuu4UpiPw56AO2+MTBuxJVKXip1SuEXqeuzpMVoohK+RVLYYEtMwKlfApIFyn/Sg==
X-Received: by 2002:a17:902:fe10:: with SMTP id
 g16mr555661plj.43.1597372829063; 
 Thu, 13 Aug 2020 19:40:29 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:28 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 21/24] drm/virtio: implement blob resources: fix stride
 discrepancy
Date: Thu, 13 Aug 2020 19:39:57 -0700
Message-Id: <20200814024000.2485-22-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
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
index 71c2ea2e3c83..444b65c8d4ee 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -349,12 +349,16 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
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
index 7a2430e34e00..0075995a9f5b 100644
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
index de4356a183d2..78cec150218c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1008,6 +1008,8 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 					uint32_t ctx_id,
 					uint64_t offset, uint32_t level,
+					uint32_t stride,
+					uint32_t layer_stride,
 					struct drm_virtgpu_3d_box *box,
 					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence)
@@ -1016,12 +1018,14 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_transfer_host_3d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_iommu_quirk(vgdev->vdev);
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
@@ -1034,6 +1038,8 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	convert_to_hw_box(&cmd_p->box, box);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
+	cmd_p->stride = cpu_to_le32(stride);
+	cmd_p->layer_stride = cpu_to_le32(layer_stride);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
@@ -1041,6 +1047,8 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 					  uint32_t ctx_id,
 					  uint64_t offset, uint32_t level,
+					  uint32_t stride,
+					  uint32_t layer_stride,
 					  struct drm_virtgpu_3d_box *box,
 					  struct virtio_gpu_object_array *objs,
 					  struct virtio_gpu_fence *fence)
@@ -1060,6 +1068,8 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 	convert_to_hw_box(&cmd_p->box, box);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
+	cmd_p->stride = cpu_to_le32(stride);
+	cmd_p->layer_stride = cpu_to_le32(layer_stride);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
