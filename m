Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001CAA34328
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627B210EAEB;
	Thu, 13 Feb 2025 14:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hd1IOiRC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A820210EAEC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 410A2A42016;
 Thu, 13 Feb 2025 14:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4178C4CED1;
 Thu, 13 Feb 2025 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457909;
 bh=aiB6XOoeIFGxqiU1HWqzrCNphVAhiSOsnRx3CXYiZUI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hd1IOiRCig9UR0sSgINo0QC+bqdMfxzUA6BdrqNAFJnXbRSbtI6lKHvBREmrMS5mX
 pF1QcUbvetDyn1Pt3SzGBFKIidzEO7obPWjyxD+68NYk7n4Qbofn/7iIhW5KLbwi/W
 rRNWGkYDqQk7skFNZMPsYLsyPHm4MjcXNRHUyYHx0i6PknYYmU4YJ8ATVbd8nlt3zU
 biYPO+8EXQK2c6OvnLlr6/L8UPM4jU5jO2/2iK348OMNJadqzTkWTWL0CV2yhHmG6v
 RlEIKrpJWJAd8esWt+b06P0hPkntJFjrtpNQwQk3jUbYZrAohZJlld4+uJHK5ltLul
 A12IjXJ4BwJyQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:46 +0100
Subject: [PATCH v3 27/37] drm/bridge: Add encoder parameter to
 drm_bridge_funcs.attach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-27-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=87983; i=mripard@kernel.org;
 h=from:subject:message-id; bh=aiB6XOoeIFGxqiU1HWqzrCNphVAhiSOsnRx3CXYiZUI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWJV8ukN4v2yaGMAW5fQsa18GR9i37ec/zuyOit10r
 6tjWllBx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhItjRjrbi5+Qupigyh4h+r
 ZW8fuz3rT9bV7TsvKCyfWJzIamUr110q5X/ylXfhtSbPAqYUC6mZjA1/W8+keR89Fxrlx2X8vkS
 lXnJBi1vYp51m5osyby/SNX4lkv5+4b9kvqXH38vpOp3NyAIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The drm_bridge structure contains an encoder pointer that is widely used
by bridge drivers. This pattern is largely documented as deprecated in
other KMS entities for atomic drivers.

However, one of the main use of that pointer is done in attach to just
call drm_bridge_attach on the next bridge to add it to the bridge list.
While this dereferences the bridge->encoder pointer, it's effectively
the same encoder the bridge was being attached to.

We can make it more explicit by adding the encoder the bridge is
attached to to the list of attach parameters. This also removes the need
to dereference bridge->encoder in most drivers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             |  3 ++-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       |  3 ++-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c       |  3 ++-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c       |  2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c                |  3 ++-
 drivers/gpu/drm/bridge/aux-bridge.c                      |  3 ++-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c                  |  1 +
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c           |  3 ++-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      |  1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c                 |  6 ++++--
 drivers/gpu/drm/bridge/chrontel-ch7033.c                 |  5 +++--
 drivers/gpu/drm/bridge/display-connector.c               |  1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                         |  3 ++-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c              |  7 +++----
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h              |  2 +-
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c           |  3 ++-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c             |  3 ++-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c      |  3 ++-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c          |  3 ++-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c             |  3 ++-
 drivers/gpu/drm/bridge/ite-it6263.c                      |  7 ++++---
 drivers/gpu/drm/bridge/ite-it6505.c                      |  1 +
 drivers/gpu/drm/bridge/ite-it66121.c                     |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c                 |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9211.c                  |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611.c                  |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c               |  3 ++-
 drivers/gpu/drm/bridge/lvds-codec.c                      |  3 ++-
 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  1 +
 drivers/gpu/drm/bridge/microchip-lvds.c                  |  3 ++-
 drivers/gpu/drm/bridge/nwl-dsi.c                         |  3 ++-
 drivers/gpu/drm/bridge/nxp-ptn3460.c                     |  5 +++--
 drivers/gpu/drm/bridge/panel.c                           |  3 ++-
 drivers/gpu/drm/bridge/parade-ps8622.c                   |  1 +
 drivers/gpu/drm/bridge/parade-ps8640.c                   |  3 ++-
 drivers/gpu/drm/bridge/samsung-dsim.c                    |  3 ++-
 drivers/gpu/drm/bridge/sii902x.c                         |  5 +++--
 drivers/gpu/drm/bridge/sil-sii8620.c                     |  1 +
 drivers/gpu/drm/bridge/simple-bridge.c                   |  5 +++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                |  3 ++-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c            |  5 +++--
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c           |  5 +++--
 drivers/gpu/drm/bridge/tc358762.c                        |  3 ++-
 drivers/gpu/drm/bridge/tc358764.c                        |  3 ++-
 drivers/gpu/drm/bridge/tc358767.c                        |  2 ++
 drivers/gpu/drm/bridge/tc358768.c                        |  3 ++-
 drivers/gpu/drm/bridge/tc358775.c                        |  3 ++-
 drivers/gpu/drm/bridge/thc63lvd1024.c                    |  3 ++-
 drivers/gpu/drm/bridge/ti-dlpc3433.c                     |  4 ++--
 drivers/gpu/drm/bridge/ti-sn65dsi83.c                    |  3 ++-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                    |  3 ++-
 drivers/gpu/drm/bridge/ti-tdp158.c                       |  6 ++++--
 drivers/gpu/drm/bridge/ti-tfp410.c                       |  5 +++--
 drivers/gpu/drm/bridge/ti-tpd12s015.c                    |  3 ++-
 drivers/gpu/drm/drm_bridge.c                             |  2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                        |  1 +
 drivers/gpu/drm/imx/ipuv3/parallel-display.c             |  3 ++-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c                |  5 +++--
 drivers/gpu/drm/mcde/mcde_dsi.c                          |  3 ++-
 drivers/gpu/drm/mediatek/mtk_dp.c                        |  3 ++-
 drivers/gpu/drm/mediatek/mtk_dpi.c                       |  3 ++-
 drivers/gpu/drm/mediatek/mtk_dsi.c                       |  3 ++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                      |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c               |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_dsi.c                |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c               |  3 ++-
 drivers/gpu/drm/msm/dsi/dsi_manager.c                    |  3 ++-
 drivers/gpu/drm/omapdrm/dss/dpi.c                        |  3 ++-
 drivers/gpu/drm/omapdrm/dss/dsi.c                        |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                      |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                      |  3 ++-
 drivers/gpu/drm/omapdrm/dss/sdi.c                        |  3 ++-
 drivers/gpu/drm/omapdrm/dss/venc.c                       |  3 ++-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c              |  3 ++-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c          |  3 ++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c           |  3 ++-
 drivers/gpu/drm/stm/lvds.c                               | 11 +++++------
 drivers/gpu/drm/tidss/tidss_encoder.c                    |  3 ++-
 drivers/gpu/drm/vc4/vc4_dsi.c                            |  3 ++-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                         |  3 ++-
 drivers/platform/arm64/acer-aspire1-ec.c                 |  3 ++-
 include/drm/drm_bridge.h                                 |  2 +-
 82 files changed, 170 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 050dae338ffee36a8d6ee6fcce69f51486a957fe..1257009e850c1b20184cfaea5b6a4440e75e10d7 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -946,17 +946,18 @@ static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
 	else
 		return adv7511_mode_valid(adv, mode);
 }
 
 static int adv7511_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 	int ret = 0;
 
 	if (adv->next_bridge) {
-		ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge,
+		ret = drm_bridge_attach(encoder, adv->next_bridge, bridge,
 					flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
 			return ret;
 	}
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 83d711ee3a2eb8b7a491c115171b5cc12a9df066..a88a33eb5d972cb47e82cfccde87ecf43d051637 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -515,10 +515,11 @@ static const struct drm_connector_funcs anx6345_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int anx6345_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct anx6345 *anx6345 = bridge_to_anx6345(bridge);
 	int err;
 
@@ -551,11 +552,11 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
 				 &anx6345_connector_helper_funcs);
 
 	anx6345->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
 	err = drm_connector_attach_encoder(&anx6345->connector,
-					   bridge->encoder);
+					   encoder);
 	if (err) {
 		DRM_ERROR("Failed to link up connector to encoder: %d\n", err);
 		goto connector_cleanup;
 	}
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index f74694bb9c50a2f71d51d27e08c08bb854cf29ea..8b4597885614d6278f5782fdce5065044d5c2966 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -886,10 +886,11 @@ static const struct drm_connector_funcs anx78xx_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int anx78xx_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct anx78xx *anx78xx = bridge_to_anx78xx(bridge);
 	int err;
 
