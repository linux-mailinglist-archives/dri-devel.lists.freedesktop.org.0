Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98D927099
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 09:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B059A10E9FD;
	Thu,  4 Jul 2024 07:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ZYGzuzX7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A296810E9D3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 07:30:28 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3d841a56e1dso232261b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 00:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720078228; x=1720683028; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RWUyP0FQ5nLUTQp3iV2KD4j7bO0bm88DdSGl5HIJ9co=;
 b=ZYGzuzX7uWDcdp/2FBsnpV8TsKwHkoGOVDqz1xrhBAkzkfmSvMSpB0CFJKraDkRSfG
 BAaFURXoB6DGt1vuj28cMwP8l+FR7sQEa4mpFd4NHOS4f/hxmg9oDU5MVUUbYwZbd4Op
 c6kgxgRSL1cdap5Z2Fl0Tl39GPZuZLnA8N8L/ogKr0AvFby/bATrCSjdMX7x6QEaRgBe
 4BJGkti9txnyZA8EjrMAsPTIWq7Ig5xpLJhHtTiPHXtR4A9fSjgdCZSRnCDvRgIASz9l
 bRKL1jYWRry/yivm3kHbBgsmqKAsPUuuexC0WAkMltyMJ6b1qe7qT3/dj9j2EH67CdJK
 Zydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720078228; x=1720683028;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RWUyP0FQ5nLUTQp3iV2KD4j7bO0bm88DdSGl5HIJ9co=;
 b=UKFA7vD+o7LMX1a9AQhisugp/07ITLFGxz4sZVFakM1okLStjoYvHlU43Y66PSTTB3
 H1UiqDC5KxDmuFa6ZguasmaRK/POuAOLFe7CQEPlu1rRoYLBIwgmFLnvQQqA5pzL5H4C
 b0lqx6k6EUqc4nm/ij94+sfBxm1GPb4lv2qLiwTKv77sLUtJ8v/4BiXSxEMD4ewuO/c4
 LnP7iLbPWfgHeVlXiYAM5mANx40jRgtkBg9jYfpqB4x/isUG5Ov6NjMT4t/WjDkVNHPj
 OZ+g56QqTtK6qa/bYuH439O2iUwL3OcGyGNmWpIkRoHiII8fCJ1Dy7dgK1JNm48mySUc
 z8tA==
X-Gm-Message-State: AOJu0YxjP/NQ5WuBJYLuKAkg+nGtceVa9+n3Nq5hbASec+O3qcLTOMCj
 3fvHMvQH4PdgmQioH/TgnaPTjk2hb12LY8zOM+QAFlJXVaK7Crtb3hRUg7Oq6rI=
X-Google-Smtp-Source: AGHT+IG6Z/ypPsLwPhVAvPZQbhGKFk4mLpdLjXP0+3iJNMofXUq5JpQZe9gkRwHAyQmx3LEhkHF7MQ==
X-Received: by 2002:a05:6808:f8d:b0:3d2:2aa8:3b2c with SMTP id
 5614622812f47-3d914c6b28amr1026922b6e.33.1720078227583; 
 Thu, 04 Jul 2024 00:30:27 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6a8dbb2fsm7735699a12.31.2024.07.04.00.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 00:30:27 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, mripard@kernel.org, dianders@google.com,
 hsinyi@google.com, awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v5 3/5] drm/panel: boe-th101mb31ig002: use wrapped MIPI DCS
 functions
Date: Thu,  4 Jul 2024 15:29:56 +0800
Message-Id: <20240704072958.27876-4-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers to
simplify driver's init/enable/exit code.

Convert the hex in init_code from UPPERCASE to lowercase.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 143 ++++++++----------
 1 file changed, 63 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index 9f225c15b21c..736bfba607cf 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -17,11 +17,13 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
+struct boe_th101mb31ig002;
+
 struct panel_desc {
 	const struct drm_display_mode *modes;
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
-	const struct panel_init_cmd *init_cmds;
+	int (*init)(struct boe_th101mb31ig002 *ctx);
 	unsigned int lanes;
 };
 
@@ -49,74 +51,61 @@ static void boe_th101mb31ig002_reset(struct boe_th101mb31ig002 *ctx)
 	usleep_range(5000, 6000);
 }
 
