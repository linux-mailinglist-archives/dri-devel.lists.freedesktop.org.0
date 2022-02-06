Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04564AB21A
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 21:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D89D10F65A;
	Sun,  6 Feb 2022 20:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ip-94-112-206-30.net.upcbroadband.cz [94.112.206.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC2D10E214
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 20:30:05 +0000 (UTC)
Received: from newone.lan (_gateway [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 5C25020066;
 Sun,  6 Feb 2022 21:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1644179404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CmSr+b8yPi0neB+FC4Vok562rxSdTTD+D25LpUwAGHM=;
 b=Wc1BJ+iSUuBUaB/PmFU5D8MWGqRhy9jzutfFJ6trXcoLY9z1Dl3dHUufy/cvp/wIuu/g24
 xoQgFdnyDG4BJaaH9H1CfxfmBWKzHH+AG4EUFQBdCRKOne4NJ/NGLLcAUw8HBXCcrekWi5
 5N63bz38wk6+NC0dJvjMncnx9HBTre8=
From: David Heidelberg <david@ixit.cz>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/panel: JDI LT070ME05000 simplify with dev_err_probe()
Date: Sun,  6 Feb 2022 21:30:03 +0100
Message-Id: <20220206203003.465356-1-david@ixit.cz>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org, ~okias/devicetree@lists.sr.ht,
 David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the dev_err_probe() helper to simplify error handling during probe.
This also handle scenario, when EDEFER is returned and useless error is printed.

Fixes error:
panel-jdi-lt070me05000 4700000.dsi.0: cannot get enable-gpio -517

Signed-off-by: David Heidelberg <david@ixit.cz>
---
v2:
 - original v1 patch name "drm/panel: JDI LT070ME05000 remove useless warning"
 - use dev_err_probe function
---
 .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 36 ++++++++-----------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index ea0e7221e706..7069201e6cac 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -400,38 +400,30 @@ static int jdi_panel_add(struct jdi_panel *jdi)
 
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(jdi->supplies),
 				      jdi->supplies);
-	if (ret < 0) {
-		dev_err(dev, "failed to init regulator, ret=%d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to init regulator, ret=%d\n", ret);
 
 	jdi->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(jdi->enable_gpio)) {
-		ret = PTR_ERR(jdi->enable_gpio);
-		dev_err(dev, "cannot get enable-gpio %d\n", ret);
-		return ret;
+		return dev_err_probe(dev, PTR_ERR(jdi->enable_gpio),
+				     "cannot get enable-gpio %d\n", ret);
 	}
 
 	jdi->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(jdi->reset_gpio)) {
-		ret = PTR_ERR(jdi->reset_gpio);
-		dev_err(dev, "cannot get reset-gpios %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(jdi->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(jdi->reset_gpio),
+				     "cannot get reset-gpios %d\n", ret);
 
 	jdi->dcdc_en_gpio = devm_gpiod_get(dev, "dcdc-en", GPIOD_OUT_LOW);
-	if (IS_ERR(jdi->dcdc_en_gpio)) {
-		ret = PTR_ERR(jdi->dcdc_en_gpio);
-		dev_err(dev, "cannot get dcdc-en-gpio %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(jdi->dcdc_en_gpio))
+		return dev_err_probe(dev, PTR_ERR(jdi->dcdc_en_gpio),
+				     "cannot get dcdc-en-gpio %d\n", ret);
 
 	jdi->backlight = drm_panel_create_dsi_backlight(jdi->dsi);
-	if (IS_ERR(jdi->backlight)) {
-		ret = PTR_ERR(jdi->backlight);
-		dev_err(dev, "failed to register backlight %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(jdi->backlight))
+		return dev_err_probe(dev, PTR_ERR(jdi->backlight),
+				     "failed to register backlight %d\n", ret);
 
 	drm_panel_init(&jdi->base, &jdi->dsi->dev, &jdi_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
-- 
2.34.1

