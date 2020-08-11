Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2853B2416AB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578656E226;
	Tue, 11 Aug 2020 06:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4826E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 00:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1597105372; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjIL9moCS0z1R5alv49aEL6O8PlqQzsA7GoxoF/cqMw=;
 b=pK9ShE4tFRjKFD+mxFvMa/9QiWoOgvWQPajZrDK8Gng10jd0U2ta3YPUdqCwxlBB6sNNnG
 aIx1XIjVVZK7U+zQ2VI50PAL9gDHYxPE+1xHjDAqjmXI8oOe8fvAV0rCmbIFAQRjFPkZgw
 JeP7SmmvFEo+ZriFb6yWXGOhR+VX8W4=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/5] drm/panel: novatek,
 nt39016: Add missing CR to error messages
Date: Tue, 11 Aug 2020 02:22:37 +0200
Message-Id: <20200811002240.55194-3-paul@crapouillou.net>
In-Reply-To: <20200811002240.55194-1-paul@crapouillou.net>
References: <20200811002240.55194-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If you pass a string that is not terminated with a carriage return to
dev_err(), it will eventually be printed with a carriage return, but
not right away, since the kernel will wait for a pr_cont().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index ba05165b6050..39f7be679da5 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -124,7 +124,7 @@ static int nt39016_prepare(struct drm_panel *drm_panel)
 
 	err = regulator_enable(panel->supply);
 	if (err) {
-		dev_err(panel->dev, "Failed to enable power supply: %d", err);
+		dev_err(panel->dev, "Failed to enable power supply: %d\n", err);
 		return err;
 	}
 
@@ -143,7 +143,7 @@ static int nt39016_prepare(struct drm_panel *drm_panel)
 	err = regmap_multi_reg_write(panel->map, nt39016_panel_regs,
 				     ARRAY_SIZE(nt39016_panel_regs));
 	if (err) {
-		dev_err(panel->dev, "Failed to init registers: %d", err);
+		dev_err(panel->dev, "Failed to init registers: %d\n", err);
 		goto err_disable_regulator;
 	}
 
@@ -173,7 +173,7 @@ static int nt39016_enable(struct drm_panel *drm_panel)
 	ret = regmap_write(panel->map, NT39016_REG_SYSTEM,
 			   NT39016_SYSTEM_RESET_N | NT39016_SYSTEM_STANDBY);
 	if (ret) {
-		dev_err(panel->dev, "Unable to enable panel: %d", ret);
+		dev_err(panel->dev, "Unable to enable panel: %d\n", ret);
 		return ret;
 	}
 
@@ -193,7 +193,7 @@ static int nt39016_disable(struct drm_panel *drm_panel)
 	err = regmap_write(panel->map, NT39016_REG_SYSTEM,
 			   NT39016_SYSTEM_RESET_N);
 	if (err) {
-		dev_err(panel->dev, "Unable to disable panel: %d", err);
+		dev_err(panel->dev, "Unable to disable panel: %d\n", err);
 		return err;
 	}
 
@@ -261,13 +261,13 @@ static int nt39016_probe(struct spi_device *spi)
 
 	panel->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(panel->supply)) {
-		dev_err(dev, "Failed to get power supply");
+		dev_err(dev, "Failed to get power supply\n");
 		return PTR_ERR(panel->supply);
 	}
 
 	panel->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(panel->reset_gpio)) {
-		dev_err(dev, "Failed to get reset GPIO");
+		dev_err(dev, "Failed to get reset GPIO\n");
 		return PTR_ERR(panel->reset_gpio);
 	}
 
@@ -275,20 +275,20 @@ static int nt39016_probe(struct spi_device *spi)
 	spi->mode = SPI_MODE_3 | SPI_3WIRE;
 	err = spi_setup(spi);
 	if (err) {
-		dev_err(dev, "Failed to setup SPI");
+		dev_err(dev, "Failed to setup SPI\n");
 		return err;
 	}
 
 	panel->map = devm_regmap_init_spi(spi, &nt39016_regmap_config);
 	if (IS_ERR(panel->map)) {
-		dev_err(dev, "Failed to init regmap");
+		dev_err(dev, "Failed to init regmap\n");
 		return PTR_ERR(panel->map);
 	}
 
 	err = drm_panel_of_backlight(&panel->drm_panel);
 	if (err) {
 		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get backlight handle");
+			dev_err(dev, "Failed to get backlight handle\n");
 		return err;
 	}
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
