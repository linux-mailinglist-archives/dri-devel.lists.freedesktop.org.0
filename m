Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA2C4BC35C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 01:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6BA10EA81;
	Sat, 19 Feb 2022 00:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158A810E180
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 00:29:07 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 435F083BA4;
 Sat, 19 Feb 2022 01:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645230545;
 bh=TJrz5MRroQ1rrJuEeruRRzLmqQK9W6OltcpoMMGR1Ug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uv3SnF0byH1Henb/3eOteBagMRCPZ6ym3sl87bnAH9PwpzsfMhvk8xhFuxHJe6euQ
 oEIKkIc4DSWUPNy7JaO8z/yo3r76Gmlb+4ZgKu8CHG1Edqfz5PzD7kFo47kQWCcOt1
 bVN6hJfX1UTI3rB95u++zV6NiDo4Q3W5iRu0daDklOO0A1/0+YhAv5tvz4E2a8TV+k
 0/EPwQtsfb7quKwncoNNyy/p5za0Fj2DYD1gyPwb3Wzszkdu+k2CuIoGSZ7M48xONM
 egbmX0ZYuR2TsHZBPsgX22joiucH8GP68H//9dXuVPI8Ye1fx4JAHPHY7I3eeo6QRC
 8facyH28bXM+Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/bridge: dw-mipi-dsi: Pass bridge state into
 dw_mipi_dsi_get_lane_mbps()
Date: Sat, 19 Feb 2022 01:28:42 +0100
Message-Id: <20220219002844.362157-6-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220219002844.362157-1-marex@denx.de>
References: <20220219002844.362157-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pass negotiated bridge state, which now optionally contains required DSI bus
clock, into dw_mipi_dsi_get_lane_mbps(). The dw_mipi_dsi_get_lane_mbps() is
a misnomer, it is also responsible for configuration of the bridge PLL and
thus also configuration of the clock the bridge outputs on the DSI bus.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c   | 15 ++++++++++-----
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c |  1 +
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c           |  1 +
 include/drm/bridge/dw_mipi_dsi.h                |  2 ++
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 7a2ea21dc0554..d5f3c98cefdb5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -996,7 +996,8 @@ static unsigned int dw_mipi_dsi_get_lanes(struct dw_mipi_dsi *dsi)
 }
 
 static void dw_mipi_dsi_mode_set(struct dw_mipi_dsi *dsi,
-				 const struct drm_display_mode *adjusted_mode)
+				 const struct drm_display_mode *adjusted_mode,
+				 const struct drm_bridge_state *bridge_state)
 {
 	const struct dw_mipi_dsi_phy_ops *phy_ops = dsi->plat_data->phy_ops;
 	void *priv_data = dsi->plat_data->priv_data;
@@ -1005,8 +1006,9 @@ static void dw_mipi_dsi_mode_set(struct dw_mipi_dsi *dsi,
 
 	clk_prepare_enable(dsi->pclk);
 
-	ret = phy_ops->get_lane_mbps(priv_data, adjusted_mode, dsi->mode_flags,
-				     lanes, dsi->format, &dsi->lane_mbps);
+	ret = phy_ops->get_lane_mbps(priv_data, adjusted_mode, bridge_state,
+				     dsi->mode_flags, lanes, dsi->format,
+				     &dsi->lane_mbps);
 	if (ret)
 		DRM_DEBUG_DRIVER("Phy get_lane_mbps() failed\n");
 
@@ -1054,11 +1056,14 @@ static void dw_mipi_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 					     struct drm_bridge_state *old_bridge_state)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	const struct drm_bridge_state *bridge_state;
 	const struct drm_display_mode *adjusted_mode = &dsi->mode;
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
 
-	dw_mipi_dsi_mode_set(dsi, adjusted_mode);
+	dw_mipi_dsi_mode_set(dsi, adjusted_mode, bridge_state);
 	if (dsi->slave)
-		dw_mipi_dsi_mode_set(dsi->slave, adjusted_mode);
+		dw_mipi_dsi_mode_set(dsi->slave, adjusted_mode, bridge_state);
 
 	/* Switch to video mode for panel-bridge enable & panel enable */
 	dw_mipi_dsi_set_mode(dsi, MIPI_DSI_MODE_VIDEO);
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 4ed7a68681978..39965e0d16c95 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -526,6 +526,7 @@ static void dw_mipi_dsi_phy_power_off(void *priv_data)
 
 static int
 dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
+			  const struct drm_bridge_state *bridge_state,
 			  unsigned long mode_flags, u32 lanes, u32 format,
 			  unsigned int *lane_mbps)
 {
diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 32cb41b2202fe..0132e576339dd 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -239,6 +239,7 @@ static void dw_mipi_dsi_phy_power_off(void *priv_data)
 
 static int
 dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
+			  const struct drm_bridge_state *bridge_state,
 			  unsigned long mode_flags, u32 lanes, u32 format,
 			  unsigned int *lane_mbps)
 {
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index 5286a53a1875d..f449ff36c4653 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -11,6 +11,7 @@
 
 #include <linux/types.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_modes.h>
 
 struct drm_display_mode;
@@ -32,6 +33,7 @@ struct dw_mipi_dsi_phy_ops {
 	void (*power_off)(void *priv_data);
 	int (*get_lane_mbps)(void *priv_data,
 			     const struct drm_display_mode *mode,
+			     const struct drm_bridge_state *bridge_state,
 			     unsigned long mode_flags, u32 lanes, u32 format,
 			     unsigned int *lane_mbps);
 	int (*get_timing)(void *priv_data, unsigned int lane_mbps,
-- 
2.34.1

