Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9AEA12D28
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB3C10E7E9;
	Wed, 15 Jan 2025 21:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nloJwC9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4528410E528
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F415B5C5CD8;
 Wed, 15 Jan 2025 21:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23714C4CED1;
 Wed, 15 Jan 2025 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975164;
 bh=JvQm1aj5Sq1V7cJors4GdJigIzlzbMu3j8ZB3Yo5M+k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nloJwC9WV1gQEWq5qxvZ7lnFAuQ5tiAAjA9PTT5nfEMGjxgOYiAKvh83gmG6/iV2O
 J9bSl/z33vyHpaOUAiR1whtfdLYsOCK5U1cqlBK07sj0tiBLRHMJn/fKwAYr9zhqgD
 IOFtEbSGFnZx/JiQbtRBfLc8SBYbc9NeUpJmVssLKZbmUmyJ0npeB6EnV+6mjpYsrY
 7KbUsFcy265mGOSRXAK5rsY00BzBkywiWDgNy5QZZaWjqXz4/ynS6ZAszu67vW9YfW
 a12lOfaMqf8N3AYH6kRUVC6pw6gwoa8leztfCCotjSOoChqRqiJ0rc+H1JEjLqgKaD
 5QTaqyt8kMXnw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:15 +0100
Subject: [PATCH 08/29] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_post_disable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-8-9a2fecd886a6@kernel.org>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
In-Reply-To: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3022; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JvQm1aj5Sq1V7cJors4GdJigIzlzbMu3j8ZB3Yo5M+k=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyhLSzVwS5vdXHHsxdW7wA5XenXL7PWoyn7+TVF018
 fTa0z59HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAioQ6MNVwLd/U2rbs/h1El
 Q2z7zX2HC3mOXLK+4WLS6RNTxmeS0PbXWdHk77Wcw0/uPfylwrX7AWN98Uy+nfYTC4oOvtx7sK1
 owT3LSuPIF6lT/3frTix1XfRGNi45X/RWycmL7ycrbyzoM70NAA==
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

drm_atomic_bridge_chain_post_disable() disables all bridges affected by
a new commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e714c8ddd9d564473a41c465e437a6022dfd031c..9755761d0d0f2659cf8d71e1734aee9772cc8c0f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -585,17 +585,17 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 
 static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
-						struct drm_atomic_state *old_state)
+						struct drm_atomic_state *state)
 {
-	if (old_state && bridge->funcs->atomic_post_disable) {
+	if (state && bridge->funcs->atomic_post_disable) {
 		struct drm_bridge_state *old_bridge_state;
 
 		old_bridge_state =
-			drm_atomic_get_old_bridge_state(old_state,
+			drm_atomic_get_old_bridge_state(state,
 							bridge);
 		if (WARN_ON(!old_bridge_state))
 			return;
 
 		bridge->funcs->atomic_post_disable(bridge,
@@ -607,11 +607,11 @@ static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
 
 /**
  * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
  *					  in the encoder chain
  * @bridge: bridge control structure
- * @old_state: old atomic state
+ * @state: atomic state being committed
  *
  * Calls &drm_bridge_funcs.atomic_post_disable (falls back on
  * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
  * starting from the first bridge to the last. These are called after completing
  * &drm_encoder_helper_funcs.atomic_disable
@@ -628,11 +628,11 @@ static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
  * Bridge B, Bridge A, Bridge E, Bridge D, Bridge C.
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
-					  struct drm_atomic_state *old_state)
+					  struct drm_atomic_state *state)
 {
 	struct drm_encoder *encoder;
 	struct drm_bridge *next, *limit;
 
 	if (!bridge)
@@ -675,16 +675,16 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 								 chain_node) {
 					if (next == bridge)
 						break;
 
 					drm_atomic_bridge_call_post_disable(next,
-									    old_state);
+									    state);
 				}
 			}
 		}
 
-		drm_atomic_bridge_call_post_disable(bridge, old_state);
+		drm_atomic_bridge_call_post_disable(bridge, state);
 
 		if (limit)
 			/* Jump all bridges that we have already post_disabled */
 			bridge = limit;
 	}

-- 
2.47.1

