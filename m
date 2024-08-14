Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442695175C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 11:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB4810E441;
	Wed, 14 Aug 2024 09:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="k8XgZP6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC0F10E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 09:09:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2AE1E0002;
 Wed, 14 Aug 2024 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723626539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gOZFHW+W/DVmEYqLRNmRdAR4MlZjPTzw/O+T3sV03RE=;
 b=k8XgZP6SMwBrFMhCZAbcTGaM/z8hgEN4JrPtL9ijO5frLiUydr/5Aq2Di2tmlSgSQXhIM4
 iYUENN3GA2lBScBFT3x6EHP/aGdVyZto95bL42qgWwYzAKX+EPecm+y3xnKlRxo2vEs8NL
 sFORunG6yAXm2J+creeoIl+G0ABPlyq/dJnGBdJZSkOGPciX92wBdI/I5A220acoxuBL8Y
 /QtY+aSl6SGklzYPtlGG0B3E2xlSygxnCkOV3WMtvTCSbI4bH23fzAh+bSeN0viyF5xu9n
 O+bh0xgtZh2XYUmolKHnmS/160ksW0dQNeTH7uE8QuLSU4dZVPzIBXUIcV/jKg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 11:08:54 +0200
Subject: [PATCH RFC 1/6] drm/vkms: Properly extract vkms_formats header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-split-headers-v1-1-51712f088f5d@bootlin.com>
References: <20240814-google-split-headers-v1-0-51712f088f5d@bootlin.com>
In-Reply-To: <20240814-google-split-headers-v1-0-51712f088f5d@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8030;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=wcn5rhlykOkvmwik/0bRg72AOmiKANLOex5UmwYu3Ag=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvHQoqC6pywi1DFW1PbPfhsqUFJGOQ9t9E9B5h
 w3qXXFZGweJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrx0KAAKCRAgrS7GWxAs
 4gZJD/4sBFGVdOB/71UDrLopJkJUxFhcSOW/90xJKjReMnMHSzUaw3LAEM6BGlexyICZyQbcZWg
 6VQh/gUb87V05kCUxItGNeJlbbIErTHYOvlindlKPp0+m3pZGDzSPiJrTVMrdxUlNDyDhUjZxwM
 4xwfzA2QeYf0bhCZ65GDbEKSzZSPkUOlTLQWwgOhvVppsYcU8u5TkCVwL6jNzSkETK7NiexDJZF
 V5hmV1BlrU0N2AjJnariOlAFdnq4PDJ1Cte3W5ImgCbmuTGTwQ25xdQUixpEi8u0X0kWuiGdFe7
 SmEebxBD6DaZWG0sb2zLlwTUj2uOL6zmnfMGq+APSrBOPUkEI/R95vVFBO3Gc1gGWA1IAW/cjq6
 T3+5FapIsGQ4ah3wEb3h9I4Nv566qwLGET+SE3oam9zogqkMWzLLgfof5cHPgH2Ju7MOGyYpTH+
 Qr5bM35HbteFlBa9DDTVIYEkdLpjt0LlDaBfT+Lt/wOFeCQiGx8VYgtUKtoBJsZBW3BJ5CVWfak
 uMxgNHf7hWMviLHHxJQ0Gq/ZrNWxjSryp2eDnKxI30UeXUXOYbhA4yd8BOux3x2reH5SbM3iqGV
 +iFX+GQvl4Wnmotfiv9q5PETgmUFH/pwC6eaflYiLDSzpNXY9rgXoyngOnAdP00g8Y0Va2EAyqL
 89rpxsfBrJkFEyw==
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

The vkms_format.h header was already separated from vkms_drv.h, but some
function were missing. Move those function in vkms_format.h.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h     | 74 +---------------------------------
 drivers/gpu/drm/vkms/vkms_formats.c |  3 ++
 drivers/gpu/drm/vkms/vkms_formats.h | 80 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 84 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8f6c9e67e671..0db443924a15 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -12,6 +12,8 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_writeback.h>
 
+#include "vkms_formats.h"
+
 #define XRES_MIN    10
 #define YRES_MIN    10
 
@@ -43,29 +45,6 @@ struct vkms_frame_info {
 	unsigned int rotation;
 };
 
-struct pixel_argb_u16 {
-	u16 a, r, g, b;
-};
-
-struct line_buffer {
-	size_t n_pixels;
-	struct pixel_argb_u16 *pixels;
-};
-
-struct vkms_writeback_job;
-/**
- * typedef pixel_write_line_t - These functions are used to read a pixel line from a
- * struct pixel_argb_u16 buffer, convert it and write it in the @wb job.
- *
- * @wb: the writeback job to write the output of the conversion
- * @in_pixels: Source buffer containing the line to convert
- * @count: The width of a line
- * @x_start: The x (width) coordinate in the destination plane
- * @y_start: The y (height) coordinate in the destination plane
- */
-typedef void (*pixel_write_line_t)(struct vkms_writeback_job *wb,
-			      struct pixel_argb_u16 *in_pixels, int count, int x_start,
-			      int y_start);
 
 struct vkms_writeback_job {
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
@@ -73,53 +52,10 @@ struct vkms_writeback_job {
 	pixel_write_line_t pixel_write;
 };
 
-/**
- * enum pixel_read_direction - Enum used internaly by VKMS to represent a reading direction in a
- * plane.
- */
-enum pixel_read_direction {
-	READ_BOTTOM_TO_TOP,
-	READ_TOP_TO_BOTTOM,
-	READ_RIGHT_TO_LEFT,
-	READ_LEFT_TO_RIGHT
-};
 
 struct vkms_plane_state;
 
-/**
- * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
- * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
- *
- * @plane: plane used as source for the pixel value
- * @x_start: X (width) coordinate of the first pixel to copy. The caller must ensure that x_start
- * is non-negative and smaller than @plane->frame_info->fb->width.
- * @y_start: Y (height) coordinate of the first pixel to copy. The caller must ensure that y_start
- * is non-negative and smaller than @plane->frame_info->fb->height.
- * @direction: direction to use for the copy, starting at @x_start/@y_start
- * @count: number of pixels to copy
- * @out_pixel: pointer where to write the pixel values. They will be written from @out_pixel[0]
- * (included) to @out_pixel[@count] (excluded). The caller must ensure that out_pixel have a
- * length of at least @count.
- */
-typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_start,
-				  int y_start, enum pixel_read_direction direction, int count,
-				  struct pixel_argb_u16 out_pixel[]);
 
