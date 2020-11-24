Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD90E2C2633
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C036E417;
	Tue, 24 Nov 2020 12:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFA16E32F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:47:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCktTd123562;
 Tue, 24 Nov 2020 06:46:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222015;
 bh=NPBDXD8YyrBPu5mj4nbjtoIDp+vMUDw2uI4h4HPKrH4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=oaJynEqAX6jU3cerA2o45TFD7/3vdk6g8EnrhKCKs6tGI38aMyOMqZbxo0snPqLT1
 W6f7/MJEmmim63t/o6l6Jds71PeOq9lBXd5lW+nMPOSZIftG6QVqD3FEzxHj26iZUg
 2kk3lRKxbNQV2Of/ryi2VOpTZ5VZe+7cO5PShgxY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCktbO042208
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:46:55 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:55 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpF040922;
 Tue, 24 Nov 2020 06:46:53 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 26/80] drm/omap: dsi: do bus locking in host driver
Date: Tue, 24 Nov 2020 14:44:44 +0200
Message-ID: <20201124124538.660710-27-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

This moves the bus locking into the host driver and unexports
the custom API in preparation for drm_panel support.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 44 +------------------
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 41 +++++++++++------
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  3 --
 3 files changed, 28 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 766edeecdd79..a335c17d3c3b 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -296,7 +296,6 @@ static int dsicm_wake_up(struct panel_drv_data *ddata)
 static int dsicm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
-	struct omap_dss_device *src = ddata->src;
 	int r = 0;
 	int level;
 
@@ -311,14 +310,10 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 	mutex_lock(&ddata->lock);
 
 	if (ddata->enabled) {
-		src->ops->dsi.bus_lock(src);
-
 		r = dsicm_wake_up(ddata);
 		if (!r)
 			r = dsicm_dcs_write_1(
 				ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
-
-		src->ops->dsi.bus_unlock(src);
 	}
 
 	mutex_unlock(&ddata->lock);
@@ -344,21 +339,16 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
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
@@ -375,20 +365,15 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
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
@@ -406,7 +391,6 @@ static ssize_t dsicm_store_ulps(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	struct omap_dss_device *src = ddata->src;
 	unsigned long t;
 	int r;
 
@@ -417,14 +401,10 @@ static ssize_t dsicm_store_ulps(struct device *dev,
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
@@ -454,7 +434,6 @@ static ssize_t dsicm_store_ulps_timeout(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	struct omap_dss_device *src = ddata->src;
 	unsigned long t;
 	int r;
 
@@ -467,9 +446,7 @@ static ssize_t dsicm_store_ulps_timeout(struct device *dev,
 
 	if (ddata->enabled) {
 		/* dsicm_wake_up will restart the timer */
-		src->ops->dsi.bus_lock(src);
 		r = dsicm_wake_up(ddata);
-		src->ops->dsi.bus_unlock(src);
 	}
 
 	mutex_unlock(&ddata->lock);
@@ -670,17 +647,11 @@ static void dsicm_disconnect(struct omap_dss_device *src,
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
 
@@ -697,7 +668,6 @@ static void dsicm_enable(struct omap_dss_device *dssdev)
 static void dsicm_disable(struct omap_dss_device *dssdev)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
 	int r;
 
 	dsicm_bl_power(ddata, false);
@@ -706,24 +676,18 @@ static void dsicm_disable(struct omap_dss_device *dssdev)
 
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
 }
 
 static int dsicm_update(struct omap_dss_device *dssdev,
@@ -736,7 +700,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 	dev_dbg(&ddata->dsi->dev, "update %d, %d, %d x %d\n", x, y, w, h);
 
 	mutex_lock(&ddata->lock);
-	src->ops->dsi.bus_lock(src);
 
 	r = dsicm_wake_up(ddata);
 	if (r)
@@ -758,11 +721,10 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 	if (r)
 		goto err;
 
-	/* note: no bus_unlock here. unlock is src framedone_cb */
 	mutex_unlock(&ddata->lock);
+
 	return 0;
 err:
-	src->ops->dsi.bus_unlock(src);
 	mutex_unlock(&ddata->lock);
 	return r;
 }
@@ -788,7 +750,6 @@ static void dsicm_ulps_work(struct work_struct *work)
 	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
 			ulps_work.work);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
-	struct omap_dss_device *src = ddata->src;
 
 	mutex_lock(&ddata->lock);
 
@@ -797,11 +758,8 @@ static void dsicm_ulps_work(struct work_struct *work)
 		return;
 	}
 
-	src->ops->dsi.bus_lock(src);
-
 	dsicm_enter_ulps(ddata);
 
-	src->ops->dsi.bus_unlock(src);
 	mutex_unlock(&ddata->lock);
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index e0d0efffd923..2a3b63265bb2 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -477,17 +477,13 @@ static inline u32 dsi_read_reg(struct dsi_data *dsi, const struct dsi_reg idx)
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
 
@@ -3798,6 +3794,8 @@ static void dsi_handle_framedone(struct dsi_data *dsi, int error)
 		REG_FLD_MOD(dsi, DSI_TIMING2, 1, 15, 15); /* LP_RX_TO */
 	}
 
+	dsi_bus_unlock(dsi);
+
 	dsi->framedone_callback(error, dsi->framedone_data);
 
 	if (!error)
@@ -3857,6 +3855,8 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 
+	dsi_bus_lock(dsi);
+
 	dsi->update_channel = channel;
 	dsi->framedone_callback = callback;
 	dsi->framedone_data = data;
@@ -4062,7 +4062,7 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 
 	DSSDBG("dsi_display_enable\n");
 
-	WARN_ON(!dsi_bus_is_locked(dsi));
+	dsi_bus_lock(dsi);
 
 	mutex_lock(&dsi->lock);
 
@@ -4078,6 +4078,8 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 
 	mutex_unlock(&dsi->lock);
 
+	dsi_bus_unlock(dsi);
+
 	return;
 
 err_init_dsi:
@@ -4094,7 +4096,7 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
 
 	DSSDBG("dsi_display_disable\n");
 
-	WARN_ON(!dsi_bus_is_locked(dsi));
+	dsi_bus_lock(dsi);
 
 	mutex_lock(&dsi->lock);
 
@@ -4108,6 +4110,8 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
 	dsi_runtime_put(dsi);
 
 	mutex_unlock(&dsi->lock);
+
+	dsi_bus_unlock(dsi);
 }
 
 static int dsi_enable_te(struct dsi_data *dsi, bool enable)
@@ -4716,10 +4720,9 @@ static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
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
 
@@ -4768,6 +4771,19 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
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
@@ -4801,9 +4817,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 	.enable = dsi_display_enable,
 
 	.dsi = {
-		.bus_lock = dsi_bus_lock,
-		.bus_unlock = dsi_bus_unlock,
-
 		.disable = dsi_display_disable,
 
 		.set_config = dsi_set_config,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 1520a5f752b7..43eba2ea1f96 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -291,9 +291,6 @@ struct omapdss_dsi_ops {
 	int (*update)(struct omap_dss_device *dssdev, int channel,
 			void (*callback)(int, void *), void *data);
 
-	void (*bus_lock)(struct omap_dss_device *dssdev);
-	void (*bus_unlock)(struct omap_dss_device *dssdev);
-
 	int (*enable_video_output)(struct omap_dss_device *dssdev, int channel);
 	void (*disable_video_output)(struct omap_dss_device *dssdev,
 			int channel);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
