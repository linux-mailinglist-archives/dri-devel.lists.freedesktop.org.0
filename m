Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A88986108F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 12:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81B210EBD2;
	Fri, 23 Feb 2024 11:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="C52IGamG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4168E10E0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 11:37:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4348740010;
 Fri, 23 Feb 2024 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708688269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tcezu8vYxu+kiN7C6okF5cT4kjX3KFrjgF+qzQuXbgQ=;
 b=C52IGamGQKcATu9HgQ1ffbd6QPsCFTAQ7r+/lksPcNrawMwqgpdNAAOp2uP5cQXe/qC25T
 hOwA/pYwLXzyduGfQAPC1nZ1Q1JWtWk6ygSD2zm8uwjVtEy6HLyxGisXDP4nynx9bfcjvB
 g9D6tt27mErS4VUpNUvwHCPQllWd2UFtUz/6Na9FuOcb2AZ86wtAgCocx/MYlDApxol5oO
 38jRoCqlmWz6YdW5fypBvYP2VUAert9rqwptC/3C2x4bSWwrQJYWJYX7dlpyivrDjaY1rr
 gwBbQy7kINd4EoBPaWJkvZbyN3uVWxmldmZ/Pm3YU7jEq6Oej1QkjhEFPeDWmg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 23 Feb 2024 12:37:26 +0100
Subject: [PATCH v2 6/9] drm/vkms: Add YUV support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-yuv-v2-6-aa6be2827bb7@bootlin.com>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
In-Reply-To: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17791;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PGcOoxoNhKktIJ2cP25ashoOLfLp5HlIFfKAGIFIT4M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl2IOFRz5SA82+R9/H8IsTL5tWD1g6E+WIxNFNPmdW
 EeHCSguJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZdiDhQAKCRAgrS7GWxAs4uRyD/
 91FR/k1o+hfSXzj+SjhoMV4sPyW9uGI/2wJXlw0X2eWKzhG5n5udbpRteJ7PEhoNgfr6ZNhhtE+oHS
 94jxstZDgX5JLUCbrXrLUokLYenn1PslWSYj9Hyb3ML5X2ENPJ0Sl6RVLMndUaBZpN42dEizRFChIb
 gbOKS6J/dY1xV7m8E9J9jkrxk6sIpEdq2QnzZu9M6e87he69H7JeMbHRdYaXnDyu6tAchZ4rLfkrGF
 +fYrMuuNMcCb96RSBu7vFQg7xXN0rMlrPqe3QhlJceDOOeZpGh4FqQ8gle0jt1ZpUrn8WNhaHhLCTb
 7josB/m8bkvZnsfFpEDtGZzSk3iAaxhd+vPS2BceA4hdVJfBaI1jqhLTe92CVfErQ7KXtpFTfYNmzu
 J42xV8gDvmNjgYZdBElmzBWbneqZOmGMqznm4DVY2R1SHb1rg+6KLmPgWB5RUOHQbh4xT0chGYZKKx
 s1yWO8ZaTgP0+SioF2g9QsY6ObIpo4sOpajXcT4NNKtzELeuDKuBOOVRrJmaBc+qgHjp8UXcOtCVQq
 Gy4mX/7iFFOeJS6AoaZ751Ox393znyMrgC1rQbbN/BsxQMb2AqpWqfsQefj7YrbsjqUcfV/xFzj5np
 sOCrYJwwHphVfC+3wz6YdAtZCVVFCWrw0Ff3MKebh8k/2Eamc7RJoYItcTJQ==
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

From: Arthur Grillo <arthurgrillo@riseup.net>

Add support to the YUV formats bellow:

- NV12
- NV16
- NV24
- NV21
- NV61
- NV42
- YUV420
- YUV422
- YUV444
- YVU420
- YVU422
- YVU444

