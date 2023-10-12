Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7052B7C65F3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 08:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3694B10E41A;
	Thu, 12 Oct 2023 06:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C2810E419
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 06:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697093912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPTiBn27phzNUMwFu1grsxXoxNWjXfYdrR6MN2Opoxg=;
 b=Kr8C0IoqNUOcN3QENa6w4iAhAa0a2Ts/hjUVT7fNcxT+fuUvqfgg4jFJZJ6Uicqf+IVBl3
 OqikPkwk4hnZRwph5IvynbBcQZ2oyG3o3jlH0OpsbSewY4GhH6Fk0+pPUsc47W+MnrfGb3
 L35XOKj3Xbdw63/+n7L+pHaxm7qkvxg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-DQxbNuT1P8WgqFRbuaGpBA-1; Thu, 12 Oct 2023 02:58:30 -0400
X-MC-Unique: DQxbNuT1P8WgqFRbuaGpBA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-402cd372b8bso5303605e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 23:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697093909; x=1697698709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPTiBn27phzNUMwFu1grsxXoxNWjXfYdrR6MN2Opoxg=;
 b=mgHVY1uDBSSECwG/ryJtvG6B2yiNGM8CVmNi8FmmWlBNOeZjq2qgmfOLrVgrJOI4PR
 TUtGehDptHbx1x2HWWoLQ26TMPJZR5USAGMTqL5TAvRPlLvb3pkSFOzwFJyT+I2DArsm
 qrpUB1Wah3r3PvP9QOINSZjUbvwUzMKZkUhN4GIgn1b4yuks9ndginvqeIeTF0Upkd+2
 0PWetSQF199XSLeQHYdp/+9nbgvdiaIxY3qGO/+0OnEofwP0t/uinPViS4OSgbLWxBYp
 gQ1i819pAX2Tu884XFRzivs7VTNFf+qiTP3Xx2bkr1NIvCI/L+GD4OfPNcPS7Gths7oM
 6hag==
X-Gm-Message-State: AOJu0Yz2M6EScqCZiTeRRNxouOYNIN2l8DXu08OtKiwKbWjGyitoVeoI
 2dgZIbklvSe/fe/TJ95CEQVhd5HVYhrBABXvwNNdrijKR0JksIV+DfcHvX4SFwN1tP/AojNyVbx
 V640leP5Mp/VXWd/TTXqDrFxlyDAD
X-Received: by 2002:a05:600c:3652:b0:3fb:a0fc:1ba1 with SMTP id
 y18-20020a05600c365200b003fba0fc1ba1mr21622380wmq.35.1697093909031; 
 Wed, 11 Oct 2023 23:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2VzFJ33q86Q2iUjuYjhhol7ahstCiajrALxDA5ZWPV2Y2N3UvpQDCLZl7eWt/0A+ksBJAlw==
X-Received: by 2002:a05:600c:3652:b0:3fb:a0fc:1ba1 with SMTP id
 y18-20020a05600c365200b003fba0fc1ba1mr21622366wmq.35.1697093908792; 
 Wed, 11 Oct 2023 23:58:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 az17-20020a05600c601100b003fef5e76f2csm2016567wmb.0.2023.10.11.23.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 23:58:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] drm/ssd130x: Add a per controller family functions
 table
Date: Thu, 12 Oct 2023 08:58:11 +0200
Message-ID: <20231012065822.1007930-3-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012065822.1007930-1-javierm@redhat.com>
References: <20231012065822.1007930-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To allow the driver to decouple the common logic in the function callbacks
from the behaviour that is specific of a given Solomon controller family.

For this, include a chip family to the device info and add fields to the
driver-private device struct, to store the hardware buffer maximum size,
the intermediate buffer maximum size and pixel format, and a set of per
chip family function handlers.

While doing this change, also use drm_format_info_min_pitch() to calculate
the dest_pitch. This avoids to assume a 1 bpp and instead the pixel format
info for the intermediate buffer is used.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Squash patch that uses drm_format_info_min_pitch() to calculate dest_pitch
  with the following patch (Geert Uytterhoeven).
