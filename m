Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D088CF5E5
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 22:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B988C10F604;
	Sun, 26 May 2024 20:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Hpb/GqXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA1910F5FE
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 20:21:49 +0000 (UTC)
X-Envelope-To: rfoss@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716754907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87fIpgbGwdhS5FrWhOSnA+tHDbj1MPcg1fL+IsJITSA=;
 b=Hpb/GqXwuDHddpVA10W3iCK+MKEUhx5JHy9I6AQ4+hY5IwlaQYagKevhFmiiRQiLwtwJYw
 CU4t8ZLiplk7BWrQ2nAlku8OKhCyLuNESw8Fy5JjFkSb6SBDlpmkU4Kmgrp0vCFP4VTNN2
 /E3HIAXrb5G2z1nsfgG/jGwHqeEVFfU=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v6 02/10] drm/bridge: Set firmware node of drm_bridge
 instances automatically
Date: Mon, 27 May 2024 04:21:07 +0800
Message-Id: <20240526202115.129049-3-sui.jingfeng@linux.dev>
In-Reply-To: <20240526202115.129049-1-sui.jingfeng@linux.dev>
References: <20240526202115.129049-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Normally, the drm_bridge::of_node won't be used by bridge driver instances
themselves. Rather, it is mainly used by other modules to find associated
drm bridge drvier. Therefore, adding a drm bridge to the global bridge list
and setting 'of_node' field of a drm bridge share the same goal. Both are
for finding purpose, therefore better to group them to one function.

Update the drm_bridge_add() interface and implementation to achieve such
goal atomically, new implementation will fetch the device node from the
backing device of the drm bridge driver automatically. For the majority
cases, which is one device backing one drm bridge driver, this model works
well. Drivers still can set it manually by passing NULL if this model
doesn't fit.

While at it, Add a 'struct device *' pointer to the drm_bridge structure.
As it already being passed in by both of drm_bridge_add() and
devm_drm_bridge_add(). A lot of driver instances has already added it into
their derived structure, promote it into drm_bridge core helps to reduce
a batch of boilerplates.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c     |  3 +--
 .../gpu/drm/bridge/analogix/analogix-anx6345.c   |  4 +---
 .../gpu/drm/bridge/analogix/analogix-anx78xx.c   |  4 +---
 drivers/gpu/drm/bridge/analogix/anx7625.c        |  3 +--
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c   |  3 +--
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c  |  3 +--
 drivers/gpu/drm/bridge/chipone-icn6211.c         |  5 ++---
 drivers/gpu/drm/bridge/chrontel-ch7033.c         |  3 +--
 drivers/gpu/drm/bridge/cros-ec-anx7688.c         |  4 +---
 drivers/gpu/drm/bridge/display-connector.c       |  3 +--
 drivers/gpu/drm/bridge/fsl-ldb.c                 |  3 +--
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c      |  3 ++-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c     |  3 +--
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c  |  3 ++-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c  |  3 +--
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c     |  3 +--
 drivers/gpu/drm/bridge/ite-it6505.c              |  3 +--
 drivers/gpu/drm/bridge/ite-it66121.c             |  3 +--
 drivers/gpu/drm/bridge/lontium-lt8912b.c         |  3 +--
 drivers/gpu/drm/bridge/lontium-lt9211.c          |  3 +--
 drivers/gpu/drm/bridge/lontium-lt9611.c          |  3 +--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c       |  3 +--
 drivers/gpu/drm/bridge/lvds-codec.c              |  3 +--
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  3 +--
 drivers/gpu/drm/bridge/microchip-lvds.c          |  3 +--
 drivers/gpu/drm/bridge/nwl-dsi.c                 |  3 +--
 drivers/gpu/drm/bridge/nxp-ptn3460.c             |  3 +--
 drivers/gpu/drm/bridge/panel.c                   |  3 +--
 drivers/gpu/drm/bridge/parade-ps8622.c           |  3 +--
 drivers/gpu/drm/bridge/parade-ps8640.c           |  1 -
 drivers/gpu/drm/bridge/samsung-dsim.c            |  3 +--
 drivers/gpu/drm/bridge/sii902x.c                 |  3 +--
 drivers/gpu/drm/bridge/sii9234.c                 |  3 +--
 drivers/gpu/drm/bridge/sil-sii8620.c             |  3 +--
 drivers/gpu/drm/bridge/simple-bridge.c           |  3 +--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c        |  3 +--
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c    |  3 +--
 drivers/gpu/drm/bridge/tc358762.c                |  3 +--
 drivers/gpu/drm/bridge/tc358764.c                |  3 +--
 drivers/gpu/drm/bridge/tc358767.c                |  3 +--
 drivers/gpu/drm/bridge/tc358768.c                |  3 +--
 drivers/gpu/drm/bridge/tc358775.c                |  3 +--
 drivers/gpu/drm/bridge/thc63lvd1024.c            |  3 +--
 drivers/gpu/drm/bridge/ti-dlpc3433.c             |  3 +--
 drivers/gpu/drm/bridge/ti-sn65dsi83.c            |  3 +--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c            |  3 +--
 drivers/gpu/drm/bridge/ti-tfp410.c               |  3 +--
 drivers/gpu/drm/bridge/ti-tpd12s015.c            |  3 +--
 drivers/gpu/drm/drm_bridge.c                     | 16 ++++++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_mic.c          |  3 +--
 drivers/gpu/drm/i2c/tda998x_drv.c                |  5 +----
 drivers/gpu/drm/mcde/mcde_dsi.c                  |  3 +--
 drivers/gpu/drm/mediatek/mtk_dsi.c               |  3 +--
 drivers/gpu/drm/mediatek/mtk_hdmi.c              |  3 +--
 drivers/gpu/drm/meson/meson_encoder_cvbs.c       |  3 +--
 drivers/gpu/drm/meson/meson_encoder_dsi.c        |  3 +--
 drivers/gpu/drm/meson/meson_encoder_hdmi.c       |  3 +--
 drivers/gpu/drm/omapdrm/dss/dpi.c                |  3 +--
 drivers/gpu/drm/omapdrm/dss/dsi.c                |  3 +--
 drivers/gpu/drm/omapdrm/dss/hdmi4.c              |  3 +--
 drivers/gpu/drm/omapdrm/dss/hdmi5.c              |  3 +--
 drivers/gpu/drm/omapdrm/dss/sdi.c                |  3 +--
 drivers/gpu/drm/omapdrm/dss/venc.c               |  3 +--
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c      |  3 +--
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c  |  3 +--
 drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c |  3 +--
 drivers/gpu/drm/sti/sti_dvo.c                    |  3 +--
 drivers/gpu/drm/vc4/vc4_dsi.c                    |  5 +----
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c              |  2 +-
 include/drm/drm_bridge.h                         |  4 +++-
 70 files changed, 87 insertions(+), 143 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 3cd130965e9d..a5b9d4aff3ab 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1319,10 +1319,9 @@ static int adv7511_probe(struct i2c_client *i2c)
 	if (adv7511->i2c_main->irq)
 		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
 
