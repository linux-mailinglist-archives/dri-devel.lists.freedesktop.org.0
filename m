Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D281C7B7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 11:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCA210E785;
	Fri, 22 Dec 2023 10:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A0E10E785
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 10:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703239324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXfX12BE3LQm3hjKfwCrE87x4MbkwuEOmAkmWXpHcRM=;
 b=TAm8jO3LwMAzJJxJX+INqJerNpELCuhyOY9FtMKaXMdQZ4vU2OHi5phe/pxLg2F7x16NJQ
 h5Z7YLSvlYDA4O1x93Jowo+8lR+6r1hO+iiDh1mbVhjeNn6hkYwScly+QFYBF3gzZy39yJ
 BZzTSzUb9IqRTuBu2xJFZdFrWlVLkDU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-8sP69HzsOZCtZR45zj_ANA-1; Fri, 22 Dec 2023 05:02:02 -0500
X-MC-Unique: 8sP69HzsOZCtZR45zj_ANA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40d4a29dca7so681345e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 02:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703239321; x=1703844121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YXfX12BE3LQm3hjKfwCrE87x4MbkwuEOmAkmWXpHcRM=;
 b=GyI7mbdjZjKX14E2gCgD42fePShS0m4xgy2W/a0ZBDkgbpUcGwjxp47aoSPNpebpNo
 Vo4yo7M0g6moFlMvoelIQL8fLzr0akXDmYLw1eqrRpmJvT/OA3kDgeCPMxb7kXtY0oV9
 5WXJLg5o51gJUppRcSwwiCFOCrWZ7wVWCbCLnUEpSmEE5zUDn/h6o3N5VVkp4dFZv9Pk
 4yX93ega7dFLprQS44d71x0FKeePRGWCFoqP+V4qY+7o/EnrpW/g6b3Z6fkPgcLBJHLx
 QG/anr733zTKHF0gjfa7UNq8a46dWKY7mxP7EvOU3HackRB6XH6PlmPm6SZeM7wKU5z/
 mBKw==
X-Gm-Message-State: AOJu0YyCArAbtBcDe1iCap/424jqL//QKqTvWCk4/S2zHEoI2yYWYfdd
 Rl8HIt5IbZvW0TRSyREcYZhJk/j7863g/iyrkfACFSRXh6P5JpKWP7jgoP66Z6FNgpuH9jNl1KR
 3L06NQliIlwHK/yH7ioDZu0NIki9dnkGufV6o
X-Received: by 2002:a05:600c:46cb:b0:40c:6e8:610a with SMTP id
 q11-20020a05600c46cb00b0040c06e8610amr599034wmo.56.1703239320742; 
 Fri, 22 Dec 2023 02:02:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMbzVJT1bjBf2e/+Ma0qCuN59AGZ45LTB53dTlG40IBb/JgrJ7HP28shzEPdsaAARRvafcmg==
X-Received: by 2002:a05:600c:46cb:b0:40c:6e8:610a with SMTP id
 q11-20020a05600c46cb00b0040c06e8610amr599016wmo.56.1703239320287; 
 Fri, 22 Dec 2023 02:02:00 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bh20-20020a05600c3d1400b0040d15dcb77asm14183757wmb.23.2023.12.22.02.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 02:01:59 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] drm/ssd130x: Add support for the SSD133x OLED
 controller family
Date: Fri, 22 Dec 2023 11:01:41 +0100
Message-ID: <20231222100149.2641687-5-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222100149.2641687-1-javierm@redhat.com>
References: <20231222100149.2641687-1-javierm@redhat.com>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Conor Dooley <conor@kernel.org>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Solomon SSD133x controllers (such as the SSD1331) are used by RGB dot
matrix OLED panels, add a modesetting pipeline to support the chip family.

The SSD133x controllers support 256 (8-bit) and 65k (16-bit) color depths
but only the 256-color mode (DRM_FORMAT_RGB332) is implemented for now.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---