- Store ssd13xx_family_funcs[SSD130X_FAMILY] in struct ssd130x_deviceinfo
  (Geert Uytterhoeven).
- Don't mix switch (family_id) and ssd13xx_funcs[family_id] (Geert Uytterhoeven).
- Replace switch (family_id) by an .set_buffer_sizes (Geert Uytterhoeven).
- Move the rect alignment to a per chip family function (Geert Uytterhoeven).

 drivers/gpu/drm/solomon/ssd130x-i2c.c |  1 +
 drivers/gpu/drm/solomon/ssd130x-spi.c |  2 +
 drivers/gpu/drm/solomon/ssd130x.c     | 95 ++++++++++++++++++++-------
 drivers/gpu/drm/solomon/ssd130x.h     | 24 +++++++
 4 files changed, 99 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index b4eb2d64bf6e..8f89b89d553f 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -54,6 +54,7 @@ static void ssd130x_i2c_shutdown(struct i2c_client *client)
 }
 
 static const struct of_device_id ssd130x_of_match[] = {
+	/* ssd130x family */
 	{
 		.compatible = "sinowealth,sh1106",
 		.data = &ssd130x_variants[SH1106_ID],
diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index 19ab4942cb33..257819bccbc8 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -108,6 +108,7 @@ static void ssd130x_spi_shutdown(struct spi_device *spi)
 }
 
 static const struct of_device_id ssd130x_of_match[] = {
+	/* ssd130x family */
 	{
 		.compatible = "sinowealth,sh1106",
 		.data = &ssd130x_variants[SH1106_ID],
@@ -142,6 +143,7 @@ MODULE_DEVICE_TABLE(of, ssd130x_of_match);
  * not be needed for this driver to match the registered SPI devices.
  */
 static const struct spi_device_id ssd130x_spi_table[] = {
+	/* ssd130x family */
 	{ "sh1106",  SH1106_ID },
 	{ "ssd1305", SSD1305_ID },
 	{ "ssd1306", SSD1306_ID },
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 2852cddb098b..08885c33e1a6 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -96,6 +96,12 @@
 
 #define MAX_CONTRAST 255
 
+enum ssd130x_family_ids {
+	SSD130X_FAMILY
+};
+
+static const struct ssd130x_funcs ssd130x_family_funcs[];
+
 const struct ssd130x_deviceinfo ssd130x_variants[] = {
 	[SH1106_ID] = {
 		.default_vcomh = 0x40,
@@ -104,6 +110,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_width = 132,
 		.default_height = 64,
 		.page_mode_only = 1,
+		.funcs = &ssd130x_family_funcs[SSD130X_FAMILY],
 	},
 	[SSD1305_ID] = {
 		.default_vcomh = 0x34,
@@ -111,6 +118,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_dclk_frq = 7,
 		.default_width = 132,
 		.default_height = 64,
+		.funcs = &ssd130x_family_funcs[SSD130X_FAMILY],
 	},
 	[SSD1306_ID] = {
 		.default_vcomh = 0x20,
@@ -119,6 +127,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.need_chargepump = 1,
 		.default_width = 128,
 		.default_height = 64,
+		.funcs = &ssd130x_family_funcs[SSD130X_FAMILY],
 	},
 	[SSD1307_ID] = {
 		.default_vcomh = 0x20,
@@ -127,6 +136,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.need_pwm = 1,
 		.default_width = 128,
 		.default_height = 39,
+		.funcs = &ssd130x_family_funcs[SSD130X_FAMILY],
 	},
 	[SSD1309_ID] = {
 		.default_vcomh = 0x34,
@@ -134,6 +144,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_dclk_frq = 10,
 		.default_width = 128,
 		.default_height = 64,
+		.funcs = &ssd130x_family_funcs[SSD130X_FAMILY],
 	}
 };
 EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
@@ -453,6 +464,33 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 				 SSD130X_SET_ADDRESS_MODE_HORIZONTAL);
 }
 
+static int ssd130x_set_buffer_sizes(struct ssd130x_device *ssd130x)
+{
+	unsigned int buffer_pitch;
+	unsigned int pages = DIV_ROUND_UP(ssd130x->height, SSD130X_PAGE_HEIGHT);
+
+	ssd130x->data_array_size = ssd130x->width * pages;
+
+	ssd130x->buffer_fi = drm_format_info(DRM_FORMAT_R1);
+
+	if (!ssd130x->buffer_fi)
+		return -EINVAL;
+
+	buffer_pitch = drm_format_info_min_pitch(ssd130x->buffer_fi, 0, ssd130x->width);
+	ssd130x->buffer_size = buffer_pitch * ssd130x->height;
+
+	return 0;
+}
+
+static void ssd130x_align_rect(struct ssd130x_device *ssd130x,
+			       struct drm_rect *rect)
+{
+	/* Align y to display page boundaries */
+	rect->y1 = round_down(rect->y1, SSD130X_PAGE_HEIGHT);
+	rect->y2 = min_t(unsigned int, round_up(rect->y2, SSD130X_PAGE_HEIGHT),
+			 ssd130x->height);
+}
+
 static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 			       struct drm_rect *rect, u8 *buf,
 			       u8 *data_array)
@@ -600,34 +638,43 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 	}
 }
 
