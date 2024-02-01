Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AF9845E9F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 18:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0716710F292;
	Thu,  1 Feb 2024 17:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GKaN44fN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3420610F28E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 17:35:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 7903CC2D3E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 17:32:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 180691C000B;
 Thu,  1 Feb 2024 17:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706808732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3zxaDJx0ige/xrGelusoCYKzSbgA6rlzzgnKpQREhA=;
 b=GKaN44fNIPV1Q3EWB45XLQBsfN24J28ISFD43uu+ngs+is/9nKz+gcL+1fvcdGimGjJHwY
 f/UsdfzOf+HQwMHT2nROXP84j+eZcyYo2L/Y/m1yi6FfkmQ1jsJ/M0QSlIbaRMYBsqO9Kp
 Z1BYsAAcy+XDteXWe1/09Lff6xN9XCYBLoag+Wyz23oKmh6d0aiWHqR2Uywk2fRVCIJaL/
 EcAB6iT5AzO45MJYH9SX2ieAfuXRJbD3QKo9AUnux4OayeYnu1zmhv98WKMaLqVatgSlaG
 IoHVbN8QTQtYOuoN0nVsWk6WxyhJGpVQBOFpQ7XAK6o0xi0mzyk6Tzy0XkvMRQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 01 Feb 2024 18:31:32 +0100
Subject: [PATCH 2/2] drm/vkms: Use a simpler composition function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
In-Reply-To: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, marcheu@google.com, seanpaul@google.com, 
 nicolejadeyee@google.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, thomas.petazzoni@bootlin.com, 
 miquel.raynal@bootlin.com
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=25546;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Lyvp37yqP/RKGqGObubMXl4szy7JAwmzZhexN7cT3RY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBlu9WZN+h0hVSORpgCsnNgPV3oNEnfy78OJ2TZx6Uk
 FWszM9OJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZbvVmQAKCRAgrS7GWxAs4keKD/
 9iYIHu+QsSQBi1SNKIGSIvJrvqhGO+pJqNubzaebjCgoxnY9DxjzaCqS9Isc4Cw+dKgJoQPKOxYmjZ
 f7zZye/8+AiFpNd8lGgmAGkzffeNVw9TciajNLlOaYw/tRca/g5d9NChLh9WsJkTern7wri0/jMLcy
 gnKV5lsEheLhkyDzdafRPlDxXBubzariATSOKnAY1yPkGMQ9Ah0spU00TROkifkMsYi5nc5h2Y5NoB
 sBj+P3svpie6urXSyckKnMZzV+8VjfHn1MH36Vd2ZW4X7fgM3WCSVgTEgYT7Pi1Kvt4ZIu4udcwlz8
 gx/XIu4pACUN/Dysc5L18jlYa5GrbLxbfubPQshVV6BYbm4VFdBXWzDp1SYu7zoZssmQBO3MQAnLW8
 rBbB95fPy468pAUtw9Af3XgtVJyutQLcAj2DsbIxih6y7yZ4Awctb0rQyviziqB49nWUApZtXs9+6T
 tPlKL9BL5NMMHJ//j1UjxcbDH7BUTZ1GYfnIJjxllJi1quq5yGS/Sd8A7v2clBHZ0qe52/LDUe1x2D
 po/wDiUh/te4YwkpYza+wI2ba9Wy6nBW2SIsQObE85ngYNU7dVN4m8C2cPKCB+pENxVKRSBjZcQQAq
 wtu63wPmIpTNLu7XZSn37O1evYyQ8pkZKJR6sk+VcbEXpailezRMZFZf37Rw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Change the composition algorithm to iterate over pixels instead of lines.
It allows a simpler management of rotation and pixel access for complex formats.

This new algorithm allows read_pixel function to have access to x/y
coordinates and make it possible to read the correct thing in a block
when block_w and block_h are not 1.
The iteration pixel-by-pixel in the same method also allows a simpler
management of rotation with drm_rect_* helpers. This way it's not needed
anymore to have misterious switch-case distributed in multiple places.

