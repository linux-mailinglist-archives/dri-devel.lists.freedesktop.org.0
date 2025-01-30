Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B89A22A09
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 10:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D26010E2F3;
	Thu, 30 Jan 2025 09:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Fx2/MWgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D9710E2F3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738227946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b/Me/1u3C6Fdj+dKIki1ToAPlxQvGrr1yQR3FcauRP0=;
 b=Fx2/MWgN0/dg0qC99Sx2mL7T7fcO6PoueXk/DRjjZZn0Pz59hTtRtErWClPXp53egRHkUb
 mZE9Frw3SfE3DpG8mRSj3wRwtGSGEszTLbIogEmeXOkT3HRYfV1bv3QBuOZTS4q1sOfUbl
 cSpdhFmEyhmT+uTKRvzN/NnYK1Ek15U=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-rHiCb0duOzGjha1c6TZFpQ-1; Thu, 30 Jan 2025 04:05:45 -0500
X-MC-Unique: rHiCb0duOzGjha1c6TZFpQ-1
X-Mimecast-MFC-AGG-ID: rHiCb0duOzGjha1c6TZFpQ
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2efc3292021so1651658a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 01:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738227944; x=1738832744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b/Me/1u3C6Fdj+dKIki1ToAPlxQvGrr1yQR3FcauRP0=;
 b=oMGqRuiBcDbe4qMvwGKINlgrcT7bmipqpwKtrTMkg5/7Yop392tWTOJqFtkIapE7dF
 1VTa9blGSUCiYeJFa6y1GBY0l/z+FybOuHIpdiPztqyzXy9oNbBSS2/BvRSQ3kgBypUF
 opELDhLRVEetTIq44mppqQrQ5En0cLWJreLr5x6rJqBtNu2vEDHZnDbyZgJnVRWyIT7i
 IdXHNELfDnUDo/N2B1bnyrV4nYCHmuIo6vF5/ymy0o6eXdcm+z+SB+QIUHBl9BOP6JCk
 5lcNdyDu6JTkCZEW8Aotcxjt1DyjslBIBG6oWHhW1hk4ShoSP7LH81xEES+rKADl6Rc7
 YMNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgReNbfipyv45uOu6XYXyX/EmouXiKbSkdqyFW6CnI4E9XTYckSZJBw3cxTDkD4sBZC1luUX5Is6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQF1xBP1fSNuqB8lv7dESPDvPM+3aJYxvkNukTr2Dokda0LhI8
 MhLhoUmAAaiWZhW0htthBmuc+hCOE8HeDnGwjQqvai5NpFWyYzhxZRwwkvxCW50qFqAFGPjlU9D
 d8MNaCCviHvVo6IRn+qnp1e0DEx8zyvCdC/Gi/H96M2D1aCRkWNwDfXnFLk1AJf6KAA==
X-Gm-Gg: ASbGncv3gA6APP7Xk604h1Pmy4kuJjU7CUmHml3M6mwmFWN8XBBFaHgMicJhxOg8kZd
 HywAmY+GJQ9NG3JMf2SsUtecmdEdznq/5ObEVe3U5kFaGlHO8m9U/IRU0YIYFasSMuvpuLFx6it
 pTEjQIGmxMk6eR2XMu0SVkzYdtWSDeVuRSagTlBfUl7nrw3MKe5++hJoz5cbJ/DbEDVekbLjSRn
 sxoIGMc/RVEmEYF8Uyu40S0OJlzBoVufJ5srEQF+QaNXQixvKOfN+C+28/XFzq52qpXw6NLxcY1
 T1lfQg==
X-Received: by 2002:a05:6a00:391e:b0:725:cfd0:dffa with SMTP id
 d2e1a72fcca58-72fd0bced35mr8921466b3a.5.1738227944267; 
 Thu, 30 Jan 2025 01:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBbD+Byr2jBgIEjMTy4eB9vEyHEuDof01TNhq6Rh91kC3SrdCjWJ/XPECX2/RvsJOf8mDTIg==
X-Received: by 2002:a05:6a00:391e:b0:725:cfd0:dffa with SMTP id
 d2e1a72fcca58-72fd0bced35mr8921427b3a.5.1738227943831; 
 Thu, 30 Jan 2025 01:05:43 -0800 (PST)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72fe69ce054sm933512b3a.132.2025.01.30.01.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 01:05:42 -0800 (PST)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, daniel@ffwll.ch, jfalempe@redhat.com,
 dmitry.osipenko@collabora.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v6] drm/virtio: Add drm_panic support
