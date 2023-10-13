Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C661B7C8D2E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 20:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2881610E634;
	Fri, 13 Oct 2023 18:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009CD10E62D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 18:39:27 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3af608eb34bso1449856b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697222367; x=1697827167; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XpG74RYAbsyeZPWO/cKaZxYQssK+OjpMXseuuKjO9Ig=;
 b=ZyfG6a2RBZeg6IQt2D4C+ToISB6b3Az/XaERX9yoFeJWdHrhakSi2VaESlByp526N1
 KR7fEWobpXsptT8G9PhHBbou1xHsMjLPverR0GsA5N07t+bxgacckGI2miRE7sICFdGd
 BDZANMDzaAR6Vo9R/9VMV+VQwaFGUo1YQWJe7KV/xpl1nmj1YtuZ5vwvabQtaVaZiHdE
 pRAGDER9aNT4BCz3TvqKeua4XLvuQHnPSuCHI5WAceqSfRGWaptwNTmVC57uJ/ftoNpn
 FNA/rfyti/64fNYQffilxU03MaOXpUpWpbapdUTJC2FxkvTrQY8/YvL/fZmAlfED3zaM
 9oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697222367; x=1697827167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XpG74RYAbsyeZPWO/cKaZxYQssK+OjpMXseuuKjO9Ig=;
 b=IpsJ07v6chWAGwQMdoFMBQxqS7hvcDxu1jLRV1yraDzYGh0B/kq02OLBWC+bOELFrp
 RWrveQOCj91gzaGMjODGFpLTk9Poa4eXUkYkVmBYM1/QOVfsrg5BNMT6Fhd9UBqpuhcN
 YE1YU/rhQ2F+eU0VE5EN3TnucBbhbb6q9whTpcwAGcYZhou68GGQp1PkjFpaAqpMTkye
 0wC3BIRtDINCLA17++t4ZwFkS+55pMyLrz7JVeG7mKxwOaXfWDU1Z/EooYi+TH8gzDsZ
 86uq1eHKYoghWubZigB71jPuRTgLF6B+9YKT6+p3PTKCqjIUnOotIwJyhAyAjSj0LHvY
 K4/A==
X-Gm-Message-State: AOJu0YwPt5XexEF9KSlzo6OdUMVnIFuASmcTQTOTGdmVSaJA4fPrXXqB
 +GFuP7I5G3yFCQe7E4iw+XE=
X-Google-Smtp-Source: AGHT+IHCXxF7b1a3M3ZOkohw9lmflcVGCXq9oBMeHI9psiYwcW1lfGHZUQH76xDQHNnig2e2Hmhpxg==
X-Received: by 2002:a05:6808:1823:b0:3ad:9540:5475 with SMTP id
 bh35-20020a056808182300b003ad95405475mr35536504oib.45.1697222367085; 
 Fri, 13 Oct 2023 11:39:27 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 bx19-20020a0568081b1300b003afe584ed4fsm842159oib.42.2023.10.13.11.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 11:39:26 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 3/5] drm/panel: st7703: Add Powkiddy RGB30 Panel Support
Date: Fri, 13 Oct 2023 13:39:16 -0500
Message-Id: <20231013183918.225666-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013183918.225666-1-macroalpha82@gmail.com>
References: <20231013183918.225666-1-macroalpha82@gmail.com>
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
Cc: megous@megous.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kernel@puri.sm, sam@ravnborg.org,
 neil.armstrong@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, jagan@edgeble.ai, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RGB30 4 inch panel is a 4 inch 720x720 DSI panel used in
the Powkiddy RGB30 handheld gaming device. Add support for it.

TODO: The panel seems to not resume properly from suspend. I've
confirmed on the other ST7703 based devices it works correctly.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 6a3945639535..a9892a4447fb 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -433,6 +433,94 @@ static const struct st7703_panel_desc rg353v2_desc = {
 	.init_sequence = rg353v2_init_sequence,
 };
 
