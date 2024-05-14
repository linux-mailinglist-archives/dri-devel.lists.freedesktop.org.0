Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E6B8C58F2
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 17:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389C410E940;
	Tue, 14 May 2024 15:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="s8j2imfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D7F10E401
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 15:41:02 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715701260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfNP57WnX9pl6oJYKjEJ2sUgdgTy1zK7aq7NNRWHH4c=;
 b=s8j2imfzNiXlXSJzj8mxbKwjRnySxRSvyknXOtmC2RT6OSzJaOqXmow0pYgUER1qXDtYOI
 EY9/ztO3ydevrkiDTIMNgvikvHBFGfUx0ntxP8iTdFBD4OHhxrpMT2gAyv0uhg0sdN++qZ
 pSJyNAPDS+hPnor07D4KIotCiCk3K+0=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH 2/2] drm/bridge: Switch to use drm_bridge_add_with_dev()
Date: Tue, 14 May 2024 23:40:45 +0800
Message-ID: <20240514154045.309925-3-sui.jingfeng@linux.dev>
In-Reply-To: <20240514154045.309925-1-sui.jingfeng@linux.dev>
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
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

Normally, the drm_bridge::of_node member won't be used by drm bridge driver
instances, as display driver instances will use the device node fetched
from its backing device directly. The drm_bridge::of_node is mainly for
finding the drm bridge instance associated. Hence, display bridge drivers
don't have to set it manually for the canonical cases.

Let's reduce the boilerplates by using drm_bridge_add_with_dev().

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             | 3 +--
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 4 +---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c       | 4 +---
 drivers/gpu/drm/bridge/analogix/anx7625.c                | 3 +--
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c           | 3 +--
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      | 3 +--
 drivers/gpu/drm/bridge/chipone-icn6211.c                 | 5 ++---
 drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 3 +--
 drivers/gpu/drm/bridge/cros-ec-anx7688.c                 | 4 +---
 drivers/gpu/drm/bridge/display-connector.c               | 3 +--
 drivers/gpu/drm/bridge/fsl-ldb.c                         | 3 +--
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c             | 3 +--
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c          | 3 +--
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c             | 3 +--
 drivers/gpu/drm/bridge/ite-it6505.c                      | 3 +--
 drivers/gpu/drm/bridge/ite-it66121.c                     | 3 +--
 drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 3 +--
 drivers/gpu/drm/bridge/lontium-lt9211.c                  | 3 +--
 drivers/gpu/drm/bridge/lontium-lt9611.c                  | 3 +--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 3 +--
 drivers/gpu/drm/bridge/lvds-codec.c                      | 3 +--
 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 3 +--
 drivers/gpu/drm/bridge/microchip-lvds.c                  | 3 +--
 drivers/gpu/drm/bridge/nwl-dsi.c                         | 3 +--
 drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 3 +--
 drivers/gpu/drm/bridge/panel.c                           | 3 +--
 drivers/gpu/drm/bridge/parade-ps8622.c                   | 3 +--
 drivers/gpu/drm/bridge/parade-ps8640.c                   | 1 -
 drivers/gpu/drm/bridge/samsung-dsim.c                    | 3 +--
 drivers/gpu/drm/bridge/sii902x.c                         | 3 +--
 drivers/gpu/drm/bridge/sii9234.c                         | 3 +--
 drivers/gpu/drm/bridge/sil-sii8620.c                     | 3 +--
 drivers/gpu/drm/bridge/simple-bridge.c                   | 3 +--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                | 3 +--
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c            | 3 +--
 drivers/gpu/drm/bridge/tc358762.c                        | 3 +--
 drivers/gpu/drm/bridge/tc358764.c                        | 3 +--
 drivers/gpu/drm/bridge/tc358767.c                        | 3 +--
 drivers/gpu/drm/bridge/tc358768.c                        | 3 +--
 drivers/gpu/drm/bridge/tc358775.c                        | 3 +--
 drivers/gpu/drm/bridge/thc63lvd1024.c                    | 3 +--
 drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 3 +--
 drivers/gpu/drm/bridge/ti-sn65dsi83.c                    | 3 +--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 3 +--
 drivers/gpu/drm/bridge/ti-tfp410.c                       | 3 +--
 drivers/gpu/drm/bridge/ti-tpd12s015.c                    | 3 +--
 drivers/gpu/drm/i2c/tda998x_drv.c                        | 5 +----
 47 files changed, 47 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 6089b0bb9321..8e4a95584ad8 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1318,10 +1318,9 @@ static int adv7511_probe(struct i2c_client *i2c)
 	if (adv7511->i2c_main->irq)
 		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
 
