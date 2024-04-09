Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E089DA2E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5995112DAB;
	Tue,  9 Apr 2024 13:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZSJaitEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB2E112D92
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:25:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEE5B24001B;
 Tue,  9 Apr 2024 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712669155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7MqH53Mi2+vD97DpWYNuhALEeJoED4yvxYDn1eAC7U=;
 b=ZSJaitEniBjaTvm7BoYCR6zsmCws1Q8H/ppvHbO8L1oOSCqxiPeQVw+F4s4P/OQbt+d9WE
 Otb0JO65k0+O/RzjpuTY4sflmSmudlQ2p8W+o6S9Y5BsNMaXCL3QZd8vDdpC3oYCxVMfEI
 SvmnzM5o8zi2qUIW2jE69M9kqjSX2eE+RGIopQufTd1NHGVsuD7HPI3IyC9IhF1BnBdIjV
 bPzd1OLRIW+Jb49V8ayS2FBgyhpAynRVKa6ZVqV4wDULYxgpUE/bcB3JxszUPSiIDP3ZHR
 DnoG/nAsMcA/TzhVBrZYSQkWC4U6bhoJJGJhnHQX6QHy9RCBun050pzvCtHTig==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Apr 2024 15:25:28 +0200
Subject: [PATCH v6 10/17] drm/vkms: Re-introduce line-per-line composition
 algorithm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-yuv-v6-10-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
In-Reply-To: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=30458;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CpVIEuZUyZ49jUg/7Vi9wH/UZ0THyU8gchWS1zLGgoM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmFUHS2d2KFiT4sjP3IKcLfW5IKu75mPaXMSZrC
 aMMmZ8G7/KJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZhVB0gAKCRAgrS7GWxAs
 4iTjEACZusGCt+tUzSteGJGKojxz1FUUvvsp4caaE8UmxZ3HJE33PPB42Z5sVMUNQerGoeuZfY4
 Sf7CRQCtA/8v7pbyGI63rPFufYnkQbB8ioXooWPhB3p73hc23Ov21vsroKAvoVFhlpIDrGhiRc/
 K0XPkVMJpwZjzgcDaspwkUwqzixPES9oGuDbhnXKCoGWlS8ba0q6w8z6OUy37BtdTd64n788jme
 nuM8ihK7gzrfe0f7wK4aNzmzDef0zo5K6c07NQsh1jWNA+LjSIUpwhqpnZHLJXr1YAc+vU6suek
 sqW6U9jwf5QP9vf3y3wdTX/md5lh2oDAGZtWwjK1HsOnM6xya5Fz1qa+h6ydQk0TQqgjvAHSRmr
 EJjbsC02sLGcOjSd006+H7IL1kGcLg/icL8cDk3p4M5tt4BOGdC9zrSFj10s5xeOcMH7UB0907K
 SGpBUzkLQSD/Mth3U08UC0OckWVsK8WK8SSmkFcJAQiOY8s5a07FrES40bjn0Anjy6rU3xW1CxM
 iIy14A6bXtu92lRuviMRkjPVoJ6Ja83I1V/irli5i9oLHciUJZ4DZ4GL4uVTT5/JjBK4Lnjv7I3
 SskCrnXPN6rk2XwmPaz3wb2v7ubWfs2Hk/+yq7oJqNDpn+/kbqyjIziBDyV1FfSPl2iKVufl0yr
 I+Ck/naAI8R9P5A==
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

Re-introduce a line-by-line composition algorithm for each pixel format.
This allows more performance by not requiring an indirection per pixel
read. This patch is focused on readability of the code.

Line-by-line composition was introduced by [1] but rewritten back to
pixel-by-pixel algorithm in [2]. At this time, nobody noticed the impact
on performance, and it was merged.

This patch is almost a revert of [2], but in addition efforts have been
made to increase readability and maintainability of the rotation handling.
The blend function is now divided in two parts:
- Transformation of coordinates from the output referential to the source
referential
- Line conversion and blending

Most of the complexity of the rotation management is avoided by using
drm_rect_* helpers. The remaining complexity is around the clipping, to
avoid reading/writing outside source/destination buffers.

