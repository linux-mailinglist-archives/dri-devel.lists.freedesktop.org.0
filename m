Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC316BC52
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB3F89ECB;
	Tue, 25 Feb 2020 08:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F5D6E9BA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 4B12C293E8A
Received: by earth.universe (Postfix, from userid 1000)
 id 6582B3C0CA6; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 35/56] drm/omap: dsi: convert to drm_panel
Date: Tue, 25 Feb 2020 00:21:05 +0100
Message-Id: <20200224232126.3385250-36-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This converts the DSI module to expect common drm_panel display
drivers instead of dssdev based ones.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 210 +++++++-----------
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 133 +++++++++--
 .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |   1 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |   8 -
 4 files changed, 193 insertions(+), 159 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 30be9e4ab908..803b7dada343 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -6,8 +6,6 @@
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
-/* #define DEBUG */
-
 #include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -20,11 +18,14 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_connector.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_modes.h>
 
+#include <video/display_timing.h>
 #include <video/mipi_display.h>
 #include <video/of_display_timing.h>
-
-#include "../dss/omapdss.h"
+#include <video/videomode.h>
 
 #define DCS_READ_NUM_ERRORS	0x05
 #define DCS_GET_ID1		0xda
@@ -35,11 +36,8 @@
 
 struct panel_drv_data {
 	struct mipi_dsi_device *dsi;
-
-	struct omap_dss_device dssdev;
-	struct omap_dss_device *src;
-
-	struct videomode vm;
+	struct drm_panel panel;
+	struct drm_display_mode mode;
 
 	struct mutex lock;
 
@@ -71,7 +69,11 @@ struct panel_drv_data {
 	bool ulps_enabled;
 };
 
-#define to_panel_data(p) container_of(p, struct panel_drv_data, dssdev)
+
+static inline struct panel_drv_data *panel_to_ddata(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_drv_data, panel);
+}
 
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable);
 
@@ -285,7 +287,6 @@ static void dsicm_hw_reset(struct panel_drv_data *ddata)
 
 static int dsicm_power_on(struct panel_drv_data *ddata)
 {
-	struct omap_dss_device *src = ddata->src;
 	u8 id1, id2, id3;
 	int r;
 
@@ -322,10 +323,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = src->ops->dsi.enable_video_output(src, ddata->dsi->channel);
-	if (r)
-		goto err;
-
 	ddata->enabled = true;
 
 	if (!ddata->intro_printed) {
@@ -345,15 +342,12 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	return r;
 }
 
-static void dsicm_power_off(struct panel_drv_data *ddata)
+static int dsicm_power_off(struct panel_drv_data *ddata)
 {
-	struct omap_dss_device *src = ddata->src;
 	int r;
 
 	ddata->enabled = false;
 
-	src->ops->dsi.disable_video_output(src, ddata->dsi->channel);
-
 	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
 	if (!r)
 		r = dsicm_sleep_in(ddata);
@@ -363,52 +357,25 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 				"error disabling panel, issuing HW reset\n");
 		dsicm_hw_reset(ddata);
 	}
-}
-
-static int dsicm_connect(struct omap_dss_device *src,
-			 struct omap_dss_device *dst)
-{
-	struct panel_drv_data *ddata = to_panel_data(dst);
-
-	ddata->src = src;
-	return 0;
-}
 
-static void dsicm_disconnect(struct omap_dss_device *src,
-			     struct omap_dss_device *dst)
-{
-	struct panel_drv_data *ddata = to_panel_data(dst);
-
-	ddata->src = NULL;
+	return r;
 }
 
-static void dsicm_pre_enable(struct omap_dss_device *dssdev)
+static int dsicm_prepare(struct drm_panel *panel)
 {
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
+	struct panel_drv_data *ddata = panel_to_ddata(panel);
 	int r;
-	struct omap_dss_dsi_config dsi_config = {
-		.vm = &ddata->vm,
-		.hs_clk_min = 150000000,
-		.hs_clk_max = 300000000,
-		.lp_clk_min = 7000000,
-		.lp_clk_max = 10000000,
-	};
 
 	r = regulator_bulk_enable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
-	if (r) {
+	if (r)
 		dev_err(&ddata->dsi->dev, "failed to enable supplies: %d\n", r);
-	}
 
-	r = src->ops->dsi.set_config(src, &dsi_config);
-	if (r) {
-		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
-	}
+	return r;
 }
 
