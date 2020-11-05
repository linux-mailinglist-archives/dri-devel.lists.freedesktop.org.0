Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A872B2A7E06
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24246EADD;
	Thu,  5 Nov 2020 12:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1E96EADD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:05:11 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C55u9056873;
 Thu, 5 Nov 2020 06:05:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604577905;
 bh=Q6VLHRvcLGK0z9HyPbJvwQHoVlMDJU5lERcLn3Ayg/4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=q61L9xkNtgKAeGg67172anZF/U5zkq4UIbGdsLeGmYjKsPUJbWD74uafG0A0v7KfB
 17AF6l1XDsil2pDgcuawZSoIJZSXYG0epjGXzjrHaUp1/GKGjwA4o58uouyZaSALKS
 5OagUx5Bd6I7ns9gCFDqHtQPmaud4rlaCR22A2lY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C54xj042708
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 06:05:04 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:05:04 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:05:04 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfQ039111;
 Thu, 5 Nov 2020 06:05:02 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 28/56] drm/omap: dsi: untangle ulps ops from enable/disable
Date: Thu, 5 Nov 2020 14:03:05 +0200
Message-ID: <20201105120333.947408-29-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, "H .
 Nikolaus Schaller" <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Create a custom function pointer for ULPS and use it instead of
reusing disable/enable functions for ULPS mode switch. This allows
us to use the common disable/enable functions pointers for DSI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  8 ++--
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 42 ++++++++++++++-----
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  5 +--
 3 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 4be0c9dbcc43..78247dcb1848 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -233,7 +233,7 @@ static int dsicm_enter_ulps(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	src->ops->dsi.disable(src, false, true);
+	src->ops->dsi.ulps(src, true);
 
 	ddata->ulps_enabled = true;
 
@@ -258,7 +258,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 	if (!ddata->ulps_enabled)
 		return 0;
 
-	src->ops->enable(src);
+	src->ops->dsi.ulps(src, false);
 	ddata->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
 	r = _dsicm_enable_te(ddata, ddata->te_enabled);
@@ -586,7 +586,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	dsicm_hw_reset(ddata);
 
-	src->ops->dsi.disable(src, true, false);
+	src->ops->disable(src);
 err_regulators:
 	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
 	if (r)
@@ -612,7 +612,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 		dsicm_hw_reset(ddata);
 	}
 
-	src->ops->dsi.disable(src, true, false);
+	src->ops->disable(src);
 
 	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
 	if (r)
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index d54b743c2b48..937362ade4b4 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4055,13 +4055,10 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
 	}
 }
 
-static void dsi_display_enable(struct omap_dss_device *dssdev)
+static void dsi_display_ulps_enable(struct dsi_data *dsi)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int r;
 
-	DSSDBG("dsi_display_enable\n");
-
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
 	mutex_lock(&dsi->lock);
@@ -4084,16 +4081,19 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 	dsi_runtime_put(dsi);
 err_get_dsi:
 	mutex_unlock(&dsi->lock);
-	DSSDBG("dsi_display_enable FAILED\n");
+	DSSDBG("dsi_display_ulps_enable FAILED\n");
 }
 
-static void dsi_display_disable(struct omap_dss_device *dssdev,
-		bool disconnect_lanes, bool enter_ulps)
+static void dsi_display_enable(struct omap_dss_device *dssdev)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
+	DSSDBG("dsi_display_enable\n");
+	dsi_display_ulps_enable(dsi);
+}
 
-	DSSDBG("dsi_display_disable\n");
-
+static void dsi_display_ulps_disable(struct dsi_data *dsi,
+		bool disconnect_lanes, bool enter_ulps)
+{
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
 	mutex_lock(&dsi->lock);
@@ -4110,6 +4110,27 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
 	mutex_unlock(&dsi->lock);
 }
 
+static void dsi_display_disable(struct omap_dss_device *dssdev)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+
+	DSSDBG("dsi_display_disable\n");
+
+	dsi_display_ulps_disable(dsi, true, false);
+}
+
+static void dsi_ulps(struct omap_dss_device *dssdev, bool enable)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+
+	DSSDBG("dsi_ulps\n");
+
+	if (enable)
+		dsi_display_ulps_disable(dsi, false, true);
+	else
+		dsi_display_ulps_enable(dsi);
+}
+
 static int dsi_enable_te(struct dsi_data *dsi, bool enable)
 {
 	dsi->te_enabled = enable;
@@ -4812,9 +4833,10 @@ static const struct omap_dss_device_ops dsi_ops = {
 	.connect = dsi_connect,
 	.disconnect = dsi_disconnect,
 	.enable = dsi_display_enable,
+	.disable = dsi_display_disable,
 
 	.dsi = {
-		.disable = dsi_display_disable,
+		.ulps = dsi_ulps,
 
 		.set_config = dsi_set_config,
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 43eba2ea1f96..0d82ba34ca89 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -281,10 +281,9 @@ struct omap_dss_writeback_info {
 };
 
 struct omapdss_dsi_ops {
-	void (*disable)(struct omap_dss_device *dssdev, bool disconnect_lanes,
-			bool enter_ulps);
-
 	/* bus configuration */
+	void (*ulps)(struct omap_dss_device *dssdev, bool enable);
+
 	int (*set_config)(struct omap_dss_device *dssdev,
 			const struct omap_dss_dsi_config *cfg);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
