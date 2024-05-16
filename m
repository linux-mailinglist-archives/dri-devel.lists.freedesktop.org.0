Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96258C7774
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A98110ED11;
	Thu, 16 May 2024 13:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jQNNLi98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3F110ED10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:20:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B3DB1C0002;
 Thu, 16 May 2024 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715865611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVVNzD71BRBr1Ira+dygzJ5zR0gEVNOXZCcHVq69cws=;
 b=jQNNLi98E7rDbnNC0s3annI3TUsONsdcMejjwKvcpwZAPvUbtftK1YDYeZfHzfCd9yEDOT
 iMlVZd52tVpZZV7w+lx3NNZd8pZAb/3ytchJvGnyACW/yu5pPEmgVYYoyjT6UBWIE4rUsj
 Yrp+rz/Nq3NTIdmJIKYynFP1//cdBW8ATX9C7d6kPdBn39UY8gvIHVtPesY+3bjXhOFXJc
 arHcPOHhaKXH92Fy/syGaxdDZw5yacjIVaObzcpNRV85y1zHP029QM7jega2V+0vSEDxp3
 xYeYJ3hCA2+bXWwx6/9K+OnALDkXkkQMJDs6HVZuZGvc58y/z/Ge2YHpQ3BTOQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:20:05 +0200
Subject: [PATCH 1/3] drm/vkms: Re-introduce line-by-line algorithm for
 writeback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-writeback_line_by_line-v1-1-7b2e3bf9f1c9@bootlin.com>
References: <20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com>
In-Reply-To: <20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12566;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=uCULzIdaIDCx7+tpjYQ+LGN7xyUdpe5Bnum1CiV04F4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRggHKN/oN/rKXFslhdV77kXQeoffiq+0kiIwF
 Xn+Wn7h58iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYIBwAKCRAgrS7GWxAs
 4gVcEAC2ZRJx+UKoIupRFt9NDcj/ZpDvkgpLmnKB4ppGgu53wPmSGncmHROqjTuENJc0+u2fTro
 8aHnkIcuakbj0yFtyhJ6LKxpv1zHEhLw2/tbAIBYwFYStqxHxcoU9hcj6xy7OSmDC34GULyE74B
 eN3RgVPfVLQSjzt74Br+Xx8TxRp+dXdeY1rGkqshGGhC7TlhnjhuSGTFhGWvvzcvBl+0A5Lu5f8
 KdSt+mWmhEgnCGdA9MWigyB1Xv9QLqymavwK9RnNheGjWCpDDQZ7y9bro77EcIGOm38SX0NSYTh
 XXSdAH1ov1duEvn3aMgKM8HhUGVtSIBxLL1CoxDbiM8yH/fSQfTpUCJOL/ukcG2rpVRLgiKZ1Jp
 UmInra5N5QYX/+wEks+OvtKfp5ymRGJj3RBpoxYrsGYu3hfmLODwOkk77lzzI8xH+39+5Dw1561
 IB/SZw/6LjXPgfdeVkha4RPpiGy20NN2BgdhovLXOrkYZvi2UYHtZcCfHvWm/hwXKM7chQadya2
 FNVjG60jdSOq7xppirDEM804xpq9k9VR7YtI5iAfW+cOPTslOR4ZK3nK86c1bBDmc+IOpYukw3i
 8nVC0gVXdfIO6iUV5HLuMtv74pUEd3aERCup/lpfdKCptmLJy2jbuG9xH/GXzvCYwcFHHp2IZiL
 79JjHQGTPUqe3bQ==
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
 drivers/gpu/drm/vkms/vkms_composer.c  |  18 +++++
 drivers/gpu/drm/vkms/vkms_drv.h       |  20 +++--
 drivers/gpu/drm/vkms/vkms_formats.c   | 139 +++++++++++++++++++++++++---------
 drivers/gpu/drm/vkms/vkms_formats.h   |   2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |   2 +-
 5 files changed, 137 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0f2b90234d3a..b3fe4e267c6b 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -178,6 +178,24 @@ static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
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
+
 /**
  * clamp_line_coordinates() - Compute and clamp the coordinate to read and write during the blend
  * process.
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 4a120ee6ce8e..f97813b9dca2 100644
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
@@ -233,7 +238,6 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
-void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 6e651f7e6997..c5cb2e45ddaf 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -575,7 +575,7 @@ static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_sta
  * The following functions take one &struct pixel_argb_u16 and convert it to a specific format.
  * The result is stored in @out_pixel.
  *
- * They are used in vkms_writeback_row() to convert and store a pixel from the src_buffer to
+ * They are used in the `write_line` functions to convert and store a pixel from the src_buffer to
  * the writeback buffer.
  */
 static void argb_u16_to_ARGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
@@ -642,40 +642,111 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
 	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
-/**
- * argb_u16_to_nothing() - pixel_write callback with no effect
+/*
+ * The following functions are write_line function for each pixel format supported by VKMS.
  *
- * This callback is used when an invalid format is requested for writeback.
- * It is used to avoid null pointer to be used as a function. In theory, this should never
- * happen, except if there is a bug in the driver
- */
-static void argb_u16_to_nothing(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
-{}
-
-/**
- * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
- * after the blending to write a line in the writeback buffer.
+ * They write a full line at index y. They must read data from the line src_pixels.
+ *
+ * The caller must ensure that count is not larger than the framebuffer and the src_pixels.
  *
- * @wb: Job where to insert the final image
- * @src_buffer: Line to write
- * @y: Row to write in the writeback buffer
+ * Those function are very similar, but it is required for performance reason. In the past, some
+ * experiment were done, and with a generic loop the performance are very reduced [1].
+ *
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
 }
 
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
+}
+
+/**
+ * argb_u16_to_nothing() - pixel_write callback with no effect
+ *
+ * This callback is used when an invalid format is requested for writeback.
+ * It is used to avoid null pointer to be used as a function. In theory, this should never
+ * happen, except if there is a bug in the driver
+ */
+static void nothing_write_line(struct vkms_writeback_job *wb,
+			       struct pixel_argb_u16 *src_pixels, int count, int x_start,
+			       int y_start)
+{}
+
 /**
  * get_pixel_read_function() - Retrieve the correct read_line function for a specific
  * format.
@@ -936,25 +1007,25 @@ void get_conversion_matrix_to_argb_u16(u32 format,
 }
 
 /**
- * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
+ * get_pixel_write_function() - Retrieve the correct write_line function for a specific format.
  * If the format is not supported by VKMS a warning is emitted and a dummy "don't do anything"
  * function is returned.
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
@@ -968,6 +1039,6 @@ pixel_write_t get_pixel_write_function(u32 format)
 		WARN(true,
 		     "Pixel format %p4cc is not supported by VKMS writeback. This is a kernel bug, atomic check must forbid this configuration.\n",
 		     &format);
-		return &argb_u16_to_nothing;
+		return &nothing_write_line;
 	}
 }
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index b4fe62ab9c65..b74142325399 100644
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
2.43.2

