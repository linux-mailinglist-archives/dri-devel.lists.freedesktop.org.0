Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4731D6E24C5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 15:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F37010ED47;
	Fri, 14 Apr 2023 13:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAFD10ED47
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EoZFHB7SCliV2xlgQKM1lEt9HiRQzrC/Y//4enoFB1U=; b=qXPWPizyF/+K0Ziz9nQ2utBCOI
 4lA50atKfAVrQW4e4xzsbaZMl2xThRX1P7sEOE1Y/ylbe6wrVfehSIUSpDbGruV4bN3vi2fFJfYfY
 5RjH0wL7K9C+BUNq59CbQsAgNZxWbDv/wa/7HvcLuM7cp3FHbPZhCLwAQ0n4e7uXwPQCxOP4v7s7s
 1NJ7SN1myZfAiRb+p9RNUhVfdJ4gaxFwHdnwMXgQAPNWvXqTG5Id6YIC17Rbv5cK3sGhxLrHNlaV7
 vgPHXHWDlo7Jt12jXJx13JyuqyRiQSk640dsTd2mjN9IBWJWVfFlRuj460pC8Dvi71loYt8gXZ2I8
 BCgd2nrQ==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pnJqa-0015Av-F7; Fri, 14 Apr 2023 15:52:16 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 3/7] drm/vkms: add rotate-90 property
Date: Fri, 14 Apr 2023 10:51:47 -0300
Message-Id: <20230414135151.75975-4-mcanal@igalia.com>
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
 drivers/gpu/drm/vkms/vkms_composer.c | 29 ++++++++++++++++++++--------
 drivers/gpu/drm/vkms/vkms_formats.c  | 28 ++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_plane.c    |  2 ++
 3 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 914d85ac1654..824bb65badb7 100644
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
 
 			vkms_compose_row(stage_buffer, plane[i], y_pos);
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 7a98d4d75f17..90b72b0ff8c9 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -49,6 +49,20 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int x_limit,
 	return x;
 }
 
+static int get_limit(const struct vkms_frame_info *frame_info, struct line_buffer *stage_buffer)
+{
+	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+		return min_t(size_t, drm_rect_height(&frame_info->dst), stage_buffer->n_pixels);
+	return min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
+}
+
+static void *get_src_pixels(const struct vkms_frame_info *frame_info, int x, int y, int pixel_size)
+{
+	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+		return get_packed_src_addr(frame_info, x + frame_info->dst.y1) + pixel_size * y;
+	return get_packed_src_addr(frame_info, y) + pixel_size * x;
+}
+
 static void ARGB8888_to_argb_u16(u16 *src_pixels, struct pixel_argb_u16 *out_pixels, int x)
 {
 	u8 *pixels = (u8 *)src_pixels;
@@ -110,21 +124,21 @@ static void RGB565_to_argb_u16(u16 *src_pixels, struct pixel_argb_u16 *out_pixel
 void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
 {
 	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u16 *src_pixels = get_packed_src_addr(plane->frame_info, y);
-	int limit = min_t(size_t, drm_rect_width(&plane->frame_info->dst),
-			  stage_buffer->n_pixels);
+	int limit = get_limit(plane->frame_info, stage_buffer);
 	int format = plane->frame_info->fb->format->format;
 	int pixel_size, x_pos;
+	u16 *src_pixels;
 
 	if (format == DRM_FORMAT_RGB565)
-		pixel_size = 1;
-	else if (format == DRM_FORMAT_ARGB8888 || format == DRM_FORMAT_XRGB8888)
 		pixel_size = 2;
-	else
+	else if (format == DRM_FORMAT_ARGB8888 || format == DRM_FORMAT_XRGB8888)
 		pixel_size = 4;
+	else
+		pixel_size = 8;
 
-	for (size_t x = 0; x < limit; x++, src_pixels += pixel_size) {
+	for (size_t x = 0; x < limit; x++) {
 		x_pos = get_x_position(plane->frame_info, limit, x);
+		src_pixels = get_src_pixels(plane->frame_info, x, y, pixel_size);
 
 		plane->pixel_read(src_pixels, out_pixels, x_pos);
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index f6a884b5872c..ce2ebe56f6e4 100644
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

