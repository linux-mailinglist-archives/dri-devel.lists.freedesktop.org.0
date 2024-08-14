Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BDC951678
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468A910E41F;
	Wed, 14 Aug 2024 08:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fIQCuJVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0583110E422
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:19:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD01CC000F;
 Wed, 14 Aug 2024 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723623593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+XLqR/82ccZGaCcoGlm+qk8KiKsKQqQDLhoRWrH/3Qw=;
 b=fIQCuJVYWFiym+vsfPj9/bh1x3x0I6iIQY2PaYQDdM0HkCGOXcPXj8juqukgl6X5aXKfgS
 reqeIvbrYRK0IML+I5qCr2TxSqRSPNAZ3uwvV+BqewlEUxCgavcPxTSLY9Du8/LkwboydO
 baRYASH3yyqKv0vHuqsoPmXu52oAkBVHkCYkoK+5sEwxHpluAAUjjZzCiC1znqNNWfm72G
 eURm1xmd/Qj6tSid0yzrm/Nkh7yosmKmZyDGI9ZmaIXx8B7Iv9JBdLweZ/F7T118prsPt7
 qSA54erw94R1RU5slvREJ7yG/28le1RXiLkz6EE5qXexcydN0O0j//NoFTaQHw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 10:19:40 +0200
Subject: [PATCH v2 7/8] drm/vkms: Create helper macro for YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-new-color-formats-v2-7-8b3499cfe90e@bootlin.com>
References: <20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com>
In-Reply-To: <20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com>
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
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20240809-yuv-v10-0-1a7c764166f7@bootlin.com
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5213;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=OgrIZaRglaW9lLIYFQvj2Tj4ljYg7ePzSg0Mkmo6f9o=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvGifM8NYxhUiKoSs23U/LpjvqGyqrDYoxHbj3
 hJ7zOsBCgmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxonwAKCRAgrS7GWxAs
 4jf2EADIi8Dvo8G79mSzjEY5OGDg9gA4G5cjEl0QCIIoZLsaTjw2XYGIip37qcWZlk0+A2P9hw4
 MA2+XAYPU1lKCSBA0iRiP6XXbiyq5tGUxsBsTSB/kc1biK6KwkqBCkBx52m0GuFOjzMxXvUB9kK
 Urzj1UYGAD3JJISTJo4h4ffS7IQQxnNCQFg0avDlKw37olEvhGAXy03WI1K5tDz+797UEwqsMOb
 50oq3sRL7sggppy/lmgvF8Ywzi1jQnyRCgVPqA1rjffJQYKX9eKIxCzj2vijE5+nfLNo7MtemW3
 Xceq/rnX/g5pP3Zu/v9AdQhT6xO5N4CHweS8As3CLfaGaQvvyYfqeaVqQtW+gy47RiGXeiKwYUV
 +afsyYzBId05zdreqlrkxOlHmeFKSGWFBD+i3NA1OnXu+dsdjrfhTqx38aODQVSH2/+FJy/KkFY
 LpEiWT2tLbUHOdsAaVcG45LpVJdD+IAF2ENylbSU5uN+W/L7Jb0piruF3wtCsx/GjxkaFPdFDdk
 1UOhf1OxmelZdYJzNTmggFhfsuJeUIOrjpBn0g3Hb+BttgxWLXZVEqk74VvYNNlmlxhMFnWJQ40
 +y53JkJQetkD1vYUnbPVpht1mXO9Rm1UInJuX/J37M13hHlqQc3F7Fzz584p936XT6fbpC/SkWo
 3a9rPa9ufHETwDg==
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

The callback functions for line conversion are almost identical for
semi-planar formats. The generic READ_LINE_YUV_SEMIPLANAR macro
generate all the required boilerplate to process a line from a
semi-planar format.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 75 ++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 71aae2397c5f..129672a555ce 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -484,35 +484,56 @@ READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
  * - Convert YUV and YVU with the same function (a column swap is needed when setting up
  * plane->conversion_matrix)
  */
