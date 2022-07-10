Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A956D121
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 21:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFC218B063;
	Sun, 10 Jul 2022 19:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C224318B062
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 19:44:51 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 85EE983F14;
 Sun, 10 Jul 2022 21:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1657482289;
 bh=+7tHRQ9L+adWPc0rSiQUp5xXZ2SpmVZ67+QXM0tlwV0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EbbXdM34BTcrcLQRkUg48H73Fjk7IJxGf6dhQ98XJQanmUF5te+ljvFdXuihwgCal
 07BZlWUec75z4+bwQZ4Vc5u9/z0GA2f5sK2DJOoi+eJOjL8A7qREpWO+t1fFIV1FVS
 7C0WtTpOb3ZICCeu3axG7UgvyPSWHM4f+yZDM2iUVHH/i8wtl1CHnfWRYRk0DrA93X
 C+g2TWyORmMZ5xfWb0JRRgTlZ7lbbHwbO7nyFdn7YC+uSQtz2UvLxXmb1f+uP/XzdW
 cK40jAfhk7auZCpJeztRtGeGHkOj8BPlFBV0pluELGJ6JZk6RwHYQJsFBTUmX6r3Jk
 IOxqOexc0RHCw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/panel/panel-sitronix-st7701: Make voltage supplies
 common to ST7701
Date: Sun, 10 Jul 2022 21:44:31 +0200
Message-Id: <20220710194437.289042-3-marex@denx.de>
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

The ST7701 and ST7701S all have two voltage supplies, one for internal
logic and one for the TFT matrix driver. The supplies are not property
of the TFT matrix driver, so move them to common ST7701 code.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 29 +++++--------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index fe9f1d2fcf44..48206d8acca7 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -90,8 +90,6 @@ struct st7701_panel_desc {
 	const struct drm_display_mode *mode;
 	unsigned int lanes;
 	enum mipi_dsi_pixel_format format;
-	const char *const *supply_names;
-	unsigned int num_supplies;
 	unsigned int panel_sleep_delay;
 };
 
@@ -100,7 +98,7 @@ struct st7701 {
 	struct mipi_dsi_device *dsi;
 	const struct st7701_panel_desc *desc;
 
-	struct regulator_bulk_data *supplies;
+	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *reset;
 	unsigned int sleep_delay;
 };
@@ -200,7 +198,7 @@ static int st7701_prepare(struct drm_panel *panel)
 
 	gpiod_set_value(st7701->reset, 0);
 
-	ret = regulator_bulk_enable(st7701->desc->num_supplies,
+	ret = regulator_bulk_enable(ARRAY_SIZE(st7701->supplies),
 				    st7701->supplies);
 	if (ret < 0)
 		return ret;
@@ -253,7 +251,7 @@ static int st7701_unprepare(struct drm_panel *panel)
 	 */
 	msleep(st7701->sleep_delay);
 
-	regulator_bulk_disable(st7701->desc->num_supplies, st7701->supplies);
+	regulator_bulk_disable(ARRAY_SIZE(st7701->supplies), st7701->supplies);
 
 	return 0;
 }
@@ -309,17 +307,10 @@ static const struct drm_display_mode ts8550b_mode = {
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
-static const char * const ts8550b_supply_names[] = {
-	"VCC",
-	"IOVCC",
-};
-
 static const struct st7701_panel_desc ts8550b_desc = {
 	.mode = &ts8550b_mode,
 	.lanes = 2,
 	.format = MIPI_DSI_FMT_RGB888,
-	.supply_names = ts8550b_supply_names,
-	.num_supplies = ARRAY_SIZE(ts8550b_supply_names),
 	.panel_sleep_delay = 80, /* panel need extra 80ms for sleep out cmd */
 };
 
@@ -327,7 +318,7 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	const struct st7701_panel_desc *desc;
 	struct st7701 *st7701;
-	int ret, i;
+	int ret;
 
 	st7701 = devm_kzalloc(&dsi->dev, sizeof(*st7701), GFP_KERNEL);
 	if (!st7701)
@@ -339,16 +330,10 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = desc->format;
 	dsi->lanes = desc->lanes;
 
-	st7701->supplies = devm_kcalloc(&dsi->dev, desc->num_supplies,
-					sizeof(*st7701->supplies),
-					GFP_KERNEL);
-	if (!st7701->supplies)
-		return -ENOMEM;
-
-	for (i = 0; i < desc->num_supplies; i++)
-		st7701->supplies[i].supply = desc->supply_names[i];
+	st7701->supplies[0].supply = "VCC";
+	st7701->supplies[1].supply = "IOVCC";
 
-	ret = devm_regulator_bulk_get(&dsi->dev, desc->num_supplies,
+	ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(st7701->supplies),
 				      st7701->supplies);
 	if (ret < 0)
 		return ret;
-- 
2.35.1

