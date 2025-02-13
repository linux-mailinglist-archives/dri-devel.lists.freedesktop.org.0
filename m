Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA76A34329
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F5C10EAF1;
	Thu, 13 Feb 2025 14:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J0bbn1aL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2004F10EAEE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 09EE6A41D5E;
 Thu, 13 Feb 2025 14:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8524C4CED1;
 Thu, 13 Feb 2025 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457912;
 bh=72Lepx1DN8gQFji9Cjn3zP8xGqZXbIiwFKfACerW6i4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=J0bbn1aLsA2ZyNa0O0cxSmj/CWZknrcr+lIZUL+dG4w9+mONgdbhjaLb6WUTOGUko
 Uuv8BjysxNoR01g2q7nk15elHd8XtXUiPQpQlZf+aAcFxEKta5THptt4oYo5uG+4Vd
 GDoao6RtiXCn48TQP5Tqx0HTDvAkjspGIrho+bTe8004IQ1v4wa2GALdH0Lpspg06t
 plO2XIaAuVnaZ5B91Wz41ZhCRwa8b0W7gvEohjyoUipNF/WAWSpc2ccd/9tdpFhSjH
 tEC4o7QKarMpxNxKgHc7XHkAPUzogNXr35kC6YaVzwpYvqsPLIEP4B5w4of4sstNhg
 ZmXqJdvuXoVMQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:47 +0100
Subject: [PATCH v3 28/37] drm/bridge: Provide a helper to retrieve current
 bridge state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-28-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331; i=mripard@kernel.org;
 h=from:subject:message-id; bh=72Lepx1DN8gQFji9Cjn3zP8xGqZXbIiwFKfACerW6i4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWJWWdfacEcg56NQ9o+t24c8dIcYtLy976wdN3RVVe
 s9u7znTjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRxgTGOlU9/gfpCfaPHDOP
 1hUbJpauWH657aX739Mucz5prlwsl2zty1kyUTXVWJ7VLZz5U/l3xvqobBUjvUUfllvp7Hny9qK
 4zY87HwwlDjz12C4XNikyeKNK8hHJzS/PzH/Uby9/7lY5gyYA
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_bridge.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2b65466540306feb0694abdc7cd801369cb9c9f0..4cc12b8bbdfe2b496546607d1ae0b66a903c8f89 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -955,10 +955,31 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;
 }
 #endif
 
+/**
+ * @drm_bridge_get_current_state() - Get the current bridge state
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
+	drm_modeset_lock_assert_held(&bridge->base.lock);
+
+	if (!bridge)
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
2.48.0

