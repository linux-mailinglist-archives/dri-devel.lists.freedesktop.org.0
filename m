Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A730687056D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2A211227C;
	Mon,  4 Mar 2024 15:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="A40f85aL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30DA11228A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:29:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB8EB1C0003;
 Mon,  4 Mar 2024 15:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709566162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UoEJVitgQdwqzYit9x2fRkuhzwqFW+P/Z98aACWVEW8=;
 b=A40f85aLh9dvPmu6NQ4HVs515kE5Vo2AFNqoZxD0H8wTrxVzZg1IfGJ24QMKN9cQZCOBSZ
 8QdfhBf7wYlU2xvmJkwxGOa/tYr7IVHuhE6aIT5varV4B5PqeOB96jt6ojN9MZLP/etuAY
 sH0ZA76Fr00Zhu3N+YCTvcY4Yl/4jeJrjv20NvU7Tzia0cyQkcYH/k8SHm4X6UQefUGLSs
 hn1pzeD2H08eiLA3igrkkM1lvV8npLX+FQr+3l/vDKGSEj60htcQd4YP1MkrVp8397y8/H
 tDrHvgMEXetGeNVL3i4NK/+LVKc1NS1+8me7N1E3jh3Uk2CntdaPXdTpcUPAGA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 04 Mar 2024 16:28:08 +0100
Subject: [PATCH v4 03/14] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-yuv-v4-3-76beac8e9793@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7282;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=rAa69AVNvXwStTD/zFUG8N7xq95vym8ycf+nNk+Pqpg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl5ejLsCb3xgbo3eBxhb/+Zom9MLwlxhoqz5/HCrlI
 1rnOZ76JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeXoywAKCRAgrS7GWxAs4iiMD/
 9ihUJJRxg0jAcIVdcO+M/zG6DiWT7lXk6c4RZ1s2knRRgJlGyx1T3UfZl8PxTIDo+UFkMqDvcCHF9N
 VgdhgEmzOyQTEWPhPMP/1B4MrX1GPWUuR0KQBVW3fcXVQMtef5jt19v3FOPrN2/TM4fCZo7iw7p1Ed
 SGseHVUfeBWuc3wXA5xbdNezswG3daF89bhm3mgQ+OjKnopkC9IvHGObxNFKvdNMMSSQIJZlhrpna8
 Ic7KeSBmvIspO5vulIkMtKLE/a2jErY4bd1sDMW3knlRp0Hy72XpkjGOLxEvWHkKffM2qXjDr2i9Lt
 f5N/r8NJpUET2f7dqCwH512eExZB1yjZeVrZvff2UGV3Ivz17ZmUIho621jGi3vYAySRI3QKfz+CKg
 LWXSKpS0UGHTWKWn5m4ezAr48ImFzGcSFrpSV8izhIg6fsp2ygAZG4rbtCiKJ4kQnfFgTPYgJ7Z8Bt
 qmlYsSSXfqXCZcfZ+qwbSy1OAExrj845GIqHI3KnZJk1iD8x4NVnbF0Bjwyt/390QewsuqWbZs0yk+
 tgtMsah/IribpsJ+g/4NAqtUM+Z9HUuhZNQtzthH2XY90zFA84gVYdM8OK3hSGvabY4tv4JQis87SH
 lSnlGCOlLzAuO2uLPkZYLYZq08bAEQ+L3C23Dgk3lj+BAyUsxyed7miBHpIg==
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

