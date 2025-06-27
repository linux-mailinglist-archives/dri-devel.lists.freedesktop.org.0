Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7746CAEB341
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E951810E9A8;
	Fri, 27 Jun 2025 09:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Kd0BBwa5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E5B10E9A7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:48:02 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 7421E5867F7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:12:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ADF243896;
 Fri, 27 Jun 2025 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751015570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uogAM4+ZOSKk76SXJda0LnVy0gMOOnK8hPopxGpta3E=;
 b=Kd0BBwa5IoqwNolfDqCu70MC48wyvhyzfE36KJXmc/ePWrrlPfjSUFrDv3hRjsN6wBAB6w
 DF0hOKXBwauvzf0jfjczMuhp1S/y3wIka2VmPxKrnvPgo6BQA4xNl7wdvbwipQsLgtMXZD
 GdfSt+ZNMHQM1JPJsbtuT7N+UuToNhUQJ0eeQ2+yKHGaMJy4tBLtNNwEMP4tPonqL8er3r
 77GFbt+4A/x1EjCyQTKc0UBkTENDmrg3QkpCQ0EyNjzXl7Dr4h+CVeEfErGSTtwTmfEZ5W
 5KoGFqEKm8zQW8fq8dlimqiJzUY7C13GGg4JPQcNVrRQBNnLXms8qwluHu7Oiw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 27 Jun 2025 11:12:32 +0200
Subject: [PATCH v5 1/8] drm/vkms: Create helpers macro to avoid code
 duplication in format callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-b4-new-color-formats-v5-1-94452f119c72@bootlin.com>
References: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
In-Reply-To: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8563;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=kz3Mv5c+ZujUHwIVAV2E1O+yPOWW7obed0JJxkIZjbs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXmCLCWTinwuSpnni29jdcdQz+bKXFLHR71vhq
 7wtcxL3iQWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF5giwAKCRAgrS7GWxAs
 4gGID/9JPj3y1nT4dGqBUTmXFdFEO51ICbLFcVgKloUXYRSLe2bRPT1Ie73VxiGCgqafjL7ohU4
 ZB6nM03mNgz9aZ+1PcvM13KCwfj6coWesYAn2VC0E/0hioH20C43TxyOQ7dik3uMjqK6g5HG+73
 AWwJssTfBWJ03g3Wi6wTmS4xcyLY4rm2YA02KUoVO38DOXwPpD+JMIB6Gn9oy3jsIXcHb7JsUDk
 iqT1md8Spwbl5jKF129VHALLWiNUxnQLsO+YOvKbrmi8Bn9ix0hZWGMe44piDJABT5bRtOMKpxc
 sdsLGoR8e3vURBeXfRri24GX4gMCb9HsS1/R0iUA3/KnGDDmDLurwx7HxGGCCXvhIkdEyFmqQ4V
 9EIPVkLIR7zIjkH7j6YPGwNmCfrLNhEjOOtuZwf5Ik1C5DVscjX/eVHRk0oKre890SRFabGVTlR
 YuBC+ss1WcVnUxUZqC+Hbrj33VpzHdbyi2sQWQMVn6NOn08lJ+ZolwnPtpd3oG02Xt3nbjVyrmp
 SY0vVJxYSSkeB/lBkUNJQLj/Cm9fFiP5O5Lm5kK4YUVE1vM6aEGH1mKi704dx2V8Kc0QD0Eb+BY
 kHI14Us5PUsHC99k3ibwUmHzsLqz7gxoz+675IbE8TPAO2jamJgIN30Nu7zRzXTDrvZqem6U9Xk
 +1iHJPeyJTamz1w==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtieevieduhedttdfgtefhuddufeffudetkeegveeuteduveehheeivedttddtkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehmrghirhgrtggrnhgrlhesrhhishgvuhhprdhnvghtpdhrtghpthhtohepshhiqhhuvghirhgrsehighgrlhhirgdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvghtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtt
 hhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm
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

The callback functions for line conversion are almost identical for
some format. The generic READ_LINE macro generate all the required
boilerplate to process a line.

Two overrides of this macro have been added to avoid duplication of
the same arguments every time.

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 186 ++++++++++++------------------------
 1 file changed, 59 insertions(+), 127 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 6d0227c6635a..a9c624081dac 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -292,6 +292,58 @@ VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1,
 }
 EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
 