Date: Thu, 30 Jan 2025 18:05:15 +0900
Message-ID: <20250130090517.201356-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FA6ETlNDcvQ3wxGEgg5W1OZpZh56y9Tj5tLjDbKfwUQ_1738227944
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Virtio gpu supports the drm_panic module, which displays a message to
the screen when a kernel panic occurs.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
v6:
Based on Dmitry's comment, fix the followings
- Reject external dmabufs backing the GEM object
- Allocate vbuf with kmem_cache_zalloc(..., GFP_ATOMIC) instead of
  drmm_kzalloc().

v5:
https://lore.kernel.org/all/CAHpthZrZ6DjsCQ4baQ80b2vOTdkR=vHDx=10W7DTS4ohxb6=pg@mail.gmail.com/

Based on Dmitry's comment, fix the followings
- Rename virtio_panic_buffer to panic_vbuf
- Remove some unnecessary dummy ret and return directly.
- Reject if the bo is VRAM BO
- Remove virtio_gpu_panic_put_vbuf() before notify
- Add description for panic buffer allocation
- Remove virtio_gpu_panic_object_array and use
  virtio_gpu_panic_array_alloc() to allocate objs instead of static
  allocation in stack.

v4:
https://lore.kernel.org/all/ec721548-0d47-4c40-9e9d-59f58e2181ae@redhat.com/

- As per Dmitry's comment, make virtio_panic_buffer private to
  virtio_gpu_device.

v3:
https://lore.kernel.org/all/09d9815c-9d5b-464b-9362-5b8232d36de1@collabora.com/

- As per Jocelyn's comment, add a finite timeout 500usec in
  virtio_gpu_panic_put_vbuf() to avoid infinite loop

v2:
https://lore.kernel.org/all/d885913e-e81c-488e-8db8-e3f7fae13b2c@redhat.com/

- Remove unnecessary virtio_gpu_vbuffer_inline
- Remove reclaim_list and just call drm_gem_object_put() if there is an
   obj
- Don't wait for an event in virtio_gpu_panic_queue_ctrl_sgs and just
   return -ENOMEM. Also add error handlers for this error.
- Use virtio_gpu_panic_queue_fenced_ctrl_buffer() in
virtio_gpu_panic_cmd_resource_flush
- Remove fence and objs arguments because these are always NULL in panic
   handler.
- Rename virtio_gpu_panic_queue_fenced_ctrl_buffer to
   ..._queue_ctrl_buffer
- Rename virtio_gpu_panic_alloc_cmd to ..._panic_init_cmd

v1:
https://lore.kernel.org/all/c7a4a4cd-ce84-4e87-924d-c1c001fc5d28@redhat.com/

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  17 +++
 drivers/gpu/drm/virtio/virtgpu_gem.c   |  14 +++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 103 ++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 157 ++++++++++++++++++++++++-
 4 files changed, 285 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f42ca9d8ed10..44511f316851 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -126,6 +126,12 @@ struct virtio_gpu_object_array {
 	struct drm_gem_object *objs[] __counted_by(total);
 };
 
+#define MAX_INLINE_CMD_SIZE   96
+#define MAX_INLINE_RESP_SIZE  24
+#define VBUFFER_SIZE	      (sizeof(struct virtio_gpu_vbuffer) \
+			      + MAX_INLINE_CMD_SIZE		 \
+			      + MAX_INLINE_RESP_SIZE)
+
 struct virtio_gpu_vbuffer;
 struct virtio_gpu_device;
 
@@ -310,6 +316,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 				struct drm_device *dev,
 				struct drm_mode_create_dumb *args);
 
+struct virtio_gpu_object_array *virtio_gpu_panic_array_alloc(void);
 struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents);
 struct virtio_gpu_object_array*
 virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents);
@@ -334,12 +341,21 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   struct virtio_gpu_object *bo);
+int virtio_gpu_panic_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
+					     uint64_t offset,
+					     uint32_t width, uint32_t height,
+					     uint32_t x, uint32_t y,
+					     struct virtio_gpu_object_array *objs);
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
 					uint32_t x, uint32_t y,
 					struct virtio_gpu_object_array *objs,
 					struct virtio_gpu_fence *fence);
