Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5D68C3C7F
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5767F10E4C3;
	Mon, 13 May 2024 07:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RLyHIyBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC8710E4C3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:50:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C474F2001A;
 Mon, 13 May 2024 07:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715586654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6p64KjueiXi2qtqL3vmb7V9pqg3wrSQg7NBUgNKHSM=;
 b=RLyHIyBfi5mx9yowZT7hlM2EvSzwI9xszI9PiW+0nrKmgr6hVRqEy0dGWmvGBRTrjA9SXq
 Osi67gjKHjPx4Ax9Ttr6Nd9+hUu7KpZOLKFAOezrdB/2yvBuCFucUlD6YKLnerbv1Jfjz4
 9+AdswnbhIEpOubqrdDjs62XE6B5YFwrnrOd1QdvRgv6kmE2rf+OvEJmcufE2jX15V1l6l
 dlVo3rAe2ufv7y/EYDuffvxRdcFK2EfNGVyL96cmelykyqmXGuZTZLsjaiDt7wR0YtRpJD
 0vBReZrvVUDl4adN3Vx+XLOhI3t47xkz8ovkyUx3pr2I7kdHYl1Tf8LozRKBZQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 May 2024 09:50:33 +0200
Subject: [PATCH v7 12/17] drm/vkms: Add YUV support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-yuv-v7-12-380e9ffec502@bootlin.com>
References: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
In-Reply-To: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18639;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=g9kgY5swlJXy7VgLiM08LXJIFEZti9+zpjx3Rf1psxY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmQcZEhx/LrJqrQn4HOcTeF+t428rXCd2aqutDG
 pfuwTLbd9iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkHGRAAKCRAgrS7GWxAs
 4v/3D/9e8mAQMG90Fl27eQi4Zx2SG2Qr+05ZpoC8Pm6mSJTakBxJkksQ/TAjO3lr5R9BQ2zNzi8
 GynayvOyyw6Q+5a4gpE5/hkYQRW0iWronQPiuwnyejurNziqQom251E3a2XDM9W8IoJhK+JSVO2
 UdqEflmKs1Y/I3y3nzh73y+kpToP8C6qjmOWL/4Xhvewtzdc8iJj+YyboQEKP+CWxXB+36SLN3J
 k60DwbyYIgKHlZObsjc8cb5sjOG/jIatWViSkl8NG7GHv5yD7QCLoCYvN7yzT2/KVwsifMt1Dhu
 eg/t2abEikULtJCz4z32pndsc46IvC8KO/HRm1CepSywW1z/+J4mKVdftUfGTh0ipoec/wiwm6R
 mBR1RwZJlsBtq6MCSxgcnUbGog/6tj7jsHuwAbFA2D6My3QzDei71w2/FB/0E8mRTOcwbrv9paw
 Tb3mx2oLJwGDiyGAiyu2QWKMPhuPUVk1Vah0cb/b31xV9HTfoUqrIVeryizRhD2EwHp9E3uH4+R
 dF302cEA51Vy0QO9U9uSPnVG8iOvHsZ8j4wxByPWaUoVv/++TZbZqQnYylbUb0Lx6Sd69SgaCdS
 eYZXHmkmFNw9qGlMTGNI5o1K8uiji5grRc+e9Ln+csvdPnd/jYIRLep/gc6cycQoS8ONLFXl7Nq
 mH1t0HePquf9n/w==
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

- NV12/NV16/NV24
- NV21/NV61/NV42
- YUV420/YUV422/YUV444
- YVU420/YVU422/YVU444

The conversion from yuv to rgb is done with fixed-point arithmetic, using
32.32 fixed-point numbers and the drm_fixed helpers.

To do the conversion, a specific matrix must be used for each color range
(DRM_COLOR_*_RANGE) and encoding (DRM_COLOR_*). This matrix is stored in
the `conversion_matrix` struct, along with the specific y_offset needed.
This matrix is queried only once, in `vkms_plane_atomic_update` and
stored in a `vkms_plane_state`. Those conversion matrices of each
encoding and range were obtained by rounding the values of the original
conversion matrices multiplied by 2^32. This is done to avoid the use of
floating point operations.

