Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE1B870572
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA701122A3;
	Mon,  4 Mar 2024 15:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SGnKRm17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B36311228A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:29:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD57E1C0005;
 Mon,  4 Mar 2024 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709566166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkMA90xZNbAtS5RoA+EDPhLYGxyx6rZctamxCUhrcic=;
 b=SGnKRm17Zx46uCAKdiTDmu/qAN/XtL96BcTrAC1bWB7ZnvOBwmKWs1MZz2QPJcMLknjJMh
 36o46HveSFxrg3CJl2FVwp3K5Aicl0s4kQqEtbeaVlvr4xwOJnEugokcBdiPCsXfsBQRvW
 7vwAUJT7RXVCGzjJCbdTo+enZXXo05+2OY3bSHK2ANQc9a9hZ5t90DA5QxUhxCwlEm/m86
 8pIWv8GQJ+zsL4hwu0KYAz+SOoqqGX/VDs4KcjSrQ5Hk8whMfCAAanhhtYKfCY2YXoCcM6
 5RgZ/UJy9+9NUD4V1w+yQTwWY6ehW8UkRVlIDdUa44enrZEKkmXuQFedT0x3+w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 04 Mar 2024 16:28:12 +0100
Subject: [PATCH v4 07/14] drm/vkms: Update pixels accessor to support
 packed and multi-plane formats.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-yuv-v4-7-76beac8e9793@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6343;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=JIoXrYSBgeg0QLNIPh8bxgpI6Eagu1fkt6Zjo95AAXg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl5ejLB5olR9HyMbIVafJg3K0bne07ZtxNWsInxYTw
 m3vcOXWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeXoywAKCRAgrS7GWxAs4qKkD/
 9uf7hPdWfm5uXVdtNAAm/Bml6Jt6c7eKPIqp0WVrbVRfu9v2xKRE0pAJTzj+ZcmyNfPcPbp89b8Wly
 5eQNEXrjxhaIHFm2dgTOw6cOX5hLtWhhpLs6tYxpF6Lu9WXmpUhYDJVWqj9xwtgrrkLZ2jmQmSQjxS
 +eUyFtKGrMdN1BuCw3Dw2Hz4llqIny8G7McEVmcNspkvM/jwY3j77jm5zSO1JZ4kI/jtTFLOTmC3D4
 oRSWZ6G92hKalEh1XHHrWlsAF0x0335u7q1cU61YZHURZuP+VIXPMtP2DT98DnlSk1RGUUeW64SGkt
 wOW0f79Ka4sg0xHFcrg3Nz3hULmSCQ5Nf4wUYp/zJ03Y+8JeEDcwh/2oyjE+4xnNl4JXhjan1JvSnZ
 J3dXLDLW6LDTBtRtappU5swFvgOsXtJQAQPS0JOxeSB2ZeVK1hgITV08YNA/dQz2gFbcg2Uk0bKaCU
 MLMQkOTJaNQJo0pJRCT0H4WYYSoKY7bOi5OFqgftXg6sf2JvM+hWk7Qr4ZkO5LAQpl0LzzHLcU1Qif
 YRPrfME2K5OT+pjHGOmin0As6MxALomwJFKod5WloVRoLWg2CLZxuQfimfoX7GPHT6fyyNItNmtS0K
 RItClVkD503P6MG9s+X1yGfGsWpXHE5Lc9W6COs9kjhbOTlGBb6a6LNyoSug==
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

Introduce the usage of block_h/block_w to compute the offset and the
pointer of a pixel. The previous implementation was specialized for
planes with block_h == block_w == 1. To avoid confusion and allow easier
implementation of tiled formats. It also remove the usage of the
deprecated format field `cpp`.

