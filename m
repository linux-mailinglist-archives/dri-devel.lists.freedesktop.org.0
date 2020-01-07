Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A00132ED2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 19:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCD86E12A;
	Tue,  7 Jan 2020 18:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183C56E125
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 18:58:19 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C7054290546;
 Tue,  7 Jan 2020 18:58:17 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/5] Revert "drm/bridge: Add an ->atomic_check() hook"
Date: Tue,  7 Jan 2020 19:58:05 +0100
Message-Id: <20200107185807.606999-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200107185807.606999-1-boris.brezillon@collabora.com>
References: <20200107185807.606999-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit b86d895524ab ("drm/bridge: Add an ->atomic_check()
hook"). Commit 6ed7e9625fa6 ("drm/bridge: Add a drm_bridge_state
object") introduced a circular dependency between drm.ko and
drm_kms_helper.ko which uncovered a misdesign in how the whole thing
was implemented. Let's revert all patches depending on the bridge_state
infrastructure for now.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 +++---
 drivers/gpu/drm/drm_bridge.c        | 62 -----------------------------
 include/drm/drm_bridge.h            | 29 +-------------
 3 files changed, 7 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index afe14f72a824..ad8eae98d9e8 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -437,12 +437,12 @@ mode_fixup(struct drm_atomic_state *state)
 		funcs = encoder->helper_private;
 
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		ret = drm_atomic_bridge_chain_check(bridge,
-						    new_crtc_state,
-						    new_conn_state);
-		if (ret) {
-			DRM_DEBUG_ATOMIC("Bridge atomic check failed\n");
-			return ret;
+		ret = drm_bridge_chain_mode_fixup(bridge,
+					&new_crtc_state->mode,
+					&new_crtc_state->adjusted_mode);
+		if (!ret) {
+			DRM_DEBUG_ATOMIC("Bridge fixup failed\n");
+			return -EINVAL;
 		}
 
 		if (funcs && funcs->atomic_check) {
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 8e4b799150b0..872e159fcb42 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -645,68 +645,6 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
-static int drm_atomic_bridge_check(struct drm_bridge *bridge,
-				   struct drm_crtc_state *crtc_state,
-				   struct drm_connector_state *conn_state)
-{
-	if (bridge->funcs->atomic_check) {
-		struct drm_bridge_state *bridge_state;
-		int ret;
-
-		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
-							       bridge);
-		if (WARN_ON(!bridge_state))
-			return -EINVAL;
-
-		ret = bridge->funcs->atomic_check(bridge, bridge_state,
-						  crtc_state, conn_state);
-		if (ret)
-			return ret;
-	} else if (bridge->funcs->mode_fixup) {
-		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
-					       &crtc_state->adjusted_mode))
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
-/**
- * drm_atomic_bridge_chain_check() - Do an atomic check on the bridge chain
- * @bridge: bridge control structure
- * @crtc_state: new CRTC state
- * @conn_state: new connector state
- *
- * Calls &drm_bridge_funcs.atomic_check() (falls back on
- * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder chain,
- * starting from the last bridge to the first. These are called before calling
- * &drm_encoder_helper_funcs.atomic_check()
- *
- * RETURNS:
- * 0 on success, a negative error code on failure
- */
-int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
-				  struct drm_crtc_state *crtc_state,
-				  struct drm_connector_state *conn_state)
-{
-	struct drm_encoder *encoder = bridge->encoder;
-	struct drm_bridge *iter;
-
-	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
-		int ret;
-
-		ret = drm_atomic_bridge_check(iter, crtc_state, conn_state);
-		if (ret)
-			return ret;
-
-		if (iter == bridge)
-			break;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
-
 /**
  * __drm_atomic_helper_bridge_reset() - Initialize a bridge state to its
  *					default
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index ae0595c70132..52d3ed150618 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -128,9 +128,7 @@ struct drm_bridge_funcs {
 	 * this function passes all other callbacks must succeed for this
 	 * configuration.
 	 *
-	 * The mode_fixup callback is optional. &drm_bridge_funcs.mode_fixup()
-	 * is not called when &drm_bridge_funcs.atomic_check() is implemented,
-	 * so only one of them should be provided.
+	 * The @mode_fixup callback is optional.
 	 *
 	 * NOTE:
 	 *
@@ -387,28 +385,6 @@ struct drm_bridge_funcs {
 	void (*atomic_destroy_state)(struct drm_bridge *bridge,
 				     struct drm_bridge_state *state);
 
-	/**
-	 * @atomic_check:
-	 *
-	 * This method is responsible for checking bridge state correctness.
-	 * It can also check the state of the surrounding components in chain
-	 * to make sure the whole pipeline can work properly.
-	 *
-	 * &drm_bridge_funcs.atomic_check() hooks are called in reverse
-	 * order (from the last to the first bridge).
-	 *
-	 * This method is optional. &drm_bridge_funcs.mode_fixup() is not
-	 * called when &drm_bridge_funcs.atomic_check() is implemented, so only
-	 * one of them should be provided.
-	 *
-	 * RETURNS:
-	 * zero if the check passed, a negative error code otherwise.
-	 */
-	int (*atomic_check)(struct drm_bridge *bridge,
-			    struct drm_bridge_state *bridge_state,
-			    struct drm_crtc_state *crtc_state,
-			    struct drm_connector_state *conn_state);
-
 	/**
 	 * @atomic_reset:
 	 *
@@ -576,9 +552,6 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
 void drm_bridge_chain_enable(struct drm_bridge *bridge);
 
-int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
-				  struct drm_crtc_state *crtc_state,
-				  struct drm_connector_state *conn_state);
 void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 				     struct drm_atomic_state *state);
 void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
