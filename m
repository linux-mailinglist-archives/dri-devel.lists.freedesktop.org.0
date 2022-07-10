Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF95656D123
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FB818B06E;
	Sun, 10 Jul 2022 19:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB4B18B060
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:44:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 085A78461F;
 Sun, 10 Jul 2022 21:44:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657482292;
 bh=DvCxcfr3nuUZc2GQUYaQZzipiw5vSBMPYbVB1cMCl/Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JDqydZk3+Cjr+CDT5Wm87NbX+qj37DkLhr4btn6oF+K50R92AKcaN9kzk/9VnMfYm
 cH1Ed+UrSMyIaJFKxtP1QEWXjZ5YpM3imilO/x9HNo6hMS1GoTJVHsjqldq0x/gbID
 zW3fNeLhR6odsjRgs9eC4wLSp50QpxEsGLTYbpajBNtXs9VpEwHGU3SAl8W0RJzO+9
 Of65K5e20e9le/ScIvPgMhV7sS9RsfWtJa025EoLKKORa0Q7nomMrbeHaOkXL9GUl1
 fPAFWwNisTmikzub0H6qR6xxneNcIXsABc9iZo1b5awLmtY/focg47OhND5NYahaZz
 aHbg/9R7NLMHg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/panel/panel-sitronix-st7701: Split GIP and init
 sequences
Date: Sun, 10 Jul 2022 21:44:37 +0200
Message-Id: <20220710194437.289042-9-marex@denx.de>
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

The ST7701 initialization sequence is well parametrized, split the GIP
programming sequence, which is fully custom completely undocumented
TFT matrix specific magic register programming sequence into separate
callback so other TFT matrix definitions can add their own GIP sequence.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index bf7237c1abcc..843495d607d5 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -107,6 +107,8 @@ enum op_bias {
 	OP_BIAS_MAX
 };
 
+struct st7701;
+
 struct st7701_panel_desc {
 	const struct drm_display_mode *mode;
 	unsigned int lanes;
@@ -129,6 +131,9 @@ struct st7701_panel_desc {
 	const u16	t2d_ns;		/* T2D in ns */
 	const u16	t3d_ns;		/* T3D in ns */
 	const bool	eot_en;
+
+	/* GIP sequence, fully custom and undocumented. */
+	void		(*gip_sequence)(struct st7701 *st7701);
 };
 
 struct st7701 {
@@ -297,7 +302,10 @@ static void st7701_init_sequence(struct st7701 *st7701)
 	ST7701_DSI(st7701, DSI_CMD2_BK1_MIPISET1,
 		   DSI_CMD2_BK1_MIPISET1_ONES |
 		   (desc->eot_en ? DSI_CMD2_BK1_MIPISET1_EOT_EN : 0));
+}
 
+static void ts8550b_gip_sequence(struct st7701 *st7701)
+{
 	/**
 	 * ST7701_SPEC_V1.2 is unable to provide enough information above this
 	 * specific command sequence, so grab the same from vendor BSP driver.
@@ -319,10 +327,6 @@ static void st7701_init_sequence(struct st7701 *st7701)
 	ST7701_DSI(st7701, 0xEC, 0x00, 0x00);
 	ST7701_DSI(st7701, 0xED, 0xFF, 0xF1, 0x04, 0x56, 0x72, 0x3F, 0xFF,
 		   0xFF, 0xFF, 0xFF, 0xF3, 0x27, 0x65, 0x40, 0x1F, 0xFF);
-
-	/* disable Command2 */
-	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BKX_SEL_NONE);
 }
 
 static int st7701_prepare(struct drm_panel *panel)
@@ -343,6 +347,13 @@ static int st7701_prepare(struct drm_panel *panel)
 
 	st7701_init_sequence(st7701);
 
+	if (st7701->desc->gip_sequence)
+		st7701->desc->gip_sequence(st7701);
+
+	/* Disable Command2 */
+	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
+		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BKX_SEL_NONE);
+
 	return 0;
 }
 
@@ -518,6 +529,7 @@ static const struct st7701_panel_desc ts8550b_desc = {
 	.t2d_ns = 1600,
 	.t3d_ns = 10400,
 	.eot_en = true,
+	.gip_sequence = ts8550b_gip_sequence,
 };
 
 static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
-- 
2.35.1

