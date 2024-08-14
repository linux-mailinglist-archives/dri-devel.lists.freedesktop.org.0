Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6589516C9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F7B10E096;
	Wed, 14 Aug 2024 08:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YmOkQJv8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C3010E427
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:42:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44EE7FF806;
 Wed, 14 Aug 2024 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723624942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FkY1GgMZ3ji33SLTQfiusbh267+ZJpH2DfrjTElkWA=;
 b=YmOkQJv8B0YDms5HqhDwP5UEYMewav60fexmIxui6723aIHnhD70/FVIOYmFUb3WWtXyAo
 /U9Ct8ILOjBErAWx0qCeV+ouRtfCYxRBXZQ0qayN6bTq7ZePQxdqpT2M8ZKuj+3ty4A07l
 aupPphW4EvuCmM9BDMrgdPZHB9eW/OsZScCZbXs/neGgvWbTHNWPM4cWoncqxM4i8wNdSY
 a7S0s587VPNJKDNDRMbgOSQWtPHYdE1+iEAEPpQekrWg28bhEfBnubxGHdRIvNRJJoGpF2
 fBBajoTi4H5yhEM0XXb0PcgvLcxSufedeTMmrNRTQM11gffnjoeqn4GeQ0IPuA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 10:42:16 +0200
Subject: [PATCH v2 1/3] drm/vkms: Re-introduce line-by-line algorithm for
 writeback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-writeback_line_by_line-v2-1-36541c717569@bootlin.com>
References: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
In-Reply-To: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11312;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=u/cX5u1RxR4UGVYer9ey3KVUmZkWgUe0bMxWcPgX1po=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvG3qNc4e2LDBXpVBe/KFkmEseidNL8rZYMh8p
 BNG2dEoxoSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxt6gAKCRAgrS7GWxAs
 4jPpEACRNQ98pME3hd/Bg7cukc1IbwwkJvh+5T0PWZCWcQsBy7YHUB2pU5wVwrhQnRrgdRHuulr
 ySwsb1TDNJDIfPt3S34jtOXZivKMGsptAADLLoxSrRK8ddfJnl85iu7Juml9vD2Ql6fE6sSP4Au
 IaSgU/O7PsFOyyGN/s9693xOxZMLlIZeo/5iHDiKkblyES9G9R5n93D2SjDLlSGizqs3JdbtsAX
 WpJZDCCj45WGnt4KY8daDF9AU9icuS07QyEa7DyKoowoZmF+nNStuS8WavNUhI19/W5kOIAtHU+
 FVaIGnLKnoiLNN/znUnJHfGy0XIyz5O6ghPtTHOJuNzihb8nUGtkiltkwpajHrhfxi68xl0hlVr
 y0SrZFPY2FxtakM4NSboM7ij7hgu1BhVcynAtzThA7IzSdhEgC0zUM+y3Wx8umlhqi3A1TrGRl6
 NYNshPPP3AyocS7TS/FnaEcLnElNV8coEhq6I0MRLiMPeoyoVNvL8mG37B0brr2jRbFhL8jhqku
 6Y3I8fE6FktJprx6vQ7/3uFTv7VzLVPv3vRAcAgt19J5GLwWtqG5NH1eRnEbXTAL8sbx2ZBVoLO
 Ierm1lrkfVnUcWv3O4yCRj8661rrreNJFMo6GfLBCdKkPl/sJxjvFNaFg4ZaFgCc9z3bTg5pySB
 a9et1rUfWCjyVRQ==
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

Re-introduce a line-by-line writeback algorithm for each pixel format.
This allows more performance by not requiring an indirection per pixel
write.

Line-by-line writeback was introduced by [1] but rewritten back to
pixel-by-pixel algorithm in [2]. At this time, nobody noticed the impact
on performance, and it was merged.

This patch is almost a revert of [2], but with some effort to avoid code
duplication. Now only the loop is repeated, but it is required to have
good performances.

The performance gain is around 5 to 10%.