Introduce the plane_index parameter to get an offset/pointer on a
different plane.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 59 +++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index bdd15964ce24..089e4bdd5da8 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -10,23 +10,33 @@
 #include "vkms_formats.h"
 
 /**
- * pixel_offset() - Get the offset of the pixel at coordinates x/y in the first plane
+ * packed_pixels_offset() - Get the offset of the block containing the pixel at coordinates x/y
  *
  * @frame_info: Buffer metadata
  * @x: The x coordinate of the wanted pixel in the buffer
  * @y: The y coordinate of the wanted pixel in the buffer
+ * @plane_index: The index of the plane to use
  *
- * The caller must ensure that the framebuffer associated with this request uses a pixel format
- * where block_h == block_w == 1.
- * If this requirement is not fulfilled, the resulting offset can point to an other pixel or
- * outside of the buffer.
+ * The returned offset correspond to the offset of the block containing the pixel at coordinates
+ * x/y.
+ * The caller must use this offset with care, as for formats with block_h != 1 or block_w != 1
+ * the requested pixel value may have to be extracted from the block, even if they are
+ * individually addressable.
  */
-static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
+static size_t packed_pixels_offset(const struct vkms_frame_info *frame_info, int x, int y,
+				   size_t plane_index)
 {
 	struct drm_framebuffer *fb = frame_info->fb;
-
-	return fb->offsets[0] + (y * fb->pitches[0])
-			      + (x * fb->format->cpp[0]);
+	const struct drm_format_info *format = frame_info->fb->format;
+	/* Directly using x and y to multiply pitches and format->ccp is not sufficient because
+	 * in some formats a block can represent multiple pixels.
+	 *
+	 * Dividing x and y by the block size allows to extract the correct offset of the block
+	 * containing the pixel.
+	 */
+	return fb->offsets[plane_index] +
+	       (y / drm_format_info_block_width(format, plane_index)) * fb->pitches[plane_index] +
+	       (x / drm_format_info_block_height(format, plane_index)) * format->char_per_block[plane_index];
 }
 
 /**
@@ -36,30 +46,29 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
  * @frame_info: Buffer metadata
  * @x: The x(width) coordinate inside the plane
  * @y: The y(height) coordinate inside the plane
+ * @plane_index: The index of the plane
  *
- * Takes the information stored in the frame_info, a pair of coordinates, and
- * returns the address of the first color channel.
- * This function assumes the channels are packed together, i.e. a color channel
- * comes immediately after another in the memory. And therefore, this function
- * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
+ * Takes the information stored in the frame_info, a pair of coordinates, and returns the address
+ * of the block containing this pixel.
  *
- * The caller must ensure that the framebuffer associated with this request uses a pixel format
- * where block_h == block_w == 1, otherwise the returned pointer can be outside the buffer.
+ * The returned pointer points to the block containing the pixel at coordinates x/y.
+ * The caller must use this pointer with care, as for formats with block_h != 1 or block_w != 1
+ * the requested pixel may have to be extracted from the block, even if they are
+ * individually addressable.
  */
 static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
-				int x, int y)
+				int x, int y, size_t plane_index)
 {
-	size_t offset = pixel_offset(frame_info, x, y);
-
-	return (u8 *)frame_info->map[0].vaddr + offset;
+	return (u8 *)frame_info->map[0].vaddr + packed_pixels_offset(frame_info, x, y, plane_index);
 }
 
-static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y)
+static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y,
+				 size_t plane_index)
 {
 	int x_src = frame_info->src.x1 >> 16;
 	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
 
-	return packed_pixels_addr(frame_info, x_src, y_src);
+	return packed_pixels_addr(frame_info, x_src, y_src, plane_index);
 }
 
 static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
@@ -168,14 +177,14 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 {
 	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
 	struct vkms_frame_info *frame_info = plane->frame_info;
-	u8 *src_pixels = get_packed_src_addr(frame_info, y);
+	u8 *src_pixels = get_packed_src_addr(frame_info, y, 0);
 	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
 
 	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
 		int x_pos = get_x_position(frame_info, limit, x);
 
 		if (drm_rotation_90_or_270(frame_info->rotation))
-			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
+			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1, 0)
 				+ frame_info->fb->format->cpp[0] * y;
 
 		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
@@ -275,7 +284,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 {
 	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
 	int x_dst = frame_info->dst.x1;
-	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y, 0);
 	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
 	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
 

-- 
2.43.0