Changes in v4:
- Fix typo in commit message (Jocelyn Falempe).

 drivers/gpu/drm/solomon/ssd130x-i2c.c |   5 +
 drivers/gpu/drm/solomon/ssd130x-spi.c |   7 +
 drivers/gpu/drm/solomon/ssd130x.c     | 370 ++++++++++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.h     |   5 +-
 4 files changed, 386 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index f2ccab9c06d9..a047dbec4e48 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -105,6 +105,11 @@ static const struct of_device_id ssd130x_of_match[] = {
 		.compatible = "solomon,ssd1327",
 		.data = &ssd130x_variants[SSD1327_ID],
 	},
+	/* ssd133x family */
+	{
+		.compatible = "solomon,ssd1331",
+		.data = &ssd130x_variants[SSD1331_ID],
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ssd130x_of_match);
diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index 84e035a7ab3f..84bfde31d172 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -142,6 +142,11 @@ static const struct of_device_id ssd130x_of_match[] = {
 		.compatible = "solomon,ssd1327",
 		.data = &ssd130x_variants[SSD1327_ID],
 	},
+	/* ssd133x family */
+	{
+		.compatible = "solomon,ssd1331",
+		.data = &ssd130x_variants[SSD1331_ID],
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ssd130x_of_match);
@@ -166,6 +171,8 @@ static const struct spi_device_id ssd130x_spi_table[] = {
 	{ "ssd1322", SSD1322_ID },
 	{ "ssd1325", SSD1325_ID },
 	{ "ssd1327", SSD1327_ID },
+	/* ssd133x family */
+	{ "ssd1331", SSD1331_ID },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index bef293922b98..447d0c7c88c6 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -119,6 +119,26 @@
 #define SSD130X_SET_VCOMH_VOLTAGE		0xbe
 #define SSD132X_SET_FUNCTION_SELECT_B		0xd5
 
+/* ssd133x commands */
+#define SSD133X_SET_COL_RANGE			0x15
+#define SSD133X_SET_ROW_RANGE			0x75
+#define SSD133X_CONTRAST_A			0x81
+#define SSD133X_CONTRAST_B			0x82
+#define SSD133X_CONTRAST_C			0x83
+#define SSD133X_SET_MASTER_CURRENT		0x87
+#define SSD132X_SET_PRECHARGE_A			0x8a
+#define SSD132X_SET_PRECHARGE_B			0x8b
+#define SSD132X_SET_PRECHARGE_C			0x8c
+#define SSD133X_SET_DISPLAY_START		0xa1
+#define SSD133X_SET_DISPLAY_OFFSET		0xa2
+#define SSD133X_SET_DISPLAY_NORMAL		0xa4
+#define SSD133X_SET_MASTER_CONFIG		0xad
+#define SSD133X_POWER_SAVE_MODE			0xb0
+#define SSD133X_PHASES_PERIOD			0xb1
+#define SSD133X_SET_CLOCK_FREQ			0xb3
+#define SSD133X_SET_PRECHARGE_VOLTAGE		0xbb
+#define SSD133X_SET_VCOMH_VOLTAGE		0xbe
+
 #define MAX_CONTRAST 255
 
 const struct ssd130x_deviceinfo ssd130x_variants[] = {
@@ -180,6 +200,12 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_width = 128,
 		.default_height = 128,
 		.family_id = SSD132X_FAMILY,
+	},
+	/* ssd133x family */
+	[SSD1331_ID] = {
+		.default_width = 96,
+		.default_height = 64,
+		.family_id = SSD133X_FAMILY,
 	}
 };
 EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
@@ -589,6 +615,117 @@ static int ssd132x_init(struct ssd130x_device *ssd130x)
 	return 0;
 }
 
