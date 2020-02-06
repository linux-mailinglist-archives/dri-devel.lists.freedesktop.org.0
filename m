Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768F154C06
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 20:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE046FB30;
	Thu,  6 Feb 2020 19:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF466FB2D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:22:18 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id u131so3220665pgc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8rDd/Vg3WON2nnvdgR5YFt4xl/tb/qqsy8+XWI9nbzo=;
 b=Ptn8ja5NNGG8X0xijdGKOQiHKRliUGZg5pui0BmJiGWXWnIFIpGObjQH+ZQI8Paw77
 h+d6f5jZLtFJI06pmyXMg8fwXHEAT8KRvnmVECu3TnDdq5LbEA78cBkwM0LUKdvUJ3uG
 yG278rMafzk7/Bo5xjS/2afimMYDnJZ+NmCQc/GJmXKB0FAsyb02TAlQEkz0o2hE0OTk
 zoUX5Zx39ZtVXik3RhXKXcKCEb3l3SMxwUVMDYrbjTXcSUsPx/59yMLliyER6vg7a0uf
 mtl30f02JhNu7d/oPUaonHafI1mcepDFcyteZ/JF/nx0QA9aZ8zFgjX3pFvzm/apbJPa
 4BtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8rDd/Vg3WON2nnvdgR5YFt4xl/tb/qqsy8+XWI9nbzo=;
 b=dUva0lbYtkdJXvDJDTGeSAj6TVDfXznLh5glKgBp4js358y2jCj4zqgomSGiZbN8B+
 2dj9SEmwxO1I1AxC5wTTD+cmpyVNTLD/qEQrmp+nJsLZ7yslUCC7HV4crEtwZ/ORm2NW
 1I3q7jd93VoWGtB3kd7wvFQ5/qgWAJh6toVSypM4243d9BavUUQBtQL4jyKqNMx2twep
 vqlNI8Dr9iKs6txUFeO7qD99aSH8fi216nD+JmllnDmKrjdDYzrS+6TgULWOkK8vxHBR
 Q7yNjNXs77XSssPFKVksyFMDALgeqYhImr1doeIJbf2NeEO4Z0f58SGECJGoLMt5kgZn
 WoFQ==
X-Gm-Message-State: APjAAAX6DcmjHZaBV++yHWp5EliuOOtDUhkkNWxnfgUe7C/Q3tqmkBa2
 EFGRBvAcYnLmfuvka65tDy/gkb18
X-Google-Smtp-Source: APXvYqzoZA6aFz24eWrKV/GoFtE/JLX/B3nFxu4J5TiWZGKA4SamdG9OMdWuVstY+M1eCSomf/EBYQ==
X-Received: by 2002:a63:7c16:: with SMTP id x22mr5374162pgc.335.1581016937760; 
 Thu, 06 Feb 2020 11:22:17 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id r3sm162840pfg.145.2020.02.06.11.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:22:17 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/virtio: remove the global disable_notify state
Date: Thu,  6 Feb 2020 11:22:14 -0800
Message-Id: <20200206192214.86818-3-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200206192214.86818-1-olvaffe@gmail.com>
References: <20200206192214.86818-1-olvaffe@gmail.com>
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
Cc: kraxel@redhat.com, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The global disable_notify state does not scale well when we start
using it in more places and when there are multiple threads.  Use
command-level bools to control whether to notify or not.

The naming conventions are

  virtio_gpu_cmd_foo -> add foo and commit is implied
  virtio_gpu_ctrl_bar -> add bar to ctrlq and commit is
                         caller-controlled

virtio_gpu_{disable,enable}_notify is also replaced by
virtio_gpu_commit_ctrl.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c |  9 ++-
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 38 +++++-----
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  4 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 42 +++++------
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 94 ++++++++++++------------
 5 files changed, 92 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 7b0f0643bb2dd..34b1136b05120 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -87,9 +87,9 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
 
-	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0,
-				   crtc->mode.hdisplay,
-				   crtc->mode.vdisplay, 0, 0);
+	virtio_gpu_ctrl_set_scanout(vgdev, output->index, 0,
+				    crtc->mode.hdisplay,
+				    crtc->mode.vdisplay, 0, 0, true);
 }
 
 static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -107,7 +107,8 @@ static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
 
