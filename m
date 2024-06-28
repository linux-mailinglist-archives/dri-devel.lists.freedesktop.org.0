Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148791C5A0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071CC10ECFA;
	Fri, 28 Jun 2024 18:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AH+LkBqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1FC10ECFB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 18:25:19 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1f4c7b022f8so6304615ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719599119; x=1720203919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wfBm8V9NV7G6pqPtIBKn244UHr+yYxygJZ9Qu/8ilKA=;
 b=AH+LkBqFSIPkEO8nPJKtbf0DJUoJEVfJy+Ax2MIIQ6sO7uahHjNiDIzdgVJnGTz2a0
 2q6ObJKTRfdkEO3uJBROnluqR8wjrq2gPDsaUMWsvIf9xD2VCg85sMCV1hZckOWxHTIg
 5u1nOi4A19PsXzSxjqd5mU0JvdTDoc9jgsmfbDWf5Xbqs923ut6/kAkzAAWg7qtC+zlU
 +8lCR9Xgq1JmxuJ+9I3b2DG6bD5LvAmLtqdiVEpeLEWwOW/GGtZpNJrFxCJKZNneuiOx
 yRr+63W1Y+CDxALDLCYuy9PVKngyorecILfV8NgGd+OVh/GIgAaS/SQPrPanw/nj3+e2
 wkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719599119; x=1720203919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfBm8V9NV7G6pqPtIBKn244UHr+yYxygJZ9Qu/8ilKA=;
 b=XTfwQ3QurMVY/WLE608BdcRjk10XX/xhMigTGlugsCw53nNCOWYx6KAV5FrczC/EY9
 Ug179qyprhF0DFGVD/EeloVyzELbl+aIozUzvk97Pv1JO44zU0WoIMVHfF8G8Hlh0aMU
 8iOujEllIyrBth73WWyCWo61rqLoBZww7tpOzx8ODpo2LHxH6WYydo3OU5zclJhtK9DW
 qJEq5LO5+PFsxuqasx//bKjLqv9POjKi8LlHtdIrps3YJ3rUELGVbI4HRNCSZDdhgoQw
 MSYN4KQOxAr3zuL3WDRgTF55HFdtuvPCRbPu/rvIemzoeVztA1Jv0SUkJ69nSWGBpimy
 NOMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwdwMgNN3lIBy4c3MSgmI3+UAV0pZ1bjV5inLFb6b4tVyDTlniaZaT+YRLxa4tyM/w4NZnbXMblYxT51GsTJLcCbFvdcBwx0vFc21XbiDk
X-Gm-Message-State: AOJu0YxDnyYPb0mAZvtE6k93RoP4ibEXLJKR/EG35cP44AqTZYNr6lXX
 bE/UqNIs/igdPm4ygNLq5o/GUqWqb8tjeMA2izWurriWPZ6Lnj0C
X-Google-Smtp-Source: AGHT+IF2h8mtrMLcscWEwhh6vN6i5Afk/cteeBt9wnk4CW19G9u0jb4V25LgKABMzllKERcphwATgw==
X-Received: by 2002:a17:902:c401:b0:1f9:9a24:dc29 with SMTP id
 d9443c01a7336-1fa23be2439mr193767495ad.24.1719599119217; 
 Fri, 28 Jun 2024 11:25:19 -0700 (PDT)
Received: from distilledx.localdomain ([122.172.84.231])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e21aesm18557465ad.64.2024.06.28.11.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 11:25:18 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 2/2] drm/panel: startek-kd070fhfid015: transition to mipi_dsi
 wrapped functions
Date: Fri, 28 Jun 2024 23:54:28 +0530
Message-ID: <20240628182428.171031-3-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628182428.171031-1-tejasvipin76@gmail.com>
References: <20240628182428.171031-1-tejasvipin76@gmail.com>
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
 .../drm/panel/panel-startek-kd070fhfid015.c   | 107 ++++++------------
 1 file changed, 35 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
index 0156689f41cd..d58c81c43724 100644
--- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
+++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
@@ -52,92 +52,63 @@ static inline struct stk_panel *to_stk_panel(struct drm_panel *panel)
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
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "failed to set exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	if (!dsi_ctx.accum_err)
+		mdelay(5);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
-	mipi_dsi_generic_write_seq(dsi, DSI_REG_MCAP, 0x04);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_MCAP, 0x04);
 
 	/* Interface setting, video mode */
-	mipi_dsi_generic_write_seq(dsi, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00);
-	mipi_dsi_generic_write_seq(dsi, DSI_REG_IIS, 0x0C, 0x00);
-	mipi_dsi_generic_write_seq(dsi, DSI_REG_CTRL, 0x3A, 0xD3);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_IIS, 0x0C, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, DSI_REG_CTRL, 0x3A, 0xD3);
 
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
 
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0, stk->mode->hdisplay - 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to set column address: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, stk->mode->hdisplay - 1);
 
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0, stk->mode->vdisplay - 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to set page address: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, stk->mode->vdisplay - 1);
 
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
+	if (!dsi_ctx.accum_err)
+		mdelay(20);
 
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
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to enter sleep mode: %d\n", ret);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	msleep(100);
+	mipi_dsi_msleep(&dsi_ctx, 100);
 }
 
 static int stk_panel_unprepare(struct drm_panel *panel)
@@ -155,7 +126,6 @@ static int stk_panel_unprepare(struct drm_panel *panel)
 static int stk_panel_prepare(struct drm_panel *panel)
 {
 	struct stk_panel *stk = to_stk_panel(panel);
-	struct device *dev = &stk->dsi->dev;
 	int ret;
 
 	gpiod_set_value(stk->reset_gpio, 0);
@@ -175,16 +145,12 @@ static int stk_panel_prepare(struct drm_panel *panel)
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
 
@@ -250,18 +216,15 @@ static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
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

