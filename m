Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74C916BC3C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8676EA27;
	Tue, 25 Feb 2020 08:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8E66E9B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 0BF2329361B
Received: by earth.universe (Postfix, from userid 1000)
 id DEB2E3C0C91; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 14/56] drm/omap: dsi: introduce mipi_dsi_host
Date: Tue, 25 Feb 2020 00:20:44 +0100
Message-Id: <20200224232126.3385250-15-sebastian.reichel@collabora.com>
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

This moves from custom platform driver infrastructure to mipi_dsi_host
and mipi_dsi_device. Note, that this is a graduate step and the driver
only uses the devices types and transfer function, but not yet the new
device binding style or drm_panel.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 119 +++++++++---------
 drivers/gpu/drm/omapdrm/dss/dsi.c             |  54 ++++++--
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |   4 -
 3 files changed, 102 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index ba046a596044..c34daecb1de5 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -14,7 +14,6 @@
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/sched/signal.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
@@ -39,13 +38,13 @@
 #define DCS_GET_ID3		0xdc
 
 struct panel_drv_data {
+	struct mipi_dsi_device *dsi;
+
 	struct omap_dss_device dssdev;
 	struct omap_dss_device *src;
 
 	struct videomode vm;
 
-	struct platform_device *pdev;
-
 	struct mutex lock;
 
 	struct backlight_device *bldev;
@@ -139,7 +138,7 @@ static void hw_guard_wait(struct panel_drv_data *ddata)
 
 static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 *data)
 {
-	struct omap_dss_device *src = ddata->src;
+	struct mipi_dsi_device *dsi = ddata->dsi;
 	const struct mipi_dsi_msg msg = {
 		.channel = ddata->channel,
 		.type = MIPI_DSI_DCS_READ,
@@ -149,12 +148,12 @@ static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 *data)
 		.rx_buf = data
 	};
 
-	return src->ops->dsi.transfer(src, &msg);
+	return dsi->host->ops->transfer(dsi->host, &msg);
 }
 
 static int dsicm_dcs_write_0(struct panel_drv_data *ddata, u8 dcs_cmd)
 {
-	struct omap_dss_device *src = ddata->src;
+	struct mipi_dsi_device *dsi = ddata->dsi;
 	const struct mipi_dsi_msg msg = {
 		.channel = ddata->channel,
 		.type = MIPI_DSI_DCS_SHORT_WRITE,
@@ -162,12 +161,12 @@ static int dsicm_dcs_write_0(struct panel_drv_data *ddata, u8 dcs_cmd)
 		.tx_len = 1,
 	};
 
-	return src->ops->dsi.transfer(src, &msg);
+	return dsi->host->ops->transfer(dsi->host, &msg);
 }
 
 static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 param)
 {
-	struct omap_dss_device *src = ddata->src;
+	struct mipi_dsi_device *dsi = ddata->dsi;
 	const u8 buf[] = { dcs_cmd, param };
 	const struct mipi_dsi_msg msg = {
 		.channel = ddata->channel,
@@ -176,13 +175,13 @@ static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 param)
 		.tx_len = 2,
 	};
 