The pixel conversion is now done line-by-line, so the read_pixel_t was
replaced with read_pixel_line_t callback. This way the indirection is only
required once per line and per plane, instead of once per pixel and per
plane.

The read_line_t callbacks are very similar for most pixel format, but it
is required to avoid performance impact. Some helpers for color
conversion were introduced to avoid code repetition:
- *_to_argb_u16: perform colors conversion. They should be inlined by the
  compiler, and they are used to avoid repetition between multiple variants
  of the same format (argb/xrgb and maybe in the future for formats like
  bgr formats).

This new algorithm was tested with:
- kms_plane (for color conversions)
- kms_rotation_crc (for rotations of planes)
- kms_cursor_crc (for translations of planes)
- kms_rotation (for all rotations and formats combinations) [3]
The performance gain was mesured with:
- kms_fb_stress

[1]: commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to accept
     new formats")
     https://lore.kernel.org/all/20220905190811.25024-7-igormtorrente@gmail.com/
[2]: commit 322d716a3e8a ("drm/vkms: isolate pixel conversion
     functionality")
     https://lore.kernel.org/all/20230418130525.128733-2-mcanal@igalia.com/
[3]: https://lore.kernel.org/igt-dev/20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 230 ++++++++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_drv.h      |  27 ++--
 drivers/gpu/drm/vkms/vkms_formats.c  | 240 +++++++++++++++++++++--------------
 drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
 drivers/gpu/drm/vkms/vkms_plane.c    |   5 +-
 5 files changed, 347 insertions(+), 157 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 7c2e328c9510..8c8a3c629485 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -29,8 +29,8 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
  * @x_start: The start offset
  * @pixel_count: The number of pixels to blend
  *
- * The pixels 0..@pixel_count in stage_buffer are blended at @x_start..@x_start+@pixel_count in
- * output_buffer.
+ * The pixels @x_start..@x_start+@pixel_count in stage_buffer are blended at
+ * @x_start..@x_start+@pixel_count in output_buffer.
  *
  * The current DRM assumption is that pixel color values have been already
  * pre-multiplied with the alpha channel values. See more
@@ -41,7 +41,7 @@ static void pre_mul_alpha_blend(const struct line_buffer *stage_buffer,
 				struct line_buffer *output_buffer, int x_start, int pixel_count)
 {
 	struct pixel_argb_u16 *out = &output_buffer->pixels[x_start];
-	const struct pixel_argb_u16 *in = stage_buffer->pixels;
+	const struct pixel_argb_u16 *in = &stage_buffer->pixels[x_start];
 
 	for (int i = 0; i < pixel_count; i++) {
 		out[i].a = (u16)0xffff;
@@ -51,33 +51,6 @@ static void pre_mul_alpha_blend(const struct line_buffer *stage_buffer,
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
@@ -201,6 +174,180 @@ static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
 	return READ_LEFT_TO_RIGHT;
 }
 
+/**
+ * clamp_line_coordinates() - Compute and clamp the coordinate to read and write during the blend
+ * process.
+ *
+ * @direction: direction of the reading
+ * @current_plane: current plane blended
+ * @src_line: source line of the reading
+ * @dst: destination rectangle
+ * @src_x_start: final x start coordinate for the line reading
+ * @src_y_start: final y start coordinate for the line reading
+ * @dst_x_start: final x coordinate to blend the read line
+ * @pixel_count: number of pixel to blend
+ *
+ * This function is mainly a safety net to avoid reading outside the source buffer. As the
+ * userspace should never ask to read outside the source plane, all the cases covered here should
+ * be dead code.
+ */
+static void clamp_line_coordinates(enum pixel_read_direction direction,
+				   const struct vkms_plane_state *current_plane,
+				   const struct drm_rect *src_line, int *src_x_start,
+				   int *src_y_start, int *dst_x_start, int *pixel_count)
+{
+	/* By default the start points are correct */
+	*src_x_start = src_line->x1;
+	*src_y_start = src_line->y1;
+	*dst_x_start = current_plane->frame_info->dst.x1;
+
+	/* Get the correct number of pixel to blend, it depends of the direction */
+	switch (direction) {
+	case READ_LEFT_TO_RIGHT:
+	case READ_RIGHT_TO_LEFT:
+		*pixel_count = drm_rect_width(src_line);
+		break;
+	case READ_BOTTOM_TO_TOP:
+	case READ_TOP_TO_BOTTOM:
+		*pixel_count = drm_rect_height(src_line);
+		break;
+	}
+
+	/*
+	 * Clamp the coordinates to avoid reading outside the buffer
+	 *
+	 * This is mainly a security to avoid reading outside the buffer, the userspace should
+	 * never request to read outside the source buffer.
+	 */
+	switch (direction) {
+	case READ_LEFT_TO_RIGHT:
+	case READ_RIGHT_TO_LEFT:
+		if (*src_x_start < 0) {
+			*pixel_count += *src_x_start;
+			*dst_x_start -= *src_x_start;
+			*src_x_start = 0;
+		}
+		if (*src_x_start + *pixel_count > current_plane->frame_info->fb->width)
+			*pixel_count = (int)current_plane->frame_info->fb->width - *src_x_start;
+		break;
+	case READ_BOTTOM_TO_TOP:
+	case READ_TOP_TO_BOTTOM:
+		if (*src_y_start < 0) {
+			*pixel_count += *src_y_start;
+			*dst_x_start -= *src_y_start;
+			*src_y_start = 0;
+		}
+		if (*src_y_start + *pixel_count > current_plane->frame_info->fb->height)
+			*pixel_count = (int)current_plane->frame_info->fb->height - *src_y_start;
+		break;
+	}
+}
+
+/**
+ * blend_line() - Blend a line from a plane to the output buffer
+ *
+ * @current_plane: current plane to work on
+ * @y: line to write in the output buffer
+ * @crtc_x_limit: width of the output buffer
+ * @stage_buffer: temporary buffer to convert the pixel line from the source buffer
+ * @output_buffer: buffer to blend the read line.
+ */
+static void blend_line(struct vkms_plane_state *current_plane, int y,
+		       int crtc_x_limit, struct line_buffer *stage_buffer,
+		       struct line_buffer *output_buffer)
+{
+	int src_x_start, src_y_start, dst_x_start, pixel_count;
+	struct drm_rect dst_line, tmp_src, src_line;
+
+	/* Avoid rendering useless lines */
+	if (y < current_plane->frame_info->dst.y1 ||
+	    y >= current_plane->frame_info->dst.y2)
+		return;
+
+	/*
+	 * dst_line is the line to copy. The initial coordinates are inside the
+	 * destination framebuffer, and then drm_rect_* helpers are used to
+	 * compute the correct position into the source framebuffer.
+	 */
+	dst_line = DRM_RECT_INIT(current_plane->frame_info->dst.x1, y,
+						 drm_rect_width(&current_plane->frame_info->dst),
+						 1);
+
+	drm_rect_fp_to_int(&tmp_src, &current_plane->frame_info->src);
+
+	/*
+	 * [1]: Clamping src_line to the crtc_x_limit to avoid writing outside of
+	 * the destination buffer
+	 */
+	dst_line.x1 = max_t(int, dst_line.x1, 0);
+	dst_line.x2 = min_t(int, dst_line.x2, crtc_x_limit);
+	/* The destination is completely outside of the crtc. */
+	if (dst_line.x2 <= dst_line.x1)
+		return;
+
+	src_line = dst_line;
+
+	/*
+	 * Transform the coordinate x/y from the crtc to coordinates into
+	 * coordinates for the src buffer.
+	 *
+	 * - Cancel the offset of the dst buffer.
+	 * - Invert the rotation. This assumes that
+	 *   dst = drm_rect_rotate(src, rotation) (dst and src have the
+	 *   same size, but can be rotated).
+	 * - Apply the offset of the source rectangle to the coordinate.
+	 */
+	drm_rect_translate(&src_line, -current_plane->frame_info->dst.x1,
+			   -current_plane->frame_info->dst.y1);
+	drm_rect_rotate_inv(&src_line, drm_rect_width(&tmp_src),
+			    drm_rect_height(&tmp_src),
+			    current_plane->frame_info->rotation);
+	drm_rect_translate(&src_line, tmp_src.x1, tmp_src.y1);
+
+	/* Get the correct reading direction in the source buffer. */
+
+	enum pixel_read_direction direction =
+		direction_for_rotation(current_plane->frame_info->rotation);
+
+	/* [2]: Compute and clamp the number of pixel to read */
+	clamp_line_coordinates(direction, current_plane, &src_line, &src_x_start, &src_y_start,
+			       &dst_x_start, &pixel_count);
+
+	if (pixel_count <= 0) {
+		/* Nothing to read, so avoid multiple function calls */
+		return;
+	}
+
+	/*
+	 * Modify the starting point to take in account the rotation
+	 *
+	 * src_line is the top-left corner, so when reading READ_RIGHT_TO_LEFT or
+	 * READ_BOTTOM_TO_TOP, it must be changed to the top-right/bottom-left
+	 * corner.
+	 */
+	if (direction == READ_RIGHT_TO_LEFT) {
+		// src_x_start is now the right point
+		src_x_start += pixel_count - 1;
+	} else if (direction == READ_BOTTOM_TO_TOP) {
+		// src_y_start is now the bottom point
+		src_y_start += pixel_count - 1;
+	}
+
+	/*
+	 * Perform the conversion and the blending
+	 *
+	 * Here we know that the read line (x_start, y_start, pixel_count) is
+	 * inside the source buffer [2] and we don't write outside the stage
+	 * buffer [1].
+	 */
+	current_plane->pixel_read_line(
+		current_plane, src_x_start, src_y_start, direction, pixel_count,
+		&stage_buffer->pixels[dst_x_start]);
+
+	pre_mul_alpha_blend(stage_buffer, output_buffer,
+			    dst_x_start, pixel_count);
+}
+
 /**
  * blend - blend the pixels from all planes and compute crc
  * @wb: The writeback frame buffer metadata
@@ -221,34 +368,25 @@ static void blend(struct vkms_writeback_job *wb,
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
-	int y_pos, x_dst, pixel_count;
 
 	const struct pixel_argb_u16 background_color = { .a = 0xffff };
 
-	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
+	int crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
+	int crtc_x_limit = crtc_state->base.crtc->mode.hdisplay;
 
 	/*
 	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
 	 * complexity to avoid poor blending performance.
 	 *
-	 * The function vkms_compose_row is used to read a line, pixel-by-pixel, into the staging
-	 * buffer.
+	 * The function pixel_read_line callback is used to read a line, using an efficient
+	 * algorithm for a specific format, into the staging buffer.
 	 */
 	for (size_t y = 0; y < crtc_y_limit; y++) {
 		fill_background(&background_color, output_buffer);
 
 		/* The active planes are composed associatively in z-order. */
 		for (size_t i = 0; i < n_active_planes; i++) {
-			x_dst = plane[i]->frame_info->dst.x1;
-			pixel_count = min_t(int, drm_rect_width(&plane[i]->frame_info->dst),
-					    (int)stage_buffer->n_pixels);
-			y_pos = get_y_pos(plane[i]->frame_info, y);
-
-			if (!check_limit(plane[i]->frame_info, y_pos))
-				continue;
-
-			vkms_compose_row(stage_buffer, plane[i], y_pos);
-			pre_mul_alpha_blend(stage_buffer, output_buffer, x_dst, pixel_count);
+			blend_line(plane[i], y, crtc_x_limit, stage_buffer, output_buffer);
 		}
 
 		apply_lut(crtc_state, output_buffer);
@@ -256,7 +394,7 @@ static void blend(struct vkms_writeback_job *wb,
 		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
 
 		if (wb)
-			vkms_writeback_row(wb, output_buffer, y_pos);
+			vkms_writeback_row(wb, output_buffer, y);
 	}
 }
 
@@ -267,7 +405,7 @@ static int check_format_funcs(struct vkms_crtc_state *crtc_state,
 	u32 n_active_planes = crtc_state->num_active_planes;
 
 	for (size_t i = 0; i < n_active_planes; i++)
-		if (!planes[i]->pixel_read)
+		if (!planes[i]->pixel_read_line)
 			return -1;
 
 	if (active_wb && !active_wb->pixel_write)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 16317b063c20..a62a11e67ab1 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -39,7 +39,6 @@
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
-	struct drm_rect rotated;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int rotation;
 };
@@ -80,26 +79,37 @@ enum pixel_read_direction {
 	READ_LEFT_TO_RIGHT
 };
 
+struct vkms_plane_state;
+
 /**
- * typedef pixel_read_t - These functions are used to read a pixel in the source frame,
+ * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
  * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
  *
- * @in_pixel: pointer to the pixel to read
- * @out_pixel: pointer to write the converted pixel
+ * @plane: plane used as source for the pixel value
+ * @x_start: X (width) coordinate of the first pixel to copy. The caller must ensure that x_start
+ * is non-negative and smaller than @plane->frame_info->fb->width.
+ * @y_start: Y (width) coordinate of the first pixel to copy. The caller must ensure that y_start
+ * is non-negative and smaller than @plane->frame_info->fb->height.
+ * @direction: direction to use for the copy, starting at @x_start/@y_start
+ * @count: number of pixels to copy
+ * @out_pixel: pointer where to write the pixel values. They will be written from @out_pixel[0]
+ * to @out_pixel[@count]. The caller must ensure that out_pixel have a length of at least @count.
  */
-typedef void (*pixel_read_t)(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel);
+typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_start,
+				  int y_start, enum pixel_read_direction direction, int count,
+				  struct pixel_argb_u16 out_pixel[]);
 
 /**
  * struct vkms_plane_state - Driver specific plane state
  * @base: base plane state
  * @frame_info: data required for composing computation
- * @pixel_read: function to read a pixel in this plane. The creator of a vkms_plane_state must
- * ensure that this pointer is valid
+ * @pixel_read_line: function to read a pixel line in this plane. The creator of a vkms_plane_state
+ * must ensure that this pointer is valid
  */
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
-	pixel_read_t pixel_read;
+	pixel_read_line_t pixel_read_line;
 };
 
 struct vkms_plane {
@@ -204,7 +214,6 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
-void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index f76944874fe7..302c7f3ea54c 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -134,83 +134,45 @@ static void packed_pixels_addr_1x1(const struct vkms_frame_info *frame_info,
 	*addr = (u8 *)frame_info->map[0].vaddr + offset;
 }
 
-static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y,
-				 int plane_index)
-{
-	int x_src = frame_info->src.x1 >> 16;
-	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
-	u8 *addr;
-	int rem_x, rem_y;
-
-	WARN_ONCE(drm_format_info_block_width(frame_info->fb->format, plane_index) != 1,
-		  "%s() only support formats with block_w == 1", __func__);
-	WARN_ONCE(drm_format_info_block_height(frame_info->fb->format, plane_index) != 1,
-		  "%s() only support formats with block_h == 1", __func__);
-
-	packed_pixels_addr(frame_info, x_src, y_src, plane_index, &addr, &rem_x, &rem_y);
-
-	return addr;
-}
-
-static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
-{
-	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
-		return limit - x - 1;
-	return x;
-}
-
 /*
- * The following functions take pixel data from the buffer and convert them to the format
- * ARGB16161616 in out_pixel.
+ * The following functions take pixel data (a, r, g, b, pixel, ...) and convert them to
+ * &struct pixel_argb_u16
  *
- * They are used in the vkms_compose_row() function to handle multiple formats.
+ * They are used in the `read_line`s functions to avoid duplicate work for some pixel formats.
  */
 
-static void ARGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static struct pixel_argb_u16 argb_u16_from_u8888(int a, int r, int g, int b)
 {
+	struct pixel_argb_u16 out_pixel;
 	/*
 	 * The 257 is the "conversion ratio". This number is obtained by the
 	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
 	 * the best color value in a pixel format with more possibilities.
 	 * A similar idea applies to others RGB color conversions.
 	 */
-	out_pixel->a = (u16)in_pixel[3] * 257;
-	out_pixel->r = (u16)in_pixel[2] * 257;
-	out_pixel->g = (u16)in_pixel[1] * 257;
-	out_pixel->b = (u16)in_pixel[0] * 257;
-}
+	out_pixel.a = (u16)a * 257;
+	out_pixel.r = (u16)r * 257;
+	out_pixel.g = (u16)g * 257;
+	out_pixel.b = (u16)b * 257;
 
-static void XRGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
-{
-	out_pixel->a = (u16)0xffff;
-	out_pixel->r = (u16)in_pixel[2] * 257;
-	out_pixel->g = (u16)in_pixel[1] * 257;
-	out_pixel->b = (u16)in_pixel[0] * 257;
+	return out_pixel;
 }
 
-static void ARGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static struct pixel_argb_u16 argb_u16_from_u16161616(int a, int r, int g, int b)
 {
-	u16 *pixel = (u16 *)in_pixel;
-
-	out_pixel->a = le16_to_cpu(pixel[3]);
-	out_pixel->r = le16_to_cpu(pixel[2]);
-	out_pixel->g = le16_to_cpu(pixel[1]);
-	out_pixel->b = le16_to_cpu(pixel[0]);
-}
+	struct pixel_argb_u16 out_pixel;
 
-static void XRGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
-{
-	u16 *pixel = (u16 *)in_pixel;
+	out_pixel.a = le16_to_cpu(a);
+	out_pixel.r = le16_to_cpu(r);
+	out_pixel.g = le16_to_cpu(g);
+	out_pixel.b = le16_to_cpu(b);
 
-	out_pixel->a = (u16)0xffff;
-	out_pixel->r = le16_to_cpu(pixel[2]);
-	out_pixel->g = le16_to_cpu(pixel[1]);
-	out_pixel->b = le16_to_cpu(pixel[0]);
+	return out_pixel;
 }
 
-static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
 {
-	u16 *pixel = (u16 *)in_pixel;
+	struct pixel_argb_u16 out_pixel;
 
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
@@ -220,12 +182,27 @@ static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pi
 	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
 	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
 
-	out_pixel->a = (u16)0xffff;
-	out_pixel->r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
-	out_pixel->g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
-	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
+	out_pixel.a = (u16)0xffff;
+	out_pixel.r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
+	out_pixel.g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
+	out_pixel.b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
+
+	return out_pixel;
 }
 
+/*
+ * The following functions are read_line function for each pixel format supported by VKMS.
+ *
+ * They read a line starting at the point @x_start,@y_start following the @direction. The result
+ * is stored in @out_pixel and in the format ARGB16161616.
+ *
+ * These functions are very repetitive, but the innermost pixel loops must be kept inside these
+ * functions for performance reasons. Some benchmarking was done in [1] where having the innermost
+ * loop factored out of these functions showed a slowdown by a factor of three.
+ *
+ * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
+ */
+
 /**
  * magenta_to_argb_u16() - pixel_read callback which always read magenta
  *
@@ -233,42 +210,111 @@ static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pi
  * It is used to avoid null pointer to be used as a function. In theory, this function should
  * never be called, except if you found a bug in the driver/DRM core.
  */
-static void magenta_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void magenta_to_argb_u16(const struct vkms_plane_state *plane, int x_start,
+			      int y_start, enum pixel_read_direction direction, int count,
+			      struct pixel_argb_u16 out_pixel[])
 {
-	out_pixel->a = (u16)0xFFFF;
-	out_pixel->r = (u16)0xFFFF;
-	out_pixel->g = 0;
-	out_pixel->b = (u16)0xFFFF;
+	struct pixel_argb_u16 *end = out_pixel + count;
+
+	while (out_pixel < end) {
+		*out_pixel = argb_u16_from_u8888(255, 255, 0, 255);
+		out_pixel += 1;
+	}
 }
 
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
+static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
+			       enum pixel_read_direction direction, int count,
+			       struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+
+	int step = get_block_step_byte(plane->frame_info->fb, direction, 0);
+
+	while (out_pixel < end) {
+		u8 *px = (u8 *)src_pixels;
+		*out_pixel = argb_u16_from_u8888(px[3], px[2], px[1], px[0]);
+		out_pixel += 1;
+		src_pixels += step;
+	}
+}
+
+static void XRGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
+			       enum pixel_read_direction direction, int count,
+			       struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+
+	int step = get_block_step_byte(plane->frame_info->fb, direction, 0);
+
+	while (out_pixel < end) {
+		u8 *px = (u8 *)src_pixels;
+		*out_pixel = argb_u16_from_u8888(255, px[2], px[1], px[0]);
+		out_pixel += 1;
+		src_pixels += step;
+	}
+}
+
+static void ARGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
+				   int y_start, enum pixel_read_direction direction, int count,
+				   struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+
+	int step = get_block_step_byte(plane->frame_info->fb, direction, 0);
+
+	while (out_pixel < end) {
+		u16 *px = (u16 *)src_pixels;
+		*out_pixel = argb_u16_from_u16161616(px[3], px[2], px[1], px[0]);
+		out_pixel += 1;
+		src_pixels += step;
+	}
+}
+
+static void XRGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
+				   int y_start, enum pixel_read_direction direction, int count,
+				   struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+
+	int step = get_block_step_byte(plane->frame_info->fb, direction, 0);
+
+	while (out_pixel < end) {
+		u16 *px = (u16 *)src_pixels;
+		*out_pixel = argb_u16_from_u16161616(0xFFFF, px[2], px[1], px[0]);
+		out_pixel += 1;
+		src_pixels += step;
+	}
+}
+
+static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
+			     int y_start, enum pixel_read_direction direction, int count,
+			     struct pixel_argb_u16 out_pixel[])
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	struct vkms_frame_info *frame_info = plane->frame_info;
-	u8 *src_pixels = get_packed_src_addr(frame_info, y, 0);
-	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
 
