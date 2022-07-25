Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AE7580187
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 17:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94255BFF7A;
	Mon, 25 Jul 2022 15:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DA1BFF7C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:17:25 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C882D841B0;
 Mon, 25 Jul 2022 17:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658762244;
 bh=pObRtIetJSsTnOVCD1a/GsPQpo6RqecbECDhcZBWHs0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fmR3nLYf09U5cVSrMYDd2oNlld5qiqHgbSKDeLIwE51yOUq7yAAmr1/JWv1oRd4xo
 8Qo3MjWW1Bv1pUHLspt2hCusZ3J5+wwkYkGtyUxbioko9q4UQQfwLwUWnLa5oqG7iF
 tQfOZ+7WEswcW4Uk7GuJqX8oXoZwXidBI1v4T6mbwSCDGB5f8cVPZ45jSjkHXYtZLq
 RIACqxkgXd+BCTbbc5QHhXu3dsNEFk9ckJb62CHWMfUtCd+BJaFp5amBWRgNkdvZZ9
 UhjmW3HSHSF4UF0PVe8hVBfl17epgl7Fbc9D8VKt2wJFsFY02HyTMrogbKY1lEa51r
 uFe2HwG+dm/Mw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panel/panel-sitronix-st7701: Add Densitron
 DMT028VGHMCMI-1A TFT
Date: Mon, 25 Jul 2022 17:17:03 +0200
Message-Id: <20220725151703.319939-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725151703.319939-1-marex@denx.de>
References: <20220725151703.319939-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Densitron DMT028VGHMCMI-1A TFT matrix into this driver.
This is a DSI-attached 480x640 2.83 inch panel.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 187 +++++++++++++++++-
 1 file changed, 182 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 843495d607d53..e3e7a14ab67b7 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -42,13 +42,16 @@
 /*
  * Command2 with BK function selection.
  *
- * BIT[4, 0]: [CN2, BKXSEL]
- * 10 = CMD2BK0, Command2 BK0
- * 11 = CMD2BK1, Command2 BK1
- * 00 = Command2 disable
+ * BIT[4].....CN2
+ * BIT[1:0]...BKXSEL
+ * 1:00 = CMD2BK0, Command2 BK0
+ * 1:01 = CMD2BK1, Command2 BK1
+ * 1:11 = CMD2BK3, Command2 BK3
+ * 0:00 = Command2 disable
  */
-#define DSI_CMD2BK1_SEL			0x11
 #define DSI_CMD2BK0_SEL			0x10
+#define DSI_CMD2BK1_SEL			0x11
+#define DSI_CMD2BK3_SEL			0x13
 #define DSI_CMD2BKX_SEL_NONE		0x00
 
 /* Command2, BK0 bytes */
@@ -329,6 +332,78 @@ static void ts8550b_gip_sequence(struct st7701 *st7701)
 		   0xFF, 0xFF, 0xFF, 0xF3, 0x27, 0x65, 0x40, 0x1F, 0xFF);
 }
 