[1]: https://lore.kernel.org/all/20211005201637.58563-7-igormtorrente@gmail.com/
[2]: https://lore.kernel.org/all/20230515135204.115393-4-mcanal@igalia.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  17 +++++
 drivers/gpu/drm/vkms/vkms_drv.h       |  20 +++---
 drivers/gpu/drm/vkms/vkms_formats.c   | 117 +++++++++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_formats.h   |   2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |   2 +-
 5 files changed, 124 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 76d4aa8a0ef6..f0cae142ac22 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -176,6 +176,23 @@ static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
 	return READ_LEFT_TO_RIGHT;
 }
 
+/**
+ * Write a line to the writeback buffer
+ *
+ * @wb: Job where to insert the final image
+ * @src_buffer: Line to write
+ * @y: Row to write in the writeback buffer
+ */
+static void vkms_writeback_row(struct vkms_writeback_job *wb,
+			       const struct line_buffer *src_buffer, size_t y_start)
+{
+	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
+	int x_start = frame_info->dst.x1;
+	int count = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
+
+	wb->pixel_write(wb, src_buffer->pixels, count, x_start, y_start);
+}
+
 /**
  * clamp_line_coordinates() - Compute and clamp the coordinate to read and write during the blend
  * process.
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 3870e825da81..526bf5207524 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -52,20 +52,25 @@ struct line_buffer {
 	struct pixel_argb_u16 *pixels;
 };
 
+struct vkms_writeback_job;
 /**
- * typedef pixel_write_t - These functions are used to read a pixel from a
- * &struct pixel_argb_u16, convert it in a specific format and write it in the @dst_pixels
- * buffer.
+ * typedef pixel_write_line_t - These functions are used to read a pixel line from a
+ * struct pixel_argb_u16 buffer, convert it and write it in the @wb job.
  *
- * @out_pixel: destination address to write the pixel
- * @in_pixel: pixel to write
+ * @wb: the writeback job to write the output of the conversion
+ * @in_pixels: Source buffer containing the line to convert
+ * @count: The width of a line
+ * @x_start: The x (width) coordinate in the destination plane
+ * @y_start: The y (height) coordinate in the destination plane
  */
