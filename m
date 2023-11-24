Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF77F88C8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 08:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8176B10E118;
	Sat, 25 Nov 2023 07:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F4A010E1B2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:50:27 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id 1D0B124E2EE;
 Fri, 24 Nov 2023 18:44:55 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Nov
 2023 18:44:55 +0800
Received: from yang-virtual-machine.localdomain (113.72.144.198) by
 EXMBX171.cuchost.com (172.16.6.91) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 24 Nov 2023 18:44:53 +0800
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 2/2] gpu: drm: panel: raspberrypi: add new display mode and
 new probing process
Date: Fri, 24 Nov 2023 18:44:51 +0800
Message-ID: <20231124104451.44271-3-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
References: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.144.198]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-Mailman-Approved-At: Sat, 25 Nov 2023 07:24:41 +0000
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
Cc: eric@anholt.net, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 shengyang.chen@starfivetech.com, quic_jesszhan@quicinc.com,
 conor+dt@kernel.org, mripard@kernel.org, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, keith.zhao@starfivetech.com,
 linux-kernel@vger.kernel.org, jack.zhu@starfivetech.com, tzimmermann@suse.de,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The waveshare 7inch touchscreen panel is a kind of raspberrypi
pi panel and it can be drived by panel-raspberrypi-touchscreen.c.
Add new display mode for it.

In order to fit CDNS DSI driver which used by StarFive SoCs like JH7110,
add new probing process for it. The compatible is used to distinguishing.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
---
 .../drm/panel/panel-raspberrypi-touchscreen.c | 99 ++++++++++++++++---
 1 file changed, 88 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 4618c892cdd6..4478f1568205 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -194,6 +194,13 @@ struct rpi_touchscreen {
 	struct i2c_client *i2c;
 };
 
