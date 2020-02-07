Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC424156112
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 23:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE416FDD4;
	Fri,  7 Feb 2020 22:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E686FDD2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 22:14:08 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y8so285552pll.13
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 14:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H1aYk6pA/0oV6YB3ZGdZS1qSqoRA0MUVCv2ZITjDmh8=;
 b=Qpwt3J0lyEVv9GDYTZrMkZEJuGd99Wb4Ww0ttnXbS7nhqntIy/KyBiUERGMUlJNZBu
 08nzQ/63uxZXi2ZRo9eiRDHHdzWlRSK3K/kxg7EZcadcZXmXVJ6/X6BpNR70gQHj3Wc7
 VfQYPDx84XcFdk5JmdlFzcUuF+3iif2YJuR7hDu4Qb3L/M0A1AmfG+LmRzAR4aInSM4X
 WcSrB5kVQZtan1EU/OVmu64IL6XGgRrVLVs052iG/JUhsyBPYeThsC4yW/QytL/mYkfM
 vr0YrrTMP46V4kQSruuvYONG+PHb7XnzDHgyKuIYn2RfpfkSZbR87613joVV1eo58bbc
 nGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1aYk6pA/0oV6YB3ZGdZS1qSqoRA0MUVCv2ZITjDmh8=;
 b=fuiRKPtOzW9XqalqWmDowYiilEd48pSohUSaZaxggyWAC0y6/nhvhOLS7U/yawVhwq
 lPEJxCJMTMF0ZPP+vtBQMDmSnBZj57RDJlhZsmhv89JCbki748L5+rLWLXYRmDDD8wnz
 sVarCdIbo5E4WGJXT/KAY/FrUoKp+UpS1rmbd/U7xCDHUbA43ali0E682uJxef4sGjMb
 wljuMzCqsDYRjRVJsD+fAL+8Ci7hVvL3C8cqDI0I2IG33PfBXLdHIGbXeOiLgB9Ga0Dr
 nam0dH/YxkrR6WoZ8Gvl3W07KgXX3JlI9PfRPgv6306Tqp8kI0SCJUeCiacmjAP1XJOc
 r3qg==
X-Gm-Message-State: APjAAAVGg1ryZVng8AwRESilLcPPF4PqjBPce8TR0GfMJ6ZlylwL9xX5
 Ak9xHeXxtM6nO/SeqSKO3qAAQ5YJ
X-Google-Smtp-Source: APXvYqwdMxm3JfFYG+NitYkUVnPE5sE+0s8eAjXPk6iuSL+hkuQFRcsnXUv50H2+yYC9CbWKEOA6cQ==
X-Received: by 2002:a17:902:b598:: with SMTP id
 a24mr517170pls.262.1581113647512; 
 Fri, 07 Feb 2020 14:14:07 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id t65sm3899043pfd.178.2020.02.07.14.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 14:14:05 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/virtio: remove the global disable_notify state
Date: Fri,  7 Feb 2020 14:13:59 -0800
Message-Id: <20200207221359.187340-4-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207221359.187340-1-olvaffe@gmail.com>
References: <20200206192214.86818-1-olvaffe@gmail.com>
 <20200207221359.187340-1-olvaffe@gmail.com>
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
using it in more places and when there are multiple threads.  Allow
individual commands to be added to the virtqueue but not committed.

The naming conventions are

  virtio_gpu_cmd_foo -> add foo and commit
  virtio_gpu_add_bar -> add bar but do not commit

virtio_gpu_{disable,enable}_notify is replaced by
virtio_gpu_commit_ctrl.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 42 +++++++++++++++++++++-----
 drivers/gpu/drm/virtio/virtgpu_plane.c | 10 +++---
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 25 +++------------
 3 files changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d3fcc25068132..2365f196f3169 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -177,8 +177,6 @@ struct virtio_gpu_device {
 	struct kmem_cache *vbufs;
 	bool vqs_ready;
 
-	bool disable_notify;
-
 	struct ida	resource_ida;
 
 	wait_queue_head_t resp_wq;
@@ -256,6 +254,9 @@ void virtio_gpu_array_put_free_work(struct work_struct *work);
 /* virtio vg */
 int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
+
+void virtio_gpu_commit_ctrl(struct virtio_gpu_device *vgdev);
+
 void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo,
 				    struct virtio_gpu_object_params *params,
@@ -263,20 +264,48 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id);
-void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
+
+void virtio_gpu_add_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
 					uint32_t x, uint32_t y,
 					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence);
