Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6F89516CD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5A410E42C;
	Wed, 14 Aug 2024 08:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VKwzRn/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E59B10E42A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:42:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40155FF80B;
 Wed, 14 Aug 2024 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723624944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39J9r/cgiMQQbGfPEgnjvEVgEY5DVxwdbT5Fn7hwGoM=;
 b=VKwzRn/J4ZB0AicdFgA1fZaT1H2z7IQFWYjdkcVlHFAd2RBhCxb58mKdNSSX6UOeAr3jDH
 /qWDxVfCBejYiQEKB+U+PDlrGNiEMtIxdGWKhmTb38MnZaPo05qPHhw6YODGOWxmWgHoCv
 cDKLj49WNh6+d4k64gY8p1IoKnnZvOMdx23pJIafWCL0y39ID9DBVmE3a/K4h33IyOTCeA
 vAZusbVPaa7cU0vZz58dH7QZhnQ4q/y6YmqkrAkbsVYEXHkwIfEqWPiTiZHMV5R8rWdIUr
 A4Nu8YnhMfijrcRYOo2W1FYeORML24qFqInkmjLqBidpxG+0FEIcqfrDRIPecw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 10:42:18 +0200
Subject: [PATCH v2 3/3] drm/vkms: Add support for XRGB2101010
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-writeback_line_by_line-v2-3-36541c717569@bootlin.com>
References: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
In-Reply-To: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
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
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Q//2af1+GAtPQBK929lJrpeGLSaSBwP7sfQwrAoJ7hY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvG3rFnEo2Jrdte6ELCuzP943oaZmaGTT4+95Z
 Wo/GdZIwbaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxt6wAKCRAgrS7GWxAs
 4iEWEACGFjNZDjEUQT4zyAbX/97zEp9tNSleBMzBY4cGOr0AKTpQgHgK1e6VVDpM66YXP7kOcHi
 e+q4dj75JSpPuGoiKWd5G9hOYqb3+9Maq0JF9paczH1PPXikfn4DJxclcMDEe23OzoHzQ3s3moG
 RgOyvSTJkXOGpkhYG8ycj4XVKjNA6KQmLey0/AG3zVrF2EWNyr5K3nDId2C3SzHS4sX5W9ZMxAH
 a+9EYu54w01XtdS5P5+bxO4fA/ultDa3mcrAuFswV+YjZwVAVtde1r/n4wOPp4SRzHtse3t5Snm
 9flj/kyTc0Kun6UlXFwESieZglSfuvyhjl3c0V5KGl7/PKED+Hfx+fjqF7K4klHGlhYBpufuK94
 nfqgENkYcOn2FgrC+eCBmkeXbrDoQUmarMILHPiFCR6flz40tSs6ZeQ9PouEYW6HbYoDvAalXPA
 nsuq5lviic6gwMPa1BzvULenkYHofYJ4i3niL5z417XAG2IqYBiF9BOTSYKwdtGP5TI9c81ZjOR
 a+QqLDvCB4DTIdfM9rd7nFneB3qVkhcPknndhZrUUEBBLMZp5KeVmrmYhecxsMlgeHeNU4v6x9Z
 plMOAgjqXs9SoiAQKKr9vJT2rNGBDVOseR9+GVyhnPRFcSk2IbIZhiYBzXUccfWOCZ70+DVjjpv
 7jVzBW5PHH3X9+Q==
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

Thanks to the WRITE_LINE macro, adding the format XRGB210101010 is trivial.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c   | 12 ++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index a25cdf656d8a..65fdd3999441 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -654,6 +654,14 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
 	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
+static void argb_u16_to_XRGB2101010(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
+{
+	out_pixel[0] = (u8)(in_pixel->b & 0xFF);
+	out_pixel[1] = (u8)((in_pixel->b >> 8) & 0x03) | (u8)((in_pixel->g << 2) & 0xFC);
+	out_pixel[2] = (u8)((in_pixel->g >> 6) & 0x0F) | (u8)((in_pixel->r << 4) & 0xF0);
+	out_pixel[3] = (u8)((in_pixel->r >> 4) & 0x3F);
+}
+
 /**
  * WRITE_LINE() - Generic generator for write_line functions
  *
@@ -700,6 +708,8 @@ WRITE_LINE(XRGB16161616_write_line, argb_u16_to_XRGB16161616)
 
 WRITE_LINE(RGB565_write_line, argb_u16_to_RGB565)
 
+WRITE_LINE(XRGB2101010_write_line, argb_u16_to_XRGB2101010)
+
 /**
  * get_pixel_read_function() - Retrieve the correct read_line function for a specific
  * format. The returned pointer is NULL for unsupported pixel formats. The caller must ensure that
@@ -977,6 +987,8 @@ pixel_write_line_t get_pixel_write_line_function(u32 format)
 		return &XRGB16161616_write_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_write_line;
+	case DRM_FORMAT_XRGB2101010:
+		return &XRGB2101010_write_line;
 	default:
 		/*
 		 * This is a bug in vkms_writeback_atomic_check. All the supported
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index f6ed3aa69af8..7e0302c0830c 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -19,7 +19,8 @@ static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
-	DRM_FORMAT_RGB565
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB2101010,
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {

-- 
2.44.2

