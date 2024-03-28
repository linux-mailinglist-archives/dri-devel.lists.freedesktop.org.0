Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A1F87ADED
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B59E10F819;
	Wed, 13 Mar 2024 17:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Fvvd5fm+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE6610F7F7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:45:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B6DD40016;
 Wed, 13 Mar 2024 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710351938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmbGHzpoiSKgZqMjcDD066gXk2gdMcvk9QYsJ8M1b5o=;
 b=Fvvd5fm+sp4KfrA2DORmK7/UyEtGyr4R7uX7QRi/c0ZIJhVuo+vqKpjmVpRoFlYIzkNpDX
 45YL4JuNccejU04XAVFmPUSrKfWLsnBD/cm9vpRiIVA8kVIGDobO4rPLdnITWKxnBLWEyn
 QDR81ixQ3V5aXm2qlyy1S7ukH11H534vErdtpUPklslG/K2c9Q4Zwm7ZY9hHf5h4mkzCO1
 FqEOZ3OuqyuqWtQzhPn2X5rMlRnHBHXr3b5utt4MW8qZPMu27FssYPOD24Mxeu8TUMjL3z
 pWVbnbeBLmHVNCZ4RlAIJSriqgrXLv/dGSxru738RhhnLTkhAXn9J0F2UMtWrw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 13 Mar 2024 18:45:05 +0100
Subject: [PATCH v5 11/16] drm/vkms: Add YUV support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-yuv-v5-11-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
In-Reply-To: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=20137;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=DuAUBevyqcFfsLfdI+QWb9XAI1PLzm1uuvy20tfcpmI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8eY07IpwsyWJ3/fsEYacswu9VzyZJvtla9F1mudI
 2iDh8PWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHmNAAKCRAgrS7GWxAs4mUUD/
 0XYPtqJ1kApKf5H0qK9WAzgimIUlV5Sr2srBACyIiHDIKefHX+CaRq0+t5bFrNMMvxf63hK9F0MzFy
 i8jrM14Anpsuavg/xI8QbVS9dHqigx2V7EuGahjppYHnYTpKXayFef3IHJmBXx2jTce+yCeMlogas7
 6gnkQBP/svU1ZPLsRGeM6wVQ783ChXv7x8d7KM9deKdce5ttlp3F/Jubmg4tVfsQVmpeXfOREFmZpp
 5UUoXE8Wo0E1gA2LyrcUm43oR+KFNfotYEo3LYiTLn7zN56jzYE5vp4Wk9gny0nWCUoclOJx2tu9ft
 JcQDPz8kyp+Z7kjHe1BCJOh3F/o5fQNKMk4hNAwleVz4OqoSGd1RkgoXFF0i62reQ1aMLZjpdDJlJ5
 VWow+iQ0qbBwT9EutO6vIBaNmwXN33rMhz1rxSM+8hkBXRH06a55o7KswFDxvul6hhAh0T5megeo5+
 FK1paZ8hdVx5Th0ni3DuHSkDLIwDyHseaeNG43yB0SBpiHiQOFaCvniyfrC7Rxsd0hAY+JRQhRMBeU
 bhWY+kGwkhZhUGbU5RdxoKgSFSsVirMy/KMgISZbG2Xdmg7p8e8L3GVIRNpUtNjsxiaBrkqv7FwGPl
 +aoVgYrl1LMx0V+R1tIhqAqkTGzeEyXIiKuTmpGOrpmtUQf7gpiliAhmFwKA==
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
32.32 floats and the drm_fixed helpers.

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
- remove struct pixel_yuv_u8
- update the commit message
- Merge the modifications from Arthur]
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h     |  22 ++
 drivers/gpu/drm/vkms/vkms_formats.c | 431 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h |   4 +
 drivers/gpu/drm/vkms/vkms_plane.c   |  17 +-
 4 files changed, 473 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 23e1d247468d..f3116084de5a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -99,6 +99,27 @@ typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_st
 				  int y_start, enum pixel_read_direction direction, int count,
 				  struct pixel_argb_u16 out_pixel[]);
 
