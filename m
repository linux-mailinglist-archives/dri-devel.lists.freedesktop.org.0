Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E27BE997
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2646710E2B7;
	Mon,  9 Oct 2023 18:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1154F10E2B7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696876568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yKWds3HtLR10dcr4aoo+utAQtVVVNzCAHahFeeRCifI=;
 b=ERKmOR5Zm3ri0yZN8ulU2ffrl9nu6eskuaD68ILK3FSaKFqTNHU8/WZrizyGE1cXRrTz7d
 t45qZZwa/AnIgC+olwwKTAvgwbagvGxfddnz8KwPEnuS+4Ah6DBfw4uJ4sutG3gRrwHgC8
 E1xt7RPo2gdZebV3mGcyDJ3VQgJJPfQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-EH_GUHpuOBealVfWHsRDMQ-1; Mon, 09 Oct 2023 14:36:06 -0400
X-MC-Unique: EH_GUHpuOBealVfWHsRDMQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40566c578b7so38469205e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696876565; x=1697481365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKWds3HtLR10dcr4aoo+utAQtVVVNzCAHahFeeRCifI=;
 b=lfKeeQz44aFYLThbf+ZDq/Kyubrlbcp8gtNv7JhzHyBbgBvgHJg2oK0eFUjLXuslbA
 xCI7/nreKWQyhbSIPB2iQw7UxunaJ3DC2W5YABGH50+Y6PAPHx6tRSbOC5qoJRNxWMi1
 FXZo/KMUrBJ1hFCC79kjw2UIJs7JHgwv1UMPsXqWXsQY2JT9gikDO8xDszCFQk9vJUfQ
 DVBzl0UHObqRTfWcYq2YtFYCJ9l9L4we5gVvEbFFMqRce38cLZa0H7kkuYmztEXke6a2
 dn52oADMSvJIIrjxIpU/NLwcLdA61rG8eqVnQl/yBNiMqb9Wri/l3ITOCcoEmHP8pwAi
 l6UQ==
X-Gm-Message-State: AOJu0Yxhanl8Q0dTBFGM95+9PNFb7HCrhwEvMu/p4z7eIJKC4KeHZHsA
 uGEbhiBVQ52rwcKtAgNcp/T8R5HOKS+2AaJ2OEnvw5SgZr5q3pAVfZcc2gsVtROE08naRjavpOr
 NW7zfEoqYOJ7g5qN6/316XENuRi5D
X-Received: by 2002:adf:ea8f:0:b0:317:6175:95fd with SMTP id
 s15-20020adfea8f000000b00317617595fdmr14990528wrm.43.1696876565635; 
 Mon, 09 Oct 2023 11:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB61EIlQsYZ6j7/oURYZv5G2X0Vw8t58q6yedzHXwLbHyWJagJU9xZ1E61AxSRQC6PdxFq1w==
X-Received: by 2002:adf:ea8f:0:b0:317:6175:95fd with SMTP id
 s15-20020adfea8f000000b00317617595fdmr14990522wrm.43.1696876565360; 
 Mon, 09 Oct 2023 11:36:05 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c294500b003fc02e8ea68sm14008591wmd.13.2023.10.09.11.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:36:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] drm/ssd13xx: Add a per controller family functions table
Date: Mon,  9 Oct 2023 20:34:19 +0200
Message-ID: <20231009183522.543918-6-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009183522.543918-1-javierm@redhat.com>
References: <20231009183522.543918-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To allow the driver to decouple the common logic in the function callbacks
from the behaviour that is specific of a given Solomon controller family.

For this, include a chip family to the device info and add fields to the
driver-private device struct, to store the hardware buffer maximum size,
the intermediate buffer maximum size and pixel format, and a set of per
chip family function handlers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd13xx.c | 88 ++++++++++++++++++++++---------
 drivers/gpu/drm/solomon/ssd13xx.h | 27 ++++++++++
 2 files changed, 90 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd13xx.c b/drivers/gpu/drm/solomon/ssd13xx.c
index 9747f8656636..5a426ac10c58 100644
--- a/drivers/gpu/drm/solomon/ssd13xx.c
+++ b/drivers/gpu/drm/solomon/ssd13xx.c
@@ -104,6 +104,7 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 		.default_width = 132,
 		.default_height = 64,
 		.page_mode_only = 1,