@@ -922,11 +923,11 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
 				 &anx78xx_connector_helper_funcs);
 
 	anx78xx->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
 	err = drm_connector_attach_encoder(&anx78xx->connector,
-					   bridge->encoder);
+					   encoder);
 	if (err) {
 		DRM_ERROR("Failed to link up connector to encoder: %d\n", err);
 		goto connector_cleanup;
 	}
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 60ce33eadd97548c39201332e26b56e71245253a..bc87055ab82607e42cee638cbab5d2c136232bd7 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1111,14 +1111,14 @@ static const struct drm_connector_funcs analogix_dp_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
+				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
 {
 	struct analogix_dp_device *dp = bridge->driver_private;
-	struct drm_encoder *encoder = dp->encoder;
 	struct drm_connector *connector = NULL;
 	int ret = 0;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
 		DRM_ERROR("Fix bridge driver to make connector optional!");
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0b97b66de577421b0e68e748d0075f674c71fbf1..0b61e77c0398bbce3ecf55753dde71a27eda8fe5 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2139,10 +2139,11 @@ static void hdcp_check_work_func(struct work_struct *work)
 	mutex_unlock(&ctx->hdcp_wq_lock);
 	drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
 }
 
 static int anx7625_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	int err;
 	struct device *dev = ctx->dev;
@@ -2157,11 +2158,11 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		dev_err(dev, "failed to register aux channel: %d\n", err);
 		return err;
 	}
 
 	if (ctx->pdata.panel_bridge) {
-		err = drm_bridge_attach(bridge->encoder,
+		err = drm_bridge_attach(encoder,
 					ctx->pdata.panel_bridge,
 					&ctx->bridge, flags);
 		if (err)
 			return err;
 	}
diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index 015983c015e508f75435bf97ee1dba785edcd23e..c179b86d208f70d95b41e6f2157b78f97bac4d8d 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -84,20 +84,21 @@ struct drm_aux_bridge_data {
 	struct drm_bridge *next_bridge;
 	struct device *dev;
 };
 
 static int drm_aux_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct drm_aux_bridge_data *data;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
 	data = container_of(bridge, struct drm_aux_bridge_data, bridge);
 
-	return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
+	return drm_bridge_attach(encoder, data->next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
 static const struct drm_bridge_funcs drm_aux_bridge_funcs = {
 	.attach	= drm_aux_bridge_attach,
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 48f297c78ee67c8f9034869f6824a6dc7f88bdd7..b3f588b71a7d7ad5c2ee7b07c39079bc5ba34cee 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -154,10 +154,11 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	drm_bridge_hpd_notify(&data->bridge, status);
 }
 EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
+				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
 {
 	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
 }
 
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index c7a0247e06adf3e532f830363b3422a8058513ef..8f54c034ac4f3e82c38607a0e52d4745654b571f 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -603,10 +603,11 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 
 	return 0;
 }
 
 static int cdns_dsi_bridge_attach(struct drm_bridge *bridge,
+				  struct drm_encoder *encoder,
 				  enum drm_bridge_attach_flags flags)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	struct cdns_dsi_output *output = &dsi->output;
@@ -615,11 +616,11 @@ static int cdns_dsi_bridge_attach(struct drm_bridge *bridge,
 		dev_err(dsi->base.dev,
 			"cdns-dsi driver is only compatible with DRM devices supporting atomic updates");
 		return -ENOTSUPP;
 	}
 
-	return drm_bridge_attach(bridge->encoder, output->bridge, bridge,
+	return drm_bridge_attach(encoder, output->bridge, bridge,
 				 flags);
 }
 
 static enum drm_mode_status
 cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index ef586e7df83b96f39ab552171d2ef665971a81ef..69347799913aed257a4a944702883753df9c34bb 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1724,10 +1724,11 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 
 	return ret;
 }
 
 static int cdns_mhdp_attach(struct drm_bridge *bridge,
+			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 	bool hw_ready;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 81f7c701961fddadbced6e4ad1bf9f12d3325fa7..634c5b0306679d2e68798c2b9013aae4491dd44c 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -578,15 +578,17 @@ static int chipone_dsi_host_attach(struct chipone *icn)
 		mipi_dsi_device_unregister(dsi);
 
 	return ret;
 }
 
-static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
+static int chipone_attach(struct drm_bridge *bridge,
+			  struct drm_encoder *encoder,
+			  enum drm_bridge_attach_flags flags)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
 
-	return drm_bridge_attach(bridge->encoder, icn->panel_bridge, bridge, flags);
+	return drm_bridge_attach(encoder, icn->panel_bridge, bridge, flags);
 }
 
 #define MAX_INPUT_SEL_FORMATS	1
 
 static u32 *
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index da17f0978a791fe9bffab3fa0527e3a355d65c6b..210c45c1efd48f5b541bf73da66a169c27e110b2 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -266,17 +266,18 @@ static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
 	if (priv->bridge.dev)
 		drm_helper_hpd_irq_event(priv->connector.dev);
 }
 
 static int ch7033_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
 	struct drm_connector *connector = &priv->connector;
 	int ret;
 
-	ret = drm_bridge_attach(bridge->encoder, priv->next_bridge, bridge,
+	ret = drm_bridge_attach(encoder, priv->next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
@@ -303,11 +304,11 @@ static int ch7033_bridge_attach(struct drm_bridge *bridge,
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
 		return ret;
 	}
 
-	return drm_connector_attach_encoder(&priv->connector, bridge->encoder);
+	return drm_connector_attach_encoder(&priv->connector, encoder);
 }
 
 static void ch7033_bridge_detach(struct drm_bridge *bridge)
 {
 	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 72bc508d4e6e2bf5be535c8856b46465d1ff835e..09c08a53d5bdc5c48f5d520472f5a311289d4862 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -32,10 +32,11 @@ to_display_connector(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct display_connector, bridge);
 }
 
 static int display_connector_attach(struct drm_bridge *bridge,
+				    struct drm_encoder *encoder,
 				    enum drm_bridge_attach_flags flags)
 {
 	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
 }
 
diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 26ae1ab5237f81ebd6c56075a18136f4a5b56ec9..72d8f32d48faf6726ea67d8770ed83f77f3a0862 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -111,15 +111,16 @@ static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
 	else
 		return clock * 7000;
 }
 
 static int fsl_ldb_attach(struct drm_bridge *bridge,
+			  struct drm_encoder *encoder,
 			  enum drm_bridge_attach_flags flags)
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(bridge->encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
 				 bridge, flags);
 }
 
 static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 				  struct drm_atomic_state *state)
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
index 9b5bebbe357dd4905a792abc5cecdbb9ce10ffb8..61347f6ec33d906264f7e06902b0d915d263f3f8 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -102,11 +102,11 @@ void ldb_bridge_disable_helper(struct drm_bridge *bridge)
 
 	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
 }
 EXPORT_SYMBOL_GPL(ldb_bridge_disable_helper);
 
