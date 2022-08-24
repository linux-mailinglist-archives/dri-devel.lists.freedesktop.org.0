Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078F959FAC3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 15:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2565410E6AA;
	Wed, 24 Aug 2022 13:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B39510E6AA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 13:00:54 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB5A8A32;
 Wed, 24 Aug 2022 15:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661346053;
 bh=exXFE5kKYKIE9sGir+KYCuChXXnVItB3xItSp1bIFkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sSHZZhwMer9R+hXqxAAKHA2f21ezDJAKB/ZTBgysgXCjd/aOodjirSNnrLqO+jAj7
 fxY7c4UV3tonNOHt89KaotuVFSUYMq/KXodOQAHEAhYxKDAC51mpXd/NsPuprfwquj
 4eHIiW4EmsJMf5lr9ickcdz8hHh8qmvMbqrkizCI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 3/4] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
Date: Wed, 24 Aug 2022 16:00:33 +0300
Message-Id: <20220824130034.196041-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Despite the SN65DSI86 being an eDP bridge, on some systems its output is
routed to a DisplayPort connector. Enable DisplayPort mode when the next
component in the display pipeline is detected as a DisplayPort
connector, and disable eDP features in that case.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reworked to set bridge type based on the next bridge/connector.
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
--
Changes since v1/RFC:
 - Rebased on top of "drm/bridge: ti-sn65dsi86: switch to
   devm_drm_of_get_bridge"
 - eDP/DP mode determined from the next bridge connector type.

Changes since v2:
 - Remove setting of Standard DP Scrambler Seed. (It's read-only).
 - Prevent setting DP_EDP_CONFIGURATION_SET in
   ti_sn_bridge_atomic_enable()
 - Use Doug's suggested text for disabling ASSR on DP mode.

Changes since v3:
 - Remove ASSR_CONTROL definition

Changes since v4:
 - Refactor code to configure the DP/eDP scrambler in one place.
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f085a037ff5b..a6b15ea4e84d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -92,6 +92,8 @@
 #define SN_DATARATE_CONFIG_REG			0x94
 #define  DP_DATARATE_MASK			GENMASK(7, 5)
 #define  DP_DATARATE(x)				((x) << 5)
+#define SN_TRAINING_SETTING_REG			0x95
+#define  SCRAMBLE_DISABLE			BIT(4)
 #define SN_ML_TX_MODE_REG			0x96
 #define  ML_TX_MAIN_LINK_OFF			0
 #define  ML_TX_NORMAL_MODE			BIT(0)
@@ -1075,12 +1077,23 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	/*
 	 * The SN65DSI86 only supports ASSR Display Authentication method and
-	 * this method is enabled by default. An eDP panel must support this
+	 * this method is enabled for eDP panels. An eDP panel must support this
 	 * authentication method. We need to enable this method in the eDP panel
 	 * at DisplayPort address 0x0010A prior to link training.
+	 *
+	 * As only ASSR is supported by SN65DSI86, for full DisplayPort displays
+	 * we need to disable the scrambler.
 	 */
-	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
-			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP) {
+		drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
+				   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
+
+		regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
+				   SCRAMBLE_DISABLE, 0);
+	} else {
+		regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
+				   SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);
+	}
 
 	bpp = ti_sn_bridge_get_bpp(connector);
 	/* Set the DP output format (18 bpp or 24 bpp) */
@@ -1246,6 +1259,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = np;
+	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
+			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
2.34.1

