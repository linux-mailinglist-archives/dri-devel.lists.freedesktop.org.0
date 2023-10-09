Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0AA7BE996
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C650910E2B6;
	Mon,  9 Oct 2023 18:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C871E10E2B2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696876566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gALg4BuzDzCCCf3P05cRSMli/frUwAArjCkEkdq6b1A=;
 b=OCZts/GZIK4hGRU8ZCxcF/IbnW2aXi95ndzOXcHkl3k14EsSba6bn+bFdxqr3jpCjb6uCa
 V+rSiu/yA+s40BhtINzPnv5Hv8QFXg+jG0OXYv0HBRCWyomS7vlHGJSRFgMl6sliLvIlEQ
 cnTiqwkwkgCQHN7ZvclSgVmAQJHf4M0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-PdQg7ee3NKqFEyu64yQbAw-1; Mon, 09 Oct 2023 14:36:04 -0400
X-MC-Unique: PdQg7ee3NKqFEyu64yQbAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-405629826ccso36923215e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696876563; x=1697481363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gALg4BuzDzCCCf3P05cRSMli/frUwAArjCkEkdq6b1A=;
 b=GspI2y3sBbs00Vbe/fXLiTVLw3Kbs0V1cbNtooUmFDgcOlVetBhH89gcdCKnluT3Py
 WGyq4N3nLlwEtjI/C98xxLtdRCmWpMAnzUGa0g6p/t7NPdVpUUHh7sr1Rdfk+taq0MZ5
 Cqq75mBgGtZ5bz8Djfnb6sOVStgoJswZ4V/qamvNifCsG47xFcchHzsJNWvQBS/gXfmr
 UvJS+c/5n8UpYm5AepI12JW+Cavncqr915p5Ney814jknNXpe0XgiUgur+rhx0+cb7tX
 R9SsQgsrPftkLJ6tsHygajCOyGSvEQw52YWTjobU1p2sF45KX5I8+vYJzjRpZT2bT03S
 P8jw==
X-Gm-Message-State: AOJu0YwefE03vZRkhglFH5Wd1ivOd52OCyy/Ae2uDZikpqIjXf6ry7gg
 wmNL0i1mnJU2zPjicOyDcdlYbBdEqI/q6zl704ybdwohA5sT7G8Nmps41VcUSNXRwBEe5Q+k8pS
 1kYL/pkBHrd/BibbVwv1RNslYuXNb
X-Received: by 2002:a05:6000:1e08:b0:329:6662:ac1d with SMTP id
 bj8-20020a0560001e0800b003296662ac1dmr11185853wrb.24.1696876562961; 
 Mon, 09 Oct 2023 11:36:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECJPV6fQzltcRPHfYUiuUATolHxklI0ViN4dcGzNMpNc2h6oW6hYsnrP1UmTcgV1MSDxmuGw==
X-Received: by 2002:a05:6000:1e08:b0:329:6662:ac1d with SMTP id
 bj8-20020a0560001e0800b003296662ac1dmr11185837wrb.24.1696876562733; 
 Mon, 09 Oct 2023 11:36:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b003296b913bbesm9770081wrd.12.2023.10.09.11.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:36:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] drm/ssd13xx: Replace .page_height field in device info
 with a constant
Date: Mon,  9 Oct 2023 20:34:17 +0200
Message-ID: <20231009183522.543918-4-javierm@redhat.com>
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

This deemed useful to avoid hardcoding a page height and allow to support
other Solomon controller families, but dividing the screen in pages seems
to be something that is specific to the SSD130x chip family.

For example, SSD132x chip family divides the screen in segments (columns)
and common outputs (rows), so the concept of screen pages does not exist
for the SSD132x family.

Let's drop this field from the device info struct and just use a constant
SSD130X_PAGE_HEIGHT macro to define the page height. While being there,
replace hardcoded 8 values in places where it is used as the page height.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd13xx.c | 37 +++++++++++++++----------------
 drivers/gpu/drm/solomon/ssd13xx.h |  1 -
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd13xx.c b/drivers/gpu/drm/solomon/ssd13xx.c
index 10a767fb614c..d29be17665b5 100644
--- a/drivers/gpu/drm/solomon/ssd13xx.c
+++ b/drivers/gpu/drm/solomon/ssd13xx.c
@@ -42,6 +42,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+#define SSD130X_PAGE_HEIGHT 8
+
 #define SSD130X_PAGE_COL_START_LOW		0x00
 #define SSD130X_PAGE_COL_START_HIGH		0x10
 #define SSD130X_SET_ADDRESS_MODE		0x20
@@ -102,7 +104,6 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 		.default_width = 132,
 		.default_height = 64,
 		.page_mode_only = 1,
-		.page_height = 8,
 	},
 	[SSD1305_ID] = {
 		.default_vcomh = 0x34,
@@ -110,7 +111,6 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 		.default_dclk_frq = 7,
 		.default_width = 132,
 		.default_height = 64,
-		.page_height = 8,
 	},
 	[SSD1306_ID] = {
 		.default_vcomh = 0x20,
@@ -119,7 +119,6 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 		.need_chargepump = 1,
 		.default_width = 128,
 		.default_height = 64,
-		.page_height = 8,
 	},
 	[SSD1307_ID] = {
 		.default_vcomh = 0x20,
@@ -128,7 +127,6 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 		.need_pwm = 1,
 		.default_width = 128,
 		.default_height = 39,
-		.page_height = 8,
 	},
 	[SSD1309_ID] = {
 		.default_vcomh = 0x34,
@@ -136,7 +134,6 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 		.default_dclk_frq = 10,
 		.default_width = 128,
 		.default_height = 64,
-		.page_height = 8,
 	}
 };
 EXPORT_SYMBOL_NS_GPL(ssd13xx_variants, DRM_SSD13XX);
