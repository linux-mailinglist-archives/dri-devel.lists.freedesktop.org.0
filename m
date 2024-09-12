Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D9E976595
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 11:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7974A10E204;
	Thu, 12 Sep 2024 09:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ce5DMemN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AFB10E204
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 09:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726133456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FDMghLFgcsxYTyp2Pq6X9LDi/Bu3IBWDr5oyhSEBic0=;
 b=Ce5DMemNQXcVKy/qY/OWWdNia9VYK7hKZ8Yru8zjT7yeRELWvUYo4UqR+wXQP0GmcXgMks
 aLperku7CFMWpByO0KN2OY8jdZRngdjF6G+LQdn/7inemRfK6ce18ydkO92jdvIl0FLcuW
 4/xh87wAG20AMCq+41gOHETIey+oV7s=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-zmqgpbnyN66CFdq_dboPsQ-1; Thu, 12 Sep 2024 05:30:55 -0400
X-MC-Unique: zmqgpbnyN66CFdq_dboPsQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-71926732629so856978b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 02:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726133454; x=1726738254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FDMghLFgcsxYTyp2Pq6X9LDi/Bu3IBWDr5oyhSEBic0=;
 b=gbSL0a6ZOasQT4uK66D3KPh9g69FL5U9cVP8mBZ4Wmry89i0Kv6nwITou6/GKlwu80
 kVrHL1H+NZOLJbtz/xOv/UNMHmCA+269yL2n8RIOpJfttJ7Y0qPo68SuJb2NhP27JJ3T
 uK82cLGfPfVS0oidmGsT44kuhp2ljfBXC869jyeE4jD62MjUQr8l2vAsANEDLU08FSpB
 boMlkF7pgcViUtKivAAe4RBHG5I/6ahTFcMZBiVjrfFvEhpj83sU5RzR0zNfPLweOr4J
 z2nTzJxGLgNu0BfrzTt8vasX76C3cqj95wJ4G1jg7zadsT244vv/4ZYkxO9pd/FlbOrW
 DACw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuslCFrEvX7chS2o4io45HLPzrEMX/DrpGgmka5WryqM/qz8Np8EYcZT0D1Bb1qyjMBTTjiSXHiAc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+6d8S7t4ssXK48uTJcG/GhG4RD7YTctF++Mk2PWnva5VcE2D8
 WCZtBXlf7TYjUCndOUGLwpb15ujIEhjSOXSSUITmREgxgwCV/zW3bXA7ZNvLfTvK4f4NI033Mj7
 PnERVQUwF9YLXzeM0peGeYYDuC5KviFj0ynFfwNLkNBkBq3ZBRlb3jIbHRWdBDa7ZfA==
X-Received: by 2002:a05:6a00:14d0:b0:717:85e2:28fa with SMTP id
 d2e1a72fcca58-71926087294mr3469648b3a.16.1726133453937; 
 Thu, 12 Sep 2024 02:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTwiKHtvqtPQiXIT9Pbj2q0MFlc8jnTspx3/Qxq+j46pcBDlxb5l/unp4fcC6H2WDgeryRrA==
X-Received: by 2002:a05:6a00:14d0:b0:717:85e2:28fa with SMTP id
 d2e1a72fcca58-71926087294mr3469607b3a.16.1726133453279; 
 Thu, 12 Sep 2024 02:30:53 -0700 (PDT)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71908fca189sm4230931b3a.23.2024.09.12.02.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 02:30:52 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: airlied@redhat.com, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, daniel@ffwll.ch
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jfalempe@redhat.com
Subject: [PATCH] drm/qxl: Add drm_panic support
Date: Thu, 12 Sep 2024 18:30:22 +0900
Message-ID: <20240912093024.661498-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

QXL supports the drm_panic module, which displays a message to the
screen when a kernel panic occurs.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
Sorry for sending similar mails again and again. Please ignore the
following my mails. Let me add dri-devel mailing list and Jocelyn who
developped a drm_panic core and look forward to your comments on this
mail.

