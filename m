Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E3656D11C
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7181F18B060;
	Sun, 10 Jul 2022 19:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E799C18B064
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:44:51 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 02559843AD;
 Sun, 10 Jul 2022 21:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657482290;
 bh=gdM76EiM7zuxcJNnpC1xrbxQR+9Zznd+pq6uMPm7tQY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XHvWeLIssUnpRBiY4ztpZ6XO4uOIj/0yPfMJyGNQeB9z3KtP9okA4aOemNYGYIOaE
 oc6gTTmGTmt7c/JHzIvJjpTB0oZBOyucbb0/GykWm7Zx/5rAnftSeEEbfUwnsjHHup
 QFqlTtX+rN6qt+w/TrijF+1mwe6QVrzovp2u6GZ9SkpseNp36ozwXrBAIfoOR3seUS
 Hz9sbWbacdOER0oRT0ZDVmmzYXoqK2I9wTqkUFWXIe2DU8iZqzZqkeQN4PjAiXSUoz
 deScTtGaPhHPhY3wAqIjoo5HFbRhkEGKzxiJ1EXJR/DoqlpPVHfdItXCwCpIg+2ILl
 hgVEGcVnhqK0g==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/panel/panel-sitronix-st7701: Make gamma correction
 TFT specific
Date: Sun, 10 Jul 2022 21:44:32 +0200
Message-Id: <20220710194437.289042-4-marex@denx.de>
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

The gamma correction values are specific to the TFT which is attached to
the ST7701 TFT matrix driver, move the gamma correction values from what
incorrectly looks like common init sequence into TFT matrix specific
settings.

While doing so, add macros which defined fields within the gamma register
file and a macro which mimics FIELD_PREP except works with constant
expressions.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 96 +++++++++++++++++--
 1 file changed, 89 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 48206d8acca7..becf205c8ea8 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -51,6 +51,23 @@
 #define DSI_CMD2BKX_SEL_NONE		0x00
 
 /* Command2, BK0 bytes */
+#define DSI_CMD2_BK0_GAMCTRL_AJ_MASK	GENMASK(7, 6)
+#define DSI_CMD2_BK0_GAMCTRL_VC0_MASK	GENMASK(3, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC4_MASK	GENMASK(5, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC8_MASK	GENMASK(5, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC16_MASK	GENMASK(4, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC24_MASK	GENMASK(4, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC52_MASK	GENMASK(3, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC80_MASK	GENMASK(5, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC108_MASK	GENMASK(3, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC147_MASK	GENMASK(3, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC175_MASK	GENMASK(5, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC203_MASK	GENMASK(3, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC231_MASK	GENMASK(4, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC239_MASK	GENMASK(4, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC247_MASK	GENMASK(5, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC251_MASK	GENMASK(5, 0)
+#define DSI_CMD2_BK0_GAMCTRL_VC255_MASK	GENMASK(4, 0)
 #define DSI_LINESET_LINE		0x69
 #define DSI_LINESET_LDE_EN		BIT(7)
 #define DSI_LINESET_LINEDELTA		GENMASK(1, 0)
@@ -86,11 +103,18 @@
 #define DSI_MIPISET1_EOT_EN		BIT(3)
 #define DSI_CMD2_BK1_MIPISET1_SET	(BIT(7) | DSI_MIPISET1_EOT_EN)
 
+#define CFIELD_PREP(_mask, _val)					\
+	(((typeof(_mask))(_val) << (__builtin_ffsll(_mask) - 1)) & (_mask))
+
 struct st7701_panel_desc {
 	const struct drm_display_mode *mode;
 	unsigned int lanes;
 	enum mipi_dsi_pixel_format format;
 	unsigned int panel_sleep_delay;
+
+	/* TFT matrix driver configuration, panel specific. */
+	const u8	pv_gamma[16];	/* Positive voltage gamma control */
+	const u8	nv_gamma[16];	/* Negative voltage gamma control */
 };
 
 struct st7701 {
@@ -122,7 +146,8 @@ static inline int st7701_dsi_write(struct st7701 *st7701, const void *seq,
 
 static void st7701_init_sequence(struct st7701 *st7701)
 {
-	const struct drm_display_mode *mode = st7701->desc->mode;
+	const struct st7701_panel_desc *desc = st7701->desc;
+	const struct drm_display_mode *mode = desc->mode;
 
 	ST7701_DSI(st7701, MIPI_DCS_SOFT_RESET, 0x00);
 
@@ -136,12 +161,10 @@ static void st7701_init_sequence(struct st7701 *st7701)
 	/* Command2, BK0 */
 	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
 		   0x77, 0x01, 0x00, 0x00, DSI_CMD2BK0_SEL);
-	ST7701_DSI(st7701, DSI_CMD2_BK0_PVGAMCTRL, 0x00, 0x0E, 0x15, 0x0F,
-		   0x11, 0x08, 0x08, 0x08, 0x08, 0x23, 0x04, 0x13, 0x12,
-		   0x2B, 0x34, 0x1F);
-	ST7701_DSI(st7701, DSI_CMD2_BK0_NVGAMCTRL, 0x00, 0x0E, 0x95, 0x0F,
-		   0x13, 0x07, 0x09, 0x08, 0x08, 0x22, 0x04, 0x10, 0x0E,
-		   0x2C, 0x34, 0x1F);
+	mipi_dsi_dcs_write(st7701->dsi, DSI_CMD2_BK0_PVGAMCTRL,
+			   desc->pv_gamma, ARRAY_SIZE(desc->pv_gamma));
+	mipi_dsi_dcs_write(st7701->dsi, DSI_CMD2_BK0_NVGAMCTRL,
+			   desc->nv_gamma, ARRAY_SIZE(desc->nv_gamma));
 	ST7701_DSI(st7701, DSI_CMD2_BK0_LNESET,
 		   DSI_CMD2_BK0_LNESET_B0, DSI_CMD2_BK0_LNESET_B1);
 	ST7701_DSI(st7701, DSI_CMD2_BK0_PORCTRL,
@@ -312,6 +335,65 @@ static const struct st7701_panel_desc ts8550b_desc = {
 	.lanes = 2,
 	.format = MIPI_DSI_FMT_RGB888,
 	.panel_sleep_delay = 80, /* panel need extra 80ms for sleep out cmd */
+
+	.pv_gamma = {
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0xe),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x15),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0xf),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x11),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x8),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x8),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x8),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x23),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x4),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x13),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x12),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x2b),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x34),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
+	},
+	.nv_gamma = {
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0xe),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0x2) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x15),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0xf),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x13),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x7),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x9),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x8),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x22),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x4),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x10),
+
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0xe),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x2c),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x34),
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
+		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
+	},
 };
 
 static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
-- 
2.35.1

