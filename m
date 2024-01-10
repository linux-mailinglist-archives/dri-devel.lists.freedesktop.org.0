Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC0829F85
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 18:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848A610E7CA;
	Wed, 10 Jan 2024 17:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E683910E7B7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 17:44:36 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4T9FYJ1DMXz9xHT;
 Wed, 10 Jan 2024 17:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1704908676; bh=iv4fWincLtwDS1w64C/140HnQ4UstOFRQB6gHYoMHDE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sl5x5gCgO0vPefrSSAm7Hc2dpk54FdFAKB8cyblWIjEkNjQyAI7FzpeuN/KzpBzgv
 NysNpRIRCQmxLYO4/qsBz8PLAauqzWp/HMddTLgNxBZEocqyNlatF7F6qUdQrtC69u
 Kxj7agRaOldERWxIPPbImZB8O3xHQThEypvTCQno=
X-Riseup-User-ID: 95B2855DD87EB756EFEEE77569C3D4C451AA113B0435789353F1D27E0C14D191
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4T9FYD08sXzJp9q;
 Wed, 10 Jan 2024 17:44:31 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Wed, 10 Jan 2024 14:44:05 -0300
Subject: [PATCH v2 5/7] drm/vkms: Add YUV support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240110-vkms-yuv-v2-5-952fcaa5a193@riseup.net>
References: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
In-Reply-To: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Arthur Grillo <arthurgrillo@riseup.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
---
 drivers/gpu/drm/vkms/vkms_formats.c | 147 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h |   4 +
 drivers/gpu/drm/vkms/vkms_plane.c   |  14 +++-
 3 files changed, 164 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 098ed16f2104..7c1a0ca322d9 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -119,6 +119,137 @@ static void RGB565_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel
 	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
 }
 
+static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r, u8 *g, u8 *b)
+{
+	s32 y_16, cb_16, cr_16;
+	s32 r_16, g_16, b_16;
+
+	y_16 =  y - y_offset;
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
+		{256,   0,  359},
+		{256, -88, -183},
+		{256, 454,    0},
+	};
+	static const s16 bt601[3][3] = {
+		{298,    0,  409},
+		{298, -100, -208},
+		{298,  516,    0},
+	};
+	static const s16 rec709_full[3][3] = {
+		{256,   0,  408},
+		{256, -48, -120},
+		{256, 476,   0 },
+	};
+	static const s16 rec709[3][3] = {
+		{298,   0,  459},
+		{298, -55, -136},
+		{298, 541,    0},
+	};
+	static const s16 bt2020_full[3][3] = {
+		{256,   0,  377},
+		{256, -42, -146},
+		{256, 482,    0},
+	};
+	static const s16 bt2020[3][3] = {
+		{298,   0,  430},
+		{298, -48, -167},
+		{298, 548,    0},
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
+static void semi_planar_yuv_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
+					enum drm_color_encoding encoding,
+					enum drm_color_range range)
+{
+	struct pixel_yuv_u8 yuv_u8;
+
+	yuv_u8.y = src_pixels[0][0];
+	yuv_u8.u = src_pixels[1][0];
+	yuv_u8.v = src_pixels[1][1];
+
+	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
+}
+
+static void semi_planar_yvu_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
+					enum drm_color_encoding encoding,
+					enum drm_color_range range)
+{
+	struct pixel_yuv_u8 yuv_u8;
+
+	yuv_u8.y = src_pixels[0][0];
+	yuv_u8.v = src_pixels[1][0];
+	yuv_u8.u = src_pixels[1][1];
+
+	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
+}
+
+static void planar_yuv_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
+				   enum drm_color_encoding encoding, enum drm_color_range range)
+{
+	struct pixel_yuv_u8 yuv_u8;
+
+	yuv_u8.y = src_pixels[0][0];
+	yuv_u8.u = src_pixels[1][0];
+	yuv_u8.v = src_pixels[2][0];
+
+	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
+}
+
+static void planar_yvu_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
+				   enum drm_color_encoding encoding, enum drm_color_range range)
+{
+	struct pixel_yuv_u8 yuv_u8;
+
+	yuv_u8.y = src_pixels[0][0];
+	yuv_u8.v = src_pixels[1][0];
+	yuv_u8.u = src_pixels[2][0];
+
+	yuv_u8_to_argb_u16(out_pixel, &yuv_u8, encoding, range);
+}
+
 /**
  * vkms_compose_row - compose a single row of a plane
  * @stage_buffer: output line with the composed pixels
@@ -267,6 +398,22 @@ void *get_pixel_conversion_function(u32 format)
 		return &XRGB16161616_to_argb_u16;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_to_argb_u16;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV24:
+		return &semi_planar_yuv_to_argb_u16;
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV42:
+		return &semi_planar_yvu_to_argb_u16;
+	case DRM_FORMAT_YUV420:
+	case DRM_FORMAT_YUV422:
+	case DRM_FORMAT_YUV444:
+		return &planar_yuv_to_argb_u16;
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
+		return &planar_yvu_to_argb_u16;
 	default:
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index cf59c2ed8e9a..a8b2f92bdcb5 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -9,4 +9,8 @@ void *get_pixel_conversion_function(u32 format);
 
 void *get_pixel_write_function(u32 format);
 
+struct pixel_yuv_u8 {
+	u8 y, u, v;
+};
+
 #endif /* _VKMS_FORMATS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e87c80575b7d..932736fc3ee9 100644
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

