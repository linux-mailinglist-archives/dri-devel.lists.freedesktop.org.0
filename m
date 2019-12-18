Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C986E123C27
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 02:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068A96E204;
	Wed, 18 Dec 2019 01:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B656E204
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 01:00:06 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q8so214756pfh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 17:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sd1JRyd8keyIeKY2RfmaLJZxmSQ9jCuT9vMWsX8wfHY=;
 b=DZAchr1QVMXzlMddIhhmRRlL1/KJeapO+Smsc4is+fRUmsaK/Jsvv7hwzLLrNzibsC
 tUoSvGjUVqxZUKOpICt20jcQQTHw5Gsp0VBgf5/GiiZ96IqZZsVZ3T6CTfnYuv7U8Pe9
 tlfvUF9vEnDEmbVbBynpOvtJ6lpZkEHzRjIXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sd1JRyd8keyIeKY2RfmaLJZxmSQ9jCuT9vMWsX8wfHY=;
 b=fNuFUT0uDYcDEai3/44XWUmXSYaxiB2N9uy1dz5pxg3wHaoWdHjv+baCIdaaPLBzsz
 IgPMi/hfHmIUm4douaIxp9NOTGzBFEhuYj8HyBJtVTn2xdRZ21fy5BKsH391TQzka3cp
 mGVtW+9b3mdujaqUKYvedqk34KR9dlnOYACgLBarAICBM/Fa8zfS3e06KFkU+PRi0d3G
 pL2Po2RGuJkV4X7P9C3CZZg5+VAnoFIf4fcjJc6JlPF8BQJ0WwXeOCrcRn2obkA/eYWn
 hbbb5bPtk0Rbskn644dQVOG4EBYZi6u47U+Rgqhxb4WJWoZIYSXQr/AvpLzUoNMcjq4u
 EQHw==
X-Gm-Message-State: APjAAAUhzDWhLAytOrBEzILMbCEgdnEWPykZcz9pzyz7Q8j7hyH28RnG
 W0nM/mHJv2bfW2usgggElRWeSUHrKS8=
X-Google-Smtp-Source: APXvYqyK0rKKwV+N+RHFT3N37hWfAULYC8uBwbm/HGJjk8FKPJRnueY+jf1dmseR6aozJ3AJaYjdew==
X-Received: by 2002:a63:4d4c:: with SMTP id n12mr936184pgl.212.1576630805434; 
 Tue, 17 Dec 2019 17:00:05 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r1sm240802pgp.15.2019.12.17.17.00.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Dec 2019 17:00:04 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/virtio: split out vq functions from virtgpu_drv.h
Date: Tue, 17 Dec 2019 16:59:28 -0800
Message-Id: <20191218005929.6709-9-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191218005929.6709-1-gurchetansingh@chromium.org>
References: <20191218005929.6709-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtgpu_drv.h is getting very big, let's try to split it into
smaller header files.  Start with virtgpu_vq.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_display.c |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  79 ------------------
 drivers/gpu/drm/virtio/virtgpu_gem.c     |   1 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |   1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c     |   1 +
 drivers/gpu/drm/virtio/virtgpu_object.c  |   1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c   |   1 +
 drivers/gpu/drm/virtio/virtgpu_vq.c      |   1 +
 drivers/gpu/drm/virtio/virtgpu_vq.h      | 100 +++++++++++++++++++++++
 9 files changed, 107 insertions(+), 79 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_vq.h

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 0966208ec30d..03cd5e40bfa1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -33,6 +33,7 @@
 #include <drm/drm_vblank.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_vq.h"
 
 #define XRES_MIN    32
 #define YRES_MIN    32
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7e447784e493..cd98df412cda 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -250,85 +250,6 @@ void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
 				       struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_work(struct work_struct *work);
 
