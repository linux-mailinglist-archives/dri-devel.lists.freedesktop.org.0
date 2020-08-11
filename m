Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5D2416C4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 09:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C119D6E4CF;
	Tue, 11 Aug 2020 06:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDDC6E49D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 00:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1597105371; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2pAnB95G7HfE2UWr4cxMF2djUoaYxRElPvRjpK6hlhU=;
 b=d197E3XBewJUXplkkmNY5MDQQycQSD3sInAosPbLbaIWyW3QctL81PILqzExjMzqAK6Tpl
 zVIHQMD4Ytr/HobyXEF+lwNf7Aw50+I8/IkBtpn0wk+GEQhsf+SAjeXMvoFYOtrZa5IDA8
 SaB12kToN3cNWv2dFe/J9563P2p/Nl8=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/5] drm/panel: novatek,
 nt39016: Handle backlight the standard way
Date: Tue, 11 Aug 2020 02:22:36 +0200
Message-Id: <20200811002240.55194-2-paul@crapouillou.net>
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

Instead of manipulating the backlight directly in this driver, register
it in the probe using drm_panel_of_backlight() and let the drm_panel
framework code handle it.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index 3d15d9925204..ba05165b6050 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -6,7 +6,6 @@
  * Copyright (C) 2019, Paul Cercueil <paul@crapouillou.net>
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
@@ -63,8 +62,6 @@ struct nt39016 {
 	const struct nt39016_panel_info *panel_info;
 
 	struct gpio_desc *reset_gpio;
-
-	struct backlight_device *backlight;
 };
 
 static inline struct nt39016 *to_nt39016(struct drm_panel *panel)
@@ -180,14 +177,12 @@ static int nt39016_enable(struct drm_panel *drm_panel)
 		return ret;
 	}
 
-	if (panel->backlight) {
+	if (drm_panel->backlight) {
 		/* Wait for the picture to be ready before enabling backlight */
 		msleep(150);
-
-		ret = backlight_enable(panel->backlight);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int nt39016_disable(struct drm_panel *drm_panel)
@@ -195,8 +190,6 @@ static int nt39016_disable(struct drm_panel *drm_panel)
 	struct nt39016 *panel = to_nt39016(drm_panel);
 	int err;
 
-	backlight_disable(panel->backlight);
-
 	err = regmap_write(panel->map, NT39016_REG_SYSTEM,
 			   NT39016_SYSTEM_RESET_N);
 	if (err) {
@@ -292,9 +285,8 @@ static int nt39016_probe(struct spi_device *spi)
 		return PTR_ERR(panel->map);
 	}
 
-	panel->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(panel->backlight)) {
-		err = PTR_ERR(panel->backlight);
+	err = drm_panel_of_backlight(&panel->drm_panel);
+	if (err) {
 		if (err != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get backlight handle");
 		return err;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