+static const struct ssd130x_funcs ssd130x_family_funcs[] = {
+	[SSD130X_FAMILY] = {
+		.init = ssd130x_init,
+		.set_buffer_sizes = ssd130x_set_buffer_sizes,
+		.align_rect = ssd130x_align_rect,
+		.update_rect = ssd130x_update_rect,
+		.clear_screen = ssd130x_clear_screen,
+		.fmt_convert = drm_fb_xrgb8888_to_mono,
+	},
+};
+
 static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 				const struct iosys_map *vmap,
-				struct drm_rect *rect,
-				u8 *buf, u8 *data_array)
+				struct drm_rect *rect, u8 *buf,
+				const struct drm_format_info *fi,
+				u8 *data_array)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
+	const struct ssd130x_funcs *ssd130x_funcs = ssd130x->device_info->funcs;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
 
-	/* Align y to display page boundaries */
-	rect->y1 = round_down(rect->y1, SSD130X_PAGE_HEIGHT);
-	rect->y2 = min_t(unsigned int, round_up(rect->y2, SSD130X_PAGE_HEIGHT), ssd130x->height);
+	ssd130x_funcs->align_rect(ssd130x, rect);
 
-	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
+	dst_pitch = drm_format_info_min_pitch(fi, 0, drm_rect_width(rect));
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
 		return ret;
 
 	iosys_map_set_vaddr(&dst, buf);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
+	ssd130x_funcs->fmt_convert(&dst, &dst_pitch, vmap, fb, rect);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-	ssd130x_update_rect(ssd130x, rect, buf, data_array);
-
-	return ret;
+	return ssd130x_funcs->update_rect(ssd130x, rect, buf, data_array);
 }
 
 static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
@@ -639,8 +686,6 @@ static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
 	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
 	struct drm_crtc *crtc = plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	const struct drm_format_info *fi;
-	unsigned int pitch;
 	int ret;
 
 	if (!crtc)
@@ -654,13 +699,7 @@ static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
-	fi = drm_format_info(DRM_FORMAT_R1);
-	if (!fi)
-		return -EINVAL;
-
-	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
-
-	ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
+	ssd130x_state->buffer = kzalloc(ssd130x->buffer_size, GFP_KERNEL);
 	if (!ssd130x_state->buffer)
 		return -ENOMEM;
 
@@ -679,6 +718,7 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_device *drm = plane->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	struct drm_rect dst_clip;
 	struct drm_rect damage;
 	int idx;
@@ -695,6 +735,7 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
 
 		ssd130x_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
 				     ssd130x_plane_state->buffer,
+				     ssd130x->buffer_fi,
 				     ssd130x_crtc_state->data_array);
 	}
 