+/**
+ * CONVERSION_MATRIX_FLOAT_DEPTH - Number of digits after the point for conversion matrix values
+ */
+#define CONVERSION_MATRIX_FLOAT_DEPTH 32
+
+/**
+ * struct conversion_matrix - Matrix to use for a specific encoding and range
+ *
+ * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
+ * used to compute rgb values from yuv values:
+ *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
+ *   OR for yvu formats:
+ *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
+ *  The values of the matrix are fixed floats, 32.CONVERSION_MATRIX_FLOAT_DEPTH
+ * @y_offest: Offset to apply on the y value.
+ */
+struct conversion_matrix {
+	s64 matrix[3][3];
+	s64 y_offset;
+};
+
 /**
  * vkms_plane_state - Driver specific plane state
  * @base: base plane state
@@ -110,6 +131,7 @@ struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
 	pixel_read_line_t pixel_read_line;
+	struct conversion_matrix *conversion_matrix;
 };
 
 struct vkms_plane {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 1449a0e6c706..edbf4b321b91 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -105,6 +105,44 @@ static int get_step_next_block(struct drm_framebuffer *fb, enum pixel_read_direc
 	return 0;
 }
 
+/**
+ * get_subsampling() - Get the subsampling divisor value on a specific direction
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
  * The following  functions take pixel data (a, r, g, b, pixel, ...), convert them to the format
  * ARGB16161616 in out_pixel.
@@ -161,6 +199,42 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
 	return out_pixel;
 }
 
+static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
+						  struct conversion_matrix *matrix)
+{
+	u8 r, g, b;
+	s64 fp_y, fp_cb, fp_cr;
+	s64 fp_r, fp_g, fp_b;
+
+	fp_y = y - matrix->y_offset;
+	fp_cb = cb - 128;
+	fp_cr = cr - 128;
+
+	fp_y = drm_int2fixp(fp_y);
+	fp_cb = drm_int2fixp(fp_cb);
+	fp_cr = drm_int2fixp(fp_cr);
+
+	fp_r = drm_fixp_mul(matrix->matrix[0][0], fp_y) +
+	       drm_fixp_mul(matrix->matrix[0][1], fp_cb) +
+	       drm_fixp_mul(matrix->matrix[0][2], fp_cr);
+	fp_g = drm_fixp_mul(matrix->matrix[1][0], fp_y) +
+	       drm_fixp_mul(matrix->matrix[1][1], fp_cb) +
+	       drm_fixp_mul(matrix->matrix[1][2], fp_cr);
+	fp_b = drm_fixp_mul(matrix->matrix[2][0], fp_y) +
+	       drm_fixp_mul(matrix->matrix[2][1], fp_cb) +
+	       drm_fixp_mul(matrix->matrix[2][2], fp_cr);
+
+	fp_r = drm_fixp2int_round(fp_r);
+	fp_g = drm_fixp2int_round(fp_g);
+	fp_b = drm_fixp2int_round(fp_b);
+
+	r = clamp(fp_r, 0, 0xff);
+	g = clamp(fp_g, 0, 0xff);
+	b = clamp(fp_b, 0, 0xff);
+
+	return argb_u16_from_u8888(255, r, g, b);
+}
+
 /*
  * The following functions are read_line function for each pixel format supported by VKMS.
  *
@@ -293,6 +367,79 @@ static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
 	}
 }
 
+/*
+ * This callback can be used for yuv and yvu formats, given a properly modified conversion matrix
+ * (column inversion)
+ */
+static void semi_planar_yuv_read_line(const struct vkms_plane_state *plane, int x_start,
+				      int y_start, enum pixel_read_direction direction, int count,
+				      struct pixel_argb_u16 out_pixel[])
+{
+	int rem_x, rem_y;
+	u8 *y_plane;
+	u8 *uv_plane;
+
+	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &y_plane, &rem_x, &rem_y);
+	packed_pixels_addr(plane->frame_info,
+			   x_start / plane->frame_info->fb->format->hsub,
+			   y_start / plane->frame_info->fb->format->vsub,
+			   1, &uv_plane, &rem_x, &rem_y);
+	int step_y = get_step_next_block(plane->frame_info->fb, direction, 0);
+	int step_uv = get_step_next_block(plane->frame_info->fb, direction, 1);
+	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
+	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);
+	struct conversion_matrix *conversion_matrix = plane->conversion_matrix;
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
+
+/*
+ * This callback can be used for yuv and yvu formats, given a properly modified conversion matrix
+ * (column inversion)
+ */
+static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_start,
+				 int y_start, enum pixel_read_direction direction, int count,
+				 struct pixel_argb_u16 out_pixel[])
+{
+	int rem_x, rem_y;
+	u8 *y_plane;
+	u8 *u_plane;
+	u8 *v_plane;
+
+	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &y_plane, &rem_x, &rem_y);
+	packed_pixels_addr(plane->frame_info,
+			   x_start / plane->frame_info->fb->format->hsub,
+			   y_start / plane->frame_info->fb->format->vsub,
+			   1, &u_plane, &rem_x, &rem_y);
+	packed_pixels_addr(plane->frame_info,
+			   x_start / plane->frame_info->fb->format->hsub,
+			   y_start / plane->frame_info->fb->format->vsub,
+			   2, &v_plane, &rem_x, &rem_y);
+	int step_y = get_step_next_block(plane->frame_info->fb, direction, 0);
+	int step_u = get_step_next_block(plane->frame_info->fb, direction, 1);
+	int step_v = get_step_next_block(plane->frame_info->fb, direction, 2);
+	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
+	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);
+	struct conversion_matrix *conversion_matrix = plane->conversion_matrix;
+
+	for (int i = 0; i < count; i++) {
+		*out_pixel = argb_u16_from_yuv888(*y_plane, *u_plane, *v_plane, conversion_matrix);
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
  * result is stored in @out_pixel.
@@ -418,6 +565,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
 		 * This is a bug in vkms_plane_atomic_check. All the supported
@@ -435,6 +596,276 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	}
 }
 
