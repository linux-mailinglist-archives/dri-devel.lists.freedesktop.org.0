Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B287ADE5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B94010F7F4;
	Wed, 13 Mar 2024 17:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Q/r2VPAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD2810F6C2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:45:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0C374000B;
 Wed, 13 Mar 2024 17:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710351932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esYVbqoyMnTYaHzvOF2VUzx2RJ3x/zSrqTrYmwfzZkk=;
 b=Q/r2VPAG4xEkAiWkAN6692uB5lWbLgVsBG3SjSVWzqlw6DUHSENwvYcXCFk60hJHcrdKBO
 W8lfUOdZvFsRH6jKjLni4ituBFE233ptL26gu3SN4g6wFJ4/WsSlwQpoROHQ0JbYtSqGaP
 bkyQ23LO7va4k9zb+HjAR5ZfYmEKWCVSkZaKyQpFFl6slS93DmBip7jYZf87fbS/SUFzER
 bEujqMPB4FEY4QlIeQlpfs/2aqhwzbhfvEGFiOlXz2OSbB9NqDCaTZ9+DveYXsVY3Dpax7
 NuPIdQg0rNljirKC2lnIY9usrRE6nYTIfjccGnKPeir8qXeUnbCRPO8dSsxdmQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 13 Mar 2024 18:44:59 +0100
Subject: [PATCH v5 05/16] drm/vkms: Add dummy pixel_read/pixel_write
 callbacks to avoid NULL pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-yuv-v5-5-e610cbd03f52@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4481;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9ZPVdGk0pJtVP26SrBX+ZVjo7p8EmT2b/86RbmQI15E=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8eYzPoa6AEW5znaZfmxscs9WwpZyPGBNTulbz13P
 +8PTSPOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHmMwAKCRAgrS7GWxAs4nwWD/
 49STSyWsA+XEAckzZNYZbCS1v6PcmX4ZF5KKo4mb+81k4luTqJmRR6fvlF39DsQWsD+7c5KrRdMWdf
 bekTyltqqXtmZ9IOvX/4cKoyKdMfBHgDY0NRceCjvLUxUf5tg1noea4c2UsyHa0J6Ns4FTa9UMVx4u
 fh+rdnO+NE88wS2101f/HaRjbjIdSAami4xdxtFz00QKrwF/ZFHiD3cqYxsYzZLE5mCLOsc01YD5De
 xIYKZ9vOP0BgF7+/RL7FN63k2Mkb1YVY+/LyjXPCmq58CaPMjGUvOFt0zZZUIPZj0IxyxrcG1cRtIu
 D9wbMbRYXMpLnIGtmUaVNQUL2fx8vGrsFu+tliFIBXwVGV6RWYNJNjg7ec23AFLCtnNHzY/h/76RTm
 j0RdxXSSnd/Dnzu25NxgGZTnesqqH5e+j/OC1Vd9m+SGo7IFcmxfZsoC6sRm3qq+2IR7arZpmFdcOU
 StYSaw5E8BYvSkJKDT3NNWXav1O+jQxCo7xAg3GbtijpFM6TMeB/TUXgs6a+UkyGiqaOSQp40FGtC1
 7YDxHH33He8wx5tkW8VPmjjm00UKAwKi+x9pvMBRCAJ8tPn6v/hyeUPG9EGy5CIoNvDijs6IwiT0YP
 W8I2dmfLYCfYGW8UjfdMmH4FZiCY7qTSbjnyulrAIlRfz6mxHaWQFBTbCtGA==
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
 drivers/gpu/drm/vkms/vkms_formats.c | 43 +++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 55a4365d21a4..b57d85b8b935 100644
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
+	out_pixel->a = (u16)0xFFFF;
+	out_pixel->r = 0;
+	out_pixel->g = 0;
+	out_pixel->b = 0;
+}
+
 /**
  * vkms_compose_row - compose a single row of a plane
  * @stage_buffer: output line with the composed pixels
@@ -238,6 +253,16 @@ static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
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
  * Generic loop for all supported writeback format. It is executed just after the blending to
  * write a line in the writeback buffer.
@@ -261,8 +286,8 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 
 /**
  * Retrieve the correct read_pixel function for a specific format.
- * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
- * pointer is valid before using it in a vkms_plane_state.
+ * If the format is not supported by VKMS a warn is emitted and a dummy "always read black"
+ * function is returned.
  *
  * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
  */
@@ -285,18 +310,21 @@ pixel_read_t get_pixel_read_function(u32 format)
 		 * format must:
 		 * - Be listed in vkms_formats in vkms_plane.c
 		 * - Have a pixel_read callback defined here
+		 *
+		 * To avoid kernel crash, a dummy "always read black" function is used. It means
+		 * that during the composition, this plane will always be black.
 		 */
 		WARN(true,
 		     "Pixel format %p4cc is not supported by VKMS planes. This is a kernel bug, atomic check must forbid this configuration.\n",
 		     &format);
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
@@ -319,10 +347,13 @@ pixel_write_t get_pixel_write_function(u32 format)
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

