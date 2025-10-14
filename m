Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E0DBD9A61
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 15:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E589310E605;
	Tue, 14 Oct 2025 13:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="reQY645U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E306010E605
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 13:19:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C23276228A;
 Tue, 14 Oct 2025 12:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211C9C4CEE7;
 Tue, 14 Oct 2025 12:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443228;
 bh=1GoiroCWcyhR/sgmXTvYE6KraXHarOb2uQpeZ6OwHF4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=reQY645UTXWJkNfZwMpmWXuPbF+BSjQxobpOsuOnUUi2t9Oau7084tOCCfrVTkKv2
 JpslL2jPQ1Q0v4AcOtelq6T8Lckc8KQKh7JrZt1lDCAQxJTLtnR6Lb5ANgWq/1B/qV
 Vf7gPCiJnPOPrbez6B+Tw7i2bR8EunIJsIY0zYUopcGzlvNVI59hTiFWE+ATREc+EG
 rsUBEgdS9u3X6xQYD45yAJG5BvXbbgi8JCqrz1ei/8/5vjTngpHWvvH64HFxYe9VSo
 SJittPYqFBrqO2ncvM2uqRocnsbP+YRl3DtsxKuaeqFtwOwKq0W3bDz3ey6eCth3/y
 c0wXtgRyvKjAA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:49 +0200
Subject: [PATCH v2 05/16] drm/bridge: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-5-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2919; i=mripard@kernel.org;
 h=from:subject:message-id; bh=1GoiroCWcyhR/sgmXTvYE6KraXHarOb2uQpeZ6OwHF4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrF1ndefP4LObWebwzOiJ/gZ7A7vryd+VA6+eXfqWz
 yNHJmt6x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIEUbGencZG5EK85gQBZ1b
 ZlWi6tPfXK8Jm5IoJ7PL0KJvy6a7xzpOhSyX77xRGFe7MvGh4/xNjA2X+f5qz9m48KpQ4YHLz7T
 rvLT3TJjWtXvfSzHhWWUeRT6hoh/EeQtLW+0X5Ty8FXY1+iYA
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
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/drm_bridge.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 630b5e6594e0affad9ba48791207c7b403da5db8..f0db891863428ee65625a6a3ed38f63ec802595e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -394,11 +394,27 @@ drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
 	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
 
 	bridge->funcs->atomic_destroy_state(bridge, state);
 }
 
+static struct drm_private_state *
+drm_bridge_atomic_create_priv_state(struct drm_private_obj *obj)
+{
+	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
+	struct drm_bridge_state *state;
+
+	state = bridge->funcs->atomic_reset(bridge);
+	if (IS_ERR(state))
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &state->base);
+
+	return &state->base;
+}
+
 static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
+	.atomic_create_state = drm_bridge_atomic_create_priv_state,
 	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
 	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
 };
 
 static bool drm_bridge_is_atomic(struct drm_bridge *bridge)
@@ -462,30 +478,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
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