-	adv7511->bridge.of_node = dev->of_node;
 	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
-	drm_bridge_add(&adv7511->bridge);
+	drm_bridge_add(&adv7511->bridge, dev);
 
 	adv7511_audio_init(dev, adv7511);
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index b754947e3e00..1207d02072be 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -697,8 +697,6 @@ static int anx6345_i2c_probe(struct i2c_client *client)
 
 	mutex_init(&anx6345->lock);
 
-	anx6345->bridge.of_node = client->dev.of_node;
-
 	anx6345->client = client;
 	i2c_set_clientdata(client, anx6345);
 
@@ -766,7 +764,7 @@ static int anx6345_i2c_probe(struct i2c_client *client)
 	anx6345_poweron(anx6345);
 	if (anx6345_get_chip_id(anx6345)) {
 		anx6345->bridge.funcs = &anx6345_bridge_funcs;
-		drm_bridge_add(&anx6345->bridge);
+		drm_bridge_add(&anx6345->bridge, dev);
 
 		return 0;
 	} else {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index f74694bb9c50..6beb2ef2e037 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1228,8 +1228,6 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
 
 	mutex_init(&anx78xx->lock);
 
-	anx78xx->bridge.of_node = client->dev.of_node;
-
 	anx78xx->client = client;
 	i2c_set_clientdata(client, anx78xx);
 
@@ -1335,7 +1333,7 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
 
 	anx78xx->bridge.funcs = &anx78xx_bridge_funcs;
 
-	drm_bridge_add(&anx78xx->bridge);
+	drm_bridge_add(&anx78xx->bridge, &client->dev);
 
 	/* If cable is pulled out, just poweroff and wait for HPD event */
 	if (!gpiod_get_value(anx78xx->pdata.gpiod_hpd))
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 88e4aa5830f3..6942fde64ec7 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2607,7 +2607,6 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
 	}
 
 	platform->bridge.funcs = &anx7625_bridge_funcs;
-	platform->bridge.of_node = dev->of_node;
 	if (!anx7625_of_panel_on_aux_bus(dev))
 		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
 	if (!platform->pdata.panel_bridge)
@@ -2617,7 +2616,7 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
 				    DRM_MODE_CONNECTOR_eDP :
 				    DRM_MODE_CONNECTOR_DisplayPort;
 
-	drm_bridge_add(&platform->bridge);
+	drm_bridge_add(&platform->bridge, dev);
 
 	if (!platform->pdata.is_dpi) {
 		ret = anx7625_attach_dsi(platform);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 7457d38622b0..ece4ae9edc09 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -975,7 +975,7 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	 * register the input to the bridge framework so that it can take place
 	 * in a display pipeline.
 	 */
-	drm_bridge_add(&input->bridge);
+	drm_bridge_add(&input->bridge, dsi->base.dev);
 
 	return 0;
 }
@@ -1227,7 +1227,6 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
 	 */
 	input->id = CDNS_DPI_INPUT;
 	input->bridge.funcs = &cdns_dsi_bridge_funcs;
-	input->bridge.of_node = pdev->dev.of_node;
 
 	/* Mask all interrupts before registering the IRQ handler. */
 	writel(0, dsi->regs + MCTL_MAIN_STS_CTL);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index dee640ab1d3a..dd749faf7986 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2552,7 +2552,6 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	mhdp->display_fmt.color_format = DRM_COLOR_FORMAT_RGB444;
 	mhdp->display_fmt.bpc = 8;
 
-	mhdp->bridge.of_node = pdev->dev.of_node;
 	mhdp->bridge.funcs = &cdns_mhdp_bridge_funcs;
 	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HPD;
@@ -2578,7 +2577,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	if (mhdp->hdcp_supported)
 		cdns_mhdp_hdcp_init(mhdp);
 
