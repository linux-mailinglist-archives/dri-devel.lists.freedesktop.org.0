Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F0940817
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 08:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EB710E3FA;
	Tue, 30 Jul 2024 06:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XL70elmA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F6F10E3FA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 06:07:29 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1fee6435a34so24549525ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 23:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722319649; x=1722924449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2nUjLNuPhA0ZemM5E+a6+HXIf2vTrBCrMNImUmEpou0=;
 b=XL70elmAQ6MPLpAUd3i+bZ27Jt/7UG9/dkydbCC8tSi+mOAYJKlPzp/B6qRKmSVnqY
 AkdFmuCbQ1SWhVU6DJYxr1iEhc94Pa//0r3eKdeXR91KR8VH/VTFi0Dmum2wJyqy/kY7
 VMDukbUG2l3wvJEzOYbodsf7SOxevFjC3HXUyHFiLoeg4wqzTYNawvgFeuvK55LtNrVf
 r/3lzREP7z5IvmPYFBJb8rGcBPnOqXgxbU51X+KmGiSCxB+PRbnm3fAtuJdsqJcsnMPi
 Tto8N3WNLiVeJjtUxvssO5ObWmLmQjCfkVeey7D0XIqYYfAdbENXUA9cbKZwwpBHu0c5
 Nueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722319649; x=1722924449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2nUjLNuPhA0ZemM5E+a6+HXIf2vTrBCrMNImUmEpou0=;
 b=Js36sqX7pHggCTJDQCVlETgs7GnmFBAg3H4rlbXl1bYTwkWwc1N0VmYD3TaxxRkAXz
 rT57/k86adaw5QXyvK8gOc6BscvTgNbdfcgJQoyGQgB1aZJlURrySRUblhtO2joEaLqM
 //pQ4ZM9BlJZciXjYX/4NMlOiRxQcXtchIy2Cpcz1SN3H/3e1hKmnNUQYsFcp+/FpzSy
 dVaHBdnFUHZhsjDYoDZtu/05rKe6zPC8WgCEWK25cXQ/Ph3Mp4NpOnet1aQ5vqqhFbVQ
 k6VpYj0ksMGn4i9JP/jhIcEIYkTYAytH5QAfcUb6h/qvDq34ynh41tMx0RnmWvo9iOLG
 Q4AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLCgEgwF693ivWc4cYStL7dGG8NQUjCFIJo+lUUNu7l1EVF6KJ0sXYBjPPn5QhRPg6hRBrApALCfK4Jn3VT+ylqRyBAv7wOnw0IQukIVpg
X-Gm-Message-State: AOJu0YwVou7X6CpuvVnkjlVIC416w1VSx1hhSDVbsY2Uy5h4DNJLiq7F
 cV+vjZuCPReT9RiMLSJSzfsRTiQ7xOOfAqN8kixiH55PMjLtM3ni
X-Google-Smtp-Source: AGHT+IFCAk8xtEo9IOGEMHT4pM4XLaFJu1tAipcjmvjw2BFrQGf8AKqe85DxNjL12FVVm0m2oMcE2g==
X-Received: by 2002:a17:903:2289:b0:1fb:37fa:fedb with SMTP id
 d9443c01a7336-1ff04805bb5mr83419115ad.10.1722319649042; 
 Mon, 29 Jul 2024 23:07:29 -0700 (PDT)
