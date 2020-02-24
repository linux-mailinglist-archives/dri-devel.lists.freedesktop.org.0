Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B2D16BC69
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80E96EA3E;
	Tue, 25 Feb 2020 08:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCAB6E9B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 28140293644
Received: by earth.universe (Postfix, from userid 1000)
 id C88393C0C8D; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 10/56] drm/omap: dsi: drop virtual channel logic
Date: Tue, 25 Feb 2020 00:20:40 +0100
Message-Id: <20200224232126.3385250-11-sebastian.reichel@collabora.com>
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

This drops the virtual channel logic. Afterwards DSI clients
request their channel number and get the virtual channel with
the same number or -EBUSY if already in use.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 11 ++---
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 46 ++++---------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  4 +-
 3 files changed, 12 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 92f510a771fe..ba046a596044 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -769,19 +769,12 @@ static int dsicm_connect(struct omap_dss_device *src,
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
@@ -1216,6 +1209,8 @@ static int dsicm_probe_of(struct platform_device *pdev)
 	struct display_timing timing;
 	int err;
 
+	ddata->channel = TCH;
+
 	ddata->reset_gpio = devm_gpiod_get(&pdev->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ddata->reset_gpio)) {
 		err = PTR_ERR(ddata->reset_gpio);
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 0990777a42f7..8c223b808740 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -350,7 +350,6 @@ struct dsi_data {
 		struct omap_dss_device *dssdev;
 		enum fifo_size tx_fifo_size;
 		enum fifo_size rx_fifo_size;
-		int vc_id;
 	} vc[4];
 
 	struct mutex lock;
@@ -2579,7 +2578,7 @@ static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int channel,
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
-	data_id = data_type | dsi->vc[channel].vc_id << 6;
+	data_id = data_type | channel << 6;
 
 	val = FLD_VAL(data_id, 7, 0) | FLD_VAL(len, 23, 8) |
 		FLD_VAL(ecc, 31, 24);
@@ -2683,7 +2682,7 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int channel, u8 data_type,
 		return -EINVAL;
 	}
 
-	data_id = data_type | dsi->vc[channel].vc_id << 6;
+	data_id = data_type | channel << 6;
 
 	r = (data_id << 0) | (data << 8) | (ecc << 24);
 
@@ -4783,45 +4782,19 @@ static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
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
 
@@ -4832,7 +4805,6 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
 	if ((channel >= 0 && channel <= 3) &&
 		dsi->vc[channel].dssdev == dssdev) {
 		dsi->vc[channel].dssdev = NULL;
-		dsi->vc[channel].vc_id = 0;
 	}
 }
 
@@ -4937,7 +4909,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.enable_te = dsi_enable_te,
 
 		.request_vc = dsi_request_vc,
-		.set_vc_id = dsi_set_vc_id,
 		.release_vc = dsi_release_vc,
 
 		.transfer = omap_dsi_transfer,
@@ -5393,7 +5364,6 @@ static int dsi_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
 		dsi->vc[i].source = DSI_VC_SOURCE_L4;
 		dsi->vc[i].dssdev = NULL;
-		dsi->vc[i].vc_id = 0;
 	}
 
 	r = dsi_get_clocks(dsi);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 787e102eb068..587206c984a9 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -301,9 +301,7 @@ struct omapdss_dsi_ops {
 	void (*disable_video_output)(struct omap_dss_device *dssdev,
 			int channel);
 
-	int (*request_vc)(struct omap_dss_device *dssdev, int *channel);
-	int (*set_vc_id)(struct omap_dss_device *dssdev, int channel,
-			int vc_id);
+	int (*request_vc)(struct omap_dss_device *dssdev, int channel);
 	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
 
 	/* data transfer */
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
