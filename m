Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D7A870571
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC01411228A;
	Mon,  4 Mar 2024 15:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bV0pt87h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DDF1122AD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:29:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCA3A1C000D;
 Mon,  4 Mar 2024 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709566164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OheunqzV0Tdab0ro1TCM9rlfBD5uxy5mvs2Qm0nwE9o=;
 b=bV0pt87hMo/ll1N/71wSKc33n13peoHTY7sQn8FB/kvaDvEc9gXpv9tg5pudkyM/aODzey
 kq2G8P9GliB7ZNozUZd3MVBTKSHVwgmWjkNMuD5+E/by54NRvjgN/tphf9vVrJokEROB5f
 y9h4ITE/qA9HqgwBwxwtr8usC27mJI/j4+ULO+R3+ZaO4TOq0AxtUfRlJd1Eko8DxIz2Nl
 NqLZU7IiHFuoPKx41Wr/ToRm+SQ2oxb/qNS3iqMesjIG3Nx1hf5X3y6lC7qyb5leHVSVom
 18sZHe3NmJBiv7wg4PKQMvH9dBHv9TA00TLjfHTnAwrbizEfDgXm5TvCajktGg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 04 Mar 2024 16:28:10 +0100
Subject: [PATCH v4 05/14] drm/vkms: Add dummy pixel_read/pixel_write
 callbacks to avoid NULL pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-yuv-v4-5-76beac8e9793@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4457;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=osXDzXENgU45GirTmc0kFbEH2mwwSMJk7kYLAHdAPlA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl5ejLXYtmd0/p9yal0gzpyvbinfGHAUv3kwIP8EXW
 iU5g/fSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeXoywAKCRAgrS7GWxAs4qJsEA
 CJYciBAlkAVuthTsMAiF6bAb1eWIKhySsuBsayNkZRAgWobjTzKQsO7f3ybhQQFU8nJ4HfFC4mXXiz
 S5mbdH0M0WxYHUOvMTq99YGn8ubbE8/XZOfTg0DQSqAtrhFSkBPpIn+qzE4kG6rbj8jPMFE+l9CAeR
 VAKL7zKv/h/FMRPZE8GEvRgl6+ynO3ibnWiCea73VJFcBw6oWlNE7CK9D1lZRHsWsGl9vuuxHabndA
 KMjRp54Y3Q1+41KoEqBLVyOgDDDiJsIkdBdwUfp4qkAExnD5gUCww5IVi8kuSbxgVfQE0+fPGLP5CP
 42RLDahpjj4OrtB14PISLIzEXWKEMzuBpAyER4wJxPm+NK1F+FqExFzHO2g9qfdnvL4LIqEYbtIjfZ
 gW8eaYTWWBvykRtuqn0OPfSHczGGyAYuTglWXhN3rTuXQi3BIm9WAw4LJDgeNisyswL0y3/J3WhYXb
 cHmOCDzS6JGQMfvdq7ZncVI9He3DE5U/AXRrxeI9tC3lf7yb+GOSvd2UGJk08cvstRt+5Dbqujewhm
 UgtX2ZFldHEIo2TeQ5Y06PHH3z7ScNq1L7rZo3NDAL6zgMbGmOQaGl1ImS2gB1GERFxxgSeacvuOzt
 L6NW1KGxsNKAmmO1S72Zg/Q7Kcj0g1kA2PJSye9mp9OOsQmVCvA9Gl+dSOkg==
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

Introduce two callbacks which does nothing. They are used in replacement
of NULL and it avoid kernel OOPS if this NULL is called.

If those callback are used, it means that there is a mismatch between
what formats are announced by atomic_check and what is realy supported by
atomic_update.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 42 +++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 393c73caad72..29ca403827a6 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -136,6 +136,21 @@ static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
 }
 
+/**
+ * black_to_argb_u16() - pixel_read callback which always read black
+ *
+ * This callback is used when an invalid format is requested for plane reading.
+ * It is used to avoid null pointer to be used as a function. In theory, this function should
+ * never be called, except if you found a bug in the driver/DRM core.
+ */
+static void black_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+{
+	out_pixel->a = (u16) 0xFFFF;
+	out_pixel->r = 0;
+	out_pixel->g = 0;
+	out_pixel->b = 0;
+}
+
 /**
  * vkms_compose_row - compose a single row of a plane
  * @stage_buffer: output line with the composed pixels
@@ -238,6 +253,15 @@ static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
 	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
+/**
+ * argb_u16_to_nothing() - pixel_write callback with no effect
+ *
+ * This callback is used when an invalid format is requested for writeback.
+ * It is used to avoid null pointer to be used as a function. In theory, this should never
+ * happen, except if there is a bug in the driver
+ */
+static void argb_u16_to_nothing(u8 *out_pixel, struct pixel_argb_u16 *in_pixel) {}
+
 /**
  * Generic loop for all supported writeback format. It is executed just after the blending to
  * write a line in the writeback buffer.
@@ -261,8 +285,8 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 
 /**
  * Retrieve the correct read_pixel function for a specific format.
- * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
- * pointer is valid before using it in a vkms_plane_state.
+ * If the format is not supported by VKMS a warn is emitted and a dummy "always read black"
+ * function is returned.
  *
  * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
  */
@@ -285,17 +309,20 @@ pixel_read_t get_pixel_read_function(u32 format)
 		 * format must:
 		 * - Be listed in vkms_formats in vkms_plane.c
 		 * - Have a pixel_read callback defined here
+		 *
+		 * To avoid kernel crash, a dummy "always read black" function is used. It means
+		 * that during the composition, this plane will always be black.
 		 */
 		WARN(true, "Pixel format %4cc is not supported by VKMS planes. This is a kernel bug, atomic check must forbid this configuration.\n",
 		     format);
-		return (pixel_read_t)NULL;
+		return &black_to_argb_u16;
 	}
 }
 
 /**
  * Retrieve the correct write_pixel function for a specific format.
- * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
- * pointer is valid before using it in a vkms_writeback_job.
+ * If the format is not supported by VKMS a warn is emitted and a dummy "don't do anything"
+ * function is returned.
  *
  * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
  */
@@ -318,9 +345,12 @@ pixel_write_t get_pixel_write_function(u32 format)
 		 * format must:
 		 * - Be listed in vkms_wb_formats in vkms_writeback.c
 		 * - Have a pixel_write callback defined here
+		 *
+		 * To avoid kernel crash, a dummy "don't do anything" function is used. It means
+		 * that the resulting writeback buffer is not composed and can contains any values.
 		 */
 		WARN(true, "Pixel format %4cc is not supported by VKMS writeback. This is a kernel bug, atomic check must forbid this configuration.\n",
 		     format);
-		return (pixel_write_t)NULL;
+		return &argb_u16_to_nothing;
 	}
 }

-- 
2.43.0

