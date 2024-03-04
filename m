Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3972A87056F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE38112269;
	Mon,  4 Mar 2024 15:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dd5FbhFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015C81122A4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:29:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4D331C0010;
 Mon,  4 Mar 2024 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709566165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8LUKE39JY8ybFzAarIS0+XJ1i/6qp7K6c1tfJGj9bQ=;
 b=dd5FbhFLRLQ7axrQhbGNSEMBkq5MXNW8e1uruKOLYvti9LAIq/hoohuf/av23tiLJpMNfw
 SiCxph5fP7pLt+LB1kfx4Qa5dkHFHHEGpdJPtaTz83AnmGlfs7rq5grJ+s1fRbyJTF+CB9
 2VkkxSb7BgBOD/aaBGWiNeF+JOh99wLIKqd0HoYFC4nwS5LZ1iOKOYSRTslX7gSOgrLPwO
 FehStUk6G2zY7d0qHj5qRzsISZavUD04UgD5SmGQnJwZY2jzML/3PuSuu76WFsxySBTk1v
 mXtZIpuLf7J7m2ZvBbtjgx9n+JPZ/WtIqHciZX+J+ysMxhBeqO71SxDjiXi+2Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 04 Mar 2024 16:28:11 +0100
Subject: [PATCH v4 06/14] drm/vkms: Use const for input pointers in
 pixel_read an pixel_write functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-yuv-v4-6-76beac8e9793@bootlin.com>
References: <20240304-yuv-v4-0-76beac8e9793@bootlin.com>
In-Reply-To: <20240304-yuv-v4-0-76beac8e9793@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6527;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RPVRKA6Ba/aNHCg5fMJ52I7hctRCp4EyDzZTrh21ka8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl5ejLqEEj4SY8FKiG/XIazDNIccXcIOWAXNXsHj5w
 0/8CgCiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeXoywAKCRAgrS7GWxAs4ttZEA
 DCFYY9VMGlPzws0CtRgDhUitW/LK8mhU8ZnbBgLLuTCAG4+pXQvMvMtSJc7gU2zpYmbhoWwUWcePQl
 kO4EimwSNR1YNVG0JWkgRqZ4IBg072A6Ew04C/fa3jcHRDL9nyL/k7JXTx81jE8PDC5nR0HPKY5uK5
 T7WDQpgCjZUXJG2u9+GZ7QWwYPaSaBk6bO/skLux4KixIjiBafZSTXHgpKB60DMffPUyNpheuoFRuR
 jZWGVZy3yn8FMGc8rM4hVCqiAqkOASny9n0rfrLPzZ3n24EQgGfaSdic9UA3T8iA9/ZYokFCn/hg7S
 QGHSifHS258J19v0of2AOnDtqk83e60lsIhjyTCYx9RctdI2521ctjcIEPswjKc045IxZYoIFuCrof
 entFYOOsOPVjuNtg3N988FBSMOEgMcnWzoPjELzfEqLvqac7RIfR2gcaersHkcOb8/F+nZ5Ro/aXCF
 ANvKoi0n2GaSc7oPU4nxmqOzxY0a4WLQlOIPQayp3ODCTbHwblMdgD7qkS0vrxgpAUJTX7mCS70LFj
 X2h1cagcvk3fmN3ohN07UMQBz1r9SkzxxiDg0v4dlnO5ZOrx8+IjwILHjRvD1ltIZdUNg1t9RbAsT+
 ocjnD9Asv/DVaESZLO/G3j3GHqlHg0p0tRtH1aQhecIBvNs5ZfbcYJLYKprw==
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

