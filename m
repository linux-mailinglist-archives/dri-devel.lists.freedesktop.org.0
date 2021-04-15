Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C34335FFB5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67396E0E5;
	Thu, 15 Apr 2021 01:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934996E0E5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 01:47:17 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8C2651E;
 Thu, 15 Apr 2021 03:47:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1618451235;
 bh=PTt02K9YXDCxYCTdIW9o/+5R1YX/qGgLS26eD70JlMc=;
 h=From:To:Cc:Subject:Date:From;
 b=lBVPm3xDZuJ8k3j4ToluVDyxyd9oD74mYhGA+EBgLwXtdpmg0SBUTiUIXxpPo0lS+
 YArfDuFizPG2eewfAVF+CmNLR8XF4+IS3KJEdZ+LJUKuCdQ7ZYeeixZpVbWZ8T7I7J
 HeUCxGh7Uhbs66L0dQ3HVMk86xIUSxVMFxfN0CJQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: Centralize error message when bridge attach fails
Date: Thu, 15 Apr 2021 04:47:10 +0300
Message-Id: <20210415014710.4033-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Tomi Valkeinen <tomba@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Xinliang Liu <xinliang.liu@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Sandy Huang <hjc@rock-chips.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Tian Tao <tiantao6@hisilicon.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Being informed of a failure to attach a bridge is useful, and many
drivers prints an error message in that case. Move the message to
drm_bridge_attach() to avoid code duplication.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  9 +--------
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  5 +----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  1 -
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      | 10 +---------
 drivers/gpu/drm/drm_bridge.c                       | 10 ++++++++++
 drivers/gpu/drm/exynos/exynos_dp.c                 |  5 +----
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  5 +----
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |  9 +--------
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |  5 +----
 drivers/gpu/drm/imx/imx-ldb.c                      |  4 +---
 drivers/gpu/drm/imx/parallel-display.c             |  5 +----
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  4 +---
 drivers/gpu/drm/kmb/kmb_dsi.c                      |  1 -
 drivers/gpu/drm/mcde/mcde_dsi.c                    |  9 +--------
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  4 +---
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  5 +----
 drivers/gpu/drm/omapdrm/omap_drv.c                 |  6 +-----
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |  5 +----
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |  5 +----
 drivers/gpu/drm/sti/sti_dvo.c                      |  4 +---
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 |  4 +---
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |  4 +---
 drivers/gpu/drm/tegra/rgb.c                        |  5 +----
 drivers/gpu/drm/tidss/tidss_kms.c                  |  4 +---
 drivers/gpu/drm/tilcdc/tilcdc_external.c           |  4 +---
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  4 +---
 26 files changed, 33 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index f115233b1cb9..081c98b2990f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1583,7 +1583,6 @@ static int analogix_dp_create_bridge(struct drm_device *drm_dev,
 				     struct analogix_dp_device *dp)
 {
 	struct drm_bridge *bridge;
-	int ret;
 
 	bridge = devm_kzalloc(drm_dev->dev, sizeof(*bridge), GFP_KERNEL);
 	if (!bridge) {
@@ -1596,13 +1595,7 @@ static int analogix_dp_create_bridge(struct drm_device *drm_dev,
 	bridge->driver_private = dp;
 	bridge->funcs = &analogix_dp_bridge_funcs;
 
-	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
-	if (ret) {
-		DRM_ERROR("failed to attach drm bridge\n");
-		return -EINVAL;
-	}
-
-	return 0;
+	return drm_bridge_attach(dp->encoder, bridge, NULL, 0);
 }
 
 static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 23283ba0c4f9..702040922beb 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1411,11 +1411,8 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		err = drm_bridge_attach(bridge->encoder,
 					ctx->pdata.panel_bridge,
 					&ctx->bridge, flags);
-		if (err) {
-			DRM_DEV_ERROR(dev,
-				      "Fail to attach panel bridge: %d\n", err);
+		if (err)
 			return err;
-		}
 	}
 
 	ctx->bridge_attached = 1;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index dda4fa9a1a08..fac3ec4f7239 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3490,7 +3490,6 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
 	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, 0);
 	if (ret) {
 		dw_hdmi_remove(hdmi);
-		DRM_ERROR("Failed to initialize bridge with drm\n");
 		return ERR_PTR(ret);
 	}
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 6b268f9445b3..7900da1d4325 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1229,15 +1229,7 @@ EXPORT_SYMBOL_GPL(dw_mipi_dsi_remove);
  */
 int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder)
 {
-	int ret;
-
-	ret = drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
-	if (ret) {
-		DRM_ERROR("Failed to initialize bridge with drm\n");
-		return ret;
-	}
-
-	return ret;
+	return drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
 }
 EXPORT_SYMBOL_GPL(dw_mipi_dsi_bind);
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64f0effb52ac..e689fc7a2275 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -28,6 +28,7 @@
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
 
@@ -225,6 +226,15 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->dev = NULL;
 	bridge->encoder = NULL;
 	list_del(&bridge->chain_node);
