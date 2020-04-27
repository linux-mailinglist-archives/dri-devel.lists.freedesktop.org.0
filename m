Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D371B99AD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EFE89FCE;
	Mon, 27 Apr 2020 08:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D8B89F8E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 088DA2A0AD7
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v8 04/10] drm: bridge: dw_mipi_dsi: allow bridge daisy chaining
Date: Mon, 27 Apr 2020 11:19:46 +0300
Message-Id: <20200427081952.3536741-5-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200427081952.3536741-1-adrian.ratiu@collabora.com>
References: <20200427081952.3536741-1-adrian.ratiu@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Up until now the assumption was that the synopsis dsi bridge will
directly connect to an encoder provided by the platform driver, but
the current practice for drivers is to leave the encoder empty via
the simple encoder API and add their logic to their own drm_bridge.

Thus we need an ablility to connect the DSI bridge to another bridge
provided by the platform driver, so we extend the dw_mipi_dsi bind()
API with a new "previous bridge" arg instead of just hardcoding NULL.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
New in v8.
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c   | 6 ++++--
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 2 +-
 include/drm/bridge/dw_mipi_dsi.h                | 5 ++++-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 16fd87055e7b7..140ff40fa1b62 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1456,11 +1456,13 @@ EXPORT_SYMBOL_GPL(dw_mipi_dsi_remove);
 /*
  * Bind/unbind API, used from platforms based on the component framework.
  */
-int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder)
+int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi,
+		     struct drm_encoder *encoder,
+		     struct drm_bridge *prev_bridge)
 {
 	int ret;
 
-	ret = drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
+	ret = drm_bridge_attach(encoder, &dsi->bridge, prev_bridge, 0);
 	if (ret) {
 		DRM_ERROR("Failed to initialize bridge with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3feff0c45b3f7..83ef43be78135 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -929,7 +929,7 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
 		return ret;
 	}
 
-	ret = dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder);
+	ret = dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder, NULL);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Failed to bind: %d\n", ret);
 		return ret;
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index b0e390b3288e8..699b3531f5b36 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -14,6 +14,7 @@
 #include <drm/drm_modes.h>
 
 struct drm_display_mode;
+struct drm_bridge;
 struct drm_encoder;
 struct dw_mipi_dsi;
 struct mipi_dsi_device;
@@ -62,7 +63,9 @@ struct dw_mipi_dsi *dw_mipi_dsi_probe(struct platform_device *pdev,
 				      const struct dw_mipi_dsi_plat_data
 				      *plat_data);
 void dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi);
-int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder);
+int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi,
+		     struct drm_encoder *encoder,
+		     struct drm_bridge *prev_bridge);
 void dw_mipi_dsi_unbind(struct dw_mipi_dsi *dsi);
 void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi, struct dw_mipi_dsi *slave);
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
