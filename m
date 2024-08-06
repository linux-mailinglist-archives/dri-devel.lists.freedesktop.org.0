Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EB3949271
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 16:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CBD10E387;
	Tue,  6 Aug 2024 14:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nP6j8eHG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5D410E387
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 14:00:24 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2cb81c0ecb4so4824098a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722952824; x=1723557624; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CK7ANORZUzGJICKPtXebR+TykgsKwGrzcFtwkmK0p10=;
 b=nP6j8eHGBfJbpL59yzSJdPqCfC4s1z3V4jDGohu2PQ93w5wqkpXjxfSAaI+brrghTc
 EpTydra5GScfs5PlzjFMZExvK+P/CUKpislAeO+p5AwtyatzaqdMwJE7wKXZQ8XVCZMK
 1d5tDDCcKBkuAIRGWqoVH+QPLxBw3QGmDtU4147R27URnjOxtn099WySUfvXNDJenCG1
 TWJcKlpUnqYVZEkmyn+09hNk0QHhxygGo84TkjzndVxeJbtagdyF3yR0+DPzpjq4A7ue
 +wFfwgfI9HQH0xenx2ARcGvcQRK+oaORm1b6C565vKQ7Zniid8P6lRW0gxLg6ZJFFsVE
 pAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722952824; x=1723557624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CK7ANORZUzGJICKPtXebR+TykgsKwGrzcFtwkmK0p10=;
 b=M7qdtJjr3rmJbygxhhe6Wvddl3LhYX8QuaQctWJI7c3DseVoWiQ8CaFtmE3wj5geGA
 hzAIlWwYRxebdTYoVl/ZGWUVVeE/Cfa4463K2oDVbwZ9ZA+LxfTZl50iAgu05ATDqrdY
 2YEQ4mWT2+l5S35KW+uJgyijMSzFIiBcWwB5cgW3hs+J2gZ01xAyk72weooE1Zo83Uxw
 QLDJ9qPBPhvvQaWrtZMFsCzFeYIX/r42sbl+7qPxgZzG8Hf76TRQBAhTqYspkcSny2Xa
 Dbu2OT4UNgSUcnP/Zw6tQLtlp4BA8NRxD4QJC6r1r8q5N0y2JLsJVNeYE57Iotbo+nsZ
 vX+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvEjF5xc/hF1XQO2fxb3SwFLeU3dIvL6mvldyM2btexpQ9o3eyvPQRrfds8iY13WBgy0HvrlCtw8pwrTStcUIBBtJ6xof3vYLWJL6ALvSZ
X-Gm-Message-State: AOJu0YxnR546j3Zsgwmqe5TRBP63L7l94lSzOWqx3uoZKJtiEihR+h88
 gUpGXRPFnYm3tddsjZm1CO/Cjrbd+LupYZfS2PSLqfwZXf5mIGrZ
X-Google-Smtp-Source: AGHT+IEMJuSc3n8itBDIcMqQLHq9b38TucY0X+Cs8gDQafx/MBSagnSSDNMUT4P1LpKXjey729/MqA==
X-Received: by 2002:a17:90b:4c07:b0:2c8:2236:e2c3 with SMTP id
 98e67ed59e1d1-2cff0b253a1mr26643464a91.17.1722952823581; 
 Tue, 06 Aug 2024 07:00:23 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([14.96.13.220])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7b8a7453e92sm4415203a12.41.2024.08.06.07.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 07:00:23 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v3 2/2] drm/panel: startek-kd070fhfid015: transition to
 mipi_dsi wrapped functions
Date: Tue,  6 Aug 2024 19:29:49 +0530
Message-ID: <20240806135949.468636-3-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806135949.468636-1-tejasvipin76@gmail.com>
References: <20240806135949.468636-1-tejasvipin76@gmail.com>
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
 .../drm/panel/panel-startek-kd070fhfid015.c   | 115 ++++++------------
 1 file changed, 35 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
index 0156689f41cd..c0c95355b743 100644
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
-
-	ret = mipi_dsi_dcs_soft_reset(dsi);
-	if (ret < 0) {
-		dev_err(dev, "failed to mipi_dsi_dcs_soft_reset: %d\n", ret);
-		return ret;
-	}
-	mdelay(5);
+	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "failed to set exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
+	mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 5);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
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
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to enter sleep mode: %d\n", ret);
-
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
2.46.0