Add some documentation on pixel conversion functions.
Update of outdated comments for pixel_write functions.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c |  7 ++++
 drivers/gpu/drm/vkms/vkms_drv.h      | 13 ++++++++
 drivers/gpu/drm/vkms/vkms_formats.c  | 62 ++++++++++++++++++++++++++++++------
 3 files changed, 73 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index c6d9b4a65809..da0651a94c9b 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -189,6 +189,13 @@ static void blend(struct vkms_writeback_job *wb,
 
 	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
 
+	/*
+	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
+	 * complexity to avoid poor blending performance.
+	 *
+	 * The function vkms_compose_row is used to read a line, pixel-by-pixel, into the staging
+	 * buffer.
+	 */
 	for (size_t y = 0; y < crtc_y_limit; y++) {
 		fill_background(&background_color, output_buffer);
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index b4b357447292..18086423a3a7 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -25,6 +25,17 @@
 
 #define VKMS_LUT_SIZE 256
 
+/**
+ * struct vkms_frame_info - structure to store the state of a frame
+ *
+ * @fb: backing drm framebuffer
+ * @src: source rectangle of this frame in the source framebuffer
+ * @dst: destination rectangle in the crtc buffer
+ * @map: see drm_shadow_plane_state@data
+ * @rotation: rotation applied to the source.
+ *
+ * @src and @dst should have the same size modulo the rotation.
+ */
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
@@ -52,6 +63,8 @@ struct vkms_writeback_job {
  * vkms_plane_state - Driver specific plane state
  * @base: base plane state
  * @frame_info: data required for composing computation
+ * @pixel_read: function to read a pixel in this plane. The creator of a vkms_plane_state must
+ * ensure that this pointer is valid
  */
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 172830a3936a..6e3dc8682ff9 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -9,6 +9,18 @@
 
 #include "vkms_formats.h"
 
+/**
+ * pixel_offset() - Get the offset of the pixel at coordinates x/y in the first plane
+ *
+ * @frame_info: Buffer metadata
+ * @x: The x coordinate of the wanted pixel in the buffer
+ * @y: The y coordinate of the wanted pixel in the buffer
+ *
+ * The caller must ensure that the framebuffer associated with this request uses a pixel format
+ * where block_h == block_w == 1.
+ * If this requirement is not fulfilled, the resulting offset can point to an other pixel or
+ * outside of the buffer.
+ */
 static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
 {
 	struct drm_framebuffer *fb = frame_info->fb;
@@ -17,18 +29,22 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
 			      + (x * fb->format->cpp[0]);
 }
 
-/*
- * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
+/**
+ * packed_pixels_addr() - Get the pointer to the block containing the pixel at the given
+ * coordinates
  *
  * @frame_info: Buffer metadata
- * @x: The x(width) coordinate of the 2D buffer
- * @y: The y(Heigth) coordinate of the 2D buffer
+ * @x: The x(width) coordinate inside the plane
+ * @y: The y(height) coordinate inside the plane
  *
  * Takes the information stored in the frame_info, a pair of coordinates, and
  * returns the address of the first color channel.
  * This function assumes the channels are packed together, i.e. a color channel
  * comes immediately after another in the memory. And therefore, this function
  * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
+ *
+ * The caller must ensure that the framebuffer associated with this request uses a pixel format
+ * where block_h == block_w == 1, otherwise the returned pointer can be outside the buffer.
  */
 static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
 				int x, int y)
@@ -53,6 +69,13 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
 	return x;
 }
 
+/*
+ * The following  functions take pixel data from the buffer and convert them to the format
+ * ARGB16161616 in out_pixel.
+ *
+ * They are used in the `vkms_compose_row` function to handle multiple formats.
+ */
+
 static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
 	/*
@@ -145,12 +168,11 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 }
 
 /*
- * The following  functions take an line of argb_u16 pixels from the
- * src_buffer, convert them to a specific format, and store them in the
- * destination.
+ * The following functions take one argb_u16 pixel and convert it to a specific format. The
+ * result is stored in @dst_pixels.
  *
- * They are used in the `compose_active_planes` to convert and store a line
- * from the src_buffer to the writeback buffer.
+ * They are used in the `vkms_writeback_row` to convert and store a pixel from the src_buffer to
+ * the writeback buffer.
  */
 static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
@@ -216,6 +238,14 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
+/**
+ * Generic loop for all supported writeback format. It is executed just after the blending to
+ * write a line in the writeback buffer.
+ *
+ * @wb: Job where to insert the final image
+ * @src_buffer: Line to write
+ * @y: Row to write in the writeback buffer
+ */
 void vkms_writeback_row(struct vkms_writeback_job *wb,
 			const struct line_buffer *src_buffer, int y)
 {
@@ -229,6 +259,13 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 		wb->pixel_write(dst_pixels, &in_pixels[x]);
 }
 
+/**
+ * Retrieve the correct read_pixel function for a specific format.
+ * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
+ * pointer is valid before using it in a vkms_plane_state.
+ *
+ * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
+ */
 void *get_pixel_conversion_function(u32 format)
 {
 	switch (format) {
@@ -247,6 +284,13 @@ void *get_pixel_conversion_function(u32 format)
 	}
 }
 
+/**
+ * Retrieve the correct write_pixel function for a specific format.
+ * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
+ * pointer is valid before using it in a vkms_writeback_job.
+ *
+ * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
+ */
 void *get_pixel_write_function(u32 format)
 {
 	switch (format) {

-- 
2.43.0