+static int rgb30panel_init_sequence(struct st7703 *ctx)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+
+	/* Init sequence extracted from Powkiddy RGB30 BSP kernel. */
+
+	/*
+	 * For some reason this specific panel must be taken out of sleep
+	 * before the full init sequence, or else it will not display.
+	 */
+	mipi_dsi_dcs_exit_sleep_mode(dsi);
+	msleep(250);
+
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xf1, 0x12, 0x83);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05, 0xf9,
+			       0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x44, 0x25, 0x00, 0x90, 0x0a, 0x00,
+			       0x00, 0x01, 0x4f, 0x01, 0x00, 0x00, 0x37);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22, 0xf0,
+			       0x63);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF, 0x10, 0x10, 0x28,
+			       0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR, 0x73, 0x73, 0x50, 0x50,
+			       0x00, 0x00, 0x12, 0x70, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x46);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0b);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP, 0x3c, 0x12, 0x30);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ, 0x07, 0x07, 0x0b, 0x0b,
+			       0x03, 0x0b, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00,
+			       0xc0, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER, 0x36, 0x00, 0x32,
+			       0x32, 0x77, 0xf1, 0xcc, 0xcc, 0x77, 0x77, 0x33,
+			       0x33);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x88, 0x88);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1, 0xc8, 0x10, 0x0a, 0x10,
+			       0x0f, 0xa1, 0x80, 0x12, 0x31, 0x23, 0x47, 0x86,
+			       0xa1, 0x80, 0x47, 0x08, 0x00, 0x00, 0x0d, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00, 0x00,
+			       0x48, 0x02, 0x8b, 0xaf, 0x46, 0x02, 0x88, 0x88,
+			       0x88, 0x88, 0x88, 0x48, 0x13, 0x8b, 0xaf, 0x57,
+			       0x13, 0x88, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2, 0x96, 0x12, 0x01, 0x01,
+			       0x01, 0x78, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x4f, 0x31, 0x8b, 0xa8, 0x31, 0x75, 0x88, 0x88,
+			       0x88, 0x88, 0x88, 0x4f, 0x20, 0x8b, 0xa8, 0x20,
+			       0x64, 0x88, 0x88, 0x88, 0x88, 0x88, 0x23, 0x00,
+			       0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x40, 0xa1, 0x80, 0x00, 0x00, 0x00,
+			       0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA, 0x00, 0x0a, 0x0f,
+			       0x29, 0x3b, 0x3f, 0x42, 0x39, 0x06, 0x0d, 0x10,
+			       0x13, 0x15, 0x14, 0x15, 0x10, 0x17, 0x00, 0x0a,
+			       0x0f, 0x29, 0x3b, 0x3f, 0x42, 0x39, 0x06, 0x0d,
+			       0x10, 0x13, 0x15, 0x14, 0x15, 0x10, 0x17);
+
+	return 0;
+}
+
+static const struct drm_display_mode rgb30panel_mode = {
+	.hdisplay	= 720,
+	.hsync_start	= 720 + 45,
+	.hsync_end	= 720 + 45 + 4,
+	.htotal		= 720 + 45 + 4 + 45,
+	.vdisplay	= 720,
+	.vsync_start	= 720 + 15,
+	.vsync_end	= 720 + 15 + 3,
+	.vtotal		= 720 + 15 + 3 + 11,
+	.clock		= 36570,
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.width_mm	= 76,
+	.height_mm	= 76,
+};
+
+static const struct st7703_panel_desc rgb30panel_desc = {
+	.mode = &rgb30panel_mode,
+	.lanes = 4,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_LPM,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = rgb30panel_init_sequence,
+};
+
 static int st7703_enable(struct drm_panel *panel)
 {
 	struct st7703 *ctx = panel_to_st7703(panel);
@@ -694,6 +782,7 @@ static void st7703_remove(struct mipi_dsi_device *dsi)
 
 static const struct of_device_id st7703_of_match[] = {
 	{ .compatible = "anbernic,rg353v-panel-v2", .data = &rg353v2_desc },
+	{ .compatible = "powkiddy,rgb30-panel", .data = &rgb30panel_desc },
 	{ .compatible = "rocktech,jh057n00900", .data = &jh057n00900_panel_desc },
 	{ .compatible = "xingbangda,xbd599", .data = &xbd599_desc },
 	{ /* sentinel */ }
-- 
2.34.1

