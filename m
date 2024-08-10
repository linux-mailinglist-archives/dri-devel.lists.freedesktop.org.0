Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8976F94DAC5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 06:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A1610E0B9;
	Sat, 10 Aug 2024 04:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c3PEMKKE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DA010E0B9
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 04:55:08 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fc66fc35f2so27005425ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 21:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723265708; x=1723870508; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19rt3cYGIz9ovZGS8R2mAVuVxzzyQDGkKj8/iUwXAXE=;
 b=c3PEMKKEOyvjSl3mtq3zM1exzZSKa9LWNRWkoJQBYle4wj2lT9T9TulcZ2xBcfZ+XG
 oXkQ0P32sap/QoxYh6AMBYEcJTQwencbCYlqheR5YdFXvtblAWcLrk+vKBxaeU1P6L17
 kladhGiGH1tToJJMHDg7UDuisMKtlcEDbkhNj+YjXJAr2+oVPYph0RV933+OnUgJJzoZ
 6K+TlOsf80Ca0//9mDzjQwA79W0vMdUfuFSS1BFg4AqK8Msk30SnqaQpxurinReH/Pmu
 IQ6DKOQKT8VKalzB+yVTDeeYWT0+4HXRndecV6icZJiHAYH1MMthYdrBOw4Od6QpNAel
 B3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723265708; x=1723870508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=19rt3cYGIz9ovZGS8R2mAVuVxzzyQDGkKj8/iUwXAXE=;
 b=wjF5x22mPQon2JgQFpINS/KWPllox+KA3JBAe97ZjTDwuTLbwng1lSSfbvPsi/C1Im
 MomPZ1ZNeYXZOYPiri7Ad/EPVg+BCSeF4yx0DxIn/+wIgCJ8oO5puEVspFVessFyRwCU
 8lv5aR03YuoiiL5Ktw+Fahrwy5LVBhXRBt6j/PcoJylgOUD1Jlo+K8wfjhhbuSBXPxME
 xioYUTj9u4pwcYDcsQZZ2P11V/9V/E7g1zJXrNiGbtGjJaJHcWjY+hAsDhe9HEkr7MZo
 lfzhQlZHsNOISUpNYypDjlORQIrK9A6xaoxHBvGQsc0XrE5y1Sh1C84g9e5CoZsDu+X1
 xhKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsxNz+P62zeU0FpFSqFwfD/Ip3HWlk6q/H4XA/VcJgiN/Gh9nz8X9z2PvgfuPFoE3QJBEl6npcbQQ3Lp2gsMtiLYDDMqJbr9XWRzuEOyJB
X-Gm-Message-State: AOJu0Ywn8dRybFs8xannPRETRxdu5h/CUBJJnJno6OMVUAQ++iI6VJfY
 KZRFI2juYmblKD2NQXPtI4UiQJnwT/owHrrgzAusmJ1N7pzNdKq3
X-Google-Smtp-Source: AGHT+IHlx1kQsTJ98HNGtbgTUm2+DBvCCePAmf3vd6I3xO5Wjd0CVQtCUkh5r/ZzM9mb4PGZk+PFeQ==
X-Received: by 2002:a17:903:2345:b0:1f7:3a70:9e71 with SMTP id
 d9443c01a7336-200ae540e3amr57633735ad.13.1723265707658; 
 Fri, 09 Aug 2024 21:55:07 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb8fd82asm5227005ad.73.2024.08.09.21.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 21:55:07 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 2/2] drm/panel: jdi-fhd-r63452: transition to mipi_dsi wrapped
 functions
Date: Sat, 10 Aug 2024 10:24:04 +0530
Message-ID: <20240810045404.188146-3-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240810045404.188146-1-tejasvipin76@gmail.com>
References: <20240810045404.188146-1-tejasvipin76@gmail.com>
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
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 125 ++++++-------------
 1 file changed, 39 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
index 483dc88d16d8..32a244d4bae7 100644
--- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
@@ -41,79 +41,41 @@ static void jdi_fhd_r63452_reset(struct jdi_fhd_r63452 *ctx)
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
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xd6, 0x01);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xec,
+					 0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
+					 0x13, 0x15, 0x68, 0x0b, 0xb5);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
 
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x77);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x077f);
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx, 0x0000);
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00ff);
 
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0x0000, 0x0437);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set column address: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x84, 0x00);
 
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 0x077f);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set page address: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0x0000);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear scanline: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 80);
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display brightness: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
-
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
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x84, 0x00);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xc8, 0x11);
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb0, 0x03);
 
 	return 0;
 }
@@ -121,31 +83,22 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
 static int jdi_fhd_r63452_off(struct jdi_fhd_r63452 *ctx)
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
 
 	return 0;
 }
-- 
2.46.0

