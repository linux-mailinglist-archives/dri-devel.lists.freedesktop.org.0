Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD6416BC4A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5499B6EA33;
	Tue, 25 Feb 2020 08:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9DC6E9B6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:28:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id EF0D92935F6
Received: by earth.universe (Postfix, from userid 1000)
 id 3B8EF3C0C9F; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 28/56] drm/omap: dsi: do bus locking in host driver
Date: Tue, 25 Feb 2020 00:20:58 +0100
Message-Id: <20200224232126.3385250-29-sebastian.reichel@collabora.com>
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

This moves the bus locking into the host driver and unexports
the custom API in preparation for drm_panel support.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 46 +------------------
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 33 ++++++++-----
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  3 --
 3 files changed, 23 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index e4ffe34324f8..42a4a69b03fd 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -298,7 +298,6 @@ static int dsicm_wake_up(struct panel_drv_data *ddata)
 static int dsicm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
-	struct omap_dss_device *src = ddata->src;
 	int r = 0;
 	int level;
 
@@ -313,15 +312,11 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 	mutex_lock(&ddata->lock);
 
 	if (ddata->enabled) {
-		src->ops->dsi.bus_lock(src);
-
 		r = dsicm_wake_up(ddata);
 		if (!r) {
 			r = dsicm_dcs_write_1(ddata,
 				MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
 		}
-
-		src->ops->dsi.bus_unlock(src);
 	}
 
 	mutex_unlock(&ddata->lock);
@@ -347,21 +342,16 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	struct omap_dss_device *src = ddata->src;
 	u8 errors = 0;
 	int r;
 
 	mutex_lock(&ddata->lock);
 
 	if (ddata->enabled) {
-		src->ops->dsi.bus_lock(src);
-
 		r = dsicm_wake_up(ddata);
 		if (!r)
 			r = dsicm_dcs_read_1(ddata, DCS_READ_NUM_ERRORS,
 					&errors);
-
-		src->ops->dsi.bus_unlock(src);
 	} else {
 		r = -ENODEV;
 	}
@@ -378,20 +368,15 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	struct omap_dss_device *src = ddata->src;
 	u8 id1, id2, id3;
 	int r;
 
 	mutex_lock(&ddata->lock);
 
 	if (ddata->enabled) {
-		src->ops->dsi.bus_lock(src);
-
 		r = dsicm_wake_up(ddata);
 		if (!r)
 			r = dsicm_get_id(ddata, &id1, &id2, &id3);
-
-		src->ops->dsi.bus_unlock(src);
 	} else {
 		r = -ENODEV;
 	}
@@ -409,7 +394,6 @@ static ssize_t dsicm_store_ulps(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	struct omap_dss_device *src = ddata->src;
 	unsigned long t;
 	int r;
 
@@ -420,14 +404,10 @@ static ssize_t dsicm_store_ulps(struct device *dev,
 	mutex_lock(&ddata->lock);
 
 	if (ddata->enabled) {
-		src->ops->dsi.bus_lock(src);
-
 		if (t)
 			r = dsicm_enter_ulps(ddata);
 		else
 			r = dsicm_wake_up(ddata);
-
-		src->ops->dsi.bus_unlock(src);
 	}
 
 	mutex_unlock(&ddata->lock);
@@ -457,7 +437,6 @@ static ssize_t dsicm_store_ulps_timeout(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	struct omap_dss_device *src = ddata->src;
 	unsigned long t;
 	int r;
 
@@ -470,9 +449,7 @@ static ssize_t dsicm_store_ulps_timeout(struct device *dev,
 
 	if (ddata->enabled) {
 		/* dsicm_wake_up will restart the timer */
-		src->ops->dsi.bus_lock(src);
 		r = dsicm_wake_up(ddata);
-		src->ops->dsi.bus_unlock(src);
 	}
 
 	mutex_unlock(&ddata->lock);
@@ -673,17 +650,11 @@ static void dsicm_disconnect(struct omap_dss_device *src,
 static void dsicm_enable(struct omap_dss_device *dssdev)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
 	int r;
 
 	mutex_lock(&ddata->lock);
 
-	src->ops->dsi.bus_lock(src);
-
 	r = dsicm_power_on(ddata);
-
-	src->ops->dsi.bus_unlock(src);
-
 	if (r)
 		goto err;
 
@@ -700,7 +671,6 @@ static void dsicm_enable(struct omap_dss_device *dssdev)
 static void dsicm_disable(struct omap_dss_device *dssdev)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
 	int r;
 
 	dsicm_bl_power(ddata, false);
@@ -709,24 +679,19 @@ static void dsicm_disable(struct omap_dss_device *dssdev)
 
 	dsicm_cancel_ulps_work(ddata);
 
-	src->ops->dsi.bus_lock(src);
-
 	r = dsicm_wake_up(ddata);
 	if (!r)
 		dsicm_power_off(ddata);
 
-	src->ops->dsi.bus_unlock(src);
-
 	mutex_unlock(&ddata->lock);
 }
 
 static void dsicm_framedone_cb(int err, void *data)
 {
 	struct panel_drv_data *ddata = data;
-	struct omap_dss_device *src = ddata->src;
 
 	dev_dbg(&ddata->dsi->dev, "framedone, err %d\n", err);
-	src->ops->dsi.bus_unlock(src);
+	mutex_unlock(&ddata->lock);
 }
 
 static int dsicm_update(struct omap_dss_device *dssdev,
@@ -739,7 +704,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 	dev_dbg(&ddata->dsi->dev, "update %d, %d, %d x %d\n", x, y, w, h);
 
 	mutex_lock(&ddata->lock);
-	src->ops->dsi.bus_lock(src);
 
 	r = dsicm_wake_up(ddata);
 	if (r)
@@ -761,11 +725,9 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 	if (r)
 		goto err;
 
-	/* note: no bus_unlock here. unlock is src framedone_cb */
-	mutex_unlock(&ddata->lock);
+	/* note: no unlock here. unlock is src framedone_cb */
 	return 0;
 err:
-	src->ops->dsi.bus_unlock(src);
 	mutex_unlock(&ddata->lock);
 	return r;
 }
@@ -791,7 +753,6 @@ static void dsicm_ulps_work(struct work_struct *work)
 	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
 			ulps_work.work);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
-	struct omap_dss_device *src = ddata->src;
 
 	mutex_lock(&ddata->lock);
 
@@ -800,11 +761,8 @@ static void dsicm_ulps_work(struct work_struct *work)
 		return;
 	}
 
-	src->ops->dsi.bus_lock(src);
-
 	dsicm_enter_ulps(ddata);
 
-	src->ops->dsi.bus_unlock(src);
 	mutex_unlock(&ddata->lock);
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 50a567ebfb86..ce45021c99ce 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -479,17 +479,13 @@ static inline u32 dsi_read_reg(struct dsi_data *dsi, const struct dsi_reg idx)
 	return __raw_readl(base + idx.idx);
 }
 
-static void dsi_bus_lock(struct omap_dss_device *dssdev)
+static void dsi_bus_lock(struct dsi_data *dsi)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
 	down(&dsi->bus_lock);
 }
 
-static void dsi_bus_unlock(struct omap_dss_device *dssdev)
+static void dsi_bus_unlock(struct dsi_data *dsi)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
 	up(&dsi->bus_lock);
 }
 
