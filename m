Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C89D6232
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C9E10EC05;
	Fri, 22 Nov 2024 16:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Pg/9AsI3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD02E10EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:25:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C611E0008;
 Fri, 22 Nov 2024 16:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+cxTF9KCJO78YUV+0ZHhBWyFhLzGz4nnDy5LMx5b6s=;
 b=Pg/9AsI3WIp0tF98BPvN4L7upd3O+X7DoubntwCwOmpcDVM3clHX2iM4mZd/DUSAPcbV34
 3jmgilU3DnEyabD4NGHdcS1BMxXb/nikqLpRtC69J7HoDO8wt3OWlj6YOD4vV6cd/Kx7Ne
 R9Hnvbht5CvLs6vbz5OUBYSBz5IF+Gt2Y67nCnvgOuiXmKF4teevHVNkdqAGejflxiByM0
 LMuBeaJLOGluwEuDpEi+Nb8d29Nf6EPKxp+m0rIwy/m3hsFxe9TkLlEowaRwt0KMQ7SDWm
 4FMbvWHgPYV6WNUnvEaWpow6O5JskjqNRUjo2w9ssMdQFVwpSSFftwDujindLg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:25:02 +0100
Subject: [PATCH v3 3/3] drm/vkms: Add support for XRGB2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-writeback_line_by_line-v3-3-085d5810f6e3@bootlin.com>
References: <20241122-writeback_line_by_line-v3-0-085d5810f6e3@bootlin.com>
In-Reply-To: <20241122-writeback_line_by_line-v3-0-085d5810f6e3@bootlin.com>
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
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=UoxOHiMTNSZuKXnSQuqgBjDi8qYlisedSJdTUWJ8t7k=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQLBeEgU50nN/Jsq9saN6JiwszSPcxZECtubdO
 WvEhQD9nfWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CwXgAKCRAgrS7GWxAs
 4jn3EAC/ztIduKbgnP6ONI9LAQmfqHBsju5aJlvQ5lZpWSIt764Ky2t9qSDaKRi541wJ3axPjux
 zYIeQ7oTx3cRLg30YK6IkaauV7RBlwzcp4ybJKk+1Z/GUVkV4RfL58NdEuDw0cQc4arRl0nQd3R
 wJPt6S78SnJsnJE95IZuzCQMmcI/zY83bIzmr2HUcb4+dFRczy6DVmh1VFMmj1RkaFsyyQ6UQID
 Vsy8RC79MorPCdClpC6GM3j6Yz4DFTNBtNWI5dngrQwpIkv7tOCqcrFanR/NpPVqCHIVVZhVvRn
 9+LyBDVcUIBpjb6LgXbCYfNZNve1QM9o1QkKPzD3NqFIE50j/IdHrOEs8gQvwQMHhBf+6WD0CCt
 9f4cmNUwknKKiaM4oBE9kXu+6CYloMZo/X/yiyqEZ/LCZ29JUSlrBl7dkeyeQyZtXgAiVvI7R0t
 Strpq15GjTATAMIZPYEZV1W9oTayNVmi8/uxYMDRXHTid2XJR/5w4DCGM7/voUl4/F2PPJlDFK3
 /QcDsGvgNoFYnuVjrAtrkwXdS1JJCpzGgOWRpvai8hJbHU0z4PXGN7C+FASJZTyTXuOVRE/zp7R
 iieQ6YFAwAjSSU2mtGJRbW3OmMB1zKMBhsKo5psIABS598mMVtgSAoZ655gT5iftTnY0giuViGu
 c1+RREemk3A5m2Q==
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

Thanks to the WRITE_LINE macro, adding the format XRGB210101010 is trivial.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 12 ++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 6a50a86291e50edab2058cf7d40c7efc8fcb4c12..2177310580ae19382d5fc2f095d6b49984033b61 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -656,6 +656,14 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
 	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
+static void argb_u16_to_XRGB2101010(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
+{
+	out_pixel[0] = (u8)(in_pixel->b & 0xFF);
+	out_pixel[1] = (u8)((in_pixel->b >> 8) & 0x03) | (u8)((in_pixel->g << 2) & 0xFC);
+	out_pixel[2] = (u8)((in_pixel->g >> 6) & 0x0F) | (u8)((in_pixel->r << 4) & 0xF0);
+	out_pixel[3] = (u8)((in_pixel->r >> 4) & 0x3F);
+}
+
 /**
  * WRITE_LINE() - Generic generator for write_line functions
  *
@@ -700,6 +708,8 @@ WRITE_LINE(XRGB16161616_write_line, argb_u16_to_XRGB16161616)
 
 WRITE_LINE(RGB565_write_line, argb_u16_to_RGB565)
 
+WRITE_LINE(XRGB2101010_write_line, argb_u16_to_XRGB2101010)
+
 /**
  * get_pixel_read_line_function() - Retrieve the correct read_line function for a specific
  * format. The returned pointer is NULL for unsupported pixel formats. The caller must ensure that
@@ -980,6 +990,8 @@ pixel_write_line_t get_pixel_write_line_function(u32 format)
 		return &XRGB16161616_write_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_write_line;
+	case DRM_FORMAT_XRGB2101010:
+		return &XRGB2101010_write_line;
 	default:
 		/*
 		 * This is a bug in vkms_writeback_atomic_check. All the supported
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 0b31628e1b532367cc79cd7432aa070661f41a57..f25468bf4cd7b9253528869576111e7a3745a42f 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -19,7 +19,8 @@ static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
-	DRM_FORMAT_RGB565
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB2101010,
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {

-- 
2.47.0