This patch is tested with IGT:
- kms_plane@pixel_format
- kms_plane@pixel-format-source-clamping
- kms_plane@plane-position-covered
- kms_plane@plane-position-hole
- kms_plane@plane-position-hole-dpms
- kms_plane@plane-panning-top-left
- kms_plane@plane-panning-bottom-right
- kms_plane@test-odd-size-with-yuv - See [1]
- kms_cursor_crc@cursor-size-change
- kms_cursor_crc@cursor-alpha-opaque
- kms_cursor_crc@cursor-alpha-transparent
- kms_cursor_crc@cursor-dpms
- kms_cursor_crc@cursor-onscreen-*
- kms_cursor_crc@cursor-offscreen-*
- kms_cursor_crc@cursor-sliding-*
- kms_cursor_crc@cursor-random-*
- kms_cursor_crc@cursor-rapid-movement-* - FAIL, but with Overflow of
CRC buffer
- kms_rotation_crc@primary-rotation-* - See [1]
- kms_rotation_crc@sprite-rotation-* - See [1]
- kms_rotation_crc@cursor-rotation-* - See [1]
- kms_rotation_crc@sprite-rotation-90-pos-100-0 - See [1]
- kms_rotation_crc@multiplane-rotation - See [1]
- kms_rotation_crc@multiplane-rotation-cropping-* - See [1]

[1]: https://lore.kernel.org/igt-dev/20240201-kms_tests-v1-0-bc34c5d28b3f@bootlin.com/T/#t

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c |  97 +++++++++-----
 drivers/gpu/drm/vkms/vkms_drv.h      |  21 ++-
 drivers/gpu/drm/vkms/vkms_formats.c  | 250 ++++++++++++++++++-----------------
 drivers/gpu/drm/vkms/vkms_plane.c    |  13 +-
 4 files changed, 221 insertions(+), 160 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 3c99fb8b54e2..4c5439209907 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -43,7 +43,7 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 {
 	int x_dst = frame_info->dst.x1;
 	struct pixel_argb_u16 *out = output_buffer->pixels + x_dst;
-	struct pixel_argb_u16 *in = stage_buffer->pixels;
+	struct pixel_argb_u16 *in = stage_buffer->pixels + x_dst;
 	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
 			    stage_buffer->n_pixels);
 
@@ -55,33 +55,6 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 	}
 }
 
-static int get_y_pos(struct vkms_frame_info *frame_info, int y)
-{
-	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
-		return drm_rect_height(&frame_info->rotated) - y - 1;
-
-	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
-	case DRM_MODE_ROTATE_90:
-		return frame_info->rotated.x2 - y - 1;
-	case DRM_MODE_ROTATE_270:
-		return y + frame_info->rotated.x1;
-	default:
-		return y;
-	}
-}
-
-static bool check_limit(struct vkms_frame_info *frame_info, int pos)
-{
-	if (drm_rotation_90_or_270(frame_info->rotation)) {
-		if (pos >= 0 && pos < drm_rect_width(&frame_info->rotated))
-			return true;
-	} else {
-		if (pos >= frame_info->rotated.y1 && pos < frame_info->rotated.y2)
-			return true;
-	}
-
-	return false;
-}
 
 static void fill_background(const struct pixel_argb_u16 *background_color,
 			    struct line_buffer *output_buffer)