The same reading function is used for YUV and YVU formats. As the only
difference between those two category of formats is the order of field, a
simple swap in conversion matrix columns allows using the same function.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
[Louis Chauvet:
- Adapted Arthur's work
- Implemented the read_line_t callbacks for yuv
- add struct conversion_matrix
- store the whole conversion_matrix in the plane state
- remove struct pixel_yuv_u8
- update the commit message
- Merge the modifications from Arthur]
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h     |  18 ++
 drivers/gpu/drm/vkms/vkms_formats.c | 352 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h |   4 +
 drivers/gpu/drm/vkms/vkms_plane.c   |  16 +-
 4 files changed, 389 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index dc260527b74b..4a120ee6ce8e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -100,17 +100,35 @@ typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_st
 				  int y_start, enum pixel_read_direction direction, int count,
 				  struct pixel_argb_u16 out_pixel[]);
 
+/**
+ * struct conversion_matrix - Matrix to use for a specific encoding and range
+ *
+ * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
+ * used to compute rgb values from yuv values:
+ *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
+ *   OR for yvu formats:
+ *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
+ *  The values of the matrix are signed fixed-point values with 32 bits fractional part.
+ * @y_offset: Offset to apply on the y value.
+ */
+struct conversion_matrix {
+	s64 matrix[3][3];
+	int y_offset;
+};
+
 /**
  * struct vkms_plane_state - Driver specific plane state
  * @base: base plane state
  * @frame_info: data required for composing computation
  * @pixel_read_line: function to read a pixel line in this plane. The creator of a vkms_plane_state
  * must ensure that this pointer is valid
+ * @conversion_matrix: matrix used for yuv formats to convert to rgb
  */
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
 	pixel_read_line_t pixel_read_line;
