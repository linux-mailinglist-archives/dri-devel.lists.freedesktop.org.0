Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136C55FF6A5
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 01:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8602310E199;
	Fri, 14 Oct 2022 23:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEA510E154
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 23:10:57 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 579B084C6F;
 Sat, 15 Oct 2022 01:10:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665789055;
 bh=v6o86wd9q4N0/RxMo2yjeyH7S0h8rTfrf8dSJi/c/GU=;
 h=From:To:Cc:Subject:Date:From;
 b=Nv6RYY9c3lqXcni9TyZn7tqQ5rwKCzpiZ2EeVeYzHfXjpMDsMeO80yBiVWh/7L7pu
 qUvYOuc4Z1F/iup8HQHZU7/4Rd5ntf8/tr03qD1gdqdxV/lucT+xOsGzLiS+5Z6i1M
 Tm/NWfvOp5wDc4kG+1HD/XzBtaAalk8B3vg8BQdkQ5a7LTIoNrRV3rgICKqQziIWnL
 pkX29ZXFXY6qWKPhFdcQwW8Pc20wKvHXNDdIhyKOnYAKZ1Sq5T5FmAjylbFRGEFbWd
 w66ORegf7x04QzO1Np9UaAUKlz4ooN/94gsyDNCxRM1Dot8UO01jfm2L79XYxN+2zb
 JSu/DPMR1AfKQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel/panel-sitronix-st7701: Clean up CMDnBKx selection
Date: Sat, 15 Oct 2022 01:10:42 +0200
Message-Id: <20221014231042.468033-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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
Cc: Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two command register files, CMD1 and CMD2, where only the CMD2
contains additional register sub-files BK0..3 . Pull the register file
selection call into separate function instead of duplicating it all over
the driver. The CMD2BK2 file is undocumented in datasheet, and is used
for BIST. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 58 ++++++++-----------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 9578f461f5e48..baeb952b6e244 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -19,6 +19,9 @@
 
 /* Command2 BKx selection command */
 #define DSI_CMD2BKX_SEL			0xFF
+#define DSI_CMD1			0
+#define DSI_CMD2			BIT(4)
+#define DSI_CMD2BK_MASK			GENMASK(3, 0)
 
 /* Command2, BK0 commands */
 #define DSI_CMD2_BK0_PVGAMCTRL		0xB0 /* Positive Voltage Gamma Control */
@@ -39,21 +42,6 @@
 #define DSI_CMD2_BK1_SPD2		0xC2 /* Source EQ2 Setting */
 #define DSI_CMD2_BK1_MIPISET1		0xD0 /* MIPI Setting 1 */
 
-/*
- * Command2 with BK function selection.
- *
- * BIT[4].....CN2
- * BIT[1:0]...BKXSEL
- * 1:00 = CMD2BK0, Command2 BK0
- * 1:01 = CMD2BK1, Command2 BK1
- * 1:11 = CMD2BK3, Command2 BK3
- * 0:00 = Command2 disable
- */
-#define DSI_CMD2BK0_SEL			0x10
-#define DSI_CMD2BK1_SEL			0x11
-#define DSI_CMD2BK3_SEL			0x13
-#define DSI_CMD2BKX_SEL_NONE		0x00
-
 /* Command2, BK0 bytes */
 #define DSI_CMD2_BK0_GAMCTRL_AJ_MASK	GENMASK(7, 6)
 #define DSI_CMD2_BK0_GAMCTRL_VC0_MASK	GENMASK(3, 0)
@@ -191,6 +179,18 @@ static u8 st7701_vgls_map(struct st7701 *st7701)
 	return 0;
 }
 
+static void st7701_switch_cmd_bkx(struct st7701 *st7701, bool cmd2, u8 bkx)
+{
+	u8 val;
+
+	if (cmd2)
+		val = DSI_CMD2 | FIELD_PREP(DSI_CMD2BK_MASK, bkx);
+	else
+		val = DSI_CMD1;
+
+	ST7701_DSI(st7701, DSI_CMD2BKX_SEL, 0x77, 0x01, 0x00, 0x00, val);
+}
+
 static void st7701_init_sequence(struct st7701 *st7701)
 {
 	const struct st7701_panel_desc *desc = st7701->desc;
@@ -208,8 +208,8 @@ static void st7701_init_sequence(struct st7701 *st7701)
 	msleep(st7701->sleep_delay);
 
 	/* Command2, BK0 */
-	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BK0_SEL);
+	st7701_switch_cmd_bkx(st7701, true, 0);
+
 	mipi_dsi_dcs_write(st7701->dsi, DSI_CMD2_BK0_PVGAMCTRL,
 			   desc->pv_gamma, ARRAY_SIZE(desc->pv_gamma));
 	mipi_dsi_dcs_write(st7701->dsi, DSI_CMD2_BK0_NVGAMCTRL,
@@ -247,8 +247,7 @@ static void st7701_init_sequence(struct st7701 *st7701)
 			      (clamp((u32)mode->htotal, 512U, 1008U) - 512) / 16));
 
 	/* Command2, BK1 */
-	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-			0x77, 0x01, 0x00, 0x00, DSI_CMD2BK1_SEL);
+	st7701_switch_cmd_bkx(st7701, true, 1);
 
 	/* Vop = 3.5375V + (VRHA[7:0] * 0.0125V) */
 	ST7701_DSI(st7701, DSI_CMD2_BK1_VRHS,
@@ -373,33 +372,27 @@ static void dmt028vghmcmi_1a_gip_sequence(struct st7701 *st7701)
 		   0x08, 0x08, 0x08, 0x40,
 			   0x3F, 0x64);
 
-	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BKX_SEL_NONE);
+	st7701_switch_cmd_bkx(st7701, false, 0);
 
-	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BK3_SEL);
+	st7701_switch_cmd_bkx(st7701, true, 3);
 	ST7701_DSI(st7701, 0xE6, 0x7C);
 	ST7701_DSI(st7701, 0xE8, 0x00, 0x0E);
 
-	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BKX_SEL_NONE);
+	st7701_switch_cmd_bkx(st7701, false, 0);
 	ST7701_DSI(st7701, 0x11);
 	msleep(120);
 
-	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BK3_SEL);
+	st7701_switch_cmd_bkx(st7701, true, 3);
 	ST7701_DSI(st7701, 0xE8, 0x00, 0x0C);
 	msleep(10);
 	ST7701_DSI(st7701, 0xE8, 0x00, 0x00);
 
-	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BKX_SEL_NONE);
+	st7701_switch_cmd_bkx(st7701, false, 0);
 	ST7701_DSI(st7701, 0x11);
 	msleep(120);
 	ST7701_DSI(st7701, 0xE8, 0x00, 0x00);
 
-	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BKX_SEL_NONE);
+	st7701_switch_cmd_bkx(st7701, false, 0);
 
 	ST7701_DSI(st7701, 0x3A, 0x70);
 }
@@ -426,8 +419,7 @@ static int st7701_prepare(struct drm_panel *panel)
 		st7701->desc->gip_sequence(st7701);
 
 	/* Disable Command2 */
-	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BKX_SEL_NONE);
+	st7701_switch_cmd_bkx(st7701, false, 0);
 
 	return 0;
 }
-- 
2.35.1