-static int boe_th101mb31ig002_enable(struct drm_panel *panel)
+static int boe_th101mb31ig002_enable(struct boe_th101mb31ig002 *ctx)
 {
-	struct boe_th101mb31ig002 *ctx = container_of(panel,
-						      struct boe_th101mb31ig002,
-						      panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	mipi_dsi_dcs_write_seq(dsi, 0xE0, 0xAB, 0xBA);
-	mipi_dsi_dcs_write_seq(dsi, 0xE1, 0xBA, 0xAB);
-	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x10, 0x01, 0x47, 0xFF);
-	mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x0C, 0x14, 0x04, 0x50, 0x50, 0x14);
-	mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x56, 0x53, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x33, 0x30, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xB6, 0xB0, 0x00, 0x00, 0x10, 0x00, 0x10,
-				    0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x05, 0x12, 0x29, 0x49, 0x48, 0x00,
-				    0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xB9, 0x7C, 0x65, 0x55, 0x49, 0x46, 0x36,
-				    0x3B, 0x24, 0x3D, 0x3C, 0x3D, 0x5C, 0x4C,
-				    0x55, 0x47, 0x46, 0x39, 0x26, 0x06, 0x7C,
-				    0x65, 0x55, 0x49, 0x46, 0x36, 0x3B, 0x24,
-				    0x3D, 0x3C, 0x3D, 0x5C, 0x4C, 0x55, 0x47,
-				    0x46, 0x39, 0x26, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0xFF, 0x87, 0x12, 0x34, 0x44, 0x44,
-				    0x44, 0x44, 0x98, 0x04, 0x98, 0x04, 0x0F,
-				    0x00, 0x00, 0xC1);
-	mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x54, 0x94, 0x02, 0x85, 0x9F, 0x00,
-				    0x7F, 0x00, 0x54, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xC2, 0x17, 0x09, 0x08, 0x89, 0x08, 0x11,
-				    0x22, 0x20, 0x44, 0xFF, 0x18, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xC3, 0x86, 0x46, 0x05, 0x05, 0x1C, 0x1C,
-				    0x1D, 0x1D, 0x02, 0x1F, 0x1F, 0x1E, 0x1E,
-				    0x0F, 0x0F, 0x0D, 0x0D, 0x13, 0x13, 0x11,
-				    0x11, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xC4, 0x07, 0x07, 0x04, 0x04, 0x1C, 0x1C,
-				    0x1D, 0x1D, 0x02, 0x1F, 0x1F, 0x1E, 0x1E,
-				    0x0E, 0x0E, 0x0C, 0x0C, 0x12, 0x12, 0x10,
-				    0x10, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xC6, 0x2A, 0x2A);
-	mipi_dsi_dcs_write_seq(dsi, 0xC8, 0x21, 0x00, 0x31, 0x42, 0x34, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0xCA, 0xCB, 0x43);
-	mipi_dsi_dcs_write_seq(dsi, 0xCD, 0x0E, 0x4B, 0x4B, 0x20, 0x19, 0x6B,
-				    0x06, 0xB3);
-	mipi_dsi_dcs_write_seq(dsi, 0xD2, 0xE3, 0x2B, 0x38, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xD4, 0x00, 0x01, 0x00, 0x0E, 0x04, 0x44,
-				    0x08, 0x10, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xE6, 0x80, 0x01, 0xFF, 0xFF, 0xFF, 0xFF,
-				    0xFF, 0xFF);
-	mipi_dsi_dcs_write_seq(dsi, 0xF0, 0x12, 0x03, 0x20, 0x00, 0xFF);
-	mipi_dsi_dcs_write_seq(dsi, 0xF3, 0x00);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-
-	msleep(120);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set panel on: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0xab, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0xba, 0xab);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x10, 0x01, 0x47, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x0c, 0x14, 0x04, 0x50, 0x50, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x56, 0x53, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x33, 0x30, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0xb0, 0x00, 0x00, 0x10, 0x00, 0x10,
+					       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x05, 0x12, 0x29, 0x49, 0x48, 0x00,
+					       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x7c, 0x65, 0x55, 0x49, 0x46, 0x36,
+					       0x3b, 0x24, 0x3d, 0x3c, 0x3d, 0x5c, 0x4c,
+					       0x55, 0x47, 0x46, 0x39, 0x26, 0x06, 0x7c,
+					       0x65, 0x55, 0x49, 0x46, 0x36, 0x3b, 0x24,
+					       0x3d, 0x3c, 0x3d, 0x5c, 0x4c, 0x55, 0x47,
+					       0x46, 0x39, 0x26, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0xff, 0x87, 0x12, 0x34, 0x44, 0x44,
+					       0x44, 0x44, 0x98, 0x04, 0x98, 0x04, 0x0f,
+					       0x00, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x54, 0x94, 0x02, 0x85, 0x9f, 0x00,
+					       0x7f, 0x00, 0x54, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x17, 0x09, 0x08, 0x89, 0x08, 0x11,
+					       0x22, 0x20, 0x44, 0xff, 0x18, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x86, 0x46, 0x05, 0x05, 0x1c, 0x1c,
+					       0x1d, 0x1d, 0x02, 0x1f, 0x1f, 0x1e, 0x1e,
+					       0x0f, 0x0f, 0x0d, 0x0d, 0x13, 0x13, 0x11,
+					       0x11, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x07, 0x07, 0x04, 0x04, 0x1c, 0x1c,
+					       0x1d, 0x1d, 0x02, 0x1f, 0x1f, 0x1e, 0x1e,
+					       0x0e, 0x0e, 0x0c, 0x0c, 0x12, 0x12, 0x10,
+					       0x10, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc6, 0x2a, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8, 0x21, 0x00, 0x31, 0x42, 0x34, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0xcb, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x0e, 0x4b, 0x4b, 0x20, 0x19, 0x6b,
+					       0x06, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2, 0xe3, 0x2b, 0x38, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4, 0x00, 0x01, 0x00, 0x0e, 0x04, 0x44,
+					       0x08, 0x10, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x80, 0x01, 0xff, 0xff, 0xff, 0xff,
+					       0xff, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x12, 0x03, 0x20, 0x00, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
 }
 
 static int boe_th101mb31ig002_disable(struct drm_panel *panel)
@@ -124,21 +113,15 @@ static int boe_th101mb31ig002_disable(struct drm_panel *panel)
 	struct boe_th101mb31ig002 *ctx = container_of(panel,
 						      struct boe_th101mb31ig002,
 						      panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(dev, "Failed to set panel off: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int boe_th101mb31ig002_unprepare(struct drm_panel *panel)
@@ -201,7 +184,7 @@ static const struct panel_desc boe_th101mb31ig002_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_NO_EOT_PACKET |
 			  MIPI_DSI_MODE_LPM,
-	.init_cmds = boe_th101mb31ig002_enable,
+	.init = boe_th101mb31ig002_enable,
 };
 
 static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
-- 
2.17.1

