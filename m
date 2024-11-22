Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D99D61FF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA4E10EBFC;
	Fri, 22 Nov 2024 16:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LNSyMyrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B4C10EBFB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:19:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78D9B60002;
 Fri, 22 Nov 2024 16:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cw1lm/kzwxajdmu7r2dcdO3tCjaL56NGjbITviJPxno=;
 b=LNSyMyrNOQOQ/zNP8CZrk9diIYI+GObKO7ndk1ruGTgW9/IT5LNMsNJ3aJMogiRU7vs6d7
 EAj8aNqdswC2T/M3DUpLlpQiA6L4vOMiNfy3JQz0Ryyfz3e6nLATZhXWCzQmGollV1BEPI
 /rsKtXxP2JEmK26AcykVmZdg7y9O83i6RxRrBqQkNO9TnxJX2P94LTUy3psYObTOMH32u9
 1WVplKy0oLqUhL6syZ9Hh33PeftbV3Tl1+HYFaM5eLcASBhfHkJLqWE8MB6OnLFKbUvzoo
 ysNC96jIEUL65F7YRY4sG8wtbfTngWem2FUExvXaoFqeQcMt/W9+m4P8CfmHQA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:19:06 +0100
Subject: [PATCH v3 6/8] drm/vkms: Change YUV helpers to support u16 inputs
 for conversion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-new-color-formats-v3-6-23f7776197c9@bootlin.com>
References: <20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com>
In-Reply-To: <20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BUrScrD21+8OVFDE9O4vUOYPacl4PSRaT4P7htnDffU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQK73WMmLSZdj6tvlxFVmCvVjNVLuUTIeAGiMF
 Jz7i9EYw+6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cu9wAKCRAgrS7GWxAs
 4veoEACodwITQS3HZ4XnZlRC6hHFK8nvgpu5rzCswZMvQVekUhbzEB4fRIU1OvLATkWV2Y57X31
 BD1c3Bzto5R1maNK6m5TtxoYIz43B96tD4UYGJTJofhplznVpisi7yKaaJP5nTGbcA7clrO2/DC
 tUmBjfD17UmMjfg2KxqRSNH1fP/vJk0aqoRvu4zElyQMt9q3zKKdgeePCFZkHeD92HfwOb0tWjW
 i4hYruh++2Y65gZAJcdBOS7SEFdOpCOpZhfuEvfcnWCsVxtpYtvtypxYoPNLPx+XRZeLC/3cmZ4
 mR7Jvs7y8DtGfueRcUuOV6aj4KWegx2iyq+iPVNkDQRUKTvxe9ZEZBJ8PHA/ShNXtFkEeBmWY6L
 GClzqVPnSIywWKG2U5eaUNgSd4XAjjgc7S94jOlYiRn5ZbdCzIhCI3FciNMA/I/DEVwqgJlp80N
 lA8jUWcxmHwrzUfgl2UiVXBBCAREZX1BRqRxn6GC8KasrDW01eIs+aoQjLVvj0ABK92/VUpGNSm
 nGwZQbyM1cSlrWe3TuyRtPLGhUL6mamuMmBqpxf7NRriT1eZrDcUoMiZ/+izgUjo6rolW2PjILt
 hRt9EFP+iLWwqbP7YhxrP7uQQpePnMFn86mBCnml4wCUDRWW5PEg5matIZnR2IhfRWG7z/tS8wG
 rTtk9PgCSwK5+pg==
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

Some YUV format uses 16 bit values, so change the helper function for
conversion to support those new formats.

Add support for the YUV format P010

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_format_test.c |  3 ++-
 drivers/gpu/drm/vkms/vkms_formats.c           | 26 ++++++++++++++------------
 drivers/gpu/drm/vkms/vkms_formats.h           |  4 ++--
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
index 4f565ecb591c34b08d9df577860488702200a384..1d9a6515ce44f56fc3032f9aad2d11591bb71a68 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -226,7 +226,8 @@ static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
 		get_conversion_matrix_to_argb_u16
 			(DRM_FORMAT_NV12, param->encoding, param->range, &matrix);
 