+		.family_id = SSD130X_FAMILY,
 	},
 	[SSD1305_ID] = {
 		.default_vcomh = 0x34,
@@ -111,6 +112,7 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 		.default_dclk_frq = 7,
 		.default_width = 132,
 		.default_height = 64,
+		.family_id = SSD130X_FAMILY,
 	},
 	[SSD1306_ID] = {
 		.default_vcomh = 0x20,
@@ -119,6 +121,7 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 		.need_chargepump = 1,
 		.default_width = 128,
 		.default_height = 64,
+		.family_id = SSD130X_FAMILY,
 	},
 	[SSD1307_ID] = {
 		.default_vcomh = 0x20,
@@ -127,6 +130,7 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 		.need_pwm = 1,
 		.default_width = 128,
 		.default_height = 39,
+		.family_id = SSD130X_FAMILY,
 	},
 	[SSD1309_ID] = {
 		.default_vcomh = 0x34,
@@ -134,6 +138,7 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 		.default_dclk_frq = 10,
 		.default_width = 128,
 		.default_height = 64,
+		.family_id = SSD130X_FAMILY,
 	}
 };
 EXPORT_SYMBOL_NS_GPL(ssd13xx_variants, DRM_SSD13XX);
@@ -148,8 +153,6 @@ struct ssd13xx_plane_state {
 	struct drm_shadow_plane_state base;
 	/* Intermediate buffer to convert pixels from XRGB8888 to HW format */
 	u8 *buffer;
-	/* Pixel format info for the intermediate buffer */
-	const struct drm_format_info *fi;
 };
 
 static inline struct ssd13xx_crtc_state *to_ssd13xx_crtc_state(struct drm_crtc_state *state)
@@ -331,7 +334,7 @@ static void ssd13xx_power_off(struct ssd13xx_device *ssd13xx)
 	regulator_disable(ssd13xx->vcc_reg);
 }
 
-static int ssd13xx_init(struct ssd13xx_device *ssd13xx)
+static int ssd130x_init(struct ssd13xx_device *ssd13xx)
 {
 	u32 precharge, dclk, com_invdir, compins, chargepump, seg_remap;
 	bool scan_mode;
@@ -455,7 +458,7 @@ static int ssd13xx_init(struct ssd13xx_device *ssd13xx)
 				 SSD130X_SET_ADDRESS_MODE_HORIZONTAL);
 }
 