-	drm_bridge_add(&mhdp->bridge);
+	drm_bridge_add(&mhdp->bridge, dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 9eecac457dcf..9b8da5b6a0fe 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -702,7 +702,6 @@ static int chipone_common_probe(struct device *dev, struct chipone **icnr)
 
 	icn->bridge.funcs = &chipone_bridge_funcs;
 	icn->bridge.type = DRM_MODE_CONNECTOR_DPI;
-	icn->bridge.of_node = dev->of_node;
 
 	*icnr = icn;
 
@@ -729,7 +728,7 @@ static int chipone_dsi_probe(struct mipi_dsi_device *dsi)
 
 	mipi_dsi_set_drvdata(dsi, icn);
 
-	drm_bridge_add(&icn->bridge);
+	drm_bridge_add(&icn->bridge, dev);
 
 	ret = chipone_dsi_attach(icn);
 	if (ret)
@@ -757,7 +756,7 @@ static int chipone_i2c_probe(struct i2c_client *client)
 	dev_set_drvdata(dev, icn);
 	i2c_set_clientdata(client, icn);
 
-	drm_bridge_add(&icn->bridge);
+	drm_bridge_add(&icn->bridge, dev);
 
 	return chipone_dsi_host_attach(icn);
 }
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index c83486cf6b15..c6374440af7f 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -575,8 +575,7 @@ static int ch7033_probe(struct i2c_client *client)
 
 	INIT_LIST_HEAD(&priv->bridge.list);
 	priv->bridge.funcs = &ch7033_bridge_funcs;
-	priv->bridge.of_node = dev->of_node;
-	drm_bridge_add(&priv->bridge);
+	drm_bridge_add(&priv->bridge, dev);
 
 	dev_info(dev, "Chrontel CH7033 Video Encoder\n");
 	return 0;
diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
index c8abd9920fee..5143ec1a1fd8 100644
--- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
+++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
@@ -143,8 +143,6 @@ static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 	fw_version = (u16)buffer[0] << 8 | buffer[1];
 	dev_info(dev, "ANX7688 firmware version 0x%04x\n", fw_version);
 
-	anx7688->bridge.of_node = dev->of_node;
-
 	/* FW version >= 0.85 supports bandwidth/lane count registers */
 	if (fw_version >= ANX7688_MINIMUM_FW_VERSION)
 		anx7688->filter = true;
@@ -154,7 +152,7 @@ static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 			 fw_version);
 
 	anx7688->bridge.funcs = &cros_ec_anx7688_bridge_funcs;
-	drm_bridge_add(&anx7688->bridge);
+	drm_bridge_add(&anx7688->bridge, dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index ab8e00baf3f1..fb1e97d385fe 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -358,7 +358,6 @@ static int display_connector_probe(struct platform_device *pdev)
 	}
 
 	conn->bridge.funcs = &display_connector_bridge_funcs;
-	conn->bridge.of_node = pdev->dev.of_node;
 
 	if (conn->bridge.ddc)
 		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
@@ -376,7 +375,7 @@ static int display_connector_probe(struct platform_device *pdev)
 		conn->hpd_gpio ? "with" : "without",
 		conn->bridge.ops);
 
-	drm_bridge_add(&conn->bridge);
+	drm_bridge_add(&conn->bridge, &pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0e4bac7dd04f..52d2c71e451c 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -308,7 +308,6 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 
 	fsl_ldb->dev = &pdev->dev;
 	fsl_ldb->bridge.funcs = &funcs;
-	fsl_ldb->bridge.of_node = dev->of_node;
 
 	fsl_ldb->clk = devm_clk_get(dev, "ldb");
 	if (IS_ERR(fsl_ldb->clk))
@@ -368,7 +367,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, fsl_ldb);
 
-	drm_bridge_add(&fsl_ldb->bridge);
+	drm_bridge_add(&fsl_ldb->bridge, dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
index 9b5bebbe357d..a92961d40796 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -206,8 +206,9 @@ void ldb_add_bridge_helper(struct ldb *ldb,
 		ldb_ch->bridge.driver_private = ldb_ch;
 		ldb_ch->bridge.funcs = bridge_funcs;
 		ldb_ch->bridge.of_node = ldb_ch->np;
+		ldb_ch->bridge.fwnode = of_fwnode_handle(ldb_ch->np);
 
-		drm_bridge_add(&ldb_ch->bridge);
+		drm_bridge_add(&ldb_ch->bridge, NULL);
 	}
 }
 EXPORT_SYMBOL_GPL(ldb_add_bridge_helper);
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 073e64dc200c..bfb6617a1ba7 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -165,10 +165,9 @@ static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 
 	/* Register the bridge. */
 	pvi->bridge.funcs = &imx_hdmi_pvi_bridge_funcs;
-	pvi->bridge.of_node = pdev->dev.of_node;
 	pvi->bridge.timings = pvi->next_bridge->timings;
 
