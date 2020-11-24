Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA3C2C25FD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCC66E3F5;
	Tue, 24 Nov 2020 12:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C6A6E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:46:57 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCkptt032825;
 Tue, 24 Nov 2020 06:46:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222011;
 bh=699/ZvrQR+BVdPB3qEASVzGOw3VBasyH9vb/GP88g1M=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Ft0GNs/aZBpltz4VU3PJZZ6Vmlv/75kRjGQXBJimgY9cVXJdYQTDbfKaCP4+/EYYx
 D4k6MwiHMLIflJrpytPy8uARTl8MdAIi/7UwbEu7MfB4GsdNSHUXWiSSaJI/B+5snT
 smvqNiAPRUALm2JP0WE8GJz3rtEJgFctQmTjeYDg=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCkpw2045481
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:46:51 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:50 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpD040922;
 Tue, 24 Nov 2020 06:46:48 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 24/80] drm/omap: dsi: move TE GPIO handling into core
Date: Tue, 24 Nov 2020 14:44:42 +0200
Message-ID: <20201124124538.660710-25-tomi.valkeinen@ti.com>
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

In preparation for removing custom DSS calls from the DSI
panel driver, this moves support for external tearing event
GPIOs into the DSI host driver. This way tearing events are
always handled in the core resulting in simplification of
the panel drivers.

The TE GPIO acquisition follows works in the same way as the
exynos DSI implementation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 103 +-----------
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 146 ++++++++++++++++--
 2 files changed, 141 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index aef5d59181fa..35810ec65b7a 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -54,7 +54,6 @@ struct panel_drv_data {
 
 	/* panel HW configuration from DT or platform data */
 	struct gpio_desc *reset_gpio;
-	struct gpio_desc *ext_te_gpio;
 
 	struct regulator_bulk_data supplies[DCS_REGULATOR_SUPPLY_NUM];
 
@@ -66,12 +65,6 @@ struct panel_drv_data {
 	/* runtime variables */
 	bool enabled;
 
-	bool te_enabled;
-
-	atomic_t do_update;
-
-	struct delayed_work te_timeout_work;
-
 	bool intro_printed;
 
 	struct workqueue_struct *workqueue;
@@ -83,8 +76,6 @@ struct panel_drv_data {
 
 #define to_panel_data(p) container_of(p, struct panel_drv_data, dssdev)
 
-static irqreturn_t dsicm_te_isr(int irq, void *data);
-static void dsicm_te_timeout_work_callback(struct work_struct *work);
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable);
 
 static int dsicm_panel_reset(struct panel_drv_data *ddata);
@@ -240,9 +231,6 @@ static int dsicm_enter_ulps(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	if (ddata->ext_te_gpio)
-		disable_irq(gpiod_to_irq(ddata->ext_te_gpio));
-
 	src->ops->dsi.disable(src, false, true);
 
 	ddata->ulps_enabled = true;
@@ -277,9 +265,6 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 		goto err2;
 	}
 
-	if (ddata->ext_te_gpio)
-		enable_irq(gpiod_to_irq(ddata->ext_te_gpio));
-
 	dsicm_queue_ulps_work(ddata);
 
 	ddata->ulps_enabled = false;
@@ -290,11 +275,8 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 	dev_err(&ddata->dsi->dev, "failed to exit ULPS");
 
 	r = dsicm_panel_reset(ddata);
-	if (!r) {
-		if (ddata->ext_te_gpio)
-			enable_irq(gpiod_to_irq(ddata->ext_te_gpio));
+	if (!r)
 		ddata->ulps_enabled = false;
-	}
 
 	dsicm_queue_ulps_work(ddata);
 
@@ -600,7 +582,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = _dsicm_enable_te(ddata, ddata->te_enabled);
+	r = _dsicm_enable_te(ddata, true);
 	if (r)
 		goto err;
 
@@ -744,43 +726,6 @@ static void dsicm_framedone_cb(int err, void *data)
 	src->ops->dsi.bus_unlock(src);
 }
 
-static irqreturn_t dsicm_te_isr(int irq, void *data)
-{
-	struct panel_drv_data *ddata = data;
-	struct omap_dss_device *src = ddata->src;
-	int old;
-	int r;
-
-	old = atomic_cmpxchg(&ddata->do_update, 1, 0);
-
-	if (old) {
-		cancel_delayed_work(&ddata->te_timeout_work);
-
-		r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
-				ddata);
-		if (r)
-			goto err;
-	}
-
-	return IRQ_HANDLED;
-err:
-	dev_err(&ddata->dsi->dev, "start update failed\n");
-	src->ops->dsi.bus_unlock(src);
-	return IRQ_HANDLED;
-}
-
-static void dsicm_te_timeout_work_callback(struct work_struct *work)
-{
-	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
-					te_timeout_work.work);
-	struct omap_dss_device *src = ddata->src;
-
-	dev_err(&ddata->dsi->dev, "TE not received for 250ms!\n");
-
-	atomic_set(&ddata->do_update, 0);
-	src->ops->dsi.bus_unlock(src);
-}
-
 static int dsicm_update(struct omap_dss_device *dssdev,
 				    u16 x, u16 y, u16 w, u16 h)
 {
@@ -808,16 +753,10 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 	if (r)
 		goto err;
 
-	if (ddata->te_enabled && ddata->ext_te_gpio) {
-		schedule_delayed_work(&ddata->te_timeout_work,
-				msecs_to_jiffies(250));
-		atomic_set(&ddata->do_update, 1);
-	} else {
-		r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
-				ddata);
-		if (r)
-			goto err;
-	}
+	r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
+			ddata);
+	if (r)
+		goto err;
 
 	/* note: no bus_unlock here. unlock is src framedone_cb */
 	mutex_unlock(&ddata->lock);
