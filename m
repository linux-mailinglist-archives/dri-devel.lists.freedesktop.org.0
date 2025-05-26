Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC62CAC37D9
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 04:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8913910E2BE;
	Mon, 26 May 2025 02:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="l8LPU9oh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1A310E257
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1748224757;
 bh=sChjnz3feZFvWyNyBBV/ChTfvU6U/f+UOVHotNV47zs=;
 h=From:To:Subject:Date:Message-Id;
 b=l8LPU9ohrxUzo8CKMWaIQgwopRxBybEcjvVcV+zysweakpU8F3DZpStRBRbi/Y/fq
 ugnD4NO/fvIJNDObPxWWz/m2ntSTzyA1Q7Xa5rex5S0SkzoM6/hplbV0Afw8D93NRz
 Mj4V2N2yT1Ihm8pIX4dM/6t54vq6l6PQjlD+BeR0=
X-QQ-mid: esmtpgz11t1748224755t5a444bdf
X-QQ-Originating-IP: YmnDtwGOyJXaeiI+4J0/OlWIfmc02uUidzVxFPmFi9k=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 26 May 2025 09:59:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11916620477028258212
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH] drm/rockchip: lvds: Convert to drm bridge
Date: Mon, 26 May 2025 09:58:34 +0800
Message-Id: <20250526015834.102-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Nec0PqG26E9wcPYeyCpdNquLWbVB0QBfauc3uPvmSzxI3H4iGsgp/ohz
 TiSe+dCf6mo8kP0xCv5HY4me0+y9I79oBj1G5Xq6Dd4+YE0hHuHeMmRPhx0gVmcPJnR9qLt
 9fEwSyd1dnY1hyZcynkTYUUTAwRcbnyBv2f5YsfW2p7ecJSlSa4KzMdQ71cY/4b3E9BLfSm
 LoTJFw7xrxjzFImtsB+3Pvmydc+VL+jzTlw00I6Oa+L7fAdRj0nhir8lCbXMwXZEKUkVZ+x
 LSwxoV6I5gPgCEfFQoj3mzAhjY7PlIg1lwkZpLNGD6Z7i2Gi+vgvaqd074clFTRHb4POOy7
 SfzXHrLshDQq3t4vZjmvuXi4ZShGWCFUSj3pbOP2dM0hX3qYZC9y8jkPySPpi/gQFQWG3Wj
 6Z21u6ZLd9z8Gd09/0pw5SDFJPNOOZu2qvo7He3hQRIStX1/A9I6yvWsjTqgQ2doUqpLJFC
 g+zWjiEnSTHlzreLun0jxSZ68eL9SYk9tI/xZY7MCBMdKJufeGvMw16veVgX2C1OKRI/iyQ
 +e07CzASwLx/c/6M2xHbF3pIpZ5D92Dl2xgSICrZmkVGPoqS2iWDVn4VDxqAo8fqfF4m5Ae
 b+lLcHnybzloPMlqvBykpCZXzQ8uDZo/AzvnP9ohjvwctjtrb7tOOxhy4t/ce6IsPdfOSNo
 OTVWm22aU7v3S+3voQH61UqcKsxE6jZkHbjtAoqRVo46xNUTbrjUW2PEO8Ed/zpXzttgBtX
 cEiY+LqRp6c8IPVkJIcUm+vJmUTuF6WUgZ4VWIxCFMRcy36L7fg7Y6ZOWcXXQ/kcllX2A0v
 D+XuM53BPd9xN4Pl4YUP0KxBgDqTAYLfV7ZuTzYcOkm9eVT+jh/PqCmpJf/f31CELDVGUeb
 VOtPD2PXr8n0yAXEhiDd0/OPIk7FAM4w3fkj6W/qx0Yk11wTsU40NxGle0VG650CIqNdV8D
 +r/FL7FR3rfEIzg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Convert it to drm bridge driver, it will be convenient for us to
migrate the connector part to the display driver later.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 68 ++++++++++--------------
 1 file changed, 29 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index a673779de3d2..2411260db51d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -56,14 +56,13 @@ struct rockchip_lvds {
 	struct drm_device *drm_dev;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
-	struct drm_connector connector;
 	struct rockchip_encoder encoder;
 	struct dev_pin_info *pins;
 };
 
