Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC33C9BD2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 11:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C2D6E7D2;
	Thu, 15 Jul 2021 09:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B966E7D2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 09:30:16 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 8so8695834lfp.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 02:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/4J+UA5scvj7b6HcOQ6RHEexwkkfUiUgGl4lp097QQc=;
 b=TSeH7kAJF1Q/qDnooiYkoZ3NVvVZyVTurC3pcf+htAAtfIS/gptUC4mFhC3F9fqGMF
 UGX9D8jQjDDUtegztKa/x3fSLvulL329WF6r5IW9YJ9U1U3TcQcGT84CkiriRqUzVXEq
 h04muPAvNpUJgr/I2tmeD5L2sv2TYdczwr/MCNFIkJGFn9v1HmWQrTz8CFbL76lPByci
 n0NMrnY6uzKKQXlKSkbeyFgFSFz/elGvuY7ucPPJOypYYYDTx1F56chl2QtXlVZ/RLl/
 OfpfwfGAq9EDIuVyVdQF4mYmhUJ/VtBvhkooL9xKs04V3rt8kQokzRv/olQLgsYPO8H5
 OHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/4J+UA5scvj7b6HcOQ6RHEexwkkfUiUgGl4lp097QQc=;
 b=J4aT0J7Cq3CPUZ5LngE940HIVMWC7IskDJQd4+4uxDThZ3b4ybYRelHQ+BYSRKzj35
 SEfwOZET0HqFVf5GCozBPuO36DpylyLmthub5APCA1v4uE4Ye+pn6RQAoeJ4UVWMlCOH
 G7AjWUCJoDA7nAeyfpS1GtQi3+x85yh9xLUaRbzMyim/uMbJYNkUpExAp4k1Bc/NWqT3
 2esmwaGCVsIq+yI5729pYsVC/IpOJyZGLFVhn8KPLUMCKpN0fUWnYSNcryGT6CFnBBDj
 o4TlzTmV7T2+vfwZjc0+c6lteL9zd8gw5xqUChh1AAROB0NoRQlvTYntr60rKq0nb/XT
 ptUg==
X-Gm-Message-State: AOAM530FBIWjzrMQYRhFkO2XvXzo573+iUdU/Y8z4EgCaMM9LEUocFSo
 npjNrInu9AFLXbq/vbPLZRQ8Gg==
X-Google-Smtp-Source: ABdhPJwVRZS6buSz0OkBe4ThzqBPQJM7r+TRR3vIccvkLLxeRXS8Le3GVRZRJP4ot4BAsoqbAT2AwQ==
X-Received: by 2002:a19:7512:: with SMTP id y18mr2729462lfe.533.1626341414627; 
 Thu, 15 Jul 2021 02:30:14 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id n5sm367343lft.139.2021.07.15.02.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 02:30:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel-sony-acx424akp: Modernize backlight handling
Date: Thu, 15 Jul 2021 11:28:08 +0200
Message-Id: <20210715092808.1100106-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This converts the internal backlight in the Sony ACX424AKP
driver to do it the canonical way:

- Assign the panel->backlight during probe.
- Let the panel framework handle the backlight.
- Make the backlight .set_brightness() turn the backlight
  off completely if blank.
- Fix some dev_err_probe() use cases along the way.

Tested on the U8500 HREF520 reference design.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-sony-acx424akp.c | 84 +++++++-------------
 1 file changed, 28 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
index 95659a4d15e9..163f0e0cee1c 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
@@ -40,7 +40,6 @@
 struct acx424akp {
 	struct drm_panel panel;
 	struct device *dev;
-	struct backlight_device *bl;
 	struct regulator *supply;
 	struct gpio_desc *reset_gpio;
 	bool video_mode;
@@ -102,6 +101,20 @@ static int acx424akp_set_brightness(struct backlight_device *bl)
 	u8 par;
 	int ret;
 
+
+	if (backlight_is_blank(bl)) {
+		/* Disable backlight */
+		par = 0x00;
+		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+					 &par, 1);
+		if (ret) {
+			dev_err(acx->dev, "failed to disable display backlight (%d)\n", ret);
+			return ret;
+		}
+		return 0;
+	}
+
+
 	/* Calculate the PWM duty cycle in n/256's */
 	pwm_ratio = max(((duty_ns * 256) / period_ns) - 1, 1);
 	pwm_div = max(1,
@@ -172,6 +185,12 @@ static const struct backlight_ops acx424akp_bl_ops = {
 	.update_status = acx424akp_set_brightness,
 };
 
+static const struct backlight_properties acx424akp_bl_props = {
+	.type = BACKLIGHT_PLATFORM,
+	.brightness = 512,
+	.max_brightness = 1023,
+};
+
 static int acx424akp_read_id(struct acx424akp *acx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(acx->dev);
@@ -310,8 +329,6 @@ static int acx424akp_prepare(struct drm_panel *panel)
 		}
 	}
 
