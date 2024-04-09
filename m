Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED0D89DA22
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E441112AA5;
	Tue,  9 Apr 2024 13:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="X6PrbbC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC701123D3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:25:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AB57240012;
 Tue,  9 Apr 2024 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712669149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otbY3dyaK1xzegWiEm+JvrF5ZlRlYhNif7wGB0lFHTo=;
 b=X6PrbbC8W2JXMRiYSZo+XIEvRXF8D3ZRCUZe/k4HBCXGBG8M+BC73vvsiyItC2sp/9UAPG
 fVKbg5lBdKaqz0c0cw44aEJTXSnQ8+TAxRM4CrYxYlfH9kPSs4LgwV4JP/q1JFhvj+vbPG
 9h0NXd8fAvxYFmAYBIILlPrHZgJQax3eCuVGHTPnz8iKl56A/WPzP+WAXkjlWtRUyeld/5
 WeoLZHb+Jo1fGIon5/n8jXU4dZ72Iosvf/ASXll9ujHtJVWqGL+lvujF0Swb0vDDM8A9aI
 2uuPT5EUhq/NsujjLuBPDijrVZofnvjM0bq9a3Q01QvrZLOqYF8ZlfW04dDWaA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Apr 2024 15:25:23 +0200
Subject: [PATCH v6 05/17] drm/vkms: Add dummy pixel_read/pixel_write
 callbacks to avoid NULL pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-yuv-v6-5-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
In-Reply-To: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4683;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jy8xSXJEOqn5wUFVqbS80+Pv0J4IEDT2C+geoMLpavQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmFUHRjnIKr6XaGUdRrQ/zSO85JD+Bgx2elpHeg
 azBWENJYTqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZhVB0QAKCRAgrS7GWxAs
 4gTcEACqiz1/FHfzWsEmZe/7eBdcnJaNPjHjeR+Xmw56wExV0oSp0264h431jkCPK+3is6hQBGG
 auMMUJ5EGF60T0tvGxT06VVsALKj3EKY11Qjt+pAH69ESGJJLrc34QKutBkhrzUQgfet0pWD173
 BW96lXufbZOihE0OKmPcAFb72pjOguTiq9CJ7z4cjHc2odJ6XNwznsLO2xhTYuzb19joflTPj3X
 ecsk/sbUNDSymYqiN09GRvAwM5hBGmpSYML50ls5vGAEaBdwbRMJzuyVL9dr2mVNwznGANQgE6l
 OiNeI/i46Zs6MZCLmxRsa5UJDMCxKFt67l1JxhsINioogyiJP89+KB+MgPhxToUX72NdmKmudFp
 1aImmor5YUAUDm+aWk8ac4utobGbXfPAhaOSwEf/cdCIZHdICgi04BfG8porn4xzfx0xN/iyPiF
 pFrmLFF3tjG3wZOUxyHo+1taWyO2lLVHHZeSHUETt6jkoDS4DiioEyBGd/5tBEtMXf2h0vJ8DnJ
 koZ4gb+ii/LsDruFQVMlEop1I807KkErax1LyJNAQBRGiZEe90LoQAb54dlRc7ZCInHAlgZNL+Z
 kWiII67BhGqlGEQnp3/IsvuIeZbdm/gHeyyQ9BdBt2Beh0n0BuYLfDDH8YrZotXwb+ql35d9xUo
 Sz/epifT4/hJkeA==
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

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 45 ++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 6b3e17374b19..c28c32b00e39 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -135,6 +135,21 @@ static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
 	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
 }
 
+/**
+ * magenta_to_argb_u16() - pixel_read callback which always read magenta
+ *
+ * This callback is used when an invalid format is requested for plane reading.
+ * It is used to avoid null pointer to be used as a function. In theory, this function should
+ * never be called, except if you found a bug in the driver/DRM core.
+ */
+static void magenta_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+{
+	out_pixel->a = (u16)0xFFFF;
+	out_pixel->r = (u16)0xFFFF;
+	out_pixel->g = 0;
+	out_pixel->b = (u16)0xFFFF;
+}
+
 /**
  * vkms_compose_row - compose a single row of a plane
  * @stage_buffer: output line with the composed pixels
@@ -237,6 +252,16 @@ static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
 	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
+/**
+ * argb_u16_to_nothing() - pixel_write callback with no effect
+ *
+ * This callback is used when an invalid format is requested for writeback.
+ * It is used to avoid null pointer to be used as a function. In theory, this should never
+ * happen, except if there is a bug in the driver
+ */
+static void argb_u16_to_nothing(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
+{}
+
 /**
  * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
  * after the blending to write a line in the writeback buffer.
@@ -260,8 +285,10 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 
 /**
  * get_pixel_conversion_function() - Retrieve the correct read_pixel function for a specific
- * format. The returned pointer is NULL for unsupported pixel formats. The caller must ensure that
- * the pointer is valid before using it in a vkms_plane_state.
+ * format.
+ *
+ * If the format is not supported by VKMS a warning is emitted and a dummy "always read magenta"
+ * function is returned.
  *
  * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
  */
@@ -284,18 +311,21 @@ pixel_read_t get_pixel_read_function(u32 format)
 		 * format must:
 		 * - Be listed in vkms_formats in vkms_plane.c
 		 * - Have a pixel_read callback defined here
+		 *
+		 * To avoid kernel crash, a dummy "always read magenta" function is used. It means
+		 * that during the composition, this plane will always be magenta.
 		 */
 		WARN(true,
 		     "Pixel format %p4cc is not supported by VKMS planes. This is a kernel bug, atomic check must forbid this configuration.\n",
 		     &format);
-		return (pixel_read_t)NULL;
+		return &magenta_to_argb_u16;
 	}
 }
 
 /**
  * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
- * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
- * pointer is valid before using it in a vkms_writeback_job.
+ * If the format is not supported by VKMS a warning is emitted and a dummy "don't do anything"
+ * function is returned.
  *
  * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
  */
@@ -318,10 +348,13 @@ pixel_write_t get_pixel_write_function(u32 format)
 		 * format must:
 		 * - Be listed in vkms_wb_formats in vkms_writeback.c
 		 * - Have a pixel_write callback defined here
+		 *
+		 * To avoid kernel crash, a dummy "don't do anything" function is used. It means
+		 * that the resulting writeback buffer is not composed and can contains any values.
 		 */
 		WARN(true,
 		     "Pixel format %p4cc is not supported by VKMS writeback. This is a kernel bug, atomic check must forbid this configuration.\n",
 		     &format);
-		return (pixel_write_t)NULL;
+		return &argb_u16_to_nothing;
 	}
 }

-- 
2.43.0

