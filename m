Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1B47C65F1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 08:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23A710E00C;
	Thu, 12 Oct 2023 06:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E580310E00C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697093910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mbymuqok05VINAfw8cxu/tPwEjlcj5Oue+IDRMaC16g=;
 b=dK2y5HkOH4e2b+gQrpgUYivKNNGHQ2W5nZ1z7zGeMuulP6qonJEWwn0AH0d4dZE7oU7acT
 GdXgCiK2dD++vu4OXLljTAsqU8SaZhH2LT8BwMM21oeh5NCbNg6nCpNROi/uxpbs/ydbu+
 31VCZZhmzgRbuBYsWPUYej2IrEpZ82A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-Z6l6yt5VNI2wf7Sw1LZ0zA-1; Thu, 12 Oct 2023 02:58:28 -0400
X-MC-Unique: Z6l6yt5VNI2wf7Sw1LZ0zA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32980f21cd4so410898f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 23:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697093907; x=1697698707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mbymuqok05VINAfw8cxu/tPwEjlcj5Oue+IDRMaC16g=;
 b=gvq9gK6s9yXcdwZ2UnOOkGGP4qiGOjJWrCraZPwbLnf6GIrC0zbqBGuVPvI8hwMe2t
 DWWPEWPN+l+g2Suvpt6vG/ckrmT/gEzInTmSE+JSqM1B+WqephYayqiQKFQvbwDO22qV
 l+Tt93jDw6olbFT8n0gS1aJPTy/QWWe31GiDngkrMvGRljfs+X1rSoFWLrE8Tp1uyiUv
 18JubKNzwUYIOJUK4h1CDsShTBUaZ/T+FUHvjnCSR/a6/gtZPfK7YJyuJCAikofMOcNK
 xNuDa0eYRqAmiq37uQXIpbwbNSJbpJDVkQ7tCI0LcRM8+Cfkw/h5F2uSfaywJciHCjjV
 l4TQ==
X-Gm-Message-State: AOJu0YyVvlc4QWsD/AozfYFjC4yNa1DVtW5gT0eWl+Jvz9NgDeSOJ9Ln
 BCO8Qr+h50v4zLTTBpo2L5HBpvt0AnLCVxzcWRlJVB1wc/9cH4dE/zp4JDWXC8euz7oV+eEMqkf
 3T9hICMN9nM9momNO6pq1Ntf4JkcU
X-Received: by 2002:a05:6000:a14:b0:32c:a930:fe0e with SMTP id
 co20-20020a0560000a1400b0032ca930fe0emr7866698wrb.14.1697093907651; 
 Wed, 11 Oct 2023 23:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyFeT+2x5WBZld6FVhLFSCPrBl+EViMXQ3LHhy0Jx56i32BtM/idfewL94KsllK10JzCqiEA==
X-Received: by 2002:a05:6000:a14:b0:32c:a930:fe0e with SMTP id
 co20-20020a0560000a1400b0032ca930fe0emr7866681wrb.14.1697093907430; 
 Wed, 11 Oct 2023 23:58:27 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r18-20020adfe692000000b0031912c0ffebsm17460772wrm.23.2023.10.11.23.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 23:58:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] drm/ssd130x: Replace .page_height field in device info
 with a constant
Date: Thu, 12 Oct 2023 08:58:10 +0200
Message-ID: <20231012065822.1007930-2-javierm@redhat.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v2:
- Add Geert Uytterhoeven's Reviewed-by tag to patch #1.

 drivers/gpu/drm/solomon/ssd130x.c | 37 +++++++++++++++----------------
 drivers/gpu/drm/solomon/ssd130x.h |  1 -
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 6dcf3e041113..2852cddb098b 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -42,6 +42,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+#define SSD130X_PAGE_HEIGHT 8
+
 #define SSD130X_PAGE_COL_START_LOW		0x00
 #define SSD130X_PAGE_COL_START_HIGH		0x10
 #define SSD130X_SET_ADDRESS_MODE		0x20
@@ -102,7 +104,6 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_width = 132,
 		.default_height = 64,
 		.page_mode_only = 1,
