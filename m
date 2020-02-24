Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F081B16BC91
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D096EA5E;
	Tue, 25 Feb 2020 08:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1886E9B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 73756293A63
Received: by earth.universe (Postfix, from userid 1000)
 id 251F03C0C9B; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 24/56] drm/omap: panel-dsi-cm: use bulk regulator API
Date: Tue, 25 Feb 2020 00:20:54 +0100
Message-Id: <20200224232126.3385250-25-sebastian.reichel@collabora.com>
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

Use bulk regulator API to simplify the code. This also switches
from _optional variant to normal variant, which will provide a
dummy regulator (i.e. if some always-enabled regulator is not
described in DT).

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 65 ++++++-------------
 1 file changed, 21 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 199eac88a777..8ad407a4072e 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -32,6 +32,8 @@
 #define DCS_GET_ID2		0xdb
 #define DCS_GET_ID3		0xdc
 
+#define DCS_REGULATOR_SUPPLY_NUM 2
+
 struct panel_drv_data {
 	struct mipi_dsi_device *dsi;
 
@@ -54,8 +56,7 @@ struct panel_drv_data {
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *ext_te_gpio;
 
-	struct regulator *vpnl;
-	struct regulator *vddi;
+	struct regulator_bulk_data supplies[DCS_REGULATOR_SUPPLY_NUM];
 
 	bool use_dsi_backlight;
 
@@ -557,28 +558,16 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 		.lp_clk_max = 10000000,
 	};
 
-	if (ddata->vpnl) {
-		r = regulator_enable(ddata->vpnl);
-		if (r) {
-			dev_err(&ddata->dsi->dev,
-				"failed to enable VPNL: %d\n", r);
-			return r;
-		}
-	}
-
-	if (ddata->vddi) {
-		r = regulator_enable(ddata->vddi);
-		if (r) {
-			dev_err(&ddata->dsi->dev,
-				"failed to enable VDDI: %d\n", r);
-			goto err_vpnl;
-		}
+	r = regulator_bulk_enable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
+	if (r) {
+		dev_err(&ddata->dsi->dev, "failed to enable supplies: %d\n", r);
+		return r;
 	}
 
 	r = src->ops->dsi.set_config(src, &dsi_config);
 	if (r) {
 		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
-		goto err_vddi;
+		goto err_regulators;
 	}
 
 	src->ops->enable(src);
@@ -637,12 +626,10 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	dsicm_hw_reset(ddata);
 
 	src->ops->dsi.disable(src, true, false);
-err_vddi:
-	if (ddata->vddi)
-		regulator_disable(ddata->vddi);
-err_vpnl:
-	if (ddata->vpnl)
-		regulator_disable(ddata->vpnl);
+err_regulators:
+	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
+	if (r)
+		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
 
 	return r;
 }
@@ -666,10 +653,9 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 
 	src->ops->dsi.disable(src, true, false);
 
-	if (ddata->vddi)
-		regulator_disable(ddata->vddi);
-	if (ddata->vpnl)
-		regulator_disable(ddata->vpnl);
+	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
+	if (r)
+		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
 
 	ddata->enabled = false;
 }
@@ -973,21 +959,12 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 	ddata->height_mm = 0;
 	of_property_read_u32(node, "height-mm", &ddata->height_mm);
 
-	ddata->vpnl = devm_regulator_get_optional(&dsi->dev, "vpnl");
-	if (IS_ERR(ddata->vpnl)) {
-		err = PTR_ERR(ddata->vpnl);
-		if (err == -EPROBE_DEFER)
-			return err;
-		ddata->vpnl = NULL;
-	}
-
-	ddata->vddi = devm_regulator_get_optional(&dsi->dev, "vddi");
-	if (IS_ERR(ddata->vddi)) {
-		err = PTR_ERR(ddata->vddi);
-		if (err == -EPROBE_DEFER)
-			return err;
-		ddata->vddi = NULL;
-	}
+	ddata->supplies[0].supply = "vpnl";
+	ddata->supplies[1].supply = "vddi";
+	err = devm_regulator_bulk_get(&dsi->dev, DCS_REGULATOR_SUPPLY_NUM,
+				      ddata->supplies);
+	if (err)
+		return err;
 
 	backlight = of_parse_phandle(node, "backlight", 0);
 	if (backlight) {
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