@@ -706,6 +747,7 @@ static void ssd130x_primary_plane_atomic_disable(struct drm_plane *plane,
 {
 	struct drm_device *drm = plane->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	const struct ssd130x_funcs *ssd130x_funcs = ssd130x->device_info->funcs;
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_crtc_state *crtc_state;
 	struct ssd130x_crtc_state *ssd130x_crtc_state;
@@ -720,7 +762,7 @@ static void ssd130x_primary_plane_atomic_disable(struct drm_plane *plane,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	ssd130x_clear_screen(ssd130x, ssd130x_crtc_state->data_array);
+	ssd130x_funcs->clear_screen(ssd130x, ssd130x_crtc_state->data_array);
 
 	drm_dev_exit(idx);
 }
@@ -814,14 +856,13 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(crtc_state);
-	unsigned int pages = DIV_ROUND_UP(ssd130x->height, SSD130X_PAGE_HEIGHT);
 	int ret;
 
 	ret = drm_crtc_helper_atomic_check(crtc, state);
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc(ssd130x->data_array_size, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -899,13 +940,14 @@ static void ssd130x_encoder_atomic_enable(struct drm_encoder *encoder,
 {
 	struct drm_device *drm = encoder->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	const struct ssd130x_funcs *ssd130x_funcs = ssd130x->device_info->funcs;
 	int ret;
 
 	ret = ssd130x_power_on(ssd130x);
 	if (ret)
 		return;
 
-	ret = ssd130x_init(ssd130x);
+	ret = ssd130x_funcs->init(ssd130x);
 	if (ret)
 		goto power_off;
 
@@ -1191,6 +1233,7 @@ static int ssd130x_get_resources(struct ssd130x_device *ssd130x)
 
 struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 {
+	const struct ssd130x_funcs *ssd130x_funcs;
 	struct ssd130x_device *ssd130x;
 	struct backlight_device *bl;
 	struct drm_device *drm;
@@ -1213,6 +1256,12 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 
 	ssd130x_parse_properties(ssd130x);
 
+	ssd130x_funcs = ssd130x->device_info->funcs;
+
+	ret = ssd130x_funcs->set_buffer_sizes(ssd130x);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = ssd130x_get_resources(ssd130x);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index bbe374453605..5af251676587 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -20,11 +20,13 @@
 #include <drm/drm_plane_helper.h>
 
 #include <linux/regmap.h>
+#include <linux/iosys-map.h>
 
 #define SSD130X_DATA				0x40
 #define SSD130X_COMMAND				0x80
 
 enum ssd130x_variants {
+	/* ssd130x family */
 	SH1106_ID,
 	SSD1305_ID,
 	SSD1306_ID,
@@ -42,6 +44,9 @@ struct ssd130x_deviceinfo {
 	bool need_pwm;
 	bool need_chargepump;
 	bool page_mode_only;
+
+	/* Chip family specific operations */
+	const struct ssd130x_funcs *funcs;
 };
 
 struct ssd130x_device {
@@ -76,6 +81,12 @@ struct ssd130x_device {
 	u32 col_offset;
 	u32 prechargep1;
 	u32 prechargep2;
+	/* HW format buffer size */
+	u32 data_array_size;
+	/* Intermediate buffer size */
+	u32 buffer_size;
+	/* Pixel format info for the intermediate buffer */
+	const struct drm_format_info *buffer_fi;
 
 	struct backlight_device *bl_dev;
 	struct pwm_device *pwm;
@@ -90,6 +101,19 @@ struct ssd130x_device {
 	u8 page_end;
 };
 
+struct ssd130x_funcs {
+	int (*init)(struct ssd130x_device *ssd130x);
+	int (*set_buffer_sizes)(struct ssd130x_device *ssd130x);
+	void (*align_rect)(struct ssd130x_device *ssd130x, struct drm_rect *rect);
+	int (*update_rect)(struct ssd130x_device *ssd130x, struct drm_rect *rect,
+			   u8 *buf, u8 *data_array);
+	void (*clear_screen)(struct ssd130x_device *ssd130x,
+			     u8 *data_array);
+	void (*fmt_convert)(struct iosys_map *dst, const unsigned int *dst_pitch,
+			    const struct iosys_map *src, const struct drm_framebuffer *fb,
+			    const struct drm_rect *clip);
+};
+
 extern const struct ssd130x_deviceinfo ssd130x_variants[];
 
 struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap);
-- 
2.41.0

