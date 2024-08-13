Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D72B94FDDC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 08:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200E110E2BE;
	Tue, 13 Aug 2024 06:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ARc/rjCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706DB10E2BE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 06:31:00 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3db130a872fso3706888b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 23:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723530659; x=1724135459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCRwCY9EDZcaC0Ax+MD/I4e/vXfkLFmA0dK7jr+FvWs=;
 b=ARc/rjCNYjbV28i/PspN8Aukr56yVNUg2QRsUx/TBVK86uj51gaP4w/gyRElUYW9gP
 9U9OImBPNgv2C0ofJARTtetn/kXjPqQGyaAjWGbMNC2RXGDvc7X2a6Oi0QS5envf4aIg
 trK2GIqmjl+GkWKYoSFfvihntFjoaqFF5HQw+lV5xSMAG9CMuc1f3t7zLK61lD3uGdN2
 8wud3g3sJSH0QNqhI5u1+JeTwdc4ploms9vpP7RNIMXyAxKKz2GlcXk5J2TIgLSlXCnV
 77mMA3SGUcNAHd64Mi3WTU9w6+CjvfCRBqSh8WJExq7Y34/wz7aZpr/LFZSxApoBW4g3
 YK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723530659; x=1724135459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCRwCY9EDZcaC0Ax+MD/I4e/vXfkLFmA0dK7jr+FvWs=;
 b=HCy/f7PLKPHf4ASts1gj+p1MLvxI4UWd+nOOdG5Zl0eRimr6Ap32UTFY75BCajKaW/
 S+I7q6mjh3lMk0WemxDUpkOxXfxC2kZiXZ60LZHYcsp0wm56R1WjutLKvfR056gWSnOy
 ARp7+KxffVnU419QBXNkzlfu9n/hLRFXe59/x9OJc4QQOnMMfXvY57WvKEhHgFK0lvgS
 /Y3oTWYU+//M4fRna8D9oc/CEFHhyagLV6YqjxOWrzxPg/9owmKt1r82Q8l2RMHSQfk2
 dFqbZ9exdWpNhFBP4UpKKpMx3yk5I+HDIG5snEz44Q1xuOfikSdCLX0uQTMvb3p5KDk8
 vHbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW47pOWMq8Bpyw5BKODsvfqlCyAbCg3elI+kPHPcNcj4HdW3jDjB7SMPU7m7h4MAFh84YcTnAfCjGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCuuoa5ppxwQiLeJRKL4NNoAt7QHmlp1qiD5Sqf+sW8o5WZowz
 PVbqkfv7jn2MpOtT6VtozrF6KlwgIvesVXAQMb6IOefjvpfhqX1v
X-Google-Smtp-Source: AGHT+IEdAD3lQBiintdbrrYL9Q9u1r8Hb7gnuu2Rg873fjM/Qkagyegk+fduHZKHHicbc3C/esKghA==
X-Received: by 2002:a05:6808:199d:b0:3da:b35d:52e0 with SMTP id
 5614622812f47-3dd1eee0effmr2829791b6e.43.1723530659653; 
 Mon, 12 Aug 2024 23:30:59 -0700 (PDT)
Received: from distilledx.srmu.edu.in
 ([2401:4900:6325:9539:8b89:ebee:b1a0:5ff9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5874ef7sm4991965b3a.38.2024.08.12.23.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 23:30:59 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2 2/2] drm/panel: jdi-fhd-r63452: transition to mipi_dsi
 wrapped functions
Date: Tue, 13 Aug 2024 11:59:12 +0530
Message-ID: <20240813062912.467280-3-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813062912.467280-1-tejasvipin76@gmail.com>
References: <20240813062912.467280-1-tejasvipin76@gmail.com>
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

Changes the jdi-fhd-r63452 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 150 ++++++-------------
 1 file changed, 49 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
index 483dc88d16d8..9ec567b4a8e2 100644
--- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
@@ -41,142 +41,90 @@ static void jdi_fhd_r63452_reset(struct jdi_fhd_r63452 *ctx)
 static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xec,
-				   0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
-				   0x13, 0x15, 0x68, 0x0b, 0xb5);
-	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
-
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd6, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xec,
+					 0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
+					 0x13, 0x15, 0x68, 0x0b, 0xb5);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
 
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0x0000, 0x0437);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set column address: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 0x077f);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set page address: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
-	ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0x0000);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear scanline: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x77);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x077f);
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx, 0x0000);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00ff);
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display brightness: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x84, 0x00);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 80);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x84, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc8, 0x11);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(80);
-
-	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x11);
-	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
-static int jdi_fhd_r63452_off(struct jdi_fhd_r63452 *ctx)
+static void jdi_fhd_r63452_off(struct jdi_fhd_r63452 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x00);
-	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x01);
-	mipi_dsi_generic_write_seq(dsi, 0xec,
-				   0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
-				   0x13, 0x15, 0x68, 0x0b, 0x95);
-	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	usleep_range(2000, 3000);
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(120);
-
-	return 0;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd6, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xec,
+					 0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
+					 0x13, 0x15, 0x68, 0x0b, 0x95);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	if (!dsi_ctx.accum_err)
+		usleep_range(2000, 3000);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 }
 
 static int jdi_fhd_r63452_prepare(struct drm_panel *panel)
 {
 	struct jdi_fhd_r63452 *ctx = to_jdi_fhd_r63452(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
 	jdi_fhd_r63452_reset(ctx);
 
 	ret = jdi_fhd_r63452_on(ctx);
-	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+	if (ret < 0)
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 
 static int jdi_fhd_r63452_unprepare(struct drm_panel *panel)
 {
 	struct jdi_fhd_r63452 *ctx = to_jdi_fhd_r63452(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
 
-	ret = jdi_fhd_r63452_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	/*
+	 * NOTE: We don't return an error here as while the panel won't have
+	 * been cleanly turned off at least we've asserted the reset signal
+	 * so it should be safe to power it back on again later
+	 */
+	jdi_fhd_r63452_off(ctx);
 
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
-- 
2.46.0

