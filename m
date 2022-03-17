Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCAB4DC74E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 14:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B17B10EBB4;
	Thu, 17 Mar 2022 13:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C0910EBB3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 13:13:05 +0000 (UTC)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D1913E4;
 Thu, 17 Mar 2022 14:13:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1647522783;
 bh=Tv6qLFnulHoJT9PGxHu1AW5FNOOEAcilmAuLxTET+6I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C9hftrSNDL9S/hLJkddQb8M1AjZf/HeubRVb/5Yck8Apt6VcmzIFXp+pjxUmxOl15
 T2IQxQoC4g38JvCGAFm55t+BHl0mVLVpbhDp8ex14JsZaK3M2UQ5EVi5QFH95tATvS
 zheeE8IucACur4Ld4vEmfpX9GeceyDGK3J7KKHLI=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
Date: Thu, 17 Mar 2022 13:12:48 +0000
Message-Id: <20220317131250.1481275-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com>
References: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
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

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c892ecba91c7..c5f020a2d0d3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -93,6 +93,8 @@
 #define SN_DATARATE_CONFIG_REG			0x94
 #define  DP_DATARATE_MASK			GENMASK(7, 5)
 #define  DP_DATARATE(x)				((x) << 5)
+#define SN_TRAINING_SETTING_REG			0x95
+#define  SCRAMBLE_DISABLE			BIT(4)
 #define SN_ML_TX_MODE_REG			0x96
 #define  ML_TX_MAIN_LINK_OFF			0
 #define  ML_TX_NORMAL_MODE			BIT(0)
@@ -982,6 +984,17 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 		goto exit;
 	}
 
+	/*
+	 * eDP panels use an Alternate Scrambler Seed compared to displays
+	 * hooked up via a full DisplayPort connector. SN65DSI86 only supports
+	 * the alternate scrambler seed, not the normal one, so the only way we
+	 * can support full DisplayPort displays is by fully turning off the
+	 * scrambler.
+	 */
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
+		regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
+				   SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);
+
 	/*
 	 * We'll try to link train several times.  As part of link training
 	 * the bridge chip will write DP_SET_POWER_D0 to DP_SET_POWER.  If
@@ -1046,12 +1059,13 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	/*
 	 * The SN65DSI86 only supports ASSR Display Authentication method and
-	 * this method is enabled by default. An eDP panel must support this
+	 * this method is enabled for eDP panels. An eDP panel must support this
 	 * authentication method. We need to enable this method in the eDP panel
 	 * at DisplayPort address 0x0010A prior to link training.
 	 */
-	drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
-			   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
+		drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
+				   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
 
 	/* Set the DP output format (18 bpp or 24 bpp) */
 	val = (ti_sn_bridge_get_bpp(old_bridge_state) == 18) ? BPP_18_RGB : 0;
@@ -1215,6 +1229,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = np;
+	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
+			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
2.32.0