-static inline struct rockchip_lvds *connector_to_lvds(struct drm_connector *connector)
+static inline struct rockchip_lvds *brige_to_lvds(struct drm_bridge *bridge)
 {
-	return container_of(connector, struct rockchip_lvds, connector);
+	return (struct rockchip_lvds *)bridge->driver_private;
 }
 
 static inline struct rockchip_lvds *encoder_to_lvds(struct drm_encoder *encoder)
@@ -106,25 +105,21 @@ static inline int rockchip_lvds_name_to_output(const char *s)
 	return -EINVAL;
 }
 
-static const struct drm_connector_funcs rockchip_lvds_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int rockchip_lvds_connector_get_modes(struct drm_connector *connector)
+static int
+rockchip_lvds_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
 {
-	struct rockchip_lvds *lvds = connector_to_lvds(connector);
+	struct rockchip_lvds *lvds = brige_to_lvds(bridge);
 	struct drm_panel *panel = lvds->panel;
 
 	return drm_panel_get_modes(panel, connector);
 }
 
 static const
-struct drm_connector_helper_funcs rockchip_lvds_connector_helper_funcs = {
-	.get_modes = rockchip_lvds_connector_get_modes,
+struct drm_bridge_funcs rockchip_lvds_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.get_modes = rockchip_lvds_bridge_get_modes,
 };
 
 static int
@@ -606,26 +601,23 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	}
 
 	drm_encoder_helper_add(encoder, lvds->soc_data->helper_funcs);
-	connector = &lvds->connector;
 
 	if (lvds->panel) {
-		connector->dpms = DRM_MODE_DPMS_OFF;
-		ret = drm_connector_init(drm_dev, connector,
-					 &rockchip_lvds_connector_funcs,
-					 DRM_MODE_CONNECTOR_LVDS);
-		if (ret < 0) {
-			drm_err(drm_dev,
-				"failed to initialize connector: %d\n", ret);
+		lvds->bridge = drm_panel_bridge_add_typed(lvds->panel, DRM_MODE_CONNECTOR_LVDS);
+		if (IS_ERR(lvds->bridge)) {
+			ret = PTR_ERR(lvds->bridge);
 			goto err_free_encoder;
 		}
+	}
 
-		drm_connector_helper_add(connector,
-					 &rockchip_lvds_connector_helper_funcs);
-	} else {
-		ret = drm_bridge_attach(encoder, lvds->bridge, NULL,
-					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (lvds->bridge) {
+		lvds->bridge->driver_private = lvds;
+		lvds->bridge->ops = DRM_BRIDGE_OP_MODES;
+		lvds->bridge->funcs = &rockchip_lvds_bridge_funcs;
+
+		ret = drm_bridge_attach(encoder, lvds->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
-			goto err_free_encoder;
+			goto err_free_bridge;
 
 		connector = drm_bridge_connector_init(lvds->drm_dev, encoder);
 		if (IS_ERR(connector)) {
@@ -633,14 +625,14 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 				"failed to initialize bridge connector: %pe\n",
 				connector);
 			ret = PTR_ERR(connector);
-			goto err_free_encoder;
+			goto err_free_bridge;
 		}
-	}
 
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret < 0) {
-		drm_err(drm_dev, "failed to attach encoder: %d\n", ret);
-		goto err_free_connector;
+		ret = drm_connector_attach_encoder(connector, encoder);
+		if (ret < 0) {
+			drm_err(drm_dev, "failed to attach encoder: %d\n", ret);
+			goto err_free_bridge;
+		}
 	}
 
 	pm_runtime_enable(dev);
@@ -649,8 +641,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 
 	return 0;
 
-err_free_connector:
-	drm_connector_cleanup(connector);
+err_free_bridge:
+	drm_panel_bridge_remove(lvds->bridge);
 err_free_encoder:
 	drm_encoder_cleanup(encoder);
 err_put_remote:
@@ -670,8 +662,6 @@ static void rockchip_lvds_unbind(struct device *dev, struct device *master,
 	encoder_funcs = lvds->soc_data->helper_funcs;
 	encoder_funcs->disable(&lvds->encoder.encoder);
 	pm_runtime_disable(dev);
-	drm_connector_cleanup(&lvds->connector);
-	drm_encoder_cleanup(&lvds->encoder.encoder);
 }
 
 static const struct component_ops rockchip_lvds_component_ops = {
-- 
2.49.0