Received: from distilledx.localdomain
 ([2401:4900:6320:5c5f:a09c:1e46:e58e:e6c6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7eef4f0sm93589375ad.178.2024.07.29.23.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 23:07:28 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2 2/2] drm/panel: startek-kd070fhfid015: transition to
 mipi_dsi wrapped functions
Date: Tue, 30 Jul 2024 11:36:59 +0530
Message-ID: <20240730060659.455953-3-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730060659.455953-1-tejasvipin76@gmail.com>
References: <20240730060659.455953-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use multi style wrapped functions for mipi_dsi in the
startek-kd070fhfid015 panel.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 .../drm/panel/panel-startek-kd070fhfid015.c   | 123 ++++++------------
 1 file changed, 39 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
index 0156689f41cd..f1df727b9183 100644
--- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
+++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
@@ -24,10 +24,10 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
-#define DSI_REG_MCAP	0xB0
-#define DSI_REG_IS	0xB3 /* Interface Setting */
-#define DSI_REG_IIS	0xB4 /* Interface ID Setting */
-#define DSI_REG_CTRL	0xB6
+#define DSI_REG_MCAP	0xb0
+#define DSI_REG_IS	0xb3 /* Interface Setting */
+#define DSI_REG_IIS	0xb4 /* Interface ID Setting */
+#define DSI_REG_CTRL	0xb6
 
 enum {
 	IOVCC = 0,
@@ -52,92 +52,55 @@ static inline struct stk_panel *to_stk_panel(struct drm_panel *panel)
 static int stk_panel_init(struct stk_panel *stk)
 {
 	struct mipi_dsi_device *dsi = stk->dsi;
-	struct device *dev = &stk->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
 
-	ret = mipi_dsi_dcs_soft_reset(dsi);
-	if (ret < 0) {
-		dev_err(dev, "failed to mipi_dsi_dcs_soft_reset: %d\n", ret);
-		return ret;
-	}
-	mdelay(5);
+	mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 5);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "failed to set exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
-
-	mipi_dsi_generic_write_seq(dsi, DSI_REG_MCAP, 0x04);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_MCAP, 0x04);
 
 	/* Interface setting, video mode */
-	mipi_dsi_generic_write_seq(dsi, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00);
-	mipi_dsi_generic_write_seq(dsi, DSI_REG_IIS, 0x0C, 0x00);
-	mipi_dsi_generic_write_seq(dsi, DSI_REG_CTRL, 0x3A, 0xD3);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_IIS, 0x0c, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_CTRL, 0x3a, 0xd3);
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x77);
-	if (ret < 0) {
-		dev_err(dev, "failed to write display brightness: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x77);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
-			       MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     MIPI_DCS_WRITE_MEMORY_START);
 
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
-	if (ret < 0) {
-		dev_err(dev, "failed to set pixel format: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x77);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, stk->mode->hdisplay - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, stk->mode->vdisplay - 1);
 
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0, stk->mode->hdisplay - 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to set column address: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0, stk->mode->vdisplay - 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to set page address: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int stk_panel_on(struct stk_panel *stk)
 {
 	struct mipi_dsi_device *dsi = stk->dsi;
-	struct device *dev = &stk->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to set display on: %d\n", ret);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	mdelay(20);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static void stk_panel_off(struct stk_panel *stk)
 {
 	struct mipi_dsi_device *dsi = stk->dsi;
-	struct device *dev = &stk->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to set display off: %d\n", ret);
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to enter sleep mode: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	msleep(100);
+	mipi_dsi_msleep(&dsi_ctx, 100);
 }
 
 static int stk_panel_unprepare(struct drm_panel *panel)
@@ -155,7 +118,6 @@ static int stk_panel_unprepare(struct drm_panel *panel)
 static int stk_panel_prepare(struct drm_panel *panel)
 {
 	struct stk_panel *stk = to_stk_panel(panel);
-	struct device *dev = &stk->dsi->dev;
 	int ret;
 
 	gpiod_set_value(stk->reset_gpio, 0);
@@ -175,16 +137,12 @@ static int stk_panel_prepare(struct drm_panel *panel)
 	gpiod_set_value(stk->reset_gpio, 1);
 	mdelay(10);
 	ret = stk_panel_init(stk);
-	if (ret < 0) {
-		dev_err(dev, "failed to init panel: %d\n", ret);
+	if (ret < 0)
 		goto poweroff;
-	}
 
 	ret = stk_panel_on(stk);
-	if (ret < 0) {
-		dev_err(dev, "failed to set panel on: %d\n", ret);
+	if (ret < 0)
 		goto poweroff;
-	}
 
 	return 0;
 
@@ -235,13 +193,13 @@ static int stk_panel_get_modes(struct drm_panel *panel,
 static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	u16 brightness;
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_get_display_brightness_multi(&dsi_ctx, &brightness);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 	return brightness & 0xff;
@@ -250,18 +208,15 @@ static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
 static int dsi_dcs_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
-	if (ret < 0) {
-		dev_err(dev, "failed to set DSI control: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, bl->props.brightness);
+	if (dsi_ctx.accum_err)
+		return dsi_ctx.accum_err;
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static const struct backlight_ops dsi_bl_ops = {
-- 
2.45.2