-void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
+
+static inline void
+virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
+				   uint64_t offset,
+				   uint32_t width, uint32_t height,
+				   uint32_t x, uint32_t y,
+				   struct virtio_gpu_object_array *objs,
+				   struct virtio_gpu_fence *fence)
+{
+	virtio_gpu_add_transfer_to_host_2d(vgdev, offset, width, height, x, y,
+					   objs, fence);
+	virtio_gpu_commit_ctrl(vgdev);
+}
+
+void virtio_gpu_add_resource_flush(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id,
 				   uint32_t x, uint32_t y,
 				   uint32_t width, uint32_t height);
-void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
+
+void virtio_gpu_add_set_scanout(struct virtio_gpu_device *vgdev,
 				uint32_t scanout_id, uint32_t resource_id,
 				uint32_t width, uint32_t height,
 				uint32_t x, uint32_t y);
+
+static inline void
+virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
+			   uint32_t scanout_id, uint32_t resource_id,
+			   uint32_t width, uint32_t height,
+			   uint32_t x, uint32_t y)
+{
+	virtio_gpu_add_set_scanout(vgdev, scanout_id, resource_id,
+				   width, height, x, y);
+	virtio_gpu_commit_ctrl(vgdev);
+}
+
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object *obj,
 			     struct virtio_gpu_fence *fence);
@@ -332,9 +361,6 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
 void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
 void virtio_gpu_dequeue_fence_func(struct work_struct *work);
 
-void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev);
-void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev);
-
 /* virtio_gpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index ac42c84d2d7f2..448ee01cce026 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -122,7 +122,7 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 		return;
 	virtio_gpu_array_add_obj(objs, &bo->base.base);
 
-	virtio_gpu_cmd_transfer_to_host_2d(vgdev, off, w, h, x, y,
+	virtio_gpu_add_transfer_to_host_2d(vgdev, off, w, h, x, y,
 					   objs, NULL);
 }
 
@@ -154,8 +154,6 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
 		return;
 
-	virtio_gpu_disable_notify(vgdev);
-
 	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
 	if (bo->dumb)
 		virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
@@ -173,7 +171,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 			  plane->state->src_h >> 16,
 			  plane->state->src_x >> 16,
 			  plane->state->src_y >> 16);
-		virtio_gpu_cmd_set_scanout(vgdev, output->index,
+		virtio_gpu_add_set_scanout(vgdev, output->index,
 					   bo->hw_res_handle,
 					   plane->state->src_w >> 16,
 					   plane->state->src_h >> 16,
@@ -181,13 +179,13 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 					   plane->state->src_y >> 16);
 	}
 
-	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
+	virtio_gpu_add_resource_flush(vgdev, bo->hw_res_handle,
 				      rect.x1,
 				      rect.y1,
 				      rect.x2 - rect.x1,
 				      rect.y2 - rect.y1);
 
-	virtio_gpu_enable_notify(vgdev);
+	virtio_gpu_commit_ctrl(vgdev);
 }
 
 static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index d76b24f2b2bff..4f2c24c4ddc3f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -423,14 +423,11 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	}
 }
 
-static void virtio_gpu_commit_ctrl(struct virtio_gpu_device *vgdev)
+void virtio_gpu_commit_ctrl(struct virtio_gpu_device *vgdev)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
 	bool notify;
 
-	if (vgdev->disable_notify)
-		return;
-
 	spin_lock(&vgdev->ctrlq.qlock);
 	notify = virtqueue_kick_prepare(vq);
 	spin_unlock(&vgdev->ctrlq.qlock);
@@ -443,17 +440,6 @@ static void virtio_gpu_commit_ctrl(struct virtio_gpu_device *vgdev)
 		virtqueue_notify(vq);
 }
 
-void virtio_gpu_disable_notify(struct virtio_gpu_device *vgdev)
-{
-	vgdev->disable_notify = true;
-}
-
-void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev)
-{
-	vgdev->disable_notify = false;
-	virtio_gpu_commit_ctrl(vgdev);
-}
-
 static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
 					 struct virtio_gpu_vbuffer *vbuf)
 {
@@ -559,7 +545,7 @@ static void virtio_gpu_cmd_resource_inval_backing(struct virtio_gpu_device *vgde
 	virtio_gpu_commit_ctrl(vgdev);
 }
 
-void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
+void virtio_gpu_add_set_scanout(struct virtio_gpu_device *vgdev,
 				uint32_t scanout_id, uint32_t resource_id,
 				uint32_t width, uint32_t height,
 				uint32_t x, uint32_t y)
@@ -579,10 +565,9 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_commit_ctrl(vgdev);
 }
 
-void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
+void virtio_gpu_add_resource_flush(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id,
 				   uint32_t x, uint32_t y,
 				   uint32_t width, uint32_t height)
@@ -601,10 +586,9 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_commit_ctrl(vgdev);
 }
 
-void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
+void virtio_gpu_add_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
 					uint32_t x, uint32_t y,
@@ -634,7 +618,6 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-	virtio_gpu_commit_ctrl(vgdev);
 }
 
 static void
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
