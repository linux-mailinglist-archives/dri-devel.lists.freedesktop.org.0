Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABCA2DAB31
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B366E202;
	Tue, 15 Dec 2020 10:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D18C6E1D8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:27 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlQ8O123920
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029246;
 bh=5lNZboKG+Rg+pshymdTsEpBMZnHp2jnjMTGNZ78q0tM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=s0QZ9Gq69z2Xj6bdjJlQE25H1jHYvQuktRXjw28hswLFgzUMTwV+SmhXY8OF/nUBE
 HmTX3taIa9X9m1E7pf5DIK6wLRthCQ0F04m8Clh89bv9T3mEKLrEB6bYG35KzVAEHh
 jYe3HBSy4lmGQ0CD1KGPzxk1PYALlaGf4GOQI2JM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlQ16023104
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:26 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:26 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:26 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaC046467;
 Tue, 15 Dec 2020 04:47:25 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 26/84] drm/omap: dsi: do bus locking in host driver
Date: Tue, 15 Dec 2020 12:45:59 +0200
Message-ID: <20201215104657.802264-27-tomi.valkeinen@ti.com>
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
index a79c95a040a8..efbca64355d6 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -295,7 +295,6 @@ static int dsicm_wake_up(struct panel_drv_data *ddata)
 static int dsicm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
-	struct omap_dss_device *src = ddata->src;
 	int r = 0;
 	int level;
 
@@ -310,14 +309,10 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
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
@@ -343,21 +338,16 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
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
@@ -374,20 +364,15 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
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
@@ -405,7 +390,6 @@ static ssize_t dsicm_store_ulps(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	struct omap_dss_device *src = ddata->src;
 	unsigned long t;
 	int r;
 
@@ -416,14 +400,10 @@ static ssize_t dsicm_store_ulps(struct device *dev,
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
@@ -453,7 +433,6 @@ static ssize_t dsicm_store_ulps_timeout(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	struct omap_dss_device *src = ddata->src;
 	unsigned long t;
 	int r;
 
@@ -466,9 +445,7 @@ static ssize_t dsicm_store_ulps_timeout(struct device *dev,
 
 	if (ddata->enabled) {
 		/* dsicm_wake_up will restart the timer */
-		src->ops->dsi.bus_lock(src);
 		r = dsicm_wake_up(ddata);
-		src->ops->dsi.bus_unlock(src);
 	}
 
 	mutex_unlock(&ddata->lock);
@@ -669,17 +646,11 @@ static void dsicm_disconnect(struct omap_dss_device *src,
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
 
@@ -696,7 +667,6 @@ static void dsicm_enable(struct omap_dss_device *dssdev)
 static void dsicm_disable(struct omap_dss_device *dssdev)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
 	int r;
 
 	dsicm_bl_power(ddata, false);
@@ -705,24 +675,18 @@ static void dsicm_disable(struct omap_dss_device *dssdev)
 
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
@@ -735,7 +699,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 	dev_dbg(&ddata->dsi->dev, "update %d, %d, %d x %d\n", x, y, w, h);
 
 	mutex_lock(&ddata->lock);
-	src->ops->dsi.bus_lock(src);
 
 	r = dsicm_wake_up(ddata);
 	if (r)
@@ -757,11 +720,10 @@ static int dsicm_update(struct omap_dss_device *dssdev,
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
@@ -787,7 +749,6 @@ static void dsicm_ulps_work(struct work_struct *work)
 	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
 			ulps_work.work);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
-	struct omap_dss_device *src = ddata->src;
 
 	mutex_lock(&ddata->lock);
 
@@ -796,11 +757,8 @@ static void dsicm_ulps_work(struct work_struct *work)
 		return;
 	}
 
-	src->ops->dsi.bus_lock(src);
-
 	dsicm_enter_ulps(ddata);
 
-	src->ops->dsi.bus_unlock(src);
 	mutex_unlock(&ddata->lock);
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index b326ad91c01c..211415135682 100644
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
 
@@ -3800,6 +3796,8 @@ static void dsi_handle_framedone(struct dsi_data *dsi, int error)
 		REG_FLD_MOD(dsi, DSI_TIMING2, 1, 15, 15); /* LP_RX_TO */
 	}
 
+	dsi_bus_unlock(dsi);
+
 	dsi->framedone_callback(error, dsi->framedone_data);
 
 	if (!error)
@@ -3854,6 +3852,8 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 
+	dsi_bus_lock(dsi);
+
 	dsi->update_channel = channel;
 	dsi->framedone_callback = callback;
 	dsi->framedone_data = data;
@@ -4059,7 +4059,7 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 
 	DSSDBG("dsi_display_enable\n");
 
-	WARN_ON(!dsi_bus_is_locked(dsi));
+	dsi_bus_lock(dsi);
 
 	mutex_lock(&dsi->lock);
 
@@ -4075,6 +4075,8 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 
 	mutex_unlock(&dsi->lock);
 
+	dsi_bus_unlock(dsi);
+
 	return;
 
 err_init_dsi:
@@ -4091,7 +4093,7 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
 
 	DSSDBG("dsi_display_disable\n");
 
-	WARN_ON(!dsi_bus_is_locked(dsi));
+	dsi_bus_lock(dsi);
 
 	mutex_lock(&dsi->lock);
 
@@ -4105,6 +4107,8 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
 	dsi_runtime_put(dsi);
 
 	mutex_unlock(&dsi->lock);
+
+	dsi_bus_unlock(dsi);
 }
 
 static int dsi_enable_te(struct dsi_data *dsi, bool enable)
@@ -4713,10 +4717,9 @@ static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
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
 
@@ -4765,6 +4768,19 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
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
@@ -4798,9 +4814,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 	.enable = dsi_display_enable,
 
 	.dsi = {
-		.bus_lock = dsi_bus_lock,
-		.bus_unlock = dsi_bus_unlock,
-
 		.disable = dsi_display_disable,
 
 		.set_config = dsi_set_config,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 2525960aa869..9a3358076187 100644
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
