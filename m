Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFFEAF6C30
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 09:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9966510E152;
	Thu,  3 Jul 2025 07:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JP5LWQbK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB40810E7DA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 07:57:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB94844479;
 Thu,  3 Jul 2025 07:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751529444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7h1Ypg5TBoP40Ulb9+gSJIHxVgy6r6WRfGMOnrSNVLU=;
 b=JP5LWQbKDuDU0CLUG1W0lYPQ2BfrzH/neenvzFKJk9BQX1jNvSDY3kwsqJPmGxx/ycnXoA
 l14d1+p6D4pwrhiFHIDHrzCkdiEAgYnXS399GDEl8TDLwUCZZRNgMCY7WMd+J/uStjiTZ5
 sP8q6TJjztxre8B7QGvoOVLG9u1dtBmDFlg0b/mfdGgRvMrwuEsL86Awe36EEZji/x3i/s
 56ejVV5aKSMT9fRL+uU/qhTO/8Eye5nvQQs4Rzu1dEngAJRjnvrgPicG6PZgIswl5t/1St
 V4RcnbjAIyg2y7d9aI/IgYEB0I2a7AK+CePdYq6xiSd2QSh8cRNTfZritDW/sw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 03 Jul 2025 09:56:57 +0200
Subject: [PATCH v7 1/8] drm/vkms: Create helpers macro to avoid code
 duplication in format callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250703-b4-new-color-formats-v7-1-15fd8fd2e15c@bootlin.com>
References: <20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com>
In-Reply-To: <20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8638;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=fzU1hPTIkJFhW985S4PykPiWZ/4b5hWSIWUZe75Y7Iw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoZjff0DvdwSlvPFkmN0PTrF5KUhNueFsjapjvr
 9sq7J694QiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaGY33wAKCRAgrS7GWxAs
 4pSJD/97tJlgKE7Vk8rORByNAYu5n7Od3Vh/703c1QB51vmALr9dRbcR4cTM9Rq66mVcQrFd3AS
 3lE5/Edglzlr/3TXBsQHVJeF8CVlxsculkB4Uoj6FHRS4Dj0G2UvIjjgCjTRGw5PY3BWIAAXowm
 D8rqjBxe8hpJ+tAV3jtDPZKAlnekHL+0zMpNn/Zu1zhGDdMZ4Z9OL6LCMXfE6o3ZY9oJBVoBCFr
 Q8/v/Nt9QO8Di04LMqpYw3/UQu7i+07NtSziPvvmUBwPHh4bh/zJeoLfFBa6B8LZYWQTGcbkMiU
 XYlfK/b6rx3/K2RXS2uoHXjQ7WGwPaw7X6pzcAzrsfh1zdQXAAUvLh227sUOENSll6qnGN95Zi7
 JPNa97yZ7CQ1gWBDB2+quG6WPx0IP+jdYifAsMhn7s2jWCdk7TZJm6ID+ZlIcS0YjrrR+hJQb6j
 ONNSqPbsgblN47PApYOC+PH8+N0czzq4N0P7LtrbTU0nkwm2Kt+Su308S7iS3Fe4PSPDaVO1lu+
 pXvM0NxYlmHu3qzYw+3t6XEMMMWHDdbUp2lRGXdu8lsc9JR4nmxnBCqtSyr3j8sVEfFbubPQOcM
 EYTrw8I7Zq//b9fXGjUtwzKhV8bV854lPxo0JnuvBhFtyRPT2JjBXDS70MHjPp4yU7cpHmlOqEU
 trvf0ZQhM4sJysQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeiveeiudehtddtgfethfduudefffduteekgeevueetudevheehieevtddttdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsvggrnhhprghulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtp
 hhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
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

The callback functions for line conversion are almost identical for
some format. The generic READ_LINE macro generate all the required
boilerplate to process a line.

Two overrides of this macro have been added to avoid duplication of
the same arguments every time.

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 192 ++++++++++++------------------------
 1 file changed, 65 insertions(+), 127 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 6d0227c6635a..07b13481378b 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -292,6 +292,64 @@ VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1,
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
+ * __VA_ARGS__: Argument to pass inside the callback. You can use @pixel_name to access current
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
+ * @a: alpha value
+ * @r: red value
+ * @g: green value
+ * @b: blue value
+ */
+#define READ_LINE_ARGB8888(function_name, pixel_name, a, r, g, b) \
+	READ_LINE(function_name, pixel_name, u8, argb_u16_from_u8888, a, r, g, b)
+/**
+ * READ_LINE_le16161616() - Generic generator for ARGB16161616 formats.
+ * The pixel type used is u16, so pixel_name[0]..pixel_name[n] are the n components of the pixel.
+ *
+ * @function_name: Function name to generate
+ * @pixel_name: temporary pixel to use in @a, @r, @g and @b parameters
+ * @a: alpha value
+ * @r: red value
+ * @g: green value
+ * @b: blue value
+ */
+#define READ_LINE_le16161616(function_name, pixel_name, a, r, g, b) \
+	READ_LINE(function_name, pixel_name, __le16, argb_u16_from_le16161616, a, r, g, b)
+
 /*
  * The following functions are read_line function for each pixel format supported by VKMS.
  *
@@ -378,138 +436,18 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
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

