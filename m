Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867C08C7723
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E219710ED0B;
	Thu, 16 May 2024 13:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="g3/U1B2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0389E10ECFD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:05:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABA35C0005;
 Thu, 16 May 2024 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715864723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ekcmEL5zAT+zabbD54FzC7zp1oJyO+vw4lBdUWZ0ug=;
 b=g3/U1B2VEy4ytLXtLWiH1JU6x55oSbXWeg7odwW/w3oMZ1TeVcOTQqdjoohc+wFx36i4bw
 nA4lXQa44x5RumiGzDwVyXbqN6F6rWkFJOGBDWFDiVUb6zkW+dmYq8s9o1xsR0+hJwIMyh
 Mq1qTGyvJwUpgh+s7DcfCOF3rM8SU9U8rUMo5ICnuCb/pznFS15vueSz+f2O/AOJmyLGq8
 uHZgBlcVGNJKByCDw0AU9402w0CthUcsUp1cQkb39Pe0Tv9UYxmKdA7eSg/YYL4iy80Dlo
 ZpS2/jaFtkbNw90t/U63ELnTqCDZNqFdOWq1WdSRDEJnI2L6CifsHB1M47DEhA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:04:51 +0200
Subject: [PATCH v8 06/17] drm/vkms: Use const for input pointers in
 pixel_read an pixel_write functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240516-yuv-v8-6-cf8d6f86430e@bootlin.com>
References: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
In-Reply-To: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6553;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9BLSrbAtgkfvZRODYypdS+g+ySxYPqG+gOpDg0n8XJc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRgSA3HMJdD5eeqQT6SHdZ6xt5u001HswpR39I
 mnkkFLPxvyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYEgAAKCRAgrS7GWxAs
 4uzoD/9OawVCifthAaXPys2QkZmRd7bMnaI7Uq+KPWWnjHsHg84u28+YmtAHPRpvTK1nWNH9mMl
 tvkw8F340HvTLBseYGEh/GCw7hxtNl/PayIZGYwVqvhI24kRLoyJdkPwDL3I1MOr2IRUgCae62J
 5QqSRcap7+bzJqOXJYJA+SAk4STIRu+/oRheyey7RDlNdQQv6Jj7q6ZPGoQq6tv27JJMmtzAcys
 vdjsNK20bz/UkF8qDeVrr5P0qhMmtw3Oo1UKSD4pXC4d/8fFhMb90x8CAsUYc8IYLnnWzygQfZf
 Bgs2z13ANrxYlqhRsKD8bu/yOWK190NWpL+DgRY/QmI2eCKO5Irg6RfU7d8jTOJQc+Pk2h5deGv
 APQ0fbmK9+dRTngEzB4HnEECho9D85Vu4u0bAyW8iCvaS2iKX41VIjzWd4VejWPFfyhph540fmV
 LViTBca2dqqlQqMMnk4h1FPDVF2aVyR+tI/nEFaeded0XhZavruCjyoPTQDvDFJOWKWkYhKca4Q
 ns1yBHm9kjiG9KEDsoDs10XoPd3TCiAabDS9e6yb9fW/j+W7jXu8tyQzJImUlW2lSqfsZds0DXV
 psbNHLWHXXnjkSkGLKt1BxeSuD8xE0xl4zvu5aO73xkw0JwttYtgCTw2Q3cwirno9h6Hn0pJWnc
 0UcjhijAnsC5EYQ==
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

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h     |  4 ++--
 drivers/gpu/drm/vkms/vkms_formats.c | 24 ++++++++++++------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index b1542b83b090..17081effe99a 100644
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
  * @in_pixel: pointer to the pixel to read
  * @out_pixel: pointer to write the converted pixel
  */
-typedef void (*pixel_read_t)(u8 *in_pixel, struct pixel_argb_u16 *out_pixel);
+typedef void (*pixel_read_t)(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel);
 
 /**
  * struct vkms_plane_state - Driver specific plane state
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index c28c32b00e39..69cf9733fec5 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -75,7 +75,7 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
  * They are used in the vkms_compose_row() function to handle multiple formats.
  */
 
-static void ARGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void ARGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	/*
 	 * The 257 is the "conversion ratio". This number is obtained by the
@@ -89,7 +89,7 @@ static void ARGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 	out_pixel->b = (u16)in_pixel[0] * 257;
 }
 
-static void XRGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void XRGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	out_pixel->a = (u16)0xffff;
 	out_pixel->r = (u16)in_pixel[2] * 257;
@@ -97,7 +97,7 @@ static void XRGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 	out_pixel->b = (u16)in_pixel[0] * 257;
 }
 
-static void ARGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void ARGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	u16 *pixel = (u16 *)in_pixel;
 
@@ -107,7 +107,7 @@ static void ARGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pi
 	out_pixel->b = le16_to_cpu(pixel[0]);
 }
 
-static void XRGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void XRGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	u16 *pixel = (u16 *)in_pixel;
 
@@ -117,7 +117,7 @@ static void XRGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pi
 	out_pixel->b = le16_to_cpu(pixel[0]);
 }
 
-static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	u16 *pixel = (u16 *)in_pixel;
 
@@ -142,7 +142,7 @@ static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
  * It is used to avoid null pointer to be used as a function. In theory, this function should
  * never be called, except if you found a bug in the driver/DRM core.
  */
-static void magenta_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static void magenta_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 {
 	out_pixel->a = (u16)0xFFFF;
 	out_pixel->r = (u16)0xFFFF;
@@ -188,7 +188,7 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
  * They are used in vkms_writeback_row() to convert and store a pixel from the src_buffer to
  * the writeback buffer.
  */
-static void argb_u16_to_ARGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+static void argb_u16_to_ARGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	/*
 	 * This sequence below is important because the format's byte order is
@@ -206,7 +206,7 @@ static void argb_u16_to_ARGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
 	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
 }
 
-static void argb_u16_to_XRGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+static void argb_u16_to_XRGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	out_pixel[3] = 0xff;
 	out_pixel[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
@@ -214,7 +214,7 @@ static void argb_u16_to_XRGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
 	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
 }
 
-static void argb_u16_to_ARGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+static void argb_u16_to_ARGB16161616(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	u16 *pixel = (u16 *)out_pixel;
 
@@ -224,7 +224,7 @@ static void argb_u16_to_ARGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pi
 	pixel[0] = cpu_to_le16(in_pixel->b);
 }
 
-static void argb_u16_to_XRGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+static void argb_u16_to_XRGB16161616(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	u16 *pixel = (u16 *)out_pixel;
 
@@ -234,7 +234,7 @@ static void argb_u16_to_XRGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pi
 	pixel[0] = cpu_to_le16(in_pixel->b);
 }
 
-static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {
 	u16 *pixel = (u16 *)out_pixel;
 
@@ -259,7 +259,7 @@ static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
  * It is used to avoid null pointer to be used as a function. In theory, this should never
  * happen, except if there is a bug in the driver
  */
-static void argb_u16_to_nothing(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+static void argb_u16_to_nothing(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
 {}
 
 /**

-- 
2.43.2

