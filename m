Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E7688A2F4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7775110E137;
	Mon, 25 Mar 2024 13:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fXsraQ2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4686610E137
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:50:10 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6e6e0867be8so136456a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711374609; x=1711979409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZ8I/B+6mEM+116M4DIyR6SirHqDJuaLw9lcy//WX3A=;
 b=fXsraQ2OHUsd3dP1Q3XeLpHLYXi016rhguMwIz/IQOaMHEBLYe1VvT7fuzFRZxZAF5
 O/C/Rjh68o7N0ZIy8b8ksbeeOZ/5teLNW7TgLf8YiV5a3M/Fy0RwUYDkT9quS4vKgcgU
 TiZx8qSXJk3SVtni8tVRof6nIaq7mzdeanA/syVZd+G5VVa3FgHnMd9vKmXWFZVQB2hU
 2ikOwUC/YF1pROw+lIzdVhPSLdK7Td3OGGH2fP7AvdHEhbBM16lOmesK4hJjrmx+yS3E
 nqgq09Kd3fcqb8AbUM6a6gVtksk0hf2P+6Nv9gI7xBGq4sHbBXBvXuBCIlZy52UAmeNC
 aFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711374609; x=1711979409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NZ8I/B+6mEM+116M4DIyR6SirHqDJuaLw9lcy//WX3A=;
 b=kx1M9Gg10u8WbUW9ri5FOiD4YkDta5dkYPxR+KLZh26jOAZ+ERylAWo+brTDEFF7N9
 UP6j/MpVqpg9DrzDVdDoew3/JUs1NkPRaPzk6fHSKrVPlKxhoxaD/xSwYqNGPmJrU80g
 Tj13Mzl1jHaHAcy3xRaoOP2cMIb6QtCUSkFPyJIV1R5tLcL8d8rU70sm/Eh2MGWVeu6a
 pDdM69rr+LexyH3CMmQfntTrgnZplfN6Mii8I+6SUQNHbuD2tJ2qgzWxJ9PSqGMPYvSf
 JhH8hcPhFQSgtJyAkgoFdbRhgwRElXxHfMhnAEv8Q/DQ4w5dEIuwYA1hfWokRbhI22cE
 YepA==
X-Gm-Message-State: AOJu0YzgkmHz6m8Y40HuwsnbNx5qKXVG5Cx7bZ8e6GmPKTCzLu6hdHxg
 e709TxvWTT1w4Y6up14ClRWVr7FOSFFQx7Cs1XrWhlYRGUJRItL5
X-Google-Smtp-Source: AGHT+IFw0aRgzuj/ozXB1DR5+V3PMgi7I/Nei+XmYatRDtf2qOj6MyvsNUYaAak5CZgDTgQCqoq5Bw==
X-Received: by 2002:a9d:4e97:0:b0:6e4:e483:863f with SMTP id
 v23-20020a9d4e97000000b006e4e483863fmr7712698otk.23.1711374609412; 
 Mon, 25 Mar 2024 06:50:09 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a05683010c800b006e673e2d2a3sm1118250oto.77.2024.03.25.06.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 06:50:09 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/5] drm/panel: st7703: Add GameForce Chi Panel Support
Date: Mon, 25 Mar 2024 08:49:57 -0500
Message-Id: <20240325134959.11807-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325134959.11807-1-macroalpha82@gmail.com>
References: <20240325134959.11807-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The GameForce Chi is a handheld device with a 3.5" 640x480 ST7703 based
display panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index a3e142f156d5..7d8302cca091 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -612,6 +612,92 @@ static const struct st7703_panel_desc rgb10max3_panel_desc = {
 	.init_sequence = rgb10max3_panel_init_sequence,
 };
 