-static void semi_planar_yuv_read_line(const struct vkms_plane_state *plane, int x_start,
-				      int y_start, enum pixel_read_direction direction, int count,
-				      struct pixel_argb_u16 out_pixel[])
-{
-	u8 *y_plane;
-	u8 *uv_plane;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0,
-			       &y_plane);
-	packed_pixels_addr_1x1(plane->frame_info,
-			       x_start / plane->frame_info->fb->format->hsub,
-			       y_start / plane->frame_info->fb->format->vsub, 1,
-			       &uv_plane);
-	int step_y = get_block_step_bytes(plane->frame_info->fb, direction, 0);
-	int step_uv = get_block_step_bytes(plane->frame_info->fb, direction, 1);
-	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
-	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);
-	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
 
-	for (int i = 0; i < count; i++) {
-		*out_pixel = argb_u16_from_yuv161616(conversion_matrix, y_plane[0] * 257,
-						     uv_plane[0] * 257, uv_plane[1] * 257);
-		out_pixel += 1;
-		y_plane += step_y;
-		if ((i + subsampling_offset + 1) % subsampling == 0)
-			uv_plane += step_uv;
-	}
+/**
+ * READ_LINE_YUV_SEMIPLANAR() - Generic generator for a read_line function which can be used for yuv
+ * formats with two planes and block_w == block_h == 1.
+ *
+ * @function_name: Function name to generate
+ * @pixel_1_name: temporary pixel name for the first plane used in the @__VA_ARGS__ parameters
+ * @pixel_2_name: temporary pixel name for the second plane used in the @__VA_ARGS__ parameters
+ * @pixel_1_type: Used to specify the type you want to cast the pixel pointer on the plane 1
+ * @pixel_2_type: Used to specify the type you want to cast the pixel pointer on the plane 2
+ * @callback: Callback to call for each pixels. This function should take
+ *            (struct conversion_matrix*, @__VA_ARGS__) as parameter and return a pixel_argb_u16
+ * @__VA_ARGS__: Argument to pass inside the callback. You can use @pixel_1_name and @pixel_2_name
+ *               to access current pixel values
+ */
+#define READ_LINE_YUV_SEMIPLANAR(function_name, pixel_1_name, pixel_2_name, pixel_1_type,	\
+				 pixel_2_type, callback, ...)					\
+static void function_name(const struct vkms_plane_state *plane, int x_start,			\
+		 int y_start, enum pixel_read_direction direction, int count,			\
+		 struct pixel_argb_u16 out_pixel[])						\
+{												\
+	u8 *plane_1;										\
+	u8 *plane_2;										\
+												\
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0,				\
+			       &plane_1);							\
+	packed_pixels_addr_1x1(plane->frame_info,						\
+			       x_start / plane->frame_info->fb->format->hsub,			\
+			       y_start / plane->frame_info->fb->format->vsub, 1,		\
+			       &plane_2);							\
+	int step_1 = get_block_step_bytes(plane->frame_info->fb, direction, 0);			\
+	int step_2 = get_block_step_bytes(plane->frame_info->fb, direction, 1);			\
+	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);		\
+	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);		\
+	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;		\
+												\
+	for (int i = 0; i < count; i++) {							\
+		pixel_1_type *(pixel_1_name) = (pixel_1_type *)plane_1;				\
+		pixel_2_type *(pixel_2_name) = (pixel_2_type *)plane_2;				\
+		*out_pixel = (callback)(conversion_matrix, __VA_ARGS__);			\
+		out_pixel += 1;									\
+		plane_1 += step_1;								\
+		if ((i + subsampling_offset + 1) % subsampling == 0)				\
+			plane_2 += step_2;							\
+	}											\
 }
 
+READ_LINE_YUV_SEMIPLANAR(YUV888_semiplanar_read_line, y, uv, u8, u8, argb_u16_from_yuv161616,
+			 y[0] * 257, uv[0] * 257, uv[1] * 257)
+
 /*
  * This callback can be used for YUV format where each color component is
  * stored in a different plane (often called planar formats). It will
@@ -704,7 +725,7 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV61:
 	case DRM_FORMAT_NV42:
-		return &semi_planar_yuv_read_line;
+		return &YUV888_semiplanar_read_line;
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
 	case DRM_FORMAT_YUV444:

-- 
2.44.2

