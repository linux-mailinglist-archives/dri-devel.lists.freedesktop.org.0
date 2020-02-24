Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7916BC62
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236EA6EA39;
	Tue, 25 Feb 2020 08:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BF56E9BD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 386F92935D0
Received: by earth.universe (Postfix, from userid 1000)
 id 5817D3C0CA4; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 33/56] drm/omap: dsi: Reverse direction of the DSS device
 enable/disable operations
Date: Tue, 25 Feb 2020 00:21:03 +0100
Message-Id: <20200224232126.3385250-34-sebastian.reichel@collabora.com>
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

Complete the direction reversal of the DSS device enable/disable
operations started by 19b4200d8f4b ("drm/omap: Reverse direction
of the DSS device enable/disable operations").

This effectively drops the requirement of calling DSS specific
code from the DSI panel driver moving it a bit further to a
standard drm_panel driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 75 ++++++++++---------
 drivers/gpu/drm/omapdrm/omap_encoder.c        | 24 ++----
 2 files changed, 46 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 5a2a8cee9186..6f559c1b0bf6 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -288,27 +288,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	struct omap_dss_device *src = ddata->src;
 	u8 id1, id2, id3;
 	int r;
-	struct omap_dss_dsi_config dsi_config = {
-		.vm = &ddata->vm,
-		.hs_clk_min = 150000000,
-		.hs_clk_max = 300000000,
-		.lp_clk_min = 7000000,
-		.lp_clk_max = 10000000,
-	};
-
-	r = regulator_bulk_enable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
-	if (r) {
-		dev_err(&ddata->dsi->dev, "failed to enable supplies: %d\n", r);
-		return r;
-	}
-
-	r = src->ops->dsi.set_config(src, &dsi_config);
-	if (r) {
-		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
-		goto err_regulators;
-	}
-
-	src->ops->enable(src);
 
 	dsicm_hw_reset(ddata);
 
@@ -363,12 +342,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	dsicm_hw_reset(ddata);
 
-	src->ops->disable(src);
-err_regulators:
-	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
-	if (r)
-		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
-
 	return r;
 }
 
@@ -377,6 +350,8 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 	struct omap_dss_device *src = ddata->src;
 	int r;
 
+	ddata->enabled = false;
+
 	src->ops->dsi.disable_video_output(src, ddata->dsi->channel);
 
 	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
@@ -388,14 +363,6 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 				"error disabling panel, issuing HW reset\n");
 		dsicm_hw_reset(ddata);
 	}
-
-	src->ops->disable(src);
-
-	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
-	if (r)
-		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
-
-	ddata->enabled = false;
 }
 
 static int dsicm_connect(struct omap_dss_device *src,
@@ -415,6 +382,30 @@ static void dsicm_disconnect(struct omap_dss_device *src,
 	ddata->src = NULL;
 }
 
+static void dsicm_pre_enable(struct omap_dss_device *dssdev)
+{
+	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	struct omap_dss_device *src = ddata->src;
+	int r;
+	struct omap_dss_dsi_config dsi_config = {
+		.vm = &ddata->vm,
+		.hs_clk_min = 150000000,
+		.hs_clk_max = 300000000,
+		.lp_clk_min = 7000000,
+		.lp_clk_max = 10000000,
+	};
+
+	r = regulator_bulk_enable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
+	if (r) {
+		dev_err(&ddata->dsi->dev, "failed to enable supplies: %d\n", r);
+	}
+
+	r = src->ops->dsi.set_config(src, &dsi_config);
+	if (r) {
+		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
+	}
+}
+
 static void dsicm_enable(struct omap_dss_device *dssdev)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
@@ -449,6 +440,16 @@ static void dsicm_disable(struct omap_dss_device *dssdev)
 	mutex_unlock(&ddata->lock);
 }
 
+static void dsicm_post_disable(struct omap_dss_device *dssdev)
+{
+	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	int r;
+
+	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
+	if (r)
+		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
+}
+
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 {
 	struct mipi_dsi_device *dsi = ddata->dsi;
@@ -502,8 +503,10 @@ static const struct omap_dss_device_ops dsicm_ops = {
 	.connect	= dsicm_connect,
 	.disconnect	= dsicm_disconnect,
 
+	.pre_enable	= dsicm_pre_enable,
 	.enable		= dsicm_enable,
 	.disable	= dsicm_disable,
+	.post_disable	= dsicm_post_disable,
 
 	.get_modes	= dsicm_get_modes,
 	.check_timings	= dsicm_check_timings,
@@ -666,8 +669,6 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
 
 	omapdss_device_unregister(dssdev);
 
-	if (omapdss_device_is_enabled(dssdev))
-		dsicm_disable(dssdev);
 	omapdss_device_disconnect(ddata->src, dssdev);
 
 	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 18a79dde6815..10abe4d01b0b 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -137,15 +137,11 @@ static void omap_encoder_disable(struct drm_encoder *encoder)
 	omapdss_device_disable(dssdev->next);
 
 	/*
-	 * Disable the internal encoder. This will disable the DSS output. The
-	 * DSI is treated as an exception as DSI pipelines still use the legacy
-	 * flow where the pipeline output controls the encoder.
+	 * Disable the internal encoder. This will disable the DSS output.
 	 */
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
-		if (dssdev->ops && dssdev->ops->disable)
-			dssdev->ops->disable(dssdev);
-		dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
-	}
+	if (dssdev->ops && dssdev->ops->disable)
+		dssdev->ops->disable(dssdev);
+	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
 
 	/*
 	 * Perform the post-disable operations on the chain of external devices
@@ -166,15 +162,11 @@ static void omap_encoder_enable(struct drm_encoder *encoder)
 	omapdss_device_pre_enable(dssdev->next);
 
 	/*
-	 * Enable the internal encoder. This will enable the DSS output. The
-	 * DSI is treated as an exception as DSI pipelines still use the legacy
-	 * flow where the pipeline output controls the encoder.
+	 * Enable the internal encoder. This will enable the DSS output.
 	 */
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
-		if (dssdev->ops && dssdev->ops->enable)
-			dssdev->ops->enable(dssdev);
-		dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
-	}
+	if (dssdev->ops && dssdev->ops->enable)
+		dssdev->ops->enable(dssdev);
+	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
 
 	/*
 	 * Enable the chain of external devices, starting at the one at the
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