+static int gameforcechi_init_sequence(struct st7703 *ctx)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+
+	/*
+	 * Init sequence was supplied by the panel vendor. Panel will not
+	 * respond to commands until it is brought out of sleep mode first.
+	 */
+
+	mipi_dsi_dcs_exit_sleep_mode(dsi);
+	msleep(250);
+
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xf1, 0x12, 0x83);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x31, 0x81, 0x05, 0xf9,
+			       0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x44, 0x25, 0x00, 0x91, 0x0a, 0x00,
+			       0x00, 0x02, 0x4f, 0xd1, 0x00, 0x00, 0x37);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF, 0x0c, 0x10, 0x0a,
+			       0x50, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR, 0x73, 0x73, 0x50, 0x50,
+			       0x00, 0x00, 0x08, 0x70, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x46);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0b);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP, 0x00, 0x13, 0xf0);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ, 0x07, 0x07, 0x0b, 0x0b,
+			       0x03, 0x0b, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00,
+			       0xc0, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER, 0x53, 0x00, 0x1e,
+			       0x1e, 0x77, 0xe1, 0xcc, 0xdd, 0x67, 0x77, 0x33,
+			       0x33);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x10, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x6c, 0x7c);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1, 0x08, 0x00, 0x0e, 0x00,
+			       0x00, 0xb0, 0xb1, 0x11, 0x31, 0x23, 0x28, 0x10,
+			       0xb0, 0xb1, 0x27, 0x08, 0x00, 0x04, 0x02, 0x00,
+			       0x00, 0x00, 0x00, 0x04, 0x02, 0x00, 0x00, 0x00,
+			       0x88, 0x88, 0xba, 0x60, 0x24, 0x08, 0x88, 0x88,
+			       0x88, 0x88, 0x88, 0x88, 0x88, 0xba, 0x71, 0x35,
+			       0x18, 0x88, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00,
+			       0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2, 0x97, 0x0a, 0x82, 0x02,
+			       0x13, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x80, 0x88, 0xba, 0x17, 0x53, 0x88, 0x88, 0x88,
+			       0x88, 0x88, 0x88, 0x81, 0x88, 0xba, 0x06, 0x42,
+			       0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x23, 0x10,
+			       0x00, 0x02, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA, 0x00, 0x07, 0x0b,
+			       0x27, 0x2d, 0x3f, 0x3b, 0x37, 0x05, 0x0a, 0x0b,
+			       0x0f, 0x11, 0x0f, 0x12, 0x12, 0x18, 0x00, 0x07,
+			       0x0b, 0x27, 0x2d, 0x3f, 0x3b, 0x37, 0x05, 0xa0,
+			       0x0b, 0x0f, 0x11, 0x0f, 0x12, 0x12, 0x18);
+
+	return 0;
+}
+
+static const struct drm_display_mode gameforcechi_mode = {
+	.hdisplay	= 640,
+	.hsync_start	= 640 + 40,
+	.hsync_end	= 640 + 40 + 2,
+	.htotal		= 640 + 40 + 2 + 80,
+	.vdisplay	= 480,
+	.vsync_start	= 480 + 17,
+	.vsync_end	= 480 + 17 + 5,
+	.vtotal		= 480 + 17 + 5 + 13,
+	.clock		= 23546,
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.width_mm	= 71,
+	.height_mm	= 53,
+};
+
+static const struct st7703_panel_desc gameforcechi_desc = {
+	.mode = &gameforcechi_mode,
+	.lanes = 2,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_LPM,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = gameforcechi_init_sequence,
+};
+
 static int st7703_enable(struct drm_panel *panel)
 {
 	struct st7703 *ctx = panel_to_st7703(panel);
@@ -887,6 +973,7 @@ static void st7703_remove(struct mipi_dsi_device *dsi)
 
 static const struct of_device_id st7703_of_match[] = {
 	{ .compatible = "anbernic,rg353v-panel-v2", .data = &rg353v2_desc },
+	{ .compatible = "gameforce,chi-panel", .data = &gameforcechi_desc },
 	{ .compatible = "powkiddy,rgb10max3-panel", .data = &rgb10max3_panel_desc },
 	{ .compatible = "powkiddy,rgb30-panel", .data = &rgb30panel_desc },
 	{ .compatible = "rocktech,jh057n00900", .data = &jh057n00900_panel_desc },
-- 
2.34.1