+
+#ifdef CONFIG_OF
+	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
+		  bridge->of_node, encoder->name, ret);
+#else
+	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
+		  encoder->name, ret);
+#endif
+
 	return ret;
 }
 EXPORT_SYMBOL(drm_bridge_attach);
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 9ac51b6ab34b..27664f663c5a 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -109,11 +109,8 @@ static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 	if (dp->ptn_bridge) {
 		ret = drm_bridge_attach(&dp->encoder, dp->ptn_bridge, bridge,
 					0);
-		if (ret) {
-			DRM_DEV_ERROR(dp->dev,
-				      "Failed to attach bridge to drm\n");
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 39fa5d3b01ef..26a00999cb3b 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -970,11 +970,8 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
 	drm_connector_helper_add(connector, &hdmi_connector_helper_funcs);
 	drm_connector_attach_encoder(connector, encoder);
 
-	if (hdata->bridge) {
+	if (hdata->bridge)
 		ret = drm_bridge_attach(encoder, hdata->bridge, NULL, 0);
-		if (ret)
-			DRM_DEV_ERROR(hdata->dev, "Failed to attach bridge\n");
-	}
 
 	cec_fill_conn_info_from_drm(&conn_info, connector);
 
diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 00e87c290796..d79745917fc9 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -769,16 +769,9 @@ static int dsi_bridge_init(struct drm_device *dev, struct dw_dsi *dsi)
 {
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_bridge *bridge = dsi->bridge;
-	int ret;
 
 	/* associate the bridge to dsi encoder */
-	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
-	if (ret) {
-		DRM_ERROR("failed to attach external bridge\n");
-		return ret;
-	}
-
-	return 0;
+	return drm_bridge_attach(encoder, bridge, NULL, 0);
 }
 
 static int dsi_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index b549ce5e7607..a82272147d3d 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -94,11 +94,8 @@ static int dcss_kms_bridge_connector_init(struct dcss_kms_dev *kms)
 
 	ret = drm_bridge_attach(encoder, bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret < 0) {
-		dev_err(ddev->dev, "Unable to attach bridge %pOF\n",
-			bridge->of_node);
+	if (ret < 0)
 		return ret;
-	}
 
 	kms->connector = drm_bridge_connector_init(ddev, encoder);
 	if (IS_ERR(kms->connector)) {
diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index ffdc492c5bc5..d5f8cb03775a 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -460,10 +460,8 @@ static int imx_ldb_register(struct drm_device *drm,
 
 	if (imx_ldb_ch->bridge) {
 		ret = drm_bridge_attach(encoder, imx_ldb_ch->bridge, NULL, 0);
-		if (ret) {
-			DRM_ERROR("Failed to initialize bridge with drm\n");
+		if (ret)
 			return ret;
-		}
 	} else {
 		/*
 		 * We want to add the connector whenever there is no bridge
diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index e0412e694fd9..a8aba0141ce7 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -294,11 +294,8 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 
 	if (imxpd->next_bridge) {
 		ret = drm_bridge_attach(encoder, imxpd->next_bridge, bridge, 0);
-		if (ret < 0) {
-			dev_err(imxpd->dev, "failed to attach bridge: %d\n",
-				ret);
+		if (ret < 0)
 			return ret;
-		}
 	} else {
 		drm_connector_helper_add(connector,
 					 &imx_pd_connector_helper_funcs);
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 29742ec5ab95..2d89ec1608f7 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1036,10 +1036,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
 
 		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
-		if (ret) {
-			dev_err(dev, "Unable to attach bridge\n");
+		if (ret)
 			return ret;
-		}
 	}
 
 	drm_for_each_encoder(encoder, drm) {
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 4b5d82af84b3..12935aca7ee0 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -1441,7 +1441,6 @@ int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi)
 	ret = drm_bridge_attach(encoder, adv_bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
-		DRM_ERROR("failed to attach bridge to MIPI\n");
 		drm_encoder_cleanup(encoder);
 		return ret;
 	}
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index b3fd3501c412..51adace2611f 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1052,7 +1052,6 @@ static int mcde_dsi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
 	struct drm_device *drm = bridge->dev;
-	int ret;
 
 	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
 		dev_err(d->dev, "we need atomic updates\n");
@@ -1060,13 +1059,7 @@ static int mcde_dsi_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	/* Attach the DSI bridge to the output (panel etc) bridge */
-	ret = drm_bridge_attach(bridge->encoder, d->bridge_out, bridge, flags);
-	if (ret) {
-		dev_err(d->dev, "failed to attach the DSI bridge\n");
-		return ret;
-	}
-
-	return 0;
+	return drm_bridge_attach(bridge->encoder, d->bridge_out, bridge, flags);
 }
 
 static const struct drm_bridge_funcs mcde_dsi_bridge_funcs = {
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bea91c81626e..18c161f89fec 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -610,10 +610,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret) {
-		dev_err(dev, "Failed to attach bridge: %d\n", ret);
+	if (ret)
 		goto err_cleanup;
-	}
 
 	dpi->connector = drm_bridge_connector_init(drm_dev, &dpi->encoder);
 	if (IS_ERR(dpi->connector)) {
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index dea46d66e712..d0963e5a0ab9 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1284,11 +1284,8 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 	if (hdmi->next_bridge) {
 		ret = drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
 					bridge, flags);
-		if (ret) {
-			dev_err(hdmi->dev,
-				"Failed to attach external bridge: %d\n", ret);
+		if (ret)
 			return ret;
-		}
 	}
 
 	mtk_cec_set_hpd_event(hdmi->cec_dev, mtk_hdmi_hpd_event, hdmi->dev);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 8632139e0f01..f86e20578143 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -290,12 +290,8 @@ static int omap_modeset_init(struct drm_device *dev)
 			ret = drm_bridge_attach(pipe->encoder,
 						pipe->output->bridge, NULL,
 						DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-			if (ret < 0) {
-				dev_err(priv->dev,
-					"unable to attach bridge %pOF\n",
-					pipe->output->bridge->of_node);
+			if (ret < 0)
 				return ret;
-			}
 		}
 
 		id = omap_display_id(pipe->output);
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index bd5ba10822c2..b541271e66d9 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -636,11 +636,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 		}
 	} else {
 		ret = drm_bridge_attach(encoder, lvds->bridge, NULL, 0);
-		if (ret) {
-			DRM_DEV_ERROR(drm_dev->dev,
-				      "failed to attach bridge: %d\n", ret);
+		if (ret)
 			goto err_free_encoder;
-		}
 	}
 
 	pm_runtime_enable(dev);
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index c079714477d8..d691d9bef8e7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -143,11 +143,8 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	rgb->bridge = bridge;
 
 	ret = drm_bridge_attach(encoder, rgb->bridge, NULL, 0);
-	if (ret) {
-		DRM_DEV_ERROR(drm_dev->dev,
-			      "failed to attach bridge: %d\n", ret);
+	if (ret)
 		goto err_free_encoder;
-	}
 
 	return rgb;
 
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index ddb4184f0726..b6ee8a82e656 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -463,10 +463,8 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 	drm_bridge_add(bridge);
 
 	err = drm_bridge_attach(encoder, bridge, NULL, 0);
-	if (err) {
-		DRM_ERROR("Failed to attach bridge\n");
+	if (err)
 		return err;
-	}
 
 	dvo->bridge = bridge;
 	connector->encoder = encoder;
diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index ac570437172e..6716e895ae8a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -142,10 +142,8 @@ int sun4i_lvds_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 
 	if (bridge) {
 		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
-		if (ret) {
-			dev_err(drm->dev, "Couldn't attach our bridge\n");
+		if (ret)
 			goto err_cleanup_connector;
-		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index e172426eb7e9..dfb6acc42f02 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -234,10 +234,8 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 
 	if (rgb->bridge) {
 		ret = drm_bridge_attach(encoder, rgb->bridge, NULL, 0);
-		if (ret) {
-			dev_err(drm->dev, "Couldn't attach our bridge\n");
+		if (ret)
 			goto err_cleanup_connector;
-		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 4142a56ca764..606c78a2b988 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -275,11 +275,8 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	if (output->bridge) {
 		err = drm_bridge_attach(&output->encoder, output->bridge,
 					NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-		if (err) {
-			dev_err(output->dev, "failed to attach bridge: %d\n",
-				err);
+		if (err)
 			return err;
-		}
 
 		connector = drm_bridge_connector_init(drm, &output->encoder);
 		if (IS_ERR(connector)) {
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 95f8e0f78e32..666e527a0acf 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -227,10 +227,8 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 		}
 
 		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL, 0);
-		if (ret) {
-			dev_err(tidss->dev, "bridge attach failed: %d\n", ret);
+		if (ret)
 			return ret;
-		}
 	}
 
 	/* create overlay planes of the leftover planes */
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index b177525588c1..7594cf6e186e 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -93,10 +93,8 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 	priv->external_encoder->possible_crtcs = BIT(0);
 
 	ret = drm_bridge_attach(priv->external_encoder, bridge, NULL, 0);
-	if (ret) {
-		dev_err(ddev->dev, "drm_bridge_attach() failed %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	tilcdc_crtc_set_panel_info(priv->crtc, &panel_info_default);
 
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index a55256ed0955..a185027911ce 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1646,10 +1646,8 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	drm_encoder_helper_add(dsi->encoder, &vc4_dsi_encoder_helper_funcs);
 
 	ret = drm_bridge_attach(dsi->encoder, dsi->bridge, NULL, 0);
-	if (ret) {
-		dev_err(dev, "bridge attach failed: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 	/* Disable the atomic helper calls into the bridge.  We
 	 * manually call the bridge pre_enable / enable / etc. calls
 	 * from our driver, since we need to sequence them within the
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
