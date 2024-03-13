Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A60387ADE8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F7F10F803;
	Wed, 13 Mar 2024 17:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eVzik8fQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A1210F68A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:45:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B77414000E;
 Wed, 13 Mar 2024 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710351930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UoEJVitgQdwqzYit9x2fRkuhzwqFW+P/Z98aACWVEW8=;
 b=eVzik8fQzGYjawRO9Sn1n9s5VuViJ9xpzeYO3sPFUshXW8W8nh3N0irSYQa/Ro+RKW0c43
 IuYQfuvaOmXoU7o6QaO+uPpoA8y2uNWEvIaKpoAYsPzwwn/KeagBfK6VvE34NBb2ezSfQo
 XGVo92iJyYw+ytHy9rnixtNYP8kfVfgBrGLL1duOX1LCNvQ/Cv88+g6uD9uYx1LDhwSLAs
 Yuk5ZWYL9bk5OND1S+3T7laZ80/QiHXC6IFQADDgFfPILbNnnbRkflGmqKpvtbyaRqRSnW
 oaLJinTX+N20fI6oXnbae2Bn98HkSlip84mA2A8DeTyGMZaE736pe4FOAcOkUg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 13 Mar 2024 18:44:57 +0100
Subject: [PATCH v5 03/16] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-yuv-v5-3-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
In-Reply-To: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
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
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8eYyB27ZkpYgLBf21H0iKy6EBIryIehZr58AzJeb
 V7KqS4GJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHmMgAKCRAgrS7GWxAs4lzMEA
 CxE4OiYkGOSeLG6XXWBHZsX7a7hIGBAN7TUS3URfZfwWwF0OtCz76VyXrCF/DpYhuPhYw+xEp8uIpk
 pGsJ4SO7/BGHz35rfvB7MnpNi6MmQadszHizMyAmwSAqA+fn3Q8G4VFWNPydI4nuPQOD6lbS2YBOkj
 sYVI8XjX8u98PFrVanNQI91dUAtKK4LiIxHR0PztbopCja6UgEVb4vRgQZwdJ8vk/53+zAmlBEGnr2
 ymQD9Jgam4SmAJfxtI4O6mnKEG8Up48oqRgQ4GqmHsHw3OjuAoAEMFkjuYNGllKqQSU1J/ssQGOwfd
 O9RZiOXfPr2sBzNqEkhh3i6ZNld0Rf3Wp8FhKVSYUXao/viRO0DUBkpgiUefXqxWJIwc6AU/AwrQVe
 9H9AIfSg7o0VafbdrH4sdajxj/e9E7S99EyH0PQi16iMw9ocd7ZhWoUu9icf7QFrec4BJjSdB0iGW3
 lrJgfB1X9l5cg+K4fY4OeivspK4YJi+7FzhwfccKdDiKLtmXYpfFMq/M5d30Fwt2+SWz4qBSPl5XxO
 qzeFoZi+as/1RxClV06mtuL8X5FSWb0OysCEMC/vtpfRtg5M3lq6L2T0zTpZITT+/MFb5Q/3+8rFoS
 a1DDNzBnkBHc3Qcu1DGTtS7LbpZiI7QWZxyPMblLHjAUBiaOjC9ah8VIx5Ig==
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