-		.page_height = 8,
 	},
 	[SSD1305_ID] = {
 		.default_vcomh = 0x34,
@@ -110,7 +111,6 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_dclk_frq = 7,
 		.default_width = 132,
 		.default_height = 64,
-		.page_height = 8,
 	},
 	[SSD1306_ID] = {
 		.default_vcomh = 0x20,
@@ -119,7 +119,6 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.need_chargepump = 1,
 		.default_width = 128,
 		.default_height = 64,
-		.page_height = 8,
 	},
 	[SSD1307_ID] = {
 		.default_vcomh = 0x20,
@@ -128,7 +127,6 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.need_pwm = 1,
 		.default_width = 128,
 		.default_height = 39,
-		.page_height = 8,
 	},
 	[SSD1309_ID] = {
 		.default_vcomh = 0x34,
@@ -136,7 +134,6 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_dclk_frq = 10,
 		.default_width = 128,
 		.default_height = 64,
-		.page_height = 8,
 	}
 };
 EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
@@ -465,13 +462,13 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 	unsigned int width = drm_rect_width(rect);
 	unsigned int height = drm_rect_height(rect);
 	unsigned int line_length = DIV_ROUND_UP(width, 8);
-	unsigned int page_height = ssd130x->device_info->page_height;
+	unsigned int page_height = SSD130X_PAGE_HEIGHT;
 	unsigned int pages = DIV_ROUND_UP(height, page_height);
 	struct drm_device *drm = &ssd130x->drm;
 	u32 array_idx = 0;
 	int ret, i, j, k;
 
-	drm_WARN_ONCE(drm, y % 8 != 0, "y must be aligned to screen page\n");
+	drm_WARN_ONCE(drm, y % page_height != 0, "y must be aligned to screen page\n");
 
 	/*
 	 * The screen is divided in pages, each having a height of 8
@@ -503,27 +500,32 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 	 */
 
 	if (!ssd130x->page_address_mode) {
+		u8 page_start;
+
 		/* Set address range for horizontal addressing mode */
 		ret = ssd130x_set_col_range(ssd130x, ssd130x->col_offset + x, width);
 		if (ret < 0)
 			return ret;
 
-		ret = ssd130x_set_page_range(ssd130x, ssd130x->page_offset + y / 8, pages);
+		page_start = ssd130x->page_offset + y / page_height;
+		ret = ssd130x_set_page_range(ssd130x, page_start, pages);
 		if (ret < 0)
 			return ret;
 	}
 
 	for (i = 0; i < pages; i++) {
-		int m = 8;
+		int m = page_height;
 
 		/* Last page may be partial */
-		if (8 * (y / 8 + i + 1) > ssd130x->height)
-			m = ssd130x->height % 8;
+		if (page_height * (y / page_height + i + 1) > ssd130x->height)
+			m = ssd130x->height % page_height;
+
 		for (j = 0; j < width; j++) {
 			u8 data = 0;
 
 			for (k = 0; k < m; k++) {
-				u8 byte = buf[(8 * i + k) * line_length + j / 8];
+				u32 idx = (page_height * i + k) * line_length + j / 8;
+				u8 byte = buf[idx];
 				u8 bit = (byte >> (j % 8)) & 1;
 
 				data |= bit << k;
@@ -559,8 +561,7 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 
 static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 {
-	unsigned int page_height = ssd130x->device_info->page_height;
-	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+	unsigned int pages = DIV_ROUND_UP(ssd130x->height, SSD130X_PAGE_HEIGHT);
 	unsigned int width = ssd130x->width;
 	int ret, i;
 
@@ -605,14 +606,13 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 				u8 *buf, u8 *data_array)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
-	unsigned int page_height = ssd130x->device_info->page_height;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
 
 	/* Align y to display page boundaries */
-	rect->y1 = round_down(rect->y1, page_height);
-	rect->y2 = min_t(unsigned int, round_up(rect->y2, page_height), ssd130x->height);
+	rect->y1 = round_down(rect->y1, SSD130X_PAGE_HEIGHT);
+	rect->y2 = min_t(unsigned int, round_up(rect->y2, SSD130X_PAGE_HEIGHT), ssd130x->height);
 
 	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
 
@@ -814,8 +814,7 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(crtc_state);
-	unsigned int page_height = ssd130x->device_info->page_height;
-	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+	unsigned int pages = DIV_ROUND_UP(ssd130x->height, SSD130X_PAGE_HEIGHT);
 	int ret;
 
 	ret = drm_crtc_helper_atomic_check(crtc, state);
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index aa39b13615eb..bbe374453605 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -39,7 +39,6 @@ struct ssd130x_deviceinfo {
 	u32 default_dclk_frq;
 	u32 default_width;
 	u32 default_height;
-	u32 page_height;
 	bool need_pwm;
 	bool need_chargepump;
 	bool page_mode_only;
-- 
2.41.0