-	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0, 0, 0, 0, 0);
+	virtio_gpu_ctrl_set_scanout(vgdev, output->index, 0, 0, 0, 0, 0,
+				    true);
 	output->enabled = false;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 0af1724bda390..b9a948a6d6cf7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -177,8 +177,6 @@ struct virtio_gpu_device {
 	struct kmem_cache *vbufs;
 	bool vqs_ready;
 
-	bool disable_notify;
-
 	struct ida	resource_ida;
 
 	wait_queue_head_t resp_wq;
@@ -262,20 +260,22 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id);
-void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
-					uint64_t offset,
-					uint32_t width, uint32_t height,
-					uint32_t x, uint32_t y,
-					struct virtio_gpu_object_array *objs,
-					struct virtio_gpu_fence *fence);
-void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
-				   uint32_t resource_id,
-				   uint32_t x, uint32_t y,
-				   uint32_t width, uint32_t height);
-void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
-				uint32_t scanout_id, uint32_t resource_id,
-				uint32_t width, uint32_t height,
-				uint32_t x, uint32_t y);
+void virtio_gpu_ctrl_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
+					 uint64_t offset,
+					 uint32_t width, uint32_t height,
+					 uint32_t x, uint32_t y,
+					 struct virtio_gpu_object_array *objs,
+					 struct virtio_gpu_fence *fence,
+					 bool commit);
+void virtio_gpu_ctrl_resource_flush(struct virtio_gpu_device *vgdev,
+				    uint32_t resource_id,
+				    uint32_t x, uint32_t y,
+				    uint32_t width, uint32_t height,
+				    bool commit);
+void virtio_gpu_ctrl_set_scanout(struct virtio_gpu_device *vgdev,
+				 uint32_t scanout_id, uint32_t resource_id,
+				 uint32_t width, uint32_t height,
+				 uint32_t x, uint32_t y, bool commit);
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object *obj,
 			     struct virtio_gpu_fence *fence);
@@ -324,6 +324,9 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 				  struct virtio_gpu_object_params *params,
 				  struct virtio_gpu_object_array *objs,
 				  struct virtio_gpu_fence *fence);
+
+void virtio_gpu_commit_ctrl(struct virtio_gpu_device *vgdev);
+
 void virtio_gpu_ctrl_ack(struct virtqueue *vq);
 void virtio_gpu_cursor_ack(struct virtqueue *vq);
 void virtio_gpu_fence_ack(struct virtqueue *vq);
@@ -331,9 +334,6 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
 void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
 void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 
