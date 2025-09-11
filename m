Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1454CB53330
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBF910EB27;
	Thu, 11 Sep 2025 13:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TPBZ16W1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B7F10EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757596062;
 bh=wlWiIie/Fm8O5aCv15k508ASkBzj/OTMpelEkdL/D9E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TPBZ16W1pprQ0OMowRZENLaeP7LKg1bLfCchR9XEqc/pl6DULfuGnO5tssEo59WBP
 7tJklHK8JX54jWve4Nmpr0y8o+y/IKqNhqJbM9fwDjl8X9omGXHZ/Xw04XQckc0zP9
 Zd6lZYb5vmsOb2SziKaqSZM8ac2SIjZ60YJzyHf3XJ3b3jmdP5TzL7kzY3E3r2qIrV
 NTq9xFVHpv4m8BjMeGeUEf7NPqpEZUc+LTYh95tZJQtMGrLAEzYhKQS21MqfUJ+wh8
 PgN7ZPDay9uI/wYIjI0icR/cSX9hYPuvkBgDgrX1YbKSv78ALwMN3o0oGeotUcJbOe
 NEXBK0ARrv2xg==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f05:840b:7800:3261:5c97:2de4:16d3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 76A0F17E1110;
 Thu, 11 Sep 2025 15:07:42 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 mripard@kernel.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 harry.wentland@amd.com, christian.koenig@amd.com,
 derek.foreman@collabora.com
Subject: [PATCH 5/8] drm: Pass supported color formats straight onto drm_bridge
Date: Thu, 11 Sep 2025 16:07:36 +0300
Message-ID: <20250911130739.4936-6-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250911130739.4936-1-marius.vlad@collabora.com>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Initialize drm_brige with advertised colors formats straight on.

Drivers that make use of DRM helpers would check the
drm_brige::supported_formats bit-field list and refuse to use the color
format passed. Drivers that make use of drm_bridge can pass the
supported color formats in the bridge as well as supported color format
for the DRM color format property.

This includes a fallback to RGB when Auto has been selected.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c      | 2 +-
 drivers/gpu/drm/bridge/ite-it6263.c               | 2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c             | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c    | 4 ++--
 drivers/gpu/drm/imx/dcss/dcss-kms.c               | 2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                | 2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                | 2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c        | 3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c        | 4 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          | 2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                   | 3 ++-
 drivers/gpu/drm/msm/dsi/dsi_manager.c             | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                   | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c            | 2 +-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c          | 2 +-
 drivers/gpu/drm/tegra/hdmi.c                      | 2 +-
 drivers/gpu/drm/tegra/rgb.c                       | 2 +-
 drivers/gpu/drm/tidss/tidss_encoder.c             | 2 +-
 include/drm/drm_bridge_connector.h                | 3 ++-
 22 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 26f8ef482423..f2fea84b6415 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -762,7 +762,7 @@ static int adv7511_connector_init(struct adv7511 *adv)
 	struct drm_bridge *bridge = &adv->bridge;
 	struct drm_connector *connector;
 