+	struct conversion_matrix conversion_matrix;
 };
 
 struct vkms_plane {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index d0d26a7747b0..4ecb7e6bd938 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -134,6 +134,51 @@ static void packed_pixels_addr_1x1(const struct vkms_frame_info *frame_info,
 	*addr = (u8 *)frame_info->map[0].vaddr + offset;
 }
 
+/**
+ * get_subsampling() - Get the subsampling divisor value on a specific direction
+ *
+ * @format: format to extarct the subsampling from
+ * @direction: direction of the subsampling requested
+ */
+static int get_subsampling(const struct drm_format_info *format,
+			   enum pixel_read_direction direction)
+{
+	switch (direction) {
+	case READ_BOTTOM_TO_TOP:
+	case READ_TOP_TO_BOTTOM:
+		return format->vsub;
+	case READ_RIGHT_TO_LEFT:
+	case READ_LEFT_TO_RIGHT:
+		return format->hsub;
+	}
+	WARN_ONCE(true, "Invalid direction for pixel reading: %d\n", direction);
+	return 1;
+}
+
+/**
+ * get_subsampling_offset() - An offset for keeping the chroma siting consistent regardless of
+ * x_start and y_start values
+ *
+ * @direction: direction of the reading to properly compute this offset
+ * @x_start: x coordinate of the starting point of the readed line
+ * @y_start: y coordinate of the starting point of the readed line
+ */
+static int get_subsampling_offset(enum pixel_read_direction direction, int x_start, int y_start)
+{
+	switch (direction) {
+	case READ_BOTTOM_TO_TOP:
+		return -y_start - 1;
+	case READ_TOP_TO_BOTTOM:
+		return y_start;
+	case READ_RIGHT_TO_LEFT:
+		return -x_start - 1;
+	case READ_LEFT_TO_RIGHT:
+		return x_start;
+	}
+	WARN_ONCE(true, "Invalid direction for pixel reading: %d\n", direction);
+	return 0;
+}
+
 /*
  * The following functions take pixel data (a, r, g, b, pixel, ...) and convert them to
  * &struct pixel_argb_u16
@@ -190,6 +235,38 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
 	return out_pixel;
 }
 
+static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
+						  const struct conversion_matrix *matrix)
+{
+	u16 r, g, b;
+	s64 fp_y, fp_channel_1, fp_channel_2;
+	s64 fp_r, fp_g, fp_b;
+
+	fp_y = drm_int2fixp(((int)y - matrix->y_offset) * 257);
+	fp_channel_1 = drm_int2fixp(((int)channel_1 - 128) * 257);
+	fp_channel_2 = drm_int2fixp(((int)channel_2 - 128) * 257);
+
+	fp_r = drm_fixp_mul(matrix->matrix[0][0], fp_y) +
+	       drm_fixp_mul(matrix->matrix[0][1], fp_channel_1) +
+	       drm_fixp_mul(matrix->matrix[0][2], fp_channel_2);
+	fp_g = drm_fixp_mul(matrix->matrix[1][0], fp_y) +
+	       drm_fixp_mul(matrix->matrix[1][1], fp_channel_1) +
+	       drm_fixp_mul(matrix->matrix[1][2], fp_channel_2);
+	fp_b = drm_fixp_mul(matrix->matrix[2][0], fp_y) +
+	       drm_fixp_mul(matrix->matrix[2][1], fp_channel_1) +
+	       drm_fixp_mul(matrix->matrix[2][2], fp_channel_2);
+
+	fp_r = drm_fixp2int_round(fp_r);
+	fp_g = drm_fixp2int_round(fp_g);
+	fp_b = drm_fixp2int_round(fp_b);
+
+	r = clamp(fp_r, 0, 0xffff);
+	g = clamp(fp_g, 0, 0xffff);
+	b = clamp(fp_b, 0, 0xffff);
+
+	return argb_u16_from_u16161616(0xffff, r, g, b);
+}
+
 /*
  * The following functions are read_line function for each pixel format supported by VKMS.
  *
@@ -318,6 +395,91 @@ static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
 	}
 }
 
+/*
+ * This callback can be used for YUV formats where U and V values are
+ * stored in the same plane (often called semi-planar formats). It will
+ * correctly handle subsampling as described in the drm_format_info of the plane.
+ *
+ * The conversion matrix stored in the @plane is used to:
+ * - Apply the correct color range and encoding
+ * - Convert YUV and YVU with the same function (a column swap is needed when setting up
+ * plane->conversion_matrix)
+ */
+static void semi_planar_yuv_read_line(const struct vkms_plane_state *plane, int x_start,
+				      int y_start, enum pixel_read_direction direction, int count,
+				      struct pixel_argb_u16 out_pixel[])
+{
+	u8 *y_plane;
+	u8 *uv_plane;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0,
+			       &y_plane);
+	packed_pixels_addr_1x1(plane->frame_info,
+			       x_start / plane->frame_info->fb->format->hsub,
+			       y_start / plane->frame_info->fb->format->vsub, 1,
+			       &uv_plane);
+	int step_y = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+	int step_uv = get_block_step_bytes(plane->frame_info->fb, direction, 1);
+	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
+	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);
+	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
+
+	for (int i = 0; i < count; i++) {
+		*out_pixel = argb_u16_from_yuv888(y_plane[0], uv_plane[0], uv_plane[1],
+						  conversion_matrix);
+		out_pixel += 1;
+		y_plane += step_y;
+		if ((i + subsampling_offset + 1) % subsampling == 0)
+			uv_plane += step_uv;
+	}
+}
+/*
+ * This callback can be used for YUV format where each color component is
+ * stored in a different plane (often called planar formats). It will
+ * correctly handle subsampling as described in the drm_format_info of the plane.
+ *
+ * The conversion matrix stored in the @plane is used to:
+ * - Apply the correct color range and encoding
+ * - Convert YUV and YVU with the same function (a column swap is needed when setting up
+ * plane->conversion_matrix)
+ */
+static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_start,
+				 int y_start, enum pixel_read_direction direction, int count,
+				 struct pixel_argb_u16 out_pixel[])
+{
+	u8 *y_plane;
+	u8 *channel_1_plane;
+	u8 *channel_2_plane;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0,
+			       &y_plane);
+	packed_pixels_addr_1x1(plane->frame_info,
+			       x_start / plane->frame_info->fb->format->hsub,
+			       y_start / plane->frame_info->fb->format->vsub, 1,
+			       &channel_1_plane);
+	packed_pixels_addr_1x1(plane->frame_info,
+			       x_start / plane->frame_info->fb->format->hsub,
+			       y_start / plane->frame_info->fb->format->vsub, 2,
+			       &channel_2_plane);
+	int step_y = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+	int step_channel_1 = get_block_step_bytes(plane->frame_info->fb, direction, 1);
+	int step_channel_2 = get_block_step_bytes(plane->frame_info->fb, direction, 2);
+	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
+	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);
+	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
+
+	for (int i = 0; i < count; i++) {
+		*out_pixel = argb_u16_from_yuv888(*y_plane, *channel_1_plane, *channel_2_plane,
+						  conversion_matrix);
+		out_pixel += 1;
+		y_plane += step_y;
+		if ((i + subsampling_offset + 1) % subsampling == 0) {
+			channel_1_plane += step_channel_1;
+			channel_2_plane += step_channel_2;
+		}
+	}
+}
+
 /*
  * The following functions take one &struct pixel_argb_u16 and convert it to a specific format.
  * The result is stored in @out_pixel.
@@ -445,6 +607,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XRGB16161616_read_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_read_line;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV42:
+		return &semi_planar_yuv_read_line;
+	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
+		return &planar_yuv_read_line;
 	default:
 		/*
 		 * This is a bug in vkms_plane_atomic_check(). All the supported
@@ -462,6 +638,182 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	}
 }
 
+/*
+ * Those matrices were generated using the colour python framework
+ *
+ * Below are the function calls used to generate each matrix, go to
+ * https://colour.readthedocs.io/en/develop/generated/colour.matrix_YCbCr.html
+ * for more info:
+ *
+ * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+ *                                  is_legal = False,
+ *                                  bits = 8) * 2**32).astype(int)
+ */
+static const struct conversion_matrix no_operation = {
+	.matrix = {
+		{ 4294967296, 0,          0, },
+		{ 0,          4294967296, 0, },
+		{ 0,          0,          4294967296, },
+	},
+	.y_offset = 0,
+};
+
+static const struct conversion_matrix yuv_bt601_full = {
+	.matrix = {
+		{ 4294967296, 0,           6021544149 },
+		{ 4294967296, -1478054095, -3067191994 },
+		{ 4294967296, 7610682049,  0 },
+	},
+	.y_offset = 0,
+};
+
+/*
+ * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+ *                                  is_legal = True,
+ *                                  bits = 8) * 2**32).astype(int)
+ */
+static const struct conversion_matrix yuv_bt601_limited = {
+	.matrix = {
+		{ 5020601039, 0,           6881764740 },
+		{ 5020601039, -1689204679, -3505362278 },
+		{ 5020601039, 8697922339,  0 },
+	},
+	.y_offset = 16,
+};
+
+/*
+ * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+ *                                  is_legal = False,
+ *                                  bits = 8) * 2**32).astype(int)
+ */
+static const struct conversion_matrix yuv_bt709_full = {
+	.matrix = {
+		{ 4294967296, 0,          6763714498 },
+		{ 4294967296, -804551626, -2010578443 },
+		{ 4294967296, 7969741314, 0 },
+	},
+	.y_offset = 0,
+};
+
+/*
+ * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+ *                                  is_legal = True,
+ *                                  bits = 8) * 2**32).astype(int)
+ */
+static const struct conversion_matrix yuv_bt709_limited = {
+	.matrix = {
+		{ 5020601039, 0,          7729959424 },
+		{ 5020601039, -919487572, -2297803934 },
+		{ 5020601039, 9108275786, 0 },
+	},
+	.y_offset = 16,
+};
+
+/*
+ * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+ *                                  is_legal = False,
+ *                                  bits = 8) * 2**32).astype(int)
+ */
+static const struct conversion_matrix yuv_bt2020_full = {
+	.matrix = {
+		{ 4294967296, 0,          6333358775 },
+		{ 4294967296, -706750298, -2453942994 },
+		{ 4294967296, 8080551471, 0 },
+	},
+	.y_offset = 0,
+};
+
+/*
+ * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+ *                                  is_legal = True,
+ *                                  bits = 8) * 2**32).astype(int)
+ */
+static const struct conversion_matrix yuv_bt2020_limited = {
+	.matrix = {
+		{ 5020601039, 0,          7238124312 },
+		{ 5020601039, -807714626, -2804506279 },
+		{ 5020601039, 9234915964, 0 },
+	},
+	.y_offset = 16,
+};
+
+/**
+ * swap_uv_columns() - Swap u and v column of a given matrix
+ *
+ * @matrix: Matrix in which column are swapped
+ */
+static void swap_uv_columns(struct conversion_matrix *matrix)
+{
+	swap(matrix->matrix[0][2], matrix->matrix[0][1]);
+	swap(matrix->matrix[1][2], matrix->matrix[1][1]);
+	swap(matrix->matrix[2][2], matrix->matrix[2][1]);
+}
+
+/**
+ * get_conversion_matrix_to_argb_u16() - Retrieve the correct yuv to rgb conversion matrix for a
+ * given encoding and range.
+ *
+ * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
+ * @encoding: DRM_COLOR_* value for which to obtain a conversion matrix
+ * @range: DRM_COLOR_*_RANGE value for which to obtain a conversion matrix
+ * @matrix: Pointer to store the value into
+ */
+void get_conversion_matrix_to_argb_u16(u32 format,
+				       enum drm_color_encoding encoding,
+				       enum drm_color_range range,
+				       struct conversion_matrix *matrix)
+{
+	const struct conversion_matrix *matrix_to_copy;
+	bool limited_range;
+
+	switch (range) {
+	case DRM_COLOR_YCBCR_LIMITED_RANGE:
+		limited_range = true;
+		break;
+	case DRM_COLOR_YCBCR_FULL_RANGE:
+		limited_range = false;
+		break;
+	case DRM_COLOR_RANGE_MAX:
+		limited_range = false;
+		WARN_ONCE(true, "The requested range is not supported.");
+		break;
+	}
+
+	switch (encoding) {
+	case DRM_COLOR_YCBCR_BT601:
+		matrix_to_copy = limited_range ? &yuv_bt601_limited :
+						 &yuv_bt601_full;
+		break;
+	case DRM_COLOR_YCBCR_BT709:
+		matrix_to_copy = limited_range ? &yuv_bt709_limited :
+						 &yuv_bt709_full;
+		break;
+	case DRM_COLOR_YCBCR_BT2020:
+		matrix_to_copy = limited_range ? &yuv_bt2020_limited :
+						 &yuv_bt2020_full;
+		break;
+	case DRM_COLOR_ENCODING_MAX:
+		matrix_to_copy = &no_operation;
+		WARN_ONCE(true, "The requested encoding is not supported.");
+		break;
+	}
+
+	memcpy(matrix, matrix_to_copy, sizeof(*matrix_to_copy));
+
+	switch (format) {
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV42:
+		swap_uv_columns(matrix);
+		break;
+	default:
+		break;
+	}
+}
+
 /**
  * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
  * If the format is not supported by VKMS a warning is emitted and a dummy "don't do anything"
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 8d2bef95ff79..d583855cb320 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -9,4 +9,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format);
 
 pixel_write_t get_pixel_write_function(u32 format);
 
+void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
+				       enum drm_color_range range,
+				       struct conversion_matrix *matrix);
+
 #endif /* _VKMS_FORMATS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 5a028ee96c91..d4e375913122 100644
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
+	DRM_FORMAT_YVU444,
 };
 
 static struct drm_plane_state *
@@ -118,6 +130,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info->rotation = new_state->rotation;
 
 	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
+	get_conversion_matrix_to_argb_u16(fmt, new_state->color_encoding, new_state->color_range,
+					  &vkms_plane_state->conversion_matrix);
 }
 
 static int vkms_plane_atomic_check(struct drm_plane *plane,

-- 
2.43.2