-static int ssd13xx_update_rect(struct ssd13xx_device *ssd13xx,
+static int ssd130x_update_rect(struct ssd13xx_device *ssd13xx,
 			       struct drm_rect *rect, u8 *buf,
 			       u8 *data_array)
 {
@@ -561,7 +564,7 @@ static int ssd13xx_update_rect(struct ssd13xx_device *ssd13xx,
 	return ret;
 }
 
-static void ssd13xx_clear_screen(struct ssd13xx_device *ssd13xx, u8 *data_array)
+static void ssd130x_clear_screen(struct ssd13xx_device *ssd13xx, u8 *data_array)
 {
 	unsigned int pages = DIV_ROUND_UP(ssd13xx->height, SSD130X_PAGE_HEIGHT);
 	unsigned int width = ssd13xx->width;
@@ -602,6 +605,15 @@ static void ssd13xx_clear_screen(struct ssd13xx_device *ssd13xx, u8 *data_array)
 	}
 }
 
+static const struct ssd13xx_funcs ssd13xx_family_funcs[] = {
+	[SSD130X_FAMILY] = {
+		.init = ssd130x_init,
+		.update_rect = ssd130x_update_rect,
+		.clear_screen = ssd130x_clear_screen,
+		.fmt_convert = drm_fb_xrgb8888_to_mono,
+	},
+};
+
 static int ssd13xx_fb_blit_rect(struct drm_framebuffer *fb,
 				const struct iosys_map *vmap,
 				struct drm_rect *rect, u8 *buf,
@@ -609,6 +621,7 @@ static int ssd13xx_fb_blit_rect(struct drm_framebuffer *fb,
 				u8 *data_array)
 {
 	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(fb->dev);
+	const struct ssd13xx_funcs *ssd13xx_funcs = ssd13xx->funcs;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
@@ -624,13 +637,11 @@ static int ssd13xx_fb_blit_rect(struct drm_framebuffer *fb,
 		return ret;
 
 	iosys_map_set_vaddr(&dst, buf);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
+	ssd13xx_funcs->fmt_convert(&dst, &dst_pitch, vmap, fb, rect);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-	ssd13xx_update_rect(ssd13xx, rect, buf, data_array);
-
-	return ret;
+	return ssd13xx_funcs->update_rect(ssd13xx, rect, buf, data_array);
 }
 
 static int ssd13xx_primary_plane_atomic_check(struct drm_plane *plane,
@@ -642,8 +653,6 @@ static int ssd13xx_primary_plane_atomic_check(struct drm_plane *plane,
 	struct ssd13xx_plane_state *ssd13xx_state = to_ssd13xx_plane_state(plane_state);
 	struct drm_crtc *crtc = plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	const struct drm_format_info *fi;
-	unsigned int pitch;
 	int ret;
 
 	if (!crtc)
@@ -657,18 +666,10 @@ static int ssd13xx_primary_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
-	fi = drm_format_info(DRM_FORMAT_R1);
-	if (!fi)
-		return -EINVAL;
-
-	pitch = drm_format_info_min_pitch(fi, 0, ssd13xx->width);
-
-	ssd13xx_state->buffer = kcalloc(pitch, ssd13xx->height, GFP_KERNEL);
+	ssd13xx_state->buffer = kzalloc(ssd13xx->buffer_size, GFP_KERNEL);
 	if (!ssd13xx_state->buffer)
 		return -ENOMEM;
 
-	ssd13xx_state->fi = fi;
-
 	return 0;
 }
 
@@ -684,6 +685,7 @@ static void ssd13xx_primary_plane_atomic_update(struct drm_plane *plane,
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_device *drm = plane->dev;
+	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(drm);
 	struct drm_rect dst_clip;
 	struct drm_rect damage;
 	int idx;
@@ -700,7 +702,7 @@ static void ssd13xx_primary_plane_atomic_update(struct drm_plane *plane,
 
 		ssd13xx_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
 				     ssd13xx_plane_state->buffer,
-				     ssd13xx_plane_state->fi,
+				     ssd13xx->buffer_fi,
 				     ssd13xx_crtc_state->data_array);
 	}
 
@@ -712,6 +714,7 @@ static void ssd13xx_primary_plane_atomic_disable(struct drm_plane *plane,
 {
 	struct drm_device *drm = plane->dev;
 	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(drm);
+	const struct ssd13xx_funcs *ssd13xx_funcs = ssd13xx->funcs;
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_crtc_state *crtc_state;
 	struct ssd13xx_crtc_state *ssd13xx_crtc_state;
@@ -726,7 +729,7 @@ static void ssd13xx_primary_plane_atomic_disable(struct drm_plane *plane,
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	ssd13xx_clear_screen(ssd13xx, ssd13xx_crtc_state->data_array);
+	ssd13xx_funcs->clear_screen(ssd13xx, ssd13xx_crtc_state->data_array);
 
 	drm_dev_exit(idx);
 }
@@ -820,14 +823,13 @@ static int ssd13xx_crtc_atomic_check(struct drm_crtc *crtc,
 	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ssd13xx_crtc_state *ssd13xx_state = to_ssd13xx_crtc_state(crtc_state);
-	unsigned int pages = DIV_ROUND_UP(ssd13xx->height, SSD130X_PAGE_HEIGHT);
 	int ret;
 
 	ret = drm_crtc_helper_atomic_check(crtc, state);
 	if (ret)
 		return ret;
 
-	ssd13xx_state->data_array = kmalloc(ssd13xx->width * pages, GFP_KERNEL);
+	ssd13xx_state->data_array = kmalloc(ssd13xx->data_array_size, GFP_KERNEL);
 	if (!ssd13xx_state->data_array)
 		return -ENOMEM;
 
@@ -905,13 +907,14 @@ static void ssd13xx_encoder_atomic_enable(struct drm_encoder *encoder,
 {
 	struct drm_device *drm = encoder->dev;
 	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(drm);
+	const struct ssd13xx_funcs *ssd13xx_funcs = ssd13xx->funcs;
 	int ret;
 
 	ret = ssd13xx_power_on(ssd13xx);
 	if (ret)
 		return;
 
-	ret = ssd13xx_init(ssd13xx);
+	ret = ssd13xx_funcs->init(ssd13xx);
 	if (ret)
 		goto power_off;
 
@@ -1195,11 +1198,38 @@ static int ssd13xx_get_resources(struct ssd13xx_device *ssd13xx)
 	return 0;
 }
 
+static int ssd13xx_set_buffer_sizes(struct ssd13xx_device *ssd13xx,
+				    enum ssd13xx_family_ids family_id)
+{
+	const struct drm_format_info *fi;
+	unsigned int buffer_pitch;
+
+	switch (family_id) {
+	case SSD130X_FAMILY:
+		unsigned int pages = DIV_ROUND_UP(ssd13xx->height, SSD130X_PAGE_HEIGHT);
+
+		ssd13xx->data_array_size = ssd13xx->width * pages;
+
+		fi = drm_format_info(DRM_FORMAT_R1);
+		break;
+	}
+
+	if (!fi)
+		return -EINVAL;
+
+	buffer_pitch = drm_format_info_min_pitch(fi, 0, ssd13xx->width);
+	ssd13xx->buffer_size = buffer_pitch * ssd13xx->height;
+	ssd13xx->buffer_fi = fi;
+
+	return 0;
+}
+
 struct ssd13xx_device *ssd13xx_probe(struct device *dev, struct regmap *regmap)
 {
 	struct ssd13xx_device *ssd13xx;
 	struct backlight_device *bl;
 	struct drm_device *drm;
+	enum ssd13xx_family_ids family_id;
 	int ret;
 
 	ssd13xx = devm_drm_dev_alloc(dev, &ssd13xx_drm_driver,
@@ -1214,11 +1244,19 @@ struct ssd13xx_device *ssd13xx_probe(struct device *dev, struct regmap *regmap)
 	ssd13xx->regmap = regmap;
 	ssd13xx->device_info = device_get_match_data(dev);
 
+	family_id = ssd13xx->device_info->family_id;
+
+	ssd13xx->funcs = &ssd13xx_family_funcs[family_id];
+
 	if (ssd13xx->device_info->page_mode_only)
 		ssd13xx->page_address_mode = 1;
 
 	ssd13xx_parse_properties(ssd13xx);
 
+	ret = ssd13xx_set_buffer_sizes(ssd13xx, family_id);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = ssd13xx_get_resources(ssd13xx);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/solomon/ssd13xx.h b/drivers/gpu/drm/solomon/ssd13xx.h
index 64283935fbc1..e78d5ab87474 100644
--- a/drivers/gpu/drm/solomon/ssd13xx.h
+++ b/drivers/gpu/drm/solomon/ssd13xx.h
@@ -20,11 +20,17 @@
 #include <drm/drm_plane_helper.h>
 
 #include <linux/regmap.h>
+#include <linux/iosys-map.h>
 
 #define SSD130X_DATA				0x40
 #define SSD130X_COMMAND				0x80
 
+enum ssd13xx_family_ids {
+	SSD130X_FAMILY,
+};
+
 enum ssd13xx_variants {
+	/* ssd130x family */
 	SH1106_ID,
 	SSD1305_ID,
 	SSD1306_ID,
@@ -39,6 +45,7 @@ struct ssd13xx_deviceinfo {
 	u32 default_dclk_frq;
 	u32 default_width;
 	u32 default_height;
+	enum ssd13xx_family_ids family_id;
 	bool need_pwm;
 	bool need_chargepump;
 	bool page_mode_only;
@@ -76,6 +83,12 @@ struct ssd13xx_device {
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
@@ -88,6 +101,20 @@ struct ssd13xx_device {
 	u8 col_end;
 	u8 page_start;
 	u8 page_end;
+
+	/* Chip family specific operations */
+	const struct ssd13xx_funcs *funcs;
+};
+
+struct ssd13xx_funcs {
+	int (*init)(struct ssd13xx_device *ssd130x);
+	int (*update_rect)(struct ssd13xx_device *ssd13xx, struct drm_rect *rect,
+			   u8 *buf, u8 *data_array);
+	void (*clear_screen)(struct ssd13xx_device *ssd13xx,
+			     u8 *data_array);
+	void (*fmt_convert)(struct iosys_map *dst, const unsigned int *dst_pitch,
+			    const struct iosys_map *src, const struct drm_framebuffer *fb,
+			    const struct drm_rect *clip);
 };
 
 extern const struct ssd13xx_deviceinfo ssd13xx_variants[];
-- 
2.41.0