@@ -839,8 +778,7 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 	else
 		r = mipi_dsi_dcs_set_tear_off(dsi);
 
-	if (!ddata->ext_te_gpio)
-		src->ops->dsi.enable_te(src, enable);
+	src->ops->dsi.enable_te(src, enable);
 
 	/* possible panel bug */
 	msleep(100);
@@ -933,14 +871,6 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 		return err;
 	}
 
-	ddata->ext_te_gpio = devm_gpiod_get_optional(&dsi->dev, "te",
-						     GPIOD_IN);
-	if (IS_ERR(ddata->ext_te_gpio)) {
-		err = PTR_ERR(ddata->ext_te_gpio);
-		dev_err(&dsi->dev, "TE gpio request failed: %d", err);
-		return err;
-	}
-
 	err = of_get_display_timing(node, "panel-timing", &timing);
 	if (!err) {
 		videomode_from_timing(&timing, &ddata->vm);
@@ -1023,25 +953,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 
 	mutex_init(&ddata->lock);
 
-	atomic_set(&ddata->do_update, 0);
-
-	if (ddata->ext_te_gpio) {
-		r = devm_request_irq(dev, gpiod_to_irq(ddata->ext_te_gpio),
-				dsicm_te_isr,
-				IRQF_TRIGGER_RISING,
-				"taal vsync", ddata);
-
-		if (r) {
-			dev_err(dev, "IRQ request failed\n");
-			goto err_reg;
-		}
-
-		INIT_DEFERRABLE_WORK(&ddata->te_timeout_work,
-					dsicm_te_timeout_work_callback);
-
-		dev_dbg(dev, "Using GPIO TE\n");
-	}
-
 	ddata->workqueue = create_singlethread_workqueue("dsicm_wq");
 	if (!ddata->workqueue) {
 		r = -ENOMEM;
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 352c16a37476..b26cbedd7e76 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -14,7 +14,9 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
 #include <linux/semaphore.h>
@@ -368,6 +370,12 @@ struct dsi_data {
 	unsigned int update_bytes;
 #endif
 
+	/* external TE GPIO */
+	struct gpio_desc *te_gpio;
+	int te_irq;
+	struct delayed_work te_timeout_work;
+	atomic_t do_ext_te_update;
+
 	bool te_enabled;
 	bool ulps_enabled;
 
@@ -3826,19 +3834,12 @@ static void dsi_framedone_irq_callback(void *data)
 	dsi_handle_framedone(dsi, 0);
 }
 
-static int dsi_update(struct omap_dss_device *dssdev, int channel,
-		void (*callback)(int, void *), void *data)
+static int _dsi_update(struct dsi_data *dsi)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
 	u16 dw, dh;
 
 	dsi_perf_mark_setup(dsi);
 
-	dsi->update_channel = channel;
-
-	dsi->framedone_callback = callback;
-	dsi->framedone_data = data;
-
 	dw = dsi->vm.hactive;
 	dh = dsi->vm.vactive;
 
@@ -3851,6 +3852,26 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
 	return 0;
 }
 
+static int dsi_update(struct omap_dss_device *dssdev, int channel,
+		void (*callback)(int, void *), void *data)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+
+	dsi->update_channel = channel;
+	dsi->framedone_callback = callback;
+	dsi->framedone_data = data;
+
+	if (dsi->te_enabled && dsi->te_gpio) {
+		schedule_delayed_work(&dsi->te_timeout_work,
+				      msecs_to_jiffies(250));
+		atomic_set(&dsi->do_ext_te_update, 1);
+	} else {
+		_dsi_update(dsi);
+	}
+
+	return 0;
+}
+
 /* Display funcs */
 
 static int dsi_configure_dispc_clocks(struct dsi_data *dsi)