@@ -465,13 +462,13 @@ static int ssd13xx_update_rect(struct ssd13xx_device *ssd13xx,
 	unsigned int width = drm_rect_width(rect);
 	unsigned int height = drm_rect_height(rect);
 	unsigned int line_length = DIV_ROUND_UP(width, 8);
-	unsigned int page_height = ssd13xx->device_info->page_height;
+	unsigned int page_height = SSD130X_PAGE_HEIGHT;
 	unsigned int pages = DIV_ROUND_UP(height, page_height);
 	struct drm_device *drm = &ssd13xx->drm;
 	u32 array_idx = 0;
 	int ret, i, j, k;
 
-	drm_WARN_ONCE(drm, y % 8 != 0, "y must be aligned to screen page\n");
+	drm_WARN_ONCE(drm, y % page_height != 0, "y must be aligned to screen page\n");
 
 	/*
 	 * The screen is divided in pages, each having a height of 8
@@ -503,27 +500,32 @@ static int ssd13xx_update_rect(struct ssd13xx_device *ssd13xx,
 	 */
 
 	if (!ssd13xx->page_address_mode) {
+		u8 page_start;
+
 		/* Set address range for horizontal addressing mode */
 		ret = ssd13xx_set_col_range(ssd13xx, ssd13xx->col_offset + x, width);
 		if (ret < 0)
 			return ret;
 
-		ret = ssd13xx_set_page_range(ssd13xx, ssd13xx->page_offset + y / 8, pages);
+		page_start = ssd13xx->page_offset + y / page_height;
+		ret = ssd13xx_set_page_range(ssd13xx, page_start, pages);
 		if (ret < 0)
 			return ret;
 	}
 
 	for (i = 0; i < pages; i++) {
-		int m = 8;
+		int m = page_height;
 
 		/* Last page may be partial */
-		if (8 * (y / 8 + i + 1) > ssd13xx->height)
-			m = ssd13xx->height % 8;
+		if (page_height * (y / page_height + i + 1) > ssd13xx->height)
+			m = ssd13xx->height % page_height;
+
 		for (j = 0; j < width; j++) {
 			u8 data = 0;
 
 			for (k = 0; k < m; k++) {
-				u8 byte = buf[(8 * i + k) * line_length + j / 8];
+				u32 idx = (page_height * i + k) * line_length + j / 8;
+				u8 byte = buf[idx];
 				u8 bit = (byte >> (j % 8)) & 1;
 
 				data |= bit << k;
@@ -559,8 +561,7 @@ static int ssd13xx_update_rect(struct ssd13xx_device *ssd13xx,
 
 static void ssd13xx_clear_screen(struct ssd13xx_device *ssd13xx, u8 *data_array)
 {
-	unsigned int page_height = ssd13xx->device_info->page_height;
-	unsigned int pages = DIV_ROUND_UP(ssd13xx->height, page_height);
+	unsigned int pages = DIV_ROUND_UP(ssd13xx->height, SSD130X_PAGE_HEIGHT);
 	unsigned int width = ssd13xx->width;
 	int ret, i;
 
@@ -605,14 +606,13 @@ static int ssd13xx_fb_blit_rect(struct drm_framebuffer *fb,
 				u8 *buf, u8 *data_array)
 {
 	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(fb->dev);
-	unsigned int page_height = ssd13xx->device_info->page_height;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
 
 	/* Align y to display page boundaries */
-	rect->y1 = round_down(rect->y1, page_height);
-	rect->y2 = min_t(unsigned int, round_up(rect->y2, page_height), ssd13xx->height);
+	rect->y1 = round_down(rect->y1, SSD130X_PAGE_HEIGHT);
+	rect->y2 = min_t(unsigned int, round_up(rect->y2, SSD130X_PAGE_HEIGHT), ssd13xx->height);
 
 	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
 
@@ -814,8 +814,7 @@ static int ssd13xx_crtc_atomic_check(struct drm_crtc *crtc,
 	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ssd13xx_crtc_state *ssd13xx_state = to_ssd13xx_crtc_state(crtc_state);
-	unsigned int page_height = ssd13xx->device_info->page_height;
-	unsigned int pages = DIV_ROUND_UP(ssd13xx->height, page_height);
+	unsigned int pages = DIV_ROUND_UP(ssd13xx->height, SSD130X_PAGE_HEIGHT);
 	int ret;
 
 	ret = drm_crtc_helper_atomic_check(crtc, state);
diff --git a/drivers/gpu/drm/solomon/ssd13xx.h b/drivers/gpu/drm/solomon/ssd13xx.h
index e5abf23196b0..64283935fbc1 100644
--- a/drivers/gpu/drm/solomon/ssd13xx.h
+++ b/drivers/gpu/drm/solomon/ssd13xx.h
@@ -39,7 +39,6 @@ struct ssd13xx_deviceinfo {
 	u32 default_dclk_frq;
 	u32 default_width;
 	u32 default_height;
-	u32 page_height;
 	bool need_pwm;
 	bool need_chargepump;
 	bool page_mode_only;
-- 
2.41.0