-int ldb_bridge_attach_helper(struct drm_bridge *bridge,
+int ldb_bridge_attach_helper(struct drm_bridge *bridge, struct drm_encoder *encoder,
 			     enum drm_bridge_attach_flags flags)
 {
 	struct ldb_channel *ldb_ch = bridge->driver_private;
 	struct ldb *ldb = ldb_ch->ldb;
 
@@ -114,13 +114,12 @@ int ldb_bridge_attach_helper(struct drm_bridge *bridge,
 		DRM_DEV_ERROR(ldb->dev,
 			      "do not support creating a drm_connector\n");
 		return -EINVAL;
 	}
 
-	return drm_bridge_attach(bridge->encoder,
-				ldb_ch->next_bridge, bridge,
-				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	return drm_bridge_attach(encoder, ldb_ch->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 EXPORT_SYMBOL_GPL(ldb_bridge_attach_helper);
 
 int ldb_init_helper(struct ldb *ldb)
 {
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
index a0a5cde27fbc6eb0d3932381f78d6803542b9bac..38a8a54b37a60e1be942aaa60b1d1bc375a7a131 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
@@ -79,11 +79,11 @@ void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
 
 void ldb_bridge_enable_helper(struct drm_bridge *bridge);
 
 void ldb_bridge_disable_helper(struct drm_bridge *bridge);
 
-int ldb_bridge_attach_helper(struct drm_bridge *bridge,
+int ldb_bridge_attach_helper(struct drm_bridge *bridge, struct drm_encoder *encoder,
 			     enum drm_bridge_attach_flags flags);
 
 int ldb_init_helper(struct ldb *ldb);
 
 int ldb_find_next_bridge_helper(struct ldb *ldb);
diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
index 3ebf0b9866de13b12fab2b3c1e4db5f3d446089a..7d9cb25595b17c3f008ebf0bf4b6190020a793d7 100644
--- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
+++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
@@ -21,11 +21,12 @@ struct imx_legacy_bridge {
 };
 
 #define to_imx_legacy_bridge(bridge)	container_of(bridge, struct imx_legacy_bridge, base)
 
 static int imx_legacy_bridge_attach(struct drm_bridge *bridge,
-				   enum drm_bridge_attach_flags flags)
+				    struct drm_encoder *encoder,
+				    enum drm_bridge_attach_flags flags)
 {
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index a17433a7c75530668662ed8dd1526b44f9a32f32..8a4fd7d77a8d516b3b46f41cf07d2633d23bde12 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -38,15 +38,16 @@ to_imx8mp_hdmi_pvi(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct imx8mp_hdmi_pvi, bridge);
 }
 
 static int imx8mp_hdmi_pvi_bridge_attach(struct drm_bridge *bridge,
+					 struct drm_encoder *encoder,
 					 enum drm_bridge_attach_flags flags)
 {
 	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, pvi->next_bridge,
+	return drm_bridge_attach(encoder, pvi->next_bridge,
 				 bridge, flags);
 }
 
 static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *state)
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 1d9529dc7f2a93e7547ae1f4c6193598a5574135..1f6fd488e7039e943351006d3373009f0c15cb08 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -106,10 +106,11 @@ imx8qxp_pc_bridge_mode_valid(struct drm_bridge *bridge,
 
 	return MODE_OK;
 }
 
 static int imx8qxp_pc_bridge_attach(struct drm_bridge *bridge,
+				    struct drm_encoder *encoder,
 				    enum drm_bridge_attach_flags flags)
 {
 	struct imx8qxp_pc_channel *ch = bridge->driver_private;
 	struct imx8qxp_pc *pc = ch->pc;
 
@@ -117,11 +118,11 @@ static int imx8qxp_pc_bridge_attach(struct drm_bridge *bridge,
 		DRM_DEV_ERROR(pc->dev,
 			      "do not support creating a drm_connector\n");
 		return -EINVAL;
 	}
 
-	return drm_bridge_attach(bridge->encoder,
+	return drm_bridge_attach(encoder,
 				 ch->next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
 static void
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index cd6818db0fd332cac03241917bbb107b7261097c..e092c9ea99b0224802919ff84b448acb53508951 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -126,21 +126,22 @@ static void imx8qxp_pixel_link_set_mst_addr(struct imx8qxp_pixel_link *pl)
 			      "failed to set DC%u stream%u pixel link mst addr(%u): %d\n",
 			      pl->dc_id, pl->stream_id, pl->mst_addr, ret);
 }
 
 static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
+					    struct drm_encoder *encoder,
 					    enum drm_bridge_attach_flags flags)
 {
 	struct imx8qxp_pixel_link *pl = bridge->driver_private;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
 		DRM_DEV_ERROR(pl->dev,
 			      "do not support creating a drm_connector\n");
 		return -EINVAL;
 	}
 
-	return drm_bridge_attach(bridge->encoder,
+	return drm_bridge_attach(encoder,
 				 pl->next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
 static void
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 49dd4f96d52c966d9a038b0b04007631d0837f4d..da138ab51b3bd2c6ebd3780c09818891d5320092 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -46,21 +46,22 @@ struct imx8qxp_pxl2dpi {
 };
 
 #define bridge_to_p2d(b)	container_of(b, struct imx8qxp_pxl2dpi, bridge)
 
 static int imx8qxp_pxl2dpi_bridge_attach(struct drm_bridge *bridge,
+					 struct drm_encoder *encoder,
 					 enum drm_bridge_attach_flags flags)
 {
 	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
 		DRM_DEV_ERROR(p2d->dev,
 			      "do not support creating a drm_connector\n");
 		return -EINVAL;
 	}
 
-	return drm_bridge_attach(bridge->encoder,
+	return drm_bridge_attach(encoder,
 				 p2d->next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
 static int
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 21152a1c28f7f5e326794488f473b030219a2f65..a3a63a977b0a8487ad38fc08e0eed08672f4d41a 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -663,33 +663,34 @@ it6263_bridge_mode_valid(struct drm_bridge *bridge,
 
 	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
 }
 
 static int it6263_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
 	struct drm_connector *connector;
 	int ret;
 
-	ret = drm_bridge_attach(bridge->encoder, it->next_bridge, bridge,
+	ret = drm_bridge_attach(encoder, it->next_bridge, bridge,
 				flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		return ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return 0;
 
-	connector = drm_bridge_connector_init(bridge->dev, bridge->encoder);
+	connector = drm_bridge_connector_init(bridge->dev, encoder);
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
 		dev_err(it->dev, "failed to initialize bridge connector: %d\n",
 			ret);
 		return ret;
 	}
 
-	drm_connector_attach_encoder(connector, bridge->encoder);
+	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
 }
 
 static enum drm_connector_status it6263_bridge_detect(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 8a607558ac89ed2961d13515d987c141f2b6e116..4e8b1dcba64fcf09ffd68d1a57dec5d30190ebe6 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3122,10 +3122,11 @@ static inline struct it6505 *bridge_to_it6505(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct it6505, bridge);
 }
 
 static int it6505_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
 	struct device *dev = it6505->dev;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index b9f90f32145de0f17eadfdf0efbe95a2b5ca026d..7b110ae532918d2d6f91ebc5f747c38e7e77dc07 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -584,19 +584,20 @@ static bool it66121_is_hpd_detect(struct it66121_ctx *ctx)
 
 	return val & IT66121_SYS_STATUS_HPDETECT;
 }
 
 static int it66121_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
 	int ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	ret = drm_bridge_attach(bridge->encoder, ctx->next_bridge, bridge, flags);
+	ret = drm_bridge_attach(encoder, ctx->next_bridge, bridge, flags);
 	if (ret)
 		return ret;
 
 	if (ctx->info->id == ID_IT66121) {
 		ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 52da204f57404e63c7eadb4318b55082ae732105..3e49d855b3648880cea9bce5f3f04fbb6f838a45 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -541,16 +541,17 @@ static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
 exit:
 	return ret;
 }
 
 static int lt8912_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 	int ret;
 
-	ret = drm_bridge_attach(bridge->encoder, lt->hdmi_port, bridge,
+	ret = drm_bridge_attach(encoder, lt->hdmi_port, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0) {
 		dev_err(lt->dev, "Failed to attach next bridge (%d)\n", ret);
 		return ret;
 	}
diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 0fc5ea18fe6a8d0c1578dcae960d78cc33f4fb6d..9b2dac9bd63c5afd4ffbafafdbbb1230549bc36f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -97,15 +97,16 @@ static struct lt9211 *bridge_to_lt9211(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct lt9211, bridge);
 }
 
 static int lt9211_attach(struct drm_bridge *bridge,
+			 struct drm_encoder *encoder,
 			 enum drm_bridge_attach_flags flags)
 {
 	struct lt9211 *ctx = bridge_to_lt9211(bridge);
 
-	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
+	return drm_bridge_attach(encoder, ctx->panel_bridge,
 				 &ctx->bridge, flags);
 }
 
 static int lt9211_read_chipid(struct lt9211 *ctx)
 {
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 026803034231f78c17f619dc04119bdd9b2b6679..53987e826ccd3368e94a1d7563354d359ebcbb17 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -738,15 +738,16 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 
 	return dsi;
 }
 
 static int lt9611_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	return drm_bridge_attach(bridge->encoder, lt9611->next_bridge,
+	return drm_bridge_attach(encoder, lt9611->next_bridge,
 				 bridge, flags);
 }
 
 static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_info *info,
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index f4c3ff1fdc6923eb7a8c0d8f7f92e7649c797d77..20bf1a3c786d8ecc10ac58225f28e5c519fd1bf9 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -278,15 +278,16 @@ static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
 
 	return dsi;
 }
 
 static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
+				   struct drm_encoder *encoder,
 				   enum drm_bridge_attach_flags flags)
 {
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
 
-	return drm_bridge_attach(bridge->encoder, lt9611uxc->next_bridge,
+	return drm_bridge_attach(encoder, lt9611uxc->next_bridge,
 				 bridge, flags);
 }
 
 static enum drm_mode_status
 lt9611uxc_bridge_mode_valid(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 389af0233fcdec9af7a4fbfe8d267170fbc4759c..1646e454e0b0b558d00f9421f15bb7084e2aa45a 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -32,15 +32,16 @@ static inline struct lvds_codec *to_lvds_codec(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct lvds_codec, bridge);
 }
 
 static int lvds_codec_attach(struct drm_bridge *bridge,
+			     struct drm_encoder *encoder,
 			     enum drm_bridge_attach_flags flags)
 {
 	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
 
-	return drm_bridge_attach(bridge->encoder, lvds_codec->panel_bridge,
+	return drm_bridge_attach(encoder, lvds_codec->panel_bridge,
 				 bridge, flags);
 }
 
 static void lvds_codec_enable(struct drm_bridge *bridge)
 {
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index a47aabf134fd5c78448eae50b14a5ec322e6d6d0..15a5a1f644fc10182c55bc9e489ccb81d4f924f9 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -188,10 +188,11 @@ static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
 
 	return IRQ_HANDLED;
 }
 
 static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct i2c_client *stdp4028_i2c
 			= ge_b850v3_lvds_ptr->stdp4028_i2c;
 
diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 53dd140a1b8d1b333c1f932b4d205a028f818251..1d4ae0097df847d9f93c79eecff0c4587ae331ba 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -102,15 +102,16 @@ static void lvds_serialiser_on(struct mchp_lvds *lvds)
 	/* Enable the LVDS serializer */
 	lvds_writel(lvds, LVDSC_CR, LVDSC_CR_SER_EN);
 }
 
 static int mchp_lvds_attach(struct drm_bridge *bridge,
+			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 
-	return drm_bridge_attach(bridge->encoder, lvds->panel_bridge,
+	return drm_bridge_attach(encoder, lvds->panel_bridge,
 				 bridge, flags);
 }
 
 static void mchp_lvds_enable(struct drm_bridge *bridge)
 {
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 09b8b2e7d9fb358b5fb11d9646cf9c2f13221f3c..2a536c61c92b89ee2f332daa944dfff974ba18d2 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -908,20 +908,21 @@ static void nwl_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (ret < 0)
 		DRM_DEV_ERROR(dsi->dev, "Failed to deassert DPI: %d\n", ret);
 }
 
 static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 	struct drm_bridge *panel_bridge;
 
 	panel_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
 	if (IS_ERR(panel_bridge))
 		return PTR_ERR(panel_bridge);
 
-	return drm_bridge_attach(bridge->encoder, panel_bridge, bridge, flags);
+	return drm_bridge_attach(encoder, panel_bridge, bridge, flags);
 }
 
 static u32 *nwl_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 						 struct drm_bridge_state *bridge_state,
 						 struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 27261b2ac9c83c311201b20f02aef7afeb6475b2..25d7c415478b14ef634bff4185a8dd8e866be0c6 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -212,17 +212,18 @@ static const struct drm_connector_funcs ptn3460_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int ptn3460_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
 	int ret;
 
 	/* Let this driver create connector if requested */
-	ret = drm_bridge_attach(bridge->encoder, ptn_bridge->panel_bridge,
+	ret = drm_bridge_attach(encoder, ptn_bridge->panel_bridge,
 				bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		return ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
@@ -237,11 +238,11 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 	}
 	drm_connector_helper_add(&ptn_bridge->connector,
 					&ptn3460_connector_helper_funcs);
 	drm_connector_register(&ptn_bridge->connector);
 	drm_connector_attach_encoder(&ptn_bridge->connector,
-							bridge->encoder);
+							encoder);
 
 	drm_helper_hpd_irq_event(ptn_bridge->connector.dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 890bd45c46eda8366e44974e3ec5891aa473fd00..41eac98c29d7592110a1e2f4a60b447586fbffd6 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -56,10 +56,11 @@ static const struct drm_connector_funcs panel_bridge_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int panel_bridge_attach(struct drm_bridge *bridge,
+			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
 	int ret;
@@ -79,11 +80,11 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	drm_panel_bridge_set_orientation(connector, bridge);
 
 	drm_connector_attach_encoder(&panel_bridge->connector,
-					  bridge->encoder);
+					  encoder);
 
 	if (bridge->dev->registered) {
 		if (connector->funcs->reset)
 			connector->funcs->reset(connector);
 		drm_connector_register(connector);
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 13ada42a55142cd22696671e8fb363bee6d6aa68..8726fefc5c654e49bce029d943d241789ca4f802 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -416,10 +416,11 @@ static void ps8622_post_disable(struct drm_bridge *bridge)
 
 	msleep(PS8622_POWER_OFF_T17_MS);
 }
 
 static int ps8622_attach(struct drm_bridge *bridge,
+			 struct drm_encoder *encoder,
 			 enum drm_bridge_attach_flags flags)
 {
 	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
 
 	return drm_bridge_attach(ps8622->bridge.encoder, ps8622->panel_bridge,
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index a42138b33258a48a303a97fbb07504893aeafaf7..2422ff68c1042bd8eaa6821ff387d4faad47c550 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -492,10 +492,11 @@ static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
 
 	mutex_unlock(&ps_bridge->aux_lock);
 }
 
 static int ps8640_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 	struct device *dev = &ps_bridge->page[0]->dev;
 	int ret;
@@ -516,11 +517,11 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 		ret = -EINVAL;
 		goto err_devlink;
 	}
 
 	/* Attach the panel-bridge to the dsi bridge */
-	ret = drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
+	ret = drm_bridge_attach(encoder, ps_bridge->panel_bridge,
 				&ps_bridge->bridge, flags);
 	if (ret)
 		goto err_bridge_attach;
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 54de6ed2fae81bc13301a6b1ee8f38183a3118b6..55ac6bd5da08c037aa7974df679d51e72bc54faf 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1638,15 +1638,16 @@ static void samsung_dsim_mode_set(struct drm_bridge *bridge,
 
 	drm_mode_copy(&dsi->mode, adjusted_mode);
 }
 
 static int samsung_dsim_attach(struct drm_bridge *bridge,
+			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi->out_bridge, bridge,
 				 flags);
 }
 
 static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 2100a687096e50c83a7c554e6d21b3c638ef713b..4d2fca64c50b4d7f7bc7f6f0edcaf47aa5e3d1f3 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -414,19 +414,20 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
 out:
 	mutex_unlock(&sii902x->mutex);
 }
 
 static int sii902x_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	struct drm_device *drm = bridge->dev;
 	int ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return drm_bridge_attach(bridge->encoder, sii902x->next_bridge,
+		return drm_bridge_attach(encoder, sii902x->next_bridge,
 					 bridge, flags);
 
 	drm_connector_helper_add(&sii902x->connector,
 				 &sii902x_connector_helper_funcs);
 
@@ -450,11 +451,11 @@ static int sii902x_bridge_attach(struct drm_bridge *bridge,
 	ret = drm_display_info_set_bus_formats(&sii902x->connector.display_info,
 					       &bus_format, 1);
 	if (ret)
 		return ret;
 
-	drm_connector_attach_encoder(&sii902x->connector, bridge->encoder);
+	drm_connector_attach_encoder(&sii902x->connector, encoder);
 
 	return 0;
 }
 
 static enum drm_connector_status sii902x_bridge_detect(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 28a2e1ee04b2828364c6e633399b821562fc8728..3af650dc92a1612ca88fe378319519546b79901f 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2201,10 +2201,11 @@ static inline struct sii8620 *bridge_to_sii8620(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct sii8620, bridge);
 }
 
 static int sii8620_attach(struct drm_bridge *bridge,
+			  struct drm_encoder *encoder,
 			  enum drm_bridge_attach_flags flags)
 {
 	struct sii8620 *ctx = bridge_to_sii8620(bridge);
 
 	sii8620_init_rcp_input_dev(ctx);
diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index ab0b0e36e97ac244427ac316acd9230c9490f2ce..70db5b99e5bb84f099ec54cf62abbda53475311d 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -101,16 +101,17 @@ static const struct drm_connector_funcs simple_bridge_con_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
 static int simple_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
 	int ret;
 
-	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
+	ret = drm_bridge_attach(encoder, sbridge->next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		return ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
@@ -125,11 +126,11 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
 		return ret;
 	}
 
-	drm_connector_attach_encoder(&sbridge->connector, bridge->encoder);
+	drm_connector_attach_encoder(&sbridge->connector, encoder);
 
 	return 0;
 }
 
 static void simple_bridge_enable(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0890add5f7070f13fefad923526e92f516f06764..b1cdf806b3c4007dfef09c632fea354f7f6001b5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2887,16 +2887,17 @@ static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 
 	return 0;
 }
 
 static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
+		return drm_bridge_attach(encoder, hdmi->next_bridge,
 					 bridge, flags);
 
 	return dw_hdmi_connector_create(hdmi);
 }
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 2b6e70a49f438c475bc60d9595bf246a9e54995b..b08ada920a501d6a62f39581944a87019f5e5c15 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1070,19 +1070,20 @@ dw_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 
 	return mode_status;
 }
 
 static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
+				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 
 	/* Set the encoder type as caller does not know it */
-	bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;
+	encoder->encoder_type = DRM_MODE_ENCODER_DSI;
 
 	/* Attach the panel-bridge to the dsi bridge */
-	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi->panel_bridge, bridge,
 				 flags);
 }
 
 static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index 5fd7a459efdd4fc4884cdf77ffedc19c36d1ca13..c76f5f2e74d14bd372f969c6c7832aa57f80772b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -868,19 +868,20 @@ dw_mipi_dsi2_bridge_mode_valid(struct drm_bridge *bridge,
 
 	return mode_status;
 }
 
 static int dw_mipi_dsi2_bridge_attach(struct drm_bridge *bridge,
+				      struct drm_encoder *encoder,
 				      enum drm_bridge_attach_flags flags)
 {
 	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
 
 	/* Set the encoder type as caller does not know it */
-	bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;
+	encoder->encoder_type = DRM_MODE_ENCODER_DSI;
 
 	/* Attach the panel-bridge to the dsi bridge */
-	return drm_bridge_attach(bridge->encoder, dsi2->panel_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi2->panel_bridge, bridge,
 				 flags);
 }
 
 static const struct drm_bridge_funcs dw_mipi_dsi2_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 49c76027f8316967ea4f7d7dfb85920a025b6df9..edf01476f2ef6e05ef2c144ff4467e7f6babc4c6 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -200,15 +200,16 @@ static void tc358762_enable(struct drm_bridge *bridge,
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
 }
 
 static int tc358762_attach(struct drm_bridge *bridge,
+			   struct drm_encoder *encoder,
 			   enum drm_bridge_attach_flags flags)
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 
-	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
+	return drm_bridge_attach(encoder, ctx->panel_bridge,
 				 bridge, flags);
 }
 
 static void tc358762_bridge_mode_set(struct drm_bridge *bridge,
 				     const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 3d3d135b43487aaf5a1908c21c1c988e87d24d48..3f76c890fad9ffa50dc02f289a37378332830516 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -293,15 +293,16 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
 }
 
 static int tc358764_attach(struct drm_bridge *bridge,
+			   struct drm_encoder *encoder,
 			   enum drm_bridge_attach_flags flags)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
 
-	return drm_bridge_attach(bridge->encoder, ctx->next_bridge, bridge, flags);
+	return drm_bridge_attach(encoder, ctx->next_bridge, bridge, flags);
 }
 
 static const struct drm_bridge_funcs tc358764_bridge_funcs = {
 	.post_disable = tc358764_post_disable,
 	.pre_enable = tc358764_pre_enable,
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 39e2d3a7a27d2603bb847d55c4812fb170389ba0..7e5449fb86a3fcdae8255bc490d12c543ef3f8ae 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1793,10 +1793,11 @@ static const struct drm_connector_funcs tc_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int tc_dpi_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 
 	if (!tc->panel_bridge)
@@ -1805,10 +1806,11 @@ static int tc_dpi_bridge_attach(struct drm_bridge *bridge,
 	return drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
 				 &tc->bridge, flags);
 }
 
 static int tc_edp_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	struct tc_data *tc = bridge_to_tc(bridge);
 	struct drm_device *drm = bridge->dev;
diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index ec79b0dd0e2cd6dfbdd8aee54d6a8d9cf8bfb060..6db18d1e8824dd7d387211d6d1e668645cf88bbe 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -552,20 +552,21 @@ static const struct mipi_dsi_host_ops tc358768_dsi_host_ops = {
 	.detach = tc358768_dsi_host_detach,
 	.transfer = tc358768_dsi_host_transfer,
 };
 
 static int tc358768_bridge_attach(struct drm_bridge *bridge,
+				  struct drm_encoder *encoder,
 				  enum drm_bridge_attach_flags flags)
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 
 	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
 		dev_err(priv->dev, "needs atomic updates support\n");
 		return -ENOTSUPP;
 	}
 
-	return drm_bridge_attach(bridge->encoder, priv->output.bridge, bridge,
+	return drm_bridge_attach(encoder, priv->output.bridge, bridge,
 				 flags);
 }
 
 static enum drm_mode_status
 tc358768_bridge_mode_valid(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index c89757bec4e6cc59ea0e84b1096ba71b077d408e..13cd48e77d2d3f8dd646078fb7de95c420f29f73 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -587,16 +587,17 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 
 	return 0;
 }
 
 static int tc_bridge_attach(struct drm_bridge *bridge,
+			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 
 	/* Attach the panel-bridge to the dsi bridge */
-	return drm_bridge_attach(bridge->encoder, tc->panel_bridge,
+	return drm_bridge_attach(encoder, tc->panel_bridge,
 				 &tc->bridge, flags);
 }
 
 static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.attach = tc_bridge_attach,
diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index bba10cf9b4f96aef69f82403a7642d08c2b9f4b7..e2fc78adebcf22f0d8cdb484078e37b748b776c6 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -41,15 +41,16 @@ static inline struct thc63_dev *to_thc63(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct thc63_dev, bridge);
 }
 
 static int thc63_attach(struct drm_bridge *bridge,
+			struct drm_encoder *encoder,
 			enum drm_bridge_attach_flags flags)
 {
 	struct thc63_dev *thc63 = to_thc63(bridge);
 
-	return drm_bridge_attach(bridge->encoder, thc63->next, bridge, flags);
+	return drm_bridge_attach(encoder, thc63->next, bridge, flags);
 }
 
 static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
 					const struct drm_display_info *info,
 					const struct drm_display_mode *mode)
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index 85f2a0e74a1c8aaa272ce828ad1c82660503b7a8..47638d1c96ec5ad999604c8c7e8839ff85936d98 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -240,16 +240,16 @@ static void dlpc_mode_set(struct drm_bridge *bridge,
 	struct dlpc *dlpc = bridge_to_dlpc(bridge);
 
 	drm_mode_copy(&dlpc->mode, adjusted_mode);
 }
 
