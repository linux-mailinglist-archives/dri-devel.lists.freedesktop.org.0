Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880F5A34312
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37E410EAE3;
	Thu, 13 Feb 2025 14:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AYF4dF+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC9A10EAE3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2AC4BA4201C;
 Thu, 13 Feb 2025 14:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9534C4CED1;
 Thu, 13 Feb 2025 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457882;
 bh=vkmsQVJmDiBD+o85i9Hy+FmSGOjR/a9ZS0sHiO5uueM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AYF4dF+CmqrAXzd45F3AsIfkxtzfnq45LsmXlgv8V9FU7jT9BeLhiE3ifNhIA23TE
 mofh7MJcZUMKWkhp2unNX2/Z8KjC+FDSDY/ugn/8RxuZtORosOmp66XuZxxjD6utCm
 IhPjZVnERFK8vYa+jcrJrVf14B52ie+xBEYnh2aUmi7tG2Iytdy8dHlwzWB4X3+zVA
 1b2PuArbkT8LKjV0RzLPMwRqo/vd3BDuQ+i4ufW6Q0+h8TmrVquyz3EqverVBz+vEx
 V0IX6VC/kFiY0i0tq8Tv4Njn/bK4TcZopnJV09T5URKBfeh7NP4Tt3uUDGOHjE7Yk+
 eOGSepy8QvIog==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:36 +0100
Subject: [PATCH v3 17/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_modeset_enables()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-17-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vkmsQVJmDiBD+o85i9Hy+FmSGOjR/a9ZS0sHiO5uueM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWGXFGBJatmRbP5wdeeTbNbE57u6Ss5lWPJkssnufg
 GHCz/8FHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAilgqMDd1Lo6STQ2NDOZ3X
 J7ow2v9cXX8l6SKH8/fdt+IDdS4sPJQr/TRSNGrik7M3mnl9j8Z0MdbZ8p86J7cs9aqFAc/GhS3
 +f2ebOVx7+r3TLO+kgvzMdFXGEzbsN2/UOt5jnTfpGq9UxSUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

drm_atomic_helper_commit_modeset_enables() enables all outputs affected
by a new commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index c01832d6953fc0863db7532aca909516d1796b72..1fc15d4ab096ada43969f5d9f0c74a4384208582 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1484,11 +1484,11 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 }
 
 /**
  * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function enables all the outputs with the new configuration which had to
  * be turned off for the update.
  *
  * For compatibility with legacy CRTC helpers this should be called after
@@ -1496,20 +1496,20 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
  * does. But drivers with different needs can group the modeset commits together
  * and do the plane commits at the end. This is useful for drivers doing runtime
  * PM since planes updates then only happen when the CRTC is actually enabled.
  */
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
-					      struct drm_atomic_state *old_state)
+					      struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
 	int i;
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
 		/* Need to filter out CRTCs where only planes change. */
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
 			continue;
@@ -1521,17 +1521,17 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 
 		if (new_crtc_state->enable) {
 			drm_dbg_atomic(dev, "enabling [CRTC:%d:%s]\n",
 				       crtc->base.id, crtc->name);
 			if (funcs->atomic_enable)
-				funcs->atomic_enable(crtc, old_state);
+				funcs->atomic_enable(crtc, state);
 			else if (funcs->commit)
 				funcs->commit(crtc);
 		}
 	}
 
-	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
 		struct drm_bridge *bridge;
 
 		if (!new_conn_state->best_encoder)
@@ -1550,25 +1550,25 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 		/*
 		 * Each encoder has at most one connector (since we always steal
 		 * it away), so we won't call enable hooks twice.
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
+		drm_atomic_bridge_chain_pre_enable(bridge, state);
 
 		if (funcs) {
 			if (funcs->atomic_enable)
-				funcs->atomic_enable(encoder, old_state);
+				funcs->atomic_enable(encoder, state);
 			else if (funcs->enable)
 				funcs->enable(encoder);
 			else if (funcs->commit)
 				funcs->commit(encoder);
 		}
 
-		drm_atomic_bridge_chain_enable(bridge, old_state);
+		drm_atomic_bridge_chain_enable(bridge, state);
 	}
 
-	drm_atomic_helper_commit_writebacks(dev, old_state);
+	drm_atomic_helper_commit_writebacks(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
 /*
  * For atomic updates which touch just a single CRTC, calculate the time of the

-- 
2.48.0

