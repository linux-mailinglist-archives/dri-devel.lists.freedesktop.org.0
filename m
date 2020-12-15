Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6852DAB57
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFB96E283;
	Tue, 15 Dec 2020 10:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C9B6E1E9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:48:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAmEPJ010872
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029294;
 bh=SZS32TSRcoqvkahCzPaayn8py5v1mgmevnrJMwMZjHU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ECtL0oh1afv1ktgVpmqwpjkFSn4kxDNwn1g8BtweMEIWoDfX48KrseWO/P705B8C0
 KiuC1xAAIKi+gfQO2dNmVmaJKUXQu9GwESOzK1fjKsD7UQMeDL1huHUO5KZ9bMy6Hx
 bPdkVogxQ9e1pSz9RpU2+4OA0UZDWaBEdmUIo7go=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAmEVK102909
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:48:14 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:48:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:48:14 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaw046467;
 Tue, 15 Dec 2020 04:48:13 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 72/84] drm/panel: panel-dsi-cm: add panel database to driver
Date: Tue, 15 Dec 2020 12:46:45 +0200
Message-ID: <20201215104657.802264-73-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215104657.802264-1-tomi.valkeinen@ti.com>
References: <20201215104657.802264-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a panel database to the driver instead of reading propertes from DT
data. This is similar to panel-simple, and I believe it's more future
safe way to handle the panels.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 104 +++++++++++++++++----------
 1 file changed, 66 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index f5240fd82459..c549329dc4b9 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -21,10 +21,7 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
-#include <video/display_timing.h>
 #include <video/mipi_display.h>
-#include <video/of_display_timing.h>
-#include <video/videomode.h>
 
 #define DCS_GET_ID1		0xda
 #define DCS_GET_ID2		0xdb
@@ -32,6 +29,18 @@
 
 #define DCS_REGULATOR_SUPPLY_NUM 2
 
+static const struct of_device_id dsicm_of_match[];
+
+struct dsic_panel_data {
+	u32 xres;
+	u32 yres;
+	u32 refresh;
+	u32 width_mm;
+	u32 height_mm;
+	u32 max_hs_rate;
+	u32 max_lp_rate;
+};
+
 struct panel_drv_data {
 	struct mipi_dsi_device *dsi;
 	struct drm_panel panel;
@@ -47,16 +56,14 @@ struct panel_drv_data {
 					 */
 	unsigned long	hw_guard_wait;	/* max guard time in jiffies */
 
-	/* panel HW configuration from DT or platform data */
+	const struct dsic_panel_data *panel_data;
+
 	struct gpio_desc *reset_gpio;
 
 	struct regulator_bulk_data supplies[DCS_REGULATOR_SUPPLY_NUM];
 
 	bool use_dsi_backlight;
 
-	int width_mm;
-	int height_mm;
-
 	/* runtime variables */
 	bool enabled;
 
@@ -450,11 +457,8 @@ static int dsicm_get_modes(struct drm_panel *panel,
 		return -ENOMEM;
 	}
 
-	drm_mode_set_name(mode);
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-
-	connector->display_info.width_mm = ddata->width_mm;
-	connector->display_info.height_mm = ddata->height_mm;
+	connector->display_info.width_mm = ddata->panel_data->width_mm;
+	connector->display_info.height_mm = ddata->panel_data->height_mm;
 
 	drm_mode_probed_add(connector, mode);
 
@@ -471,15 +475,10 @@ static const struct drm_panel_funcs dsicm_panel_funcs = {
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 {
-	struct device_node *node = dsi->dev.of_node;
 	struct backlight_device *backlight;
 	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
-	struct display_timing timing;
-	struct videomode vm = {
-		.hactive = 864,
-		.vactive = 480,
-	};
 	int err;
+	struct drm_display_mode *mode = &ddata->mode;
 
 	ddata->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ddata->reset_gpio)) {
@@ -488,23 +487,16 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 		return err;
 	}
 
-	err = of_get_display_timing(node, "panel-timing", &timing);
-	if (!err) {
-		videomode_from_timing(&timing, &vm);
-	} else {
-		dev_warn(&dsi->dev,
-			 "failed to get video timing, using defaults\n");
-	}
-
-	if (!vm.pixelclock)
-		vm.pixelclock = vm.hactive * vm.vactive * 60;
-	drm_display_mode_from_videomode(&vm, &ddata->mode);
-
-	ddata->width_mm = 0;
-	of_property_read_u32(node, "width-mm", &ddata->width_mm);
-
-	ddata->height_mm = 0;
-	of_property_read_u32(node, "height-mm", &ddata->height_mm);
+	mode->hdisplay = mode->hsync_start = mode->hsync_end = mode->htotal =
+		ddata->panel_data->xres;
+	mode->vdisplay = mode->vsync_start = mode->vsync_end = mode->vtotal =
+		ddata->panel_data->yres;
+	mode->clock = ddata->panel_data->xres * ddata->panel_data->yres *
+		ddata->panel_data->refresh / 1000;
+	mode->width_mm = ddata->panel_data->width_mm;
+	mode->height_mm = ddata->panel_data->height_mm;
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(mode);
 
 	ddata->supplies[0].supply = "vpnl";
 	ddata->supplies[1].supply = "vddi";
@@ -542,6 +534,10 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, ddata);
 	ddata->dsi = dsi;
 
+	ddata->panel_data = of_device_get_match_data(dev);
+	if (!ddata->panel_data)
+		return -ENODEV;
+
 	r = dsicm_probe_of(dsi);
 	if (r)
 		return r;
@@ -578,8 +574,8 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
 			  MIPI_DSI_MODE_EOT_PACKET;
-	dsi->hs_rate = 300000000;
-	dsi->lp_rate = 10000000;
+	dsi->hs_rate = ddata->panel_data->max_hs_rate;
+	dsi->lp_rate = ddata->panel_data->max_lp_rate;
 
 	drm_panel_add(&ddata->panel);
 
@@ -617,8 +613,40 @@ static int dsicm_remove(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
+static const struct dsic_panel_data taal_data = {
+	.xres = 864,
+	.yres = 480,
+	.refresh = 60,
+	.width_mm = 0,
+	.height_mm = 0,
+	.max_hs_rate = 300000000,
+	.max_lp_rate = 10000000,
+};
+
+static const struct dsic_panel_data himalaya_data = {
+	.xres = 480,
+	.yres = 864,
+	.refresh = 60,
+	.width_mm = 49,
+	.height_mm = 88,
+	.max_hs_rate = 300000000,
+	.max_lp_rate = 10000000,
+};
+
+static const struct dsic_panel_data droid4_data = {
+	.xres = 540,
+	.yres = 960,
+	.refresh = 60,
+	.width_mm = 50,
+	.height_mm = 89,
+	.max_hs_rate = 300000000,
+	.max_lp_rate = 10000000,
+};
+
 static const struct of_device_id dsicm_of_match[] = {
-	{ .compatible = "panel-dsi-cm", },
+	{ .compatible = "tpo,taal", .data = &taal_data },
+	{ .compatible = "nokia,himalaya", &himalaya_data },
+	{ .compatible = "motorola,droid4-panel", &droid4_data },
 	{},
 };
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