-static void dsicm_enable(struct omap_dss_device *dssdev)
+static int dsicm_enable(struct drm_panel *panel)
 {
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	struct panel_drv_data *ddata = panel_to_ddata(panel);
 	int r;
 
 	mutex_lock(&ddata->lock);
@@ -421,33 +388,39 @@ static void dsicm_enable(struct omap_dss_device *dssdev)
 
 	dsicm_bl_power(ddata, true);
 
-	return;
+	return 0;
 err:
-	dev_dbg(&ddata->dsi->dev, "enable failed (%d)\n", r);
+	dev_err(&ddata->dsi->dev, "enable failed (%d)\n", r);
 	mutex_unlock(&ddata->lock);
+	return r;
+}
+
+static int dsicm_unprepare(struct drm_panel *panel)
+{
+	struct panel_drv_data *ddata = panel_to_ddata(panel);
+	int r;
+
+	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
+	if (r)
+		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
+
+	return r;
 }
 
-static void dsicm_disable(struct omap_dss_device *dssdev)
+static int dsicm_disable(struct drm_panel *panel)
 {
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	struct panel_drv_data *ddata = panel_to_ddata(panel);
+	int r;
 
 	dsicm_bl_power(ddata, false);
 
 	mutex_lock(&ddata->lock);
 
-	dsicm_power_off(ddata);
+	r = dsicm_power_off(ddata);
 
 	mutex_unlock(&ddata->lock);
-}
-
-static void dsicm_post_disable(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	int r;
 
-	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
-	if (r)
-		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
+	return r;
 }
 
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
@@ -466,50 +439,37 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 	return r;
 }
 
