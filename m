Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE03145394
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 12:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C78B6F4B2;
	Wed, 22 Jan 2020 11:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1506A6F4AD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 11:17:08 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1ED4D292968;
 Wed, 22 Jan 2020 11:17:06 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 02/12] drm/bridge: Patch atomic hooks to take a
 drm_bridge_state
Date: Wed, 22 Jan 2020 12:16:50 +0100
Message-Id: <20200122111700.1924960-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200122111700.1924960-1-boris.brezillon@collabora.com>
References: <20200122111700.1924960-1-boris.brezillon@collabora.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This way the drm_bridge_funcs interface is consistent with the rest of
the subsystem.

The only driver implementing those hooks (analogix DP) is patched too.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
[narmstrong: renamed state as old_bridge_state in rcar_lvds_atomic_disable]
Reviewed by: Jernej Skrabec <jernej.skrabec@siol.net>
Tested-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v7:
* None
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 41 +++++++------
 drivers/gpu/drm/drm_bridge.c                  | 61 +++++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |  8 ++-
 include/drm/drm_bridge.h                      |  8 +--
 4 files changed, 82 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6effe532f820..6fab71985cd4 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1289,19 +1289,21 @@ struct drm_crtc *analogix_dp_get_new_crtc(struct analogix_dp_device *dp,
 	return conn_state->crtc;
 }
 
-static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-						 struct drm_atomic_state *state)
+static void
+analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int ret;
 
-	crtc = analogix_dp_get_new_crtc(dp, state);
+	crtc = analogix_dp_get_new_crtc(dp, old_state);
 	if (!crtc)
 		return;
 
-	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
 	/* Don't touch the panel if we're coming back from PSR */
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
@@ -1366,20 +1368,22 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 	return ret;
 }
 
-static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
-					     struct drm_atomic_state *state)
+static void
+analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
+				 struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int timeout_loop = 0;
 	int ret;
 
-	crtc = analogix_dp_get_new_crtc(dp, state);
+	crtc = analogix_dp_get_new_crtc(dp, old_state);
 	if (!crtc)
 		return;
 
-	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
 	/* Not a full enable, just disable PSR and continue */
 	if (old_crtc_state && old_crtc_state->self_refresh_active) {
 		ret = analogix_dp_disable_psr(dp);
@@ -1440,18 +1444,20 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 }
 
-static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
-					      struct drm_atomic_state *state)
+static void
+analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
+				  struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
 
-	crtc = analogix_dp_get_new_crtc(dp, state);
+	crtc = analogix_dp_get_new_crtc(dp, old_state);
 	if (!crtc)
 		goto out;
 
-	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
 	if (!new_crtc_state)
 		goto out;
 
@@ -1463,20 +1469,21 @@ static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	analogix_dp_bridge_disable(bridge);
 }
 
-static
-void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
-					    struct drm_atomic_state *state)
+static void
+analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	int ret;
 
-	crtc = analogix_dp_get_new_crtc(dp, state);
+	crtc = analogix_dp_get_new_crtc(dp, old_state);
 	if (!crtc)
 		return;
 
-	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
 	if (!new_crtc_state || !new_crtc_state->self_refresh_active)
 		return;
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 31d658f7312f..18d2c42491ca 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -428,10 +428,19 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 
 	encoder = bridge->encoder;
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->atomic_disable)
-			iter->funcs->atomic_disable(iter, old_state);
-		else if (iter->funcs->disable)
+		if (iter->funcs->atomic_disable) {
+			struct drm_bridge_state *old_bridge_state;
+
+			old_bridge_state =
+				drm_atomic_get_old_bridge_state(old_state,
+								iter);
+			if (WARN_ON(!old_bridge_state))
+				return;
+
+			iter->funcs->atomic_disable(iter, old_bridge_state);
+		} else if (iter->funcs->disable) {
 			iter->funcs->disable(iter);
+		}
 
 		if (iter == bridge)
 			break;
@@ -462,10 +471,20 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 
 	encoder = bridge->encoder;
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->atomic_post_disable)
-			bridge->funcs->atomic_post_disable(bridge, old_state);
-		else if (bridge->funcs->post_disable)
+		if (bridge->funcs->atomic_post_disable) {
+			struct drm_bridge_state *old_bridge_state;
+
+			old_bridge_state =
+				drm_atomic_get_old_bridge_state(old_state,
+								bridge);
+			if (WARN_ON(!old_bridge_state))
+				return;
+
+			bridge->funcs->atomic_post_disable(bridge,
+							   old_bridge_state);
+		} else if (bridge->funcs->post_disable) {
 			bridge->funcs->post_disable(bridge);
+		}
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
@@ -494,10 +513,19 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 
 	encoder = bridge->encoder;
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->atomic_pre_enable)
-			iter->funcs->atomic_pre_enable(iter, old_state);
-		else if (iter->funcs->pre_enable)
+		if (iter->funcs->atomic_pre_enable) {
+			struct drm_bridge_state *old_bridge_state;
+
+			old_bridge_state =
+				drm_atomic_get_old_bridge_state(old_state,
+								iter);
+			if (WARN_ON(!old_bridge_state))
+				return;
+
+			iter->funcs->atomic_pre_enable(iter, old_bridge_state);
+		} else if (iter->funcs->pre_enable) {
 			iter->funcs->pre_enable(iter);
+		}
 
 		if (iter == bridge)
 			break;
@@ -527,10 +555,19 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 
 	encoder = bridge->encoder;
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->atomic_enable)
-			bridge->funcs->atomic_enable(bridge, old_state);
-		else if (bridge->funcs->enable)
+		if (bridge->funcs->atomic_enable) {
+			struct drm_bridge_state *old_bridge_state;
+
+			old_bridge_state =
+				drm_atomic_get_old_bridge_state(old_state,
+								bridge);
+			if (WARN_ON(!old_bridge_state))
+				return;
+
+			bridge->funcs->atomic_enable(bridge, old_bridge_state);
+		} else if (bridge->funcs->enable) {
 			bridge->funcs->enable(bridge);
+		}
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 8ffa4fbbdeb3..961519ce6634 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -590,8 +590,9 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
 }
 
 static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
-				    struct drm_atomic_state *state)
+				    struct drm_bridge_state *old_bridge_state)
 {
+	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
 
@@ -603,7 +604,7 @@ static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
 }
 
 static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
-				     struct drm_atomic_state *state)
+				     struct drm_bridge_state *old_bridge_state)
 {
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 
@@ -618,7 +619,8 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 
 	/* Disable the companion LVDS encoder in dual-link mode. */
 	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
-		lvds->companion->funcs->atomic_disable(lvds->companion, state);
+		lvds->companion->funcs->atomic_disable(lvds->companion,
+						       old_bridge_state);
 
 	clk_disable_unprepare(lvds->clocks.mod);
 }
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3ec37f6d4dff..c971ba143e3e 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -265,7 +265,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
-				  struct drm_atomic_state *old_state);
+				  struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_enable:
@@ -290,7 +290,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
-			      struct drm_atomic_state *old_state);
+			      struct drm_bridge_state *old_bridge_state);
 	/**
 	 * @atomic_disable:
 	 *
@@ -313,7 +313,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
-			       struct drm_atomic_state *old_state);
+			       struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_post_disable:
@@ -339,7 +339,7 @@ struct drm_bridge_funcs {
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
-				    struct drm_atomic_state *old_state);
+				    struct drm_bridge_state *old_bridge_state);
 
 	/**
 	 * @atomic_duplicate_state:
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
