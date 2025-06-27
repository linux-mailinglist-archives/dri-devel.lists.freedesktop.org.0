Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB615AEC2C5
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 00:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE80510EA85;
	Fri, 27 Jun 2025 22:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="g/TXlo54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CE610EA85
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 22:45:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA11243AD5;
 Fri, 27 Jun 2025 22:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751064330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQGedsYFUprS2h2wsTHDGgsQPvYO+g5TGBKhmE6wtXc=;
 b=g/TXlo54jV6OrvpbJDhh+I9L7O0S1ukpavi9b9p3iwb+geK5mvNJup2+MQG1YsQGwpCivX
 /h2Se4OIXw9rGLZKqqO+s72dd8bX3eXZ2TlzrzxiB+9s6dBPvFDh2WsuoyB5eXolXm8aoj
 eDa7ew0JT8Cv0aYnpkzWJhp3UQpDv/HJAKedcSu1L/GJLpD6Ez7+nrJYBbYEVai4U75MDB
 G+LsFqyIu9MZomElLYv4zXZCVsPcLuNmZ3Z0IuXfnToDfwBF9mqgpYR2MrvNiN7h89t3Rp
 84X7FXB0dQ3sD6psdFdjvsRKCdFJHsBg47nwZwGzqaPR3jfnXBbGbAh7BRHyew==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 28 Jun 2025 00:45:21 +0200
Subject: [PATCH v6 7/8] drm/vkms: Create helper macro for YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250628-b4-new-color-formats-v6-7-2125b193f91a@bootlin.com>
References: <20250628-b4-new-color-formats-v6-0-2125b193f91a@bootlin.com>
In-Reply-To: <20250628-b4-new-color-formats-v6-0-2125b193f91a@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5260;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=6rCEsWIq5fbxDFsCRxdoRDtJo224kyW+P6LIRsIuwz4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXx7/jhvlF6vejDgffhNwlvnrkroUZSKCzeKqj
 9NcW20kK5GJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF8e/wAKCRAgrS7GWxAs
 4mn+EACc6EhDZpe9x7ZEAipuUCE6MNsbXRR6j8KKo6Ry5CzM45V/Bsj0sgwx+Nvi22ED8wNH8EY
 ZDCl1C2MxaI+6FwkhZsqVgadsM/5Jxnz8Q9A9KXyYQGZojz5TjXKofK22VLFwjTLK2cyHGLqxqV
 mZrOa87zeBzmmcn+V77POUCFKumEU4wb1ln8GlMpceVC2OZpqZb+VIE3xI9ulg2C2ODfYV7cKiM
 cB1M5Z1n7Ejk++tOQeGo8ECzVL04E7kWQzQFI+10uwtwwjGjgD9gpv0501ZCy8fbMxirGAu58la
 PJBOuHP/zgHc4z80cVgRU1ETtiRRxN3QV4n+9XQ2J2zfAPRYMbl+dLzFCvrWftg7CCLtc2Yk3qh
 ihSxbRmyoWIf7Sk13Wbxxz9eoZuJXoEqBCieorEcsHOSS1I32fZ2V0XUK3QcfV0BMf3us7FGEMf
 8Lb40QtlxXBdJvuIgHip0xq1WgPLO4oiWeZUr5sHnv2jcvjgWm+QdnCWvEBmtgMc90VMaS76X+E
 yx7wePSmqUgCSuc+TjwOo0e8hnFgscpIKakI3pXSe0j78QByK1Zfv/zvxUBbV+ei8FNChX4yw7M
 WLX5HE8A+31dDGTm1wcJPGZ0xYvT82Vyy/nG8mvybFjdmVrRFu4WxTID5OGUAl0Xxk41I9cXd7s
 vcGHq6tRD3D92JQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtieevieduhedttdfgtefhuddufeffudetkeegveeuteduveehheeivedttddtkeenucfkphepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehpdhhvghloheplgduledvrdduieekrddurddvjegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgvrghnphgruhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepshhiqhhuvghirhgrsehighgrlhhirgdrtghomhdprhgtphhtthhopehsihhmohhnrgdrvhgvthhtvghrsehffhiflhhlrdgthhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvght
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
semi-planar formats. The generic READ_LINE_YUV_SEMIPLANAR macro
generate all the required boilerplate to process a line from a
semi-planar format.

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 75 ++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 03eb73f4caef..b18d67436e1d 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -473,35 +473,56 @@ READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
  * - Convert YUV and YVU with the same function (a column swap is needed when setting up
  * plane->conversion_matrix)
  */
