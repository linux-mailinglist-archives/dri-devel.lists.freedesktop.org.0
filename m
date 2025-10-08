Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AECBC4AFF
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798E810E7EB;
	Wed,  8 Oct 2025 12:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qDqIGuQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E398210E7EB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:04:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 61BB961F7F;
 Wed,  8 Oct 2025 12:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4172C4CEF4;
 Wed,  8 Oct 2025 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925065;
 bh=1ctSRQxRzQ0SMqHL+I+N+LPqr4KFZVIjEBjalBceluk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qDqIGuQnrFUXRnmWByINscLOCTC9C8KhtlxH7l+It4WhdYQYk0up4DKeqp6+VWEx/
 wogb/umR+eiTUW1kR6OfUqkj/FHf6jaCurMJ2KODuLlPdIcDw7SHoRJA0nfhRBPJt/
 OdPWM5qlD6Av3BUWGuCr//FF9ACOjYgBxXWHbCvDypo99naTcluwXVKwViJyOmAegS
 pygxnSwdn+Xxq6TXkvVRqtP9bc/YQHBOzBAqzbG5r3F4eoseZYmnA4IL6HUHKxbLgy
 ncAdo4JATn7iPqvOtfGpKxSisPWX5lZfMc3VEVuXf7amqFN0q4p//6NMn2rGO5AXa8
 Bp1JpzNkdqLuQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:02 +0200
Subject: [PATCH 04/16] drm/bridge: Switch private_obj initialization to reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-4-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786; i=mripard@kernel.org;
 h=from:subject:message-id; bh=1ctSRQxRzQ0SMqHL+I+N+LPqr4KFZVIjEBjalBceluk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgk36qx6dtKvcXbcs6nqSi4/dkvhz4qqlStOVMsxja
 2v/5SV1TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIk8T2Osj8/JXDfzT9bUpUw2
 ul5r/mWcv6ko/uX+23NNAdfC+xXMbxyJb+e67/j6nZW0M8fvjCNLGRvWTJ248lZCdMuvqbuqihO
 FONzt1nX0TznIINd+10tjFq8OY/uG6RPdBEOlAwsCnlWu9gIA
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

The bridge implementation relies on a drm_private_obj, that is
initialized by allocating and initializing a state, and then passing it
to drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a reset implementation, let's migrate this
instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/drm_bridge.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 630b5e6594e0affad9ba48791207c7b403da5db8..cc346412b0205288ec7ee5a7d80a897ad9659404 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -394,13 +394,27 @@ drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
 	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
 
 	bridge->funcs->atomic_destroy_state(bridge, state);
 }
 
+static void
+drm_bridge_reset_priv_state(struct drm_private_obj *obj)
+{
+	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
+	struct drm_bridge_state *state;
+
+	state = bridge->funcs->atomic_reset(bridge);
+	if (IS_ERR(state))
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &state->base);
+}
+
 static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
 	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
 	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
+	.reset = drm_bridge_reset_priv_state,
 };
 
 static bool drm_bridge_is_atomic(struct drm_bridge *bridge)
 {
 	return bridge->funcs->atomic_reset != NULL;
@@ -462,30 +476,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		ret = bridge->funcs->attach(bridge, encoder, flags);
 		if (ret < 0)
 			goto err_reset_bridge;
 	}
 
-	if (drm_bridge_is_atomic(bridge)) {
-		struct drm_bridge_state *state;
-
-		state = bridge->funcs->atomic_reset(bridge);
-		if (IS_ERR(state)) {
-			ret = PTR_ERR(state);
-			goto err_detach_bridge;
-		}
-
+	if (drm_bridge_is_atomic(bridge))
 		drm_atomic_private_obj_init(bridge->dev, &bridge->base,
-					    &state->base,
+					    NULL,
 					    &drm_bridge_priv_state_funcs);
-	}
 
 	return 0;
 
-err_detach_bridge:
-	if (bridge->funcs->detach)
-		bridge->funcs->detach(bridge);
-
 err_reset_bridge:
 	bridge->dev = NULL;
 	bridge->encoder = NULL;
 	list_del(&bridge->chain_node);
 

-- 
2.51.0

