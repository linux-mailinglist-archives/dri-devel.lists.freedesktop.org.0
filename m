Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA27E2DAB38
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13636E1FB;
	Tue, 15 Dec 2020 10:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6A76E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlnGZ124118
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029269;
 bh=azr+RPxrKY8jSi8njpy+0TD1wXq6kDfOMy8i1X3sCHI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=PiFfMmk+FFIjx4yOg188mV1kfeSjd97Y/BQGNURcL+6oHlfgWDE9W5qo7i0iyD5re
 CC77qGX3ev94qX1JWf+SxGu96/K1MmWMpUur4EhR66kNTd9G1LhmyqRdCk5oXzgDgz
 63JWB7xdWHmavOo8IRvNskn8gvlPAEpnAfu1XhEM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlnqZ000782
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:49 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:49 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaY046467;
 Tue, 15 Dec 2020 04:47:48 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 48/84] drm/omap: dsi: simplify pin config
Date: Tue, 15 Dec 2020 12:46:21 +0200
Message-ID: <20201215104657.802264-49-tomi.valkeinen@ti.com>
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
index efa261e4a18a..aeea113e9bbc 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3570,12 +3570,9 @@ static void dsi_proto_timings(struct dsi_data *dsi)
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
@@ -3588,9 +3585,6 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
 		DSI_LANE_DATA4,
 	};
 
-	num_pins = pin_cfg->num_pins;
-	pins = pin_cfg->pins;
-
 	if (num_pins < 4 || num_pins > dsi->num_lanes_supported * 2
 			|| num_pins % 2 != 0)
 		return -EINVAL;
@@ -3602,15 +3596,15 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
 
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
@@ -5477,9 +5471,8 @@ static int dsi_probe_of(struct dsi_data *dsi)
 	struct property *prop;
 	u32 lane_arr[10];
 	int len, num_pins;
-	int r, i;
+	int r;
 	struct device_node *ep;
-	struct omap_dsi_pin_config pin_cfg;
 
 	ep = of_graph_get_endpoint_by_regs(node, 0, 0);
 	if (!ep)
@@ -5507,11 +5500,7 @@ static int dsi_probe_of(struct dsi_data *dsi)
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
@@ -5724,6 +5713,12 @@ static int dsi_probe(struct platform_device *pdev)
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
@@ -5734,12 +5729,6 @@ static int dsi_probe(struct platform_device *pdev)
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
index 76586934df37..22c7576882cc 100644
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