@@ -182,18 +155,74 @@ static void blend(struct vkms_writeback_job *wb,
 	const struct pixel_argb_u16 background_color = { .a = 0xffff };
 
 	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
+	size_t crtc_x_limit = crtc_state->base.crtc->mode.hdisplay;
 
+	/*
+	 * Iterating over each pixel to simplify the handling of rotations by using drm_rect_*
+	 * helpers.
+	 * Iteration per pixel also allosw a simple management of complex pixel formats.
+	 *
+	 * If needed, this triple loop might be a good place for optimizations.
+	 */
 	for (size_t y = 0; y < crtc_y_limit; y++) {
 		fill_background(&background_color, output_buffer);
 
 		/* The active planes are composed associatively in z-order. */
 		for (size_t i = 0; i < n_active_planes; i++) {
-			y_pos = get_y_pos(plane[i]->frame_info, y);
-
-			if (!check_limit(plane[i]->frame_info, y_pos))
-				continue;
-
-			vkms_compose_row(stage_buffer, plane[i], y_pos);
+			for (size_t x = 0; x < crtc_x_limit; x++) {
+				/*
+				 * @x and @y are the coordinate in the output crtc.
+				 * @dst_px is used to easily check if a pixel must be blended.
+				 * @src_px is used to handle rotation. Just before blending, it
+				 *  will contain the coordinate of the wanted source pixel in
+				 *  the source buffer.
+				 * @tmp_src is the conversion of src rectangle to integer.
+				 */
+
+				struct drm_rect dst_px = DRM_RECT_INIT(x, y, 1, 1);
+				struct drm_rect src_px = DRM_RECT_INIT(x, y, 1, 1);
+				struct drm_rect tmp_src;
+
+				drm_rect_fp_to_int(&tmp_src, &plane[i]->frame_info->src);
+
+				/*
+				 * Check that dst_px is inside the plane output
+				 * Note: This is destructive for dst_px, if you need this
+				 * rectangle you have to do a copy
+				 */
+				if (!drm_rect_intersect(&dst_px, &plane[i]->frame_info->dst))
+					continue;
+
+				/*
+				 * Transform the coordinate x/y from the crtc to coordinates into
+				 * coordinates for the src buffer.
+				 *
+				 * First step is to cancel the offset of the dst buffer.
+				 * Then t will have to invert the rotation. This assumes that
+				 * dst = drm_rect_rotate(src, rotation) (dst and src have the
+				 * space size, but can be rotated).
+				 * And then, apply the offset of the source rectangle to the
+				 * coordinate.
+				 */
+				drm_rect_translate(&src_px, -plane[i]->frame_info->dst.x1,
+						   -plane[i]->frame_info->dst.y1);
+				drm_rect_rotate_inv(&src_px,
+						    drm_rect_width(&tmp_src),
+						    drm_rect_height(&tmp_src),
+						    plane[i]->frame_info->rotation);
+				drm_rect_translate(&src_px, tmp_src.x1, tmp_src.y1);
+
+				/*
+				 * Now, as the src_px contains the correct position, we can use
+				 * it to convert the pixel color
+				 */
+				plane[i]->pixel_read(plane[i]->frame_info,
+						     src_px.x1,
+						     src_px.y1,
+						     &stage_buffer->pixels[x],
+						     plane[i]->base.base.color_encoding,
+						     plane[i]->base.base.color_range);
+			}
 			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
 					    output_buffer);
 		}
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index cb20bab26cae..ba3c063adc5f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -25,10 +25,20 @@
 
 #define VKMS_LUT_SIZE 256
 
+/**
+ * struct vkms_frame_info - structure to store the state of a frame
+ *
+ * @fb: backing drm framebuffer
+ * @src: source rectangle of this frame in the source framebuffer
+ * @dst: destination rectangle in the crtc buffer
+ * @map: see drm_shadow_plane_state@data
+ * @rotation: rotation applied to the source.
+ *
+ * @src and @dst should have the same size modulo the rotation.
+ */
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
-	struct drm_rect rotated;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int rotation;
 };
