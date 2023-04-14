Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012056E24C4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 15:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3028E10ED54;
	Fri, 14 Apr 2023 13:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2968C10ED53
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l3odwZxGyp2ETY5QW6pw+NrbbvIvMsItUKhMJ3bAxC4=; b=sn6jC6FtFgpZWwHKoVI/KfQ9X6
 XVTfZymDCmeXm64EDmNtLmB6BXC1vyQcmj9LU2ir7MP2Y7FPiZrG71OczE5N9UiL71yO1FhXp73xf
 SI5MNE1xYOO9rXsZcQ9kkA4PcfJCPmuR6J0cXAT3L964bWR/v+OzuJAlfm68bCzVSVhd8jQR4C7Bk
 GeX41CJCoHIFpO3oSA/AA19w37gwyikxrqaJlday7j874jvxBxu9wKhC2CxnIJFPYP7LZ2XYE06Q0
 PfqULVLxjKdrvgisg15YBlQys5mk0afio9gMYXVOkM5JrR1ErQHecGB6nsQg734xJQdrZkqTbuh+J
 L32WCddw==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pnJqW-0015Av-Lu; Fri, 14 Apr 2023 15:52:12 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 2/7] drm/vkms: add rotate-0 and rotate-180 properties
Date: Fri, 14 Apr 2023 10:51:46 -0300
Message-Id: <20230414135151.75975-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414135151.75975-1-mcanal@igalia.com>
References: <20230414135151.75975-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, vkms doesn't support any rotation property. Therefore,
improve the vkms IGT test coverage by adding the rotate-0 and rotate-180
properties to vkms. The rotation was implemented by software: invert the
way the blending occurs by reverse reading the x and y axis.

Tested with igt@kms_rotation_crc@primary-rotation-180,
igt@kms_rotation_crc@sprite-rotation-180, and
igt@kms_rotation_crc@cursor-rotation-180.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 39 ++++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_drv.h      |  1 +
 drivers/gpu/drm/vkms/vkms_formats.c  | 16 +++++++++---
 drivers/gpu/drm/vkms/vkms_plane.c    | 12 +++++++++
 4 files changed, 60 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 80164e79af00..914d85ac1654 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -11,6 +11,23 @@
 
 #include "vkms_drv.h"
 
+static struct pixel_argb_u16 *get_out_buffer(const struct vkms_frame_info *frame_info,
+					     struct line_buffer *output_buffer)
+{
+	struct pixel_argb_u16 *out = output_buffer->pixels;
+
+	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_180:
+		out -= frame_info->dst.x1;
+		break;
+	default:
+		out += frame_info->dst.x1;
+		break;
+	}
+
+	return out;
+}
+
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
 	u32 new_color;
@@ -39,8 +56,7 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 				struct line_buffer *stage_buffer,
 				struct line_buffer *output_buffer)
 {
-	int x_dst = frame_info->dst.x1;
-	struct pixel_argb_u16 *out = output_buffer->pixels + x_dst;
+	struct pixel_argb_u16 *out = get_out_buffer(frame_info, output_buffer);
 	struct pixel_argb_u16 *in = stage_buffer->pixels;
 	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
 			    stage_buffer->n_pixels);
@@ -53,6 +69,16 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 	}
 }
 
+static int get_y_pos(struct vkms_frame_info *frame_info, int y)
+{
+	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_180:
+		return drm_rect_height(&frame_info->dst) - y - 1;
+	default:
+		return y;
+	}
+}
+
 static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
 {
 	if (y >= frame_info->dst.y1 && y < frame_info->dst.y2)
@@ -86,6 +112,7 @@ static void blend(struct vkms_writeback_job *wb,
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
+	int y_pos;
 
 	const struct pixel_argb_u16 background_color = { .a = 0xffff };
 
@@ -96,10 +123,12 @@ static void blend(struct vkms_writeback_job *wb,
 
 		/* The active planes are composed associatively in z-order. */
 		for (size_t i = 0; i < n_active_planes; i++) {
-			if (!check_y_limit(plane[i]->frame_info, y))
+			y_pos = get_y_pos(plane[i]->frame_info, y);
+
+			if (!check_y_limit(plane[i]->frame_info, y_pos))
 				continue;
 
-			vkms_compose_row(stage_buffer, plane[i], y);
+			vkms_compose_row(stage_buffer, plane[i], y_pos);
 			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
 					    output_buffer);
 		}
@@ -107,7 +136,7 @@ static void blend(struct vkms_writeback_job *wb,
 		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
 
 		if (wb)
-			wb->wb_write(&wb->wb_frame_info, output_buffer, y);
+			wb->wb_write(&wb->wb_frame_info, output_buffer, y_pos);
 	}
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index d7ad813d7ae7..8344395d7745 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -27,6 +27,7 @@ struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
+	unsigned int rotation;
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 02b0fc5a0839..7a98d4d75f17 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -42,6 +42,13 @@ static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y
 	return packed_pixels_addr(frame_info, x_src, y_src);
 }
 
+static int get_x_position(const struct vkms_frame_info *frame_info, int x_limit, int x)
+{
+	if (frame_info->rotation & DRM_MODE_ROTATE_180)
+		return x_limit - x - 1;
+	return x;
+}
+
 static void ARGB8888_to_argb_u16(u16 *src_pixels, struct pixel_argb_u16 *out_pixels, int x)
 {
 	u8 *pixels = (u8 *)src_pixels;
@@ -107,7 +114,7 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 	int limit = min_t(size_t, drm_rect_width(&plane->frame_info->dst),
 			  stage_buffer->n_pixels);
 	int format = plane->frame_info->fb->format->format;
-	int pixel_size;
+	int pixel_size, x_pos;
 
 	if (format == DRM_FORMAT_RGB565)
 		pixel_size = 1;
@@ -116,8 +123,11 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 	else
 		pixel_size = 4;
 
-	for (size_t x = 0; x < limit; x++, src_pixels += pixel_size)
-		plane->pixel_read(src_pixels, out_pixels, x);
+	for (size_t x = 0; x < limit; x++, src_pixels += pixel_size) {
+		x_pos = get_x_position(plane->frame_info, limit, x);
+
+		plane->pixel_read(src_pixels, out_pixels, x_pos);
+	}
 }
 
 /*
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 0a23875900ec..f6a884b5872c 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -120,6 +121,13 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
+	frame_info->rotation = drm_rotation_simplify(new_state->rotation,
+						     DRM_MODE_ROTATE_0 |
+						     DRM_MODE_ROTATE_180);
+
+	drm_rect_rotate(&frame_info->dst, drm_rect_width(&frame_info->dst),
+			drm_rect_height(&frame_info->dst), frame_info->rotation);
+
 	frame_info->offset = fb->offsets[0];
 	frame_info->pitch = fb->pitches[0];
 	frame_info->cpp = fb->format->cpp[0];
@@ -229,5 +237,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, funcs);
 
+	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
+					   DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_180);
+
 	return plane;
 }
-- 
2.39.2

