Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6299D181C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 19:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D4210E557;
	Mon, 18 Nov 2024 18:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T6Iy3vml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7FF10E554
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 18:28:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A034E0004;
 Mon, 18 Nov 2024 18:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731954516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKPnlq5Kx3o1lb/orvuSMbuFeIQYveAbU0i2p2Pu0r0=;
 b=T6Iy3vmlSy57fIHp1p18P4USCQ8KwwpmpyD+JKpK3IsJeQMNRLFr2mSGlpUt2Cn+Rw/e9m
 D3CcH91qbbq+GT08dMd3G8mKQGqynShsXHFxHIsbPAlo0mQ7p0spUZ0mzd3+3vv+TKmG57
 HoC6q8KKSon+Wyf+2buDAMeyG+1qMqQ6GIz5jABkQI/Sh+B08UtnilHKyxqMEboR9+bfw8
 mfCnvrxTaVyRVDKYP8KEndi4V+yy5oKU4E90vHIEAIaFGMghhkM8O3vzR0kEnP93vmyPFz
 RrSlBjd82DRt4ct2tjWDg/qj31UNGKGDKoSg6gseQ33wxdU6wIFD41cP5ceYdw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 18 Nov 2024 19:28:22 +0100
Subject: [PATCH v14 7/9] drm/vkms: Introduce pixel_read_direction enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241118-yuv-v14-7-2dbc2f1e222c@bootlin.com>
References: <20241118-yuv-v14-0-2dbc2f1e222c@bootlin.com>
In-Reply-To: <20241118-yuv-v14-0-2dbc2f1e222c@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5441;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=qbjaHG+NidWunNkmzPOAIgCl2msJvK+z2zAIp2OEYEw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnO4dGDuYVyblJnk/sKUip2s6x+zTzVNw9sKtV5
 g90id+ewhSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZzuHRgAKCRAgrS7GWxAs
 4uWzD/4zPjazlNeALvc5PHev9XgvkODzcDqiaE0LGpvEl62DXMMnsdQsUKJeLTqbNmq39pm+YQd
 ETZ/EUlwrP8Xp51RDE5g2oix/IiiDDZ5WZaie/oEW8J7YeL2/BBNpNfkHZQTdvIqjXEdj5dcBVN
 /c7krEpFFwsXs95RLxNX8YLS9kSBd1jdaNbkC5xvj0D3QTvz6DOWPsuFMQ1ckX8Vf5x8QO4fk73
 a66Z5IoKES4klLppz1ioF2AhOg7mgUi4TPvhK5moKWitembsOlppZEKu5wxkwDvc/CNoTDMGwUh
 Dq6Buy2nkUkle54zh4Z47w/wVafZ8k8GzHvRqDK3LdvOouS/3WBIYynbN/egbot8w8OMCwTArs9
 LnyMGHSIhvU7/N2Mcpl1D4xZCcnE3vX89NBwqh+VPAVwJS7Nsb3sDKO/cHUI84xJdzF4jLDtNf/
 Kcfje7nqKTugz0zc8EnYKWXPwY6fr6tebV2ZCY3XuGhfP6z/HRAmBpmOw97CO8gDNKjzrKdSTYk
 eCj3XVk9UXG0M7rt7n+rw6KAjO9c72755nQfzKMo6AATs9mPuMuR92b/McugflF/VzKWlQyttpV
 d5WhuC/BdQ95vNLDG4vBLh96FGoczn/Uljo4JuVOpTqs13Qt7It3sl4Cf62IUQdAyRWHF3UvTdp
 nTSbhKpLgfNIZ4w==
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

Acked-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 44 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++++++
 drivers/gpu/drm/vkms/vkms_formats.c  | 32 ++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e406ab4b14fd4288816565b3cabec93cea5834ae..c2181afa41216c38a52656bfb49e8210c69a9e58 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -159,6 +159,50 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
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
+	WARN_ONCE(true, "The inverse of the rotation gives an incorrect direction.");
+	return READ_LEFT_TO_RIGHT;
+}
+
 /**
  * blend - blend the pixels from all planes and compute crc
  * @wb: The writeback frame buffer metadata
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 3f45290a0c5d5ae8c38b79970a21deea6a61a0f1..1ebdf5da9e6ea0224b593b4d1407ada4b300a85e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -69,6 +69,17 @@ struct vkms_writeback_job {
 	pixel_write_t pixel_write;
 };
 
+/**
+ * enum pixel_read_direction - Enum used internally by VKMS to represent a reading direction in a
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
index f9045a80aceba941568db014fecf548d59e14a5a..5dad7bcec0a67b8b36fa3e8916c8b8bafd7b3523 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -79,6 +79,38 @@ static void packed_pixels_addr(const struct vkms_frame_info *frame_info,
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
+				int plane_index)
+{
+	switch (direction) {
+	case READ_LEFT_TO_RIGHT:
+		return fb->format->char_per_block[plane_index];
+	case READ_RIGHT_TO_LEFT:
+		return -fb->format->char_per_block[plane_index];
+	case READ_TOP_TO_BOTTOM:
+		return (int)fb->pitches[plane_index] * drm_format_info_block_width(fb->format,
+										   plane_index);
+	case READ_BOTTOM_TO_TOP:
+		return -(int)fb->pitches[plane_index] * drm_format_info_block_width(fb->format,
+										    plane_index);
+	}
+
+	return 0;
+}
+
 /**
  * packed_pixels_addr_1x1() - Get the pointer to the block containing the pixel at the given
  * coordinates

-- 
2.47.0