+/**
+ * get_conversion_matrix_to_argb_u16() - Retrieve the correct yuv to rgb conversion matrix for a
+ * given encoding and range.
+ *
+ * If the matrix is not found, return a null pointer. In all other cases, it return a simple
+ * diagonal matrix, which act as a "no-op".
+ *
+ * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
+ * @encoding: DRM_COLOR_* value for which to obtain a conversion matrix
+ * @range: DRM_COLOR_*_RANGE value for which to obtain a conversion matrix
+ */
+struct conversion_matrix *
+get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	static struct conversion_matrix no_operation = {
+		.matrix = {
+			{ 4294967296, 0,          0, },
+			{ 0,          4294967296, 0, },
+			{ 0,          0,          4294967296, },
+		},
+		.y_offset = 0,
+	};
+
+	/*
+	 * Those matrixies were generated using the colour python framework
+	 *
+	 * Below are the function calls used to generate eac matrix, go to
+	 * https://colour.readthedocs.io/en/develop/generated/colour.matrix_YCbCr.html
+	 * for more info:
+	 *
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+	 *                                  is_legal = False,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
+	static struct conversion_matrix yuv_bt601_full = {
+		.matrix = {
+			{ 4294967296, 0,           6021544149 },
+			{ 4294967296, -1478054095, -3067191994 },
+			{ 4294967296, 7610682049,  0 },
+		},
+		.y_offset = 0,
+	};
+
+	/*
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+	 *                                  is_legal = True,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
+	static struct conversion_matrix yuv_bt601_limited = {
+		.matrix = {
+			{ 5020601039, 0,           6881764740 },
+			{ 5020601039, -1689204679, -3505362278 },
+			{ 5020601039, 8697922339,  0 },
+		},
+		.y_offset = 16,
+	};
+
+	/*
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+	 *                                  is_legal = False,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
+	static struct conversion_matrix yuv_bt709_full = {
+		.matrix = {
+			{ 4294967296, 0,          6763714498 },
+			{ 4294967296, -804551626, -2010578443 },
+			{ 4294967296, 7969741314, 0 },
+		},
+		.y_offset = 0,
+	};
+
+	/*
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+	 *                                  is_legal = True,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
+	static struct conversion_matrix yuv_bt709_limited = {
+		.matrix = {
+			{ 5020601039, 0,          7729959424 },
+			{ 5020601039, -919487572, -2297803934 },
+			{ 5020601039, 9108275786, 0 },
+		},
+		.y_offset = 16,
+	};
+
+	/*
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+	 *                                  is_legal = False,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
+	static struct conversion_matrix yuv_bt2020_full = {
+		.matrix = {
+			{ 4294967296, 0,          6333358775 },
+			{ 4294967296, -706750298, -2453942994 },
+			{ 4294967296, 8080551471, 0 },
+		},
+		.y_offset = 0,
+	};
+
+	/*
+	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+	 *                                  is_legal = True,
+	 *                                  bits = 8) * 2**32).astype(int)
+	 */
+	static struct conversion_matrix yuv_bt2020_limited = {
+		.matrix = {
+			{ 5020601039, 0,          7238124312 },
+			{ 5020601039, -807714626, -2804506279 },
+			{ 5020601039, 9234915964, 0 },
+		},
+		.y_offset = 16,
+	};
+
+	/*
+	 * The next matrices are just the previous ones, but with the first and
+	 * second columns swapped
+	 */
+	static struct conversion_matrix yvu_bt601_full = {
+		.matrix = {
+			{ 4294967296, 6021544149,  0 },
+			{ 4294967296, -3067191994, -1478054095 },
+			{ 4294967296, 0,           7610682049 },
+		},
+		.y_offset = 0,
+	};
+	static struct conversion_matrix yvu_bt601_limited = {
+		.matrix = {
+			{ 5020601039, 6881764740,  0 },
+			{ 5020601039, -3505362278, -1689204679 },
+			{ 5020601039, 0,           8697922339 },
+		},
+		.y_offset = 16,
+	};
+	static struct conversion_matrix yvu_bt709_full = {
+		.matrix = {
+			{ 4294967296, 6763714498,  0 },
+			{ 4294967296, -2010578443, -804551626 },
+			{ 4294967296, 0,           7969741314 },
+		},
+		.y_offset = 0,
+	};
+	static struct conversion_matrix yvu_bt709_limited = {
+		.matrix = {
+			{ 5020601039, 7729959424,  0 },
+			{ 5020601039, -2297803934, -919487572 },
+			{ 5020601039, 0,           9108275786 },
+		},
+		.y_offset = 16,
+	};
+	static struct conversion_matrix yvu_bt2020_full = {
+		.matrix = {
+			{ 4294967296, 6333358775,  0 },
+			{ 4294967296, -2453942994, -706750298 },
+			{ 4294967296, 0,           8080551471 },
+		},
+		.y_offset = 0,
+	};
+	static struct conversion_matrix yvu_bt2020_limited = {
+		.matrix = {
+			{ 5020601039, 7238124312,  0 },
+			{ 5020601039, -2804506279, -807714626 },
+			{ 5020601039, 0,           9234915964 },
+		},
+		.y_offset = 16,
+	};
+
+	/* Breaking in this switch means that the color format+encoding+range is not supported */
+	switch (format) {
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
+		switch (encoding) {
+		case DRM_COLOR_YCBCR_BT601:
+			switch (range) {
+			case DRM_COLOR_YCBCR_LIMITED_RANGE:
+				return &yuv_bt601_limited;
+			case DRM_COLOR_YCBCR_FULL_RANGE:
+				return &yuv_bt601_full;
+			case DRM_COLOR_RANGE_MAX:
+				break;
+			}
+			break;
+		case DRM_COLOR_YCBCR_BT709:
+			switch (range) {
+			case DRM_COLOR_YCBCR_LIMITED_RANGE:
+				return &yuv_bt709_limited;
+			case DRM_COLOR_YCBCR_FULL_RANGE:
+				return &yuv_bt709_full;
+			case DRM_COLOR_RANGE_MAX:
+				break;
+			}
+			break;
+		case DRM_COLOR_YCBCR_BT2020:
+			switch (range) {
+			case DRM_COLOR_YCBCR_LIMITED_RANGE:
+				return &yuv_bt2020_limited;
+			case DRM_COLOR_YCBCR_FULL_RANGE:
+				return &yuv_bt2020_full;
+			case DRM_COLOR_RANGE_MAX:
+				break;
+			}
+			break;
+		case DRM_COLOR_ENCODING_MAX:
+			break;
+		}
+		break;
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV42:
+		switch (encoding) {
+		case DRM_COLOR_YCBCR_BT601:
+			switch (range) {
+			case DRM_COLOR_YCBCR_LIMITED_RANGE:
+				return &yvu_bt601_limited;
+			case DRM_COLOR_YCBCR_FULL_RANGE:
+				return &yvu_bt601_full;
+			case DRM_COLOR_RANGE_MAX:
+				break;
+			}
+			break;
+		case DRM_COLOR_YCBCR_BT709:
+			switch (range) {
+			case DRM_COLOR_YCBCR_LIMITED_RANGE:
+				return &yvu_bt709_limited;
+			case DRM_COLOR_YCBCR_FULL_RANGE:
+				return &yvu_bt709_full;
+			case DRM_COLOR_RANGE_MAX:
+				break;
+			}
+			break;
+		case DRM_COLOR_YCBCR_BT2020:
+			switch (range) {
+			case DRM_COLOR_YCBCR_LIMITED_RANGE:
+				return &yvu_bt2020_limited;
+			case DRM_COLOR_YCBCR_FULL_RANGE:
+				return &yvu_bt2020_full;
+			case DRM_COLOR_RANGE_MAX:
+				break;
+			}
+			break;
+		case DRM_COLOR_ENCODING_MAX:
+			break;
+		}
+		break;
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB16161616:
+	case DRM_FORMAT_XRGB16161616:
+	case DRM_FORMAT_RGB565:
+		/*
+		 * Those formats are supported, but they don't need a conversion matrix. Return
+		 * a valid pointer to avoid kernel panic in case this matrix is used/checked
+		 * somewhere.
+		 */
+		return &no_operation;
+	default:
+		break;
+	}
+	WARN(true, "Unsupported encoding (%d), range (%d) and format (%p4cc) combination\n",
+	     encoding, range, &format);
+	return &no_operation;
+}
+
 /**
  * Retrieve the correct write_pixel function for a specific format.
  * If the format is not supported by VKMS a warn is emitted and a dummy "don't do anything"
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 8d2bef95ff79..e1d324764b17 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -9,4 +9,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format);
 
 pixel_write_t get_pixel_write_function(u32 format);
 
+struct conversion_matrix *
+get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
+				  enum drm_color_range range);
+
 #endif /* _VKMS_FORMATS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 8875bed76410..987dd2b686a8 100644
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
@@ -117,12 +129,15 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	drm_framebuffer_get(frame_info->fb);
 	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
 									  DRM_MODE_ROTATE_90 |
+									  DRM_MODE_ROTATE_180 |
 									  DRM_MODE_ROTATE_270 |
 									  DRM_MODE_REFLECT_X |
 									  DRM_MODE_REFLECT_Y);
 
 
 	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
+	vkms_plane_state->conversion_matrix = get_conversion_matrix_to_argb_u16
+		(fmt, new_state->color_encoding, new_state->color_range);
 }
 
 static int vkms_plane_atomic_check(struct drm_plane *plane,

-- 
2.43.0

