Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF28E2DAB2E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4627F6E213;
	Tue, 15 Dec 2020 10:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1216E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlUZk123951
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029250;
 bh=mQ7Iq0EgxPnLSI/y5pNQgrOsaW9A+vD91vqB0FT2eL8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=myTQkvQ7haYRRBJgqBbTCiPl/G/BZBjAgyiSmQzGEFFtDhEvokdPc3Ec3eGImRWE9
 cPv25sgajL7stjyLnAikHB7OVtxGNBDoaXotwdfycYDnXPLGYo2p6AOet0VuId/fcW
 AJQNljnILU75SaGDA0pe51NY2od7nipXL9c/F0qc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlUKh023140
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:30 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:30 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaG046467;
 Tue, 15 Dec 2020 04:47:29 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 30/84] drm/omap: dsi: Reverse direction of the DSS device
 enable/disable operations
Date: Tue, 15 Dec 2020 12:46:03 +0200
Message-ID: <20201215104657.802264-31-tomi.valkeinen@ti.com>
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

Complete the direction reversal of the DSS device enable/disable
operations started by commit 19b4200d8f4b ("drm/omap: Reverse direction
of the DSS device enable/disable operations").

This effectively drops the requirement of calling DSS specific
code from the DSI panel driver moving it a bit further to a
standard drm_panel driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 74 +++++++++----------
 drivers/gpu/drm/omapdrm/omap_encoder.c        | 28 ++-----
 2 files changed, 45 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index ccaf6ffe4f86..b72930dcbdf4 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -284,27 +284,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
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
-	r = regulator_bulk_enable(ARRAY_SIZE(ddata->supplies), ddata->supplies);
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
 
@@ -359,12 +338,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	dsicm_hw_reset(ddata);
 
-	src->ops->disable(src);
-err_regulators:
-	r = regulator_bulk_disable(ARRAY_SIZE(ddata->supplies), ddata->supplies);
-	if (r)
-		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
-
 	return r;
 }
 
@@ -373,6 +346,8 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 	struct omap_dss_device *src = ddata->src;
 	int r;
 
+	ddata->enabled = false;
+
 	src->ops->dsi.disable_video_output(src, ddata->dsi->channel);
 
 	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
@@ -384,14 +359,6 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 				"error disabling panel, issuing HW reset\n");
 		dsicm_hw_reset(ddata);
 	}
-
-	src->ops->disable(src);
-
-	r = regulator_bulk_disable(ARRAY_SIZE(ddata->supplies), ddata->supplies);
-	if (r)
-		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
-
-	ddata->enabled = false;
 }
 
 static int dsicm_connect(struct omap_dss_device *src,
@@ -411,6 +378,29 @@ static void dsicm_disconnect(struct omap_dss_device *src,
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
+	r = regulator_bulk_enable(ARRAY_SIZE(ddata->supplies), ddata->supplies);
+	if (r)
+		dev_err(&ddata->dsi->dev, "failed to enable supplies: %d\n", r);
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
@@ -445,6 +435,16 @@ static void dsicm_disable(struct omap_dss_device *dssdev)
 	mutex_unlock(&ddata->lock);
 }
 
+static void dsicm_post_disable(struct omap_dss_device *dssdev)
+{
+	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	int r;
+
+	r = regulator_bulk_disable(ARRAY_SIZE(ddata->supplies), ddata->supplies);
+	if (r)
+		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
+}
+
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 {
 	struct mipi_dsi_device *dsi = ddata->dsi;
@@ -498,8 +498,10 @@ static const struct omap_dss_device_ops dsicm_ops = {
 	.connect	= dsicm_connect,
 	.disconnect	= dsicm_disconnect,
 
+	.pre_enable	= dsicm_pre_enable,
 	.enable		= dsicm_enable,
 	.disable	= dsicm_disable,
+	.post_disable	= dsicm_post_disable,
 
 	.get_modes	= dsicm_get_modes,
 	.check_timings	= dsicm_check_timings,
@@ -655,8 +657,6 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
 
 	omapdss_device_unregister(dssdev);
 
-	if (omapdss_device_is_enabled(dssdev))
-		dsicm_disable(dssdev);
 	omapdss_device_disconnect(ddata->src, dssdev);
 
 	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index a2b08d32baad..8ec4206b8e3e 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -136,16 +136,10 @@ static void omap_encoder_disable(struct drm_encoder *encoder)
 	 */
 	omapdss_device_disable(dssdev->next);
 
-	/*
-	 * Disable the internal encoder. This will disable the DSS output. The
-	 * DSI is treated as an exception as DSI pipelines still use the legacy
-	 * flow where the pipeline output controls the encoder.
-	 */
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
-		if (dssdev->ops && dssdev->ops->disable)
-			dssdev->ops->disable(dssdev);
-		dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
-	}
+	/* Disable the internal encoder. This will disable the DSS output. */
+	if (dssdev->ops && dssdev->ops->disable)
+		dssdev->ops->disable(dssdev);
+	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
 
 	/*
 	 * Perform the post-disable operations on the chain of external devices
@@ -165,16 +159,10 @@ static void omap_encoder_enable(struct drm_encoder *encoder)
 	/* Prepare the chain of external devices for pipeline enable. */
 	omapdss_device_pre_enable(dssdev->next);
 
-	/*
-	 * Enable the internal encoder. This will enable the DSS output. The
-	 * DSI is treated as an exception as DSI pipelines still use the legacy
-	 * flow where the pipeline output controls the encoder.
-	 */
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
-		if (dssdev->ops && dssdev->ops->enable)
-			dssdev->ops->enable(dssdev);
-		dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
-	}
+	/* Enable the internal encoder. This will enable the DSS output. */
+	if (dssdev->ops && dssdev->ops->enable)
+		dssdev->ops->enable(dssdev);
+	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
 
 	/*
 	 * Enable the chain of external devices, starting at the one at the
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