-static int dsicm_get_modes(struct omap_dss_device *dssdev,
+static int dsicm_get_modes(struct drm_panel *panel,
 			   struct drm_connector *connector)
 {
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	struct panel_drv_data *ddata = panel_to_ddata(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &ddata->mode);
+	if (!mode) {
+		dev_err(&ddata->dsi->dev, "failed to add mode %ux%ux@%u\n",
+			ddata->mode.hdisplay, ddata->mode.vdisplay,
+			ddata->mode.vrefresh);
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
 	connector->display_info.width_mm = ddata->width_mm;
 	connector->display_info.height_mm = ddata->height_mm;
 
-	return omapdss_display_get_modes(connector, &ddata->vm);
-}
+	drm_mode_probed_add(connector, mode);
 
-static int dsicm_check_timings(struct omap_dss_device *dssdev,
-			       struct drm_display_mode *mode)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	int ret = 0;
-
-	if (mode->hdisplay != ddata->vm.hactive)
-		ret = -EINVAL;
-
-	if (mode->vdisplay != ddata->vm.vactive)
-		ret = -EINVAL;
-
-	if (ret) {
-		dev_warn(dssdev->dev, "wrong resolution: %d x %d",
-			 mode->hdisplay, mode->vdisplay);
-		dev_warn(dssdev->dev, "panel resolution: %d x %d",
-			 ddata->vm.hactive, ddata->vm.vactive);
-	}
-
-	return ret;
+	return 1;
 }
 
-static const struct omap_dss_device_ops dsicm_ops = {
-	.connect	= dsicm_connect,
-	.disconnect	= dsicm_disconnect,
-
-	.pre_enable	= dsicm_pre_enable,
-	.enable		= dsicm_enable,
-	.disable	= dsicm_disable,
-	.post_disable	= dsicm_post_disable,
-
-	.get_modes	= dsicm_get_modes,
-	.check_timings	= dsicm_check_timings,
+static const struct drm_panel_funcs dsicm_panel_funcs = {
+	.unprepare = dsicm_unprepare,
+	.disable = dsicm_disable,
+	.prepare = dsicm_prepare,
+	.enable = dsicm_enable,
+	.get_modes = dsicm_get_modes,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
@@ -518,8 +478,12 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 	struct device_node *backlight;
 	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
 	struct display_timing timing;
+	struct videomode vm;
 	int err;
 
+	vm.hactive = 864;
+	vm.vactive = 480;
+
 	ddata->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ddata->reset_gpio)) {
 		err = PTR_ERR(ddata->reset_gpio);
@@ -529,15 +493,16 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 
 	err = of_get_display_timing(node, "panel-timing", &timing);
 	if (!err) {
-		videomode_from_timing(&timing, &ddata->vm);
-		if (!ddata->vm.pixelclock)
-			ddata->vm.pixelclock =
-				ddata->vm.hactive * ddata->vm.vactive * 60;
+		videomode_from_timing(&timing, &vm);
 	} else {
 		dev_warn(&dsi->dev,
 			 "failed to get video timing, using defaults\n");
 	}
 
+	if (!vm.pixelclock)
+		vm.pixelclock = vm.hactive * vm.vactive * 60;
+	drm_display_mode_from_videomode(&vm, &ddata->mode);
+
 	ddata->width_mm = 0;
 	of_property_read_u32(node, "width-mm", &ddata->width_mm);
 
@@ -573,7 +538,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	struct panel_drv_data *ddata;
 	struct backlight_device *bldev = NULL;
 	struct device *dev = &dsi->dev;
-	struct omap_dss_device *dssdev;
 	int r;
 
 	dev_dbg(dev, "probe\n");
@@ -585,30 +549,17 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, ddata);
 	ddata->dsi = dsi;
 
-	ddata->vm.hactive = 864;
-	ddata->vm.vactive = 480;
-	ddata->vm.pixelclock = 864 * 480 * 60;
-
 	r = dsicm_probe_of(dsi);
 	if (r)
 		return r;
 
-	dssdev = &ddata->dssdev;
-	dssdev->dev = dev;
-	dssdev->ops = &dsicm_ops;
-	dssdev->type = OMAP_DISPLAY_TYPE_DSI;
-	dssdev->display = true;
-	dssdev->owner = THIS_MODULE;
-	dssdev->of_port = 0;
-	dssdev->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
-
-	omapdss_display_init(dssdev);
-	omapdss_device_register(dssdev);
-
 	mutex_init(&ddata->lock);
 
 	dsicm_hw_reset(ddata);
 
+	drm_panel_init(&ddata->panel, dev, &dsicm_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
 	if (ddata->use_dsi_backlight) {
 		struct backlight_properties props = { 0 };
 		props.max_brightness = 255;
@@ -640,6 +591,10 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	if (ddata->ulps_enabled)
 		dsi->mode_flags |= MIPI_DSI_MODE_ULPS_IDLE;
 
+	r = drm_panel_add(&ddata->panel);
+	if (r < 0)
+		goto err_panel_add;
+
 	r = mipi_dsi_attach(dsi);
 	if (r < 0)
 		goto err_dsi_attach;
@@ -647,6 +602,8 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	return 0;
 
 err_dsi_attach:
+	drm_panel_remove(&ddata->panel);
+err_panel_add:
 	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
 err_bl:
 	if (ddata->extbldev)
@@ -658,15 +615,12 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
 {
 	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
-	struct omap_dss_device *dssdev = &ddata->dssdev;
 
 	dev_dbg(&dsi->dev, "remove\n");
 
 	mipi_dsi_detach(dsi);
 
-	omapdss_device_unregister(dssdev);
-
-	omapdss_device_disconnect(ddata->src, dssdev);
+	drm_panel_remove(&ddata->panel);
 
 	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
 
@@ -680,7 +634,7 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id dsicm_of_match[] = {
-	{ .compatible = "omapdss,panel-dsi-cm", },
+	{ .compatible = "panel-dsi-cm", },
 	{},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 42f995da21a5..a399d6857c0d 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -37,6 +37,7 @@
 
 #include <video/mipi_display.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
 
 #include "omapdss.h"
 #include "dss.h"
@@ -220,6 +221,8 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int channel);
 static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
 				       const struct mipi_dsi_msg *msg);
 
+static void dsi_display_disable(struct omap_dss_device *dssdev);
+
 /* DSI PLL HSDIV indices */
 #define HSDIV_DISPC	0
 #define HSDIV_DSI	1
@@ -386,6 +389,7 @@ struct dsi_data {
 	bool te_enabled;
 	bool ulps_enabled;
 	bool ulps_auto_idle;
+	bool video_enabled;
 
 	struct delayed_work ulps_work;
 
@@ -426,6 +430,8 @@ struct dsi_data {
 
 	unsigned int scp_clk_refcount;
 
+	struct omap_dss_dsi_config config;
+
 	struct dss_lcd_mgr_config mgr_config;
 	struct videomode vm;
 	enum mipi_dsi_pixel_format pix_fmt;
@@ -3629,7 +3635,7 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
 	return 0;
 }
 
-static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
+static void dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
@@ -3638,8 +3644,10 @@ static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
 	int r;
 
 	r = dsi_display_init_dispc(dsi);
-	if (r)
-		return r;
+	if (r) {
+		dev_err(dsi->dev, "failed to init dispc!\n");
+		return;
+	}
 
 	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
 		switch (dsi->pix_fmt) {
@@ -3679,7 +3687,7 @@ static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
 	if (r)
 		goto err_mgr_enable;
 
-	return 0;
+	return;
 
 err_mgr_enable:
 	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
@@ -3688,7 +3696,8 @@ static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
 	}
 err_pix_fmt:
 	dsi_display_uninit_dispc(dsi);
-	return r;
+	dev_err(dsi->dev, "failed to enable DSI encoder!\n");
+	return;
 }
 
 static void dsi_disable_video_output(struct omap_dss_device *dssdev, int channel)
@@ -3711,6 +3720,25 @@ static void dsi_disable_video_output(struct omap_dss_device *dssdev, int channel
 	dsi_display_uninit_dispc(dsi);
 }
 
+static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+	int i;
+
+	dsi_bus_lock(dsi);
+	dsi->video_enabled = false;
+
+	for (i = 0; i < 3; i++) {
+		if (!dsi->vc[i].dest)
+			continue;
+		dsi_disable_video_output(dssdev, i);
+	}
+
+	dsi_display_disable(dssdev);
+
+	dsi_bus_unlock(dsi);
+}
+
 static void dsi_update_screen_dispc(struct dsi_data *dsi)
 {
 	unsigned int bytespp;
@@ -3904,6 +3932,11 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
 
 	dsi_bus_lock(dsi);
 
+	if (!dsi->video_enabled) {
+		r = -EIO;
+		goto err;
+	}
+
 	if (!dsi->vc[channel].dest) {
 		r = -ENODEV;
 		goto err;
@@ -3949,7 +3982,7 @@ static int dsi_update_all(struct omap_dss_device *dssdev)
 
 	for (i = 0; i < 4; i++) {
 		r = dsi_update_channel(dssdev, i);
-		if (r != -ENODEV)
+		if (r && r != -ENODEV)
 			return r;
 	}
 
@@ -4172,8 +4205,30 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	DSSDBG("dsi_display_enable\n");
-	dsi_bus_lock(dsi);
+	WARN_ON(!dsi_bus_is_locked(dsi));
+
 	dsi_display_ulps_enable(dsi);
+}
+
+static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+	int i;
+
+	dsi_bus_lock(dsi);
+
+	dsi_display_enable(dssdev);
+
+	for (i = 0; i < 3; i++) {
+		if (!dsi->vc[i].dest)
+			continue;
+		dsi_enable_video_output(dssdev, i);
+	}
+
+	dsi->video_enabled = true;
+
+	dsi_set_ulps_auto(dsi, true);
+
 	dsi_bus_unlock(dsi);
 }
 
@@ -4199,10 +4254,10 @@ static void dsi_display_ulps_disable(struct dsi_data *dsi,
 static void dsi_display_disable(struct omap_dss_device *dssdev)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
+	WARN_ON(!dsi_bus_is_locked(dsi));
 	DSSDBG("dsi_display_disable\n");
-	dsi_bus_lock(dsi);
+
 	dsi_display_ulps_disable(dsi, true, false);
-	dsi_bus_unlock(dsi);
 }
 
 static int dsi_enable_te(struct dsi_data *dsi, bool enable)
@@ -4740,14 +4795,18 @@ static bool dsi_is_video_mode(struct omap_dss_device *dssdev)
 }
 
 static int dsi_set_config(struct omap_dss_device *dssdev,
-		const struct omap_dss_dsi_config *config)
+		const struct drm_display_mode *mode)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	struct dsi_clk_calc_ctx ctx;
-	struct omap_dss_dsi_config cfg = *config;
+	struct videomode vm;
+	struct omap_dss_dsi_config cfg = dsi->config;
 	bool ok;
 	int r;
 