-	adv7511->bridge.of_node = dev->of_node;
 	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
-	drm_bridge_add(&adv7511->bridge);
+	drm_bridge_add_with_dev(&adv7511->bridge, dev);
 
 	adv7511_audio_init(dev, adv7511);
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index b754947e3e00..f4f3298404d2 100644
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
+		drm_bridge_add_with_dev(&anx6345->bridge, dev);
 
 		return 0;
 	} else {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index f74694bb9c50..f0b7b06a66de 100644
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
+	drm_bridge_add_with_dev(&anx78xx->bridge, &client->dev);
 
 	/* If cable is pulled out, just poweroff and wait for HPD event */
 	if (!gpiod_get_value(anx78xx->pdata.gpiod_hpd))
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 88e4aa5830f3..517547d56667 100644
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
+	drm_bridge_add_with_dev(&platform->bridge, dev);
 
 	if (!platform->pdata.is_dpi) {
 		ret = anx7625_attach_dsi(platform);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 7457d38622b0..4eb22ad229e0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -975,7 +975,7 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	 * register the input to the bridge framework so that it can take place
 	 * in a display pipeline.
 	 */
-	drm_bridge_add(&input->bridge);
+	drm_bridge_add_with_dev(&input->bridge, dsi->base.dev);
 
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
index dee640ab1d3a..4382b6cf76ef 100644
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
+	drm_bridge_add_with_dev(&mhdp->bridge, dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 9eecac457dcf..cda758edd912 100644
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
+	drm_bridge_add_with_dev(&icn->bridge, dev);
 
 	ret = chipone_dsi_attach(icn);
 	if (ret)
@@ -757,7 +756,7 @@ static int chipone_i2c_probe(struct i2c_client *client)
 	dev_set_drvdata(dev, icn);
 	i2c_set_clientdata(client, icn);
 
-	drm_bridge_add(&icn->bridge);
+	drm_bridge_add_with_dev(&icn->bridge, dev);
 
 	return chipone_dsi_host_attach(icn);
 }
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index c83486cf6b15..ec40e61a0bf8 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -575,8 +575,7 @@ static int ch7033_probe(struct i2c_client *client)
 
 	INIT_LIST_HEAD(&priv->bridge.list);
 	priv->bridge.funcs = &ch7033_bridge_funcs;
-	priv->bridge.of_node = dev->of_node;
-	drm_bridge_add(&priv->bridge);
+	drm_bridge_add_with_dev(&priv->bridge, dev);
 
 	dev_info(dev, "Chrontel CH7033 Video Encoder\n");
 	return 0;
diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
index c8abd9920fee..0962d9e637ce 100644
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
+	drm_bridge_add_with_dev(&anx7688->bridge, dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index ab8e00baf3f1..5e822bdac78b 100644
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
+	drm_bridge_add_with_dev(&conn->bridge, &pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0e4bac7dd04f..7b11b2c74774 100644
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
+	drm_bridge_add_with_dev(&fsl_ldb->bridge, dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 073e64dc200c..fb2146f525d2 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -165,10 +165,9 @@ static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 
 	/* Register the bridge. */
 	pvi->bridge.funcs = &imx_hdmi_pvi_bridge_funcs;
-	pvi->bridge.of_node = pdev->dev.of_node;
 	pvi->bridge.timings = pvi->next_bridge->timings;
 
-	drm_bridge_add(&pvi->bridge);
+	drm_bridge_add_with_dev(&pvi->bridge, &pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 1d11cc1df43c..e8ab951420c1 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -386,9 +386,8 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 
 	pl->bridge.driver_private = pl;
 	pl->bridge.funcs = &imx8qxp_pixel_link_bridge_funcs;
-	pl->bridge.of_node = np;
 
-	drm_bridge_add(&pl->bridge);
+	drm_bridge_add_with_dev(&pl->bridge, dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index fb7cf4369bb8..15700fab7a27 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -443,9 +443,8 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 
 	p2d->bridge.driver_private = p2d;
 	p2d->bridge.funcs = &imx8qxp_pxl2dpi_bridge_funcs;
-	p2d->bridge.of_node = np;
 
-	drm_bridge_add(&p2d->bridge);
+	drm_bridge_add_with_dev(&p2d->bridge, dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 469157341f3a..b9b519d01e36 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3374,7 +3374,6 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	mutex_init(&it6505->mode_lock);
 	mutex_init(&it6505->aux_lock);
 
-	it6505->bridge.of_node = client->dev.of_node;
 	it6505->connector_status = connector_status_disconnected;
 	it6505->dev = &client->dev;
 	i2c_set_clientdata(client, it6505);
@@ -3446,7 +3445,7 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD;
-	drm_bridge_add(&it6505->bridge);
+	drm_bridge_add_with_dev(&it6505->bridge, dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 925e42f46cd8..54475559cd8d 100644
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
+	drm_bridge_add_with_dev(&ctx->bridge, dev);
 
 	dev_info(ctx->dev, "IT66121 revision %d probed\n", revision_id);
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 1a9defa15663..c774c98acb24 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -777,11 +777,10 @@ static int lt8912_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, lt);
 
 	lt->bridge.funcs = &lt8912_bridge_funcs;
-	lt->bridge.of_node = dev->of_node;
 	lt->bridge.ops = (DRM_BRIDGE_OP_EDID |
 			  DRM_BRIDGE_OP_DETECT);
 
-	drm_bridge_add(&lt->bridge);
+	drm_bridge_add_with_dev(&lt->bridge, dev);
 
 	ret = lt8912_attach_dsi(lt);
 	if (ret)
diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index c8881796fba4..c5d885503524 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -756,8 +756,7 @@ static int lt9211_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ctx);
 
 	ctx->bridge.funcs = &lt9211_funcs;
-	ctx->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add_with_dev(&ctx->bridge, dev);
 
 	ret = lt9211_host_attach(ctx);
 	if (ret)
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index b99fe87ec738..48e3c078b4c2 100644
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
+	drm_bridge_add_with_dev(&lt9611->bridge, dev);
 
 	/* Attach primary DSI */
 	lt9611->dsi0 = lt9611_attach_dsi(lt9611, lt9611->dsi0_node);
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index f864c033ba81..0ded3ec84958 100644
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
+	drm_bridge_add_with_dev(&lt9611uxc->bridge, dev);
 
 	/* Attach primary DSI */
 	lt9611uxc->dsi0 = lt9611uxc_attach_dsi(lt9611uxc, lt9611uxc->dsi0_node);
diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 991732c4b629..25106dac0b7b 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -201,9 +201,8 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	 * but we need a bridge attached to our of_node for our user
 	 * to look up.
 	 */
-	lvds_codec->bridge.of_node = dev->of_node;
 	lvds_codec->bridge.timings = &lvds_codec->timings;
-	drm_bridge_add(&lvds_codec->bridge);
+	drm_bridge_add_with_dev(&lvds_codec->bridge, dev);
 
 	platform_set_drvdata(pdev, lvds_codec);
 
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 37f1acf5c0f8..765434b61556 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -274,8 +274,7 @@ static int ge_b850v3_register(void)
 	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT |
 					 DRM_BRIDGE_OP_EDID;
 	ge_b850v3_lvds_ptr->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-	ge_b850v3_lvds_ptr->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge);
+	drm_bridge_add_with_dev(&ge_b850v3_lvds_ptr->bridge, dev);
 
 	/* Clear pending interrupts since power up. */
 	i2c_smbus_write_word_data(stdp4028_i2c,
diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index b8313dad6072..9d3327bc9fde 100644
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
+	drm_bridge_add_with_dev(&lvds->bridge, dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 8d54091ec66e..7a022ddd55eb 100644
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
+	drm_bridge_add_with_dev(&dsi->bridge, dev);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index e77aab965fcf..3b2517f93aab 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -303,8 +303,7 @@ static int ptn3460_probe(struct i2c_client *client)
 	ptn_bridge->bridge.funcs = &ptn3460_bridge_funcs;
 	ptn_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
 	ptn_bridge->bridge.type = DRM_MODE_CONNECTOR_LVDS;
-	ptn_bridge->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ptn_bridge->bridge);
+	drm_bridge_add_with_dev(&ptn_bridge->bridge, dev);
 
 	i2c_set_clientdata(client, ptn_bridge);
 
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 56c40b516a8f..72388c6189eb 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -299,11 +299,10 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	panel_bridge->panel = panel;
 
 	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
-	panel_bridge->bridge.of_node = panel->dev->of_node;
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
 
-	drm_bridge_add(&panel_bridge->bridge);
+	drm_bridge_add_with_dev(&panel_bridge->bridge, panel->dev);
 
 	return &panel_bridge->bridge;
 }
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index ae3ab9262ef1..7c6399b5702d 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -511,8 +511,7 @@ static int ps8622_probe(struct i2c_client *client)
 
 	ps8622->bridge.funcs = &ps8622_bridge_funcs;
 	ps8622->bridge.type = DRM_MODE_CONNECTOR_LVDS;
-	ps8622->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ps8622->bridge);
+	drm_bridge_add_with_dev(&ps8622->bridge, dev);
 
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
index 95fedc68b0ae..3d61763aab0b 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1739,7 +1739,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 		     mipi_dsi_pixel_format_to_bpp(device->format),
 		     device->mode_flags);
 
-	drm_bridge_add(&dsi->bridge);
+	drm_bridge_add_with_dev(&dsi->bridge, dev);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
@@ -1987,7 +1987,6 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
-	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 8f84e98249c7..98dbff206999 100644
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
+	drm_bridge_add_with_dev(&sii902x->bridge, dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index d8373d918324..e5bc301b6d07 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -922,8 +922,7 @@ static int sii9234_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ctx);
 
 	ctx->bridge.funcs = &sii9234_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add_with_dev(&ctx->bridge, dev);
 
 	sii9234_cable_in(ctx);
 
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 599164e3877d..5ab3651ee020 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2336,8 +2336,7 @@ static int sii8620_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ctx);
 
 	ctx->bridge.funcs = &sii8620_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add_with_dev(&ctx->bridge, dev);
 
 	if (!ctx->extcon)
 		sii8620_cable_in(ctx);
diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 2ca89f313cd1..bfbb2c6bab5e 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -205,10 +205,9 @@ static int simple_bridge_probe(struct platform_device *pdev)
 
 	/* Register the bridge. */
 	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
-	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
-	drm_bridge_add(&sbridge->bridge);
+	drm_bridge_add_with_dev(&sbridge->bridge,  &pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 9f2bc932c371..8ea04e0b9198 100644
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
+	drm_bridge_add_with_dev(&hdmi->bridge, dev);
 
 	return hdmi;
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index c4e9d96933dc..b66bdcdcd580 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -339,7 +339,7 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	bridge->pre_enable_prev_first = true;
 	dsi->panel_bridge = bridge;
 
-	drm_bridge_add(&dsi->bridge);
+	drm_bridge_add_with_dev(&dsi->bridge, dsi->dev);
 
 	if (pdata->host_ops && pdata->host_ops->attach) {
 		ret = pdata->host_ops->attach(pdata->priv_data, device);
@@ -1260,7 +1260,6 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 
 	dsi->bridge.driver_private = dsi;
 	dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
-	dsi->bridge.of_node = pdev->dev.of_node;
 
 	return dsi;
 }
diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 46198af9eebb..0fb8ad339c26 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -286,10 +286,9 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 
 	ctx->bridge.funcs = &tc358762_bridge_funcs;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
-	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
 
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add_with_dev(&ctx->bridge, dev);
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 3d3d135b4348..5491039386ea 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -368,10 +368,9 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 		return ret;
 
 	ctx->bridge.funcs = &tc358764_bridge_funcs;
-	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
 
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add_with_dev(&ctx->bridge, dev);
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 166f9a3e9622..9cf67586d6e0 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2445,8 +2445,7 @@ static int tc_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	tc->bridge.of_node = dev->of_node;
-	drm_bridge_add(&tc->bridge);
+	drm_bridge_add_with_dev(&tc->bridge, dev);
 
 	i2c_set_clientdata(client, tc);
 
diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 0e8813278a2f..bf26f1248a9e 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -451,7 +451,7 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 	if (ret)
 		priv->pd_lines = priv->dsi_bpp;
 
-	drm_bridge_add(&priv->bridge);
+	drm_bridge_add_with_dev(&priv->bridge, priv->dev);
 
 	return 0;
 }
@@ -1299,7 +1299,6 @@ static int tc358768_i2c_probe(struct i2c_client *client)
 
 	priv->bridge.funcs = &tc358768_bridge_funcs;
 	priv->bridge.timings = &default_tc358768_timings;
-	priv->bridge.of_node = np;
 
 	i2c_set_clientdata(client, priv);
 
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 3b7cc3be2ccd..2b3654b1c183 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -706,9 +706,8 @@ static int tc_probe(struct i2c_client *client)
 	}
 
 	tc->bridge.funcs = &tc_bridge_funcs;
-	tc->bridge.of_node = dev->of_node;
 	tc->bridge.pre_enable_prev_first = true;
-	drm_bridge_add(&tc->bridge);
+	drm_bridge_add_with_dev(&tc->bridge, dev);
 
 	i2c_set_clientdata(client, tc);
 
diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index 674efc489e3a..cbe480ccc8db 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -206,11 +206,10 @@ static int thc63_probe(struct platform_device *pdev)
 		return ret;
 
 	thc63->bridge.driver_private = thc63;
-	thc63->bridge.of_node = pdev->dev.of_node;
 	thc63->bridge.funcs = &thc63_bridge_func;
 	thc63->bridge.timings = &thc63->timings;
 
-	drm_bridge_add(&thc63->bridge);
+	drm_bridge_add_with_dev(&thc63->bridge, &pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index 6b559e071301..22d2314a5672 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -366,8 +366,7 @@ static int dlpc3433_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, dlpc);
 
 	dlpc->bridge.funcs = &dlpc_bridge_funcs;
-	dlpc->bridge.of_node = dev->of_node;
-	drm_bridge_add(&dlpc->bridge);
+	drm_bridge_add_with_dev(&dlpc->bridge, dev);
 
 	ret = dlpc_host_attach(dlpc);
 	if (ret)
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 57a7ed13f996..44f95455fce5 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -708,9 +708,8 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, ctx);
 
 	ctx->bridge.funcs = &sn65dsi83_funcs;
-	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
-	drm_bridge_add(&ctx->bridge);
+	drm_bridge_add_with_dev(&ctx->bridge, dev);
 
 	ret = sn65dsi83_host_attach(ctx);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 84698a0b27a8..52786d1421c3 100644
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
+	drm_bridge_add_with_dev(&pdata->bridge, pdata->dev);
 
 	ret = ti_sn_attach_host(adev, pdata);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index b1b1e4d5a24a..e3129ba8af98 100644
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
+	drm_bridge_add_with_dev(&dvi->bridge, dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index f9fb35683a27..d66331c6437e 100644
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
+	drm_bridge_add_with_dev(&tpd->bridge, &pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 2160f05bbd16..4088abcb265a 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1989,11 +1989,8 @@ static int tda998x_create(struct device *dev)
 	}
 
 	priv->bridge.funcs = &tda998x_bridge_funcs;
-#ifdef CONFIG_OF
-	priv->bridge.of_node = dev->of_node;
-#endif
 
-	drm_bridge_add(&priv->bridge);
+	drm_bridge_add_with_dev(&priv->bridge, dev);
 
 	return 0;
 
-- 
2.43.0

