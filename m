Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC3D94D5C4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 19:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CD210E9C3;
	Fri,  9 Aug 2024 17:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hRKlBKdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB11810E9C7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 17:55:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A783FF805;
 Fri,  9 Aug 2024 17:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723226116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7cK6/EMSnQv5H5EPJGct+dZUJWUlV/+VviEVP5kYMo=;
 b=hRKlBKddLryWyCQMOLIVQ38DQFkfFWGUFHIovwkeZ4Ebf5Yj6ld6w6QlmPux+WB8rpwjI3
 GiCNykjJnruYSgmW8kxl5hW47h5U2qOj2J2T0H6/CLh1GIbfXyyQim47gwmJNBl/RiTKZP
 VV8q4WXoboQgnbyjB+egI8Gpf0gMoD2r7Uchv2+APnL5oHCsm7vajxrU3IhHeZQUBYqjpf
 sxMCCu6EWnyFvLejwSVN+HRz8O1IskV83QFeRH4DEL+h1L1lIBx3ts2+InWDvfIM4RwjaQ
 mwPFyBP/JivTAlK308gwVqxzUmdDs4yb1QNwvTt28XlVkhPCnVLKIQr734cuIA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 09 Aug 2024 19:54:57 +0200
Subject: [PATCH v10 16/16] drm/vkms: Add support for DRM_FORMAT_R*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-yuv-v10-16-1a7c764166f7@bootlin.com>
References: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
In-Reply-To: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6383;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=nJwL5W/k2NV6zI2WnACdvNfVGHGjviwtWucFQOpDrs8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmtlfrreWG+QPHscGswcTe+0OZ/MGL+iCPdfvq7
 tQtLSly9NWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrZX6wAKCRAgrS7GWxAs
 4m/TEACfwYAmNe1seOA8UdAPhZqZqSQ73IrrXWbggxc3QATJe6d3nKJAyoftENoTVY+hu12c7Ex
 ZG0Op/ZFgLUp7m0gBkE3lC6bgNJk9P5wS36fCtNjFmg5Kdle1yfwDoILsjfWwZGfSxfwNFeJOv1
 y/sSYMH2HVGYSb63Y9AnvXlHoYPE+BK+537H9hlCrbtcns80yjnpu2gNWh1lwDYJX7Q7A6NidxR
 ffJd9vMt2t31t+MHrb27KAbq//Ee/JEzvCV6oyNML9Me5jGVdRvP0T/+iYAAICVEyt4IMggVfgz
 sFLS5OymZOTrzB4BVV+7lckCwp1PU5FxjJOhST/br2/IGLHXxbhR/vEMYaBJYDXJEWUhBzKRMX5
 yE/Mb7kzZHqH1N5FQfeprb9OhPLD15M5DSygOuNgO/X/rOGcKMRLGeYMC5+wskXbEy94NorNjw1
 TQSvdL5SMXaLlMu4k3zK+TzR3iwcfi3EcPuJYy3JOzjoldvavZ1O7Hbe190eqi8howSA5PHiox3
 7sfeF8S6i/eIpoLx9EBRJVsqz8vQPnwDRg9bbrY5oRfCK50ZPZeN0JJmbSe1gNr9SoJZxToColB
 0qJxSCjcWGdgjtg7+JgzmIFoxpWCnJrcCgtFUc3lnZaOdL4SHjAc7y/ohd3esuFYq3fwtm/X/mh
 x2m4QujNH+pmE8w==
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

This add the support for:
- R1/R2/R4/R8

R1 format was tested with [1] and [2].

[1]: https://lore.kernel.org/r/20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com
[2]: https://lore.kernel.org/igt-dev/20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com/

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 110 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_plane.c   |   4 ++
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 6cc0834ee218..3065086a7ea4 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -247,6 +247,16 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
 	return out_pixel;
 }
 
