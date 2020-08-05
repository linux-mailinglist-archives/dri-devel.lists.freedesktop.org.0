Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BDD23CB7C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 16:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14D96E7DD;
	Wed,  5 Aug 2020 14:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4489A6E7DD
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 14:28:18 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w25so12466849ljo.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ZbOi0D7M/PRwgvshYFcvWxzIu7Wyn7LDMOyV3J5YUc=;
 b=nl252fG29+SirZzVvdBcsuRzWW1QY/lQcBb4AgpxxJDsQrvAkTd/s1iZ+haw7uAumS
 iyt8rLjz6r8ZRSWXGbfZFSjAseTGSUtTnJFBnoPuszCl1Oz0QhGTtkCKewJonq21O74r
 amRBwrEgnA5RfNLWkXS+UazQNay5iBtfosFI3Sk+nP0pGUKPKSOGfG+cF4E9GsC3uDpM
 Y4cI3pNSZPE4PksIUxCopXDxmySPhN+oyLaXxoZ8sEbuF5MnsLly6v/7ShTgCifsZPta
 7DxPzBFMLQjokp/114XDKhvDiwaiTQ9hTsHMR+EftlOL88Q+PhldS57UnBXK8kvWFJl2
 zq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ZbOi0D7M/PRwgvshYFcvWxzIu7Wyn7LDMOyV3J5YUc=;
 b=p3BNB57FX6LH8H7tyI1yWrxXd9//GDlVC0LzcTuCpzcYjqA+pECO6Jt/Z4gnUtuJnU
 K56GV3fa/BAXS1Cqub6QjbxPLA0KiyIKK5+tpPS0L4ZGh7r0vF394mvow9CK3+8lRD+a
 VYmJPKOzyoxC2A3T0JYwxIIqBcbp2z4CUJyBo/zeOrjh6/kZq98AqIUIDOODuDgCnAmo
 mS50zg64/EIySDtz7s/LfU4kI/cVxhe2RgPvs8rViDCfhV2ZLdlh6jPxFfLW8OlCewtU
 IM4hXXZ312UbiED4Cg4NKNlUDZiojZuYbu5KSxa6Qo07SwNsMEcu5iwPBDPVmB1MW+EL
 /b7Q==
X-Gm-Message-State: AOAM533/cG9le4V6Oa7lw80LxIRw8Ivny6zv4LEVBpqmwmy5BmVznE01
 dDW1Up9iJi4oRayWbZfkCHJlxQ==
X-Google-Smtp-Source: ABdhPJwV/NEgR6NieDhGJjgcrqIdQbR1B6RGw3il19Yl4uCOVU9JOpcYqglqXiONsOorB84nCRogBA==
X-Received: by 2002:a2e:5d8:: with SMTP id 207mr1434991ljf.58.1596637696557;
 Wed, 05 Aug 2020 07:28:16 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id t20sm950086ljd.12.2020.08.05.07.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 07:28:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel-notatek-nt35510: Fix enable/disable sequence
Date: Wed,  5 Aug 2020 16:28:08 +0200
Message-Id: <20200805142808.670451-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver was relying on only prepare()/unprepare() to
enable/disable the display.

This does not work because prepare() will be called
before the DSI host/bridge is ready to send any DSI
commands and disable() will be called after the DSI
host/bridge is disabled and thus unable to send any
DSI commands.

Move all DCS command sending to the enable() and
disable() callbacks, as is proper.

The prepare() and unprepare() is now only used to
enable and disable the regulators() and
asserting/de-asserting the reset line so we inline the
regulator and reset code here.

While developing this it was discovered that during
powercycling the device looses its ability to read
the MTP ID:s. We were lucky before as the display
came up with MTP reading enabled, but as this makes
powercycling work, we also need to send two small
sequences that enable the reading of the MTP ID
after powering on the regulators.

This makes it possible to use the user space UI
stack Phosh on the Samsung GT-S7710 as Phosh
enables/disables the display when starting.

Rename the nt35510_power_on() function to
nt35510_power_on_sequence() to reflect the fact
that this is not really about regulators but a
DCS command sequence.

Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 107 +++++++++++-------
 1 file changed, 68 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 4a8fa908a2cf..39113601e944 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -376,6 +376,10 @@ struct nt35510 {
 };
 
 /* Manufacturer command has strictly this byte sequence */
+static const u8 nt35510_mauc_mtp_read_param[] = { 0xAA, 0x55, 0x25, 0x01 };
+static const u8 nt35510_mauc_mtp_read_setting[] = { 0x01, 0x02, 0x00, 0x20,
+						    0x33, 0x13, 0x00, 0x40,
+						    0x00, 0x00, 0x23, 0x02 };
 static const u8 nt35510_mauc_select_page_0[] = { 0x55, 0xAA, 0x52, 0x08, 0x00 };
 static const u8 nt35510_mauc_select_page_1[] = { 0x55, 0xAA, 0x52, 0x08, 0x01 };
 static const u8 nt35510_vgh_on[] = { 0x01 };