-	return src->ops->dsi.transfer(src, &msg);
+	return dsi->host->ops->transfer(dsi->host, &msg);
 }
 
 static int dsicm_sleep_in(struct panel_drv_data *ddata)
 
 {
-	struct omap_dss_device *src = ddata->src;
+	struct mipi_dsi_device *dsi = ddata->dsi;
 	int r;
 	const u8 cmd = MIPI_DCS_ENTER_SLEEP_MODE;
 	const struct mipi_dsi_msg msg = {
@@ -194,7 +193,7 @@ static int dsicm_sleep_in(struct panel_drv_data *ddata)
 
 	hw_guard_wait(ddata);
 
-	r = src->ops->dsi.transfer(src, &msg);
+	r = dsi->host->ops->transfer(dsi->host, &msg);
 	if (r)
 		return r;
 
@@ -242,7 +241,7 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
 static int dsicm_set_update_window(struct panel_drv_data *ddata,
 		u16 x, u16 y, u16 w, u16 h)
 {
-	struct omap_dss_device *src = ddata->src;
+	struct mipi_dsi_device *dsi = ddata->dsi;
 	int r;
 	u16 x1 = x;
 	u16 x2 = x + w - 1;
@@ -280,11 +279,11 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata,
 	};
 
 
-	r = src->ops->dsi.transfer(src, &msgX);
+	r = dsi->host->ops->transfer(dsi->host, &msgX);
 	if (r)
 		return r;
 
-	r = src->ops->dsi.transfer(src, &msgY);
+	r = dsi->host->ops->transfer(dsi->host, &msgY);
 	if (r)
 		return r;
 
@@ -327,7 +326,7 @@ static int dsicm_enter_ulps(struct panel_drv_data *ddata)
 	return 0;
 
 err:
-	dev_err(&ddata->pdev->dev, "enter ULPS failed");
+	dev_err(&ddata->dsi->dev, "enter ULPS failed");
 	dsicm_panel_reset(ddata);
 
 	ddata->ulps_enabled = false;
@@ -350,7 +349,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 
 	r = _dsicm_enable_te(ddata, true);
 	if (r) {
-		dev_err(&ddata->pdev->dev, "failed to re-enable TE");
+		dev_err(&ddata->dsi->dev, "failed to re-enable TE");
 		goto err2;
 	}
 
@@ -364,7 +363,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 	return 0;
 
 err2:
-	dev_err(&ddata->pdev->dev, "failed to exit ULPS");
+	dev_err(&ddata->dsi->dev, "failed to exit ULPS");
 
 	r = dsicm_panel_reset(ddata);
 	if (!r) {
@@ -401,7 +400,7 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 	else
 		level = 0;
 
-	dev_dbg(&ddata->pdev->dev, "update brightness to %d\n", level);
+	dev_dbg(&ddata->dsi->dev, "update brightness to %d\n", level);
 
 	mutex_lock(&ddata->lock);
 
@@ -638,7 +637,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (ddata->vpnl) {
 		r = regulator_enable(ddata->vpnl);
 		if (r) {
-			dev_err(&ddata->pdev->dev,
+			dev_err(&ddata->dsi->dev,
 				"failed to enable VPNL: %d\n", r);
 			return r;
 		}
@@ -647,7 +646,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (ddata->vddi) {
 		r = regulator_enable(ddata->vddi);
 		if (r) {
-			dev_err(&ddata->pdev->dev,
+			dev_err(&ddata->dsi->dev,
 				"failed to enable VDDI: %d\n", r);
 			goto err_vpnl;
 		}
@@ -655,7 +654,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	r = src->ops->dsi.set_config(src, &dsi_config);
 	if (r) {
-		dev_err(&ddata->pdev->dev, "failed to configure DSI\n");
+		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
 		goto err_vddi;
 	}
 
@@ -702,7 +701,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	ddata->enabled = true;
 
 	if (!ddata->intro_printed) {
-		dev_info(&ddata->pdev->dev, "panel revision %02x.%02x.%02x\n",
+		dev_info(&ddata->dsi->dev, "panel revision %02x.%02x.%02x\n",
 			id1, id2, id3);
 		ddata->intro_printed = true;
 	}
@@ -711,7 +710,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	return 0;
 err:
-	dev_err(&ddata->pdev->dev, "error while enabling panel, issuing HW reset\n");
+	dev_err(&ddata->dsi->dev, "error while enabling panel, issuing HW reset\n");
 
 	dsicm_hw_reset(ddata);
 
@@ -738,7 +737,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 		r = dsicm_sleep_in(ddata);
 
 	if (r) {
-		dev_err(&ddata->pdev->dev,
+		dev_err(&ddata->dsi->dev,
 				"error disabling panel, issuing HW reset\n");
 		dsicm_hw_reset(ddata);
 	}
@@ -755,7 +754,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 
 static int dsicm_panel_reset(struct panel_drv_data *ddata)
 {
-	dev_err(&ddata->pdev->dev, "performing LCD reset\n");
+	dev_err(&ddata->dsi->dev, "performing LCD reset\n");
 
 	dsicm_power_off(ddata);
 	dsicm_hw_reset(ddata);
@@ -766,7 +765,7 @@ static int dsicm_connect(struct omap_dss_device *src,
 			 struct omap_dss_device *dst)
 {
 	struct panel_drv_data *ddata = to_panel_data(dst);
-	struct device *dev = &ddata->pdev->dev;
+	struct device *dev = &ddata->dsi->dev;
 	int r;
 
 	r = src->ops->dsi.request_vc(src, ddata->channel);
@@ -811,7 +810,7 @@ static void dsicm_enable(struct omap_dss_device *dssdev)
 
 	return;
 err:
-	dev_dbg(&ddata->pdev->dev, "enable failed (%d)\n", r);
+	dev_dbg(&ddata->dsi->dev, "enable failed (%d)\n", r);
 	mutex_unlock(&ddata->lock);
 }
 
@@ -843,7 +842,7 @@ static void dsicm_framedone_cb(int err, void *data)
 	struct panel_drv_data *ddata = data;
 	struct omap_dss_device *src = ddata->src;
 
-	dev_dbg(&ddata->pdev->dev, "framedone, err %d\n", err);
+	dev_dbg(&ddata->dsi->dev, "framedone, err %d\n", err);
 	src->ops->dsi.bus_unlock(src);
 }
 
@@ -867,7 +866,7 @@ static irqreturn_t dsicm_te_isr(int irq, void *data)
 
 	return IRQ_HANDLED;
 err:
-	dev_err(&ddata->pdev->dev, "start update failed\n");
+	dev_err(&ddata->dsi->dev, "start update failed\n");
 	src->ops->dsi.bus_unlock(src);
 	return IRQ_HANDLED;
 }
@@ -878,7 +877,7 @@ static void dsicm_te_timeout_work_callback(struct work_struct *work)
 					te_timeout_work.work);
 	struct omap_dss_device *src = ddata->src;
 
-	dev_err(&ddata->pdev->dev, "TE not received for 250ms!\n");
+	dev_err(&ddata->dsi->dev, "TE not received for 250ms!\n");
 
 	atomic_set(&ddata->do_update, 0);
 	src->ops->dsi.bus_unlock(src);
@@ -891,7 +890,7 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 	struct omap_dss_device *src = ddata->src;
 	int r;
 
-	dev_dbg(&ddata->pdev->dev, "update %d, %d, %d x %d\n", x, y, w, h);
+	dev_dbg(&ddata->dsi->dev, "update %d, %d, %d x %d\n", x, y, w, h);
 
 	mutex_lock(&ddata->lock);
 	src->ops->dsi.bus_lock(src);
@@ -936,14 +935,14 @@ static int dsicm_sync(struct omap_dss_device *dssdev)
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
 	struct omap_dss_device *src = ddata->src;
 
-	dev_dbg(&ddata->pdev->dev, "sync\n");
+	dev_dbg(&ddata->dsi->dev, "sync\n");
 
 	mutex_lock(&ddata->lock);
 	src->ops->dsi.bus_lock(src);
 	src->ops->dsi.bus_unlock(src);
 	mutex_unlock(&ddata->lock);
 
-	dev_dbg(&ddata->pdev->dev, "sync done\n");
+	dev_dbg(&ddata->dsi->dev, "sync done\n");
 
 	return 0;
 }
@@ -1020,7 +1019,7 @@ static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
                                         u16 size)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
+	struct mipi_dsi_device *dsi = ddata->dsi;
 
 	const u8 buf[] = {
 		size & 0xff,
@@ -1034,7 +1033,7 @@ static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
 		.tx_len = 2,
 	};
 
-	return src->ops->dsi.transfer(src, &msg);
+	return dsi->host->ops->transfer(dsi->host, &msg);
 }
 
 static int dsicm_memory_read(struct omap_dss_device *dssdev,
@@ -1042,6 +1041,7 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
 		u16 x, u16 y, u16 w, u16 h)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	struct mipi_dsi_device *dsi = ddata->dsi;
 	struct omap_dss_device *src = ddata->src;
 	int r;
 	int first = 1;
@@ -1093,7 +1093,7 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
 		};
 		first = 0;
 
-		r = src->ops->dsi.transfer(src, &msg);
+		r = dsi->host->ops->transfer(dsi->host, &msg);
 		if (r < 0) {
 			dev_err(dssdev->dev, "read error\n");
 			goto err3;
@@ -1102,12 +1102,12 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
 		buf_used += r;
 
 		if (r < plen) {
-			dev_err(&ddata->pdev->dev, "short read\n");
+			dev_err(&ddata->dsi->dev, "short read\n");
 			break;
 		}
 
 		if (signal_pending(current)) {
-			dev_err(&ddata->pdev->dev, "signal pending, "
+			dev_err(&ddata->dsi->dev, "signal pending, "
 					"aborting memory read\n");
 			r = -ERESTARTSYS;
 			goto err3;
@@ -1201,28 +1201,28 @@ static const struct omap_dss_driver dsicm_dss_driver = {
 	.memory_read	= dsicm_memory_read,
 };
 
-static int dsicm_probe_of(struct platform_device *pdev)
+static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 {
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node = dsi->dev.of_node;
 	struct device_node *backlight;
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
 	struct display_timing timing;
 	int err;
 
 	ddata->channel = TCH;
 
-	ddata->reset_gpio = devm_gpiod_get(&pdev->dev, "reset", GPIOD_OUT_LOW);
+	ddata->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ddata->reset_gpio)) {
 		err = PTR_ERR(ddata->reset_gpio);
-		dev_err(&pdev->dev, "reset gpio request failed: %d", err);
+		dev_err(&dsi->dev, "reset gpio request failed: %d", err);
 		return err;
 	}
 
-	ddata->ext_te_gpio = devm_gpiod_get_optional(&pdev->dev, "te",
+	ddata->ext_te_gpio = devm_gpiod_get_optional(&dsi->dev, "te",
 						     GPIOD_IN);
 	if (IS_ERR(ddata->ext_te_gpio)) {
 		err = PTR_ERR(ddata->ext_te_gpio);
-		dev_err(&pdev->dev, "TE gpio request failed: %d", err);
+		dev_err(&dsi->dev, "TE gpio request failed: %d", err);
 		return err;
 	}
 
@@ -1233,7 +1233,7 @@ static int dsicm_probe_of(struct platform_device *pdev)
 			ddata->vm.pixelclock =
 				ddata->vm.hactive * ddata->vm.vactive * 60;
 	} else {
-		dev_warn(&pdev->dev,
+		dev_warn(&dsi->dev,
 			 "failed to get video timing, using defaults\n");
 	}
 
@@ -1243,7 +1243,7 @@ static int dsicm_probe_of(struct platform_device *pdev)
 	ddata->height_mm = 0;
 	of_property_read_u32(node, "height-mm", &ddata->height_mm);
 
-	ddata->vpnl = devm_regulator_get_optional(&pdev->dev, "vpnl");
+	ddata->vpnl = devm_regulator_get_optional(&dsi->dev, "vpnl");
 	if (IS_ERR(ddata->vpnl)) {
 		err = PTR_ERR(ddata->vpnl);
 		if (err == -EPROBE_DEFER)
@@ -1251,7 +1251,7 @@ static int dsicm_probe_of(struct platform_device *pdev)
 		ddata->vpnl = NULL;
 	}
 
-	ddata->vddi = devm_regulator_get_optional(&pdev->dev, "vddi");
+	ddata->vddi = devm_regulator_get_optional(&dsi->dev, "vddi");
 	if (IS_ERR(ddata->vddi)) {
 		err = PTR_ERR(ddata->vddi);
 		if (err == -EPROBE_DEFER)
@@ -1276,11 +1276,11 @@ static int dsicm_probe_of(struct platform_device *pdev)
 	return 0;
 }
 
-static int dsicm_probe(struct platform_device *pdev)
+static int dsicm_probe(struct mipi_dsi_device *dsi)
 {
 	struct panel_drv_data *ddata;
 	struct backlight_device *bldev = NULL;
-	struct device *dev = &pdev->dev;
+	struct device *dev = &dsi->dev;
 	struct omap_dss_device *dssdev;
 	int r;
 
@@ -1290,14 +1290,14 @@ static int dsicm_probe(struct platform_device *pdev)
 	if (!ddata)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, ddata);
-	ddata->pdev = pdev;
+	mipi_dsi_set_drvdata(dsi, ddata);
+	ddata->dsi = dsi;
 
 	ddata->vm.hactive = 864;
 	ddata->vm.vactive = 480;
 	ddata->vm.pixelclock = 864 * 480 * 60;
 
-	r = dsicm_probe_of(pdev);
+	r = dsicm_probe_of(dsi);
 	if (r)
 		return r;
 
@@ -1379,12 +1379,12 @@ static int dsicm_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int __exit dsicm_remove(struct platform_device *pdev)
+static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
 {
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
 
-	dev_dbg(&pdev->dev, "remove\n");
+	dev_dbg(&dsi->dev, "remove\n");
 
 	omapdss_device_unregister(dssdev);
 
@@ -1392,7 +1392,7 @@ static int __exit dsicm_remove(struct platform_device *pdev)
 		dsicm_disable(dssdev);
 	omapdss_device_disconnect(ddata->src, dssdev);
 
-	sysfs_remove_group(&pdev->dev.kobj, &dsicm_attr_group);
+	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
 
 	if (ddata->extbldev)
 		put_device(&ddata->extbldev->dev);
@@ -1413,7 +1413,7 @@ static const struct of_device_id dsicm_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, dsicm_of_match);
 
-static struct platform_driver dsicm_driver = {
+static struct mipi_dsi_driver dsicm_driver = {
 	.probe = dsicm_probe,
 	.remove = __exit_p(dsicm_remove),
 	.driver = {
@@ -1422,8 +1422,7 @@ static struct platform_driver dsicm_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
-
-module_platform_driver(dsicm_driver);
+module_mipi_dsi_driver(dsicm_driver);
 
 MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
 MODULE_DESCRIPTION("Generic DSI Command Mode Panel Driver");
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 4899bfa2d76f..3e6a57e00456 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -334,6 +334,8 @@ struct dsi_data {
 	struct regmap *syscon;
 	struct dss_device *dss;
 
+	struct mipi_dsi_host host;
+
 	struct dispc_clock_info user_dispc_cinfo;
 	struct dss_pll_clock_info user_dsi_cinfo;
 
@@ -432,6 +434,11 @@ static inline struct dsi_data *to_dsi_data(struct omap_dss_device *dssdev)
 	return dev_get_drvdata(dssdev->dev);
 }
 
+static inline struct dsi_data *host_to_omap(struct mipi_dsi_host *host)
+{
+	return container_of(host, struct dsi_data, host);
+}
+
 static inline void dsi_write_reg(struct dsi_data *dsi,
 				 const struct dsi_reg idx, u32 val)
 {
@@ -4709,9 +4716,12 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
 	}
 }
 
-static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
-				 const struct mipi_dsi_msg *msg)
+static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
+				      const struct mipi_dsi_msg *msg)
 {
+	struct dsi_data *dsi = host_to_omap(host);
+	struct omap_dss_device *dssdev = &dsi->output;
+
 	switch (msg->type) {
 	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
 	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
@@ -4785,11 +4795,30 @@ static const struct omap_dss_device_ops dsi_ops = {
 
 		.request_vc = dsi_request_vc,
 		.release_vc = dsi_release_vc,
-
-		.transfer = omap_dsi_transfer,
 	},
 };
 
+int omap_dsi_host_attach(struct mipi_dsi_host *host,
+			 struct mipi_dsi_device *dsi)
+{
+	/* TODO: convert driver from custom binding method to this one */
+	return 0;
+}
+
+int omap_dsi_host_detach(struct mipi_dsi_host *host,
+			 struct mipi_dsi_device *dsi)
+{
+	/* TODO: convert driver from custom binding method to this one */
+	return 0;
+}
+
+static const struct mipi_dsi_host_ops omap_dsi_host_ops = {
+	.attach = omap_dsi_host_attach,
+	.detach = omap_dsi_host_detach,
+	.transfer = omap_dsi_host_transfer,
+};
+
+
 /* -----------------------------------------------------------------------------
  * PLL
  */
@@ -5258,15 +5287,18 @@ static int dsi_probe(struct platform_device *pdev)
 		dsi->num_lanes_supported = 3;
 	}
 
-	r = of_platform_populate(dev->of_node, NULL, NULL, dev);
-	if (r) {
-		DSSERR("Failed to populate DSI child devices: %d\n", r);
+	dsi->host.ops = &omap_dsi_host_ops;
+	dsi->host.dev = &pdev->dev;
+
+	r = mipi_dsi_host_register(&dsi->host);
+	if (r < 0) {
+		dev_err(&pdev->dev, "failed to register DSI host: %d\n", r);
 		goto err_pm_disable;
 	}
 
 	r = dsi_init_output(dsi);
 	if (r)
-		goto err_of_depopulate;
+		goto err_dsi_host_unregister;
 
 	r = dsi_probe_of(dsi);
 	if (r) {
@@ -5282,8 +5314,8 @@ static int dsi_probe(struct platform_device *pdev)
 
 err_uninit_output:
 	dsi_uninit_output(dsi);
-err_of_depopulate:
-	of_platform_depopulate(dev);
+err_dsi_host_unregister:
+	mipi_dsi_host_unregister(&dsi->host);
 err_pm_disable:
 	pm_runtime_disable(dev);
 	return r;
@@ -5297,7 +5329,7 @@ static int dsi_remove(struct platform_device *pdev)
 
 	dsi_uninit_output(dsi);
 
-	of_platform_depopulate(&pdev->dev);
+	mipi_dsi_host_unregister(&dsi->host);
 
 	pm_runtime_disable(&pdev->dev);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 587206c984a9..da395a5e7257 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -303,10 +303,6 @@ struct omapdss_dsi_ops {
 
 	int (*request_vc)(struct omap_dss_device *dssdev, int channel);
 	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
-
-	/* data transfer */
-	ssize_t (*transfer)(struct omap_dss_device *dssdev,
-			const struct mipi_dsi_msg *msg);
 };
 
 struct omap_dss_device_ops {
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