-	acx->bl->props.power = FB_BLANK_NORMAL;
-
 	return 0;
 
 err_power_off:
@@ -323,18 +340,8 @@ static int acx424akp_unprepare(struct drm_panel *panel)
 {
 	struct acx424akp *acx = panel_to_acx424akp(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(acx->dev);
-	u8 par;
 	int ret;
 
-	/* Disable backlight */
-	par = 0x00;
-	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
-				 &par, 1);
-	if (ret) {
-		dev_err(acx->dev, "failed to disable display backlight (%d)\n", ret);
-		return ret;
-	}
-
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret) {
 		dev_err(acx->dev, "failed to turn display off (%d)\n", ret);
@@ -350,36 +357,10 @@ static int acx424akp_unprepare(struct drm_panel *panel)
 	msleep(85);
 
 	acx424akp_power_off(acx);
-	acx->bl->props.power = FB_BLANK_POWERDOWN;
-
-	return 0;
-}
-
-static int acx424akp_enable(struct drm_panel *panel)
-{
-	struct acx424akp *acx = panel_to_acx424akp(panel);
-
-	/*
-	 * The backlight is on as long as the display is on
-	 * so no use to call backlight_enable() here.
-	 */
-	acx->bl->props.power = FB_BLANK_UNBLANK;
 
 	return 0;
 }
 
-static int acx424akp_disable(struct drm_panel *panel)
-{
-	struct acx424akp *acx = panel_to_acx424akp(panel);
-
-	/*
-	 * The backlight is on as long as the display is on
-	 * so no use to call backlight_disable() here.
-	 */
-	acx->bl->props.power = FB_BLANK_NORMAL;
-
-	return 0;
-}
 
 static int acx424akp_get_modes(struct drm_panel *panel,
 			       struct drm_connector *connector)
@@ -409,10 +390,8 @@ static int acx424akp_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs acx424akp_drm_funcs = {
-	.disable = acx424akp_disable,
 	.unprepare = acx424akp_unprepare,
 	.prepare = acx424akp_prepare,
-	.enable = acx424akp_enable,
 	.get_modes = acx424akp_get_modes,
 };
 
@@ -458,25 +437,18 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
 	/* This asserts RESET by default */
 	acx->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						  GPIOD_OUT_HIGH);
-	if (IS_ERR(acx->reset_gpio)) {
-		ret = PTR_ERR(acx->reset_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to request GPIO (%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(acx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(acx->reset_gpio),
+				     "failed to request GPIO\n");
 
 	drm_panel_init(&acx->panel, dev, &acx424akp_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
-	acx->bl = devm_backlight_device_register(dev, "acx424akp", dev, acx,
-						 &acx424akp_bl_ops, NULL);
-	if (IS_ERR(acx->bl)) {
-		dev_err(dev, "failed to register backlight device\n");
-		return PTR_ERR(acx->bl);
-	}
-	acx->bl->props.max_brightness = 1023;
-	acx->bl->props.brightness = 512;
-	acx->bl->props.power = FB_BLANK_POWERDOWN;
+	acx->panel.backlight = devm_backlight_device_register(dev, "acx424akp", dev, acx,
+					&acx424akp_bl_ops, &acx424akp_bl_props);
+	if (IS_ERR(acx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(acx->panel.backlight),
+				     "failed to register backlight device\n");
 
 	drm_panel_add(&acx->panel);
 
-- 
2.31.1