+static struct pixel_argb_u16 argb_u16_from_gray8(u16 gray)
+{
+	return argb_u16_from_u8888(255, gray, gray, gray);
+}
+
+static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
+{
+	return argb_u16_from_u16161616(0xFFFF, gray, gray, gray);
+}
+
 VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
 							    const struct conversion_matrix *matrix)
 {
@@ -284,7 +294,7 @@ EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
  * The following functions are read_line function for each pixel format supported by VKMS.
  *
  * They read a line starting at the point @x_start,@y_start following the @direction. The result
- * is stored in @out_pixel and in the format ARGB16161616.
+ * is stored in @out_pixel and in a 64 bits format, see struct pixel_argb_u16.
  *
  * These functions are very repetitive, but the innermost pixel loops must be kept inside these
  * functions for performance reasons. Some benchmarking was done in [1] where having the innermost
@@ -293,6 +303,96 @@ EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
  * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
  */
 
+static void Rx_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	int bits_per_pixel = drm_format_info_bpp(plane->frame_info->fb->format, 0);
+	u8 *src_pixels;
+	int rem_x, rem_y;
+
+	WARN_ONCE(drm_format_info_block_height(plane->frame_info->fb->format, 0) != 1,
+		  "%s() only support formats with block_h == 1", __func__);
+
+	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels, &rem_x, &rem_y);
+	int bit_offset = (8 - bits_per_pixel) - rem_x * bits_per_pixel;
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+	int mask = (0x1 << bits_per_pixel) - 1;
+	int lum_per_level = 0xFFFF / mask;
+
+	if (direction == READ_LEFT_TO_RIGHT || direction == READ_RIGHT_TO_LEFT) {
+		int restart_bit_offset;
+		int step_bit_offset;
+
+		if (direction == READ_LEFT_TO_RIGHT) {
+			restart_bit_offset = 8 - bits_per_pixel;
+			step_bit_offset = -bits_per_pixel;
+		} else {
+			restart_bit_offset = 0;
+			step_bit_offset = bits_per_pixel;
+		}
+
+		while (out_pixel < end) {
+			u8 val = ((*src_pixels) >> bit_offset) & mask;
+
+			*out_pixel = argb_u16_from_grayu16((int)val * lum_per_level);
+
+			bit_offset += step_bit_offset;
+			if (bit_offset < 0 || 8 <= bit_offset) {
+				bit_offset = restart_bit_offset;
+				src_pixels += step;
+			}
+			out_pixel += 1;
+		}
+	} else if (direction == READ_TOP_TO_BOTTOM || direction == READ_BOTTOM_TO_TOP) {
+		while (out_pixel < end) {
+			u8 val = (*src_pixels >> bit_offset) & mask;
+			*out_pixel = argb_u16_from_grayu16((int)val * lum_per_level);
+			src_pixels += step;
+			out_pixel += 1;
+		}
+	}
+}
+
+static void R1_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel);
+}
+
+static void R2_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel);
+}
+
+static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel);
+}
+
+static void R8_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+
+	while (out_pixel < end) {
+		*out_pixel = argb_u16_from_gray8(*src_pixels);
+		src_pixels += step;
+		out_pixel += 1;
+	}
+}
+
 static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
 			       enum pixel_read_direction direction, int count,
 			       struct pixel_argb_u16 out_pixel[])
@@ -604,6 +704,14 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	case DRM_FORMAT_YVU422:
 	case DRM_FORMAT_YVU444:
 		return &planar_yuv_read_line;
+	case DRM_FORMAT_R1:
+		return &R1_read_line;
+	case DRM_FORMAT_R2:
+		return &R2_read_line;
+	case DRM_FORMAT_R4:
+		return &R4_read_line;
+	case DRM_FORMAT_R8:
+		return &R8_read_line;
 	default:
 		/*
 		 * This is a bug in vkms_plane_atomic_check(). All the supported
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 8f764a108b00..67f891e7ac58 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -30,6 +30,10 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_YVU420,
 	DRM_FORMAT_YVU422,
 	DRM_FORMAT_YVU444,
+	DRM_FORMAT_R1,
+	DRM_FORMAT_R2,
+	DRM_FORMAT_R4,
+	DRM_FORMAT_R8,
 };
 
 static struct drm_plane_state *

-- 
2.44.2

