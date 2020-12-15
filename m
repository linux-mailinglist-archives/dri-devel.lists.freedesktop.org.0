Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF922DAB15
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990A86E1BA;
	Tue, 15 Dec 2020 10:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A426E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlE1o010470
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029234;
 bh=K9RBtz8uV4/HCGdUOEYPi/5HJEoc25MQ9IwdsMipCFw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YJiJ27+owdMkI4+Lz8JFvELuObnVPtausn5KVTaMKFTXWVWcKbjYGBfaCLdyvV692
 CYRBp3fhy7N3lwzDDcUuo3WSxZjKVvMpH5duKMb+wLG7DizYBdl1Vj1Ogqo5h0JrTv
 2t5f2UVo0MoBDjhliwJvgXixP/Ri30rAaVpUB0Gw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlExo022723
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:14 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:13 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:13 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwa0046467;
 Tue, 15 Dec 2020 04:47:13 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 14/84] drm/omap: dsi: request VC via mipi_dsi_attach
Date: Tue, 15 Dec 2020 12:45:47 +0200
Message-ID: <20201215104657.802264-15-tomi.valkeinen@ti.com>
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

Drop custom request_vc/release_vc callbacks by using the
generic mipi_dsi_attach/mipi_dsi_detach functions.

To use mipi_dsi_attach() we need to fill in the mipi_dsi_device fields,
and some of these fields overlap with the fields in omap_dss_dsi_config.
In later patches the latter will get dropped.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 24 +++++---
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 61 ++++++++-----------
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  3 -
 3 files changed, 41 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 0a8efa447581..0a2f6c1234a9 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -693,14 +693,6 @@ static int dsicm_connect(struct omap_dss_device *src,
 			 struct omap_dss_device *dst)
 {
 	struct panel_drv_data *ddata = to_panel_data(dst);
-	struct device *dev = &ddata->dsi->dev;
-	int r;
-
-	r = src->ops->dsi.request_vc(src, ddata->channel);
-	if (r) {
-		dev_err(dev, "failed to get virtual channel\n");
-		return r;
-	}
 
 	ddata->src = src;
 	return 0;
@@ -711,7 +703,6 @@ static void dsicm_disconnect(struct omap_dss_device *src,
 {
 	struct panel_drv_data *ddata = to_panel_data(dst);
 
-	src->ops->dsi.release_vc(src, ddata->channel);
 	ddata->src = NULL;
 }
 
@@ -1276,8 +1267,21 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 		goto err_bl;
 	}
 
+	dsi->lanes = 2;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
+			  MIPI_DSI_MODE_EOT_PACKET;
+	dsi->hs_rate = 300000000;
+	dsi->lp_rate = 10000000;
+
+	r = mipi_dsi_attach(dsi);
+	if (r < 0)
+		goto err_dsi_attach;
+
 	return 0;
 
+err_dsi_attach:
+	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
 err_bl:
 	destroy_workqueue(ddata->workqueue);
 err_reg:
@@ -1294,6 +1298,8 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
 
 	dev_dbg(&dsi->dev, "remove\n");
 
+	mipi_dsi_detach(dsi);
+
 	omapdss_device_unregister(dssdev);
 
 	if (omapdss_device_is_enabled(dssdev))
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 6a8579c69157..d960335574f3 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -349,7 +349,7 @@ struct dsi_data {
 
 	struct {
 		enum dsi_vc_source source;
-		struct omap_dss_device *dssdev;
+		struct mipi_dsi_device *dest;
 		enum fifo_size tx_fifo_size;
 		enum fifo_size rx_fifo_size;
 	} vc[4];
@@ -4689,32 +4689,6 @@ static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
 	}
 }
 
-static int dsi_request_vc(struct omap_dss_device *dssdev, int channel)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	if (channel < 0 || channel > 3)
-		return -EINVAL;
-
-	if (dsi->vc[channel].dssdev) {
-		DSSERR("cannot get VC for display %s", dssdev->name);
-		return -EBUSY;
-	}
-
-	dsi->vc[channel].dssdev = dssdev;
-	return 0;
-}
-
-static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	if ((channel >= 0 && channel <= 3) &&
-		dsi->vc[channel].dssdev == dssdev) {
-		dsi->vc[channel].dssdev = NULL;
-	}
-}
-
 static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 				      const struct mipi_dsi_msg *msg)
 {
@@ -4791,23 +4765,40 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.update = dsi_update,
 
 		.enable_te = dsi_enable_te,
-
-		.request_vc = dsi_request_vc,
-		.release_vc = dsi_release_vc,
 	},
 };
 
 static int omap_dsi_host_attach(struct mipi_dsi_host *host,
-			 struct mipi_dsi_device *dsi)
+				struct mipi_dsi_device *client)
 {
-	/* TODO: convert driver from custom binding method to this one */
+	struct dsi_data *dsi = host_to_omap(host);
+	unsigned int channel = client->channel;
+
+	if (channel > 3)
+		return -EINVAL;
+
+	if (dsi->vc[channel].dest) {
+		DSSERR("cannot get VC for display %s", dev_name(&client->dev));
+		return -EBUSY;
+	}
+
+	dsi->vc[channel].dest = client;
 	return 0;
 }
 
 static int omap_dsi_host_detach(struct mipi_dsi_host *host,
-			 struct mipi_dsi_device *dsi)
+				struct mipi_dsi_device *client)
 {
-	/* TODO: convert driver from custom binding method to this one */
+	struct dsi_data *dsi = host_to_omap(host);
+	unsigned int channel = client->channel;
+
+	if (channel > 3)
+		return -EINVAL;
+
+	if (dsi->vc[channel].dest != client)
+		return -EINVAL;
+
+	dsi->vc[channel].dest = NULL;
 	return 0;
 }
 
@@ -5265,7 +5256,7 @@ static int dsi_probe(struct platform_device *pdev)
 	/* DSI VCs initialization */
 	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
 		dsi->vc[i].source = DSI_VC_SOURCE_L4;
-		dsi->vc[i].dssdev = NULL;
+		dsi->vc[i].dest = NULL;
 	}
 
 	r = dsi_get_clocks(dsi);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 96294ccb6376..f77fa2d6a1dc 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -301,9 +301,6 @@ struct omapdss_dsi_ops {
 	int (*enable_video_output)(struct omap_dss_device *dssdev, int channel);
 	void (*disable_video_output)(struct omap_dss_device *dssdev,
 			int channel);
-
-	int (*request_vc)(struct omap_dss_device *dssdev, int channel);
-	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
 };
 
 struct omap_dss_device_ops {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
