Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D90E8C7778
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8505F10ED12;
	Thu, 16 May 2024 13:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pFhhYY56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B01810ED0F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:20:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 260321C000B;
 Thu, 16 May 2024 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715865612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMsWQ3QG6sIU4J0NROVXHEWz9Bkv1PYe3fq1YFNuAeM=;
 b=pFhhYY561PU6uRcNspH+5xwkPAiFWwEKtKebOUoippnGl26wmUDIblBRXwwjlO2fxlJjx1
 QsWlOxMqEW4+5D82yvka0oSVBfxwmWiBiPEw6ph0srkGUPwBc2G5wI87hEaD98P9t658cB
 EDAPmMrnG6VVL24bDg0yH0lV5XIp7G3QAvEDvBytFTKUcT98+Fah8cTkH7wxNbySwNOYC/
 IkXcw8bTveZXL2qWnQ8iZQ4KKx1c1gvueJ2hfrzRO0Z3UXjFu1QdEooTVxePerzLnInoHo
 I3ePwzigmFdti2YjF8mHMKRfvqUaTPld9RxWsulvNQh4t6nF8kkyCtM9wq414Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:20:06 +0200
Subject: [PATCH 2/3] drm/vkms: Add a macro for write_line functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-writeback_line_by_line-v1-2-7b2e3bf9f1c9@bootlin.com>
References: <20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com>
In-Reply-To: <20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5335;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=pfTkoBgjlZV1mUXh+KZ9TwNdpRxl8tkWgq6yTcOn4d8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRggHcGMuzS6tCLTSpG9oRNAAXh2NiM6anlmyy
 3JGkjeQOk2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYIBwAKCRAgrS7GWxAs
 4oqXEACOnVN6dt8GqqGYL2tCiYkggjEU+ZSmObqSp3LieJm94ACkA84K8z+KeO/Xt+MDSg428dG
 UxSyjdHPzppi1/zIa7larCQxI0u4mE5b5mvBELyFM4UF+3sPIFEWQa0frTns1mhDhAKrViFsCgI
 AyskwcNfT6YLzClp++h/Jug0fPUxoSPj+uN3RSgImqFOLZfaQqQyCikm+mW5Y5C/sPbp68lkf2P
 WxJqn5wiS6Jd5p4IX93mKCX71EUB3kXndewKWfqrGYhw5E3Smn3XEILmzMALRisYUmxeLnziGZu
 a6m98NbskcKNyrpTyHmDE6e7lQA8szIUuG7NBGziFxWPqHwRYm3r4X5YZ6bS0GizgU3psnKm9ex
 vom00jCfmYmP9WKefkZERyPXZ2pgrAjeaMuFMg6o6Fm2jstypH/6s82+R0GEq0pXtL+frnqAII2
 tX3NbDJEF50hxC/fOzTkljT+MjuVd3k6UJ+/llCoSGxIETWorqQV10gMovRw7kcm/aNpr00dRz9
 yeBd9Qr4O9UqtJG3LT9ETAzaywrhPjgUEhwnzZP0h1R473cj/zNpCXWDSdJIbNTMP1aaqPwTpfo
 K0lL+HRg+C410b/c7QfPJ0+h8Y8YH36IFX1n5FoTV2/asbsiC/PhlGjPXqGaNGxV7V2h93uNfOD
 x8HvjdH8vo/s5aw==
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

As stated in [2], the write_line functions are very similar and force code
duplication. This patch add a macro to avoid code repetition.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 107 ++++++++++------------------------
 drivers/gpu/drm/vkms/vkms_writeback.c |   4 +-
 2 files changed, 33 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index c5cb2e45ddaf..51b1c04e6781 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -642,6 +642,31 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
 	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
+/**
+ * WRITE_LINE() - Generic generator for write_line functions
+ *
+ * This generator can only be used for format with only one plane and block_w == block_h == 1
+ *
+ * @function_name: Name to use for the generated function
+ * @conversion_function: Fonction to use for the conversion from argb_u16 to the required format.
+ */
+#define WRITE_LINE(function_name, conversion_function)					\
+static void function_name(struct vkms_writeback_job *wb,				\
+			  struct pixel_argb_u16 *src_pixels, int count, int x_start,	\
+			  int y_start)							\
+{											\
+	u8 *dst_pixels;									\
+											\
+	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);	\
+											\
+	while (count) {									\
+		(conversion_function)(dst_pixels, src_pixels);				\
+		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];		\
+		src_pixels += 1;							\
+		count--;								\
+	}										\
+}
+
 /*
  * The following functions are write_line function for each pixel format supported by VKMS.
  *
@@ -655,85 +680,13 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
  * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
  */
 
-static void ARGB8888_write_line(struct vkms_writeback_job *wb,
-				struct pixel_argb_u16 *src_pixels, int count, int x_start,
-				int y_start)
-{
-	u8 *dst_pixels;
+WRITE_LINE(ARGB8888_write_line, argb_u16_to_ARGB8888)
+WRITE_LINE(XRGB8888_write_line, argb_u16_to_XRGB8888)
 
-	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
+WRITE_LINE(ARGB16161616_write_line, argb_u16_to_ARGB16161616)
+WRITE_LINE(XRGB16161616_write_line, argb_u16_to_XRGB16161616)
 
-	while (count) {
-		argb_u16_to_ARGB8888(dst_pixels, src_pixels);
-		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
-		src_pixels += 1;
-		count--;
-	}
-}
-
-static void XRGB8888_write_line(struct vkms_writeback_job *wb,
-				struct pixel_argb_u16 *src_pixels, int count, int x_start,
-				int y_start)
-{
-	u8 *dst_pixels;
-
-	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
-
-	while (count) {
-		argb_u16_to_XRGB8888(dst_pixels, src_pixels);
-		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
-		src_pixels += 1;
-		count--;
-	}
-}
-
-static void ARGB16161616_write_line(struct vkms_writeback_job *wb,
-				    struct pixel_argb_u16 *src_pixels, int count, int x_start,
-				    int y_start)
-{
-	u8 *dst_pixels;
-
-	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
-
-	while (count) {
-		argb_u16_to_ARGB16161616(dst_pixels, src_pixels);
-		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
-		src_pixels += 1;
-		count--;
-	}
-}
-
-static void XRGB16161616_write_line(struct vkms_writeback_job *wb,
-				    struct pixel_argb_u16 *src_pixels, int count, int x_start,
-				    int y_start)
-{
-	u8 *dst_pixels;
-
-	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
-
-	while (count) {
-		argb_u16_to_XRGB16161616(dst_pixels, src_pixels);
-		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
-		src_pixels += 1;
-		count--;
-	}
-}
-
-static void RGB565_write_line(struct vkms_writeback_job *wb,
-			      struct pixel_argb_u16 *src_pixels, int count, int x_start,
-			      int y_start)
-{
-	u8 *dst_pixels;
-
-	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
-
-	while (count) {
-		argb_u16_to_RGB565(dst_pixels, src_pixels);
-		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
-		src_pixels += 1;
-		count--;
-	}
-}
+WRITE_LINE(RGB565_write_line, argb_u16_to_RGB565)
 
 /**
  * argb_u16_to_nothing() - pixel_write callback with no effect
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index f6ed3aa69af8..53bddcf33eab 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/iosys-map.h>
+#include <linux/media-bus-format.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_edid.h>
@@ -19,7 +20,8 @@ static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
-	DRM_FORMAT_RGB565
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_YUV422
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {

-- 
2.43.2

