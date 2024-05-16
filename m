Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147ED8C7720
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE62310ECFD;
	Thu, 16 May 2024 13:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="C9sDAqaJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11F210ECF2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:05:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 984CBC000C;
 Thu, 16 May 2024 13:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715864717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JU70LQ2hauNfhx679Y3SR3BcbT+dXuqlkcXNRSkyY1c=;
 b=C9sDAqaJdH1IBmwXWy93kmup61xsPZRYc4IE9phOlaaRV2cb8u2jYJikAPc5hWTH+bzRTx
 FuoYcEiqT3CIEusFNME29gSuih4xqDqGYdhOr0PC7itlLqeNDUDPnu714TDLBgxKgZskFq
 FEvSuwwfwdReABd1/xCpgGYFJESZEqamQR0aliYM7P6wcrBZzVwrro6VNNfxUd7LR1iSe5
 7JNNi2VDuL7jiBF04hsZ3whGrnYHd47R3jWdpDK1Qz8tFBBVFHgOaIzAEnb2UU2vsmVz/8
 ljcR3Y9oxXHjO9wLY6FBtIqV2JofS/qXh4H63qHLcplhFPZ0MQr78HWOOC9KVA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 May 2024 15:04:48 +0200
Subject: [PATCH v8 03/17] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-yuv-v8-3-cf8d6f86430e@bootlin.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7606;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=W3Xf/YRK4t0P56bphLku13mwMBOBKsgILXEVbb87DhM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRgSAwHdmeMySONtGUfTAx5G2kyu7h5HW0koGL
 CMJcwB0tPuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYEgAAKCRAgrS7GWxAs
 4rleEADXaL4rtS9H27rZ+nR5zw7H30tpf9+H0xzo7WRe4thUacmNDhvLVpxF3KOOpI6vJw8TMUK
 TuureaJ7pxZkJSm1iIhDS/zT2Ze1F/jjh2Qdoipcg9r+sA+WIuLB9B1wwYpobW5lcp3KzlMskcK
 buTGO04qxQ229YPH2UhGl4PH01CsB/KHP0DqTl+9cFH0Q7YHVqNOEmhQUiTDccDalI3HXVPVbj5
 VAvj9TTobCo7NWo+H0NBJpn6bvXcltTenBJLERUQ+6e/hmpqCXGWDRIWVCS071mTfaf172CcwVq
 95Mr4rxz6+ImlLxjWHJZjqPdHUM1nFQM2qBK+z2NoCsWvZkSBiE1hROSdWsADJ0H9AFJGG/Gm/2
 pHT/o84oTSfRH1F9/uxDr0TE9O6+iFnWNu4wh/z/tCZVvUaNUMmyPBj88lWl88zqRYusvWby3Og
 IUsiA7RnFcA5nwq6u7GSIyDfDBQ/K7Fyh2eu0NjkjI3ac0e4vBFXXppstA9zDUBDVjY9g3oHJ/0
 SAlZ0Q4ey7k7paR8Cf5PMPrUOcDu6b7iMZLPONJKhKqjd/bEggZ5NAW48h2dXR+LyzhVrxPzmy9
 Q6sJs7Sn6rylrzWAblGQ2CEJeAHo4vP3/jXMimd0JZayRdTOsyHgqrKvTPg/0zOczeq5jPNazBr
 ylI0/zOQ8PnHG6A==
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
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c |  7 ++++
 drivers/gpu/drm/vkms/vkms_drv.h      | 15 ++++++++-
 drivers/gpu/drm/vkms/vkms_formats.c  | 62 ++++++++++++++++++++++++++++++------
 3 files changed, 74 insertions(+), 10 deletions(-)

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
index b4b357447292..212f4ab6a71f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -25,6 +25,17 @@
 
 #define VKMS_LUT_SIZE 256
 
+/**
+ * struct vkms_frame_info - structure to store the state of a frame
+ *
+ * @fb: backing drm framebuffer
+ * @src: source rectangle of this frame in the source framebuffer, stored in 16.16 fixed-point form
+ * @dst: destination rectangle in the crtc buffer, stored in whole pixel units
+ * @map: see drm_shadow_plane_state@data
+ * @rotation: rotation applied to the source.
+ *
+ * @src and @dst should have the same size modulo the rotation.
+ */
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
@@ -49,9 +60,11 @@ struct vkms_writeback_job {
 };
 
 /**
- * vkms_plane_state - Driver specific plane state
+ * struct vkms_plane_state - Driver specific plane state
  * @base: base plane state
  * @frame_info: data required for composing computation
+ * @pixel_read: function to read a pixel in this plane. The creator of a vkms_plane_state must
+ * ensure that this pointer is valid
  */
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index d597c48452ac..f157c43da4d6 100644
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
@@ -16,18 +28,22 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
 	return fb->offsets[0] + (y * fb->pitches[0]) + (x * fb->format->cpp[0]);
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
+ * @x: The x (width) coordinate inside the plane
+ * @y: The y (height) coordinate inside the plane
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
@@ -52,6 +68,13 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
 	return x;
 }
 
+/*
+ * The following functions take pixel data from the buffer and convert them to the format
+ * ARGB16161616 in out_pixel.
+ *
+ * They are used in the vkms_compose_row() function to handle multiple formats.
+ */
+
 static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
 	/*
@@ -144,12 +167,11 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 }
 
 /*
- * The following  functions take an line of argb_u16 pixels from the
- * src_buffer, convert them to a specific format, and store them in the
- * destination.
+ * The following functions take one &struct pixel_argb_u16 and convert it to a specific format.
+ * The result is stored in @dst_pixels.
  *
- * They are used in the `compose_active_planes` to convert and store a line
- * from the src_buffer to the writeback buffer.
+ * They are used in vkms_writeback_row() to convert and store a pixel from the src_buffer to
+ * the writeback buffer.
  */
 static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
@@ -215,6 +237,14 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
+/**
+ * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
+ * after the blending to write a line in the writeback buffer.
+ *
+ * @wb: Job where to insert the final image
+ * @src_buffer: Line to write
+ * @y: Row to write in the writeback buffer
+ */
 void vkms_writeback_row(struct vkms_writeback_job *wb,
 			const struct line_buffer *src_buffer, int y)
 {
@@ -228,6 +258,13 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 		wb->pixel_write(dst_pixels, &in_pixels[x]);
 }
 
+/**
+ * get_pixel_conversion_function() - Retrieve the correct read_pixel function for a specific
+ * format. The returned pointer is NULL for unsupported pixel formats. The caller must ensure that
+ * the pointer is valid before using it in a vkms_plane_state.
+ *
+ * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
+ */
 void *get_pixel_conversion_function(u32 format)
 {
 	switch (format) {
@@ -246,6 +283,13 @@ void *get_pixel_conversion_function(u32 format)
 	}
 }
 
+/**
+ * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
+ * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
+ * pointer is valid before using it in a vkms_writeback_job.
+ *
+ * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
+ */
 void *get_pixel_write_function(u32 format)
 {
 	switch (format) {

-- 
2.43.2

