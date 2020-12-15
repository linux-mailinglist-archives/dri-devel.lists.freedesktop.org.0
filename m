Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFA72DAB13
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B436E1B4;
	Tue, 15 Dec 2020 10:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA556E1B2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAl7Cm123840
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029227;
 bh=C3doUM1uHkU+NvCYGuMFDzkjZOTnimJTe1Z9gsIo+70=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=NSXqmDzEHEnixtlOlCblZgkpxVFisra0H9n7Estbhy3onJznmk3349OGbpXkHVbPW
 nE16LLoPU1ko4SOaq+juQxQPtUHPJDFXXsE25b8K1f953IKrIDCaqwJKLHtJtkLyOE
 rH61fqejGfDOwtoK0giCtdYmEv5hLzKZQH+a3oBU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAl78l130686
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:07 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:07 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwZs046467;
 Tue, 15 Dec 2020 04:47:06 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 08/84] drm/omap: dsi: drop virtual channel logic
Date: Tue, 15 Dec 2020 12:45:41 +0200
Message-ID: <20201215104657.802264-9-tomi.valkeinen@ti.com>
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

This drops the virtual channel logic. Afterwards DSI clients
request their channel number and get the virtual channel with
the same number or -EBUSY if already in use.

The change here is not strictly speaking correct, as it combines the VC
(DSI's "configuration block") and virtual channel ID (the ID sent in the
DSI packets). But as we currently only support a single DSI command mode
panel, this works fine: we always use VC0, and VC ID 0.

This needs more work to support video mode panels, but that can be done
after moving to DRM bridge and panel model, after which we can do that
work with the proper APIs.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 11 ++---
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 46 ++++---------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  4 +-
 3 files changed, 12 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 6dc5a5f32e57..704d0d3309ad 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -768,19 +768,12 @@ static int dsicm_connect(struct omap_dss_device *src,
 	struct device *dev = &ddata->pdev->dev;
 	int r;
 
-	r = src->ops->dsi.request_vc(src, &ddata->channel);
+	r = src->ops->dsi.request_vc(src, ddata->channel);
 	if (r) {
 		dev_err(dev, "failed to get virtual channel\n");
 		return r;
 	}
 
-	r = src->ops->dsi.set_vc_id(src, ddata->channel, TCH);
-	if (r) {
-		dev_err(dev, "failed to set VC_ID\n");
-		src->ops->dsi.release_vc(src, ddata->channel);
-		return r;
-	}
-
 	ddata->src = src;
 	return 0;
 }
@@ -1215,6 +1208,8 @@ static int dsicm_probe_of(struct platform_device *pdev)
 	struct display_timing timing;
 	int err;
 
+	ddata->channel = TCH;
+
 	ddata->reset_gpio = devm_gpiod_get(&pdev->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ddata->reset_gpio)) {
 		err = PTR_ERR(ddata->reset_gpio);
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index d2566992d065..84688e977a5c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -350,7 +350,6 @@ struct dsi_data {
 		struct omap_dss_device *dssdev;
 		enum fifo_size tx_fifo_size;
 		enum fifo_size rx_fifo_size;
-		int vc_id;
 	} vc[4];
 
 	struct mutex lock;
@@ -2581,7 +2580,7 @@ static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int channel,
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
-	data_id = data_type | dsi->vc[channel].vc_id << 6;
+	data_id = data_type | channel << 6;
 
 	val = FLD_VAL(data_id, 7, 0) | FLD_VAL(len, 23, 8) |
 		FLD_VAL(ecc, 31, 24);
@@ -2685,7 +2684,7 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int channel, u8 data_type,
 		return -EINVAL;
 	}
 
-	data_id = data_type | dsi->vc[channel].vc_id << 6;
+	data_id = data_type | channel << 6;
 
 	r = (data_id << 0) | (data << 8) | (ecc << 24);
 
@@ -4787,45 +4786,19 @@ static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
 	}
 }
 
-static int dsi_request_vc(struct omap_dss_device *dssdev, int *channel)
+static int dsi_request_vc(struct omap_dss_device *dssdev, int channel)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
-		if (!dsi->vc[i].dssdev) {
-			dsi->vc[i].dssdev = dssdev;
-			*channel = i;
-			return 0;
-		}
-	}
 
-	DSSERR("cannot get VC for display %s", dssdev->name);
-	return -ENOSPC;
-}
-
-static int dsi_set_vc_id(struct omap_dss_device *dssdev, int channel, int vc_id)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	if (vc_id < 0 || vc_id > 3) {
-		DSSERR("VC ID out of range\n");
-		return -EINVAL;
-	}
-
-	if (channel < 0 || channel > 3) {
-		DSSERR("Virtual Channel out of range\n");
+	if (channel < 0 || channel > 3)
 		return -EINVAL;
-	}
 
-	if (dsi->vc[channel].dssdev != dssdev) {
-		DSSERR("Virtual Channel not allocated to display %s\n",
-			dssdev->name);
-		return -EINVAL;
+	if (dsi->vc[channel].dssdev) {
+		DSSERR("cannot get VC for display %s", dssdev->name);
+		return -EBUSY;
 	}
 
-	dsi->vc[channel].vc_id = vc_id;
-
+	dsi->vc[channel].dssdev = dssdev;
 	return 0;
 }
 
@@ -4836,7 +4809,6 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
 	if ((channel >= 0 && channel <= 3) &&
 		dsi->vc[channel].dssdev == dssdev) {
 		dsi->vc[channel].dssdev = NULL;
-		dsi->vc[channel].vc_id = 0;
 	}
 }
 
@@ -4943,7 +4915,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.enable_te = dsi_enable_te,
 
 		.request_vc = dsi_request_vc,
-		.set_vc_id = dsi_set_vc_id,
 		.release_vc = dsi_release_vc,
 
 		.transfer = omap_dsi_transfer,
@@ -5399,7 +5370,6 @@ static int dsi_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
 		dsi->vc[i].source = DSI_VC_SOURCE_L4;
 		dsi->vc[i].dssdev = NULL;
-		dsi->vc[i].vc_id = 0;
 	}
 
 	r = dsi_get_clocks(dsi);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 88b73188203e..f64af9601752 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -302,9 +302,7 @@ struct omapdss_dsi_ops {
 	void (*disable_video_output)(struct omap_dss_device *dssdev,
 			int channel);
 
-	int (*request_vc)(struct omap_dss_device *dssdev, int *channel);
-	int (*set_vc_id)(struct omap_dss_device *dssdev, int channel,
-			int vc_id);
+	int (*request_vc)(struct omap_dss_device *dssdev, int channel);
 	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
 
 	/* data transfer */
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
