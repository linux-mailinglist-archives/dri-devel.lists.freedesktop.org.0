Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D60A2D2ACF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6CC6E952;
	Tue,  8 Dec 2020 12:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB9C6E952
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:30:05 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTxUX064051;
 Tue, 8 Dec 2020 06:29:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607430599;
 bh=l7cm1XwrM/F/UqJofWy5I/fNSYSt1m1cM8ZbnQnJm90=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=C6HSMmyJ6LT9LXKI4DGCkhg/BYXgVhUjzySPoNVPiWahs3+QOY73EoJfliwvctJt6
 BJfOrpzW80+fznsnD9P3uQtFEkRuZZ2BS0H3PZdIOAunqaXDd9ADiL9ocOl8VNukc3
 Ffn4ZTiiplnQi0bN5XH82AkiRpDhtObu9wNJvuP4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CTx8D037277
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 06:29:59 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:29:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:29:59 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjL095068;
 Tue, 8 Dec 2020 06:29:56 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 07/29] drm/omap: dsi: simplify VC handling
Date: Tue, 8 Dec 2020 14:28:33 +0200
Message-ID: <20201208122855.254819-8-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208122855.254819-1-tomi.valkeinen@ti.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
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
 Sekhar Nori <nsekhar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VC handling has gotten quite tangled up. As the first step to clean
it up, lets define that we only support a single DSI peripheral (which
was really already the case), and we always use VC0 (define VC_DEFAULT
0) register block to send data to the peripheral.

We can thus have a single mipi_dsi_device pointer and remove the
for-loops which made passes over all the four VCs (just the first one
was ever used).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 49 ++++++++-----------------------
 1 file changed, 13 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index c6e044f8bece..5e13478010db 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -360,9 +360,10 @@ struct dsi_data {
 	bool vdds_dsi_enabled;
 	struct regulator *vdds_dsi_reg;
 
+	struct mipi_dsi_device *dsidev;
+
 	struct {
 		enum dsi_vc_source source;
-		struct mipi_dsi_device *dest;
 		enum fifo_size tx_fifo_size;
 		enum fifo_size rx_fifo_size;
 	} vc[4];
@@ -452,6 +453,8 @@ static bool dsi_perf;
 module_param(dsi_perf, bool, 0644);
 #endif
 
+#define VC_DEFAULT 0
+
 #define drm_bridge_to_dsi(bridge) \
 	container_of(bridge, struct dsi_data, bridge)
 
@@ -3716,16 +3719,11 @@ static void dsi_disable_video_output(struct omap_dss_device *dssdev, int channel
 static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
-	unsigned int i;
 
 	dsi_bus_lock(dsi);
 	dsi->video_enabled = false;
 
-	for (i = 0; i < 4; i++) {
-		if (!dsi->vc[i].dest)
-			continue;
-		dsi_disable_video_output(dssdev, i);
-	}
+	dsi_disable_video_output(dssdev, VC_DEFAULT);
 
 	dsi_display_disable(dssdev);
 
@@ -3914,11 +3912,6 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
 		goto err;
 	}
 
-	if (!dsi->vc[channel].dest) {
-		r = -ENODEV;
-		goto err;
-	}
-
 	if (dsi->vm.hactive == 0 || dsi->vm.vactive == 0) {
 		r = -EINVAL;
 		goto err;
@@ -3959,16 +3952,7 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
 
 static int dsi_update_all(struct omap_dss_device *dssdev)
 {
-	unsigned int i;
-	int r;
-
-	for (i = 0; i < 4; i++) {
-		r = dsi_update_channel(dssdev, i);
-		if (r && r != -ENODEV)
-			return r;
-	}
-
-	return r;
+	return dsi_update_channel(dssdev, VC_DEFAULT);
 }
 
 /* Display funcs */
@@ -4196,17 +4180,12 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
-	unsigned int i;
 
 	dsi_bus_lock(dsi);
 
 	dsi_display_enable(dssdev);
 
-	for (i = 0; i < 4; i++) {
-		if (!dsi->vc[i].dest)
-			continue;
-		dsi_enable_video_output(dssdev, i);
-	}
+	dsi_enable_video_output(dssdev, VC_DEFAULT);
 
 	dsi->video_enabled = true;
 
@@ -5095,8 +5074,8 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
 	if (channel > 3)
 		return -EINVAL;
 
-	if (dsi->vc[channel].dest) {
-		DSSERR("cannot get VC for display %s", dev_name(&client->dev));
+	if (dsi->dsidev) {
+		DSSERR("dsi client already attached\n");
 		return -EBUSY;
 	}
 
@@ -5117,7 +5096,7 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
 		dsi->mode = OMAP_DSS_DSI_CMD_MODE;
 	}
 
-	dsi->vc[channel].dest = client;
+	dsi->dsidev = client;
 	dsi->pix_fmt = client->format;
 
 	INIT_DEFERRABLE_WORK(&dsi->ulps_work,
@@ -5149,11 +5128,11 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
 	if (channel > 3)
 		return -EINVAL;
 
-	if (dsi->vc[channel].dest != client)
+	if (WARN_ON(dsi->dsidev != client))
 		return -EINVAL;
 
 	omap_dsi_unregister_te_irq(dsi);
-	dsi->vc[channel].dest = NULL;
+	dsi->dsidev = NULL;
 	return 0;
 }
 
@@ -5685,10 +5664,8 @@ static int dsi_probe(struct platform_device *pdev)
 	}
 
 	/* DSI VCs initialization */
-	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
+	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++)
 		dsi->vc[i].source = DSI_VC_SOURCE_L4;
-		dsi->vc[i].dest = NULL;
-	}
 
 	r = dsi_get_clocks(dsi);
 	if (r)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