@@ -4094,6 +4115,14 @@ static int dsi_enable_te(struct omap_dss_device *dssdev, bool enable)
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 
 	dsi->te_enabled = enable;
+
+	if (dsi->te_gpio) {
+		if (enable)
+			enable_irq(dsi->te_irq);
+		else
+			disable_irq(dsi->te_irq);
+	}
+
 	return 0;
 }
 
@@ -4770,11 +4799,96 @@ static const struct omap_dss_device_ops dsi_ops = {
 	},
 };
 
+static irqreturn_t omap_dsi_te_irq_handler(int irq, void *dev_id)
+{
+	struct dsi_data *dsi = (struct dsi_data *)dev_id;
+	int old;
+
+	old = atomic_cmpxchg(&dsi->do_ext_te_update, 1, 0);
+	if (old) {
+		cancel_delayed_work(&dsi->te_timeout_work);
+		_dsi_update(dsi);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void omap_dsi_te_timeout_work_callback(struct work_struct *work)
+{
+	struct dsi_data *dsi =
+		container_of(work, struct dsi_data, te_timeout_work.work);
+	int old;
+
+	old = atomic_cmpxchg(&dsi->do_ext_te_update, 1, 0);
+	if (old) {
+		dev_err(dsi->dev, "TE not received for 250ms!\n");
+		_dsi_update(dsi);
+	}
+}
+
+static int omap_dsi_register_te_irq(struct dsi_data *dsi,
+				    struct mipi_dsi_device *client)
+{
+	int err;
+	int te_irq;
+
+	dsi->te_gpio = gpiod_get(&client->dev, "te-gpios", GPIOD_IN);
+	if (IS_ERR(dsi->te_gpio)) {
+		err = PTR_ERR(dsi->te_gpio);
+
+		if (err == -ENOENT) {
+			dsi->te_gpio = NULL;
+			return 0;
+		}
+
+		dev_err(dsi->dev, "Could not get TE gpio: %d\n", err);
+		return err;
+	}
+
+	te_irq = gpiod_to_irq(dsi->te_gpio);
+	if (te_irq < 0) {
+		gpiod_put(dsi->te_gpio);
+		dsi->te_gpio = NULL;
+		return -EINVAL;
+	}
+
+	dsi->te_irq = te_irq;
+
+	irq_set_status_flags(te_irq, IRQ_NOAUTOEN);
+
+	err = request_threaded_irq(te_irq, NULL, omap_dsi_te_irq_handler,
+				   IRQF_TRIGGER_RISING, "TE", dsi);
+	if (err) {
+		dev_err(dsi->dev, "request irq failed with %d\n", err);
+		gpiod_put(dsi->te_gpio);
+		dsi->te_gpio = NULL;
+		return err;
+	}
+
+	INIT_DEFERRABLE_WORK(&dsi->te_timeout_work,
+			     omap_dsi_te_timeout_work_callback);
+
+	dev_dbg(dsi->dev, "Using GPIO TE\n");
+
+	return 0;
+}
+
+static void omap_dsi_unregister_te_irq(struct dsi_data *dsi)
+{
+	if (dsi->te_gpio) {
+		free_irq(dsi->te_irq, dsi);
+		cancel_delayed_work(&dsi->te_timeout_work);
+		gpiod_put(dsi->te_gpio);
+		dsi->te_gpio = NULL;
+	}
+}
+
 static int omap_dsi_host_attach(struct mipi_dsi_host *host,
 				struct mipi_dsi_device *client)
 {
 	struct dsi_data *dsi = host_to_omap(host);
 	unsigned int channel = client->channel;
+	int r;
 
 	if (channel > 3)
 		return -EINVAL;
@@ -4789,13 +4903,20 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
 		return -EINVAL;
 	}
 
-	dsi->vc[channel].dest = client;
+	atomic_set(&dsi->do_ext_te_update, 0);
 
-	dsi->pix_fmt = client->format;
-	if (client->mode_flags & MIPI_DSI_MODE_VIDEO)
+	if (client->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		dsi->mode = OMAP_DSS_DSI_VIDEO_MODE;
-	else
+	} else {
+		r = omap_dsi_register_te_irq(dsi, client);
+		if (r)
+			return r;
+
 		dsi->mode = OMAP_DSS_DSI_CMD_MODE;
+	}
+
+	dsi->vc[channel].dest = client;
+	dsi->pix_fmt = client->format;
 
 	return 0;
 }
@@ -4812,6 +4933,7 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
 	if (dsi->vc[channel].dest != client)
 		return -EINVAL;
 
+	omap_dsi_unregister_te_irq(dsi);
 	dsi->vc[channel].dest = NULL;
 	return 0;
 }
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