@@ -674,29 +678,22 @@ static const struct backlight_ops nt35510_bl_ops = {
 /*
  * This power-on sequence
  */
-static int nt35510_power_on(struct nt35510 *nt)
+static int nt35510_power_on_sequence(struct nt35510 *nt)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(nt->supplies), nt->supplies);
-	if (ret < 0) {
-		dev_err(nt->dev, "unable to enable regulators\n");
+	ret = nt35510_send_long(nt, dsi, MCS_CMD_MTP_READ_PARAM,
+				ARRAY_SIZE(nt35510_mauc_mtp_read_param),
+				nt35510_mauc_mtp_read_param);
+	if (ret)
 		return ret;
-	}
 
-	/* Toggle RESET in accordance with datasheet page 370 */
-	if (nt->reset_gpio) {
-		gpiod_set_value(nt->reset_gpio, 1);
-		/* Active min 10 us according to datasheet, let's say 20 */
-		usleep_range(20, 1000);
-		gpiod_set_value(nt->reset_gpio, 0);
-		/*
-		 * 5 ms during sleep mode, 120 ms during sleep out mode
-		 * according to datasheet, let's use 120-140 ms.
-		 */
-		usleep_range(120000, 140000);
-	}
+	ret = nt35510_send_long(nt, dsi, MCS_CMD_MTP_READ_SETTING,
+				ARRAY_SIZE(nt35510_mauc_mtp_read_setting),
+				nt35510_mauc_mtp_read_setting);
+	if (ret)
+		return ret;
 
 	ret = nt35510_read_id(nt);
 	if (ret)
@@ -758,26 +755,16 @@ static int nt35510_power_on(struct nt35510 *nt)
 	return 0;
 }
 
-static int nt35510_power_off(struct nt35510 *nt)
-{
-	int ret;
-
-	ret = regulator_bulk_disable(ARRAY_SIZE(nt->supplies), nt->supplies);
-	if (ret)
-		return ret;
-
-	if (nt->reset_gpio)
-		gpiod_set_value(nt->reset_gpio, 1);
-
-	return 0;
-}
-
-static int nt35510_unprepare(struct drm_panel *panel)
+static int nt35510_disable(struct drm_panel *panel)
 {
 	struct nt35510 *nt = panel_to_nt35510(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
 	int ret;
 
+	/*
+	 * The final DCS traffic must happen here, at unprepare() the
+	 * DSI host will not accept traffic any more.
+	 */
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret) {
 		DRM_DEV_ERROR(nt->dev, "failed to turn display off (%d)\n",
@@ -797,20 +784,36 @@ static int nt35510_unprepare(struct drm_panel *panel)
 	/* Wait 4 frames, how much is that 5ms in the vendor driver */
 	usleep_range(5000, 10000);
 
-	ret = nt35510_power_off(nt);
+	return 0;
+}
+
+static int nt35510_unprepare(struct drm_panel *panel)
+{
+	struct nt35510 *nt = panel_to_nt35510(panel);
+	int ret;
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(nt->supplies), nt->supplies);
 	if (ret)
 		return ret;
 
+	if (nt->reset_gpio)
+		gpiod_set_value(nt->reset_gpio, 1);
+
+
 	return 0;
 }
 
-static int nt35510_prepare(struct drm_panel *panel)
+static int nt35510_enable(struct drm_panel *panel)
 {
 	struct nt35510 *nt = panel_to_nt35510(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
 	int ret;
 
-	ret = nt35510_power_on(nt);
+	/*
+	 * At this point the DSI host is up and clocked and we can start
+	 * sending DCS commands.
+	 */
+	ret = nt35510_power_on_sequence(nt);
 	if (ret)
 		return ret;
 
@@ -836,6 +839,33 @@ static int nt35510_prepare(struct drm_panel *panel)
 	return 0;
 }
 
+static int nt35510_prepare(struct drm_panel *panel)
+{
+	struct nt35510 *nt = panel_to_nt35510(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(nt->supplies), nt->supplies);
+	if (ret < 0) {
+		dev_err(nt->dev, "unable to enable regulators\n");
+		return ret;
+	}
+
+	/* Toggle RESET in accordance with datasheet page 370 */
+	if (nt->reset_gpio) {
+		gpiod_set_value(nt->reset_gpio, 1);
+		/* Active min 10 us according to datasheet, let's say 20 */
+		usleep_range(20, 1000);
+		gpiod_set_value(nt->reset_gpio, 0);
+		/*
+		 * 5 ms during sleep mode, 120 ms during sleep out mode
+		 * according to datasheet, let's use 120-140 ms.
+		 */
+		usleep_range(120000, 140000);
+	}
+
+	return 0;
+}
+
 static int nt35510_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
@@ -862,6 +892,8 @@ static int nt35510_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs nt35510_drm_funcs = {
+	.enable = nt35510_enable,
+	.disable = nt35510_disable,
 	.unprepare = nt35510_unprepare,
 	.prepare = nt35510_prepare,
 	.get_modes = nt35510_get_modes,
@@ -970,14 +1002,11 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 static int nt35510_remove(struct mipi_dsi_device *dsi)
 {
 	struct nt35510 *nt = mipi_dsi_get_drvdata(dsi);
-	int ret;
 
 	mipi_dsi_detach(dsi);
-	/* Power off */
-	ret = nt35510_power_off(nt);
 	drm_panel_remove(&nt->panel);
 
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
