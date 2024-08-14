Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E799951673
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BEA10E080;
	Wed, 14 Aug 2024 08:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PKRFQmdQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2508310E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:19:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A23DDC0009;
 Wed, 14 Aug 2024 08:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723623586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bu6viIhSnWEgk66jXAPqJNV5YI/xtHGtsXjAa8vmFoY=;
 b=PKRFQmdQqPk5Sa8ROniRn1YIFSYcSpDb0BUM71GUHjXjTlau2MS6Eru9r7MW4Ca0fZnEoC
 7C2/bZO59SjkTPXIol30Lzfz3+2BFpIY2G2afNZ4UG/R1bPV0CqJPOdQduSjQZpJVQnum4
 BES7KTmVC2cyR8c62V/RemxbKhjHVGeXRnUxUEx67dD52cydJWqEdksDy6czON2O3i5plc
 WyyUpSgsJJrF/l5gicoJ0+GCquZnX50if3pzVvsJir36a7ZZ0+swSaS7UixaUlQ9fi+8P9
 5GO5vKRZTlaJWqthmcPr0FXp0cjneTazykaQqgyOD8eDR18zn7GJw1rUvJeKfw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 10:19:34 +0200
Subject: [PATCH v2 1/8] drm/vkms: Create helpers macro to avoid code
 duplication in format callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-new-color-formats-v2-1-8b3499cfe90e@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7762;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=61wrT+opDbJNU/QfX9tV7dco/mpoqSN98WVUgQF83xs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvGiewd7aiG/MsG8j8TbEvGKXALbY0rBr8W0C0
 PK6KpqqXHSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxongAKCRAgrS7GWxAs
 4jI0D/9M8Ia0bPO1onu5fapA0CKsoSdQZCLNbZoEqSMTtHVAKPabrNPKtv1r3TxKdVsOpA8TWqj
 +LdBIDe+R1eJMMwM0s+VeGcv/1owgdVPFe8BfFFWoGLNoC9rtfMnEXi+Msv/n9wqXKPKwKdehF/
 SjxePici57dWhvqEONYugJc11go20GVvn031cTykKUsfHk7t2Nnr+qMfruKiHCirAPuQx/bcMSq
 YZc8SHBkAP+8/6Z+wRQPCgNcNf7m3BeXfi3gpmZS07ZBvAEImUvJoDVhK9upgbPup/Ym5EZ3WaB
 KI5Jr4oHUbGD3b1imCoh3Yt6vqrfoaY1CVEK3dJQpSMrwjYzL/vvSVYcDqTIJ9IoFZhjq1RNOtb
 nKVXymkGVhgN8GCz5JtYisfeIzXX0xB/WGRAehwi9k+oNr2VW4aCzmelWvlU5grEXt+TML57wgv
 CEpuSH0X617AKCjYE2tamRVBvp1S4EfFrlqmASOv4cj0m/2+c07wm7SH6QIA7+2k6f293zinxE5
 xtPl4X4eAJWZ5n8416W3fo3dqeEdvN/HktqH2F1UA1pB2w926H5dRHVQzne6Ks5mDvm7KyU1i/N
 Mzuv3JM4W4exTnDgxvL3rqWBKOD4Zom1TSxMD582PxFL/xhXNn9F6aP42ljl8CtARfGxT+M4gyU
 DxSGxZenJ4kjqcg==
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
some format. The generic READ_LINE macro generate all the required
boilerplate to process a line.

Two overrides of this macro have been added to avoid duplication of
the same arguments every time.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 163 +++++++++++++-----------------------
 1 file changed, 58 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 3065086a7ea4..a03e07874b9f 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -290,6 +290,58 @@ VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1,
 }
 EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
 