-/* virtio vg */
-int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
-void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
-void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
-				    struct virtio_gpu_object *bo,
-				    struct virtio_gpu_object_params *params,
-				    struct virtio_gpu_object_array *objs,
-				    struct virtio_gpu_fence *fence);
-void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
-				   uint32_t resource_id);
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
-int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
-			     struct virtio_gpu_object *obj,
-			     struct virtio_gpu_fence *fence);
-void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
-			      struct virtio_gpu_object *obj);
-int virtio_gpu_attach_status_page(struct virtio_gpu_device *vgdev);
-int virtio_gpu_detach_status_page(struct virtio_gpu_device *vgdev);
-void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
-			    struct virtio_gpu_output *output);
-int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev);
-int virtio_gpu_cmd_get_capset_info(struct virtio_gpu_device *vgdev, int idx);
-int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
-			      int idx, int version,
-			      struct virtio_gpu_drv_cap_cache **cache_p);
-int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev);
-void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
-				   uint32_t nlen, const char *name);
-void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
-				    uint32_t id);
-void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
-					    uint32_t ctx_id,
-					    struct virtio_gpu_object_array *objs);
-void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
-					    uint32_t ctx_id,
-					    struct virtio_gpu_object_array *objs);
-void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
-			   void *data, uint32_t data_size,
-			   uint32_t ctx_id,
-			   struct virtio_gpu_object_array *objs,
-			   struct virtio_gpu_fence *fence);
-void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
-					  uint32_t ctx_id,
-					  uint64_t offset, uint32_t level,
-					  struct drm_virtgpu_3d_box *box,
-					  struct virtio_gpu_object_array *objs,
-					  struct virtio_gpu_fence *fence);
-void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
-					uint32_t ctx_id,
-					uint64_t offset, uint32_t level,
-					struct drm_virtgpu_3d_box *box,
-					struct virtio_gpu_object_array *objs,
-					struct virtio_gpu_fence *fence);
-void
-virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
-				  struct virtio_gpu_object *bo,
-				  struct virtio_gpu_object_params *params,
-				  struct virtio_gpu_object_array *objs,
-				  struct virtio_gpu_fence *fence);
-void virtio_gpu_ctrl_ack(struct virtqueue *vq);
-void virtio_gpu_cursor_ack(struct virtqueue *vq);
-void virtio_gpu_fence_ack(struct virtqueue *vq);
-void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
-void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
-void virtio_gpu_dequeue_fence_func(struct work_struct *work);
-
 /* virtio_gpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 0a2b62279647..409dd3863c7b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -27,6 +27,7 @@
 #include <drm/drm_fourcc.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_vq.h"
 
 int virtio_gpu_gem_create(struct drm_file *file,
 			  struct drm_device *dev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 205ec4abae2b..0108945b5cae 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -32,6 +32,7 @@
 #include <drm/virtgpu_drm.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_vq.h"
 
 static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_priv)
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 2f5773e43557..2013002d3c2f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -29,6 +29,7 @@
 #include <drm/drm_file.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_vq.h"
 
 static void virtio_gpu_config_changed_work_func(struct work_struct *work)
 {
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 017a9e0fc3bb..8df93f40d282 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -26,6 +26,7 @@
 #include <linux/moduleparam.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_vq.h"
 
 static int virtio_gpu_virglrenderer_workaround = 1;
 module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index bc4bc4475a8c..384796db9373 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -28,6 +28,7 @@
 #include <drm/drm_plane_helper.h>
 
 #include "virtgpu_drv.h"
+#include "virtgpu_vq.h"
 
 static const uint32_t virtio_gpu_formats[] = {
 	DRM_FORMAT_HOST_XRGB8888,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 9274c4063c70..4d1c357ada07 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -33,6 +33,7 @@
 
 #include "virtgpu_drv.h"
 #include "virtgpu_trace.h"
+#include "virtgpu_vq.h"
 
 #define MAX_INLINE_CMD_SIZE   96
 #define MAX_INLINE_RESP_SIZE  24
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.h b/drivers/gpu/drm/virtio/virtgpu_vq.h
new file mode 100644
index 000000000000..06af7ef7f062
--- /dev/null
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef VIRTIO_VQ_H
+#define VIRTIO_VQ_H
+
+struct drm_virtgpu_3d_box;
+
+struct virtio_gpu_device;
+struct virtio_gpu_drv_cap_cache;
+
+struct virtio_gpu_fence;
+struct virtio_gpu_framebuffer;
+
+struct virtio_gpu_object;
+struct virtio_gpu_object_params;
+struct virtio_gpu_object_array;
+struct virtio_gpu_output;
+
+struct virtqueue;
+
+int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
+void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
+void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo,
+				    struct virtio_gpu_object_params *params,
+				    struct virtio_gpu_object_array *objs,
+				    struct virtio_gpu_fence *fence);
+void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
+				   uint32_t resource_id);
+void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
+					uint64_t offset,
+					uint32_t width, uint32_t height,
+					uint32_t x, uint32_t y,
+					struct virtio_gpu_object_array *objs,
+					struct virtio_gpu_fence *fence);
+void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
+				   uint32_t resource_id,
+				   uint32_t x, uint32_t y,
+				   uint32_t width, uint32_t height);
+void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
+				uint32_t scanout_id, uint32_t resource_id,
+				uint32_t width, uint32_t height,
+				uint32_t x, uint32_t y);
+int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
+			     struct virtio_gpu_object *obj,
+			     struct virtio_gpu_fence *fence);
+void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object *obj);
+int virtio_gpu_attach_status_page(struct virtio_gpu_device *vgdev);
+int virtio_gpu_detach_status_page(struct virtio_gpu_device *vgdev);
+void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
+			    struct virtio_gpu_output *output);
+int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev);
+int virtio_gpu_cmd_get_capset_info(struct virtio_gpu_device *vgdev, int idx);
+int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
+			      int idx, int version,
+			      struct virtio_gpu_drv_cap_cache **cache_p);
+int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev);
+void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
+				   uint32_t nlen, const char *name);
+void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
+				    uint32_t id);
+void
+virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
+				       uint32_t ctx_id,
+				       struct virtio_gpu_object_array *objs);
+void
+virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
+				       uint32_t ctx_id,
+				       struct virtio_gpu_object_array *objs);
+void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
+			   void *data, uint32_t data_size,
+			   uint32_t ctx_id,
+			   struct virtio_gpu_object_array *objs,
+			   struct virtio_gpu_fence *fence);
+void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
+					  uint32_t ctx_id,
+					  uint64_t offset, uint32_t level,
+					  struct drm_virtgpu_3d_box *box,
+					  struct virtio_gpu_object_array *objs,
+					  struct virtio_gpu_fence *fence);
+void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
+					uint32_t ctx_id,
+					uint64_t offset, uint32_t level,
+					struct drm_virtgpu_3d_box *box,
+					struct virtio_gpu_object_array *objs,
+					struct virtio_gpu_fence *fence);
+void
+virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
+				  struct virtio_gpu_object *bo,
+				  struct virtio_gpu_object_params *params,
+				  struct virtio_gpu_object_array *objs,
+				  struct virtio_gpu_fence *fence);
+void virtio_gpu_ctrl_ack(struct virtqueue *vq);
+void virtio_gpu_cursor_ack(struct virtqueue *vq);
+void virtio_gpu_fence_ack(struct virtqueue *vq);
+void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
+void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
+void virtio_gpu_dequeue_fence_func(struct work_struct *work);
+
+#endif /* VIRTIO_GPU_VQ_H */
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