-		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, &matrix);
+		argb = argb_u16_from_yuv161616(&matrix, color->yuv.y * 257, color->yuv.u * 257,
+					       color->yuv.v * 257);
 
 		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.a, color->argb.a), 257,
 				    "On the A channel of the color %s expected 0x%04x, got 0x%04x",
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index f73d3de33807644a7f7294a4dc8b9de2bec6e427..668c3a88a1f3e7d4e3c492a428bc487291392da2 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -279,16 +279,17 @@ static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
 	return out_pixel;
 }
 
-VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
-							    const struct conversion_matrix *matrix)
+VISIBLE_IF_KUNIT
+struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
+					      u16 y, u16 channel_1, u16 channel_2)
 {
 	u16 r, g, b;
 	s64 fp_y, fp_channel_1, fp_channel_2;
 	s64 fp_r, fp_g, fp_b;
 
-	fp_y = drm_int2fixp(((int)y - matrix->y_offset) * 257);
-	fp_channel_1 = drm_int2fixp(((int)channel_1 - 128) * 257);
-	fp_channel_2 = drm_int2fixp(((int)channel_2 - 128) * 257);
+	fp_y = drm_int2fixp((int)y - matrix->y_offset * 257);
+	fp_channel_1 = drm_int2fixp((int)channel_1 - 128 * 257);
+	fp_channel_2 = drm_int2fixp((int)channel_2 - 128 * 257);
 
 	fp_r = drm_fixp_mul(matrix->matrix[0][0], fp_y) +
 	       drm_fixp_mul(matrix->matrix[0][1], fp_channel_1) +
@@ -310,7 +311,7 @@ VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1,
 
 	return argb_u16_from_u16161616(0xffff, r, g, b);
 }
-EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
+EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv161616);
 
 /**
  * READ_LINE() - Generic generator for a read_line function which can be used for format with one
@@ -505,8 +506,8 @@ static void semi_planar_yuv_read_line(const struct vkms_plane_state *plane, int
 	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
 
 	for (int i = 0; i < count; i++) {
-		*out_pixel = argb_u16_from_yuv888(y_plane[0], uv_plane[0], uv_plane[1],
-						  conversion_matrix);
+		*out_pixel = argb_u16_from_yuv161616(conversion_matrix, y_plane[0] * 257,
+						     uv_plane[0] * 257, uv_plane[1] * 257);
 		out_pixel += 1;
 		y_plane += step_y;
 		if ((i + subsampling_offset + 1) % subsampling == 0)
@@ -550,8 +551,9 @@ static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_sta
 	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
 
 	for (int i = 0; i < count; i++) {
-		*out_pixel = argb_u16_from_yuv888(*y_plane, *channel_1_plane, *channel_2_plane,
-						  conversion_matrix);
+		*out_pixel = argb_u16_from_yuv161616(conversion_matrix,
+						     *y_plane * 257, *channel_1_plane * 257,
+						     *channel_2_plane * 257);
 		out_pixel += 1;
 		y_plane += step_y;
 		if ((i + subsampling_offset + 1) % subsampling == 0) {
@@ -683,9 +685,9 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	case DRM_FORMAT_BGRX8888:
 		return &BGRX8888_read_line;
 	case DRM_FORMAT_RGB888:
-		return RGB888_read_line;
+		return &RGB888_read_line;
 	case DRM_FORMAT_BGR888:
-		return BGR888_read_line;
+		return &BGR888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
 	case DRM_FORMAT_ABGR16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index b4fe62ab9c65d465925d29911f26612193a80799..eeb208cdd6b1be9676b4706e0e3cbb2ad7efe067 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -14,8 +14,8 @@ void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encod
 				       struct conversion_matrix *matrix);
 
 #if IS_ENABLED(CONFIG_KUNIT)
-struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
-					   const struct conversion_matrix *matrix);
+struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
+					      u16 y, u16 channel_1, u16 channel_2);
 #endif
 
 #endif /* _VKMS_FORMATS_H_ */

-- 
2.47.0