@@ -51,14 +61,15 @@ struct vkms_writeback_job {
 /**
  * typedef pixel_read_t - These functions are used to read the pixels in the source frame, convert
  * them to argb16 and write them to out_pixel.
- * It assumes that src_pixels point to a valid pixel (not a block, or a block of 1x1 pixel)
  *
- * @src_pixels: Source pointer to a pixel
+ * @frame_info: Frame used as source for the pixel value
+ * @x: X (width) coordinate in the source buffer
+ * @y: Y (height) coordinate in the source buffer
  * @out_pixel: Pointer where to write the pixel value
  * @encoding: Color encoding to use (mainly used for YUV formats)
  * @range: Color range to use (mainly used for YUV formats)
  */
-typedef void (*pixel_read_t)(u8 **src_pixels, int y,
+typedef void (*pixel_read_t)(struct vkms_frame_info *frame_info, int x, int y,
 			     struct pixel_argb_u16 *out_pixel, enum drm_color_encoding enconding,
 			     enum drm_color_range range);
 
@@ -66,6 +77,8 @@ typedef void (*pixel_read_t)(u8 **src_pixels, int y,
  * vkms_plane_state - Driver specific plane state
  * @base: base plane state
  * @frame_info: data required for composing computation
+ * @pixel_read: function to read a pixel in this plane. The creator of a vkms_plane_state must
+ * ensure that this pointer is valid
  */
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index c6376db58d38..8ff85ffda94f 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -11,79 +11,88 @@
 
 #include "vkms_formats.h"
 
-static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y, size_t index)
+
+/**
+ * packed_pixels_offset() - Get the offset of the block containing the pixel at coordinates x/y
+ *
+ * @frame_info: Buffer metadata
+ * @x: The x coordinate of the wanted pixel in the buffer
+ * @y: The y coordinate of the wanted pixel in the buffer
+ * @plane: The index of the plane to use
+ *
+ * The caller must be aware that this offset is not always a pointer to a pixel. If individual
+ * pixel values are needed, they have to be extracted from the block.
+ */
+static size_t packed_pixels_offset(const struct vkms_frame_info *frame_info, int x, int y, size_t plane)
 {
 	struct drm_framebuffer *fb = frame_info->fb;
-
-	return fb->offsets[index] + (y * fb->pitches[index])
-				  + (x * fb->format->cpp[index]);
+	const struct drm_format_info *format = frame_info->fb->format;
+	/* Directly using x and y to multiply pitches and format->ccp is not sufficient because
+	 * in some formats a block can represent multiple pixels.
+	 *
+	 * Dividing x and y by the block size allows to extract the correct offset of the block
+	 * containing the pixel.
+	 */
+	return fb->offsets[plane] +
+	       (y / drm_format_info_block_width(format, plane)) * fb->pitches[plane] +
+	       (x / drm_format_info_block_height(format, plane)) * format->char_per_block[plane];
 }
 
 /*
- * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
+ * packed_pixels_addr - Get the pointer to the block containing the pixel at the given coordinate
  *
  * @frame_info: Buffer metadata
- * @x: The x(width) coordinate of the 2D buffer
- * @y: The y(Heigth) coordinate of the 2D buffer
+ * @x: The x(width) coordinate inside the 2D buffer
+ * @y: The y(Heigth) coordinate inside the 2D buffer
  * @index: The index of the plane on the 2D buffer
  *
- * Takes the information stored in the frame_info, a pair of coordinates, and
- * returns the address of the first color channel on the desired index. The
- * format's specific subsample is applied.
+ * Takes the information stored in the frame_info, a pair of coordinates, and returns the address
+ * of the block containing this pixel.
+ * The caller must be aware that this pointer is sometimes not directly a pixel, it needs some
+ * additional work to extract pixel color from this block.
  */
 static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
 				int x, int y, size_t index)
 {
-	int vsub = index == 0 ? 1 : frame_info->fb->format->vsub;
-	int hsub = index == 0 ? 1 : frame_info->fb->format->hsub;
-	size_t offset = pixel_offset(frame_info, x / hsub, y / vsub, index);
-
-	return (u8 *)frame_info->map[0].vaddr + offset;
+	return (u8 *)frame_info->map[0].vaddr + packed_pixels_offset(frame_info, x, y, index);
 }
 
-static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y, size_t index)
+static void ARGB8888_to_argb_u16(struct vkms_frame_info *frame_info, int x, int y,
+				 struct pixel_argb_u16 *out_pixel, enum drm_color_encoding encoding,
+				 enum drm_color_range range)
 {
-	int x_src = frame_info->src.x1 >> 16;
-	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
-
-	return packed_pixels_addr(frame_info, x_src, y_src, index);
-}
+	u8 *src_pixel = packed_pixels_addr(frame_info, x, y, 0);
 
-static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
-{
-	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
-		return limit - x - 1;
-	return x;
-}
-
-static void ARGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
-				 enum drm_color_encoding encoding, enum drm_color_range range)
-{
 	/*
 	 * The 257 is the "conversion ratio". This number is obtained by the
 	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
 	 * the best color value in a pixel format with more possibilities.
 	 * A similar idea applies to others RGB color conversions.
 	 */
-	out_pixel->a = (u16)src_pixels[0][3] * 257;
-	out_pixel->r = (u16)src_pixels[0][2] * 257;
-	out_pixel->g = (u16)src_pixels[0][1] * 257;
-	out_pixel->b = (u16)src_pixels[0][0] * 257;
+	out_pixel->a = (u16)src_pixel[3] * 257;
+	out_pixel->r = (u16)src_pixel[2] * 257;
+	out_pixel->g = (u16)src_pixel[1] * 257;
+	out_pixel->b = (u16)src_pixel[0] * 257;
 }
 
