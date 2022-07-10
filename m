Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA8056D11F
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F26C18B065;
	Sun, 10 Jul 2022 19:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EB118B062
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:44:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3F53E84615;
 Sun, 10 Jul 2022 21:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657482291;
 bh=OHLp8hKa0d2N7UpQ+UpqGs4VoxGiN6v3ccwUy6Pab6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZN0XXB78MkncTj4bHpwXnuEqK9h8+BdjWlX8MlEFpX7YeoXX4EMwzEE+OtZ98CluS
 NwyAsqZqGbDIRh7ectutpzbAjw6ps8Z6sSLVDVFJQ505kpzcw65mgIBlSUvY23z6LK
 jASN1xkqh45SlSUVffFmLOkyXUPg640YdkgnLAzdyAxbS1Rid+KkRKjyj0bxgK+hJ/
 5kHuExJGy3dPz5oSNlRgCrHsl3QSGjhzncSnGFnxYTDWYVwwdhfhHERXEn+YOVcnzw
 qNaDSrogdw8EMyrKDKwGKDWb9UuifbvjieD/wWlTEOkAuppoND+TTRvGMHDODXzwZd
 1AIYXc0pPeFKQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/panel/panel-sitronix-st7701: Infer horizontal pixel
 count from TFT mode
Date: Sun, 10 Jul 2022 21:44:35 +0200
Message-Id: <20220710194437.289042-7-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710194437.289042-1-marex@denx.de>
References: <20220710194437.289042-1-marex@denx.de>
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

The horizontal pixel count is a property of the TFT matrix. Currently the
driver hard-codes content of this register to specific value which is
only compatible with one TFT matrix, likely the TS8550B one.

Calculate the horizontal pixel count from the mode instead.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 42e46e804146..177180f1c2c8 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -74,11 +74,9 @@
 #define DSI_CMD2_BK0_LNESET_LINEDELTA	GENMASK(1, 0)
 #define DSI_CMD2_BK0_PORCTRL_VBP_MASK	GENMASK(7, 0)
 #define DSI_CMD2_BK0_PORCTRL_VFP_MASK	GENMASK(7, 0)
-#define DSI_INVSEL_DEFAULT		GENMASK(5, 4)
-#define DSI_INVSEL_NLINV		GENMASK(2, 0)
-#define DSI_INVSEL_RTNI			GENMASK(2, 1)
-#define DSI_CMD2_BK0_INVSEL_B1		DSI_INVSEL_RTNI
-#define DSI_CMD2_BK0_INVSEL_B0		(DSI_INVSEL_DEFAULT | DSI_INVSEL_NLINV)
+#define DSI_CMD2_BK0_INVSEL_ONES_MASK	GENMASK(5, 4)
+#define DSI_CMD2_BK0_INVSEL_NLINV_MASK	GENMASK(2, 0)
+#define DSI_CMD2_BK0_INVSEL_RTNI_MASK	GENMASK(4, 0)
 
 /* Command2, BK1 bytes */
 #define DSI_CMD2_BK1_VRHA_SET		0x45
@@ -114,6 +112,7 @@ struct st7701_panel_desc {
 	/* TFT matrix driver configuration, panel specific. */
 	const u8	pv_gamma[16];	/* Positive voltage gamma control */
 	const u8	nv_gamma[16];	/* Negative voltage gamma control */
+	const u8	nlinv;		/* Inversion selection */
 };
 
 struct st7701 {
@@ -186,8 +185,17 @@ static void st7701_init_sequence(struct st7701 *st7701)
 			      mode->vtotal - mode->vsync_end),
 		   FIELD_PREP(DSI_CMD2_BK0_PORCTRL_VFP_MASK,
 			      mode->vsync_start - mode->vdisplay));
+	/*
+	 * Horizontal pixel count configuration:
+	 * PCLK = 512 + (RTNI[4:0] * 16)
+	 * The PCLK is number of pixel clock per line, which matches
+	 * mode htotal. The minimum is 512 PCLK.
+	 */
 	ST7701_DSI(st7701, DSI_CMD2_BK0_INVSEL,
-		   DSI_CMD2_BK0_INVSEL_B0, DSI_CMD2_BK0_INVSEL_B1);
+		   DSI_CMD2_BK0_INVSEL_ONES_MASK |
+		   FIELD_PREP(DSI_CMD2_BK0_INVSEL_NLINV_MASK, desc->nlinv),
+		   FIELD_PREP(DSI_CMD2_BK0_INVSEL_RTNI_MASK,
+			      DIV_ROUND_UP(mode->htotal, 16)));
 
 	/* Command2, BK1 */
 	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
@@ -410,6 +418,7 @@ static const struct st7701_panel_desc ts8550b_desc = {
 		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
 		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
 	},
+	.nlinv = 7,
 };
 
 static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
-- 
2.35.1