+/**
+ * READ_LINE() - Generic generator for a read_line function which can be used for format with one
+ * plane and a block_h == block_w == 1.
+ *
+ * @function_name: Function name to generate
+ * @pixel_name: Temporary pixel name used in the @__VA_ARGS__ parameters
+ * @pixel_type: Used to specify the type you want to cast the pixel pointer
+ * @callback: Callback to call for each pixels. This fonction should take @__VA_ARGS__ as parameter
+ *            and return a pixel_argb_u16
+ * @__VA_ARGS__: Argument to pass inside the callback. You can use @pixel_name to access current
+ *  pixel.
+ */
+#define READ_LINE(function_name, pixel_name, pixel_type, callback, ...)				\
+static void function_name(const struct vkms_plane_state *plane, int x_start,			\
+			      int y_start, enum pixel_read_direction direction, int count,	\
+			      struct pixel_argb_u16 out_pixel[])				\
+{												\
+	struct pixel_argb_u16 *end = out_pixel + count;						\
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);			\
+	u8 *src_pixels;										\
+												\
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);		\
+												\
+	while (out_pixel < end) {								\
+		pixel_type *(pixel_name) = (pixel_type *)src_pixels;				\
+		*out_pixel = (callback)(__VA_ARGS__);						\
+		out_pixel += 1;									\
+		src_pixels += step;								\
+	}											\
+}
+
+/**
+ * READ_LINE_ARGB8888() - Generic generator for ARGB8888 formats.
+ * The pixel type used is u8, so pixel_name[0]..pixel_name[n] are the n components of the pixel.
+ *
+ * @function_name: Function name to generate
+ * @pixel_name: temporary pixel to use in @a, @r, @g and @b parameters
+ * @a, @r, @g, @b: value of each channel
+ */
+#define READ_LINE_ARGB8888(function_name, pixel_name, a, r, g, b) \
+	READ_LINE(function_name, pixel_name, u8, argb_u16_from_u8888, a, r, g, b)
+/**
+ * READ_LINE_le16161616() - Generic generator for ARGB16161616 formats.
+ * The pixel type used is u16, so pixel_name[0]..pixel_name[n] are the n components of the pixel.
+ *
+ * @function_name: Function name to generate
+ * @pixel_name: temporary pixel to use in @a, @r, @g and @b parameters
+ * @a, @r, @g, @b: value of each channel
+ */
+#define READ_LINE_le16161616(function_name, pixel_name, a, r, g, b) \
+	READ_LINE(function_name, pixel_name, __le16, argb_u16_from_le16161616, a, r, g, b)
+
 /*
  * The following functions are read_line function for each pixel format supported by VKMS.
  *
@@ -378,138 +430,18 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
 	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel);
 }
 
-static void R8_read_line(const struct vkms_plane_state *plane, int x_start,
-			 int y_start, enum pixel_read_direction direction, int count,
-			 struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
 
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+READ_LINE_ARGB8888(XRGB8888_read_line, px, 0xFF, px[2], px[1], px[0])
 
-	while (out_pixel < end) {
-		*out_pixel = argb_u16_from_gray8(*src_pixels);
-		src_pixels += step;
-		out_pixel += 1;
-	}
-}
+READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
+READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 
-static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
-			       enum pixel_read_direction direction, int count,
-			       struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
+READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
 
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
 
-	while (out_pixel < end) {
-		u8 *px = (u8 *)src_pixels;
-		*out_pixel = argb_u16_from_u8888(px[3], px[2], px[1], px[0]);
-		out_pixel += 1;
-		src_pixels += step;
-	}
-}
-
-static void XRGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
-			       enum pixel_read_direction direction, int count,
-			       struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
-
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
-
-	while (out_pixel < end) {
-		u8 *px = (u8 *)src_pixels;
-		*out_pixel = argb_u16_from_u8888(255, px[2], px[1], px[0]);
-		out_pixel += 1;
-		src_pixels += step;
-	}
-}
-
-static void ABGR8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
-			       enum pixel_read_direction direction, int count,
-			       struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
-
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
-
-	while (out_pixel < end) {
-		u8 *px = (u8 *)src_pixels;
-		/* Switch blue and red pixels. */
-		*out_pixel = argb_u16_from_u8888(px[3], px[0], px[1], px[2]);
-		out_pixel += 1;
-		src_pixels += step;
-	}
-}
-
-static void ARGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
-				   int y_start, enum pixel_read_direction direction, int count,
-				   struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
-
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
-
-	while (out_pixel < end) {
-		u16 *px = (u16 *)src_pixels;
-		*out_pixel = argb_u16_from_u16161616(px[3], px[2], px[1], px[0]);
-		out_pixel += 1;
-		src_pixels += step;
-	}
-}
-
-static void XRGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
-				   int y_start, enum pixel_read_direction direction, int count,
-				   struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
-
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
-
-	while (out_pixel < end) {
-		__le16 *px = (__le16 *)src_pixels;
-		*out_pixel = argb_u16_from_le16161616(cpu_to_le16(0xFFFF), px[2], px[1], px[0]);
-		out_pixel += 1;
-		src_pixels += step;
-	}
-}
-
-static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
-			     int y_start, enum pixel_read_direction direction, int count,
-			     struct pixel_argb_u16 out_pixel[])
-{
-	struct pixel_argb_u16 *end = out_pixel + count;
-	u8 *src_pixels;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
-
-	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
-
-	while (out_pixel < end) {
-		__le16 *px = (__le16 *)src_pixels;
-
-		*out_pixel = argb_u16_from_RGB565(px);
-		out_pixel += 1;
-		src_pixels += step;
-	}
-}
+READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
 
 /*
  * This callback can be used for YUV formats where U and V values are

-- 
2.49.0