-static void XRGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
-				 enum drm_color_encoding encoding, enum drm_color_range range)
+static void XRGB8888_to_argb_u16(struct vkms_frame_info *frame_info, int x, int y,
+				 struct pixel_argb_u16 *out_pixel, enum drm_color_encoding encoding,
+				 enum drm_color_range range)
 {
+	u8 *src_pixel = packed_pixels_addr(frame_info, x, y, 0);
 	out_pixel->a = (u16)0xffff;
-	out_pixel->r = (u16)src_pixels[0][2] * 257;
-	out_pixel->g = (u16)src_pixels[0][1] * 257;
-	out_pixel->b = (u16)src_pixels[0][0] * 257;
+	out_pixel->r = (u16)src_pixel[2] * 257;
+	out_pixel->g = (u16)src_pixel[1] * 257;
+	out_pixel->b = (u16)src_pixel[0] * 257;
 }
 
-static void ARGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
-				     enum drm_color_encoding encoding, enum drm_color_range range)
+static void ARGB16161616_to_argb_u16(struct vkms_frame_info *frame_info, int x, int y,
+				     struct pixel_argb_u16 *out_pixel,
+				     enum drm_color_encoding encoding,
+				     enum drm_color_range range)
 {
-	u16 *pixels = (u16 *)src_pixels[0];
+	u8 *src_pixel = packed_pixels_addr(frame_info, x, y, 0);
+	u16 *pixels = (u16 *)src_pixel;
 
 	out_pixel->a = le16_to_cpu(pixels[3]);
 	out_pixel->r = le16_to_cpu(pixels[2]);
@@ -91,10 +100,13 @@ static void ARGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out
 	out_pixel->b = le16_to_cpu(pixels[0]);
 }
 
-static void XRGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
-				     enum drm_color_encoding encoding, enum drm_color_range range)
+static void XRGB16161616_to_argb_u16(struct vkms_frame_info *frame_info, int x, int y,
+				     struct pixel_argb_u16 *out_pixel,
+				     enum drm_color_encoding encoding,
+				     enum drm_color_range range)
 {
-	u16 *pixels = (u16 *)src_pixels[0];
+	u8 *src_pixel = packed_pixels_addr(frame_info, x, y, 0);
+	u16 *pixels = (u16 *)src_pixel;
 
 	out_pixel->a = (u16)0xffff;
 	out_pixel->r = le16_to_cpu(pixels[2]);
@@ -102,10 +114,12 @@ static void XRGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out
 	out_pixel->b = le16_to_cpu(pixels[0]);
 }
 
-static void RGB565_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
-			       enum drm_color_encoding encoding, enum drm_color_range range)
+static void RGB565_to_argb_u16(struct vkms_frame_info *frame_info, int x, int y,
+			       struct pixel_argb_u16 *out_pixel, enum drm_color_encoding encoding,
+			       enum drm_color_range range)
 {
-	u16 *pixels = (u16 *)src_pixels[0];
+	u8 *src_pixel = packed_pixels_addr(frame_info, x, y, 0);
+	u16 *pixels = (u16 *)src_pixel;
 
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
@@ -121,12 +135,19 @@ static void RGB565_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel
 	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
 }
 
+/**
+ * ycbcr2rgb() - helper to convert ycbcr 8 bits to rbg 16 bits
+ *
+ * @m: conversion matrix to use
+ * @y, @cb, @cr: component of the ycbcr pixel
+ * @r, @g, @b: pointers to write the rbg pixel
+ */
 static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r, u8 *g, u8 *b)
 {
 	s32 y_16, cb_16, cr_16;
 	s32 r_16, g_16, b_16;
 
-	y_16 =  y - y_offset;
+	y_16 = y - y_offset;
 	cb_16 = cb - 128;
 	cr_16 = cr - 128;
 
@@ -139,6 +160,14 @@ static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r,
 	*b = clamp(b_16, 0, 0xffff) >> 8;
 }
 
