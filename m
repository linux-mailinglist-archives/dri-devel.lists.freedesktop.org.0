Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F3D56D120
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9E618B066;
	Sun, 10 Jul 2022 19:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D5018B060
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:44:52 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7864A84606;
 Sun, 10 Jul 2022 21:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657482290;
 bh=58fwFRSEM9mrBSw3QNjVx71vDUVrpwEvprz7gk55t84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KN7GIjYx1praVPyE5to+0P+ld9X/tsQVgTIPtlRtCtwj0ATfeJPGJMYMWgvfDz8HV
 gwKnl0gWAiHnYPbfkqsgpxf1tp7FYiszE5Ygh7SePCIEugE+HuwhxJ6wGRjLE+zHG+
 nf3Kcn1TjPFsPsx5TK6kAo0ozZCq6QkOeauKz+eV2Ez4bkew88HlzTnSLjfqrRTKoz
 fAtY71Lq5P7gLNHOpwY05tjbWvjA1EJdBtJCuOxtE7mQZPmbRYwjDRR5Nr1j+3WbvM
 2xTvD+Eoq0LqwVk52nZs3Qk90QkqqGjYJow/Ew6Q31I88CJvH8A2CJq65JeAaGHAiw
 O1X++KAyepgyQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/panel/panel-sitronix-st7701: Infer vertical line
 count from TFT mode
Date: Sun, 10 Jul 2022 21:44:33 +0200
Message-Id: <20220710194437.289042-5-marex@denx.de>
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

The vertical line count is a property of the TFT matrix. Currently the
driver hard-codes content of this register to specific value which is
only compatible with one TFT matrix, likely the TS8550B one.

Calculate the vertical line count from the mode instead.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index becf205c8ea8..57388b1d516f 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -8,6 +8,7 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
+#include <linux/bitfield.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -68,11 +69,9 @@
 #define DSI_CMD2_BK0_GAMCTRL_VC247_MASK	GENMASK(5, 0)
 #define DSI_CMD2_BK0_GAMCTRL_VC251_MASK	GENMASK(5, 0)
 #define DSI_CMD2_BK0_GAMCTRL_VC255_MASK	GENMASK(4, 0)
-#define DSI_LINESET_LINE		0x69
-#define DSI_LINESET_LDE_EN		BIT(7)
-#define DSI_LINESET_LINEDELTA		GENMASK(1, 0)
-#define DSI_CMD2_BK0_LNESET_B1		DSI_LINESET_LINEDELTA
-#define DSI_CMD2_BK0_LNESET_B0		(DSI_LINESET_LDE_EN | DSI_LINESET_LINE)
+#define DSI_CMD2_BK0_LNESET_LINE_MASK	GENMASK(6, 0)
+#define DSI_CMD2_BK0_LNESET_LDE_EN	BIT(7)
+#define DSI_CMD2_BK0_LNESET_LINEDELTA	GENMASK(1, 0)
 #define DSI_INVSEL_DEFAULT		GENMASK(5, 4)
 #define DSI_INVSEL_NLINV		GENMASK(2, 0)
 #define DSI_INVSEL_RTNI			GENMASK(2, 1)
@@ -148,6 +147,8 @@ static void st7701_init_sequence(struct st7701 *st7701)
 {
 	const struct st7701_panel_desc *desc = st7701->desc;
 	const struct drm_display_mode *mode = desc->mode;
+	const u8 linecount8 = mode->vdisplay / 8;
+	const u8 linecountrem2 = (mode->vdisplay % 8) / 2;
 
 	ST7701_DSI(st7701, MIPI_DCS_SOFT_RESET, 0x00);
 
@@ -165,8 +166,21 @@ static void st7701_init_sequence(struct st7701 *st7701)
 			   desc->pv_gamma, ARRAY_SIZE(desc->pv_gamma));
 	mipi_dsi_dcs_write(st7701->dsi, DSI_CMD2_BK0_NVGAMCTRL,
 			   desc->nv_gamma, ARRAY_SIZE(desc->nv_gamma));
+	/*
+	 * Vertical line count configuration:
+	 * Line[6:0]: select number of vertical lines of the TFT matrix in
+	 *            multiples of 8 lines
+	 * LDE_EN: enable sub-8-line granularity line count
+	 * Line_delta[1:0]: add 0/2/4/6 extra lines to line count selected
+	 *                  using Line[6:0]
+	 *
+	 * Total number of vertical lines:
+	 * LN = ((Line[6:0] + 1) * 8) + (LDE_EN ? Line_delta[1:0] * 2 : 0)
+	 */
 	ST7701_DSI(st7701, DSI_CMD2_BK0_LNESET,
-		   DSI_CMD2_BK0_LNESET_B0, DSI_CMD2_BK0_LNESET_B1);
+		   FIELD_PREP(DSI_CMD2_BK0_LNESET_LINE_MASK, linecount8 - 1) |
+		   (linecountrem2 ? DSI_CMD2_BK0_LNESET_LDE_EN : 0),
+		   FIELD_PREP(DSI_CMD2_BK0_LNESET_LINEDELTA, linecountrem2));
 	ST7701_DSI(st7701, DSI_CMD2_BK0_PORCTRL,
 		   DSI_CMD2_BK0_PORCTRL_B0(mode),
 		   DSI_CMD2_BK0_PORCTRL_B1(mode));
-- 
2.35.1

