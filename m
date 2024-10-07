Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA709932A7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BBB10E3CE;
	Mon,  7 Oct 2024 16:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oVxqhAfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A3610E3CD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:10:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A9774000B;
 Mon,  7 Oct 2024 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728317452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KPJGKEsxz1PC1IeGIUlzazKnNt9mMdttLIEPvXgoXtI=;
 b=oVxqhAfPIOCzmFjDdaDrfmmjP5aMK51/YiyaksZxASCYsGQPMr29bB29fOGsSZlcg8bHEU
 H5KSNJ31/bXygqiySRRAGTFfnPScR+kAMl5W6sgbImbjfQBoIPrkA4yWqlI/N8+6ERszC7
 sTIf7F3y3K1DSBsWqR9uLZKNmFdmyL1lXI8f+pF3LYe9fUMb29BDzaRgkB5dX1QhVY1XgZ
 9/UlTuCXCoRgb9qF6uM/rzMyz1O6A0Ts13tex/IbfyyScEWVSsXAg/IC2tmvpdc8HzSWti
 WTG6KO+bIovpYEmHY/43hxLaKja4Zak+XmPgXP4UuOoChEP6T8UojEwUph9NAA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 07 Oct 2024 18:10:39 +0200
Subject: [PATCH v12 05/15] drm/vkms: Update pixels accessor to support
 packed and multi-plane formats.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-yuv-v12-5-01c1ada6fec8@bootlin.com>
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
In-Reply-To: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8793;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=WSLobhH0HgpInydxPdlo3xquv0fIb51hh/0x7kvEA8g=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnBAgBLripcF+tWUZzOKYA401fce4MkNbijGkkC
 DyWWG2qu/iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwQIAQAKCRAgrS7GWxAs
 4n+TD/4zdTLElq3vgh03E++B482DDfBaEta5ztE1hlN0XpVhthYw7yDH8OfxkdX0X5PgawybHx3
 V2GlY9vdVPrbRf7NiREj2sd0FkzgW6cifKcKgCEtTHMDI/BVOF1N8L6n+Kb2OmjiKHvs1sObJ29
 2s9AKLbc+h9V/gq6mcT2tB+fVDZvIJWt3NkFHN7WRfseJ6k5+0zSHI/8x2LaRZppXPrpspM3L0i
 ZqQ6djDSwoLfYDNm0JyZABpgL7rV0CFWJYMp0JCE3yqCS3GiFrsHycdMcG8+VppBmQTslChu1oh
 krWP/JGSvKH9R1EMVnf7WXNT5+SSyFCnTlQfoMGxFn1+U/s7XFvbPxvjIgx9vK7lbUe8ADSUn1f
 ceBoem7eJujUB3ib7Sd0Qpf+Rt2pj+MpjV1h7iBzQKBEwt4hTTBvTfIGKluahxx40/3mMlObENi
 B8AgK0RqEyKmQHJ3Dcx08E/pjR4VeUDxEqKyPbhSgSms/wtQ6sFyEsa6Kx+ZQ1vTtyYsCIAJ8zm
 D30dL19RxKt69QZgP2oECoNqtt76T/o22XKw6+pu2wewSiAuomM4lsMPkwq9SriF//TJaoYzfPL
 /SN4hxYQBfDfUFvu9f+8XAvsJNpVX5tLp/6c2ETfImq6BUYGHY8wvAE+s8Sh5qhhJlAg66wcSNR
 zVenD89Yolas7sQ==
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
 drivers/gpu/drm/vkms/vkms_formats.c | 114 ++++++++++++++++++++++++++++--------
 1 file changed, 91 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 06aef5162529..7f932d42394d 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -10,22 +10,46 @@
 #include "vkms_formats.h"
 
 /**
- * pixel_offset() - Get the offset of the pixel at coordinates x/y in the first plane
+ * packed_pixels_offset() - Get the offset of the block containing the pixel at coordinates x/y
  *
  * @frame_info: Buffer metadata
  * @x: The x coordinate of the wanted pixel in the buffer
  * @y: The y coordinate of the wanted pixel in the buffer
+ * @plane_index: The index of the plane to use
+ * @offset: The returned offset inside the buffer of the block
+ * @rem_x: The returned X coordinate of the requested pixel in the block
+ * @rem_y: The returned Y coordinate of the requested pixel in the block
  *
- * The caller must ensure that the framebuffer associated with this request uses a pixel format
- * where block_h == block_w == 1.
- * If this requirement is not fulfilled, the resulting offset can point to an other pixel or
- * outside of the buffer.
+ * As some pixel formats store multiple pixels in a block (DRM_FORMAT_R* for example), some
+ * pixels are not individually addressable. This function return 3 values: the offset of the
+ * whole block, and the coordinate of the requested pixel inside this block.
+ * For example, if the format is DRM_FORMAT_R1 and the requested coordinate is 13,5, the offset
+ * will point to the byte 5*pitches + 13/8 (second byte of the 5th line), and the rem_x/rem_y
+ * coordinates will be (13 % 8, 5 % 1) = (5, 0)
+ *
+ * With this function, the caller just have to extract the correct pixel from the block.
  */