-static void semi_planar_yuv_read_line(const struct vkms_plane_state *plane, int x_start,
-				      int y_start, enum pixel_read_direction direction, int count,
-				      struct pixel_argb_u16 out_pixel[])
-{
-	u8 *y_plane;
-	u8 *uv_plane;
-
-	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0,
-			       &y_plane);
-	packed_pixels_addr_1x1(plane->frame_info,
-			       x_start / plane->frame_info->fb->format->hsub,
-			       y_start / plane->frame_info->fb->format->vsub, 1,
-			       &uv_plane);
-	int step_y = get_block_step_bytes(plane->frame_info->fb, direction, 0);
-	int step_uv = get_block_step_bytes(plane->frame_info->fb, direction, 1);
-	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
-	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);
-	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
 
-	for (int i = 0; i < count; i++) {
-		*out_pixel = argb_u16_from_yuv161616(conversion_matrix, y_plane[0] * 257,
-						     uv_plane[0] * 257, uv_plane[1] * 257);
-		out_pixel += 1;
-		y_plane += step_y;
-		if ((i + subsampling_offset + 1) % subsampling == 0)
-			uv_plane += step_uv;
-	}
+/**
+ * READ_LINE_YUV_SEMIPLANAR() - Generic generator for a read_line function which can be used for yuv
+ * formats with two planes and block_w == block_h == 1.
+ *
+ * @function_name: Function name to generate
+ * @pixel_1_name: temporary pixel name for the first plane used in the @__VA_ARGS__ parameters
+ * @pixel_2_name: temporary pixel name for the second plane used in the @__VA_ARGS__ parameters
+ * @pixel_1_type: Used to specify the type you want to cast the pixel pointer on the plane 1
+ * @pixel_2_type: Used to specify the type you want to cast the pixel pointer on the plane 2
+ * @callback: Callback to call for each pixels. This function should take
+ *            (struct conversion_matrix*, @__VA_ARGS__) as parameter and return a pixel_argb_u16
+ * @__VA_ARGS__: Argument to pass inside the callback. You can use @pixel_1_name and @pixel_2_name
+ *               to access current pixel values
+ */
+#define READ_LINE_YUV_SEMIPLANAR(function_name, pixel_1_name, pixel_2_name, pixel_1_type,	\
+				 pixel_2_type, callback, ...)					\
+static void function_name(const struct vkms_plane_state *plane, int x_start,			\
+		 int y_start, enum pixel_read_direction direction, int count,			\
+		 struct pixel_argb_u16 out_pixel[])						\
+{												\
+	u8 *plane_1;										\
+	u8 *plane_2;										\
+												\
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0,				\
+			       &plane_1);							\
+	packed_pixels_addr_1x1(plane->frame_info,						\
+			       x_start / plane->frame_info->fb->format->hsub,			\
+			       y_start / plane->frame_info->fb->format->vsub, 1,		\
+			       &plane_2);							\
+	int step_1 = get_block_step_bytes(plane->frame_info->fb, direction, 0);			\
+	int step_2 = get_block_step_bytes(plane->frame_info->fb, direction, 1);			\
+	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);		\
+	int subsampling_offset = get_subsampling_offset(direction, x_start, y_start);		\
+	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;		\
+												\
+	for (int i = 0; i < count; i++) {							\
+		pixel_1_type *(pixel_1_name) = (pixel_1_type *)plane_1;				\
+		pixel_2_type *(pixel_2_name) = (pixel_2_type *)plane_2;				\
+		*out_pixel = (callback)(conversion_matrix, __VA_ARGS__);			\
+		out_pixel += 1;									\
+		plane_1 += step_1;								\
+		if ((i + subsampling_offset + 1) % subsampling == 0)				\
+			plane_2 += step_2;							\
+	}											\
 }
 
+READ_LINE_YUV_SEMIPLANAR(YUV888_semiplanar_read_line, y, uv, u8, u8, argb_u16_from_yuv161616,
+			 y[0] * 257, uv[0] * 257, uv[1] * 257)
+
 /*
  * This callback can be used for YUV format where each color component is
  * stored in a different plane (often called planar formats). It will
@@ -697,7 +718,7 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV61:
 	case DRM_FORMAT_NV42:
-		return &semi_planar_yuv_read_line;
+		return &YUV888_semiplanar_read_line;
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YUV422:
 	case DRM_FORMAT_YUV444:

-- 
2.49.0

