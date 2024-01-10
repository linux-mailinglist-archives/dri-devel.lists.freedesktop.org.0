Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEBF829F80
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 18:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126C110E645;
	Wed, 10 Jan 2024 17:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D37110E645
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 17:44:23 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4T9FY22r5kzDqyV;
 Wed, 10 Jan 2024 17:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1704908662; bh=HQz7U8ppxHpCgDfOU0gPu+GqWwC5FYrZtrAlOo+/h7s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pExpneYVyP3TU8ylUk+NXOqVlztvmbd4B3cTiubW6mLbMwltsFHe26SU/9XP/eHcn
 tC6QDxy0CXeb2DxoLnaZPZcetuRihLKFoFN3jVe81s6H/s5947Skjb07KeHfBLv8lB
 qlAhvGxEdA57f79YJz57pj+mAse5jeYtR/j8Dho8=
X-Riseup-User-ID: F7BE572F58C90A0F1FA34089FE62AC2CCAAB8E2EF831BD77876A8860DE8809D0
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4T9FXy0GMKzJp2K;
 Wed, 10 Jan 2024 17:44:17 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Wed, 10 Jan 2024 14:44:02 -0300
Subject: [PATCH v2 2/7] drm/vkms: Add support for multy-planar framebuffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240110-vkms-yuv-v2-2-952fcaa5a193@riseup.net>
References: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
In-Reply-To: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Arthur Grillo <arthurgrillo@riseup.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support to multy-planar formats by adding an index argument to the
framebuffer data access functions.

Also, give all the planes to the conversion functions. This, for now,
should be noop, as all the supported formats have only one plane.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/vkms_drv.h     |  2 +-
 drivers/gpu/drm/vkms/vkms_formats.c | 73 +++++++++++++++++++++----------------
 2 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index b4b357447292..c38590562e4b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -56,7 +56,7 @@ struct vkms_writeback_job {
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
-	void (*pixel_read)(u8 *src_buffer, struct pixel_argb_u16 *out_pixel);
+	void (*pixel_read)(u8 **src_buffer, struct pixel_argb_u16 *out_pixel);
 };
 
 struct vkms_plane {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 172830a3936a..5566a7cd7bb4 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -9,12 +9,12 @@
 
 #include "vkms_formats.h"
 
-static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
+static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y, size_t index)
 {
 	struct drm_framebuffer *fb = frame_info->fb;
 
-	return fb->offsets[0] + (y * fb->pitches[0])
-			      + (x * fb->format->cpp[0]);
+	return fb->offsets[index] + (y * fb->pitches[index])
+				  + (x * fb->format->cpp[index]);
 }
 
 /*
@@ -23,27 +23,25 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
  * @frame_info: Buffer metadata
  * @x: The x(width) coordinate of the 2D buffer
  * @y: The y(Heigth) coordinate of the 2D buffer
+ * @index: The index of the plane on the 2D buffer
  *
  * Takes the information stored in the frame_info, a pair of coordinates, and
- * returns the address of the first color channel.
- * This function assumes the channels are packed together, i.e. a color channel
- * comes immediately after another in the memory. And therefore, this function
- * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
+ * returns the address of the first color channel on the desired index.
  */
 static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
-				int x, int y)
+				int x, int y, size_t index)
 {
-	size_t offset = pixel_offset(frame_info, x, y);
+	size_t offset = pixel_offset(frame_info, x, y, index);
 
 	return (u8 *)frame_info->map[0].vaddr + offset;
 }
 
-static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y)
+static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y, size_t index)
 {
 	int x_src = frame_info->src.x1 >> 16;
 	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
 
-	return packed_pixels_addr(frame_info, x_src, y_src);
+	return packed_pixels_addr(frame_info, x_src, y_src, index);
 }
 
 static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
@@ -53,7 +51,7 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
 	return x;
 }
 
-static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
+static void ARGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
 {
 	/*
 	 * The 257 is the "conversion ratio". This number is obtained by the
@@ -61,23 +59,23 @@ static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixe
 	 * the best color value in a pixel format with more possibilities.
 	 * A similar idea applies to others RGB color conversions.
 	 */
-	out_pixel->a = (u16)src_pixels[3] * 257;
-	out_pixel->r = (u16)src_pixels[2] * 257;
-	out_pixel->g = (u16)src_pixels[1] * 257;
-	out_pixel->b = (u16)src_pixels[0] * 257;
+	out_pixel->a = (u16)src_pixels[0][3] * 257;
+	out_pixel->r = (u16)src_pixels[0][2] * 257;
+	out_pixel->g = (u16)src_pixels[0][1] * 257;
+	out_pixel->b = (u16)src_pixels[0][0] * 257;
 }
 
-static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
+static void XRGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
 {
 	out_pixel->a = (u16)0xffff;
-	out_pixel->r = (u16)src_pixels[2] * 257;
-	out_pixel->g = (u16)src_pixels[1] * 257;
-	out_pixel->b = (u16)src_pixels[0] * 257;
+	out_pixel->r = (u16)src_pixels[0][2] * 257;
+	out_pixel->g = (u16)src_pixels[0][1] * 257;
+	out_pixel->b = (u16)src_pixels[0][0] * 257;
 }
 
-static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
+static void ARGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
 {
-	u16 *pixels = (u16 *)src_pixels;
+	u16 *pixels = (u16 *)src_pixels[0];
 
 	out_pixel->a = le16_to_cpu(pixels[3]);
 	out_pixel->r = le16_to_cpu(pixels[2]);
@@ -85,9 +83,9 @@ static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
 	out_pixel->b = le16_to_cpu(pixels[0]);
 }
 
-static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
+static void XRGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
 {
-	u16 *pixels = (u16 *)src_pixels;
+	u16 *pixels = (u16 *)src_pixels[0];
 
 	out_pixel->a = (u16)0xffff;
 	out_pixel->r = le16_to_cpu(pixels[2]);
@@ -95,9 +93,9 @@ static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_
 	out_pixel->b = le16_to_cpu(pixels[0]);
 }
 
-static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
+static void RGB565_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
 {
-	u16 *pixels = (u16 *)src_pixels;
+	u16 *pixels = (u16 *)src_pixels[0];
 
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
@@ -130,17 +128,28 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 {
 	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
 	struct vkms_frame_info *frame_info = plane->frame_info;
-	u8 *src_pixels = get_packed_src_addr(frame_info, y);
+	const struct drm_format_info *frame_format = frame_info->fb->format;
 	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
+	u8 *src_pixels[DRM_FORMAT_MAX_PLANES];
 
-	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
+	for (size_t i = 0; i < frame_format->num_planes; i++)
+		src_pixels[i] = get_packed_src_addr(frame_info, y, i);
+
+	for (size_t x = 0; x < limit; x++) {
 		int x_pos = get_x_position(frame_info, limit, x);
 
-		if (drm_rotation_90_or_270(frame_info->rotation))
-			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
-				+ frame_info->fb->format->cpp[0] * y;
+		if (drm_rotation_90_or_270(frame_info->rotation)) {
+			for (size_t i = 0; i < frame_format->num_planes; i++) {
+				src_pixels[i] = get_packed_src_addr(frame_info,
+								    x + frame_info->rotated.y1, i);
+				src_pixels[i] += frame_format->cpp[i] * y;
+			}
+		}
 
 		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
+
+		for (size_t i = 0; i < frame_format->num_planes; i++)
+			src_pixels[i] += frame_format->cpp[i];
 	}
 }
 
@@ -221,7 +230,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 {
 	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
 	int x_dst = frame_info->dst.x1;
-	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y, 0);
 	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
 	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
 

-- 
2.43.0