+void virtio_gpu_panic_cmd_resource_flush(struct virtio_gpu_device *vgdev,
+					 uint32_t resource_id,
+					 uint32_t x, uint32_t y,
+					 uint32_t width, uint32_t height);
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id,
 				   uint32_t x, uint32_t y,
@@ -408,6 +424,7 @@ void virtio_gpu_ctrl_ack(struct virtqueue *vq);
 void virtio_gpu_cursor_ack(struct virtqueue *vq);
 void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
 void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
+void virtio_gpu_panic_notify(struct virtio_gpu_device *vgdev);
 void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
 
 int
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 5aab588fc400..dde8fc1a3689 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -148,6 +148,20 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 	virtio_gpu_notify(vgdev);
 }
 
+/* For drm panic */
+struct virtio_gpu_object_array *virtio_gpu_panic_array_alloc(void)
+{
+	struct virtio_gpu_object_array *objs;
+
+	objs = kmalloc(sizeof(struct virtio_gpu_object_array), GFP_ATOMIC);
+	if (!objs)
+		return NULL;
+
+	objs->nents = 0;
+	objs->total = 1;
+	return objs;
+}
+
 struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
 {
 	struct virtio_gpu_object_array *objs;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 42aa554eca9f..b48b3816b241 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -28,6 +28,8 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <linux/virtio_dma_buf.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_panic.h>
 
 #include "virtgpu_drv.h"
 
@@ -127,6 +129,30 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 	return ret;
 }
 
+/* For drm panic */
+static int virtio_gpu_panic_update_dumb_bo(struct virtio_gpu_device *vgdev,
+					   struct drm_plane_state *state,
+					   struct drm_rect *rect)
+{
+	struct virtio_gpu_object *bo =
+		gem_to_virtio_gpu_obj(state->fb->obj[0]);
+	struct virtio_gpu_object_array *objs;
+	uint32_t w = rect->x2 - rect->x1;
+	uint32_t h = rect->y2 - rect->y1;
+	uint32_t x = rect->x1;
+	uint32_t y = rect->y1;
+	uint32_t off = x * state->fb->format->cpp[0] +
+		y * state->fb->pitches[0];
+
+	objs = virtio_gpu_panic_array_alloc();
+	if (!objs)
+		return -ENOMEM;
+	virtio_gpu_array_add_obj(objs, &bo->base.base);
+
+	return virtio_gpu_panic_cmd_transfer_to_host_2d(vgdev, off, w, h, x, y,
+							objs);
+}
+
 static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 				      struct drm_plane_state *state,
 				      struct drm_rect *rect)
@@ -150,6 +176,24 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 					   objs, NULL);
 }
 
+/* For drm_panic */
+static void virtio_gpu_panic_resource_flush(struct drm_plane *plane,
+					    uint32_t x, uint32_t y,
+					    uint32_t width, uint32_t height)
+{
+	struct drm_device *dev = plane->dev;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_object *bo;
+
+	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
+	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
+
+	virtio_gpu_panic_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
+					    width, height);
+	virtio_gpu_panic_notify(vgdev);
+}
+
 static void virtio_gpu_resource_flush(struct drm_plane *plane,
 				      uint32_t x, uint32_t y,
 				      uint32_t width, uint32_t height)
@@ -446,11 +490,70 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 	virtio_gpu_cursor_ping(vgdev, output);
 }
 