-static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
+static void packed_pixels_offset(const struct vkms_frame_info *frame_info, int x, int y,
+				 int plane_index, int *offset, int *rem_x, int *rem_y)
 {
 	struct drm_framebuffer *fb = frame_info->fb;
+	const struct drm_format_info *format = frame_info->fb->format;
+	/* Directly using x and y to multiply pitches and format->ccp is not sufficient because
+	 * in some formats a block can represent multiple pixels.
+	 *
+	 * Dividing x and y by the block size allows to extract the correct offset of the block
+	 * containing the pixel.
+	 */
 
-	return fb->offsets[0] + (y * fb->pitches[0]) + (x * fb->format->cpp[0]);
+	int block_x = x / drm_format_info_block_width(format, plane_index);
+	int block_y = y / drm_format_info_block_height(format, plane_index);
+	int block_pitch = fb->pitches[plane_index] * drm_format_info_block_height(format,
+										  plane_index);
+	*rem_x = x % drm_format_info_block_width(format, plane_index);
+	*rem_y = y % drm_format_info_block_height(format, plane_index);
+	*offset = fb->offsets[plane_index] +
+		  block_y * block_pitch +
+		  block_x * format->char_per_block[plane_index];
 }
 
 /**
@@ -35,30 +59,71 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
  * @frame_info: Buffer metadata
  * @x: The x (width) coordinate inside the plane
  * @y: The y (height) coordinate inside the plane
+ * @plane_index: The index of the plane
+ * @addr: The returned pointer
+ * @rem_x: The returned X coordinate of the requested pixel in the block
+ * @rem_y: The returned Y coordinate of the requested pixel in the block
  *
- * Takes the information stored in the frame_info, a pair of coordinates, and
- * returns the address of the first color channel.
- * This function assumes the channels are packed together, i.e. a color channel
- * comes immediately after another in the memory. And therefore, this function
- * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
+ * Takes the information stored in the frame_info, a pair of coordinates, and returns the address
+ * of the block containing this pixel and the pixel position inside this block.
  *
- * The caller must ensure that the framebuffer associated with this request uses a pixel format
- * where block_h == block_w == 1, otherwise the returned pointer can be outside the buffer.
+ * See @packed_pixel_offset for details about rem_x/rem_y behavior.
  */
-static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
-				int x, int y)
+static void packed_pixels_addr(const struct vkms_frame_info *frame_info,
+			       int x, int y, int plane_index, u8 **addr, int *rem_x,
+			       int *rem_y)
 {
-	size_t offset = pixel_offset(frame_info, x, y);
+	int offset;
 
-	return (u8 *)frame_info->map[0].vaddr + offset;
+	packed_pixels_offset(frame_info, x, y, plane_index, &offset, rem_x, rem_y);
+	*addr = (u8 *)frame_info->map[0].vaddr + offset;
 }
 
-static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y)
+/**
+ * packed_pixels_addr_1x1() - Get the pointer to the block containing the pixel at the given
+ * coordinates
+ *
+ * @frame_info: Buffer metadata
+ * @x: The x (width) coordinate inside the plane
+ * @y: The y (height) coordinate inside the plane
+ * @plane_index: The index of the plane
+ * @addr: The returned pointer
+ *
+ * This function can only be used with format where block_h == block_w == 1.
+ */
+static void packed_pixels_addr_1x1(const struct vkms_frame_info *frame_info,
+				   int x, int y, int plane_index, u8 **addr)
+{
+	int offset, rem_x, rem_y;
+
+	WARN_ONCE(drm_format_info_block_width(frame_info->fb->format,
+					      plane_index) != 1,
+		"%s() only support formats with block_w == 1", __func__);
+	WARN_ONCE(drm_format_info_block_height(frame_info->fb->format,
+					       plane_index) != 1,
+		"%s() only support formats with block_h == 1", __func__);
+
+	packed_pixels_offset(frame_info, x, y, plane_index, &offset, &rem_x,
+			     &rem_y);
+	*addr = (u8 *)frame_info->map[0].vaddr + offset;
+}
+
+static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y,
+				 int plane_index)
 {
 	int x_src = frame_info->src.x1 >> 16;
 	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
+	u8 *addr;
+	int rem_x, rem_y;
+
+	WARN_ONCE(drm_format_info_block_width(frame_info->fb->format, plane_index) != 1,
+		  "%s() only support formats with block_w == 1", __func__);
+	WARN_ONCE(drm_format_info_block_height(frame_info->fb->format, plane_index) != 1,
+		  "%s() only support formats with block_h == 1", __func__);
 
-	return packed_pixels_addr(frame_info, x_src, y_src);
+	packed_pixels_addr(frame_info, x_src, y_src, plane_index, &addr, &rem_x, &rem_y);
+
+	return addr;
 }
 
 static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
@@ -152,14 +217,14 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
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
@@ -250,7 +315,10 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 {
 	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
 	int x_dst = frame_info->dst.x1;
-	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	u8 *dst_pixels;
+	int rem_x, rem_y;
+
+	packed_pixels_addr(frame_info, x_dst, y, 0, &dst_pixels, &rem_x, &rem_y);
 	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
 	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
 

-- 
2.46.2