+/**
+ * yuv_u8_to_argb_u16() - helper to convert yuv 8 bits to argb 16 bits
+ *
+ * @argb_u16: pointer to write the converted pixel
+ * @yuv_u8: pointer to the source yuv pixel
+ * @encoding: encoding to use
+ * @range: range to use
+ */
 VISIBLE_IF_KUNIT void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16,
 					 const struct pixel_yuv_u8 *yuv_u8,
 					 enum drm_color_encoding encoding,
@@ -205,104 +234,89 @@ VISIBLE_IF_KUNIT void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16,
 }
 EXPORT_SYMBOL_IF_KUNIT(yuv_u8_to_argb_u16);
 
-static void semi_planar_yuv_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
+static void semi_planar_yuv_to_argb_u16(struct vkms_frame_info *frame_info, int x,
+					int y, struct pixel_argb_u16 *out_pixel,
 					enum drm_color_encoding encoding,
 					enum drm_color_range range)
 {
 	struct pixel_yuv_u8 yuv_u8;
 
-	yuv_u8.y = src_pixels[0][0];
-	yuv_u8.u = src_pixels[1][0];
-	yuv_u8.v = src_pixels[1][1];
+	/* Subsampling must be applied for semi-planar yuv formats */
+	int vsub = frame_info->fb->format->vsub;
+	int hsub = frame_info->fb->format->hsub;
+
+	u8 *src_y = packed_pixels_addr(frame_info, x, y, 0);
+	u8 *src_uv = packed_pixels_addr(frame_info, x / hsub, y / vsub, 1);
+
+	yuv_u8.y = src_y[0];
+	yuv_u8.u = src_uv[0];
+	yuv_u8.v = src_uv[1];
 
 	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
 }
 
-static void semi_planar_yvu_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
+static void semi_planar_yvu_to_argb_u16(struct vkms_frame_info *frame_info, int x,
+					int y, struct pixel_argb_u16 *out_pixel,
 					enum drm_color_encoding encoding,
 					enum drm_color_range range)
 {
 	struct pixel_yuv_u8 yuv_u8;
 
-	yuv_u8.y = src_pixels[0][0];
-	yuv_u8.v = src_pixels[1][0];
-	yuv_u8.u = src_pixels[1][1];
+	/* Subsampling must be applied for semi-planar yuv formats */
+	int vsub = frame_info->fb->format->vsub ? frame_info->fb->format->vsub : 1;
+	int hsub = frame_info->fb->format->hsub ? frame_info->fb->format->hsub : 1;
+	u8 *src_y = packed_pixels_addr(frame_info, x, y, 0);
+	u8 *src_vu = packed_pixels_addr(frame_info, x / hsub, y / vsub, 1);
+
+	yuv_u8.y = src_y[0];
+	yuv_u8.v = src_vu[0];
+	yuv_u8.u = src_vu[1];
 
 	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
 }
 
-static void planar_yuv_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
-				   enum drm_color_encoding encoding, enum drm_color_range range)
+static void planar_yuv_to_argb_u16(struct vkms_frame_info *frame_info, int x, int y,
+				   struct pixel_argb_u16 *out_pixel,
+				   enum drm_color_encoding encoding,
+				   enum drm_color_range range)
 {
 	struct pixel_yuv_u8 yuv_u8;
 
-	yuv_u8.y = src_pixels[0][0];
-	yuv_u8.u = src_pixels[1][0];
-	yuv_u8.v = src_pixels[2][0];
+	/* Subsampling must be applied for planar yuv formats */
+	int vsub = frame_info->fb->format->vsub ? frame_info->fb->format->vsub : 1;
+	int hsub = frame_info->fb->format->hsub ? frame_info->fb->format->hsub : 1;
+
+	u8 *src_y = packed_pixels_addr(frame_info, x, y, 0);
+	u8 *src_u = packed_pixels_addr(frame_info, x / hsub, y / vsub, 1);
+	u8 *src_v = packed_pixels_addr(frame_info, x / hsub, y / vsub, 2);
+
+	yuv_u8.y = src_y[0];
+	yuv_u8.u = src_u[0];
+	yuv_u8.v = src_v[0];
 
 	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
 }
 