+static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
+					 struct drm_scanout_buffer *sb)
+{
+	struct virtio_gpu_object *bo;
+
+	if (!plane->state || !plane->state->fb || !plane->state->visible)
+		return -ENODEV;
+
+	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
+	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach)
+		return -ENODEV;
+
+	/* try to vmap it if possible */
+	if (!bo->base.vaddr) {
+		int ret;
+
+		ret = drm_gem_shmem_vmap(&bo->base, &sb->map[0]);
+		if (ret)
+			return ret;
+	} else {
+		iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
+	}
+
+	sb->format = plane->state->fb->format;
+	sb->height = plane->state->fb->height;
+	sb->width = plane->state->fb->width;
+	sb->pitch[0] = plane->state->fb->pitches[0];
+	return 0;
+}
+
+static void virtio_panic_flush(struct drm_plane *plane)
+{
+	struct virtio_gpu_object *bo;
+	struct drm_device *dev = plane->dev;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct drm_rect rect;
+
+	rect.x1 = 0;
+	rect.y1 = 0;
+	rect.x2 = plane->state->fb->width;
+	rect.y2 = plane->state->fb->height;
+
+	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
+
+	if (bo->dumb) {
+		if (virtio_gpu_panic_update_dumb_bo(vgdev, plane->state,
+						    &rect))
+			return;
+	}
+
+	virtio_gpu_panic_resource_flush(plane,
+					plane->state->src_x >> 16,
+					plane->state->src_y >> 16,
+					plane->state->src_w >> 16,
+					plane->state->src_h >> 16);
+}
+
 static const struct drm_plane_helper_funcs virtio_gpu_primary_helper_funcs = {
 	.prepare_fb		= virtio_gpu_plane_prepare_fb,
 	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
 	.atomic_check		= virtio_gpu_plane_atomic_check,
 	.atomic_update		= virtio_gpu_primary_plane_update,
+	.get_scanout_buffer	= virtio_drm_get_scanout_buffer,
+	.panic_flush		= virtio_panic_flush,
 };
 
 static const struct drm_plane_helper_funcs virtio_gpu_cursor_helper_funcs = {
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index ad91624df42d..a5e9adadb149 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -36,12 +36,6 @@
 #include "virtgpu_drv.h"
 #include "virtgpu_trace.h"
 
-#define MAX_INLINE_CMD_SIZE   96
-#define MAX_INLINE_RESP_SIZE  24
-#define VBUFFER_SIZE          (sizeof(struct virtio_gpu_vbuffer) \
-			       + MAX_INLINE_CMD_SIZE		 \
-			       + MAX_INLINE_RESP_SIZE)
-
 static void convert_to_hw_box(struct virtio_gpu_box *dst,
 			      const struct drm_virtgpu_3d_box *src)
 {
@@ -86,6 +80,22 @@ void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev)
 	vgdev->vbufs = NULL;
 }
 
+/* For drm_panic */
+static struct virtio_gpu_vbuffer*
+virtio_gpu_panic_get_vbuf(struct virtio_gpu_device *vgdev, int size)
+{
+	struct virtio_gpu_vbuffer *vbuf;
+
+	vbuf = kmem_cache_zalloc(vgdev->vbufs, GFP_ATOMIC);
+
+	vbuf->buf = (void *)vbuf + sizeof(*vbuf);
+	vbuf->size = size;
+	vbuf->resp_cb = NULL;
+	vbuf->resp_size = sizeof(struct virtio_gpu_ctrl_hdr);
+	vbuf->resp_buf = (void *)vbuf->buf + size;
+	return vbuf;
+}
+
 static struct virtio_gpu_vbuffer*
 virtio_gpu_get_vbuf(struct virtio_gpu_device *vgdev,
 		    int size, int resp_size, void *resp_buf,
@@ -137,6 +147,18 @@ virtio_gpu_alloc_cursor(struct virtio_gpu_device *vgdev,
 	return (struct virtio_gpu_update_cursor *)vbuf->buf;
 }
 
+/* For drm_panic */
+static void *virtio_gpu_panic_alloc_cmd_resp(struct virtio_gpu_device *vgdev,
+					     struct virtio_gpu_vbuffer **vbuffer_p,
+					     int cmd_size)
+{
+	struct virtio_gpu_vbuffer *vbuf;
+
+	vbuf = virtio_gpu_panic_get_vbuf(vgdev, cmd_size);
+	*vbuffer_p = vbuf;
+	return (struct virtio_gpu_command *)vbuf->buf;
+}
+
 static void *virtio_gpu_alloc_cmd_resp(struct virtio_gpu_device *vgdev,
 				       virtio_gpu_resp_cb cb,
 				       struct virtio_gpu_vbuffer **vbuffer_p,
@@ -311,6 +333,34 @@ static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
 	return sgt;
 }
 
+/* For drm_panic */
+static int virtio_gpu_panic_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
+					   struct virtio_gpu_vbuffer *vbuf,
+					   int elemcnt,
+					   struct scatterlist **sgs,
+					   int outcnt,
+					   int incnt)
+{
+	struct virtqueue *vq = vgdev->ctrlq.vq;
+	int ret;
+
+	if (vgdev->has_indirect)
+		elemcnt = 1;
+
+	if (vq->num_free < elemcnt)
+		return -ENOMEM;
+
+	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
+	WARN_ON(ret);
+
+	vbuf->seqno = ++vgdev->ctrlq.seqno;
+	trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf), vbuf->seqno);
+
+	atomic_inc(&vgdev->pending_commands);
+
+	return 0;
+}
+
 static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 				     struct virtio_gpu_vbuffer *vbuf,
 				     struct virtio_gpu_fence *fence,