@@ -3805,6 +3801,8 @@ static void dsi_handle_framedone(struct dsi_data *dsi, int error)
 		REG_FLD_MOD(dsi, DSI_TIMING2, 1, 15, 15); /* LP_RX_TO */
 	}
 
+	dsi_bus_unlock(dsi);
+
 	dsi->framedone_callback(error, dsi->framedone_data);
 
 	if (!error)
@@ -3864,6 +3862,8 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 
+	dsi_bus_lock(dsi);
+
 	dsi->update_channel = channel;
 	dsi->framedone_callback = callback;
 	dsi->framedone_data = data;
@@ -4723,10 +4723,9 @@ static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
 	}
 }
 
-static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
-				      const struct mipi_dsi_msg *msg)
+static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
+				       const struct mipi_dsi_msg *msg)
 {
-	struct dsi_data *dsi = host_to_omap(host);
 	struct omap_dss_device *dssdev = &dsi->output;
 	int r;
 
@@ -4775,6 +4774,19 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 	return 0;
 }
 
+static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
+				      const struct mipi_dsi_msg *msg)
+{
+	struct dsi_data *dsi = host_to_omap(host);
+	int r;
+
+	dsi_bus_lock(dsi);
+	r = _omap_dsi_host_transfer(dsi, msg);
+	dsi_bus_unlock(dsi);
+
+	return r;
+}
+
 static int dsi_get_clocks(struct dsi_data *dsi)
 {
 	struct clk *clk;
@@ -4808,9 +4820,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 	.enable = dsi_display_enable,
 
 	.dsi = {
-		.bus_lock = dsi_bus_lock,
-		.bus_unlock = dsi_bus_unlock,
-
 		.disable = dsi_display_disable,
 
 		.set_config = dsi_set_config,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index dc41f982a082..8ff99c00c708 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -290,9 +290,6 @@ struct omapdss_dsi_ops {
 	int (*update)(struct omap_dss_device *dssdev, int channel,
 			void (*callback)(int, void *), void *data);
 
-	void (*bus_lock)(struct omap_dss_device *dssdev);
-	void (*bus_unlock)(struct omap_dss_device *dssdev);
-
 	int (*enable_video_output)(struct omap_dss_device *dssdev, int channel);
 	void (*disable_video_output)(struct omap_dss_device *dssdev,
 			int channel);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
