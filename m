Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208FBA44688
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9555F10E74B;
	Tue, 25 Feb 2025 16:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iRi2Tb4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EB210E1C7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:44:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9A409612AB;
 Tue, 25 Feb 2025 16:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E39C4CEDD;
 Tue, 25 Feb 2025 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740501850;
 bh=JgF9vOJBbu71izE1DQMLADlikJ3dVzuG54ze6IQ0bXQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=iRi2Tb4Ig4lK3NJG8vfPccbtFys8UxvZGObwTUVOxOBvCLKmDDO4ajhT5EP0bx/Q1
 7DCZZfUJueCTh6oEsDytufmFjkJrpwm6+D4zoHgIRxd/H66NbEvka7Y3f5bF8e4jHn
 t7GtMybQN3blI6zMSu9M8CmIT1IjXfQQog4EzJvFcY6Qr/vQ/vnmUPzvOK2uRFAyIO
 BjEkQzgsYUZmxd23tn/c9OXdvHhQzvXWZzxoJW9BZtQbZQZ8aMEW9OuOnOPnBF3Aaf
 XyBfeJF7jOL5gNHG3gwsfCV2L7mPhCVKBUKvhEQMFR4ybbHeKOjHMiTeJ+39+tD6c+
 p81ImV0wxi4/g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 25 Feb 2025 17:43:50 +0100
Subject: [PATCH v4 02/15] drm/bridge: Provide a helper to retrieve current
 bridge state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-bridge-connector-v4-2-7ecb07b09cad@kernel.org>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
In-Reply-To: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JgF9vOJBbu71izE1DQMLADlikJ3dVzuG54ze6IQ0bXQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOl7P3tFTXn0oKhSVIm/ZsJCT22TjO5X+/db7trpaN88V
 6vCkOdxx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI5VOMdaaHfYvmfPx/4ubm
 6viVGw4xBAmGNbr8Tu1tXa/irsXvuvZ++rTevtl66m6/La7vm6joylifsp5R8DvnyzbXRUca5ZQ
 CtBdw1jB83BG7WGDSo89XPgtvuaO/rDO4Z6a0zeGPHhm79mcBAA==
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

The current bridge state is accessible from the drm_bridge structure,
but since it's fairly indirect it's not easy to figure out.

Provide a helper to retrieve it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_bridge.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2b65466540306feb0694abdc7cd801369cb9c9f0..6fb1da7c195e99143a67a999d16fe361c1e3f4ab 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -955,10 +955,42 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;
 }
 #endif
 
+/**
+ * drm_bridge_get_current_state() - Get the current bridge state
+ * @bridge: bridge object
+ *
+ * This function must be called with the modeset lock held.
+ *
+ * RETURNS:
+ *
+ * The current bridge state, or NULL if there is none.
+ */
+static inline struct drm_bridge_state *
+drm_bridge_get_current_state(struct drm_bridge *bridge)
+{
+	if (!bridge)
+		return NULL;
+
+	/*
+	 * Only atomic bridges will have bridge->base initialized by
+	 * drm_atomic_private_obj_init(), so we need to make sure we're
+	 * working with one before we try to use the lock.
+	 */
+	if (!bridge->funcs || !bridge->funcs->atomic_reset)
+		return NULL;
+
+	drm_modeset_lock_assert_held(&bridge->base.lock);
+
+	if (!bridge->base.state)
+		return NULL;
+
+	return drm_priv_to_bridge_state(bridge->base.state);
+}
+
 /**
  * drm_bridge_get_next_bridge() - Get the next bridge in the chain
  * @bridge: bridge object
  *
  * RETURNS:

-- 
2.48.1

