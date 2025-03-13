Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889E7A5F38D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 13:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69E810E85D;
	Thu, 13 Mar 2025 12:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ob/nNi+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CCA10E872
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 12:00:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C15055C5D76;
 Thu, 13 Mar 2025 11:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6EDC4CEEB;
 Thu, 13 Mar 2025 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741867218;
 bh=gwr3V49Utd/SKmLHHtevd1iF7qftbaASGq6Mah8+cNI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ob/nNi+zhKrLnG39o9effLm7IfK+Aoot/yxke/ynTbBGsZxn5zt6H0gD0JZS5Kv3T
 yfqzNsGU3KQDINGgZWTbOLfwjXDvNOctQDOp0w7wmM3JQ7AlIR2Uc8GzZGw9Jjes4W
 GRg70tVrgkbGjnzqmB6OS+R6Se0frXcZoZvqYmtpIhMPfZ9Axl209f4foNfHKFV9Wz
 4RUiP1s9DpRaEjYd++2eEKBg97GExRBHNCHFkN/ZYhZ1CQHPfaFqZgiINuUksDDIdM
 BsE1ALXJENdq/y8OMk7hqs7b0BAjfTPLCywEjmFznligPj18ZHKqUXJlFds73ylfuR
 xLibtri2i10FQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Mar 2025 12:59:56 +0100
Subject: [PATCH v6 02/16] drm/bridge: Provide a helper to retrieve current
 bridge state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-bridge-connector-v6-2-511c54a604fb@kernel.org>
References: <20250313-bridge-connector-v6-0-511c54a604fb@kernel.org>
In-Reply-To: <20250313-bridge-connector-v6-0-511c54a604fb@kernel.org>
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
 h=from:subject:message-id; bh=gwr3V49Utd/SKmLHHtevd1iF7qftbaASGq6Mah8+cNI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOmXTuxjtdt9zSEprtvQ3JzvzwUr4YwtbXJOzqtVehfoW
 rd13+LrKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwERklzIyLA2adUjp2bKvS4JE
 Jk2eu59/t3iv/+d9DB9eLjRVOaCrJMbI8MV4YiXb9ft3zb4+2sTvy7TgsW5Ok0xOfqpU79LbM+Y
 wMQEA
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
index 884ff1faa4c896c28a38399ceaa5016ab704c886..cdad3b78a195aa39776c93e2371217d3d3fb6064 100644
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