-static int dlpc_attach(struct drm_bridge *bridge,
+static int dlpc_attach(struct drm_bridge *bridge, struct drm_encoder *encoder,
 		       enum drm_bridge_attach_flags flags)
 {
 	struct dlpc *dlpc = bridge_to_dlpc(bridge);
 
-	return drm_bridge_attach(bridge->encoder, dlpc->next_bridge, bridge, flags);
+	return drm_bridge_attach(encoder, dlpc->next_bridge, bridge, flags);
 }
 
 static const struct drm_bridge_funcs dlpc_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index ab77dff65607f5eec4b36519dccb2465274d2df9..7c6c38988c404c2f750f02e5607a416178940a2b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -282,15 +282,16 @@ static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct sn65dsi83, bridge);
 }
 
 static int sn65dsi83_attach(struct drm_bridge *bridge,
+			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 
-	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
+	return drm_bridge_attach(encoder, ctx->panel_bridge,
 				 &ctx->bridge, flags);
 }
 
 static void sn65dsi83_detach(struct drm_bridge *bridge)
 {
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index ae34585e05b307934d9fbf0dfd7ad159a99d4c17..066a65eb03ede1cb5bcbc4511381adb9406f923b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -730,10 +730,11 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
 
 	return devm_mipi_dsi_attach(&adev->dev, dsi);
 }
 
 static int ti_sn_bridge_attach(struct drm_bridge *bridge,
+			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int ret;
 
@@ -746,11 +747,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 
 	/*
 	 * Attach the next bridge.
 	 * We never want the next bridge to *also* create a connector.
 	 */
-	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
+	ret = drm_bridge_attach(encoder, pdata->next_bridge,
 				&pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		goto err_initted_aux;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
diff --git a/drivers/gpu/drm/bridge/ti-tdp158.c b/drivers/gpu/drm/bridge/ti-tdp158.c
index 22316382451fa3a55e1b3977982bd306b52b5888..cca75443f0121e39527a6cecf711eff2c0d507b5 100644
--- a/drivers/gpu/drm/bridge/ti-tdp158.c
+++ b/drivers/gpu/drm/bridge/ti-tdp158.c
@@ -43,15 +43,17 @@ static void tdp158_disable(struct drm_bridge *bridge,
 	gpiod_set_value_cansleep(tdp158->enable, 0);
 	regulator_disable(tdp158->vdd);
 	regulator_disable(tdp158->vcc);
 }
 
-static int tdp158_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
+static int tdp158_attach(struct drm_bridge *bridge,
+			 struct drm_encoder *encoder,
+			 enum drm_bridge_attach_flags flags)
 {
 	struct tdp158 *tdp158 = bridge->driver_private;
 
-	return drm_bridge_attach(bridge->encoder, tdp158->next, bridge, flags);
+	return drm_bridge_attach(encoder, tdp158->next, bridge, flags);
 }
 
 static const struct drm_bridge_funcs tdp158_bridge_funcs = {
 	.attach = tdp158_attach,
 	.atomic_enable = tdp158_enable,
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 79ab5da827e1fd3850435a02daedad87186a4ab8..e15d232ddbac55c6f5f966471a6c63f9c29a06c1 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -118,16 +118,17 @@ static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
 	mod_delayed_work(system_wq, &dvi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 }
 
 static int tfp410_attach(struct drm_bridge *bridge,
+			 struct drm_encoder *encoder,
 			 enum drm_bridge_attach_flags flags)
 {
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 	int ret;
 
-	ret = drm_bridge_attach(bridge->encoder, dvi->next_bridge, bridge,
+	ret = drm_bridge_attach(encoder, dvi->next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		return ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
@@ -157,11 +158,11 @@ static int tfp410_attach(struct drm_bridge *bridge,
 	}
 
 	drm_display_info_set_bus_formats(&dvi->connector.display_info,
 					 &dvi->bus_format, 1);
 
-	drm_connector_attach_encoder(&dvi->connector, bridge->encoder);
+	drm_connector_attach_encoder(&dvi->connector, encoder);
 
 	return 0;
 }
 
 static void tfp410_detach(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index 47b74cb25b14fcf4a09137d8b5b7f4ff739eae59..1c289051a5987e0aec4c286ef4c01ee1a2f9421f 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -36,19 +36,20 @@ static inline struct tpd12s015_device *to_tpd12s015(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct tpd12s015_device, bridge);
 }
 
 static int tpd12s015_attach(struct drm_bridge *bridge,
+			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct tpd12s015_device *tpd = to_tpd12s015(bridge);
 	int ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	ret = drm_bridge_attach(bridge->encoder, tpd->next_bridge,
+	ret = drm_bridge_attach(encoder, tpd->next_bridge,
 				bridge, flags);
 	if (ret < 0)
 		return ret;
 
 	gpiod_set_value_cansleep(tpd->ls_oe_gpio, 1);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index fa2794217a903b6c61e58edf14756a72f99dad38..8241c00e4506eceeb9bb4ba74a38d8f360c65d38 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -325,11 +325,11 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		list_add(&bridge->chain_node, &previous->chain_node);
 	else
 		list_add(&bridge->chain_node, &encoder->bridge_chain);
 
 	if (bridge->funcs->attach) {
-		ret = bridge->funcs->attach(bridge, flags);
+		ret = bridge->funcs->attach(bridge, encoder, flags);
 		if (ret < 0)
 			goto err_reset_bridge;
 	}
 
 	if (bridge->funcs->atomic_reset) {
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 82d4a4e206a584e045a8fcd593fc12b7c1257bfe..a8669b27e916389da6f5ecc6e5ad608fddb594a2 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1362,10 +1362,11 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
 }
 
 /* DRM bridge functions */
 
 static int tda998x_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 9e66eb77b1ebe853599a60df69ce8db94fdffd49..6d8325c766979aa3ba98970f00806e99c139d3c3 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -160,15 +160,16 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
 
 	return 0;
 }
 
 static int imx_pd_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
 
-	return drm_bridge_attach(bridge->encoder, imxpd->next_bridge, bridge, flags);
+	return drm_bridge_attach(encoder, imxpd->next_bridge, bridge, flags);
 }
 
 static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
 	.attach = imx_pd_bridge_attach,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 20b93fff023995062096941ae571756185688387..f851e9ffdb280388452c9ad0883932f5b990d6f0 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -789,15 +789,16 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	regmap_write(priv->map, JZ_REG_LCD_CFG, cfg);
 	regmap_write(priv->map, JZ_REG_LCD_RGBC, rgbcfg);
 }
 
 static int ingenic_drm_bridge_attach(struct drm_bridge *bridge,
+				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
 {
-	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge->encoder);
+	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(encoder);
 
-	return drm_bridge_attach(bridge->encoder, ib->next_bridge,
+	return drm_bridge_attach(encoder, ib->next_bridge,
 				 &ib->bridge, flags);
 }
 
 static int ingenic_drm_bridge_atomic_check(struct drm_bridge *bridge,
 					   struct drm_bridge_state *bridge_state,
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 395449a72f0a1dc0d8ee97ecd245ca52f0282402..b302d8ec3ad0e82ace9c10194ae37948ebb8e753 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1046,10 +1046,11 @@ void mcde_dsi_disable(struct drm_bridge *bridge)
 	clk_disable_unprepare(d->hs_clk);
 	clk_disable_unprepare(d->lp_clk);
 }
 
 static int mcde_dsi_bridge_attach(struct drm_bridge *bridge,
+				  struct drm_encoder *encoder,
 				  enum drm_bridge_attach_flags flags)
 {
 	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
 	struct drm_device *drm = bridge->dev;
 
@@ -1057,11 +1058,11 @@ static int mcde_dsi_bridge_attach(struct drm_bridge *bridge,
 		dev_err(d->dev, "we need atomic updates\n");
 		return -ENOTSUPP;
 	}
 
 	/* Attach the DSI bridge to the output (panel etc) bridge */
-	return drm_bridge_attach(bridge->encoder, d->bridge_out, bridge, flags);
+	return drm_bridge_attach(encoder, d->bridge_out, bridge, flags);
 }
 
 static const struct drm_bridge_funcs mcde_dsi_bridge_funcs = {
 	.attach = mcde_dsi_bridge_attach,
 	.mode_set = mcde_dsi_bridge_mode_set,
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 3d4648d2e15f1a1a3c6ae596e1a35cd654fcc35c..4523cc0a2db8cd8b57183e11140b8a6584e95a34 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2285,10 +2285,11 @@ static void mtk_dp_poweroff(struct mtk_dp *mtk_dp)
 	mtk_dp_power_disable(mtk_dp);
 	phy_exit(mtk_dp->phy);
 }
 
 static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	int ret;
 
@@ -2308,11 +2309,11 @@ static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
 	ret = mtk_dp_poweron(mtk_dp);
 	if (ret)
 		goto err_aux_register;
 
 	if (mtk_dp->next_bridge) {
-		ret = drm_bridge_attach(bridge->encoder, mtk_dp->next_bridge,
+		ret = drm_bridge_attach(encoder, mtk_dp->next_bridge,
 					&mtk_dp->bridge, flags);
 		if (ret) {
 			drm_warn(mtk_dp->drm_dev,
 				 "Failed to attach external bridge: %d\n", ret);
 			goto err_bridge_attach;
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 1864eb02dbf50af09c65064834a8b27ca56c3528..6b96ed4fc8614569e53f76fe3e52507c7dc1249c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -699,10 +699,11 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 
 	return 0;
 }
 
 static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 	int ret;
 
@@ -717,11 +718,11 @@ static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
 		if (IS_ERR(dpi->next_bridge))
 			return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_bridge),
 					     "Failed to get bridge\n");
 	}
 
-	return drm_bridge_attach(bridge->encoder, dpi->next_bridge,
+	return drm_bridge_attach(encoder, dpi->next_bridge,
 				 &dpi->bridge, flags);
 }
 
 static void mtk_dpi_bridge_mode_set(struct drm_bridge *bridge,
 				const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index b50dc9a013ac5a50e464134f548fa773a5662138..bd3133f604506c4ee4f1126c6e339f28d75ee02a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -805,16 +805,17 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
 
 	dsi->enabled = false;
 }
 
 static int mtk_dsi_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 
 	/* Attach the panel or bridge to the dsi bridge */
-	return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
+	return drm_bridge_attach(encoder, dsi->next_bridge,
 				 &dsi->bridge, flags);
 }
 
 static void mtk_dsi_bridge_mode_set(struct drm_bridge *bridge,
 				    const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index ac5e40c2761710dfbe722e1ba569d76e4cd5b8fb..b24ebce8163ae6f0a876b53f1ec21348d5ac5286 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1276,10 +1276,11 @@ static const struct drm_edid *mtk_hdmi_bridge_edid_read(struct drm_bridge *bridg
 
 	return drm_edid;
 }
 
 static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
+				  struct drm_encoder *encoder,
 				  enum drm_bridge_attach_flags flags)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 	int ret;
 
@@ -1288,11 +1289,11 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 			  __func__);
 		return -EINVAL;
 	}
 
 	if (hdmi->next_bridge) {
-		ret = drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
+		ret = drm_bridge_attach(encoder, hdmi->next_bridge,
 					bridge, flags);
 		if (ret)
 			return ret;
 	}
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index e79f7c3ce32efa8e5fe7afe274fe991ac363b734..c9678dc68fa142882e2beb24fe81185fbdef733b 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -81,16 +81,17 @@ meson_cvbs_get_mode(const struct drm_display_mode *req_mode)
 
 	return NULL;
 }
 
 static int meson_encoder_cvbs_attach(struct drm_bridge *bridge,
+				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
 {
 	struct meson_encoder_cvbs *meson_encoder_cvbs =
 					bridge_to_meson_encoder_cvbs(bridge);
 
-	return drm_bridge_attach(bridge->encoder, meson_encoder_cvbs->next_bridge,
+	return drm_bridge_attach(encoder, meson_encoder_cvbs->next_bridge,
 				 &meson_encoder_cvbs->bridge, flags);
 }
 
 static int meson_encoder_cvbs_get_modes(struct drm_bridge *bridge,
 					struct drm_connector *connector)
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index fe204437bd6576a258dc11319e2b905f170a24a1..3db518e5f95d324c218b730e0948c3dc845382bd 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -31,15 +31,16 @@ struct meson_encoder_dsi {
 
 #define bridge_to_meson_encoder_dsi(x) \
 	container_of(x, struct meson_encoder_dsi, bridge)
 
 static int meson_encoder_dsi_attach(struct drm_bridge *bridge,
+				    struct drm_encoder *encoder,
 				    enum drm_bridge_attach_flags flags)
 {
 	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, encoder_dsi->next_bridge,
+	return drm_bridge_attach(encoder, encoder_dsi->next_bridge,
 				 &encoder_dsi->bridge, flags);
 }
 
 static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
 					    struct drm_atomic_state *state)
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 6d1c9262a2cfb7b08a68efb86821bf5ecf8c0941..5f02695aafd1aa8444cd936a36e8f3a8010881a0 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -47,15 +47,16 @@ struct meson_encoder_hdmi {
 
 #define bridge_to_meson_encoder_hdmi(x) \
 	container_of(x, struct meson_encoder_hdmi, bridge)
 
 static int meson_encoder_hdmi_attach(struct drm_bridge *bridge,
+				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, encoder_hdmi->next_bridge,
+	return drm_bridge_attach(encoder, encoder_hdmi->next_bridge,
 				 &encoder_hdmi->bridge, flags);
 }
 
 static void meson_encoder_hdmi_detach(struct drm_bridge *bridge)
 {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index a210b7c9e5ca281a46fbdb226e25832719a684ea..895ba9815a652f00f7ace9cb7125ef8cef555d35 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -422,16 +422,17 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 
 	return msm_dsi_host_check_dsc(host, mode);
 }
 
 static int dsi_mgr_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 
-	return drm_bridge_attach(bridge->encoder, msm_dsi->next_bridge,
+	return drm_bridge_attach(encoder, msm_dsi->next_bridge,
 				 bridge, flags);
 }
 
 static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 	.attach = dsi_mgr_bridge_attach,
diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index b17e77f700ddda6c9972e5ff10d394fd72bf96b3..6eff97a091602f6d137095b3b7bf54fce17e8d3e 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -418,20 +418,21 @@ static void dpi_init_pll(struct dpi_data *dpi)
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
  */
 
 static int dpi_bridge_attach(struct drm_bridge *bridge,
+			     struct drm_encoder *encoder,
 			     enum drm_bridge_attach_flags flags)
 {
 	struct dpi_data *dpi = drm_bridge_to_dpi(bridge);
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
 	dpi_init_pll(dpi);
 
-	return drm_bridge_attach(bridge->encoder, dpi->output.next_bridge,
+	return drm_bridge_attach(encoder, dpi->output.next_bridge,
 				 bridge, flags);
 }
 
 static enum drm_mode_status
 dpi_bridge_mode_valid(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 59d20eb8a7e0fdcc13060d00980452bc80c54eb2..35e3e332bdcf4cf69659de65deeea0f5dbd70358 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4615,18 +4615,19 @@ static const struct component_ops dsi_component_ops = {
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
  */
 
 static int dsi_bridge_attach(struct drm_bridge *bridge,
+			     struct drm_encoder *encoder,
 			     enum drm_bridge_attach_flags flags)
 {
 	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	return drm_bridge_attach(bridge->encoder, dsi->output.next_bridge,
+	return drm_bridge_attach(encoder, dsi->output.next_bridge,
 				 bridge, flags);
 }
 
 static enum drm_mode_status
 dsi_bridge_mode_valid(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index e1ac447221ee5ae5ee50637acfc8a30a8f111850..a3b22952fdc32b5899dae82d413108c5c0a1c3c8 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -312,18 +312,19 @@ void hdmi4_core_disable(struct hdmi_core_data *core)
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
  */
 
 static int hdmi4_bridge_attach(struct drm_bridge *bridge,
+			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	return drm_bridge_attach(bridge->encoder, hdmi->output.next_bridge,
+	return drm_bridge_attach(encoder, hdmi->output.next_bridge,
 				 bridge, flags);
 }
 
 static void hdmi4_bridge_mode_set(struct drm_bridge *bridge,
 				  const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index fa9904e4c218235bafa87be600680b3e5d5e2ea5..0c98444d39a93d8336b4d8dbd45aa4521181c3b4 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -310,18 +310,19 @@ static void hdmi_core_disable(struct omap_hdmi *hdmi)
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
  */
 
 static int hdmi5_bridge_attach(struct drm_bridge *bridge,
+			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	return drm_bridge_attach(bridge->encoder, hdmi->output.next_bridge,
+	return drm_bridge_attach(encoder, hdmi->output.next_bridge,
 				 bridge, flags);
 }
 
 static void hdmi5_bridge_mode_set(struct drm_bridge *bridge,
 				  const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index f9ae358e8e52145b3832b18286ba4834f3c2d8db..e78826e4b560a2b9af2d8a5a38e181bd3e44d250 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -126,18 +126,19 @@ static void sdi_config_lcd_manager(struct sdi_device *sdi)
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
  */
 
 static int sdi_bridge_attach(struct drm_bridge *bridge,
+			     struct drm_encoder *encoder,
 			     enum drm_bridge_attach_flags flags)
 {
 	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	return drm_bridge_attach(bridge->encoder, sdi->output.next_bridge,
+	return drm_bridge_attach(encoder, sdi->output.next_bridge,
 				 bridge, flags);
 }
 
 static enum drm_mode_status
 sdi_bridge_mode_valid(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index aaeef603682c25773f2f809d8ac04f64cba5fb21..50349518eda1630400529caf27ca4469bb09fc82 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -536,18 +536,19 @@ static int venc_get_clocks(struct venc_device *venc)
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
  */
 
 static int venc_bridge_attach(struct drm_bridge *bridge,
+			      struct drm_encoder *encoder,
 			      enum drm_bridge_attach_flags flags)
 {
 	struct venc_device *venc = drm_bridge_to_venc(bridge);
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	return drm_bridge_attach(bridge->encoder, venc->output.next_bridge,
+	return drm_bridge_attach(encoder, venc->output.next_bridge,
 				 bridge, flags);
 }
 
 static enum drm_mode_status
 venc_bridge_mode_valid(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 380a855b832af9c09652ce39a78f974b63d949bb..a9145253294fcaef6bae4e1406a781f6d710d357 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -632,18 +632,19 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
 
 	return true;
 }
 
 static int rcar_lvds_attach(struct drm_bridge *bridge,
+			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
 	if (!lvds->next_bridge)
 		return 0;
 
-	return drm_bridge_attach(bridge->encoder, lvds->next_bridge, bridge,
+	return drm_bridge_attach(encoder, lvds->next_bridge, bridge,
 				 flags);
 }
 
 static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
 	.attach = rcar_lvds_attach,
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index d1e626068065c559a708772d3bbf16efe166ff59..7ab8be46c7f6547f29b4d45af7ac704283da9dcd 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -797,15 +797,16 @@ static void rcar_mipi_dsi_stop_video(struct rcar_mipi_dsi *dsi)
 /* -----------------------------------------------------------------------------
  * Bridge
  */
 
 static int rcar_mipi_dsi_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
 {
 	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, dsi->next_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi->next_bridge, bridge,
 				 flags);
 }
 
 static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 					struct drm_atomic_state *state)
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4550c6d847962f06886f2b7645bae73646f1ffb6..96c014449547b4042d7568573fde876b5b39bd04 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -521,15 +521,16 @@ static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi)
 /* -----------------------------------------------------------------------------
  * Bridge
  */
 
 static int rzg2l_mipi_dsi_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, dsi->next_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi->next_bridge, bridge,
 				 flags);
 }
 
 static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)
diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 4613e8e3b8fddc4455be0e3f81e0e811418746a0..a3ae9a93ce6670eb2c4dd36b3e572fcbca791a1c 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -932,32 +932,31 @@ static const struct drm_connector_funcs lvds_conn_funcs = {
 	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int lvds_attach(struct drm_bridge *bridge,
+static int lvds_attach(struct drm_bridge *bridge, struct drm_encoder *encoder,
 		       enum drm_bridge_attach_flags flags)
 {
 	struct stm_lvds *lvds = bridge_to_stm_lvds(bridge);
 	struct drm_connector *connector = &lvds->connector;
-	struct drm_encoder *encoder = bridge->encoder;
 	int ret;
 
-	if (!bridge->encoder) {
+	if (!encoder) {
 		drm_err(bridge->dev, "Parent encoder object not found\n");
 		return -ENODEV;
 	}
 
 	/* Set the encoder type as caller does not know it */
-	bridge->encoder->encoder_type = DRM_MODE_ENCODER_LVDS;
+	encoder->encoder_type = DRM_MODE_ENCODER_LVDS;
 
 	/* No cloning support */
-	bridge->encoder->possible_clones = 0;
+	encoder->possible_clones = 0;
 
 	/* If we have a next bridge just attach it. */
 	if (lvds->next_bridge)
-		return drm_bridge_attach(bridge->encoder, lvds->next_bridge,
+		return drm_bridge_attach(encoder, lvds->next_bridge,
 					 bridge, flags);
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
 		drm_err(bridge->dev, "Fix bridge driver to make connector optional!");
 		return -EINVAL;
diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 17a86bed805481c6cf054f6cb3176d60faa0351c..95b4aeff277505d64254177093d9bcc4de9f4a86 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -32,15 +32,16 @@ static inline struct tidss_encoder
 {
 	return container_of(b, struct tidss_encoder, bridge);
 }
 
 static int tidss_bridge_attach(struct drm_bridge *bridge,
+			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
 {
 	struct tidss_encoder *t_enc = bridge_to_tidss_encoder(bridge);
 
-	return drm_bridge_attach(bridge->encoder, t_enc->next_bridge,
+	return drm_bridge_attach(encoder, t_enc->next_bridge,
 				 bridge, flags);
 }
 
 static int tidss_bridge_atomic_check(struct drm_bridge *bridge,
 				     struct drm_bridge_state *bridge_state,
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 779b22efe27bffc586a760fdc49012e02ac23d0d..efc6f6078b026764c59cfb2a33b28a88b7018c3a 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1158,16 +1158,17 @@ static void vc4_dsi_bridge_enable(struct drm_bridge *bridge,
 		drm_print_regset32(&p, &dsi->regset);
 	}
 }
 
 static int vc4_dsi_bridge_attach(struct drm_bridge *bridge,
+				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 
 	/* Attach the panel or bridge to the dsi bridge */
-	return drm_bridge_attach(bridge->encoder, dsi->out_bridge,
+	return drm_bridge_attach(encoder, dsi->out_bridge,
 				 &dsi->bridge, flags);
 }
 
 static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 				     const struct mipi_dsi_msg *msg)
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 1f57935478d395b75842afccf6770ccb8d76c0d9..cbb608c0f16c87f51d6c2c0ea04534432c4a9742 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1479,10 +1479,11 @@ static void zynqmp_dp_disp_disable(struct zynqmp_dp *dp,
 /* -----------------------------------------------------------------------------
  * DRM Bridge
  */
 
 static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
+				   struct drm_encoder *encoder,
 				   enum drm_bridge_attach_flags flags)
 {
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 	int ret;
 
@@ -1492,11 +1493,11 @@ static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
 		dev_err(dp->dev, "failed to initialize DP aux\n");
 		return ret;
 	}
 
 	if (dp->next_bridge) {
-		ret = drm_bridge_attach(bridge->encoder, dp->next_bridge,
+		ret = drm_bridge_attach(encoder, dp->next_bridge,
 					bridge, flags);
 		if (ret < 0)
 			goto error;
 	}
 
diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/arm64/acer-aspire1-ec.c
index 2df42406430db7bd9ae5dcca6aace88c3bf3baa0..958fe1bf5f85bb69ac7962f217de9f0b40cde9a1 100644
--- a/drivers/platform/arm64/acer-aspire1-ec.c
+++ b/drivers/platform/arm64/acer-aspire1-ec.c
@@ -364,11 +364,12 @@ static const struct power_supply_desc aspire_ec_adp_psy_desc = {
 
 /*
  * USB-C DP Alt mode HPD.
  */
 
-static int aspire_ec_bridge_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
+static int aspire_ec_bridge_attach(struct drm_bridge *bridge, struct drm_encoder *encoder,
+				   enum drm_bridge_attach_flags flags)
 {
 	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
 }
 
 static void aspire_ec_bridge_update_hpd_work(struct work_struct *work)
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d4c75d59fa12be1bd7375ce3ea56415235781b28..2b65466540306feb0694abdc7cd801369cb9c9f0 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -71,11 +71,11 @@ struct drm_bridge_funcs {
 	 *
 	 * RETURNS:
 	 *
 	 * Zero on success, error code on failure.
 	 */
-	int (*attach)(struct drm_bridge *bridge,
+	int (*attach)(struct drm_bridge *bridge, struct drm_encoder *encoder,
 		      enum drm_bridge_attach_flags flags);
 
 	/**
 	 * @detach:
 	 *

-- 
2.48.0