+static int ssd133x_init(struct ssd130x_device *ssd130x)
+{
+	int ret;
+
+	/* Set color A contrast */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_CONTRAST_A, 0x91);
+	if (ret < 0)
+		return ret;
+
+	/* Set color B contrast */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_CONTRAST_B, 0x50);
+	if (ret < 0)
+		return ret;
+
+	/* Set color C contrast */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_CONTRAST_C, 0x7d);
+	if (ret < 0)
+		return ret;
+
+	/* Set master current */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_MASTER_CURRENT, 0x06);
+	if (ret < 0)
+		return ret;
+
+	/* Set column start and end */
+	ret = ssd130x_write_cmd(ssd130x, 3, SSD133X_SET_COL_RANGE, 0x00, ssd130x->width - 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set row start and end */
+	ret = ssd130x_write_cmd(ssd130x, 3, SSD133X_SET_ROW_RANGE, 0x00, ssd130x->height - 1);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Horizontal Address Increment
+	 * Normal order SA,SB,SC (e.g. RGB)
+	 * COM Split Odd Even
+	 * 256 color format
+	 */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD13XX_SET_SEG_REMAP, 0x20);
+	if (ret < 0)
+		return ret;
+
+	/* Set display start and offset */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_DISPLAY_START, 0x00);
+	if (ret < 0)
+		return ret;
+
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_DISPLAY_OFFSET, 0x00);
+	if (ret < 0)
+		return ret;
+
+	/* Set display mode normal */
+	ret = ssd130x_write_cmd(ssd130x, 1, SSD133X_SET_DISPLAY_NORMAL);
+	if (ret < 0)
+		return ret;
+
+	/* Set multiplex ratio value */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD13XX_SET_MULTIPLEX_RATIO, ssd130x->height - 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set master configuration */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_MASTER_CONFIG, 0x8e);
+	if (ret < 0)
+		return ret;
+
+	/* Set power mode */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_POWER_SAVE_MODE, 0x0b);
+	if (ret < 0)
+		return ret;
+
+	/* Set Phase 1 and 2 period */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_PHASES_PERIOD, 0x31);
+	if (ret < 0)
+		return ret;
+
+	/* Set clock divider */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_CLOCK_FREQ, 0xf0);
+	if (ret < 0)
+		return ret;
+
+	/* Set pre-charge A */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_PRECHARGE_A, 0x64);
+	if (ret < 0)
+		return ret;
+
+	/* Set pre-charge B */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_PRECHARGE_B, 0x78);
+	if (ret < 0)
+		return ret;
+
+	/* Set pre-charge C */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD132X_SET_PRECHARGE_C, 0x64);
+	if (ret < 0)
+		return ret;
+
+	/* Set pre-charge level */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_PRECHARGE_VOLTAGE, 0x3a);
+	if (ret < 0)
+		return ret;
+
+	/* Set VCOMH voltage */
+	ret = ssd130x_write_cmd(ssd130x, 2, SSD133X_SET_VCOMH_VOLTAGE, 0x3e);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 			       struct drm_rect *rect, u8 *buf,
 			       u8 *data_array)
@@ -753,6 +890,47 @@ static int ssd132x_update_rect(struct ssd130x_device *ssd130x,
 	return ret;
 }
 
