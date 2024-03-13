Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E372387ADF7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0F10F827;
	Wed, 13 Mar 2024 17:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LFweQlQA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845A110F7F7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:45:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C46A4000D;
 Wed, 13 Mar 2024 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710351936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fvpHRvoA+r8MzKnJomCYkfJhC+FGJMS1P3vzAB0//K4=;
 b=LFweQlQAF4K+c7LHmf8/B53B4G5O9T0xlfIwbSQFQ36QMkuAULBLSnpWvdefiE6rIU11CL
 7hbt27JA27k6pJ10KcIvfxQah/NMEhdIuUoufRwRUT+I2NiBcLkFAAL1gbY6HHbb7LPlVI
 dHoLqPgNG9iweMMyjzfY4YAH3/P0OBFmSYpAX/0wLkccYQmJ4HaE4Jiy9ENPJdR9xvpy7v
 KMlpmg39itJJxtzE5kITWe6pZUxglsJ8NkYGHpS7vRAnPknIV61Xu5vt7tAcuV/Rf8+B5d
 tNQHaxwLK+kSNRyIqG+0n9Rfg+XlgFnWFTFyb9akHtHkZP5EZ6ooo+1vpVUvgQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 13 Mar 2024 18:45:03 +0100
Subject: [PATCH v5 09/16] drm/vkms: Introduce pixel_read_direction enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-yuv-v5-9-e610cbd03f52@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4725;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=iIicmQla2LEzH8GgecY5rPqd6iTEX/DNAL/60xWRQwE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8eY0heQDZLj05nsF2/TlGqiprIBuyb8l2ca87FfG
 kaGUsQ+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHmNAAKCRAgrS7GWxAs4mkSEA
 CSwvsGnjmGlmwjnOYjROX2sIyNbOyjRKh8odmY5lqGL1bgskhTwgX3dawxInPK3GRSHCgH5WjgDGKA
 kJzSb8m6qEaYyLoH2wg+v0dOtOj+Wh1Y+zULx0U8LW6DoEjrYoKLyB+3xMNVTXEJ82BBObdtX2jXCi
 G8bZONkUdq/86G/l4sBl13vPsi1gr/CskWQ3dD2pRJQtZgtLIE9suSVUgATsMHKrsPqyw59nkAyCRN
 PDM8K+ua6I1ajYGSqDFwpKalGH0T1f7NkF03TKzxOWNrcgvax9aYHnzZEp25D2ppr4e3Zr03GPNNjx
 NYquf8Yec+/3CX/SUh3491DdMlIa9rciTcd1E1KzJDNtBcAidUxHwWTrEfbe79bmCZNcrrqyznHwYK
 FoHcSdiO36Fg2tfcSICycicdzM40rIZBuG5sWQmqL3+WNFZ1DeeZUn6UX5DfmoTrBZpt2KVwu4Uqtd
 4SmlcMGWVplzDRepqxJLjGG7Rq5eI0ievf0QIKQgoiz7abK7NhJ9nCRjBEDXtSO7TW+r4tE6b04yAW
 WsOiSBtQXDW33HkzN03YEsph8H/HQejWGYdMhLHxSXk+n106eGBfiOflglmE2/iKjDLDlaw8WVrXi2
 1BKLdbJs+zEaGBSwWGENhRJeIAhPhgfHmB9L9RSm9JThEZDGcQHfhUHzVm0Q==
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
 drivers/gpu/drm/vkms/vkms_composer.c | 36 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++++++++
 drivers/gpu/drm/vkms/vkms_formats.c  | 30 ++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9254086f23ff..989bcf59f375 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -159,6 +159,42 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
+/**
+ * direction_for_rotation() - Get the correct reading direction for a given rotation
+ *
+ * This function will use the @rotation setting of a source plane to compute the reading
+ * direction in this plane which correspond to a "left to right writing" in the CRTC.
+ * For example, if the buffer is reflected on X axis, the pixel must be read from right to left
+ * to be written from left to right on the CRTC.
+ *
+ * @rotation: Rotation to analyze. It correspond the field @frame_info.rotation.
+ */
+static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
+{
+	if (rotation & DRM_MODE_ROTATE_0) {
+		if (rotation & DRM_MODE_REFLECT_X)
+			return READ_RIGHT_TO_LEFT;
+		else
+			return READ_LEFT_TO_RIGHT;
+	} else if (rotation & DRM_MODE_ROTATE_90) {
+		if (rotation & DRM_MODE_REFLECT_Y)
+			return READ_BOTTOM_TO_TOP;
+		else
+			return READ_TOP_TO_BOTTOM;
+	} else if (rotation & DRM_MODE_ROTATE_180) {
+		if (rotation & DRM_MODE_REFLECT_X)
+			return READ_LEFT_TO_RIGHT;
+		else
+			return READ_RIGHT_TO_LEFT;
+	} else if (rotation & DRM_MODE_ROTATE_270) {
+		if (rotation & DRM_MODE_REFLECT_Y)
+			return READ_TOP_TO_BOTTOM;
+		else
+			return READ_BOTTOM_TO_TOP;
+	}
+	return READ_LEFT_TO_RIGHT;
+}
+
 /**
  * blend - blend the pixels from all planes and compute crc
  * @wb: The writeback frame buffer metadata
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 3ead8b39af4a..985e7a92b7bc 100644
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
index 649d75d05b1f..743b6fd06db5 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -75,6 +75,36 @@ static void packed_pixels_addr(const struct vkms_frame_info *frame_info,
 	*addr = (u8 *)frame_info->map[0].vaddr + offset;
 }
 
+/**
+ * get_step_next_block() - Common helper to compute the correct step value between each pixel block
+ * to read in a certain direction.
+ *
+ * As the returned offset is the number of bytes between two consecutive blocks in a direction,
+ * the caller may have to read multiple pixel before using the next one (for example, to read from
+ * left to right in a DRM_FORMAT_R1 plane, each block contains 8 pixels, so the step must be used
+ * only every 8 pixels.
+ *
+ * @fb: Framebuffer to iter on
+ * @direction: Direction of the reading
+ * @plane_index: Plane to get the step from
+ */
+static int get_step_next_block(struct drm_framebuffer *fb, enum pixel_read_direction direction,
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
 static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y,
 				 int plane_index)
 {

-- 
2.43.0

