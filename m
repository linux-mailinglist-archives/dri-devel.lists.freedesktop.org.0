Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576C2AC911A
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 16:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0052710E87F;
	Fri, 30 May 2025 14:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pYAwByF4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE1E10E7D8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 14:06:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 485D2439FE;
 Fri, 30 May 2025 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748613972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dokCeIH59OHdxqtow41KuxBA+Nl/NrX2+lPE/9a896Y=;
 b=pYAwByF4zK8FERLFrt2/H3II2udHZCoV19USDC5NmcveHIOqRr053Jsd65cgk+tdmOnhfi
 3sDL9sqgGm6RQwaetqs3p3722fVQW+JGr/YKuWohu1lD2hEzUw3u5lSa5hDO/M39fHy393
 2gPasqViV6TiB/4XdC/9tb64e+NERzECCEysFb1ucEeMTPGDtIqECRZIQ/Uo4LwejH1KIB
 5tpzn+BhHgma0X6JSsoTXpi8STpFHqMG7rgjfYIVzBPjwm42RAq4I29JhdhSXPBXkVSF/D
 gdxHACARb6RsUNp0CZrMXhQtSBIG5ImhDSQpkiDuYUfnieG7Y2fVtuf+SfTQVA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 30 May 2025 16:06:02 +0200
Subject: [PATCH v4 7/8] drm/vkms: Create helper macro for YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-b4-new-color-formats-v4-7-ef5f9f48376c@bootlin.com>
References: <20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com>
In-Reply-To: <20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5213;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=awMO2j5SG7ciSApYEpE3cy/ILhS+pYF1V4kkuJm+W44=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoObtKvGhlIv0yuktdipKRWY6Lj3sCQ/zfjEb6x
 KVCjJS1sIyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaDm7SgAKCRAgrS7GWxAs
 4sOZD/9XP/F2EuqM+NSE3NvciX21EQB3Jbx4jnollORV44Nmk/Jtuq5wp4mCAlECccvZs4Hph1D
 gUH2bCiBZKtG+BDOVLWNmJ5oSp5izEuEhMI+6Af87QTd8TkDZnK+ZJCkkMmc8qG5SfqrtTHwuQ5
 yhK7cfbB63uu12DxGj2ANcZLK2aFgKmH4eb9Bl7J8T/ipj4xK4wfZzU2720p4aJoPSH4Mc3K1Vj
 pWKYl5mxQWzfJEMY3AMAFDriYEpPJg23bWLgbR2U+NCtUPboQLi2GmSwS3E25+jltZIu9mvcV3J
 TjXRvfKL38hhNFhfttjvzpJesdL3KIuM9qDrUNJR8SYLMRFYzEHs04jn66EeUYq/O3PCpU0hhGn
 Bj0+0FKxUoR3VI8d6CGBUslT8wCtMbk8P73E9pvJhoUt4Iehzfh7WzPcaaxXYVagN3gOH447JmY
 htmZRnMXQJ92x5/FaUiX0YxbXu5dhuYNUTOkda7s8yXwG+GeuFSXX5uLeyxrncWRKVXQFuogki0
 S33kv+GGreSMUeOjvjkgvFpB3fbgayPpH9loa+ObtF+I96raS930Fkjy6XIZQczZwx5Qv967Vdl
 CVJaFE8USTC1drA9jOuRpscqPQBOjcU9fXO1ScoS4xsSR+0aP9RmNpqU21+DvN2tTz4X2qQshZR
 l9U4QKuWNCmiD5Q==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvledvtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopegludelvddrudeikedruddrvdejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmp
 dhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 75 ++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 261e822e9618..8ecd75d063f4 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -485,35 +485,56 @@ READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
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
@@ -713,7 +734,7 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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

