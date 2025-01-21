Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE031A17C29
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2146D10E1E8;
	Tue, 21 Jan 2025 10:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eI6q3jz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4592110E1E8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:48:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C088824000D;
 Tue, 21 Jan 2025 10:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+gVGN609jjOXYsBHaZ+JVUnequroKFglKcydecyH+Y=;
 b=eI6q3jz9UmazBtjLSD7cVjQ0TvZWo64iRrzBeLM2aMEVNsX12jBOEr4w+3tModkGp15Rib
 iPYohyy52y42Ah074HnpAldU6F38klii05lUMICQI9u8rnytF5EBvjl6EeB3uXM8SB47It
 pdk0kHnRUgSVJb0p5IYA2oazp0CxGcIyvem+dXfEUcK7MCJDSv0PLmsrUXiZwMyWmK56xw
 n51FdMvyW6hG5CwN+qXiRf0Pvf30EpWAhU5KlEyldUVfy8tzLTPEAcmAQYgNLRO3ndWF9+
 bIHpHfaLnPZDnA6LcE9BxEuO4vZYrOtU+zODaANP5eEc66vOY+5XhgzKVeVztA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:48:02 +0100
Subject: [PATCH v16 1/7] drm/vkms: Add YUV support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-yuv-v16-1-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
In-Reply-To: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=18934;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Y9hVf42q9IUsMaOaN/7heOo1i4rbx0CsiDPAJ20RWT8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj3toCqXFIO4nhGt1aLDwhLd099uYX9dqB6HOc
 +1BrlHzuHCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ497aAAKCRAgrS7GWxAs
 4jf6D/0e/j9s+CqMqmYSIixwHRtDSpvIOWA1EPsPyTefvOfB0jXRn96RRBkeKlCmw0ye8Q7caxj
 OI1cO5xc7LpC7Q7Exm9wvYn98qf/U1DSXhiNx57jyrT3wDKB9NLhdr0bbggIUXf8Twoy8AArlln
 FDAFb3DmolSYvJAM92dQJV0Ck/jGs8XzZhgtA9BFr2WbEOZMtDzl6InCpuug2Hr7uMMINhK/too
 5MxINqZysYTRaRrd8KkkUjpe0cP+XLcVZB0Svug6+RKxOm/lxr81P2u3H0K4QY99L8XnzFxBLxp
 bwJmWtzK5wXnLB6dDXWI9F2nZhrfrVC9TV+I4Gj8HWKLAwIJqqjBTqg36+szWW8TXPVZeqSK8r3
 sgEFbZgUX06xF66wm89us5nCBJVnGiOE9txtIwbm0kFgGE9nR+4Hh1ZB9MHAdJnyr1AyZK/jH13
 /OOOgSW7WSGCWASgcoe3QimqjmWQBw0njuFdIFajXJAIbuOOBs4fj9+Ac6R+oY6hrAZBaLq1qf/
 Kx2mlHIWSEDxWwCj1p0LK6rHPram3ay32Xeg6EXkiYG4gNl07UYj80O/dSOjP/M1d/xuzxKWmNG
 h60QoQ4oh9IinMj9izGMvz3UcMwg4HdtDW2eAWdfsmKp/Gw8JsAURK8MmkFaqjk65m9tdRg9Qel
 H4SfQPvpGUo6iWg==
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
 drivers/gpu/drm/vkms/vkms_formats.c | 354 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h |   4 +
 drivers/gpu/drm/vkms/vkms_plane.c   |  16 +-
 4 files changed, 391 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index abbb652be2b5389f96cec78837117ceb9acef656..fd752c34e6c95606e1f421af24549d78d33cfa16 100644
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
  * @pixel_read_line: function to read a pixel line in this plane. The creator of a
  *		     struct vkms_plane_state must ensure that this pointer is valid
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
index 39b1d7c97d454dfa1420990d35e455ed47e57c0c..1f3ce4f334be9560e62c9a7fd933fa0ed6640e8f 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -140,6 +140,51 @@ static void packed_pixels_addr_1x1(const struct vkms_frame_info *frame_info,
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
@@ -202,6 +247,38 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
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
@@ -311,6 +388,92 @@ static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
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
+
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
@@ -426,6 +589,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
@@ -439,6 +616,183 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
+EXPORT_SYMBOL(get_conversion_matrix_to_argb_u16);
+
 /**
  * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
  * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 8d2bef95ff7974a5c852dbaf3bf3f45c3ac32047..d583855cb32027d16b73d2a5b5a0644b13191d08 100644
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
index e2fce471870f1899f2ccb66b339ce8c4332cc287..10e032e146f093d0fd99a82c7b58d62a0d987fd7 100644
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
2.47.1