+static int ssd133x_update_rect(struct ssd130x_device *ssd130x,
+			       struct drm_rect *rect, u8 *data_array,
+			       unsigned int pitch)
+{
+	unsigned int x = rect->x1;
+	unsigned int y = rect->y1;
+	unsigned int columns = drm_rect_width(rect);
+	unsigned int rows = drm_rect_height(rect);
+	int ret;
+
+	/*
+	 * The screen is divided in Segment and Common outputs, where
+	 * COM0 to COM[N - 1] are the rows and SEG0 to SEG[M - 1] are
+	 * the columns.
+	 *
+	 * Each Segment has a 8-bit pixel and each Common output has a
+	 * row of pixels. When using the (default) horizontal address
+	 * increment mode, each byte of data sent to the controller has
+	 * a Segment (e.g: SEG0).
+	 *
+	 * When using the 256 color depth format, each pixel contains 3
+	 * sub-pixels for color A, B and C. These have 3 bit, 3 bit and
+	 * 2 bits respectively.
+	 */
+
+	/* Set column start and end */
+	ret = ssd130x_write_cmd(ssd130x, 3, SSD133X_SET_COL_RANGE, x, columns - 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set row start and end */
+	ret = ssd130x_write_cmd(ssd130x, 3, SSD133X_SET_ROW_RANGE, y, rows - 1);
+	if (ret < 0)
+		return ret;
+
+	/* Write out update in one go since horizontal addressing mode is used */
+	ret = ssd130x_write_data(ssd130x, data_array, pitch * rows);
+
+	return ret;
+}
+
 static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 {
 	unsigned int pages = DIV_ROUND_UP(ssd130x->height, SSD130X_PAGE_HEIGHT);
@@ -805,6 +983,22 @@ static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 	ssd130x_write_data(ssd130x, data_array, columns * height);
 }
 
+static void ssd133x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
+{
+	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	unsigned int pitch;
+
+	if (!fi)
+		return;
+
+	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
+
+	memset(data_array, 0, pitch * ssd130x->height);
+
+	/* Write out update in one go since horizontal addressing mode is used */
+	ssd130x_write_data(ssd130x, data_array, pitch * ssd130x->height);
+}
+
 static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 				const struct iosys_map *vmap,
 				struct drm_rect *rect,
@@ -866,6 +1060,36 @@ static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
 	return ret;
 }
 
+static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
+				const struct iosys_map *vmap,
+				struct drm_rect *rect, u8 *data_array,
+				struct drm_format_conv_state *fmtcnv_state)
+{
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
+	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	unsigned int dst_pitch;
+	struct iosys_map dst;
+	int ret = 0;
+
+	if (!fi)
+		return -EINVAL;
+
+	dst_pitch = drm_format_info_min_pitch(fi, 0, drm_rect_width(rect));
+
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
+
+	iosys_map_set_vaddr(&dst, data_array);
+	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
+	ssd133x_update_rect(ssd130x, rect, data_array, dst_pitch);
+
+	return ret;
+}
+
 static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
 					      struct drm_atomic_state *state)
 {
@@ -964,6 +1188,29 @@ static int ssd132x_primary_plane_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static int ssd133x_primary_plane_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+	else if (!plane_state->visible)
+		return 0;
+
+	return 0;
+}
+
 static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
 						struct drm_atomic_state *state)
 {
@@ -1034,6 +1281,39 @@ static void ssd132x_primary_plane_atomic_update(struct drm_plane *plane,
 	drm_dev_exit(idx);
 }
 
+static void ssd133x_primary_plane_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	struct ssd130x_crtc_state *ssd130x_crtc_state =  to_ssd130x_crtc_state(crtc_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_device *drm = plane->dev;
+	struct drm_rect dst_clip;
+	struct drm_rect damage;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		dst_clip = plane_state->dst;
+
+		if (!drm_rect_intersect(&dst_clip, &damage))
+			continue;
+
+		ssd133x_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
+				     ssd130x_crtc_state->data_array,
+				     &shadow_plane_state->fmtcnv_state);
+	}
+
+	drm_dev_exit(idx);
+}
+
 static void ssd130x_primary_plane_atomic_disable(struct drm_plane *plane,
 						 struct drm_atomic_state *state)
 {
@@ -1082,6 +1362,30 @@ static void ssd132x_primary_plane_atomic_disable(struct drm_plane *plane,
 	drm_dev_exit(idx);
 }
 
+static void ssd133x_primary_plane_atomic_disable(struct drm_plane *plane,
+						 struct drm_atomic_state *state)
+{
+	struct drm_device *drm = plane->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *crtc_state;
+	struct ssd130x_crtc_state *ssd130x_crtc_state;
+	int idx;
+
+	if (!plane_state->crtc)
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	ssd130x_crtc_state = to_ssd130x_crtc_state(crtc_state);
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	ssd133x_clear_screen(ssd130x, ssd130x_crtc_state->data_array);
+
+	drm_dev_exit(idx);
+}
+
 /* Called during init to allocate the plane's atomic state. */
 static void ssd130x_primary_plane_reset(struct drm_plane *plane)
 {
@@ -1144,6 +1448,12 @@ static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs[]
 		.atomic_check = ssd132x_primary_plane_atomic_check,
 		.atomic_update = ssd132x_primary_plane_atomic_update,
 		.atomic_disable = ssd132x_primary_plane_atomic_disable,
+	},
+	[SSD133X_FAMILY] = {
+		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+		.atomic_check = ssd133x_primary_plane_atomic_check,
+		.atomic_update = ssd133x_primary_plane_atomic_update,
+		.atomic_disable = ssd133x_primary_plane_atomic_disable,
 	}
 };
 