-	drm_bridge_add(&pvi->bridge);
+	drm_bridge_add(&pvi->bridge, &pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index e6dbbdc87ce2..a56d7ce08fa0 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -335,9 +335,10 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 		ch->bridge.driver_private = ch;
 		ch->bridge.funcs = &imx8qxp_pc_bridge_funcs;
 		ch->bridge.of_node = child;
+		ch->bridge.fwnode = of_fwnode_handle(child);
 		ch->is_available = true;
 
-		drm_bridge_add(&ch->bridge);
+		drm_bridge_add(&ch->bridge, NULL);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 1d11cc1df43c..542df8c47a42 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -386,9 +386,8 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 
 	pl->bridge.driver_private = pl;
 	pl->bridge.funcs = &imx8qxp_pixel_link_bridge_funcs;
-	pl->bridge.of_node = np;
 
-	drm_bridge_add(&pl->bridge);
+	drm_bridge_add(&pl->bridge, dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index fb7cf4369bb8..9415ea21e6d7 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -443,9 +443,8 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 
 	p2d->bridge.driver_private = p2d;
 	p2d->bridge.funcs = &imx8qxp_pxl2dpi_bridge_funcs;
-	p2d->bridge.of_node = np;
 
-	drm_bridge_add(&p2d->bridge);
+	drm_bridge_add(&p2d->bridge, dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index cd1b5057ddfb..e06907c995d6 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3399,7 +3399,6 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	mutex_init(&it6505->mode_lock);
 	mutex_init(&it6505->aux_lock);
 
-	it6505->bridge.of_node = client->dev.of_node;
 	it6505->connector_status = connector_status_disconnected;
 	it6505->dev = &client->dev;
 	i2c_set_clientdata(client, it6505);
@@ -3471,7 +3470,7 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD;
-	drm_bridge_add(&it6505->bridge);
+	drm_bridge_add(&it6505->bridge, dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 925e42f46cd8..8e4fc082bb8c 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1578,7 +1578,6 @@ static int it66121_probe(struct i2c_client *client)
 	}
 
 	ctx->bridge.funcs = &it66121_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	ctx->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
 	if (client->irq > 0) {
@@ -1596,7 +1595,7 @@ static int it66121_probe(struct i2c_client *client)
 
 	it66121_audio_codec_init(ctx, dev);
 
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add(&ctx->bridge, dev);
 
 	dev_info(ctx->dev, "IT66121 revision %d probed\n", revision_id);
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 1a9defa15663..def161762827 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -777,11 +777,10 @@ static int lt8912_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, lt);
 
 	lt->bridge.funcs = &lt8912_bridge_funcs;
-	lt->bridge.of_node = dev->of_node;
 	lt->bridge.ops = (DRM_BRIDGE_OP_EDID |
 			  DRM_BRIDGE_OP_DETECT);
 
-	drm_bridge_add(&lt->bridge);
+	drm_bridge_add(&lt->bridge, dev);
 
 	ret = lt8912_attach_dsi(lt);
 	if (ret)
diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index c8881796fba4..878bf56326da 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -756,8 +756,7 @@ static int lt9211_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ctx);
 
 	ctx->bridge.funcs = &lt9211_funcs;
-	ctx->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add(&ctx->bridge, dev);
 
 	ret = lt9211_host_attach(ctx);
 	if (ret)
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index b99fe87ec738..7266899607f0 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1114,12 +1114,11 @@ static int lt9611_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, lt9611);
 
 	lt9611->bridge.funcs = &lt9611_bridge_funcs;
-	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES;
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
-	drm_bridge_add(&lt9611->bridge);
+	drm_bridge_add(&lt9611->bridge, dev);
 
 	/* Attach primary DSI */
 	lt9611->dsi0 = lt9611_attach_dsi(lt9611, lt9611->dsi0_node);
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index f864c033ba81..b78e579cbcc6 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -934,13 +934,12 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, lt9611uxc);
 
 	lt9611uxc->bridge.funcs = &lt9611uxc_bridge_funcs;
-	lt9611uxc->bridge.of_node = client->dev.of_node;
 	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
 	if (lt9611uxc->hpd_supported)
 		lt9611uxc->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	lt9611uxc->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
-	drm_bridge_add(&lt9611uxc->bridge);
+	drm_bridge_add(&lt9611uxc->bridge, dev);
 
 	/* Attach primary DSI */
 	lt9611uxc->dsi0 = lt9611uxc_attach_dsi(lt9611uxc, lt9611uxc->dsi0_node);
diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 991732c4b629..672cb797b60f 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -201,9 +201,8 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	 * but we need a bridge attached to our of_node for our user
 	 * to look up.
 	 */
-	lvds_codec->bridge.of_node = dev->of_node;
 	lvds_codec->bridge.timings = &lvds_codec->timings;
-	drm_bridge_add(&lvds_codec->bridge);
+	drm_bridge_add(&lvds_codec->bridge, dev);
 
 	platform_set_drvdata(pdev, lvds_codec);
 
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 37f1acf5c0f8..295be35d1fe5 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -274,8 +274,7 @@ static int ge_b850v3_register(void)
 	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT |
 					 DRM_BRIDGE_OP_EDID;
 	ge_b850v3_lvds_ptr->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-	ge_b850v3_lvds_ptr->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge);
+	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge, dev);
 
 	/* Clear pending interrupts since power up. */
 	i2c_smbus_write_word_data(stdp4028_i2c,
diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index b8313dad6072..e0926073479e 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -190,7 +190,6 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 	if (IS_ERR(lvds->panel_bridge))
 		return PTR_ERR(lvds->panel_bridge);
 
-	lvds->bridge.of_node = dev->of_node;
 	lvds->bridge.type = DRM_MODE_CONNECTOR_LVDS;
 	lvds->bridge.funcs = &mchp_lvds_bridge_funcs;
 
@@ -201,7 +200,7 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	drm_bridge_add(&lvds->bridge);
+	drm_bridge_add(&lvds->bridge, dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 8d54091ec66e..bc3bd8de9d42 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -1182,7 +1182,6 @@ static int nwl_dsi_probe(struct platform_device *pdev)
 
 	dsi->bridge.driver_private = dsi;
 	dsi->bridge.funcs = &nwl_dsi_bridge_funcs;
-	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.timings = &nwl_dsi_timings;
 
 	dev_set_drvdata(dev, dsi);
@@ -1195,7 +1194,7 @@ static int nwl_dsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	drm_bridge_add(&dsi->bridge);
+	drm_bridge_add(&dsi->bridge, dev);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index e77aab965fcf..ef4ccd97b3fd 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -303,8 +303,7 @@ static int ptn3460_probe(struct i2c_client *client)
 	ptn_bridge->bridge.funcs = &ptn3460_bridge_funcs;
 	ptn_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
 	ptn_bridge->bridge.type = DRM_MODE_CONNECTOR_LVDS;
-	ptn_bridge->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ptn_bridge->bridge);
+	drm_bridge_add(&ptn_bridge->bridge, dev);
 
 	i2c_set_clientdata(client, ptn_bridge);
 
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 56c40b516a8f..b0a1d0537ab5 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -299,11 +299,10 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	panel_bridge->panel = panel;
 
 	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
-	panel_bridge->bridge.of_node = panel->dev->of_node;
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
 
-	drm_bridge_add(&panel_bridge->bridge);
+	drm_bridge_add(&panel_bridge->bridge, panel->dev);
 
 	return &panel_bridge->bridge;
 }
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index ae3ab9262ef1..6d743fa70d58 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -511,8 +511,7 @@ static int ps8622_probe(struct i2c_client *client)
 
 	ps8622->bridge.funcs = &ps8622_bridge_funcs;
 	ps8622->bridge.type = DRM_MODE_CONNECTOR_LVDS;