@@ -368,6 +418,32 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 	return 0;
 }
 
+/* For drm_panic */
+static int virtio_gpu_panic_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
+					      struct virtio_gpu_vbuffer *vbuf)
+{
+	struct scatterlist *sgs[3], vcmd, vresp;
+	int elemcnt = 0, outcnt = 0, incnt = 0;
+
+	/* set up vcmd */
+	sg_init_one(&vcmd, vbuf->buf, vbuf->size);
+	elemcnt++;
+	sgs[outcnt] = &vcmd;
+	outcnt++;
+
+	/* set up vresp */
+	if (vbuf->resp_size) {
+		sg_init_one(&vresp, vbuf->resp_buf, vbuf->resp_size);
+		elemcnt++;
+		sgs[outcnt + incnt] = &vresp;
+		incnt++;
+	}
+
+	return virtio_gpu_panic_queue_ctrl_sgs(vgdev, vbuf,
+					       elemcnt, sgs,
+					       outcnt, incnt);
+}
+
 static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 					       struct virtio_gpu_vbuffer *vbuf,
 					       struct virtio_gpu_fence *fence)
@@ -422,6 +498,21 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 	return ret;
 }
 
+/* For drm_panic */
+void virtio_gpu_panic_notify(struct virtio_gpu_device *vgdev)
+{
+	bool notify;
+
+	if (!atomic_read(&vgdev->pending_commands))
+		return;
+
+	atomic_set(&vgdev->pending_commands, 0);
+	notify = virtqueue_kick_prepare(vgdev->ctrlq.vq);
+
+	if (notify)
+		virtqueue_notify(vgdev->ctrlq.vq);
+}
+
 void virtio_gpu_notify(struct virtio_gpu_device *vgdev)
 {
 	bool notify;
@@ -567,6 +658,29 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
 
+/* For drm_panic */
+void virtio_gpu_panic_cmd_resource_flush(struct virtio_gpu_device *vgdev,
+					  uint32_t resource_id,
+					  uint32_t x, uint32_t y,
+					  uint32_t width, uint32_t height)
+{
+	struct virtio_gpu_resource_flush *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+
+	cmd_p = virtio_gpu_panic_alloc_cmd_resp(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+	vbuf->objs = NULL;
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_FLUSH);
+	cmd_p->resource_id = cpu_to_le32(resource_id);
+	cmd_p->r.width = cpu_to_le32(width);
+	cmd_p->r.height = cpu_to_le32(height);
+	cmd_p->r.x = cpu_to_le32(x);
+	cmd_p->r.y = cpu_to_le32(y);
+
+	virtio_gpu_panic_queue_ctrl_buffer(vgdev, vbuf);
+}
+
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id,
 				   uint32_t x, uint32_t y,
@@ -591,6 +705,37 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
+/* For drm_panic */
+int virtio_gpu_panic_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
+					     uint64_t offset,
+					     uint32_t width, uint32_t height,
+					     uint32_t x, uint32_t y,
+					     struct virtio_gpu_object_array *objs)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	struct virtio_gpu_transfer_to_host_2d *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
+
+	if (virtio_gpu_is_shmem(bo) && use_dma_api)
+		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
+					    bo->base.sgt, DMA_TO_DEVICE);
+
+	cmd_p = virtio_gpu_panic_alloc_cmd_resp(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+	vbuf->objs = objs;
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->offset = cpu_to_le64(offset);
+	cmd_p->r.width = cpu_to_le32(width);
+	cmd_p->r.height = cpu_to_le32(height);
+	cmd_p->r.x = cpu_to_le32(x);
+	cmd_p->r.y = cpu_to_le32(y);
+
+	return virtio_gpu_panic_queue_ctrl_buffer(vgdev, vbuf);
+}
+
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,

base-commit: 64179a1416e1420a34226ab3beb5f84710953d16
-- 
2.47.1