https://lore.kernel.org/all/20240911094644.616280-1-ryasuoka@redhat.com/T/#u
https://lore.kernel.org/all/20240911101043.618043-1-ryasuoka@redhat.com/T/#u 

 
 drivers/gpu/drm/qxl/qxl_cmd.c     | 29 ++++++++++
 drivers/gpu/drm/qxl/qxl_display.c | 94 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/qxl/qxl_draw.c    | 57 ++++++++++++++++++-
 drivers/gpu/drm/qxl/qxl_drv.h     | 21 +++++++
 drivers/gpu/drm/qxl/qxl_image.c   | 27 +++++++++
 drivers/gpu/drm/qxl/qxl_object.c  | 62 ++++++++++++++++++++
 drivers/gpu/drm/qxl/qxl_object.h  |  4 ++
 7 files changed, 293 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index d6ea01f3797b..c70041ce55c0 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -174,6 +174,35 @@ static bool qxl_ring_pop(struct qxl_ring *ring,
 	return true;
 }
 
+/* For drm panic */
+int
+qxl_push_command_ring_without_release(struct qxl_device *qdev,
+		struct qxl_bo *bo, uint32_t type, uint32_t offset)
+{
+	struct qxl_command cmd;
+	struct qxl_ring *ring = qdev->command_ring;
+	struct qxl_ring_header *header = &(ring->ring->header);
+	uint8_t *elt;
+	int idx;
+
+	cmd.type = type;
+	cmd.data = qxl_bo_physical_address(qdev, bo, offset);
+
+	idx = header->prod & (ring->n_elements - 1);
+	elt = ring->ring->elements + idx * ring->element_size;
+
+	memcpy((void *)elt, &cmd, ring->element_size);
+
+	header->prod++;
+
+	mb();
+
+	if (header->prod == header->notify_on_prod)
+		outb(0, ring->prod_notify);
+
+	return 0;
+}
+
 int
 qxl_push_command_ring_release(struct qxl_device *qdev, struct qxl_release *release,
 			      uint32_t type, bool interruptible)
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index bc24af08dfcd..b5f2ddfe71a9 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -37,6 +37,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
@@ -889,6 +890,97 @@ static void qxl_plane_cleanup_fb(struct drm_plane *plane,
 	}
 }
 
+static int qxl_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
+							struct drm_scanout_buffer *sb)
+{
+	struct qxl_bo *bo;
+
+	if (!plane->state || !plane->state->fb)
+		return -ENODEV;
+
+	bo = gem_to_qxl_bo(plane->state->fb->obj[0]);
+
+	if (!bo->map.vaddr) {
+		int ret;
+
+		ret = qxl_bo_pin_and_vmap(bo, &sb->map[0]);
+		if (ret)
+			return ret;
+	} else {
+		iosys_map_set_vaddr(&sb->map[0], bo->map.vaddr);
+	}
+
+	sb->format = plane->state->fb->format;
+	sb->height = plane->state->fb->height;
+	sb->width = plane->state->fb->width;
+	sb->pitch[0] = plane->state->fb->pitches[0];
+	return 0;
+}
+
+static void qxl_panic_flush(struct drm_plane *plane)
+{
+	struct qxl_device *qdev = to_qxl(plane->dev);
+	struct qxl_bo *_bo = gem_to_qxl_bo(plane->state->fb->obj[0]);
+	uint8_t *surface_base = _bo->map.vaddr;
+	struct drm_clip_rect rect = {
+		.x1 = 0,
+		.y1 = 0,
+		.x2 = plane->state->fb->width,
+		.y2 = plane->state->fb->height
+	};
+	unsigned int num_clips = 1;
+	struct qxl_bo clips_bo = {};
+	struct qxl_bo image_bo = {};
+	struct qxl_bo chunk_bo = {};
+	struct qxl_drm_image dimage;
+	struct qxl_drm_chunk chunk;
+	int width = rect.x2;
+	int height = rect.y2;
+	int stride = plane->state->fb->pitches[0];
+	int depth = plane->state->fb->format->cpp[0] * 8;
+	struct qxl_rect *rects;
+	struct qxl_rect drawable_rect = {
+		.left = 0,
+		.right = width,
+		.top = 0,
+		.bottom = height,
+	};
+	int cur_idx = 0;
+	int size = 256;
+	struct qxl_bo *bo = qxl_bo_ref(qdev->current_release_bo[cur_idx]);
+	uint32_t offset = qdev->current_release_bo_offset[cur_idx] * size;
+	int ret;
+
+	qxl_panic_bo_create(qdev, sizeof(struct qxl_clip_rects) + sizeof(struct qxl_rect),
+			false, false, QXL_GEM_DOMAIN_VRAM, 0, NULL, &clips_bo);
+
+	ret = qxl_image_alloc_objects_without_release(qdev, &dimage, &chunk, &image_bo, &chunk_bo,
+			surface_base, width, height, depth, stride);
+	if (ret)
+		return;
+
+	ret = make_drawable_without_release(qdev, &drawable_rect, bo, &clips_bo,
+			&dimage, offset, height, width);
+	if (ret)
+		return;
+
+	rects = drawable_set_clipping(qdev, num_clips, &clips_bo);
+	if (!rects)
+		return;
+	rects[0].left = 0;
+	rects[0].right = width;
+	rects[0].top = 0;
+	rects[0].bottom = height;
+
+	qxl_push_command_ring_without_release(qdev, bo, QXL_CMD_DRAW, offset);
+
+	qxl_gem_object_free(&chunk_bo.tbo.base);
+	qxl_gem_object_free(&image_bo.tbo.base);
+
+	qxl_bo_vunmap_locked(&clips_bo);
+	qxl_gem_object_free(&clips_bo.tbo.base);
+}
+
 static const uint32_t qxl_cursor_plane_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
