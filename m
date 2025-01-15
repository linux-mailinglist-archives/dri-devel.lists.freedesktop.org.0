Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C96A12D3C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB3E10E806;
	Wed, 15 Jan 2025 21:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j/Rk0YHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D3710E80C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 48BC4A42500;
 Wed, 15 Jan 2025 21:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A709AC4CED1;
 Wed, 15 Jan 2025 21:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975210;
 bh=/CiUYb4G3lzcZpS8RuUPgDRCzbVp2kboLer3fHdUhgE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=j/Rk0YHWZaLy3DE+xuHzbNP2g7J39AjVtJsOhPqtEM3RRSv1BwXvPVc5tDMXQO+pU
 RFHPAqxzHnPyJksqGiooCCwzgTctaJaf8ZpXWePhvTDI4EfUY2uCrDh8MSkLuA0V/V
 l5I2TdDrAiOSH8QIfmMZADIyzJ4xJd+j1P54eqJaJQY/5v73vbWv2bmzbgG+wGUq5j
 RJCd0JuybCVBPWWt4+Ue4aw6mngRfsVA8JKGiijP23XA9qyV8uoT640xpiZxHy5f6O
 wsra8BBf/lDacz6UMEiXPBcdHq3cic1GZFY5IYV3VML4/575aZWVN605Pk2GbL/z9Z
 W/QQaSaM7GugQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:32 +0100
Subject: [PATCH 25/29] drm/bridge: Provide pointers to the connector and
 crtc in bridge state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-25-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3800; i=mripard@kernel.org;
 h=from:subject:message-id; bh=/CiUYb4G3lzcZpS8RuUPgDRCzbVp2kboLer3fHdUhgE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdygqPv69qEVzpmp9ffqxu0REZw1L2gJuR8TYzeHycW
 Hamq7J0TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIlkJTPWh6izeJjxf9RKKX+r
 J5j/bt+qW4+kmJuU+i7PEJZx5FlTGllpNXd65b5VLkmZvzfy7GZhbDh6XTtabPO0YIuXVzniA9Q
 023/u7w2fl3ntSsBL7XN/b3YaTd61cYP8fdPFMjeqwx12zAMA
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

Now that connectors are no longer necessarily created by the bridges
drivers themselves but might be created by drm_bridge_connector, it's
pretty hard for bridge drivers to retrieve pointers to the connector and
CRTC they are attached to.

Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
encoder field, and then the drm_encoder crtc field, both of them being
deprecated.

And for the connector, since we can have multiple connectors attached to
a CRTC, we don't really have a reliable way to get it.

Let's provide both pointers in the drm_bridge_state structure so we
don't have to follow deprecated, non-atomic, pointers, and be more
consistent with the other KMS entities.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++++
 drivers/gpu/drm/drm_bridge.c              | 21 +++++++++++++--------
 include/drm/drm_atomic.h                  | 14 ++++++++++++++
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 519228eb109533d2596e899a57b571fa0995824f..66661dca077215b78dffca7bc1712f56d35e3918 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -777,10 +777,15 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
  * that don't subclass the bridge state.
  */
 void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
 					    struct drm_bridge_state *state)
 {
+	if (state->connector) {
+		drm_connector_put(state->connector);
+		state->connector = NULL;
+	}
+
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
 
 /**
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c937980d6591fd98e33e37d799ebf84e7e6c5529..069c105aa59636c64caffbefcf482133b0db97d9 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -829,19 +829,24 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
 static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 				   struct drm_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state)
 {
+	struct drm_bridge_state *bridge_state;
+	int ret;
+
+	bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+						       bridge);
+	if (WARN_ON(!bridge_state))
+		return -EINVAL;
+
+	bridge_state->crtc = crtc_state->crtc;
+
+	drm_connector_get(conn_state->connector);
+	bridge_state->connector = conn_state->connector;
+
 	if (bridge->funcs->atomic_check) {
-		struct drm_bridge_state *bridge_state;
-		int ret;
-
-		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
-							       bridge);
-		if (WARN_ON(!bridge_state))
-			return -EINVAL;
-
 		ret = bridge->funcs->atomic_check(bridge, bridge_state,
 						  crtc_state, conn_state);
 		if (ret)
 			return ret;
 	} else if (bridge->funcs->mode_fixup) {
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index bd7959ae312c99c0a0034d36378ae44f04f6a374..b2c5868a3a66280ffc7437fa7a8613079402facd 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1166,10 +1166,24 @@ struct drm_bridge_state {
 	/**
 	 * @bridge: the bridge this state refers to
 	 */
 	struct drm_bridge *bridge;
 
+	/**
+	 * @crtc: CRTC the bridge is connected to, NULL if disabled.
+	 *
+	 * Do not change this directly.
+	 */
+	struct drm_crtc *crtc;
+
+	/**
+	 * @connector: The connector the bridge is connected to, NULL if disabled.
+	 *
+	 * Do not change this directly.
+	 */
+	struct drm_connector *connector;
+
 	/**
 	 * @input_bus_cfg: input bus configuration
 	 */
 	struct drm_bus_cfg input_bus_cfg;
 

-- 
2.47.1