-void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
-void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
-
 /* virtio_gpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 205ec4abae2b9..2bb50dec5c43d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -339,10 +339,10 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	if (!vgdev->has_virgl_3d) {
-		virtio_gpu_cmd_transfer_to_host_2d
+		virtio_gpu_ctrl_transfer_to_host_2d
 			(vgdev, offset,
 			 args->box.w, args->box.h, args->box.x, args->box.y,
-			 objs, NULL);
+			 objs, NULL, true);
 	} else {
 		ret = virtio_gpu_array_lock_resv(objs);
 		if (ret != 0)
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index ac42c84d2d7f2..7300823e80520 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -122,8 +122,8 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 		return;
 	virtio_gpu_array_add_obj(objs, &bo->base.base);
 
-	virtio_gpu_cmd_transfer_to_host_2d(vgdev, off, w, h, x, y,
-					   objs, NULL);
+	virtio_gpu_ctrl_transfer_to_host_2d(vgdev, off, w, h, x, y,
+					    objs, NULL, false);
 }
 
 static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
@@ -144,18 +144,16 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 
 	if (!plane->state->fb || !output->enabled) {
 		DRM_DEBUG("nofb\n");
-		virtio_gpu_cmd_set_scanout(vgdev, output->index, 0,
-					   plane->state->src_w >> 16,
-					   plane->state->src_h >> 16,
-					   0, 0);
+		virtio_gpu_ctrl_set_scanout(vgdev, output->index, 0,
+					    plane->state->src_w >> 16,
+					    plane->state->src_h >> 16,
+					    0, 0, true);
 		return;
 	}
 
 	if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
 		return;
 
-	virtio_gpu_disable_notify(vgdev);
-
 	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
 	if (bo->dumb)
 		virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
@@ -173,21 +171,21 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 			  plane->state->src_h >> 16,
 			  plane->state->src_x >> 16,
 			  plane->state->src_y >> 16);
-		virtio_gpu_cmd_set_scanout(vgdev, output->index,
-					   bo->hw_res_handle,
-					   plane->state->src_w >> 16,
-					   plane->state->src_h >> 16,
-					   plane->state->src_x >> 16,
-					   plane->state->src_y >> 16);
+		virtio_gpu_ctrl_set_scanout(vgdev, output->index,
+					    bo->hw_res_handle,
+					    plane->state->src_w >> 16,
+					    plane->state->src_h >> 16,
+					    plane->state->src_x >> 16,
+					    plane->state->src_y >> 16, false);
 	}
 
-	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
-				      rect.x1,
-				      rect.y1,
-				      rect.x2 - rect.x1,
-				      rect.y2 - rect.y1);
+	virtio_gpu_ctrl_resource_flush(vgdev, bo->hw_res_handle,
+				       rect.x1,
+				       rect.y1,
+				       rect.x2 - rect.x1,
+				       rect.y2 - rect.y1, false);
 
-	virtio_gpu_enable_notify(vgdev);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
@@ -260,11 +258,11 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 		if (!objs)
 			return;
 		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
-		virtio_gpu_cmd_transfer_to_host_2d
+		virtio_gpu_ctrl_transfer_to_host_2d
 			(vgdev, 0,
 			 plane->state->crtc_w,
 			 plane->state->crtc_h,
-			 0, 0, objs, vgfb->fence);
+			 0, 0, objs, vgfb->fence, true);
 		dma_fence_wait(&vgfb->fence->f, true);
 		dma_fence_put(&vgfb->fence->f);
 		vgfb->fence = NULL;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 204b1577a1873..f66e1372b9a7f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -324,7 +324,8 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 				      int elemcnt,
 				      struct scatterlist **sgs,
 				      int outcnt,
-				      int incnt)
+				      int incnt,
+				      bool commit)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
 	bool notify = false;
@@ -364,7 +365,7 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 
 	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf));
 
-	if (!vgdev->disable_notify)
+	if (commit)
 		notify = virtqueue_kick_prepare(vq);
 
 	spin_unlock(&vgdev->ctrlq.qlock);
@@ -375,7 +376,8 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 
 static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 						struct virtio_gpu_vbuffer *vbuf,
-						struct virtio_gpu_fence *fence)
+						struct virtio_gpu_fence *fence,
+						bool commit)
 {
 	struct scatterlist *sgs[3], vcmd, vout, vresp;
 	struct sg_table *sgt = NULL;
@@ -418,7 +420,7 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	}
 
 	virtio_gpu_queue_ctrl_sgs(vgdev, vbuf, fence, elemcnt, sgs, outcnt,
-				  incnt);
+				  incnt, commit);
 
 	if (sgt) {
 		sg_free_table(sgt);
@@ -426,18 +428,18 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	}
 }
 
-void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev)
+static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
+					 struct virtio_gpu_vbuffer *vbuf,
+					 bool commit)
 {
-	vgdev->disable_notify = true;
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, NULL, commit);
 }
 
-void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev)
+void virtio_gpu_commit_ctrl(struct virtio_gpu_device *vgdev)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
 	bool notify;
 
-	vgdev->disable_notify = false;
-
 	spin_lock(&vgdev->ctrlq.qlock);
 	notify = virtqueue_kick_prepare(vq);
 	spin_unlock(&vgdev->ctrlq.qlock);
@@ -450,12 +452,6 @@ void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev)
 		virtqueue_notify(vq);
 }
 
-static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
-					 struct virtio_gpu_vbuffer *vbuf)
-{
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, NULL);
-}
-
 static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_vbuffer *vbuf)
 {
@@ -517,7 +513,7 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->width = cpu_to_le32(params->width);
 	cmd_p->height = cpu_to_le32(params->height);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence, true);
 	bo->created = true;
 }
 
@@ -533,7 +529,7 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_UNREF);
 	cmd_p->resource_id = cpu_to_le32(resource_id);
 
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf, true);
 }
 
 static void virtio_gpu_cmd_resource_inval_backing(struct virtio_gpu_device *vgdev,
@@ -549,13 +545,13 @@ static void virtio_gpu_cmd_resource_inval_backing(struct virtio_gpu_device *vgde
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING);
 	cmd_p->resource_id = cpu_to_le32(resource_id);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence, true);
 }
 
-void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
-				uint32_t scanout_id, uint32_t resource_id,
-				uint32_t width, uint32_t height,
-				uint32_t x, uint32_t y)
+void virtio_gpu_ctrl_set_scanout(struct virtio_gpu_device *vgdev,
+				 uint32_t scanout_id, uint32_t resource_id,
+				 uint32_t width, uint32_t height,
+				 uint32_t x, uint32_t y, bool commit)
 {
 	struct virtio_gpu_set_scanout *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
@@ -571,13 +567,14 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 	cmd_p->r.x = cpu_to_le32(x);
 	cmd_p->r.y = cpu_to_le32(y);
 
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf, commit);
 }
 
-void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
-				   uint32_t resource_id,
-				   uint32_t x, uint32_t y,
-				   uint32_t width, uint32_t height)
+void virtio_gpu_ctrl_resource_flush(struct virtio_gpu_device *vgdev,
+				    uint32_t resource_id,
+				    uint32_t x, uint32_t y,
+				    uint32_t width, uint32_t height,
+				    bool commit)
 {
 	struct virtio_gpu_resource_flush *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
@@ -592,15 +589,16 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 	cmd_p->r.x = cpu_to_le32(x);
 	cmd_p->r.y = cpu_to_le32(y);
 
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf, commit);
 }
 
-void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
-					uint64_t offset,
-					uint32_t width, uint32_t height,
-					uint32_t x, uint32_t y,
-					struct virtio_gpu_object_array *objs,
-					struct virtio_gpu_fence *fence)
+void virtio_gpu_ctrl_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
+					 uint64_t offset,
+					 uint32_t width, uint32_t height,
+					 uint32_t x, uint32_t y,
+					 struct virtio_gpu_object_array *objs,
+					 struct virtio_gpu_fence *fence,
+					 bool commit)
 {
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
 	struct virtio_gpu_transfer_to_host_2d *cmd_p;
@@ -624,7 +622,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	cmd_p->r.x = cpu_to_le32(x);
 	cmd_p->r.y = cpu_to_le32(y);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence, commit);
 }
 
 static void
@@ -647,7 +645,7 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	vbuf->data_buf = ents;
 	vbuf->data_size = sizeof(*ents) * nents;
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence, true);
 }
 
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
@@ -779,7 +777,7 @@ int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev)
 
 	vgdev->display_info_pending = true;
 	cmd_p->type = cpu_to_le32(VIRTIO_GPU_CMD_GET_DISPLAY_INFO);
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf, true);
 	return 0;
 }
 
@@ -802,7 +800,7 @@ int virtio_gpu_cmd_get_capset_info(struct virtio_gpu_device *vgdev, int idx)
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_CAPSET_INFO);
 	cmd_p->capset_index = cpu_to_le32(idx);
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf, true);
 	return 0;
 }
 
@@ -877,7 +875,7 @@ int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 	cmd_p->capset_id = cpu_to_le32(vgdev->capsets[idx].id);
 	cmd_p->capset_version = cpu_to_le32(version);
 	*cache_p = cache_ent;
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf, true);
 
 	return 0;
 }
@@ -904,7 +902,7 @@ int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev)
 			 resp_buf);
 		cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_EDID);
 		cmd_p->scanout = cpu_to_le32(scanout);
-		virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+		virtio_gpu_queue_ctrl_buffer(vgdev, vbuf, true);
 	}
 
 	return 0;
@@ -924,7 +922,7 @@ void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
 	cmd_p->nlen = cpu_to_le32(nlen);
 	strncpy(cmd_p->debug_name, name, sizeof(cmd_p->debug_name) - 1);
 	cmd_p->debug_name[sizeof(cmd_p->debug_name) - 1] = 0;
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf, true);
 }
 
 void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
@@ -938,7 +936,7 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_DESTROY);
 	cmd_p->hdr.ctx_id = cpu_to_le32(id);
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf, true);
 }
 
 void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
@@ -956,7 +954,7 @@ void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_ATTACH_RESOURCE);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf, true);
 
 }
 
@@ -975,7 +973,7 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_DETACH_RESOURCE);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf, true);
 }
 
 void
@@ -1006,7 +1004,7 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->nr_samples = cpu_to_le32(params->nr_samples);
 	cmd_p->flags = cpu_to_le32(params->flags);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence, true);
 	bo->created = true;
 }
 
@@ -1039,7 +1037,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence, true);
 }
 
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
@@ -1065,7 +1063,7 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence, true);
 }
 
 void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
@@ -1088,7 +1086,7 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->size = cpu_to_le32(data_size);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence, true);
 }
 
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