The conversion matrices of each encoding and range were obtained by
rounding the values of the original conversion matrices multiplied by
2^8. This is done to avoid the use of fixed point operations.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
[Louis Chauvet: Adapted Arthur's work and implemented the read_line_t
callbacks for yuv formats]
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c |   2 +-
 drivers/gpu/drm/vkms/vkms_drv.h      |   6 +-
 drivers/gpu/drm/vkms/vkms_formats.c  | 289 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_formats.h  |   4 +
 drivers/gpu/drm/vkms/vkms_plane.c    |  14 +-
 5 files changed, 295 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e555bf9c1aee..54fc5161d565 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -312,7 +312,7 @@ static void blend(struct vkms_writeback_job *wb,
 			 * buffer [1]
 			 */
 			current_plane->pixel_read_line(
-				current_plane->frame_info,
+				current_plane,
 				x_start,
 				y_start,
 				direction,
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index ccc5be009f15..a4f6456cb971 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -75,6 +75,8 @@ enum pixel_read_direction {
 	READ_RIGHT
 };
 
+struct vkms_plane_state;
+
 /**
 <<<<<<< HEAD
  * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
@@ -87,8 +89,8 @@ enum pixel_read_direction {
  * @out_pixel: Pointer where to write the pixel value. Pixels will be written between x_start and
  *  x_end.
  */
-typedef void (*pixel_read_line_t)(struct vkms_frame_info *frame_info, int x_start, int y_start, enum
-	pixel_read_direction direction, int count, struct pixel_argb_u16 out_pixel[]);
+typedef void (*pixel_read_line_t)(struct vkms_plane_state *frame_info, int x_start, int y_start,
+	enum pixel_read_direction direction, int count, struct pixel_argb_u16 out_pixel[]);
 
 /**
  * vkms_plane_state - Driver specific plane state
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 46daea6d3ee9..515c80866a58 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -33,7 +33,8 @@ static size_t packed_pixels_offset(const struct vkms_frame_info *frame_info, int
 	 */
 	return fb->offsets[plane_index] +
 	       (y / drm_format_info_block_width(format, plane_index)) * fb->pitches[plane_index] +
-	       (x / drm_format_info_block_height(format, plane_index)) * format->char_per_block[plane_index];
+	       (x / drm_format_info_block_height(format, plane_index)) *
+	       format->char_per_block[plane_index];
 }
 
 /**
@@ -84,6 +85,32 @@ static int get_step_1x1(struct drm_framebuffer *fb, enum pixel_read_direction di
 	}
 }
 
+/**
+ * get_subsampling() - Get the subsampling value on a specific direction
+ */
+static int get_subsampling(const struct drm_format_info *format,
+			   enum pixel_read_direction direction)
+{
+	if (direction == READ_LEFT || direction == READ_RIGHT)
+		return format->hsub;
+	else if (direction == READ_DOWN || direction == READ_UP)
+		return format->vsub;
+	return 1;
+}
+
+/**
+ * get_subsampling_offset() - Get the subsampling offset to use when incrementing the pixel counter
+ */
+static int get_subsampling_offset(const struct drm_format_info *format,
+				  enum pixel_read_direction direction, int x_start, int y_start)
+{
+	if (direction == READ_RIGHT || direction == READ_LEFT)
+		return x_start;
+	else if (direction == READ_DOWN || direction == READ_UP)
+		return y_start;
+	return 0;
+}
+
 
 /*
  * The following  functions take pixel data (a, r, g, b, pixel, ...), convert them to the format
@@ -130,6 +157,87 @@ static void RGB565_to_argb_u16(struct pixel_argb_u16 *out_pixel, const u16 *pixe
 	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
 }
 
+static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r, u8 *g, u8 *b)
+{
+	s32 y_16, cb_16, cr_16;
+	s32 r_16, g_16, b_16;
+
+	y_16 = y - y_offset;
+	cb_16 = cb - 128;
+	cr_16 = cr - 128;
+
+	r_16 = m[0][0] * y_16 + m[0][1] * cb_16 + m[0][2] * cr_16;
+	g_16 = m[1][0] * y_16 + m[1][1] * cb_16 + m[1][2] * cr_16;
+	b_16 = m[2][0] * y_16 + m[2][1] * cb_16 + m[2][2] * cr_16;
+
+	*r = clamp(r_16, 0, 0xffff) >> 8;
+	*g = clamp(g_16, 0, 0xffff) >> 8;
+	*b = clamp(b_16, 0, 0xffff) >> 8;
+}
+
+static void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pixel_yuv_u8 *yuv_u8,
+			       enum drm_color_encoding encoding, enum drm_color_range range)
+{
+	static const s16 bt601_full[3][3] = {
+		{ 256, 0,   359 },
+		{ 256, -88, -183 },
+		{ 256, 454, 0 },
+	};
+	static const s16 bt601[3][3] = {
+		{ 298, 0,    409 },
+		{ 298, -100, -208 },
+		{ 298, 516,  0 },
+	};
+	static const s16 rec709_full[3][3] = {
+		{ 256, 0,   408 },
+		{ 256, -48, -120 },
+		{ 256, 476, 0 },
+	};
+	static const s16 rec709[3][3] = {
+		{ 298, 0,   459 },
+		{ 298, -55, -136 },
+		{ 298, 541, 0 },
+	};
+	static const s16 bt2020_full[3][3] = {
+		{ 256, 0,   377 },
+		{ 256, -42, -146 },
+		{ 256, 482, 0 },
+	};
+	static const s16 bt2020[3][3] = {
+		{ 298, 0,   430 },
+		{ 298, -48, -167 },
+		{ 298, 548, 0 },
+	};
+
+	u8 r = 0;
+	u8 g = 0;
+	u8 b = 0;
+	bool full = range == DRM_COLOR_YCBCR_FULL_RANGE;
+	unsigned int y_offset = full ? 0 : 16;
+
+	switch (encoding) {
+	case DRM_COLOR_YCBCR_BT601:
+		ycbcr2rgb(full ? bt601_full : bt601,
+			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
+		break;
+	case DRM_COLOR_YCBCR_BT709:
+		ycbcr2rgb(full ? rec709_full : rec709,
+			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
+		break;
+	case DRM_COLOR_YCBCR_BT2020:
+		ycbcr2rgb(full ? bt2020_full : bt2020,
+			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
+		break;
+	default:
+		pr_warn_once("Not supported color encoding\n");
+		break;
+	}
+
+	argb_u16->r = r * 257;
+	argb_u16->g = g * 257;
+	argb_u16->b = b * 257;
+}
+
 /*
  * The following functions are read_line function for each pixel format supported by VKMS.
  *
@@ -142,13 +250,13 @@ static void RGB565_to_argb_u16(struct pixel_argb_u16 *out_pixel, const u16 *pixe
  * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
  */
 
-static void ARGB8888_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
+static void ARGB8888_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
 			       enum pixel_read_direction direction, int count,
 			       struct pixel_argb_u16 out_pixel[])
 {
-	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
+	u8 *src_pixels = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
 
-	int step = get_step_1x1(frame_info->fb, direction, 0);
+	int step = get_step_1x1(plane->frame_info->fb, direction, 0);
 
 	while (count) {
 		u8 *px = (u8 *)src_pixels;
@@ -160,13 +268,13 @@ static void ARGB8888_read_line(struct vkms_frame_info *frame_info, int x_start,
 	}
 }
 
-static void XRGB8888_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
+static void XRGB8888_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
 			       enum pixel_read_direction direction, int count,
 			       struct pixel_argb_u16 out_pixel[])
 {
-	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
+	u8 *src_pixels = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
 
-	int step = get_step_1x1(frame_info->fb, direction, 0);
+	int step = get_step_1x1(plane->frame_info->fb, direction, 0);
 
 	while (count) {
 		u8 *px = (u8 *)src_pixels;
@@ -178,13 +286,13 @@ static void XRGB8888_read_line(struct vkms_frame_info *frame_info, int x_start,
 	}
 }
 
-static void ARGB16161616_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
+static void ARGB16161616_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
 				   enum pixel_read_direction direction, int count,
 				   struct pixel_argb_u16 out_pixel[])
 {
-	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
+	u8 *src_pixels = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
 
-	int step = get_step_1x1(frame_info->fb, direction, 0);
+	int step = get_step_1x1(plane->frame_info->fb, direction, 0);
 
 	while (count) {
 		u16 *px = (u16 *)src_pixels;
@@ -196,13 +304,13 @@ static void ARGB16161616_read_line(struct vkms_frame_info *frame_info, int x_sta
 	}
 }
 
-static void XRGB16161616_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
+static void XRGB16161616_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
 				   enum pixel_read_direction direction, int count,
 				   struct pixel_argb_u16 out_pixel[])
 {
-	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
+	u8 *src_pixels = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
 
-	int step = get_step_1x1(frame_info->fb, direction, 0);
+	int step = get_step_1x1(plane->frame_info->fb, direction, 0);
 
 	while (count) {
 		u16 *px = (u16 *)src_pixels;
@@ -214,13 +322,13 @@ static void XRGB16161616_read_line(struct vkms_frame_info *frame_info, int x_sta
 	}
 }
 
-static void RGB565_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
+static void RGB565_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
 			     enum pixel_read_direction direction, int count,
 			     struct pixel_argb_u16 out_pixel[])
 {
-	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
+	u8 *src_pixels = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
 
-	int step = get_step_1x1(frame_info->fb, direction, 0);
+	int step = get_step_1x1(plane->frame_info->fb, direction, 0);
 
 	while (count) {
 		u16 *px = (u16 *)src_pixels;
@@ -232,6 +340,139 @@ static void RGB565_read_line(struct vkms_frame_info *frame_info, int x_start, in
 	}
 }
 
+static void semi_planar_yuv_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
+				      enum pixel_read_direction direction, int count,
+				      struct pixel_argb_u16 out_pixel[])
+{
+	u8 *y_plane = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
+	u8 *uv_plane = packed_pixels_addr(plane->frame_info,
+					  x_start / plane->frame_info->fb->format->hsub,
+					  y_start / plane->frame_info->fb->format->vsub,
+					  1);
+	struct pixel_yuv_u8 yuv_u8;
+	int step_y = get_step_1x1(plane->frame_info->fb, direction, 0);
+	int step_uv = get_step_1x1(plane->frame_info->fb, direction, 1);
+	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
+	int subsampling_offset = get_subsampling_offset(plane->frame_info->fb->format, direction,
+							x_start, y_start); // 0
+
+	for (int i = 0; i < count; i++) {
+		yuv_u8.y = y_plane[0];
+		yuv_u8.u = uv_plane[0];
+		yuv_u8.v = uv_plane[1];
+
+		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
+				   plane->base.base.color_range);
+		out_pixel += 1;
+		y_plane += step_y;
+		if ((i + subsampling_offset + 1) % subsampling == 0)
+			uv_plane += step_uv;
+	}
+}
+
+static void semi_planar_yvu_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
+				      enum pixel_read_direction direction, int count,
+				      struct pixel_argb_u16 out_pixel[])
+{
+	u8 *y_plane = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
+	u8 *vu_plane = packed_pixels_addr(plane->frame_info,
+					  x_start / plane->frame_info->fb->format->hsub,
+					  y_start / plane->frame_info->fb->format->vsub,
+					  1);
+	struct pixel_yuv_u8 yuv_u8;
+	int step_y = get_step_1x1(plane->frame_info->fb, direction, 0);
+	int step_vu = get_step_1x1(plane->frame_info->fb, direction, 1);
+	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
+	int subsampling_offset = get_subsampling_offset(plane->frame_info->fb->format, direction,
+							x_start, y_start);
+	for (int i = 0; i < count; i++) {
+		yuv_u8.y = y_plane[0];
+		yuv_u8.u = vu_plane[1];
+		yuv_u8.v = vu_plane[0];
+
+		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
+				   plane->base.base.color_range);
+		out_pixel += 1;
+		y_plane += step_y;
+		if ((i + subsampling_offset + 1) % subsampling == 0)
+			vu_plane += step_vu;
+	}
+}
+
+static void planar_yuv_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
+				 enum pixel_read_direction direction, int count,
+				 struct pixel_argb_u16 out_pixel[])
+{
+	u8 *y_plane = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
+	u8 *u_plane = packed_pixels_addr(plane->frame_info,
+					 x_start / plane->frame_info->fb->format->hsub,
+					 y_start / plane->frame_info->fb->format->vsub,
+					 1);
+	u8 *v_plane = packed_pixels_addr(plane->frame_info,
+					 x_start / plane->frame_info->fb->format->hsub,
+					 y_start / plane->frame_info->fb->format->vsub,
+					 2);
+	struct pixel_yuv_u8 yuv_u8;
+	int step_y = get_step_1x1(plane->frame_info->fb, direction, 0);
+	int step_u = get_step_1x1(plane->frame_info->fb, direction, 1);
+	int step_v = get_step_1x1(plane->frame_info->fb, direction, 2);
+	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
+	int subsampling_offset = get_subsampling_offset(plane->frame_info->fb->format, direction,
+							x_start, y_start);
+
+	for (int i = 0; i < count; i++) {
+		yuv_u8.y = *y_plane;
+		yuv_u8.u = *u_plane;
+		yuv_u8.v = *v_plane;
+
+		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
+				   plane->base.base.color_range);
+		out_pixel += 1;
+		y_plane += step_y;
+		if ((i + subsampling_offset + 1) % subsampling == 0) {
+			u_plane += step_u;
+			v_plane += step_v;
+		}
+	}
+}
+
+static void planar_yvu_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
+				 enum pixel_read_direction direction, int count,
+				 struct pixel_argb_u16 out_pixel[])
+{
+	u8 *y_plane = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
+	u8 *v_plane = packed_pixels_addr(plane->frame_info,
+					 x_start / plane->frame_info->fb->format->hsub,
+					 y_start / plane->frame_info->fb->format->vsub,
+					 1);
+	u8 *u_plane = packed_pixels_addr(plane->frame_info,
+					 x_start / plane->frame_info->fb->format->hsub,
+					 y_start / plane->frame_info->fb->format->vsub,
+					 2);
+	struct pixel_yuv_u8 yuv_u8;
+	int step_y = get_step_1x1(plane->frame_info->fb, direction, 0);
+	int step_u = get_step_1x1(plane->frame_info->fb, direction, 1);
+	int step_v = get_step_1x1(plane->frame_info->fb, direction, 2);
+	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
+	int subsampling_offset = get_subsampling_offset(plane->frame_info->fb->format, direction,
+							x_start, y_start);
+
+	for (int i = 0; i < count; i++) {
+		yuv_u8.y = *y_plane;
+		yuv_u8.u = *u_plane;
+		yuv_u8.v = *v_plane;
+
+		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
+				   plane->base.base.color_range);
+		out_pixel += 1;
+		y_plane += step_y;
+		if ((i + subsampling_offset + 1) % subsampling == 0) {
+			u_plane += step_u;
+			v_plane += step_v;
+		}
+	}
+}
+
 /*
  * The following functions take one argb_u16 pixel and convert it to a specific format. The
  * result is stored in @dst_pixels.
@@ -344,6 +585,22 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XRGB16161616_read_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_read_line;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV24:
+		return &semi_planar_yuv_read_line;
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV42:
+		return &semi_planar_yvu_read_line;
+	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
+		return &planar_yuv_read_line;
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
+		return &planar_yvu_read_line;
 	default:
 		return (pixel_read_line_t)NULL;
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 8d2bef95ff79..5a3a9e1328d8 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -9,4 +9,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format);
 
 pixel_write_t get_pixel_write_function(u32 format);
 
+struct pixel_yuv_u8 {
+	u8 y, u, v;
+};
+
 #endif /* _VKMS_FORMATS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 58c1c74742b5..427ca67c60ce 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -17,7 +17,19 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
-	DRM_FORMAT_RGB565
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV24,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_NV42,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YUV444,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YVU422,
+	DRM_FORMAT_YVU444
 };
 
 static struct drm_plane_state *

-- 
2.43.0