@@ -920,6 +1012,8 @@ static const struct drm_plane_helper_funcs primary_helper_funcs = {
 	.atomic_disable = qxl_primary_atomic_disable,
 	.prepare_fb = qxl_plane_prepare_fb,
 	.cleanup_fb = qxl_plane_cleanup_fb,
+	.get_scanout_buffer = qxl_primary_plane_helper_get_scanout_buffer,
+	.panic_flush = qxl_panic_flush,
 };
 
 static const struct drm_plane_funcs qxl_primary_plane_funcs = {
diff --git a/drivers/gpu/drm/qxl/qxl_draw.c b/drivers/gpu/drm/qxl/qxl_draw.c
index 3a3e127ce297..49fdc0162377 100644
--- a/drivers/gpu/drm/qxl/qxl_draw.c
+++ b/drivers/gpu/drm/qxl/qxl_draw.c
@@ -41,7 +41,8 @@ static int alloc_clips(struct qxl_device *qdev,
 /* returns a pointer to the already allocated qxl_rect array inside
  * the qxl_clip_rects. This is *not* the same as the memory allocated
  * on the device, it is offset to qxl_clip_rects.chunk.data */
-static struct qxl_rect *drawable_set_clipping(struct qxl_device *qdev,
+
+struct qxl_rect *drawable_set_clipping(struct qxl_device *qdev,
 					      unsigned int num_clips,
 					      struct qxl_bo *clips_bo)
 {
@@ -74,6 +75,60 @@ free_drawable(struct qxl_device *qdev, struct qxl_release *release)
 	qxl_release_free(qdev, release);
 }
 
+/* For drm panic */
+int
+make_drawable_without_release(struct qxl_device *qdev,
+		struct qxl_rect *drawable_rect,
+		struct qxl_bo *bo,
+		struct qxl_bo *clips_bo,
+		struct qxl_drm_image *dimage,
+		uint32_t offset, int height, int width)
+{
+	struct qxl_drawable *drawable;
+	union qxl_release_info *info;
+	void *ptr;
+	int i;
+
+	ptr = qxl_bo_kmap_atomic_page(qdev, bo, offset & PAGE_MASK);
+	if (!ptr)
+		return -ENOMEM;
+	drawable = ptr + (offset & ~PAGE_MASK);
+
+	drawable->type = QXL_DRAW_COPY;
+	drawable->surface_id = 0;
+	drawable->effect = QXL_EFFECT_OPAQUE;
+	drawable->self_bitmap = 0;
+	drawable->self_bitmap_area.top = 0;
+	drawable->self_bitmap_area.left = 0;
+	drawable->self_bitmap_area.bottom = 0;
+	drawable->self_bitmap_area.right = 0;
+
+	for (i = 0; i < 3; ++i)
+		drawable->surfaces_dest[i] = -1;
+
+	drawable->bbox = *drawable_rect;
+	drawable->mm_time = qdev->rom->mm_clock;
+	drawable->clip.type = SPICE_CLIP_TYPE_RECTS;
+	drawable->clip.data = qxl_bo_physical_address(qdev, clips_bo, 0);
+	drawable->u.copy.src_area.top = 0;
+	drawable->u.copy.src_area.bottom = height;
+	drawable->u.copy.src_area.left = 0;
+	drawable->u.copy.src_area.right = width;
+	drawable->u.copy.rop_descriptor = SPICE_ROPD_OP_PUT;
+	drawable->u.copy.scale_mode = 0;
+	drawable->u.copy.mask.flags = 0;
+	drawable->u.copy.mask.pos.x = 0;
+	drawable->u.copy.mask.pos.y = 0;
+	drawable->u.copy.mask.bitmap = 0;
+	drawable->u.copy.src_bitmap = qxl_bo_physical_address(qdev, dimage->bo, 0);
+
+	info = &drawable->release_info;
+	ptr = ((void *)info) - (offset & ~PAGE_MASK);
+	qxl_bo_kunmap_atomic_page(qdev, bo, ptr);
+
+	return 0;
+}
+
 /* release needs to be reserved at this point */
 static int
 make_drawable(struct qxl_device *qdev, int surface, uint8_t type,
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 32069acd93f8..93dd0de06c23 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -334,6 +334,13 @@ int qxl_image_init(struct qxl_device *qdev,
 		   const uint8_t *data,
 		   int x, int y, int width, int height,
 		   int depth, int stride);
+
+int qxl_image_alloc_objects_without_release(struct qxl_device *qdev,
+		struct qxl_drm_image *image, struct qxl_drm_chunk *chunk,
+		struct qxl_bo *image_bo, struct qxl_bo *chunk_bo,
+		uint8_t *surface_base, int width,
+		int height, int depth, int stride);
+
 int
 qxl_image_alloc_objects(struct qxl_device *qdev,
 			struct qxl_release *release,
@@ -376,6 +383,9 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 			       int type, struct qxl_release **release,
 			       struct qxl_bo **rbo);
 
+int qxl_push_command_ring_without_release(struct qxl_device *qdev,
+		struct qxl_bo *bo, uint32_t type, uint32_t offset);
+
 int
 qxl_push_command_ring_release(struct qxl_device *qdev, struct qxl_release *release,
 			      uint32_t type, bool interruptible);
@@ -387,6 +397,9 @@ int qxl_alloc_bo_reserved(struct qxl_device *qdev,
 			  unsigned long size,
 			  struct qxl_bo **_bo);
 /* qxl drawing commands */
+struct qxl_rect *drawable_set_clipping(struct qxl_device *qdev,
+					      unsigned int num_clips,
+					      struct qxl_bo *clips_bo);
 
 void qxl_draw_dirty_fb(struct qxl_device *qdev,
 		       struct drm_framebuffer *fb,
@@ -399,6 +412,14 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
 void qxl_release_free(struct qxl_device *qdev,
 		      struct qxl_release *release);
 
+int
+make_drawable_without_release(struct qxl_device *qdev,
+		struct qxl_rect *drawable_rect,
+		struct qxl_bo *bo,
+		struct qxl_bo *clips_bo,
+		struct qxl_drm_image *dimage,
+		uint32_t offset, int height, int width);
+
 /* used by qxl_debugfs_release */
 struct qxl_release *qxl_release_from_id_locked(struct qxl_device *qdev,
 						   uint64_t id);
diff --git a/drivers/gpu/drm/qxl/qxl_image.c b/drivers/gpu/drm/qxl/qxl_image.c
index ffff54e5fb31..2efe0cf133a6 100644
--- a/drivers/gpu/drm/qxl/qxl_image.c
+++ b/drivers/gpu/drm/qxl/qxl_image.c
@@ -52,6 +52,33 @@ qxl_allocate_chunk(struct qxl_device *qdev,
 	return 0;
 }
 
+/* For drm panic */
+int
+qxl_image_alloc_objects_without_release(struct qxl_device *qdev,
+		struct qxl_drm_image *image, struct qxl_drm_chunk *chunk,
+		struct qxl_bo *image_bo, struct qxl_bo *chunk_bo,
+		uint8_t *surface_base, int width, int height,
+		int depth, int stride)
+{
+	int ret;
+	unsigned int chunk_size = sizeof(struct qxl_data_chunk) + stride * height;
+
+	INIT_LIST_HEAD(&image->chunk_list);
+	qxl_panic_bo_create(qdev, sizeof(struct qxl_image), false, false,
+			QXL_GEM_DOMAIN_VRAM, 0, NULL, image_bo);
+	image->bo = image_bo;
+
+	qxl_panic_bo_create(qdev, chunk_size, false, false,
+			QXL_GEM_DOMAIN_VRAM, 0, NULL, chunk_bo);
+	chunk->bo = chunk_bo;
+	list_add_tail(&chunk->head, &image->chunk_list);
+
+	ret = qxl_image_init(qdev, NULL, image, surface_base,
+			     0, 0, width, height, depth, stride);
+	return ret;
+
+}
+
 int
 qxl_image_alloc_objects(struct qxl_device *qdev,
 			struct qxl_release *release,
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 66635c55cf85..9e00700f8f03 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -29,6 +29,23 @@
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
+/* for drm panic */
+static void qxl_panic_ttm_bo_destroy(struct ttm_buffer_object *tbo)
+{
+	struct qxl_bo *bo;
+	struct qxl_device *qdev;
+
+	bo = to_qxl_bo(tbo);
+	qdev = to_qxl(bo->tbo.base.dev);
+
+	qxl_surface_evict(qdev, bo, false);
+	WARN_ON_ONCE(bo->map_count > 0);
+	mutex_lock(&qdev->gem.mutex);
+	list_del_init(&bo->list);
+	mutex_unlock(&qdev->gem.mutex);
+	drm_gem_object_release(&bo->tbo.base);
+}
+
 static void qxl_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 {
 	struct qxl_bo *bo;
@@ -101,6 +118,51 @@ static const struct drm_gem_object_funcs qxl_object_funcs = {
 	.print_info = drm_gem_ttm_print_info,
 };
 
+/* for drm_panic */
+int qxl_panic_bo_create(struct qxl_device *qdev, unsigned long size,
+		  bool kernel, bool pinned, u32 domain, u32 priority,
+		  struct qxl_surface *surf, struct qxl_bo *bo)
+{
+	struct ttm_operation_ctx ctx = { !kernel, false };
+	enum ttm_bo_type type;
+	int r;
+
+	if (kernel)
+		type = ttm_bo_type_kernel;
+	else
+		type = ttm_bo_type_device;
+
+	size = roundup(size, PAGE_SIZE);
+	r = drm_gem_object_init(&qdev->ddev, &bo->tbo.base, size);
+	if (unlikely(r))
+		return r;
+	bo->tbo.base.funcs = &qxl_object_funcs;
+	bo->type = domain;
+	bo->surface_id = 0;
+	INIT_LIST_HEAD(&bo->list);
+
+	if (surf)
+		bo->surf = *surf;
+
+	qxl_ttm_placement_from_domain(bo, domain);
+
+	bo->tbo.priority = priority;
+	r = ttm_bo_init_reserved(&qdev->mman.bdev, &bo->tbo, type,
+				 &bo->placement, 0, &ctx, NULL, NULL,
+				 &qxl_panic_ttm_bo_destroy);
+	if (unlikely(r != 0)) {
+		if (r != -ERESTARTSYS)
+			dev_err(qdev->ddev.dev,
+				"object_init failed for (%lu, 0x%08X)\n",
+				size, domain);
+		return r;
+	}
+	if (pinned)
+		ttm_bo_pin(&bo->tbo);
+	ttm_bo_unreserve(&bo->tbo);
+	return 0;
+}
+
 int qxl_bo_create(struct qxl_device *qdev, unsigned long size,
 		  bool kernel, bool pinned, u32 domain, u32 priority,
 		  struct qxl_surface *surf,
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 875f63221074..4debb8ce6d08 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -53,6 +53,10 @@ static inline unsigned long qxl_bo_size(struct qxl_bo *bo)
 	return bo->tbo.base.size;
 }
 
+extern int qxl_panic_bo_create(struct qxl_device *qdev, unsigned long size,
+		  bool kernel, bool pinned, u32 domain, u32 priority,
+		  struct qxl_surface *surf,
+		  struct qxl_bo *bo);
 extern int qxl_bo_create(struct qxl_device *qdev,
 			 unsigned long size,
 			 bool kernel, bool pinned, u32 domain,
-- 
2.46.0

