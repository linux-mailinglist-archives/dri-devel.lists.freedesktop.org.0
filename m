Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFA59933B9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2957010E3E1;
	Mon,  7 Oct 2024 16:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="inzug6K7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A8610E221
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:46:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E91540008;
 Mon,  7 Oct 2024 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728319586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TshjFsEcmwoQXvk8So0jN9vV1qz5TvwoCPRDKomZ+Ac=;
 b=inzug6K7nln/+wo6fmTC/tG6iHM6RjDLpIZfqQNfmE26fJZRbEUXveZtkR4w49P9G87BzA
 6EoTHQMy42LFZpgbCSpxNzG7jMICDvGyVEbcMBBQaQkxdN6AqfvICpC+4Dr45DxImqO2pq
 aUQQ6mqeiBLtVp7cJLZ3ZgOk9bpN/LqNtElQELmMldZVycCi2e8DLv3yWvwtO/FO7138nr
 SXHUHaS5OH6CSWX7ysAEe022LMZpZvgP0BllZEllqlx2BqwrDqPm8PtsPK2GPO5HFk/9ag
 BQ/+JonMYMrFtOykl3ef8CfB/wqvBM1V7hdzP3bZaEfSij8uS0r6bLpaB5zfsw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 07 Oct 2024 18:46:09 +0200
Subject: [PATCH RESEND v2 4/8] drm/vkms: Add support for RGB565 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-b4-new-color-formats-v2-4-d47da50d4674@bootlin.com>
References: <20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com>
In-Reply-To: <20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2973;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tjCECeaRUNgLtjoCubWJYzz5yqt33aSKr7lRkrSGE3Q=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnBBBbJr4y73v18yqNBvJ5HKR+bm1UF3UwLE4Xg
 6zAJDQYza+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwQQWwAKCRAgrS7GWxAs
 4iBgD/9U6mvHY83R1kx5F5efuprOX+EwzYe3Y9i+m2OVxlpZFUON4AN4eiAAMoGe0zkI6bVE+Od
 tV/gbvXAIe/9zsyqYhwnmicpTKdlt+dlnC13jpSzl6yzYIFWpze7+4umQEduUhIGraKF6QvlCww
 J6GT4sOGGxYBzX8VOa48HfT4XxNBwg95oKszp9vkR2Pbr0GjDdlrvaUUmsNQ8LZ5klh93pPBuGb
 +LK7DxboP0C/BJgO3WI9d+j+a+eXLoK/MBvMRtRUZP4tao4P+bdjKJR32BGLkgR4o8+eXdJsyZs
 kFDkfkftTmIw5l6wsRC8WRwJ78nGVnadQfyqGRaKCPDYSYrrGPYs3s34no8VJlDWZ3fY5O95tAl
 lbL/CRh6m4K/4d1t/vWOpq7t7ArlaHdy/6iVRFSIfUebeJlZuf/PKSgxB57p+jAvz9SfpJlehRs
 6BYW3/faQ4/6+KEUMvFzwUpJcMhhMByzeqVNkcWwUNguPsRVQnF05BveCA0XjmDvRc5+37/bzRg
 NkzYzpKaKL0X7C6KUEWHkgd0gEkb5CT+K3SvJ33AKAyrFetklPfXxUbD6ivwGAYGmUxgWBXnLOL
 kKrv5ubcQ5kF9XCw2u+k0Z4SmfvKh3k+HBVOqa2BYw57bBRD2rQTO7CaSwNEKQuhPL7zpMiwnGD
 e6JZOhQv4t7Kj4g==
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
index c03a481f5005..e34bea5da752 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -249,7 +249,7 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
 	return out_pixel;
 }
 
-static struct pixel_argb_u16 argb_u16_from_gray8(u16 gray)
+static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
 {
 	return argb_u16_from_u8888(255, gray, gray, gray);
 }
@@ -259,6 +259,26 @@ static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
 	return argb_u16_from_u16161616(0xFFFF, gray, gray, gray);
 }
 
+static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
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
@@ -447,6 +467,7 @@ READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0])
 READ_LINE_16161616(XBGR16161616_read_line, px, 0xFFFF, px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
+READ_LINE(BGR565_read_line, px, __le16, argb_u16_from_BGR565, px)
 
 READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
 
@@ -668,6 +689,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
2.46.2

