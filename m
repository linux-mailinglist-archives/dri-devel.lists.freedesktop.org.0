Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50D8C3C7C
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D78410E4C1;
	Mon, 13 May 2024 07:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QTdchuoW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD9910E4AA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:50:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A430F2000F;
 Mon, 13 May 2024 07:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715586649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HjuSxb5tRuJlwNWUcd9b7+gNDJthW7TUH2T12QgbBU=;
 b=QTdchuoWpNDopzzioqN1xO5dZWc37CzTSAH4aXUnVcXvJYCdyYTdDVE36GZdHw9PTouGbC
 MdLWXfazsGqqD7lxRJcv8fkCsXf5FbD9C/097OT09W0UsxxmitcTPCQAa5kpnGmyYEKXxx
 30pHiwjiWvL/VuVV+DEHM5ZtscsPZoSpwX5FpbNJGweg5o/Xfjy8VG/WNb+Ant+CkI1RTC
 LQWiT38QXy68L6OYhuxfbcEiWGDrfDSP4TpnOnQxmikSa2PKRW+Xck94pH3tQlpgr06y8c
 oAjm6Q3wFOmP5jRqXErFQmgUfuYUSUbUc/fZT4KrEOHjuYaXCbDwx7ltYQfW9Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 May 2024 09:50:30 +0200
Subject: [PATCH v7 09/17] drm/vkms: Introduce pixel_read_direction enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-yuv-v7-9-380e9ffec502@bootlin.com>
References: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
In-Reply-To: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
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
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5034;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=AZnpNZYwa9/BWX42T4A3ZiOjur47FNwzryKQsxVdO6k=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmQcZDtqUy+QWYnmFFJgVMCSfiq91/LLUdr9jdO
 E03tiZywxmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkHGQwAKCRAgrS7GWxAs
 4tlDEAC5Cl5bhT1Frlhp9l2nTZ5jg0DhWY/JrXO02ef4oVLOVXwmwzZ2YkVHGIEEh+ujV+NlZe/
 yVSNe/dhWUOgqk1aFT6nZThpyE8nQa9Qhw2ryEL4lm/6WCuGA4pnSAiiUEVjnnm9nQ17YyL/sIM
 xwFb9PnzWGQEy25xGZUenumrmMVkeuEgk8ajH9zU3xuFCW8yHHyKgEZeoAyS38FPSQuvzYk7mks
 Io8fyhgWcnTVcqDXfzht0LBBMxSMKXIK5yEGob5GabJQn72qBjFX9YnDkKZU4NLvjPq+6pCtSX8
 bJZtYxkEQWvlT2cMMX22eGETiHQPbcihtCGzhHRdhI9jkNVQzwLnGEYwcEAHiKpU/DS+e7MsKZe
 kc6E7WKKVD7oD0MbVKR9w1dz8Bzu3iZ4V3A83C6TMIXszV0tfgxlbHNOk5K3OYPkGdZD2ppYK7W
 nvAASlP3FWaQaW8r++AzdH8C/uEYQqrbEbfY9z7lwpjXXmtddjLcbQlbHuTgPoE/tz5q/UkwEWR
 wORSkoqwwuBwoENHlVTLXFwwaXUnVqzihw0yEou65eAOW3LaO5EIfZJ0vNyiN8Q9PlxYWR/vYa+
 J2/1V97PzY2FXfoMGNYE/3/0PPDtisT2kctHho1q+o+2Jo1+wBKRM/vDcRql3gkOuhw71w93F3M
 FAwOTDGj4cBoE3g==
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

The pixel_read_direction enum is useful to describe the reading direction
in a plane. It avoids using the rotation property of DRM, which not
practical to know the direction of reading.
This patch also introduce two helpers, one to compute the
pixel_read_direction from the DRM rotation property, and one to compute
the step, in byte, between two successive pixel in a specific direction.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 46 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++++++
 drivers/gpu/drm/vkms/vkms_formats.c  | 30 +++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 45b111c74884..fb4967a00398 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -159,6 +159,52 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