-	connector = drm_bridge_connector_init(bridge->dev, bridge->encoder);
+	connector = drm_bridge_connector_init(bridge->dev, bridge->encoder, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
 		return PTR_ERR(connector);
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cf813672b4ff..b45d2b4913e5 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -680,7 +680,7 @@ static int it6263_bridge_attach(struct drm_bridge *bridge,
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return 0;
 
-	connector = drm_bridge_connector_init(bridge->dev, encoder);
+	connector = drm_bridge_connector_init(bridge->dev, encoder, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
 		dev_err(it->dev, "failed to initialize bridge connector: %d\n",
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 464390372b34..14fc58b28de8 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -719,7 +719,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 		return 0;
 
 	pdata->connector = drm_bridge_connector_init(pdata->bridge.dev,
-						     pdata->bridge.encoder);
+						     pdata->bridge.encoder,
+						     BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(pdata->connector)) {
 		ret = PTR_ERR(pdata->connector);
 		goto err_initted_aux;
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 54f3f16d64c7..83951aaf1ade 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -634,13 +634,13 @@ static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_f
  * pointer otherwise.
  */
 struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
-						struct drm_encoder *encoder)
+						struct drm_encoder *encoder,
+						unsigned int supported_formats)
 {
 	struct drm_bridge_connector *bridge_connector;
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge, *panel_bridge = NULL;
-	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
 	unsigned int max_bpc = 8;
 	bool support_hdcp = false;
 	int connector_type;
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 3633e8f3aff6..2eccf62d6c45 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -97,7 +97,7 @@ static int dcss_kms_bridge_connector_init(struct dcss_kms_dev *kms)
 	if (ret < 0)
 		return ret;
 
-	kms->connector = drm_bridge_connector_init(ddev, encoder);
+	kms->connector = drm_bridge_connector_init(ddev, encoder, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(kms->connector)) {
 		dev_err(ddev->dev, "Unable to create bridge connector.\n");
 		return PTR_ERR(kms->connector);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 61cab32e213a..15820e6ba057 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1057,7 +1057,7 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		goto err_cleanup;
 
-	dpi->connector = drm_bridge_connector_init(drm_dev, &dpi->encoder);
+	dpi->connector = drm_bridge_connector_init(drm_dev, &dpi->encoder, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(dpi->connector)) {
 		dev_err(dev, "Unable to create bridge connector\n");
 		ret = PTR_ERR(dpi->connector);
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d7726091819c..91afdbf676f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -930,7 +930,7 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 	if (ret)
 		goto err_cleanup_encoder;
 
-	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
+	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(dsi->connector)) {
 		DRM_ERROR("Unable to create bridge connector\n");
 		ret = PTR_ERR(dsi->connector);
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index dc374bfc5951..a475fc34ca23 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -275,7 +275,8 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 	}
 
 	/* Initialize & attach Bridge Connector */
-	connector = drm_bridge_connector_init(priv->drm, &meson_encoder_cvbs->encoder);
+	connector = drm_bridge_connector_init(priv->drm,
+			&meson_encoder_cvbs->encoder, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(connector))
 		return dev_err_probe(priv->dev, PTR_ERR(connector),
 				     "Unable to create CVBS bridge connector\n");
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 8205ee56a691..7d157de42d1c 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -425,8 +425,8 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	}
 
 	/* Initialize & attach Bridge Connector */
-	meson_encoder_hdmi->connector = drm_bridge_connector_init(priv->drm,
-							&meson_encoder_hdmi->encoder);
+	meson_encoder_hdmi->connector =
+		drm_bridge_connector_init(priv->drm, &meson_encoder_hdmi->encoder, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(meson_encoder_hdmi->connector)) {
 		ret = dev_err_probe(priv->dev,
 				    PTR_ERR(meson_encoder_hdmi->connector),
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 0952c7f18abd..65c51d9f083e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -226,7 +226,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 			return ret;
 		}
 
-		connector = drm_bridge_connector_init(dev, encoder);
+		connector = drm_bridge_connector_init(dev, encoder, BIT(HDMI_COLORSPACE_RGB));
 		if (IS_ERR(connector)) {
 			DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
 			return PTR_ERR(connector);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 9a461ab2f32f..8d5299849be6 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -368,7 +368,8 @@ struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
 {
 	struct drm_connector *connector = NULL;
 
-	connector = drm_bridge_connector_init(msm_dp_display->drm_dev, encoder);
+	connector = drm_bridge_connector_init(msm_dp_display->drm_dev, encoder,
+					      BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(connector))
 		return connector;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index ca400924d4ee..4b87f4f78d38 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -479,7 +479,7 @@ int msm_dsi_manager_connector_init(struct msm_dsi *msm_dsi,
 	if (ret)
 		return ret;
 
-	connector = drm_bridge_connector_init(dev, encoder);
+	connector = drm_bridge_connector_init(dev, encoder, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(connector)) {
 		DRM_ERROR("Unable to create bridge connector\n");
 		return PTR_ERR(connector);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 5afac09c0d33..6da03b5143b0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -182,7 +182,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		}
 	}
 
-	hdmi->connector = drm_bridge_connector_init(hdmi->dev, encoder);
+	hdmi->connector = drm_bridge_connector_init(hdmi->dev, encoder, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(hdmi->connector)) {
 		ret = PTR_ERR(hdmi->connector);
 		DRM_DEV_ERROR(dev->dev, "failed to create HDMI connector: %d\n", ret);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index 7ecec7b04a8d..8d903683f6f6 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
@@ -125,7 +125,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	}
 
 	/* Create the connector for the chain of bridges. */
-	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
+	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(connector)) {
 		dev_err(rcdu->dev,
 			"failed to created connector for output %s (%ld)\n",
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 5e6dd16705e6..4578cf5b756b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -114,7 +114,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 	}
 
 	/* Create the connector for the chain of bridges. */
-	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
+	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(connector)) {
 		dev_err(rcdu->dev,
 			"failed to created connector for output %s (%ld)\n",
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b7e3f5dcf8d5..d591d660d059 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1016,7 +1016,7 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	connector = drm_bridge_connector_init(drm_dev, encoder);
+	connector = drm_bridge_connector_init(drm_dev, encoder, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
 		dev_err(dp->dev, "failed to init bridge connector: %d\n", ret);
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 7d531b6f4c09..58e24669ef34 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -563,7 +563,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	connector = drm_bridge_connector_init(drm, encoder);
+	connector = drm_bridge_connector_init(drm, encoder, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
 		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 2411260db51d..3727035d896e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -619,7 +619,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 		if (ret)
 			goto err_free_bridge;
 
-		connector = drm_bridge_connector_init(lvds->drm_dev, encoder);
+		connector = drm_bridge_connector_init(lvds->drm_dev, encoder, BIT(HDMI_COLORSPACE_RGB));
 		if (IS_ERR(connector)) {
 			drm_err(drm_dev,
 				"failed to initialize bridge connector: %pe\n",
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 8cd2969e7d4b..6419d152c8b3 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1568,7 +1568,7 @@ static int tegra_hdmi_init(struct host1x_client *client)
 			return err;
 		}
 
-		connector = drm_bridge_connector_init(drm, &hdmi->output.encoder);
+		connector = drm_bridge_connector_init(drm, &hdmi->output.encoder, BIT(HDMI_COLORSPACE_RGB));
 		if (IS_ERR(connector)) {
 			dev_err(client->dev,
 				"failed to initialize bridge connector: %pe\n",
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index ff5a749710db..f0b18491fa11 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -348,7 +348,7 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 		if (err)
 			return err;
 
-		connector = drm_bridge_connector_init(drm, &output->encoder);
+		connector = drm_bridge_connector_init(drm, &output->encoder, BIT(HDMI_COLORSPACE_RGB));
 		if (IS_ERR(connector)) {
 			dev_err(output->dev,
 				"failed to initialize bridge connector: %pe\n",
diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 81a04f767770..8829d995811b 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -115,7 +115,7 @@ int tidss_encoder_create(struct tidss_device *tidss,
 	}
 
 	/* Initializing the connector at the end of bridge-chain */
-	connector = drm_bridge_connector_init(&tidss->ddev, enc);
+	connector = drm_bridge_connector_init(&tidss->ddev, enc, BIT(HDMI_COLORSPACE_RGB));
 	if (IS_ERR(connector)) {
 		dev_err(tidss->dev, "bridge_connector create failed\n");
 		return PTR_ERR(connector);
diff --git a/include/drm/drm_bridge_connector.h b/include/drm/drm_bridge_connector.h
index 69630815fb09..e1446d8af8b7 100644
--- a/include/drm/drm_bridge_connector.h
+++ b/include/drm/drm_bridge_connector.h
@@ -11,6 +11,7 @@ struct drm_device;
 struct drm_encoder;
 
 struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
-						struct drm_encoder *encoder);
+						struct drm_encoder *encoder,
+						unsigned int supported_colorformats);
 
 #endif /* __DRM_BRIDGE_CONNECTOR_H__ */
-- 
2.47.2