-/**
- * struct conversion_matrix - Matrix to use for a specific encoding and range
- *
- * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
- * used to compute rgb values from yuv values:
- *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
- *   OR for yvu formats:
- *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
- *  The values of the matrix are signed fixed-point values with 32 bits fractional part.
- * @y_offset: Offset to apply on the y value.
- */
-struct conversion_matrix {
-	s64 matrix[3][3];
-	int y_offset;
-};
 
 /**
  * struct vkms_plane_state - Driver specific plane state
@@ -140,12 +76,6 @@ struct vkms_plane {
 	struct drm_plane base;
 };
 
-struct vkms_color_lut {
-	struct drm_color_lut *base;
-	size_t lut_length;
-	s64 channel_value2index_ratio;
-};
-
 /**
  * struct vkms_crtc_state - Driver specific CRTC state
  *
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 65fdd3999441..5ab84801d8da 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -6,9 +6,12 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_fixed.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
 
 #include <kunit/visibility.h>
 
+#include "vkms_drv.h"
 #include "vkms_formats.h"
 
 /**
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 852ab9a4cee5..62b06bc26e79 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -3,7 +3,85 @@
 #ifndef _VKMS_FORMATS_H_
 #define _VKMS_FORMATS_H_
 
-#include "vkms_drv.h"
+#include <drm/drm_color_mgmt.h>
+
+struct vkms_plane_state;
+struct vkms_writeback_job;
+
+struct pixel_argb_u16 {
+	u16 a, r, g, b;
+};
+
+/**
+ * typedef pixel_write_line_t - These functions are used to read a pixel line from a
+ * struct pixel_argb_u16 buffer, convert it and write it in the @wb_job.
+ *
+ * @wb: the writeback job to write the output of the conversion
+ * @in_pixels: Source buffer containing the line to convert
+ * @count: The width of a line
+ * @x_start: The x (width) coordinate in the destination plane
+ * @y_start: The y (height) coordinate in the destination plane
+ */
+typedef void (*pixel_write_line_t)(struct vkms_writeback_job *wb,
+				   struct pixel_argb_u16 *in_pixels, int count, int x_start,
+				   int y_start);
+
+struct line_buffer {
+	size_t n_pixels;
+	struct pixel_argb_u16 *pixels;
+};
+
+/**
+ * enum pixel_read_direction - Enum used internaly by VKMS to represent a reading direction in a
+ * plane.
+ */
+enum pixel_read_direction {
+	READ_BOTTOM_TO_TOP,
+	READ_TOP_TO_BOTTOM,
+	READ_RIGHT_TO_LEFT,
+	READ_LEFT_TO_RIGHT
+};
+
+/**
+ * struct conversion_matrix - Matrix to use for a specific encoding and range
+ *
+ * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
+ * used to compute rgb values from yuv values:
+ *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
+ *   OR for yvu formats:
+ *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
+ *  The values of the matrix are signed fixed-point values with 32 bits fractional part.
+ * @y_offset: Offset to apply on the y value.
+ */
+struct conversion_matrix {
+	s64 matrix[3][3];
+	int y_offset;
+};
+
+struct vkms_color_lut {
+	struct drm_color_lut *base;
+	size_t lut_length;
+	s64 channel_value2index_ratio;
+};
+
+/**
+ * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
+ * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
+ *
+ * @plane: plane used as source for the pixel value
+ * @x_start: X (width) coordinate of the first pixel to copy. The caller must ensure that x_start
+ * is non-negative and smaller than @plane->frame_info->fb->width.
+ * @y_start: Y (height) coordinate of the first pixel to copy. The caller must ensure that y_start
+ * is non-negative and smaller than @plane->frame_info->fb->height.
+ * @direction: direction to use for the copy, starting at @x_start/@y_start
+ * @count: number of pixels to copy
+ * @out_pixel: pointer where to write the pixel values. They will be written from @out_pixel[0]
+ * (included) to @out_pixel[@count] (excluded). The caller must ensure that out_pixel have a
+ * length of at least @count.
+ */
+typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_start,
+				  int y_start, enum pixel_read_direction direction, int count,
+				  struct pixel_argb_u16 out_pixel[]);
 
 pixel_read_line_t get_pixel_read_line_function(u32 format);
 

-- 
2.44.2