-	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
-		int x_pos = get_x_position(frame_info, limit, x);
+	int step = get_block_step_byte(plane->frame_info->fb, direction, 0);
 
-		if (drm_rotation_90_or_270(frame_info->rotation))
-			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1, 0)
-				+ frame_info->fb->format->cpp[0] * y;
+	while (out_pixel < end) {
+		u16 *px = (u16 *)src_pixels;
 
-		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
+		*out_pixel = argb_u16_from_RGB565(px);
+		out_pixel += 1;
+		src_pixels += step;
 	}
 }
 
@@ -378,7 +424,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 }
 
 /**
- * get_pixel_conversion_function() - Retrieve the correct read_pixel function for a specific
+ * get_pixel_read_function() - Retrieve the correct read_line function for a specific
  * format.
  *
  * If the format is not supported by VKMS a warning is emitted and a dummy "always read magenta"
@@ -386,19 +432,19 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
  *
  * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
  */
-pixel_read_t get_pixel_read_function(u32 format)
+pixel_read_line_t get_pixel_read_line_function(u32 format)
 {
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
-		return &ARGB8888_to_argb_u16;
+		return &ARGB8888_read_line;
 	case DRM_FORMAT_XRGB8888:
-		return &XRGB8888_to_argb_u16;
+		return &XRGB8888_read_line;
 	case DRM_FORMAT_ARGB16161616:
-		return &ARGB16161616_to_argb_u16;
+		return &ARGB16161616_read_line;
 	case DRM_FORMAT_XRGB16161616:
-		return &XRGB16161616_to_argb_u16;
+		return &XRGB16161616_read_line;
 	case DRM_FORMAT_RGB565:
-		return &RGB565_to_argb_u16;
+		return &RGB565_read_line;
 	default:
 		/*
 		 * This is a bug in vkms_plane_atomic_check(). All the supported
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 3ecea4563254..8d2bef95ff79 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -5,7 +5,7 @@
 
 #include "vkms_drv.h"
 
-pixel_read_t get_pixel_read_function(u32 format);
+pixel_read_line_t get_pixel_read_line_function(u32 format);
 
 pixel_write_t get_pixel_write_function(u32 format);
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 10e9b23dab28..8875bed76410 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -112,7 +112,6 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info = vkms_plane_state->frame_info;
 	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
 	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
-	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));
 	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
@@ -122,10 +121,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 									  DRM_MODE_REFLECT_X |
 									  DRM_MODE_REFLECT_Y);
 
-	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
-			drm_rect_height(&frame_info->rotated), frame_info->rotation);
 
-	vkms_plane_state->pixel_read = get_pixel_read_function(fmt);
+	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
 }
 
 static int vkms_plane_atomic_check(struct drm_plane *plane,

-- 
2.43.0

