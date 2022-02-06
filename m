Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 162664AB05A
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 16:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3AB10E254;
	Sun,  6 Feb 2022 15:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3708510E30F
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 15:44:29 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id cf8adbe1-8763-11ec-ac19-0050568cd888;
 Sun, 06 Feb 2022 15:45:29 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6AEC7194BCF;
 Sun,  6 Feb 2022 16:44:27 +0100 (CET)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v1 9/9] drm/bridge: Drop unused drm_bridge_chain functions
Date: Sun,  6 Feb 2022 16:44:05 +0100
Message-Id: <20220206154405.1243333-10-sam@ravnborg.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_bridge_chain_{pre_enable,enable,disable,post_disable} has no
users left and we have atomic variants that should be used.
Drop them so they do not gain new users.

Adjust a few comments to avoid references to the dropped functions.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <maxime@cerno.tech>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_bridge.c | 110 -----------------------------------
 include/drm/drm_bridge.h     |  28 ---------
 2 files changed, 138 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebc..7a57d6816105 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -485,61 +485,6 @@ drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
 
-/**
- * drm_bridge_chain_disable - disables all bridges in the encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.disable op for all the bridges in the encoder
- * chain, starting from the last bridge to the first. These are called before
- * calling the encoder's prepare op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_disable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->disable)
-			iter->funcs->disable(iter);
-
-		if (iter == bridge)
-			break;
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_disable);
-
-/**
- * drm_bridge_chain_post_disable - cleans up after disabling all bridges in the
- *				   encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
- * encoder chain, starting from the first bridge to the last. These are called
- * after completing the encoder's prepare op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->post_disable)
-			bridge->funcs->post_disable(bridge);
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_post_disable);
-
 /**
  * drm_bridge_chain_mode_set - set proposed mode for all bridges in the
  *			       encoder chain
@@ -569,61 +514,6 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
-/**
- * drm_bridge_chain_pre_enable - prepares for enabling all bridges in the
- *				 encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
- * chain, starting from the last bridge to the first. These are called
- * before calling the encoder's commit op.
- *
- * Note: the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-	struct drm_bridge *iter;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		if (iter->funcs->pre_enable)
-			iter->funcs->pre_enable(iter);
-
-		if (iter == bridge)
-			break;
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
-
-/**
- * drm_bridge_chain_enable - enables all bridges in the encoder chain
- * @bridge: bridge control structure
- *
- * Calls &drm_bridge_funcs.enable op for all the bridges in the encoder
- * chain, starting from the first bridge to the last. These are called
- * after completing the encoder's commit op.
- *
- * Note that the bridge passed should be the one closest to the encoder
- */
-void drm_bridge_chain_enable(struct drm_bridge *bridge)
-{
-	struct drm_encoder *encoder;
-
-	if (!bridge)
-		return;
-
-	encoder = bridge->encoder;
-	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
-		if (bridge->funcs->enable)
-			bridge->funcs->enable(bridge);
-	}
-}
-EXPORT_SYMBOL(drm_bridge_chain_enable);
-
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index fc00304be643..ed2e4a8fe510 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -297,12 +297,6 @@ struct drm_bridge_funcs {
 	 * not enable the display link feeding the next bridge in the chain (if
 	 * there is one) when this callback is called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_pre_enable. It would be prudent to also provide an
-	 * implementation of @pre_enable if you are expecting driver calls into
-	 * &drm_bridge_chain_pre_enable.
-	 *
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
@@ -323,11 +317,6 @@ struct drm_bridge_funcs {
 	 * callback must enable the display link feeding the next bridge in the
 	 * chain if there is one.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from &drm_bridge_chain_enable.
-	 * It would be prudent to also provide an implementation of @enable if
-	 * you are expecting driver calls into &drm_bridge_chain_enable.
-	 *
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
@@ -345,12 +334,6 @@ struct drm_bridge_funcs {
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_disable. It would be prudent to also provide an
-	 * implementation of @disable if you are expecting driver calls into
-	 * &drm_bridge_chain_disable.
-	 *
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
@@ -370,13 +353,6 @@ struct drm_bridge_funcs {
 	 * signals) feeding it is no longer running when this callback is
 	 * called.
 	 *
-	 * Note that this function will only be invoked in the context of an
-	 * atomic commit. It will not be invoked from
-	 * &drm_bridge_chain_post_disable.
-	 * It would be prudent to also provide an implementation of
-	 * @post_disable if you are expecting driver calls into
-	 * &drm_bridge_chain_post_disable.
-	 *
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
@@ -868,13 +844,9 @@ enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 			    const struct drm_display_info *info,
 			    const struct drm_display_mode *mode);
-void drm_bridge_chain_disable(struct drm_bridge *bridge);
-void drm_bridge_chain_post_disable(struct drm_bridge *bridge);
 void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 			       const struct drm_display_mode *mode,
 			       const struct drm_display_mode *adjusted_mode);
-void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
-void drm_bridge_chain_enable(struct drm_bridge *bridge);
 
 int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
 				  struct drm_crtc_state *crtc_state,
-- 
2.32.0