-	ps8622->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ps8622->bridge);
+	drm_bridge_add(&ps8622->bridge, dev);
 
 	i2c_set_clientdata(client, ps8622);
 
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 14d4dcf239da..723e6c7bbe7a 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -663,7 +663,6 @@ static int ps8640_probe(struct i2c_client *client)
 		return PTR_ERR(ps_bridge->gpio_reset);
 
 	ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
-	ps_bridge->bridge.of_node = dev->of_node;
 	ps_bridge->bridge.type = DRM_MODE_CONNECTOR_eDP;
 
 	/*
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 95fedc68b0ae..f388640d7a11 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1739,7 +1739,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 		     mipi_dsi_pixel_format_to_bpp(device->format),
 		     device->mode_flags);
 
-	drm_bridge_add(&dsi->bridge);
+	drm_bridge_add(&dsi->bridge, dev);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
@@ -1987,7 +1987,6 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
-	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 8f84e98249c7..f4808838717a 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1097,14 +1097,13 @@ static int sii902x_init(struct sii902x *sii902x)
 		goto err_unreg_audio;
 
 	sii902x->bridge.funcs = &sii902x_bridge_funcs;
-	sii902x->bridge.of_node = dev->of_node;
 	sii902x->bridge.timings = &default_sii902x_timings;
 	sii902x->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
 
 	if (sii902x->i2c->irq > 0)
 		sii902x->bridge.ops |= DRM_BRIDGE_OP_HPD;
 
-	drm_bridge_add(&sii902x->bridge);
+	drm_bridge_add(&sii902x->bridge, dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index d8373d918324..7d2bbc31bac9 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -922,8 +922,7 @@ static int sii9234_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ctx);
 
 	ctx->bridge.funcs = &sii9234_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add(&ctx->bridge, dev);
 
 	sii9234_cable_in(ctx);
 
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 599164e3877d..d981dfef2bbd 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2336,8 +2336,7 @@ static int sii8620_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ctx);
 
 	ctx->bridge.funcs = &sii8620_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add(&ctx->bridge, dev);
 
 	if (!ctx->extcon)
 		sii8620_cable_in(ctx);
diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 2ca89f313cd1..fd7de9b6f80e 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -205,10 +205,9 @@ static int simple_bridge_probe(struct platform_device *pdev)
 
 	/* Register the bridge. */
 	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
-	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
-	drm_bridge_add(&sbridge->bridge);
+	drm_bridge_add(&sbridge->bridge, &pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 9f2bc932c371..4b8573a96f36 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3525,7 +3525,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 			 | DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.interlace_allowed = true;
 	hdmi->bridge.ddc = hdmi->ddc;
-	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
@@ -3599,7 +3598,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->cec = platform_device_register_full(&pdevinfo);
 	}
 
-	drm_bridge_add(&hdmi->bridge);
+	drm_bridge_add(&hdmi->bridge, dev);
 
 	return hdmi;
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index c4e9d96933dc..0655f72dfaff 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -339,7 +339,7 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	bridge->pre_enable_prev_first = true;
 	dsi->panel_bridge = bridge;
 
-	drm_bridge_add(&dsi->bridge);
+	drm_bridge_add(&dsi->bridge, dsi->dev);
 
 	if (pdata->host_ops && pdata->host_ops->attach) {
 		ret = pdata->host_ops->attach(pdata->priv_data, device);
@@ -1260,7 +1260,6 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 
 	dsi->bridge.driver_private = dsi;
 	dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
-	dsi->bridge.of_node = pdev->dev.of_node;
 
 	return dsi;
 }
diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 46198af9eebb..b2ff45bcec00 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -286,10 +286,9 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 
 	ctx->bridge.funcs = &tc358762_bridge_funcs;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
-	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
 
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add(&ctx->bridge, dev);
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 3d3d135b4348..6afa76ff59b5 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -368,10 +368,9 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 		return ret;
 
 	ctx->bridge.funcs = &tc358764_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
 
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add(&ctx->bridge, dev);
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index fe2b93546eae..bb83e446f9f1 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2462,8 +2462,7 @@ static int tc_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	tc->bridge.of_node = dev->of_node;
-	drm_bridge_add(&tc->bridge);
+	drm_bridge_add(&tc->bridge, dev);
 
 	i2c_set_clientdata(client, tc);
 
diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 0e8813278a2f..40a17fc5b5c2 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -451,7 +451,7 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 	if (ret)
 		priv->pd_lines = priv->dsi_bpp;
 