+/**
+ * READ_LINE() - Generic generator for a read_line function which can be used for format with one
+ * plane and a block_h == block_w == 1.
+ *
+ * @function_name: Function name to generate
+ * @pixel_name: temporary pixel name used in the @__VA_ARGS__ parameters
+ * @pixel_type: Used to specify the type you want to cast the pixel pointer
+ * @callback: Callback to call for each pixels. This fonction should take @__VA_ARGS__ as parameter
+ *            and return a pixel_argb_u16
+ * @__VA_ARGS__: Argument to pass inside the callback. You can use @pixel_name to access current
+ *  pixel.
+ */
+#define READ_LINE(function_name, pixel_name, pixel_type, callback, ...)				\
+static void function_name(const struct vkms_plane_state *plane, int x_start,			\
+			      int y_start, enum pixel_read_direction direction, int count,	\
+			      struct pixel_argb_u16 out_pixel[])				\
+{												\
+	struct pixel_argb_u16 *end = out_pixel + count;						\
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);			\
+	u8 *src_pixels;										\
+												\
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);		\
+												\
+	while (out_pixel < end) {								\
+		pixel_type *(pixel_name) = (pixel_type *)src_pixels;				\
+		*out_pixel = (callback)(__VA_ARGS__);						\
+		out_pixel += 1;									\
+		src_pixels += step;								\
+	}											\
+}
+
+/**
+ * READ_LINE_ARGB8888() - Generic generator for ARGB8888 formats.
+ * The pixel type used is u8, so pixel_name[0]..pixel_name[n] are the n components of the pixel.
+ *
+ * @function_name: Function name to generate
+ * @pixel_name: temporary pixel to use in @a, @r, @g and @b parameters
+ * @a, @r, @g, @b: value of each channel
+ */
+#define READ_LINE_ARGB8888(function_name, pixel_name, a, r, g, b) \
+	READ_LINE(function_name, pixel_name, u8, argb_u16_from_u8888, a, r, g, b)
+/**
+ * READ_LINE_ARGB16161616() - Generic generator for ARGB16161616 formats.
+ * The pixel type used is u8, so pixel_name[0]..pixel_name[n] are the n components of the pixel.
+ *
+ * @function_name: Function name to generate
+ * @pixel_name: temporary pixel to use in @a, @r, @g and @b parameters
+ * @a, @r, @g, @b: value of each channel
+ */
+#define READ_LINE_16161616(function_name, pixel_name, a, r, g, b) \
+	READ_LINE(function_name, pixel_name, u16, argb_u16_from_u16161616, a, r, g, b)
+
 /*
  * The following functions are read_line function for each pixel format supported by VKMS.
  *
@@ -376,118 +428,19 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
 	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel);
 }
 
-static void R8_read_line(const struct vkms_plane_state *plane, int x_start,
-			 int y_start, enum pixel_read_direction direction, int count,
-			 struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
-
-	while (out_pixel < end) {
-		*out_pixel = argb_u16_from_gray8(*src_pixels);
-		src_pixels += step;
-		out_pixel += 1;
-	}
-}
-
-static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
-			       enum pixel_read_direction direction, int count,
-			       struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
-
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
-
-	while (out_pixel < end) {
-		u8 *px = (u8 *)src_pixels;
-		*out_pixel = argb_u16_from_u8888(px[3], px[2], px[1], px[0]);
-		out_pixel += 1;
-		src_pixels += step;
-	}
-}
-
-static void XRGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
-			       enum pixel_read_direction direction, int count,
-			       struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
-
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
-
-	while (out_pixel < end) {
-		u8 *px = (u8 *)src_pixels;
-		*out_pixel = argb_u16_from_u8888(255, px[2], px[1], px[0]);
-		out_pixel += 1;
-		src_pixels += step;
-	}
-}
-
-static void ARGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
-				   int y_start, enum pixel_read_direction direction, int count,
-				   struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
-
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
-
-	while (out_pixel < end) {
-		u16 *px = (u16 *)src_pixels;
-		*out_pixel = argb_u16_from_u16161616(px[3], px[2], px[1], px[0]);
-		out_pixel += 1;
-		src_pixels += step;
-	}
-}
-
-static void XRGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
-				   int y_start, enum pixel_read_direction direction, int count,
-				   struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
 
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+READ_LINE_ARGB8888(XRGB8888_read_line, px, 255, px[2], px[1], px[0])
 
-	while (out_pixel < end) {
-		__le16 *px = (__le16 *)src_pixels;
-		*out_pixel = argb_u16_from_le16161616(cpu_to_le16(0xFFFF), px[2], px[1], px[0]);
-		out_pixel += 1;
-		src_pixels += step;
-	}
-}
+READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
 
-static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
-			     int y_start, enum pixel_read_direction direction, int count,
-			     struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
 
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0]);
+READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0]);
 
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
 
-	while (out_pixel < end) {
-		__le16 *px = (__le16 *)src_pixels;
+READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
 
-		*out_pixel = argb_u16_from_RGB565(px);
-		out_pixel += 1;
-		src_pixels += step;
-	}
-}
 
 /*
  * This callback can be used for YUV formats where U and V values are

-- 
2.44.2