-typedef void (*pixel_write_t)(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
+typedef void (*pixel_write_line_t)(struct vkms_writeback_job *wb,
+			      struct pixel_argb_u16 *in_pixels, int count, int x_start,
+			      int y_start);
 
 struct vkms_writeback_job {
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct vkms_frame_info wb_frame_info;
-	pixel_write_t pixel_write;
+	pixel_write_line_t pixel_write;
 };
 
 /**
@@ -232,7 +237,6 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
-void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index d1abfb1c3e3c..d1309f6d307f 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -587,7 +587,7 @@ static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_sta
  * The following functions take one &struct pixel_argb_u16 and convert it to a specific format.
  * The result is stored in @out_pixel.
  *
- * They are used in vkms_writeback_row() to convert and store a pixel from the src_buffer to
+ * They are used in the `write_line` functions to convert and store a pixel from the src_buffer to
  * the writeback buffer.
  */
 static void argb_u16_to_ARGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
@@ -654,28 +654,97 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
 	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
-/**
- * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
- * after the blending to write a line in the writeback buffer.
+/*
+ * The following functions are write_line function for each pixel format supported by VKMS.
+ *
+ * They write a full line at index y. They must read data from the line src_pixels.
+ *
+ * The caller must ensure that count is not larger than the framebuffer and the src_pixels.
+ *
+ * Those function are very similar, but it is required for performance reason. In the past, some
+ * experiment were done, and with a generic loop the performance are very reduced [1].
  *
- * @wb: Job where to insert the final image
- * @src_buffer: Line to write
- * @y: Row to write in the writeback buffer
+ * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
  */
-void vkms_writeback_row(struct vkms_writeback_job *wb,
-			const struct line_buffer *src_buffer, int y)
+
+static void ARGB8888_write_line(struct vkms_writeback_job *wb,
+				struct pixel_argb_u16 *src_pixels, int count, int x_start,
+				int y_start)
 {
-	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
-	int x_dst = frame_info->dst.x1;
 	u8 *dst_pixels;
-	int rem_x, rem_y;
 
-	packed_pixels_addr(frame_info, x_dst, y, 0, &dst_pixels, &rem_x, &rem_y);
-	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
+	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
 
-	for (size_t x = 0; x < x_limit; x++, dst_pixels += frame_info->fb->format->cpp[0])
-		wb->pixel_write(dst_pixels, &in_pixels[x]);
+	while (count) {
+		argb_u16_to_ARGB8888(dst_pixels, src_pixels);
+		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
+		src_pixels += 1;
+		count--;
+	}
+}
+
+static void XRGB8888_write_line(struct vkms_writeback_job *wb,
+				struct pixel_argb_u16 *src_pixels, int count, int x_start,
+				int y_start)
+{
+	u8 *dst_pixels;
+
+	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
+
+	while (count) {
+		argb_u16_to_XRGB8888(dst_pixels, src_pixels);
+		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
+		src_pixels += 1;
+		count--;
+	}
+}
+
+static void ARGB16161616_write_line(struct vkms_writeback_job *wb,
+				    struct pixel_argb_u16 *src_pixels, int count, int x_start,
+				    int y_start)
+{
+	u8 *dst_pixels;
+
+	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
+
+	while (count) {
+		argb_u16_to_ARGB16161616(dst_pixels, src_pixels);
+		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
+		src_pixels += 1;
+		count--;
+	}
+}
+
+static void XRGB16161616_write_line(struct vkms_writeback_job *wb,
+				    struct pixel_argb_u16 *src_pixels, int count, int x_start,
+				    int y_start)
+{
+	u8 *dst_pixels;
+
+	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
+
+	while (count) {
+		argb_u16_to_XRGB16161616(dst_pixels, src_pixels);
+		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
+		src_pixels += 1;
+		count--;
+	}
+}
+
+static void RGB565_write_line(struct vkms_writeback_job *wb,
+			      struct pixel_argb_u16 *src_pixels, int count, int x_start,
+			      int y_start)
+{
+	u8 *dst_pixels;
+
+	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
+
+	while (count) {
+		argb_u16_to_RGB565(dst_pixels, src_pixels);
+		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
+		src_pixels += 1;
+		count--;
+	}
 }
 
 /**
@@ -936,25 +1005,25 @@ void get_conversion_matrix_to_argb_u16(u32 format,
 }
 
 /**
- * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
+ * get_pixel_write_function() - Retrieve the correct write_line function for a specific format.
  * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
  * pointer is valid before using it in a vkms_writeback_job.
  *
  * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
  */
-pixel_write_t get_pixel_write_function(u32 format)
+pixel_write_line_t get_pixel_write_line_function(u32 format)
 {
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
-		return &argb_u16_to_ARGB8888;
+		return &ARGB8888_write_line;
 	case DRM_FORMAT_XRGB8888:
-		return &argb_u16_to_XRGB8888;
+		return &XRGB8888_write_line;
 	case DRM_FORMAT_ARGB16161616:
-		return &argb_u16_to_ARGB16161616;
+		return &ARGB16161616_write_line;
 	case DRM_FORMAT_XRGB16161616:
-		return &argb_u16_to_XRGB16161616;
+		return &XRGB16161616_write_line;
 	case DRM_FORMAT_RGB565:
-		return &argb_u16_to_RGB565;
+		return &RGB565_write_line;
 	default:
 		/*
 		 * This is a bug in vkms_writeback_atomic_check. All the supported
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index eeb208cdd6b1..852ab9a4cee5 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -7,7 +7,7 @@
 
 pixel_read_line_t get_pixel_read_line_function(u32 format);
 
-pixel_write_t get_pixel_write_function(u32 format);
+pixel_write_line_t get_pixel_write_line_function(u32 format);
 
 void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
 				       enum drm_color_range range,
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index c8582df1f739..f6ed3aa69af8 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -150,7 +150,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	crtc_state->wb_pending = true;
 	spin_unlock_irq(&output->composer_lock);
 	drm_writeback_queue_job(wb_conn, connector_state);
-	active_wb->pixel_write = get_pixel_write_function(wb_format);
+	active_wb->pixel_write = get_pixel_write_line_function(wb_format);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
 	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
 }

-- 
2.44.2

