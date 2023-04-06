Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8106D9783
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9A410E2B3;
	Thu,  6 Apr 2023 13:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F6510E31F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B3jbdo12pDafd905LJGsQp4ubzxunPMw1TGmEuLdZAU=; b=YIPtUmiZlPmqGffVIRcWOY3AmG
 ppSW06p0udzwuyWHZtNPsCxNBt8dJ0BFlqF0pK9kMq8mtKXawjx8z9rk7iEQj9cq3B01iZZlPuN2z
 qXV20MZWv5ZhaCsYwqawGeyxmnz83ofzV6Hr3kQxKh4+DH+b6gpSEJpfaEzhQkyycX5fB3NqQPPFe
 O3a+4lyqMPuCfiP8MCdX4Ear85pSlzJowo+YKlUdS5y9P8hrYEvGhm4ogi0jYAAuhK6aKlaBD2z2M
 DuEy7BecVx84pfazsR+2Qhlzqpxc3bPg1pGopDJ6UWSS2zDkKNmmoGt8qh+qMlZVVK7pSWfjOWh1E
 MSR/gVjw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pkPFb-0084OI-5v; Thu, 06 Apr 2023 15:02:03 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH 1/6] drm/vkms: add rotate-0 and rotate-180 properties
Date: Thu,  6 Apr 2023 10:01:33 -0300
Message-Id: <20230406130138.70752-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406130138.70752-1-mcanal@igalia.com>
References: <20230406130138.70752-1-mcanal@igalia.com>
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
 drivers/gpu/drm/vkms/vkms_composer.c | 39 ++++++++++++++++---
 drivers/gpu/drm/vkms/vkms_drv.h      |  1 +
 drivers/gpu/drm/vkms/vkms_formats.c  | 56 ++++++++++++++++++----------
 drivers/gpu/drm/vkms/vkms_plane.c    | 12 ++++++
 4 files changed, 83 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 8e53fa80742b..b7fba786dc4f 100644
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
 
-			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
+			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y_pos);
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
index 4a248567efb2..be6ec2fe0b87 100644
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
index d4950688b3f1..2f070c505b3b 100644
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
 static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
 				 const struct vkms_frame_info *frame_info, int y)
 {
@@ -51,16 +58,17 @@ static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
 			    stage_buffer->n_pixels);
 
 	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
+		int x_pos = get_x_position(frame_info, x_limit, x);
 		/*
 		 * The 257 is the "conversion ratio". This number is obtained by the
 		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
 		 * the best color value in a pixel format with more possibilities.
 		 * A similar idea applies to others RGB color conversions.
 		 */
-		out_pixels[x].a = (u16)src_pixels[3] * 257;
-		out_pixels[x].r = (u16)src_pixels[2] * 257;
-		out_pixels[x].g = (u16)src_pixels[1] * 257;
-		out_pixels[x].b = (u16)src_pixels[0] * 257;
+		out_pixels[x_pos].a = (u16)src_pixels[3] * 257;
+		out_pixels[x_pos].r = (u16)src_pixels[2] * 257;
+		out_pixels[x_pos].g = (u16)src_pixels[1] * 257;
+		out_pixels[x_pos].b = (u16)src_pixels[0] * 257;
 	}
 }
 
@@ -73,10 +81,12 @@ static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
 			    stage_buffer->n_pixels);
 
 	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		out_pixels[x].a = (u16)0xffff;
-		out_pixels[x].r = (u16)src_pixels[2] * 257;
-		out_pixels[x].g = (u16)src_pixels[1] * 257;
-		out_pixels[x].b = (u16)src_pixels[0] * 257;
+		int x_pos = get_x_position(frame_info, x_limit, x);
+
+		out_pixels[x_pos].a = (u16)0xffff;
+		out_pixels[x_pos].r = (u16)src_pixels[2] * 257;
+		out_pixels[x_pos].g = (u16)src_pixels[1] * 257;
+		out_pixels[x_pos].b = (u16)src_pixels[0] * 257;
 	}
 }
 
@@ -90,10 +100,12 @@ static void ARGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
 			    stage_buffer->n_pixels);
 
 	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		out_pixels[x].a = le16_to_cpu(src_pixels[3]);
-		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
-		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
-		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
+		int x_pos = get_x_position(frame_info, x_limit, x);
+
+		out_pixels[x_pos].a = le16_to_cpu(src_pixels[3]);
+		out_pixels[x_pos].r = le16_to_cpu(src_pixels[2]);
+		out_pixels[x_pos].g = le16_to_cpu(src_pixels[1]);
+		out_pixels[x_pos].b = le16_to_cpu(src_pixels[0]);
 	}
 }
 
@@ -107,10 +119,12 @@ static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
 			    stage_buffer->n_pixels);
 
 	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		out_pixels[x].a = (u16)0xffff;
-		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
-		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
-		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
+		int x_pos = get_x_position(frame_info, x_limit, x);
+
+		out_pixels[x_pos].a = (u16)0xffff;
+		out_pixels[x_pos].r = le16_to_cpu(src_pixels[2]);
+		out_pixels[x_pos].g = le16_to_cpu(src_pixels[1]);
+		out_pixels[x_pos].b = le16_to_cpu(src_pixels[0]);
 	}
 }
 
@@ -126,15 +140,17 @@ static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
 
 	for (size_t x = 0; x < x_limit; x++, src_pixels++) {
+		int x_pos = get_x_position(frame_info, x_limit, x);
+
 		u16 rgb_565 = le16_to_cpu(*src_pixels);
 		s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
 		s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
 		s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
 
-		out_pixels[x].a = (u16)0xffff;
-		out_pixels[x].r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
-		out_pixels[x].g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
-		out_pixels[x].b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
+		out_pixels[x_pos].a = (u16)0xffff;
+		out_pixels[x_pos].r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
+		out_pixels[x_pos].g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
+		out_pixels[x_pos].b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
 	}
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index c41cec7dcb70..1acf715389d6 100644
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