As the pixel_read and pixel_write function should never modify the input
buffer, mark those pointers const.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h     |  4 ++--
 drivers/gpu/drm/vkms/vkms_formats.c | 24 ++++++++++++------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 4bfc62d26f08..3ead8b39af4a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -61,7 +61,7 @@ struct line_buffer {
  * @out_pixel: destination address to write the pixel
  * @in_pixel: pixel to write
  */
-typedef void (*pixel_write_t)(u8 *out_pixel, struct pixel_argb_u16 *in_pixel);
+typedef void (*pixel_write_t)(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
 
 struct vkms_writeback_job {
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
@@ -76,7 +76,7 @@ struct vkms_writeback_job {
  * @in_pixel: Pointer to the pixel to read
  * @out_pixel: Pointer to write the converted pixel
  */
-typedef void (*pixel_read_t)(u8 *in_pixel, struct pixel_argb_u16 *out_pixel);
+typedef void (*pixel_read_t)(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel);
 
 /**
  * vkms_plane_state - Driver specific plane state
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 29ca403827a6..bdd15964ce24 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -76,7 +76,7 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
  * They are used in the `vkms_compose_row` function to handle multiple formats.
  */
 
-static void ARGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void ARGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	/*
 	 * The 257 is the "conversion ratio". This number is obtained by the
@@ -90,7 +90,7 @@ static void ARGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 	out_pixel->b = (u16)in_pixel[0] * 257;
 }
 
-static void XRGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void XRGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	out_pixel->a = (u16)0xffff;
 	out_pixel->r = (u16)in_pixel[2] * 257;
@@ -98,7 +98,7 @@ static void XRGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 	out_pixel->b = (u16)in_pixel[0] * 257;
 }
 
-static void ARGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void ARGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	u16 *pixel = (u16 *)in_pixel;
 
@@ -108,7 +108,7 @@ static void ARGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pi
 	out_pixel->b = le16_to_cpu(pixel[0]);
 }
 
-static void XRGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void XRGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	u16 *pixel = (u16 *)in_pixel;
 
@@ -118,7 +118,7 @@ static void XRGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pi
 	out_pixel->b = le16_to_cpu(pixel[0]);
 }
 
-static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	u16 *pixel = (u16 *)in_pixel;
 
@@ -143,7 +143,7 @@ static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
  * It is used to avoid null pointer to be used as a function. In theory, this function should
  * never be called, except if you found a bug in the driver/DRM core.
  */
-static void black_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void black_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	out_pixel->a = (u16) 0xFFFF;
 	out_pixel->r = 0;
@@ -189,7 +189,7 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
  * They are used in the `vkms_writeback_row` to convert and store a pixel from the src_buffer to
  * the writeback buffer.
  */
-static void argb_u16_to_ARGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+static void argb_u16_to_ARGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	/*
 	 * This sequence below is important because the format's byte order is
@@ -207,7 +207,7 @@ static void argb_u16_to_ARGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
 	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
 }
 
-static void argb_u16_to_XRGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+static void argb_u16_to_XRGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	out_pixel[3] = 0xff;
 	out_pixel[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
@@ -215,7 +215,7 @@ static void argb_u16_to_XRGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
 	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
 }
 
-static void argb_u16_to_ARGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+static void argb_u16_to_ARGB16161616(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	u16 *pixel = (u16 *)out_pixel;
 
@@ -225,7 +225,7 @@ static void argb_u16_to_ARGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pi
 	pixel[0] = cpu_to_le16(in_pixel->b);
 }
 
-static void argb_u16_to_XRGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+static void argb_u16_to_XRGB16161616(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	u16 *pixel = (u16 *)out_pixel;
 
@@ -235,7 +235,7 @@ static void argb_u16_to_XRGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pi
 	pixel[0] = cpu_to_le16(in_pixel->b);
 }
 
-static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	u16 *pixel = (u16 *)out_pixel;
 
@@ -260,7 +260,7 @@ static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
  * It is used to avoid null pointer to be used as a function. In theory, this should never
  * happen, except if there is a bug in the driver
  */
-static void argb_u16_to_nothing(u8 *out_pixel, struct pixel_argb_u16 *in_pixel) {}
+static void argb_u16_to_nothing(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel) {}
 
 /**
  * Generic loop for all supported writeback format. It is executed just after the blending to

-- 
2.43.0

