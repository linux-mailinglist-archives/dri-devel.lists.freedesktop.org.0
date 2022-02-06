Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181A4AB05C
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 16:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C5410E3DD;
	Sun,  6 Feb 2022 15:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0A810E136
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 15:44:27 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id ced13dac-8763-11ec-b20b-0050568c148b;
 Sun, 06 Feb 2022 15:45:28 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 00101194BB5;
 Sun,  6 Feb 2022 16:44:25 +0100 (CET)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v1 7/9] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Date: Sun,  6 Feb 2022 16:44:03 +0100
Message-Id: <20220206154405.1243333-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206154405.1243333-1-sam@ravnborg.org>
References: <20220206154405.1243333-1-sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The atomic variants of enable/disable in drm_bridge_funcs are the
preferred operations - introduce these.

The ps8640 driver used the non-atomic variants of the drm_bridge_chain_pre_enable/
drm_bridge_chain_post_disable - convert these to the atomic variants.

v4:
  - Rebased

v3:
  - Init state operations in drm_bridge_funcs (Laurent)

v2:
  - Added a few more people to cc: (Jitao, Enric, Philip) to increase
    possibility to get test feedback

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <maxime@cerno.tech>
Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Philip Chen <philipchen@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 3f17337ee389..d63c762fcd34 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/dp/drm_dp_aux_bus.h>
 #include <drm/dp/drm_dp_helper.h>
@@ -398,7 +399,8 @@ static const struct dev_pm_ops ps8640_pm_ops = {
 				pm_runtime_force_resume)
 };
 
-static void ps8640_pre_enable(struct drm_bridge *bridge)
+static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
@@ -430,7 +432,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
 	ps_bridge->pre_enabled = true;
 }
 
-static void ps8640_post_disable(struct drm_bridge *bridge)
+static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
+				       struct drm_bridge_state *old_bridge_state)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 
@@ -508,7 +511,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 	 * EDID, for this chip, we need to do a full poweron, otherwise it will
 	 * fail.
 	 */
-	drm_bridge_chain_pre_enable(bridge);
+	drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
 
 	edid = drm_get_edid(connector,
 			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
@@ -518,7 +521,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 	 * before, return the chip to its original power state.
 	 */
 	if (poweroff)
-		drm_bridge_chain_post_disable(bridge);
+		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
 
 	return edid;
 }
@@ -533,8 +536,9 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.attach = ps8640_bridge_attach,
 	.detach = ps8640_bridge_detach,
 	.get_edid = ps8640_bridge_get_edid,
-	.post_disable = ps8640_post_disable,
-	.pre_enable = ps8640_pre_enable,
+	.atomic_post_disable = ps8640_atomic_post_disable,
+	.atomic_pre_enable = ps8640_atomic_pre_enable,
+	DRM_BRIDGE_STATE_OPS,
 };
 
 static int ps8640_bridge_host_attach(struct device *dev, struct ps8640 *ps_bridge)
-- 
2.32.0

