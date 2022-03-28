Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562D84EA289
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 23:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCEF10EDB1;
	Mon, 28 Mar 2022 21:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BA510E107
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 21:43:54 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9C57E83F8F;
 Mon, 28 Mar 2022 23:43:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648503833;
 bh=tpH87UCwwHj8hbkSXHVPyAJLhO2jEQ2dOqPNJ9EDdyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jyVqqh1cXSmU32yVYuIHLx+HVqLTIWuoCv+QZA5FEmk4r9Fj7xN84O5s/QRsOBVQ/
 ZLgcVki8tZSQCq/cRvLlwB+sex/jOc0NfWO8u5VmHL5KXGBihRuEdPeoVkeYUbBC6B
 LM3deFUF+K9w37+glQQ17pwStt4fTVr53UAqvgMsbAIP4rmwMIPOOB57xq49FXpHE7
 FPX2t/yHa/OtaLym8YuGPVxN2IfwHLAL/qDLH8/tfblGnSwYKU+G4C8V02kfyw7Ttv
 BFPU9v+8q6EDVk2lVHHM8fqFOZpiuh3lA9W1kGZQZhYIAFIS3QZirOT66jc3HfPB1d
 BwXgUloUKJ+lA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 03/11] drm/bridge: tc358767: Change tc_ prefix to tc_edp_
 for (e)DP specific functions
Date: Mon, 28 Mar 2022 23:43:16 +0200
Message-Id: <20220328214324.252472-4-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328214324.252472-1-marex@denx.de>
References: <20220328214324.252472-1-marex@denx.de>
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
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These functions are specific to (e)DP output initialization and
operation, add specific tc_edp_ prefix to those functions to
discern them from DPI output functions that will be added later
in this series. No functional change.

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Lucas Stach <l.stach@pengutronix.de> # In both DPI to eDP and DSI to DPI mode.
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - New patch
V3: - Add RB from Lucas
    - Rename tc_bridge_funcs to tc_edp_bridge_funcs
V4: - Add TB from Lucas
---
 drivers/gpu/drm/bridge/tc358767.c | 39 ++++++++++++++++---------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index c23e0abc65e8f..23e0280f484de 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1164,7 +1164,7 @@ static int tc_main_link_disable(struct tc_data *tc)
 	return regmap_write(tc->regmap, DP0CTL, 0);
 }
 
-static int tc_stream_enable(struct tc_data *tc)
+static int tc_edp_stream_enable(struct tc_data *tc)
 {
 	int ret;
 	u32 value;
@@ -1219,7 +1219,7 @@ static int tc_stream_enable(struct tc_data *tc)
 	return 0;
 }
 
-static int tc_stream_disable(struct tc_data *tc)
+static int tc_edp_stream_disable(struct tc_data *tc)
 {
 	int ret;
 
@@ -1234,7 +1234,7 @@ static int tc_stream_disable(struct tc_data *tc)
 	return 0;
 }
 
-static void tc_bridge_enable(struct drm_bridge *bridge)
+static void tc_edp_bridge_enable(struct drm_bridge *bridge)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
@@ -1251,7 +1251,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 		return;
 	}
 
-	ret = tc_stream_enable(tc);
+	ret = tc_edp_stream_enable(tc);
 	if (ret < 0) {
 		dev_err(tc->dev, "main link stream start error: %d\n", ret);
 		tc_main_link_disable(tc);
@@ -1259,12 +1259,12 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	}
 }
 
-static void tc_bridge_disable(struct drm_bridge *bridge)
+static void tc_edp_bridge_disable(struct drm_bridge *bridge)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
 
-	ret = tc_stream_disable(tc);
+	ret = tc_edp_stream_disable(tc);
 	if (ret < 0)
 		dev_err(tc->dev, "main link stream stop error: %d\n", ret);
 
@@ -1285,9 +1285,10 @@ static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
 	return true;
 }
 
-static enum drm_mode_status tc_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode)
+static enum drm_mode_status
+tc_edp_mode_valid(struct drm_bridge *bridge,
+		  const struct drm_display_info *info,
+		  const struct drm_display_mode *mode)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	u32 req, avail;
@@ -1395,8 +1396,8 @@ static const struct drm_connector_funcs tc_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int tc_bridge_attach(struct drm_bridge *bridge,
-			    enum drm_bridge_attach_flags flags)
+static int tc_edp_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
 {
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	struct tc_data *tc = bridge_to_tc(bridge);
@@ -1448,18 +1449,18 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 	return ret;
 }
 
-static void tc_bridge_detach(struct drm_bridge *bridge)
+static void tc_edp_bridge_detach(struct drm_bridge *bridge)
 {
 	drm_dp_aux_unregister(&bridge_to_tc(bridge)->aux);
 }
 
-static const struct drm_bridge_funcs tc_bridge_funcs = {
-	.attach = tc_bridge_attach,
-	.detach = tc_bridge_detach,
-	.mode_valid = tc_mode_valid,
+static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
+	.attach = tc_edp_bridge_attach,
+	.detach = tc_edp_bridge_detach,
+	.mode_valid = tc_edp_mode_valid,
 	.mode_set = tc_bridge_mode_set,
-	.enable = tc_bridge_enable,
-	.disable = tc_bridge_disable,
+	.enable = tc_edp_bridge_enable,
+	.disable = tc_edp_bridge_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
 	.detect = tc_bridge_detect,
 	.get_edid = tc_get_edid,
@@ -1696,7 +1697,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	tc->aux.transfer = tc_aux_transfer;
 	drm_dp_aux_init(&tc->aux);
 
-	tc->bridge.funcs = &tc_bridge_funcs;
+	tc->bridge.funcs = &tc_edp_bridge_funcs;
 	if (tc->hpd_pin >= 0)
 		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
 	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
-- 
2.35.1

