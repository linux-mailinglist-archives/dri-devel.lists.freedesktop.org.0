Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B02951676
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2383810E420;
	Wed, 14 Aug 2024 08:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Sd0rbp/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7345810E410
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:19:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BCA4C000C;
 Wed, 14 Aug 2024 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723623590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFpORCPNREBN6z592weC6FbCQDcy1ab/TlfzvnZajH8=;
 b=Sd0rbp/zVU3E5sdAO1ovMShFfeeQ/f76tcf2hly1/2sRQZOzuCyPTyNqIP09RHmjWMus0+
 WGT+PqQmdEL4a5PljmvRgHwb3aNbGbFyZ40ccxZM0V4OkI8CcOzXVy8wPDEPYNS3X2puzD
 KJvopmH5m7Zrb/nv3d3mOq2dNUX65zFNTPdIV1HhOk83hbaHIYmYzIlBVtM/RgOYh4JnJY
 pkN621pXFqQRuC6SUcdTcDICPqqPRY2ltqj6h7mSsTl4FL6Uh0rHXFJrQhmmBGnfeVdbSQ
 y/Bph0YI1Fa5KmcizmYE6scUbXLRzpTF7zve9oQCt7NRvHTJZnUr8Gzf7Cu//A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 10:19:37 +0200
Subject: [PATCH v2 4/8] drm/vkms: Add support for RGB565 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-new-color-formats-v2-4-8b3499cfe90e@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2973;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RBF+mOuEEb0DdX+OD7VGfrmSjVRcmOGK9r7zIRQVJGs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvGie0Uv+IgeM70/olFWS+q/JLIewBCr8JhF7F
 fA1uWNJiu6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxongAKCRAgrS7GWxAs
 4tfSD/9x3h1HuQWRGpzyh61DU+16EAsEYhot+E9HJIKo+J427Hy8DHd7wiE4zBwNiljVIouKJad
 4ak6RGZVl7+jHb/ZpelosF1Jn3gqUoPKT1yIBE+o8q0jcbgjlhuV/NJ43GVqxONWKdpFKeW77NB
 sF+mRK6hgoA+40yBup59ZrC1IXIjmIs8WG3e5+OfxTrLnSr4BJCh7Ur4Sy8IwC86L0neqD1rTDA
 284RN80ewGRMqv33FsCNenCNcyIBKLC/aPMkwI/2bdq51ul2vGhO1YZEC5UTQWBTIFnQyAM5TQJ
 u749opsVYoyy5hvrHmxuaw55rbpo9+RthzpniVm+FFr80pNvpZ1vHdpsHjpo4kIETFcX+oXpqmd
 OK22adqMKJUJdrVD9AaIqvd04wPUgq8mAP4/ysjXL+xBCh7n2F+kcQ0312zPlwXNn4McYY0kRWy
 ox5H96k1s0KGxeHjRg1jGe1XnnKzri2V1PlyRm7oqVoQdtlCNNvDB2ZfBi2z5N0N9UM75oMXyr4
 h8UGAtrFSNPXPREMQVGQdCsmMrj5iX5AInDovU69xaSSybIE8JRVpcSpNJsYg8FscBG87blzNsz
 pb4zTTjgHj/Peqb0mXCczAAVYMIWL5e52/LBtJ094WITOqwLsVjyj3fy8+ftHl24SKEgkIuBFB2
 EIOdZjVM0JNS9Ag==
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
index 691fd8275f14..76cefd301b4a 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -247,7 +247,7 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
 	return out_pixel;
 }
 
-static struct pixel_argb_u16 argb_u16_from_gray8(u16 gray)
+static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
 {
 	return argb_u16_from_u8888(255, gray, gray, gray);
 }
@@ -257,6 +257,26 @@ static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
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
@@ -445,6 +465,7 @@ READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0])
 READ_LINE_16161616(XBGR16161616_read_line, px, 0xFFFF, px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
+READ_LINE(BGR565_read_line, px, __le16, argb_u16_from_BGR565, px)
 
 READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
 
@@ -666,6 +687,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
2.44.2