-	drm_bridge_add(&priv->bridge);
+	drm_bridge_add(&priv->bridge, priv->dev);
 
 	return 0;
 }
@@ -1299,7 +1299,6 @@ static int tc358768_i2c_probe(struct i2c_client *client)
 
 	priv->bridge.funcs = &tc358768_bridge_funcs;
 	priv->bridge.timings = &default_tc358768_timings;
-	priv->bridge.of_node = np;
 
 	i2c_set_clientdata(client, priv);
 
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 3b7cc3be2ccd..3f5a6f356a50 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -706,9 +706,8 @@ static int tc_probe(struct i2c_client *client)
 	}
 
 	tc->bridge.funcs = &tc_bridge_funcs;
-	tc->bridge.of_node = dev->of_node;
 	tc->bridge.pre_enable_prev_first = true;
-	drm_bridge_add(&tc->bridge);
+	drm_bridge_add(&tc->bridge, dev);
 
 	i2c_set_clientdata(client, tc);
 
diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index 674efc489e3a..cb46b8267d35 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -206,11 +206,10 @@ static int thc63_probe(struct platform_device *pdev)
 		return ret;
 
 	thc63->bridge.driver_private = thc63;
-	thc63->bridge.of_node = pdev->dev.of_node;
 	thc63->bridge.funcs = &thc63_bridge_func;
 	thc63->bridge.timings = &thc63->timings;
 
-	drm_bridge_add(&thc63->bridge);
+	drm_bridge_add(&thc63->bridge, &pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index 6b559e071301..d80f5d257fe6 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -366,8 +366,7 @@ static int dlpc3433_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, dlpc);
 
 	dlpc->bridge.funcs = &dlpc_bridge_funcs;
-	dlpc->bridge.of_node = dev->of_node;
-	drm_bridge_add(&dlpc->bridge);
+	drm_bridge_add(&dlpc->bridge, dev);
 
 	ret = dlpc_host_attach(dlpc);
 	if (ret)
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 57a7ed13f996..175ba731de7d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -708,9 +708,8 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ctx);
 
 	ctx->bridge.funcs = &sn65dsi83_funcs;
-	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add(&ctx->bridge, dev);
 
 	ret = sn65dsi83_host_attach(ctx);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 84698a0b27a8..5cc6e2868c82 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1312,14 +1312,13 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 		return ret;
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
-	pdata->bridge.of_node = np;
 	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
 	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
 		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
 
-	drm_bridge_add(&pdata->bridge);
+	drm_bridge_add(&pdata->bridge, pdata->dev);
 
 	ret = ti_sn_attach_host(adev, pdata);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index b1b1e4d5a24a..04a341133488 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -348,7 +348,6 @@ static int tfp410_init(struct device *dev, bool i2c)
 	dev_set_drvdata(dev, dvi);
 
 	dvi->bridge.funcs = &tfp410_bridge_funcs;
-	dvi->bridge.of_node = dev->of_node;
 	dvi->bridge.timings = &dvi->timings;
 	dvi->bridge.type = DRM_MODE_CONNECTOR_DVID;
 
@@ -376,7 +375,7 @@ static int tfp410_init(struct device *dev, bool i2c)
 	}
 
 	/*  Register the DRM bridge. */
-	drm_bridge_add(&dvi->bridge);
+	drm_bridge_add(&dvi->bridge, dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index f9fb35683a27..4210ea39e49d 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -122,7 +122,6 @@ static int tpd12s015_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, tpd);
 
 	tpd->bridge.funcs = &tpd12s015_bridge_funcs;
-	tpd->bridge.of_node = pdev->dev.of_node;
 	tpd->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	tpd->bridge.ops = DRM_BRIDGE_OP_DETECT;
 
@@ -174,7 +173,7 @@ static int tpd12s015_probe(struct platform_device *pdev)
 	}
 
 	/* Register the DRM bridge. */
-	drm_bridge_add(&tpd->bridge);
+	drm_bridge_add(&tpd->bridge, &pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index cef5bc88ee60..7759ca066db4 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -202,11 +202,23 @@ static LIST_HEAD(bridge_list);
  * drm_bridge_add - add the given bridge to the global bridge list
  *
  * @bridge: bridge control structure
+ * @dev: pointer to the kernel device that backing this bridge
  */
-void drm_bridge_add(struct drm_bridge *bridge)
+void drm_bridge_add(struct drm_bridge *bridge, struct device *dev)
 {
 	mutex_init(&bridge->hpd_mutex);
 
+	if (dev) {
+		if (dev->of_node) {
+			bridge->of_node = dev->of_node;
+			bridge->fwnode = of_fwnode_handle(dev->of_node);
+		} else {
+			bridge->fwnode = dev->fwnode;
+		}
+
+		bridge->kdev = dev;
+	}
+
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
 	mutex_unlock(&bridge_lock);
@@ -231,7 +243,7 @@ static void drm_bridge_remove_void(void *bridge)
  */
 int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge)
 {
-	drm_bridge_add(bridge);
+	drm_bridge_add(bridge, dev);
 	return devm_add_action_or_reset(dev, drm_bridge_remove_void, bridge);
 }
 EXPORT_SYMBOL(devm_drm_bridge_add);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index d61ec451807c..c89a02d75e85 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -422,9 +422,8 @@ static int exynos_mic_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mic);
 
 	mic->bridge.funcs = &mic_bridge_funcs;
-	mic->bridge.of_node = dev->of_node;
 