+static void dmt028vghmcmi_1a_gip_sequence(struct st7701 *st7701)
+{
+	ST7701_DSI(st7701, 0xEE, 0x42);
+	ST7701_DSI(st7701, 0xE0, 0x00, 0x00, 0x02);
+
+	ST7701_DSI(st7701, 0xE1,
+		   0x04, 0xA0, 0x06, 0xA0,
+			   0x05, 0xA0, 0x07, 0xA0,
+			   0x00, 0x44, 0x44);
+	ST7701_DSI(st7701, 0xE2,
+		   0x00, 0x00, 0x00, 0x00,
+			   0x00, 0x00, 0x00, 0x00,
+			   0x00, 0x00, 0x00, 0x00);
+	ST7701_DSI(st7701, 0xE3,
+		   0x00, 0x00, 0x22, 0x22);
+	ST7701_DSI(st7701, 0xE4, 0x44, 0x44);
+	ST7701_DSI(st7701, 0xE5,
+		   0x0C, 0x90, 0xA0, 0xA0,
+			   0x0E, 0x92, 0xA0, 0xA0,
+			   0x08, 0x8C, 0xA0, 0xA0,
+			   0x0A, 0x8E, 0xA0, 0xA0);
+	ST7701_DSI(st7701, 0xE6,
+		   0x00, 0x00, 0x22, 0x22);
+	ST7701_DSI(st7701, 0xE7, 0x44, 0x44);
+	ST7701_DSI(st7701, 0xE8,
+		   0x0D, 0x91, 0xA0, 0xA0,
+			   0x0F, 0x93, 0xA0, 0xA0,
+			   0x09, 0x8D, 0xA0, 0xA0,
+			   0x0B, 0x8F, 0xA0, 0xA0);
+	ST7701_DSI(st7701, 0xEB,
+		   0x00, 0x00, 0xE4, 0xE4,
+			   0x44, 0x00, 0x00);
+	ST7701_DSI(st7701, 0xED,
+		   0xFF, 0xF5, 0x47, 0x6F,
+			   0x0B, 0xA1, 0xAB, 0xFF,
+			   0xFF, 0xBA, 0x1A, 0xB0,
+			   0xF6, 0x74, 0x5F, 0xFF);
+	ST7701_DSI(st7701, 0xEF,
+		   0x08, 0x08, 0x08, 0x40,
+			   0x3F, 0x64);
+
+	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
+		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BKX_SEL_NONE);
+
+	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
+		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BK3_SEL);
+	ST7701_DSI(st7701, 0xE6, 0x7C);
+	ST7701_DSI(st7701, 0xE8, 0x00, 0x0E);
+
+	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
+		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BKX_SEL_NONE);
+	ST7701_DSI(st7701, 0x11);
+	msleep(120);
+
+	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
+		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BK3_SEL);
+	ST7701_DSI(st7701, 0xE8, 0x00, 0x0C);
+	msleep(10);
+	ST7701_DSI(st7701, 0xE8, 0x00, 0x00);
+
+	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
+		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BKX_SEL_NONE);
+	ST7701_DSI(st7701, 0x11);
+	msleep(120);
+	ST7701_DSI(st7701, 0xE8, 0x00, 0x00);
+
+	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
+		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BKX_SEL_NONE);
+
+	ST7701_DSI(st7701, 0x3A, 0x70);
+}
+
 static int st7701_prepare(struct drm_panel *panel)
 {
 	struct st7701 *st7701 = panel_to_st7701(panel);
@@ -532,6 +607,107 @@ static const struct st7701_panel_desc ts8550b_desc = {
 	.gip_sequence = ts8550b_gip_sequence,
 };
 
+static const struct drm_display_mode dmt028vghmcmi_1a_mode = {
+	.clock		= 22325,
+
+	.hdisplay	= 480,
+	.hsync_start	= 480 + 40,
+	.hsync_end	= 480 + 40 + 4,
+	.htotal		= 480 + 40 + 4 + 20,
+
+	.vdisplay	= 640,
+	.vsync_start	= 640 + 2,
+	.vsync_end	= 640 + 2 + 40,
+	.vtotal		= 640 + 2 + 40 + 16,
+
+	.width_mm	= 56,
+	.height_mm	= 78,
+
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct st7701_panel_desc dmt028vghmcmi_1a_desc = {
+	.mode = &dmt028vghmcmi_1a_mode,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.panel_sleep_delay = 5, /* panel need extra 5ms for sleep out cmd */
+
+	.pv_gamma = {
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0x10),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x17),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0xd),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x11),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x6),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x5),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x7),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x1f),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x4),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x11),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0xe),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x29),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x30),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
+	},
+	.nv_gamma = {
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0xd),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x14),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0xe),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x11),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x6),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x4),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x8),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x20),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x5),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x13),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x13),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x26),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x30),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
+	},
+	.nlinv = 1,
+	.vop_uv = 4800000,
+	.vcom_uv = 1650000,
+	.vgh_mv = 15000,
+	.vgl_mv = -10170,
+	.avdd_mv = 6600,
+	.avcl_mv = -4400,
+	.gamma_op_bias = OP_BIAS_MIDDLE,
+	.input_op_bias = OP_BIAS_MIN,
+	.output_op_bias = OP_BIAS_MIN,
+	.t2d_ns = 1600,
+	.t3d_ns = 10400,
+	.eot_en = true,
+	.gip_sequence = dmt028vghmcmi_1a_gip_sequence,
+};
+
 static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	const struct st7701_panel_desc *desc;
@@ -600,6 +776,7 @@ static int st7701_dsi_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id st7701_of_match[] = {
+	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
 	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
 	{ }
 };
-- 
2.35.1

