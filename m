Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CEF845EA0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 18:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE65E10F293;
	Thu,  1 Feb 2024 17:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="o4NwI2W7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BA210F28C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 17:35:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 870B2C2D20
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 17:32:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E23B1C000E;
 Thu,  1 Feb 2024 17:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706808732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+aqzxTPAUjOzIodHPzxeC6qMPaNLGnJXnuBentQENE=;
 b=o4NwI2W71cP/524XS5XZd+wR6dynrd7bQz1YYFr85lIod0g7wnCEVb5vMnkvfFa4swnFa6
 Vga1gARfj5bJ4msfrmpsnust9S++UbhaLijPItbdzjUqSpZtYTV35ugOmwnlntXZ+9lfam
 uJftslgpJgj5g70KbaSDZfl4zGTDb5UP4ZWqeiSikA3jiebmiiYid8XZKd9QXevyUeoIVh
 fDmCB5CoGVdj+DFAUoIg4NVT0tnzc/n4iZ0Cz/xZCT9/jQ0UOrpkF+h7J+jAlBG8Pr+FkM
 CTYn91NG3ddpR1Y0LytRlrgqt5mb3zN/BNOlE23tdqRBEeojZORxMfxNUlKV8w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 01 Feb 2024 18:31:31 +0100
Subject: [PATCH 1/2] drm/vkms: Create a type to check a function pointer
 validity
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240201-yuv-v1-1-3ca376f27632@bootlin.com>
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
In-Reply-To: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, marcheu@google.com, seanpaul@google.com, 
 nicolejadeyee@google.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, thomas.petazzoni@bootlin.com, 
 miquel.raynal@bootlin.com
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3051;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=sy6XOjKiwgGLJghXuUCDDipZtMBjZVoiNnbEzSMpZZE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBlu9WZSdSr1fJmjjmgoEgdMXRsHSkHazV7I02+1oIU
 rS216fCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZbvVmQAKCRAgrS7GWxAs4lx2D/
 9gzX3KmylHrfqn4EdZ5irvLsNj7XKSNitiwqJLoic7NSfewZYK0ZTimaTYAqOJWUGC+1W7wWv8Y/Ah
 ujjMwiIwHX4ee+EmgvT5nFbtlNxwUbS/6YoGHh5z+JoAdCzZA3paPGkfLcRexE4W0KQFP23tsWD18F
 rb2Tlkqn5gHrT9PLwSV0VTiWfAi4KUv8fnc7CAyv/6BLnP5pRYHfOLo4TcTL/AztLn3hu4z27VytY3
 Jd7Glyf8Y7Pc4fU0arCO8WrcI0+KaLp7NsEBM9bXJKYYUOncvYxiCBwUT5bibv9fZVU3t/0BLrDRRa
 VWQUXmKd48TfrZD0F/vNEnvOllKijrIg6usH81Qcm2hgBvNbIfIHokg9IoMKJH14fwlOJfLdtrfNOS
 ICe8GWq8r1njHfduxaUaTFBAnCFRcybcq/5qQdz3l2mNU6LJipXQKUvl46AHT26eHjVIGk33y+vQJN
 0B7uU6HXys4vdlLpj8TsVHtlV8v7nPiG5N39l2NEjlWZ3nv1HAV6dWXA1SjJGMDUqQKftYSYaZMMGW
 qrCqrJ+E4SAR7w8If6pZXTaINxjhRvL+N+ZAPDIqwMH/OTxpJne5tJmwV3Jz/M6OyQ8kfw3k9k3Q56
 b7qTPQxXPPYvKBVUcO2rvl3An1HvyBXGzH+NZHQPifz2RqVzzSZv9aItU2pQ==
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

Add the pixel_read_t type to check function prototype in structures
and functions.
It avoids casting to (void *) and at the same occasion allows the
compiler to check the type properly.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h     | 17 +++++++++++++++--
 drivers/gpu/drm/vkms/vkms_formats.c |  4 ++--
 drivers/gpu/drm/vkms/vkms_formats.h |  2 +-
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 51349a0c32d8..cb20bab26cae 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -48,6 +48,20 @@ struct vkms_writeback_job {
 	void (*pixel_write)(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel);
 };
 
+/**
+ * typedef pixel_read_t - These functions are used to read the pixels in the source frame, convert
+ * them to argb16 and write them to out_pixel.
+ * It assumes that src_pixels point to a valid pixel (not a block, or a block of 1x1 pixel)
+ *
+ * @src_pixels: Source pointer to a pixel
+ * @out_pixel: Pointer where to write the pixel value
+ * @encoding: Color encoding to use (mainly used for YUV formats)
+ * @range: Color range to use (mainly used for YUV formats)
+ */
+typedef void (*pixel_read_t)(u8 **src_pixels, int y,
+			     struct pixel_argb_u16 *out_pixel, enum drm_color_encoding enconding,
+			     enum drm_color_range range);
+
 /**
  * vkms_plane_state - Driver specific plane state
  * @base: base plane state
@@ -56,8 +70,7 @@ struct vkms_writeback_job {
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
-	void (*pixel_read)(u8 **src_buffer, struct pixel_argb_u16 *out_pixel,
-			   enum drm_color_encoding enconding, enum drm_color_range range);
+	pixel_read_t pixel_read;
 };
 
 struct vkms_plane {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index e06bbd7c0a67..c6376db58d38 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -390,7 +390,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 		wb->pixel_write(dst_pixels, &in_pixels[x]);
 }
 
-void *get_pixel_conversion_function(u32 format)
+pixel_read_t get_pixel_conversion_function(u32 format)
 {
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
@@ -420,7 +420,7 @@ void *get_pixel_conversion_function(u32 format)
 	case DRM_FORMAT_YVU444:
 		return &planar_yvu_to_argb_u16;
 	default:
-		return NULL;
+		return (pixel_read_t)NULL;
 	}
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 0cf835292cec..04e31e126ab1 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -5,7 +5,7 @@
 
 #include "vkms_drv.h"
 
-void *get_pixel_conversion_function(u32 format);
+pixel_read_t get_pixel_conversion_function(u32 format);
 
 void *get_pixel_write_function(u32 format);
 

-- 
2.43.0

