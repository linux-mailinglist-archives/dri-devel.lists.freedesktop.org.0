Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B609B8C776B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B21310ED06;
	Thu, 16 May 2024 13:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="I1LzdYmY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A316710E107
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:18:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 060E960010;
 Thu, 16 May 2024 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715865512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nA+RQr2o0RUIm9d018DCVym4lDDnhOksBWUi79w7y4=;
 b=I1LzdYmYzaRC0cv+59KZRCiIJ0g4Ar7BcQyMWkVGdp2/pUbzejOfQIfqbUn9QQJmLspuNL
 OCnEng3h32eM2H8Krx03mvoe7kRQqV30opv1wAdzOdY35N/xZt9Pu+Nvldj5qKuAPjxd2p
 VDA8LPW88HIa507xA8koASLl1krwLLiNUTbVS8k1X6u8/yg1P79dKd1h8DYcuDoqauR770
 9QD7hBA09KnsB8jypzJVI7WIEOP5t8KX2JGBWZXfCiSEZvmaKdSyczHriT1JkUsMCz7Xcc
 Fb+uT1lt1HpTxRYdARkpTPrMlRZ+HFdFwO+ueq0o6kIM3s/HXkJ6cs2fz1OYWw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:18:20 +0200
Subject: [PATCH 4/5] drm/vkms: Add support for RGB565 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-b4-new-color-formats-v1-4-74cf9fe07317@bootlin.com>
References: <20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com>
In-Reply-To: <20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2958;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=rUDBc7Fls6lB9g+/LJ7W6Vq5BjE+64XKjkh6cy3am8k=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRgefrJqPnNpEN07KqfPNMcxemb5nNOPRNgpHN
 I/EojP6AxmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYHnwAKCRAgrS7GWxAs
 4uJxEADYJS3QytMjXrQJWf4ZDKKIYti7sQB82/dWKm6lJySdBI9iJuvI9oea0MvkoDiZ3OT5tsu
 fjDRVo+4tB4i0ebimHN2ySUtoblF5Q45K1gMjrHHSHDa9uiQ1HPkOrmTBUccQPFNLgEQQYuOCtv
 G9HXw1mQPWCyJWlkdnEQB2oD2Dp26Kkvf7wuD1HFRWwzDg5V6hMW2SFhsUsMAUp60SUxkgdq3fD
 B2S1nvOTaoD5ZYjBS1uzMXqoLDnHdoSP8hWMujWCMXqaSJw5u6X4XyjlyXp49aAazBv8a3f6jXJ
 upbO99iYrW4ejd/GGccPvjXgHb7G3fQpO2x+09V3gLYocP8kpHkwwJwMfMkf6B3Uw4gvk07tyot
 8QmwRbD1n37J+1oIM0liM+hoPqvr3GqkJoeHqBDv4N5pn9A3wleBbUtnLmpBDI9i8s8lpiR4HSh
 p+OHJ0FgaGm+iTbcUmf87zYeXJFzQn+2ltEVgyBNMYDmY4iy1UO2FcMbyu/X5EUFmkAGdYjrwTj
 hs0KsvRHXTR1KoUFjszxlJMppCHN3rm15BJ6wdakkOAK6o/V6nHenSd0sWvVfnCLoXO58UZICc+
 9hgaW7Ro/YcOMF5OKLnsQrgF/4iWvhImXz3hWL8OOAADZUVCrjJLn60JCNcg+0v91/D83pPWlLN
 wO0XWyZzAshUXDg==
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

The format RGB565 was already supported. Add the support for:
- BGR565

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_plane.c   |  1 +
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index e9cca5ae57bc..4d7af36aa28a 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -241,7 +241,7 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
 	return out_pixel;
 }
 
-static struct pixel_argb_u16 argb_u16_from_gray8(u16 gray)
+static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
 {
 	return argb_u16_from_u8888(255, gray, gray, gray);
 }
@@ -251,6 +251,26 @@ static struct pixel_argb_u16 argb_u16_from_gray16(u16 gray)
 	return argb_u16_from_u16161616(255, gray, gray, gray);
 }
 
+static struct pixel_argb_u16 argb_u16_from_BGR565(const u16 *pixel)
+{
+	struct pixel_argb_u16 out_pixel;
+
+	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
+	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
+
+	u16 rgb_565 = le16_to_cpu(*pixel);
+	s64 fp_b = drm_int2fixp((rgb_565 >> 11) & 0x1f);
+	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
+	s64 fp_r = drm_int2fixp(rgb_565 & 0x1f);
+
+	out_pixel.a = (u16)0xffff;
+	out_pixel.b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
+	out_pixel.g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
+	out_pixel.r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
+
+	return out_pixel;
+}
+
 VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
 							   const struct conversion_matrix *matrix)
 {
@@ -458,6 +478,7 @@ READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0]);
 READ_LINE_16161616(XBGR16161616_read_line, px, 0xFFFF, px[0], px[1], px[2]);
 
 READ_LINE(RGB565_read_line, px, u16, argb_u16_from_RGB565, px)
+READ_LINE(BGR565_read_line, px, u16, argb_u16_from_BGR565, px)
 
 READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
 
@@ -690,6 +711,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XBGR16161616_read_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_read_line;
+	case DRM_FORMAT_BGR565:
+		return &BGR565_read_line;
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV24:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 1e971c7760d9..a243a706459f 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -26,6 +26,7 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_ABGR16161616,
 	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV16,
 	DRM_FORMAT_NV24,

-- 
2.43.2

