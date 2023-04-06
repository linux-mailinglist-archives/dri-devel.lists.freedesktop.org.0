Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE46D9782
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E9710E31F;
	Thu,  6 Apr 2023 13:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6823C10E31F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7+KJL2J4chUJBVwlkqU3Vt/Wzudt4km9ZFkpoqD5z2I=; b=WtgIoIxjjTB5n3Tg6a2qjzUrZ7
 emkli+GajNb4qFwtBMSSB6oszncPqKxCuZ1t/1rj9HePYrk/kJevj6jlwHgwcKe55vmAiJUgRBswF
 AYq6jAcuIWWjkHoPkDEU6BBAG6tndN9Wz/fdURvhWeA3j0F2QTint9YXNrlyX75nMs+noTQFAMAQp
 UKa4j2K2Ci0jLSQ2F+lNqpbBzGtAONjEHpRLgIjJuHgnqDh+wlN9O9ze8qWAlu3CatHEuU7dSee3n
 Fe2h8wXIIrcurJOt+f+tVu0qd9tJmv6sILKITmCZAfxxKXn5wX4Gw1vg5NxKWu0J2zUtfUEn2EiHD
 hCVxE51g==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pkPFe-0084OI-P1; Thu, 06 Apr 2023 15:02:07 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH 2/6] drm/vkms: add rotate-90 property
Date: Thu,  6 Apr 2023 10:01:34 -0300
Message-Id: <20230406130138.70752-3-mcanal@igalia.com>
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

Currently, vkms only supports the rotate-180 property. Therefore,
improve the vkms IGT test coverage by adding the rotate-90 property to
vkms. The rotation was implement by software: rotate the way the
blending occurs by making the source x axis be the destination y axis and
the source y axis be the destination x axis.

