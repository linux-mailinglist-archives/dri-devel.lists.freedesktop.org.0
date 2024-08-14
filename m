Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEF9951677
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A44710E422;
	Wed, 14 Aug 2024 08:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L9iGdTF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED98B10E422
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:19:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84ED9C000B;
 Wed, 14 Aug 2024 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723623592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=op2K3KJoi4MhR/F0QxDi5rBLi6a6hU0wv7s1ktIoY50=;
 b=L9iGdTF34KOZdzBG1/ai19BeeUaiivpb9TfcXhXksIt4+HndamrKZX4LR/BzRljldYCByP
 1qK1L5fy5n0zpOK/yOJmSLv2xUkgcxo5hLGDQYafmAXAtxH8asXbggIdlrbhRDDPzbRbGO
 5hBcLu4hkBRWIvECnb8PiftwVzBbuLWZoY/Tz7mBTmEBYBXO7THpXqS3r/7tCvTk+gaCm9
 /7LQI5DSNNMk9xV+1n4a75vatvPy2iHZhKlVb9omPXZClQUcLjvV57PwcpdcezWleY2Hek
 jTPy0v6xz5T52HfCu8KazzgxXzV0sqPRemsamZ+bnNvgxUduiLtWY0ZO+jDm+g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 10:19:39 +0200
Subject: [PATCH v2 6/8] drm/vkms: Change YUV helpers to support u16 inputs
 for conversion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-new-color-formats-v2-6-8b3499cfe90e@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4712;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ha2LReeTda/VFQ8tThojZzBeyjNxSlOLJhSv50oIqfY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvGifkl3EcsSGMWWw0rL0DS9JEhtBFSZQVitS9
 aNihFUnPw6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxonwAKCRAgrS7GWxAs
 4mtDEACBrb3u6N4EDMd2GHsp9+dp9EUu6PBQiuxKyvc3NS6LDtXIcrA2W9S6YjAj1XsqZBXmhMV
 55/lZnRYFs3SBXKZLkuMKqE0th4uDj8xp1goZPNsrBnYnS2Qm4NeqnmQGOcZfdYCX+GxxDYij6L
 IcCHLjdJwOKCTwhqIMz88NQS306FmlyQzU+n8XFa9Zgw4pAYY8LSfv6q5xj7Qr/F70dHIoaIwVv
 glOVF8OdoJ59UJqqIuV+N1tJA2GXohYHTeeHoRFU6Upoo7cp9DuooUSvIl3JSqxSLcwIab9AxIa
 VhftYaxyGRVXaaNA3+o4tnckY9v/RsER6xfGyzWPV0TOtEE/gviLTcPctgFQ9G0eAhLjDHN9Rpo
 vKGUtTo3ZWqGo7Pfwe1aBX5e6OyF0BDPco4wtKhk9sJdD+/MEjkGIJYnYcnXKC093+zXHou0LaI
 FGy7C++n4ePGbijz1skKktjxS5x14OO7pN8SA/AMmwqXHLb663xNKPsb5dD0d7QKFDKC/PRlNpT
 g7seJbb9KGTJoWFad7M0Z9yLueQoPhPJWK1UMvPtyYt3ddqvEp016Kc8RwDlKqkKENGj+EGgSpi
 3YuYEu3fQKcp92ILfXQP0wJRZWLeumJxU5OFXDEkoKabmaiLfO0etm4KknzsG8fX8/wEARIuLF0
 By3BoeRf3V6HL0Q==
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
 drivers/gpu/drm/vkms/vkms_formats.c           | 22 ++++++++++++----------
 drivers/gpu/drm/vkms/vkms_formats.h           |  4 ++--
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
index 351409897ca3..e3a77954e6dc 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -188,7 +188,8 @@ static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
 		get_conversion_matrix_to_argb_u16
 			(DRM_FORMAT_NV12, param->encoding, param->range, &matrix);
 
-		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, &matrix);
+		argb = argb_u16_from_yuv161616(&matrix, color->yuv.y * 257, color->yuv.u * 257,
+					       color->yuv.v * 257);
 
 		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.a, color->argb.a), 257,
 				    "On the A channel of the color %s expected 0x%04x, got 0x%04x",
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index b7c378552340..71aae2397c5f 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -277,16 +277,17 @@ static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
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
@@ -308,7 +309,7 @@ VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1,
 
 	return argb_u16_from_u16161616(0xffff, r, g, b);
 }
-EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
+EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv161616);
 
 /**
  * READ_LINE() - Generic generator for a read_line function which can be used for format with one
@@ -503,8 +504,8 @@ static void semi_planar_yuv_read_line(const struct vkms_plane_state *plane, int
 	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
 
 	for (int i = 0; i < count; i++) {
-		*out_pixel = argb_u16_from_yuv888(y_plane[0], uv_plane[0], uv_plane[1],
-						  conversion_matrix);
+		*out_pixel = argb_u16_from_yuv161616(conversion_matrix, y_plane[0] * 257,
+						     uv_plane[0] * 257, uv_plane[1] * 257);
 		out_pixel += 1;
 		y_plane += step_y;
 		if ((i + subsampling_offset + 1) % subsampling == 0)
@@ -548,8 +549,9 @@ static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_sta
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
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index b4fe62ab9c65..eeb208cdd6b1 100644
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
2.44.2