@@ -1214,6 +1524,33 @@ static int ssd132x_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
+				     struct drm_atomic_state *state)
+{
+	struct drm_device *drm = crtc->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(crtc_state);
+	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	unsigned int pitch;
+	int ret;
+
+	if (!fi)
+		return -EINVAL;
+
+	ret = drm_crtc_helper_atomic_check(crtc, state);
+	if (ret)
+		return ret;
+
+	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
+
+	ssd130x_state->data_array = kmalloc(pitch * ssd130x->height, GFP_KERNEL);
+	if (!ssd130x_state->data_array)
+		return -ENOMEM;
+
+	return 0;
+}
+
 /* Called during init to allocate the CRTC's atomic state. */
 static void ssd130x_crtc_reset(struct drm_crtc *crtc)
 {
@@ -1275,6 +1612,10 @@ static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs[] = {
 		.mode_valid = ssd130x_crtc_mode_valid,
 		.atomic_check = ssd132x_crtc_atomic_check,
 	},
+	[SSD133X_FAMILY] = {
+		.mode_valid = ssd130x_crtc_mode_valid,
+		.atomic_check = ssd133x_crtc_atomic_check,
+	},
 };
 
 static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
@@ -1337,6 +1678,31 @@ static void ssd132x_encoder_atomic_enable(struct drm_encoder *encoder,
 	ssd130x_power_off(ssd130x);
 }
 
+static void ssd133x_encoder_atomic_enable(struct drm_encoder *encoder,
+					  struct drm_atomic_state *state)
+{
+	struct drm_device *drm = encoder->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	int ret;
+
+	ret = ssd130x_power_on(ssd130x);
+	if (ret)
+		return;
+
+	ret = ssd133x_init(ssd130x);
+	if (ret)
+		goto power_off;
+
+	ssd130x_write_cmd(ssd130x, 1, SSD13XX_DISPLAY_ON);
+
+	backlight_enable(ssd130x->bl_dev);
+
+	return;
+
+power_off:
+	ssd130x_power_off(ssd130x);
+}
+
 static void ssd130x_encoder_atomic_disable(struct drm_encoder *encoder,
 					   struct drm_atomic_state *state)
 {
@@ -1358,6 +1724,10 @@ static const struct drm_encoder_helper_funcs ssd130x_encoder_helper_funcs[] = {
 	[SSD132X_FAMILY] = {
 		.atomic_enable = ssd132x_encoder_atomic_enable,
 		.atomic_disable = ssd130x_encoder_atomic_disable,
+	},
+	[SSD133X_FAMILY] = {
+		.atomic_enable = ssd133x_encoder_atomic_enable,
+		.atomic_disable = ssd130x_encoder_atomic_disable,
 	}
 };
 
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index 075c5c3ee75a..a4554018bb2a 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -25,7 +25,8 @@
 
 enum ssd130x_family_ids {
 	SSD130X_FAMILY,
-	SSD132X_FAMILY
+	SSD132X_FAMILY,
+	SSD133X_FAMILY
 };
 
 enum ssd130x_variants {
@@ -39,6 +40,8 @@ enum ssd130x_variants {
 	SSD1322_ID,
 	SSD1325_ID,
 	SSD1327_ID,
+	/* ssd133x family */
+	SSD1331_ID,
 	NR_SSD130X_VARIANTS
 };
 
-- 
2.43.0