-	drm_bridge_add(&mic->bridge);
+	drm_bridge_add(&mic->bridge, dev);
 
 	pm_runtime_enable(dev);
 
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 2160f05bbd16..e8373e47c2ff 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1989,11 +1989,8 @@ static int tda998x_create(struct device *dev)
 	}
 
 	priv->bridge.funcs = &tda998x_bridge_funcs;
-#ifdef CONFIG_OF
-	priv->bridge.of_node = dev->of_node;
-#endif
 
-	drm_bridge_add(&priv->bridge);
+	drm_bridge_add(&priv->bridge, dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index e2fad1a048b5..518b6cc2a7ed 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1138,8 +1138,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 
 	/* Create a bridge for this DSI channel */
 	d->bridge.funcs = &mcde_dsi_bridge_funcs;
-	d->bridge.of_node = dev->of_node;
-	drm_bridge_add(&d->bridge);
+	drm_bridge_add(&d->bridge, dev);
 
 	/* TODO: first come first serve, use a list */
 	mcde->bridge = &d->bridge;
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index c255559cc56e..86ad0af1092f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -908,7 +908,7 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
 	if (IS_ERR(dsi->next_bridge))
 		return PTR_ERR(dsi->next_bridge);
 
-	drm_bridge_add(&dsi->bridge);
+	drm_bridge_add(&dsi->bridge, dev);
 
 	ret = component_add(host->dev, &mtk_dsi_component_ops);
 	if (ret) {
@@ -1155,7 +1155,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dsi);
 
 	dsi->bridge.funcs = &mtk_dsi_bridge_funcs;
-	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	return 0;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 6e1cca97a654..de91650abd87 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1735,11 +1735,10 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 	}
 
 	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