-static void planar_yvu_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
-				   enum drm_color_encoding encoding, enum drm_color_range range)
+static void planar_yvu_to_argb_u16(struct vkms_frame_info *frame_info, int x, int y,
+				   struct pixel_argb_u16 *out_pixel,
+				   enum drm_color_encoding encoding,
+				   enum drm_color_range range)
 {
 	struct pixel_yuv_u8 yuv_u8;
 
-	yuv_u8.y = src_pixels[0][0];
-	yuv_u8.v = src_pixels[1][0];
-	yuv_u8.u = src_pixels[2][0];
+	/* Subsampling must be applied for semi-planar yuv formats */
+	int vsub = frame_info->fb->format->vsub ? frame_info->fb->format->vsub : 1;
+	int hsub = frame_info->fb->format->hsub ? frame_info->fb->format->hsub : 1;
 
-	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
-}
+	u8 *src_y = packed_pixels_addr(frame_info, x, y, 0);
+	u8 *src_u = packed_pixels_addr(frame_info, x / hsub, y / vsub, 1);
+	u8 *src_v = packed_pixels_addr(frame_info, x / hsub, y / vsub, 2);
 
-/**
- * vkms_compose_row - compose a single row of a plane
- * @stage_buffer: output line with the composed pixels
- * @plane: state of the plane that is being composed
- * @y: y coordinate of the row
- *
- * This function composes a single row of a plane. It gets the source pixels
- * through the y coordinate (see get_packed_src_addr()) and goes linearly
- * through the source pixel, reading the pixels and converting it to
- * ARGB16161616 (see the pixel_read() callback). For rotate-90 and rotate-270,
- * the source pixels are not traversed linearly. The source pixels are queried
- * on each iteration in order to traverse the pixels vertically.
- */
-void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
-{
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	struct vkms_frame_info *frame_info = plane->frame_info;
-	const struct drm_format_info *frame_format = frame_info->fb->format;
-	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
-	u8 *src_pixels[DRM_FORMAT_MAX_PLANES];
-
-	enum drm_color_encoding encoding = plane->base.base.color_encoding;
-	enum drm_color_range range = plane->base.base.color_range;
-
-	for (size_t i = 0; i < frame_format->num_planes; i++)
-		src_pixels[i] = get_packed_src_addr(frame_info, y, i);
-
-	for (size_t x = 0; x < limit; x++) {
-		int x_pos = get_x_position(frame_info, limit, x);
-
-		bool shoud_inc = !((x + 1) % frame_format->num_planes);
-
-		if (drm_rotation_90_or_270(frame_info->rotation)) {
-			for (size_t i = 0; i < frame_format->num_planes; i++) {
-				src_pixels[i] = get_packed_src_addr(frame_info,
-								    x + frame_info->rotated.y1, i);
-				if (!i || shoud_inc)
-					src_pixels[i] += frame_format->cpp[i] * y;
-			}
-		}
-
-		plane->pixel_read(src_pixels, &out_pixels[x_pos], encoding, range);
-
-		for (size_t i = 0; i < frame_format->num_planes; i++) {
-			if (!i || shoud_inc)
-				src_pixels[i] += frame_format->cpp[i];
-		}
-	}
+	yuv_u8.y = src_y[0];
+	yuv_u8.v = src_u[0];
+	yuv_u8.u = src_v[0];
+
+	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
 }
 
 /*
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 932736fc3ee9..d818ed246a46 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -118,13 +118,20 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 		return;
 
 	fmt = fb->format->format;
+	pixel_read_t pixel_read = get_pixel_conversion_function(fmt);
+	
+	if (!pixel_read) {
+		DRM_WARN("The requested pixel format is not supported by VKMS. The new state is "
+			 "not applied.\n");
+		return;
+	}
+
 	vkms_plane_state = to_vkms_plane_state(new_state);
 	shadow_plane_state = &vkms_plane_state->base;
 
 	frame_info = vkms_plane_state->frame_info;
 	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
 	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
-	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));
 	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
@@ -134,10 +141,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 						     DRM_MODE_REFLECT_X |
 						     DRM_MODE_REFLECT_Y);
 
-	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
-			drm_rect_height(&frame_info->rotated), frame_info->rotation);
 
-	vkms_plane_state->pixel_read = get_pixel_conversion_function(fmt);
+	vkms_plane_state->pixel_read = pixel_read;
 }
 
 static int vkms_plane_atomic_check(struct drm_plane *plane,

-- 
2.43.0