+struct touchscreen_info {
+	const struct drm_display_mode *display_mode;
+	u32 display_mode_size;
+	int (*touchscreen_post_probe)(struct rpi_touchscreen *ts, struct mipi_dsi_host *host,
+				      struct mipi_dsi_device_info *info);
+};
+
 static const struct drm_display_mode rpi_touchscreen_modes[] = {
 	{
 		/* Modeline comes from the Raspberry Pi firmware, with HFP=1
@@ -211,6 +218,20 @@ static const struct drm_display_mode rpi_touchscreen_modes[] = {
 	},
 };
 
+static const struct drm_display_mode ws_touchscreen_modes[] = {
+	{
+		.clock = 29700000 / 1000,
+		.hdisplay = 800,
+		.hsync_start = 800 + 90,
+		.hsync_end = 800 + 90 + 5,
+		.htotal = 800 + 90 + 5 + 5,
+		.vdisplay = 480,
+		.vsync_start = 480 + 60,
+		.vsync_end = 480 + 60 + 5,
+		.vtotal = 480 + 60 + 5 + 5,
+	},
+};
+
 static struct rpi_touchscreen *panel_to_ts(struct drm_panel *panel)
 {
 	return container_of(panel, struct rpi_touchscreen, base);
@@ -319,9 +340,13 @@ static int rpi_touchscreen_get_modes(struct drm_panel *panel,
 {
 	unsigned int i, num = 0;
 	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	const struct touchscreen_info *screen_info;
+
+	screen_info = of_device_get_match_data(panel->dev);
+
+	for (i = 0; i < screen_info->display_mode_size; i++) {
+		const struct drm_display_mode *m = &screen_info->display_mode[i];
 
-	for (i = 0; i < ARRAY_SIZE(rpi_touchscreen_modes); i++) {
-		const struct drm_display_mode *m = &rpi_touchscreen_modes[i];
 		struct drm_display_mode *mode;
 
 		mode = drm_mode_duplicate(connector->dev, m);
@@ -360,12 +385,13 @@ static const struct drm_panel_funcs rpi_touchscreen_funcs = {
 	.get_modes = rpi_touchscreen_get_modes,
 };
 
-static int rpi_touchscreen_probe(struct i2c_client *i2c)
+static int touchscreen_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
 	struct rpi_touchscreen *ts;
 	struct device_node *endpoint, *dsi_host_node;
 	struct mipi_dsi_host *host;
+	const struct touchscreen_info *screen_info;
 	int ver;
 	struct mipi_dsi_device_info info = {
 		.type = RPI_DSI_DRIVER_NAME,
@@ -421,14 +447,29 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c)
 
 	of_node_put(endpoint);
 
-	ts->dsi = mipi_dsi_device_register_full(host, &info);
+	screen_info = of_device_get_match_data(&i2c->dev);
+	if (!screen_info->touchscreen_post_probe)
+		return -ENODEV;
+
+	return screen_info->touchscreen_post_probe(ts, host, &info);
+
+error:
+	of_node_put(endpoint);
+
+	return -ENODEV;
+}
+
+static int rpi_touchscreen_probe(struct rpi_touchscreen *ts, struct mipi_dsi_host *host,
+				 struct mipi_dsi_device_info *info)
+{
+	ts->dsi = mipi_dsi_device_register_full(host, info);
 	if (IS_ERR(ts->dsi)) {
-		dev_err(dev, "DSI device registration failed: %ld\n",
+		dev_err(&ts->i2c->dev, "DSI device registration failed: %ld\n",
 			PTR_ERR(ts->dsi));
 		return PTR_ERR(ts->dsi);
 	}
 
-	drm_panel_init(&ts->base, dev, &rpi_touchscreen_funcs,
+	drm_panel_init(&ts->base, &ts->i2c->dev, &rpi_touchscreen_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
 	/* This appears last, as it's what will unblock the DSI host
@@ -437,10 +478,33 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c)
 	drm_panel_add(&ts->base);
 
 	return 0;
+}
 
-error:
-	of_node_put(endpoint);
-	return -ENODEV;
+static int ws_touchscreen_probe(struct rpi_touchscreen *ts, struct mipi_dsi_host *host,
+				struct mipi_dsi_device_info *info)
+
+{
+	/* in order to match CDNS DSI driver , it is nessary
+	 * to ensure drm_panel_init() & drm_panel_add() before
+	 * mipi_dsi_device_register_full()
+	 *
+	 * after mipi_dsi_device_register_full finished , it will
+	 * run rpi_touchscreen_dsi_probe -> mipi_dsi_attach()
+	 * the CDNS DSI attach helper fun need to find the panel by
+	 * of_drm_find_panel( ). so need add panel before the register.
+	 */
+	drm_panel_init(&ts->base, &ts->i2c->dev, &rpi_touchscreen_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	drm_panel_add(&ts->base);
+
+	ts->dsi = mipi_dsi_device_register_full(host, info);
+	if (IS_ERR(ts->dsi)) {
+		dev_err(&ts->i2c->dev, "DSI device registration failed: %ld\n",
+			PTR_ERR(ts->dsi));
+		return PTR_ERR(ts->dsi);
+	}
+
+	return 0;
 }
 
 static void rpi_touchscreen_remove(struct i2c_client *i2c)
@@ -477,8 +541,21 @@ static struct mipi_dsi_driver rpi_touchscreen_dsi_driver = {
 	.probe = rpi_touchscreen_dsi_probe,
 };
 
+static const struct touchscreen_info rpi_touchscreen_info = {
+	.display_mode = rpi_touchscreen_modes,
+	.display_mode_size = ARRAY_SIZE(rpi_touchscreen_modes),
+	.touchscreen_post_probe = rpi_touchscreen_probe,
+};
+
+static const struct touchscreen_info ws_touchscreen_info = {
+	.display_mode = ws_touchscreen_modes,
+	.display_mode_size = ARRAY_SIZE(ws_touchscreen_modes),
+	.touchscreen_post_probe = ws_touchscreen_probe,
+};
+
 static const struct of_device_id rpi_touchscreen_of_ids[] = {
-	{ .compatible = "raspberrypi,7inch-touchscreen-panel" },
+	{ .compatible = "raspberrypi,7inch-touchscreen-panel", .data = &rpi_touchscreen_info,},
+	{ .compatible = "waveshare,7inch-touchscreen-panel", .data = &ws_touchscreen_info,},
 	{ } /* sentinel */
 };
 MODULE_DEVICE_TABLE(of, rpi_touchscreen_of_ids);
@@ -488,7 +565,7 @@ static struct i2c_driver rpi_touchscreen_driver = {
 		.name = "rpi_touchscreen",
 		.of_match_table = rpi_touchscreen_of_ids,
 	},
-	.probe = rpi_touchscreen_probe,
+	.probe = touchscreen_probe,
 	.remove = rpi_touchscreen_remove,
 };
 
-- 
2.17.1