Tested with igt@kms_rotation_crc@primary-rotation-90,
igt@kms_rotation_crc@sprite-rotation-90, and
igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 29 ++++++++++----
 drivers/gpu/drm/vkms/vkms_formats.c  | 60 ++++++++++++++++------------
 drivers/gpu/drm/vkms/vkms_plane.c    |  2 +
 3 files changed, 58 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index b7fba786dc4f..ef4e5181d512 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -17,6 +17,9 @@ static struct pixel_argb_u16 *get_out_buffer(const struct vkms_frame_info *frame
 	struct pixel_argb_u16 *out = output_buffer->pixels;
 
 	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_90:
+		out -= frame_info->dst.y1;
+		break;
 	case DRM_MODE_ROTATE_180:
 		out -= frame_info->dst.x1;
 		break;
@@ -58,10 +61,12 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 {
 	struct pixel_argb_u16 *out = get_out_buffer(frame_info, output_buffer);
 	struct pixel_argb_u16 *in = stage_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
+	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
+
+	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+		limit = min_t(size_t, drm_rect_height(&frame_info->dst), stage_buffer->n_pixels);
 
-	for (int x = 0; x < x_limit; x++) {
+	for (int x = 0; x < limit; x++) {
 		out[x].a = (u16)0xffff;
 		out[x].r = pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
 		out[x].g = pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
@@ -72,6 +77,10 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 static int get_y_pos(struct vkms_frame_info *frame_info, int y)
 {
 	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_90:
+		if (y - frame_info->dst.x1 < 0)
+			return -1;
+		return frame_info->dst.x2 - y - 1;
 	case DRM_MODE_ROTATE_180:
 		return drm_rect_height(&frame_info->dst) - y - 1;
 	default:
@@ -79,11 +88,15 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
 	}
 }
 
-static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
+static bool check_limit(struct vkms_frame_info *frame_info, int pos)
 {
-	if (y >= frame_info->dst.y1 && y < frame_info->dst.y2)
-		return true;
-
+	if (frame_info->rotation & DRM_MODE_ROTATE_90) {
+		if (pos >= 0 && pos < drm_rect_width(&frame_info->dst))
+			return true;
+	} else {
+		if (pos >= frame_info->dst.y1 && pos < frame_info->dst.y2)
+			return true;
+	}
 	return false;
 }
 
@@ -125,7 +138,7 @@ static void blend(struct vkms_writeback_job *wb,
 		for (size_t i = 0; i < n_active_planes; i++) {
 			y_pos = get_y_pos(plane[i]->frame_info, y);
 
-			if (!check_y_limit(plane[i]->frame_info, y_pos))
+			if (!check_limit(plane[i]->frame_info, y_pos))
 				continue;
 
 			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y_pos);
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 2f070c505b3b..b874786be6b1 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -49,16 +49,30 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int x_limit,
 	return x;
 }
 
+static int get_limit(const struct vkms_frame_info *frame_info, struct line_buffer *stage_buffer)
+{
+	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+		return min_t(size_t, drm_rect_height(&frame_info->dst), stage_buffer->n_pixels);
+	return min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
+}
+
+static u8 *get_src_pixels(const struct vkms_frame_info *frame_info, int x, int y, int pixel_size)
+{
+	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+		return get_packed_src_addr(frame_info, x + frame_info->dst.y1) + pixel_size * y;
+	return get_packed_src_addr(frame_info, y) + pixel_size * x;
+}
+
 static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
 				 const struct vkms_frame_info *frame_info, int y)
 {
 	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u8 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
+	int limit = get_limit(frame_info, stage_buffer);
+
+	for (size_t x = 0; x < limit; x++) {
+		int x_pos = get_x_position(frame_info, limit, x);
+		u8 *src_pixels = get_src_pixels(frame_info, x, y, 4);
 
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		int x_pos = get_x_position(frame_info, x_limit, x);
 		/*
 		 * The 257 is the "conversion ratio". This number is obtained by the
 		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
@@ -76,12 +90,11 @@ static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
 				 const struct vkms_frame_info *frame_info, int y)
 {
 	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u8 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
+	int limit = get_limit(frame_info, stage_buffer);
 
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		int x_pos = get_x_position(frame_info, x_limit, x);
+	for (size_t x = 0; x < limit; x++) {
+		int x_pos = get_x_position(frame_info, limit, x);
+		u8 *src_pixels = get_src_pixels(frame_info, x, y, 4);
 
 		out_pixels[x_pos].a = (u16)0xffff;
 		out_pixels[x_pos].r = (u16)src_pixels[2] * 257;
@@ -95,12 +108,11 @@ static void ARGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
 				     int y)
 {
 	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u16 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
+	int limit = get_limit(frame_info, stage_buffer);
 
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		int x_pos = get_x_position(frame_info, x_limit, x);
+	for (size_t x = 0; x < limit; x++) {
+		int x_pos = get_x_position(frame_info, limit, x);
+		u8 *src_pixels = get_src_pixels(frame_info, x, y, 4);
 
 		out_pixels[x_pos].a = le16_to_cpu(src_pixels[3]);
 		out_pixels[x_pos].r = le16_to_cpu(src_pixels[2]);
@@ -114,12 +126,11 @@ static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
 				     int y)
 {
 	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u16 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
+	int limit = get_limit(frame_info, stage_buffer);
 
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		int x_pos = get_x_position(frame_info, x_limit, x);
+	for (size_t x = 0; x < limit; x++) {
+		int x_pos = get_x_position(frame_info, limit, x);
+		u8 *src_pixels = get_src_pixels(frame_info, x, y, 4);
 
 		out_pixels[x_pos].a = (u16)0xffff;
 		out_pixels[x_pos].r = le16_to_cpu(src_pixels[2]);
@@ -132,15 +143,14 @@ static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
 			       const struct vkms_frame_info *frame_info, int y)
 {
 	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u16 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			       stage_buffer->n_pixels);
+	int limit = get_limit(frame_info, stage_buffer);
 
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
 
-	for (size_t x = 0; x < x_limit; x++, src_pixels++) {
-		int x_pos = get_x_position(frame_info, x_limit, x);
+	for (size_t x = 0; x < limit; x++) {
+		int x_pos = get_x_position(frame_info, limit, x);
+		u8 *src_pixels = get_src_pixels(frame_info, x, y, 1);
 
 		u16 rgb_565 = le16_to_cpu(*src_pixels);
 		s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 1acf715389d6..94c1e5d891cc 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -123,6 +123,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	drm_framebuffer_get(frame_info->fb);
 	frame_info->rotation = drm_rotation_simplify(new_state->rotation,
 						     DRM_MODE_ROTATE_0 |
+						     DRM_MODE_ROTATE_90 |
 						     DRM_MODE_ROTATE_180);
 
 	drm_rect_rotate(&frame_info->dst, drm_rect_width(&frame_info->dst),
@@ -239,6 +240,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
 					   DRM_MODE_ROTATE_180);
 
 	return plane;
-- 
2.39.2