+	drm_display_mode_to_videomode(mode, &vm);
+	cfg.vm = &vm;
+
 	mutex_lock(&dsi->lock);
 
 	cfg.mode = dsi->mode;
@@ -4910,9 +4969,15 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 	int r;
 
 	dsi_bus_lock(dsi);
-	dsi_set_ulps_auto(dsi, false);
-	r = _omap_dsi_host_transfer(dsi, msg);
-	dsi_set_ulps_auto(dsi, true);
+
+	if (dsi->video_enabled) {
+		dsi_set_ulps_auto(dsi, false);
+		r = _omap_dsi_host_transfer(dsi, msg);
+		dsi_set_ulps_auto(dsi, true);
+	} else {
+		r = -EIO;
+	}
+
 	dsi_bus_unlock(dsi);
 
 	return r;
@@ -4933,6 +4998,23 @@ static int dsi_get_clocks(struct dsi_data *dsi)
 	return 0;
 }
 
+static void dsi_set_timings(struct omap_dss_device *dssdev,
+			    const struct drm_display_mode *mode)
+{
+	DSSDBG("dsi_set_timings\n");
+	dsi_set_config(dssdev, mode);
+}
+
+static int dsi_check_timings(struct omap_dss_device *dssdev,
+			     struct drm_display_mode *mode)
+{
+	DSSDBG("dsi_check_timings\n");
+
+	/* TODO */
+
+	return 0;
+}
+
 static int dsi_connect(struct omap_dss_device *src,
 		       struct omap_dss_device *dst)
 {
@@ -4948,15 +5030,13 @@ static void dsi_disconnect(struct omap_dss_device *src,
 static const struct omap_dss_device_ops dsi_ops = {
 	.connect = dsi_connect,
 	.disconnect = dsi_disconnect,
-	.enable = dsi_display_enable,
-	.disable = dsi_display_disable,
-
-	.dsi = {
-		.set_config = dsi_set_config,
+	.enable = dsi_enable_video_outputs,
+	.disable = dsi_disable_video_outputs,
 
-		.enable_video_output = dsi_enable_video_output,
-		.disable_video_output = dsi_disable_video_output,
+	.check_timings = dsi_check_timings,
+	.set_timings = dsi_set_timings,
 
+	.dsi = {
 		.update = dsi_update_all,
 		.is_video_mode = dsi_is_video_mode,
 	},
@@ -5046,6 +5126,7 @@ int omap_dsi_host_attach(struct mipi_dsi_host *host,
 {
 	struct dsi_data *dsi = host_to_omap(host);
 	unsigned int channel = client->channel;
+	struct drm_panel *panel;
 	int r;
 
 	if (channel > 3)
@@ -5058,6 +5139,10 @@ int omap_dsi_host_attach(struct mipi_dsi_host *host,
 
 	dsi_bus_lock(dsi);
 
+	panel = of_drm_find_panel(client->dev.of_node);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
+
 	atomic_set(&dsi->do_ext_te_update, 0);
 
 	if (client->mode_flags & MIPI_DSI_MODE_VIDEO) {
@@ -5078,8 +5163,12 @@ int omap_dsi_host_attach(struct mipi_dsi_host *host,
 	INIT_DEFERRABLE_WORK(&dsi->ulps_work,
 			     omap_dsi_ulps_work_callback);
 
+	dsi->config.hs_clk_min = 150000000; // TODO: get from client?
+	dsi->config.hs_clk_max = client->hs_rate;
+	dsi->config.lp_clk_min = 7000000; // TODO: get from client?
+	dsi->config.lp_clk_max = client->lp_rate;
+
 	dsi->ulps_auto_idle = !!(client->mode_flags & MIPI_DSI_MODE_ULPS_IDLE);
-	dsi_set_ulps_auto(dsi, true);
 
 	dsi_bus_unlock(dsi);
 	return 0;
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
index 00372f4ce711..c849927ff185 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
@@ -174,7 +174,6 @@ static const struct of_device_id omapdss_of_match[] __initconst = {
 };
 
 static const struct of_device_id omapdss_of_fixups_whitelist[] __initconst = {
-	{ .compatible = "panel-dsi-cm" },
 	{},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 430e915d2759..10e6ae666dfa 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -277,14 +277,6 @@ struct omap_dss_writeback_info {
 struct omapdss_dsi_ops {
 	int (*update)(struct omap_dss_device *dssdev);
 	bool (*is_video_mode)(struct omap_dss_device *dssdev);
-
-	/* legacy API used by omapdss panels */
-	int (*set_config)(struct omap_dss_device *dssdev,
-			const struct omap_dss_dsi_config *cfg);
-
-	int (*enable_video_output)(struct omap_dss_device *dssdev, int channel);
-	void (*disable_video_output)(struct omap_dss_device *dssdev,
-			int channel);
 };
 
 struct omap_dss_device_ops {
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
