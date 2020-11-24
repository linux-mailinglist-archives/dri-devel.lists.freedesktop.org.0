Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7192C267E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230426E440;
	Tue, 24 Nov 2020 12:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A729A6E422
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:47:57 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOClosr033058;
 Tue, 24 Nov 2020 06:47:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222070;
 bh=IxktCOPdv16GUpxZUeDn6+DQFM5phdMvFuLLnOZvQjA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=CGG4PfPDjC8P53V9pMwPaBRFnbZxJ6Zm9c02ljJTLKFmiZFsLu86GTjBBV1+nC+7e
 upFElpmb7fbgtOgdsyXddlcm7C+oLXNbEzuNEkSYleEyX5TVW7sg+s9FqnIj6pvptL
 Ix9wplN5dnMbznRaPiFfByuXkZDtYoBe9tRX3Nbo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCloKR043815
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:47:50 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:50 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpb040922;
 Tue, 24 Nov 2020 06:47:48 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 48/80] drm/omap: dsi: simplify pin config
Date: Tue, 24 Nov 2020 14:45:06 +0200
Message-ID: <20201124124538.660710-49-tomi.valkeinen@ti.com>
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

Simplify DSI pin config, which always originates from DT
nowadays. With the code being fully contained in the DSI
encoder, we can drop the public structure.

Since the function is no longer exposed, it now directly
takes the private DSI data pointer. This drops a pointless
conversion and means the pins can be configured earlier.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 37 ++++++++++-----------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 15 -----------
 2 files changed, 13 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 71dde45ada10..1ea490e4fc9d 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3568,12 +3568,9 @@ static void dsi_proto_timings(struct dsi_data *dsi)
 	}
 }
 
-static int dsi_configure_pins(struct omap_dss_device *dssdev,
-		const struct omap_dsi_pin_config *pin_cfg)
+static int dsi_configure_pins(struct dsi_data *dsi,
+		int num_pins, const u32 *pins)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-	int num_pins;
-	const int *pins;
 	struct dsi_lane_config lanes[DSI_MAX_NR_LANES];
 	int num_lanes;
 	int i;
@@ -3586,9 +3583,6 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
 		DSI_LANE_DATA4,
 	};
 
-	num_pins = pin_cfg->num_pins;
-	pins = pin_cfg->pins;
-
 	if (num_pins < 4 || num_pins > dsi->num_lanes_supported * 2
 			|| num_pins % 2 != 0)
 		return -EINVAL;
@@ -3600,15 +3594,15 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
 
 	for (i = 0; i < num_pins; i += 2) {
 		u8 lane, pol;
-		int dx, dy;
+		u32 dx, dy;
 
 		dx = pins[i];
 		dy = pins[i + 1];
 
-		if (dx < 0 || dx >= dsi->num_lanes_supported * 2)
+		if (dx >= dsi->num_lanes_supported * 2)
 			return -EINVAL;
 
-		if (dy < 0 || dy >= dsi->num_lanes_supported * 2)
+		if (dy >= dsi->num_lanes_supported * 2)
 			return -EINVAL;
 
 		if (dx & 1) {
@@ -5480,9 +5474,8 @@ static int dsi_probe_of(struct dsi_data *dsi)
 	struct property *prop;
 	u32 lane_arr[10];
 	int len, num_pins;
-	int r, i;
+	int r;
 	struct device_node *ep;
-	struct omap_dsi_pin_config pin_cfg;
 
 	ep = of_graph_get_endpoint_by_regs(node, 0, 0);
 	if (!ep)
@@ -5510,11 +5503,7 @@ static int dsi_probe_of(struct dsi_data *dsi)
 		goto err;
 	}
 
-	pin_cfg.num_pins = num_pins;
-	for (i = 0; i < num_pins; ++i)
-		pin_cfg.pins[i] = (int)lane_arr[i];
-
-	r = dsi_configure_pins(&dsi->output, &pin_cfg);
+	r = dsi_configure_pins(dsi, num_pins, lane_arr);
 	if (r) {
 		dev_err(dsi->dev, "failed to configure pins");
 		goto err;
@@ -5727,6 +5716,12 @@ static int dsi_probe(struct platform_device *pdev)
 	dsi->host.ops = &omap_dsi_host_ops;
 	dsi->host.dev = &pdev->dev;
 
+	r = dsi_probe_of(dsi);
+	if (r) {
+		DSSERR("Invalid DSI DT data\n");
+		goto err_pm_disable;
+	}
+
 	r = mipi_dsi_host_register(&dsi->host);
 	if (r < 0) {
 		dev_err(&pdev->dev, "failed to register DSI host: %d\n", r);
@@ -5737,12 +5732,6 @@ static int dsi_probe(struct platform_device *pdev)
 	if (r)
 		goto err_dsi_host_unregister;
 
-	r = dsi_probe_of(dsi);
-	if (r) {
-		DSSERR("Invalid DSI DT data\n");
-		goto err_uninit_output;
-	}
-
 	r = component_add(&pdev->dev, &dsi_component_ops);
 	if (r)
 		goto err_uninit_output;
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index a1236b8ef7ea..4a0826c8fed5 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -243,21 +243,6 @@ struct omap_overlay_manager_info {
 	struct omap_dss_cpr_coefs cpr_coefs;
 };
 
-/* 22 pins means 1 clk lane and 10 data lanes */
-#define OMAP_DSS_MAX_DSI_PINS 22
-
-struct omap_dsi_pin_config {
-	int num_pins;
-	/*
-	 * pin numbers in the following order:
-	 * clk+, clk-
-	 * data1+, data1-
-	 * data2+, data2-
-	 * ...
-	 */
-	int pins[OMAP_DSS_MAX_DSI_PINS];
-};
-
 struct omap_dss_writeback_info {
 	u32 paddr;
 	u32 p_uv_addr;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
