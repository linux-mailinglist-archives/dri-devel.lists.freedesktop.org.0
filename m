Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A13DE87ADF4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD92E10F814;
	Wed, 13 Mar 2024 17:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mBg24YhG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322CA10F6C1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:45:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 125AC40005;
 Wed, 13 Mar 2024 17:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710351942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXogfLj07V/5NU7N2k8u25LuCo1tbpPLvfUwLakxFt8=;
 b=mBg24YhGBR7be0MtBRaL+gbZvRu8G2jc/m6rx8XACcY4qIPL61153Jvi2GVpxAURWIG/eH
 qhouCXV56ohvAUu0vKgenodoVtQ8S6e7XsbxXRhAEx4g014UVvpa2mSEqVoBRPe4mtxE6/
 lAz+zJiYagtudyMYNBPirj65O2YXe3BWwJ82dqt9TuPtXlOpdAcUjSAKYO6LkbkT7SGTQ6
 17cg+wCFHRddC77Gq8CVOjWYbg9UIOdPVdl1mFuGqA6zhHMIFWMJanswzHKOimsxL87CHG
 H1/0H5OKAlbWLxmMGjcJniPGqyKNZ2bkyD9vijxa83KRIdMDqTibdYRhUe4T7g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 13 Mar 2024 18:45:10 +0100
Subject: [PATCH v5 16/16] drm/vkms: Add support for DRM_FORMAT_R*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-yuv-v5-16-e610cbd03f52@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5760;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9rA67U9H0cUfYO3fgMPTyUG7C69zMCKQfaLOUG8oJ+A=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8eY1Q7D2/rrZJHb7RkqnZoULnQUuc8BbwKC3nJG4
 UflwfJqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHmNQAKCRAgrS7GWxAs4pLaEA
 C3FRWES+R2Y2GR1j8ZLeP/Ccwoq2SgYrj8b9O6eq/tWPy+6QhRXTg01U+5wcCjRFfZIeZUnLtu/XOQ
 2fUHPXOy4wEwIqKW3jtYsihl/9vBnCPKBfQ2vXFQYflzEI0iV6Tx8X1SjRgG9oIiF2KyqlO9n4cVBR
 rhpCFNnlos8ubrVQaG/xDvdrMVMjHn5rvwYSTW3ct6xbxue7Otzb7NLVdE2b/Awq22upazC7UPfHYr
 mvKopiLDw/hDJN8FCmOPqyCMyJ08IkKQk5CVt3qbo09I9e8Ns1cpLFnXdFPIkzK5EAdlM0NzQ/H0dB
 j31pBCx103LClrItIaHL9PK06ZRrIKgsso97Gym3FVyeQDmYNpQH1oIQDqTk45VlNvY4hshRP89wTQ
 sa3pl5c46krOY5VdiAKXwCDDik4oKAP1H6Dcgoq6+ZGmkMtQlcxioPKGms9N9/+/AhL7SujLVrbeOW
 eYYxglRYGtjmr0G2BtSrWIc6Efhqf/QTnvFpM1R1TfRAUrVnnnQkIlwg5G/LU0IRYbbLuhMoV1IaNG
 wMP10VNhe2FAZdzNPQCEcl5E6ET5uDj0BuqetAdWoOChHbkx/15KWUmP5pEuVVSDXvV9w3mRTYVHql
 Koc9fm2n0XA8GwAJbvvA3+ZM6+QYfXHQWKnFenwBXXrbtXxqbPgECVdUu68A==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 100 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c   |   6 ++-
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 863fc91d6d48..cbb2ec09564a 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -201,6 +201,11 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
 	return out_pixel;
 }
 
+static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
+{
+	return argb_u16_from_u8888(255, gray, gray, gray);
+}
+
 VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
 							    struct conversion_matrix *matrix)
 {
@@ -269,6 +274,89 @@ static void black_to_argb_u16(const struct vkms_plane_state *plane, int x_start,
 	}
 }
 
+static void Rx_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[], u8 bit_per_pixel, u8 lum_per_level)
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+	int rem_x, rem_y;
+
+	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels, &rem_x, &rem_y);
+	int bit_offset = (int)rem_x * bit_per_pixel;
+	int step = get_step_next_block(plane->frame_info->fb, direction, 0);
+	int mask = (0x1 << bit_per_pixel) - 1;
+
+	if (direction == READ_LEFT_TO_RIGHT || direction == READ_RIGHT_TO_LEFT) {
+		int restart_bit_offset = 0;
+		int step_bit_offset = bit_per_pixel;
+
+		if (direction == READ_RIGHT_TO_LEFT) {
+			restart_bit_offset = 8 - bit_per_pixel;
+			step_bit_offset = -bit_per_pixel;
+		}
+
+		while (out_pixel < end) {
+			u8 val = (*src_pixels & (mask << bit_offset)) >> bit_offset;
+
+			*out_pixel = argb_u16_from_gray8(val * lum_per_level);
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
+			u8 val = (*src_pixels & (mask << bit_offset)) >> bit_offset;
+			*out_pixel = argb_u16_from_gray8(val * lum_per_level);
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
+	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel, 1, 0xFF);
+}
+
+static void R2_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel, 2, 0x55);
+}
+
+static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel, 4, 0x11);
+}
+
+static void R8_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+	int rem_x, rem_y;
+	int step = get_step_next_block(plane->frame_info->fb, direction, 0);
+
+	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels, &rem_x, &rem_y);
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
@@ -582,6 +670,14 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
 		 * This is a bug in vkms_plane_atomic_check. All the supported
@@ -855,6 +951,10 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
 	case DRM_FORMAT_ARGB16161616:
 	case DRM_FORMAT_XRGB16161616:
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_R1:
+	case DRM_FORMAT_R2:
+	case DRM_FORMAT_R4:
+	case DRM_FORMAT_R8:
 		/*
 		 * Those formats are supported, but they don't need a conversion matrix. Return
 		 * a valid pointer to avoid kernel panic in case this matrix is used/checked
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e21cc92cf497..dc9d62acf350 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -29,7 +29,11 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_YUV444,
 	DRM_FORMAT_YVU420,
 	DRM_FORMAT_YVU422,
-	DRM_FORMAT_YVU444
+	DRM_FORMAT_YVU444,
+	DRM_FORMAT_R1,
+	DRM_FORMAT_R2,
+	DRM_FORMAT_R4,
+	DRM_FORMAT_R8
 };
 
 static struct drm_plane_state *

-- 
2.43.0