-	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
-	drm_bridge_add(&hdmi->bridge);
+	drm_bridge_add(&hdmi->bridge, &pdev->dev);
 
 	ret = mtk_hdmi_clk_enable_audio(hdmi);
 	if (ret) {
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index d1191de855d9..25aef4d8b614 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -246,12 +246,11 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 
 	/* CVBS Encoder Bridge */
 	meson_encoder_cvbs->bridge.funcs = &meson_encoder_cvbs_bridge_funcs;
-	meson_encoder_cvbs->bridge.of_node = priv->dev->of_node;
 	meson_encoder_cvbs->bridge.type = DRM_MODE_CONNECTOR_Composite;
 	meson_encoder_cvbs->bridge.ops = DRM_BRIDGE_OP_MODES;
 	meson_encoder_cvbs->bridge.interlace_allowed = true;
 
-	drm_bridge_add(&meson_encoder_cvbs->bridge);
+	drm_bridge_add(&meson_encoder_cvbs->bridge, priv->dev);
 
 	meson_encoder_cvbs->priv = priv;
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 7816902f5907..fc0b26e47579 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -124,10 +124,9 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 
 	/* DSI Encoder Bridge */
 	meson_encoder_dsi->bridge.funcs = &meson_encoder_dsi_bridge_funcs;
-	meson_encoder_dsi->bridge.of_node = priv->dev->of_node;
 	meson_encoder_dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-	drm_bridge_add(&meson_encoder_dsi->bridge);
+	drm_bridge_add(&meson_encoder_dsi->bridge, priv->dev);
 
 	meson_encoder_dsi->priv = priv;
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0593a1cde906..7bd57122c63c 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -393,11 +393,10 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 
 	/* HDMI Encoder Bridge */
 	meson_encoder_hdmi->bridge.funcs = &meson_encoder_hdmi_bridge_funcs;
-	meson_encoder_hdmi->bridge.of_node = priv->dev->of_node;
 	meson_encoder_hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	meson_encoder_hdmi->bridge.interlace_allowed = true;
 
-	drm_bridge_add(&meson_encoder_hdmi->bridge);
+	drm_bridge_add(&meson_encoder_hdmi->bridge, priv->dev);
 
 	meson_encoder_hdmi->priv = priv;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 030f997eccd0..9ddea9546d11 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -561,10 +561,9 @@ static const struct drm_bridge_funcs dpi_bridge_funcs = {
 static void dpi_bridge_init(struct dpi_data *dpi)
 {
 	dpi->bridge.funcs = &dpi_bridge_funcs;
-	dpi->bridge.of_node = dpi->pdev->dev.of_node;
 	dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
 
-	drm_bridge_add(&dpi->bridge);
+	drm_bridge_add(&dpi->bridge, &dpi->pdev->dev);
 }
 
 static void dpi_bridge_cleanup(struct dpi_data *dpi)
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index ea63c64d3a1a..bcb571163754 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4701,10 +4701,9 @@ static const struct drm_bridge_funcs dsi_bridge_funcs = {
 static void dsi_bridge_init(struct dsi_data *dsi)
 {
 	dsi->bridge.funcs = &dsi_bridge_funcs;
-	dsi->bridge.of_node = dsi->host.dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-	drm_bridge_add(&dsi->bridge);
+	drm_bridge_add(&dsi->bridge, dsi->host.dev);
 }
 
 static void dsi_bridge_cleanup(struct dsi_data *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 9b8747d83ee8..8129afe67094 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -506,11 +506,10 @@ static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
 static void hdmi4_bridge_init(struct omap_hdmi *hdmi)
 {
 	hdmi->bridge.funcs = &hdmi4_bridge_funcs;
-	hdmi->bridge.of_node = hdmi->pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_EDID;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
-	drm_bridge_add(&hdmi->bridge);
+	drm_bridge_add(&hdmi->bridge, &hdmi->pdev->dev);
 }
 
 static void hdmi4_bridge_cleanup(struct omap_hdmi *hdmi)
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index c7ae2235ae99..27d884df830c 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -481,11 +481,10 @@ static const struct drm_bridge_funcs hdmi5_bridge_funcs = {
 static void hdmi5_bridge_init(struct omap_hdmi *hdmi)
 {
 	hdmi->bridge.funcs = &hdmi5_bridge_funcs;
-	hdmi->bridge.of_node = hdmi->pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_EDID;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
-	drm_bridge_add(&hdmi->bridge);
+	drm_bridge_add(&hdmi->bridge, &hdmi->pdev->dev.);
 }
 
 static void hdmi5_bridge_cleanup(struct omap_hdmi *hdmi)
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 91eaae3b9481..1b29e7f0aaf7 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -283,10 +283,9 @@ static const struct drm_bridge_funcs sdi_bridge_funcs = {
 static void sdi_bridge_init(struct sdi_device *sdi)
 {
 	sdi->bridge.funcs = &sdi_bridge_funcs;
-	sdi->bridge.of_node = sdi->pdev->dev.of_node;
 	sdi->bridge.type = DRM_MODE_CONNECTOR_LVDS;
 
-	drm_bridge_add(&sdi->bridge);
+	drm_bridge_add(&sdi->bridge, &sdi->pdev->dev);
 }
 
 static void sdi_bridge_cleanup(struct sdi_device *sdi)
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index f163d52a7c7d..93ba64932d2a 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -664,12 +664,11 @@ static const struct drm_bridge_funcs venc_bridge_funcs = {
 static void venc_bridge_init(struct venc_device *venc)
 {
 	venc->bridge.funcs = &venc_bridge_funcs;
-	venc->bridge.of_node = venc->pdev->dev.of_node;
 	venc->bridge.ops = DRM_BRIDGE_OP_MODES;
 	venc->bridge.type = DRM_MODE_CONNECTOR_SVIDEO;
 	venc->bridge.interlace_allowed = true;
 
-	drm_bridge_add(&venc->bridge);
+	drm_bridge_add(&venc->bridge, &venc->pdev->dev);
 }
 
 static void venc_bridge_cleanup(struct venc_device *venc)
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 92ba43a6fe38..472207acc24d 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -896,7 +896,6 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 		return ret;
 
 	lvds->bridge.funcs = &rcar_lvds_bridge_ops;
-	lvds->bridge.of_node = pdev->dev.of_node;
 
 	lvds->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lvds->mmio))
@@ -913,7 +912,7 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	drm_bridge_add(&lvds->bridge);
+	drm_bridge_add(&lvds->bridge, &pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 2dba7c5ffd2c..6fe486856ab2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -918,8 +918,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	/* Initialize the DRM bridge. */
 	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
-	dsi->bridge.of_node = dsi->dev->of_node;
-	drm_bridge_add(&dsi->bridge);
+	drm_bridge_add(&dsi->bridge, dsi->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
index 10febea473cd..5880f1dec92d 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
@@ -636,7 +636,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 		return ret;
 	}
 
-	drm_bridge_add(&dsi->bridge);
+	drm_bridge_add(&dsi->bridge, dsi->dev);
 
 	return 0;
 }
@@ -762,7 +762,6 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	/* Initialize the DRM bridge. */
 	dsi->bridge.funcs = &rzg2l_mipi_dsi_bridge_ops;
-	dsi->bridge.of_node = dsi->dev->of_node;
 
 	/* Init host device */
 	dsi->host.dev = dsi->dev;
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index fd1df4ce3852..26a4e35e37b8 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -460,8 +460,7 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 
 	bridge->driver_private = dvo;
 	bridge->funcs = &sti_dvo_bridge_funcs;
-	bridge->of_node = dvo->dev.of_node;
-	drm_bridge_add(bridge);
+	drm_bridge_add(bridge, &dvo->dev);
 
 	err = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (err)
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 46f6c4ce61c5..1a41b58c74c7 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1379,7 +1379,7 @@ static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 		return 0;
 	}
 
-	drm_bridge_add(&dsi->bridge);
+	drm_bridge_add(&dsi->bridge, &dsi->pdev->dev);
 
 	ret = component_add(&dsi->pdev->dev, &vc4_dsi_ops);
 	if (ret) {
@@ -1815,9 +1815,6 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 
 	dsi->pdev = pdev;
 	dsi->bridge.funcs = &vc4_dsi_bridge_funcs;
-#ifdef CONFIG_OF
-	dsi->bridge.of_node = dev->of_node;
-#endif
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 	dsi->dsi_host.ops = &vc4_dsi_host_ops;
 	dsi->dsi_host.dev = dev;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index face8d6b2a6f..84db44d5b220 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -256,7 +256,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_dp;
 
-	drm_bridge_add(dpsub->bridge);
+	drm_bridge_add(dpsub->bridge, &pdev->dev);
 
 	if (dpsub->dma_enabled) {
 		ret = zynqmp_dpsub_drm_init(dpsub);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 725d6dddaf36..7b592cf30340 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -712,6 +712,8 @@ enum drm_bridge_ops {
 struct drm_bridge {
 	/** @base: inherit from &drm_private_object */
 	struct drm_private_obj base;
+	/** @kdev: pointer to the kernel device that backing this bridge */
+	struct device *kdev;
 	/** @dev: DRM device this bridge belongs to */
 	struct drm_device *dev;
 	/** @encoder: encoder to which this bridge is connected */
@@ -782,7 +784,7 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 	return container_of(priv, struct drm_bridge, base);
 }
 
-void drm_bridge_add(struct drm_bridge *bridge);
+void drm_bridge_add(struct drm_bridge *bridge, struct device *dev);
 int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
-- 
2.34.1

