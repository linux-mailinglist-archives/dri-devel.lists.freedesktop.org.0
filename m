Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B91EA2A640
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 11:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E311A10E824;
	Thu,  6 Feb 2025 10:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QR3cyfjZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4C710E199
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738838614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3s0jePbRTpgxhCyH14hsrRDGitggHfzXm/84FSvA+hs=;
 b=QR3cyfjZDngXVvJURLZUvtmpOtocGVUaeITvBX6xnyT7eDZ/ix8oSCGIBZMiTeVW2IpByL
 e/ct1zcMX26Jz2CuzMf8pDCwNZZFdQiI1oD+mRbgII0z40Ds44rDeLGQgIV7uqiYLj2UIQ
 GdYskiINI1C3VhUVJeXK5FXek80CO/s=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-bRirBkFqPrmIda9sQfKRyg-1; Thu, 06 Feb 2025 05:43:33 -0500
X-MC-Unique: bRirBkFqPrmIda9sQfKRyg-1
X-Mimecast-MFC-AGG-ID: bRirBkFqPrmIda9sQfKRyg
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-21a7cbe3b56so12689355ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 02:43:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738838612; x=1739443412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3s0jePbRTpgxhCyH14hsrRDGitggHfzXm/84FSvA+hs=;
 b=wKhG1BKA/5HmWdSpgYvhPdptlKoi9WZlwpLn8DilqHQl0ad+K5nvS3HweiHaMYjcu/
 MA8sVENZg695SneZnQGKTBYy6FrGZ3sRm+4QFis6zbelhOUYxBPxpq8BPSqdi/KCaTSl
 sLFRn4RSIzTOSdy8Ix9Q/6A+GXOFItUghkAPbkyVvt+fyUMgDPihL/0375qq30NIhcDC
 9psjTdDZ9xI4ZD0Abj5DXM3VAo/9DR0Z8SbOlilBP1i7bWsJWn3GFdZykJciO1EyvYQp
 +ph0XhDcnfgYJ0xoUFsY1nf211Tshr/GxTvz+8GJrXmNPpk9A7uVmhq7s52aiL2Z1NDN
 yW6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr2kZgOR6y+9pV0sQa82cKoUGRK1lvl0D9bg2AbYzuiMZEFIkC3sMRT55PLPFApE50zKUA4mSLdLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI7s8l5Zlk2sUuqJTKjy4KJEiy3gp8/WKgMzh4J+KFtaDzeTUB
 A8SqPe8FT4zOPtN9Ac3VYJo3BxTux2+gNNcB/60/jVetJ58IsIEWeqJL6bwc5sTe1+CQrXGAEzk
 hnaZ5H7jwGgYi7QaIL/oQCN0hsd9O5nnRAAo0tn3CkWyNkIydsCXetOsc+KbaHWDRyg==
X-Gm-Gg: ASbGncsQSOBBzY947m3YUehAOfHdDEAUNJN0gdNG/yo/2DvNWV2YEujn3lhXJwvuIgR
 wvrcZvs4eOanB29eyCFlP/mN3m755wqkLzGkoB1tT6I35dqUaNDvOQTMEcFiVV13ykcHblN/Rjn
 MWcjAP4n1JgdAXIQdjj8/uR01u1gpUObKk3SUOFS620pS23YXizDtcLhQByYxaUm/G9BuxKkTHi
 ruJRkv/tJR/PbSojCBQUB3KVHEVqcIaaOFXH1PEXTO1fXfe5D9AnbZ9vfjX4BcB/GcBA6ZqCbTG
 ujVHPA==
X-Received: by 2002:a05:6a20:3d96:b0:1ed:a4c7:9908 with SMTP id
 adf61e73a8af0-1ede883a434mr10958710637.11.1738838612228; 
 Thu, 06 Feb 2025 02:43:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLcg6VkIL1fuOFq66GhqXyISlfA8NrjTzHzQ7OwLalQ2jttkdccMIk0Vr6RCFa3f1oJqREfw==
X-Received: by 2002:a05:6a20:3d96:b0:1ed:a4c7:9908 with SMTP id
 adf61e73a8af0-1ede883a434mr10958652637.11.1738838611846; 
 Thu, 06 Feb 2025 02:43:31 -0800 (PST)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ad51aecd2fbsm970717a12.19.2025.02.06.02.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 02:43:31 -0800 (PST)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, daniel@ffwll.ch, jfalempe@redhat.com,
 dmitry.osipenko@collabora.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v7] drm/virtio: Add drm_panic support
Date: Thu,  6 Feb 2025 19:42:59 +0900
Message-ID: <20250206104300.416014-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aTI7WiNLhiAZvUSA5CUdh_znptBMQACboLtWcK3NlDg_1738838612
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
the screen when a kernel panic occurs. It is supported where it has
vmapped shmem BO.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
v7:
- Reject no vmapped shmem BO. Also, insert comment and commit log about
  it.
- Restore MAX_INLINE_* and VBUFFER_SIZE definitions to the old place

v6:
https://lore.kernel.org/all/CAHpthZo=R=Csru2P8NVY8YKaasb2RTyrMYni-=8ri4K=xd8abA@mail.gmail.com/

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

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  11 ++
 drivers/gpu/drm/virtio/virtgpu_gem.c   |  14 +++
 drivers/gpu/drm/virtio/virtgpu_plane.c |  96 ++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 151 +++++++++++++++++++++++++
 4 files changed, 272 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f42ca9d8ed10..f17660a71a3e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -310,6 +310,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 				struct drm_device *dev,
 				struct drm_mode_create_dumb *args);
 
+struct virtio_gpu_object_array *virtio_gpu_panic_array_alloc(void);
 struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents);
 struct virtio_gpu_object_array*
 virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents);
@@ -334,12 +335,21 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
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
@@ -408,6 +418,7 @@ void virtio_gpu_ctrl_ack(struct virtqueue *vq);
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
index 42aa554eca9f..a6f5a78f436a 100644
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
@@ -446,11 +490,63 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
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
+
+	/* Only support mapped shmem bo */
+	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach || !bo->base.vaddr)
+		return -ENODEV;
+
+	iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
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
index ad91624df42d..efac4f244d85 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -86,6 +86,22 @@ void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev)
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
@@ -137,6 +153,18 @@ virtio_gpu_alloc_cursor(struct virtio_gpu_device *vgdev,
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
@@ -311,6 +339,34 @@ static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
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
@@ -368,6 +424,32 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
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
@@ -422,6 +504,21 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
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
@@ -567,6 +664,29 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
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
@@ -591,6 +711,37 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
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

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.47.1