+/**
+ * direction_for_rotation() - Get the correct reading direction for a given rotation
+ *
+ * @rotation: Rotation to analyze. It correspond the field @frame_info.rotation.
+ *
+ * This function will use the @rotation setting of a source plane to compute the reading
+ * direction in this plane which correspond to a "left to right writing" in the CRTC.
+ * For example, if the buffer is reflected on X axis, the pixel must be read from right to left
+ * to be written from left to right on the CRTC.
+ */
+static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
+{
+	struct drm_rect tmp_a, tmp_b;
+	int x, y;
+
+	/*
+
+	 * Points A and B are depicted as zero-size rectangles on the CRTC.
+	 * The CRTC writing direction is from A to B. The plane reading direction
+	 * is discovered by inverse-transforming A and B.
+	 * The reading direction is computed by rotating the vector AB (top-left to top-right) in a
+	 * 1x1 square.
+	 */
+
+	tmp_a = DRM_RECT_INIT(0, 0, 0, 0);
+	tmp_b = DRM_RECT_INIT(1, 0, 0, 0);
+	drm_rect_rotate_inv(&tmp_a, 1, 1, rotation);
+	drm_rect_rotate_inv(&tmp_b, 1, 1, rotation);
+
+	x = tmp_b.x1 - tmp_a.x1;
+	y = tmp_b.y1 - tmp_a.y1;
+
+	if (x == 1 && y == 0)
+		return READ_LEFT_TO_RIGHT;
+	else if (x == -1 && y == 0)
+		return READ_RIGHT_TO_LEFT;
+	else if (y == 1 && x == 0)
+		return READ_TOP_TO_BOTTOM;
+	else if (y == -1 && x == 0)
+		return READ_BOTTOM_TO_TOP;
+
+
+	WARN_ONCE(true, "The inverse of the rotation gives an incorrect direction.");
+	return READ_LEFT_TO_RIGHT;
+}
+
 /**
  * blend - blend the pixels from all planes and compute crc
  * @wb: The writeback frame buffer metadata
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 17081effe99a..5d0e87fe50c0 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -69,6 +69,17 @@ struct vkms_writeback_job {
 	pixel_write_t pixel_write;
 };
 
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
 /**
  * typedef pixel_read_t - These functions are used to read a pixel in the source frame,
  * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 9a1400ad4db6..e4cc8948e4d5 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -75,6 +75,36 @@ static void packed_pixels_addr(const struct vkms_frame_info *frame_info,
 	*addr = (u8 *)frame_info->map[0].vaddr + offset;
 }
 
+/**
+ * get_block_step_bytes() - Common helper to compute the correct step value between each pixel block
+ * to read in a certain direction.
+ *
+ * @fb: Framebuffer to iter on
+ * @direction: Direction of the reading
+ * @plane_index: Plane to get the step from
+ *
+ * As the returned count is the number of bytes between two consecutive blocks in a direction,
+ * the caller may have to read multiple pixels before using the next one (for example, to read from
+ * left to right in a DRM_FORMAT_R1 plane, each block contains 8 pixels, so the step must be used
+ * only every 8 pixels).
+ */
+static int get_block_step_bytes(struct drm_framebuffer *fb, enum pixel_read_direction direction,
+			       int plane_index)
+{
+	switch (direction) {
+	case READ_LEFT_TO_RIGHT:
+		return fb->format->char_per_block[plane_index];
+	case READ_RIGHT_TO_LEFT:
+		return -fb->format->char_per_block[plane_index];
+	case READ_TOP_TO_BOTTOM:
+		return (int)fb->pitches[plane_index];
+	case READ_BOTTOM_TO_TOP:
+		return -(int)fb->pitches[plane_index];
+	}
+
+	return 0;
+}
+
 /**
  * packed_pixels_addr_1x1() - Get the pointer to the block containing the pixel at the given
  * coordinates

-- 
2.43.2

