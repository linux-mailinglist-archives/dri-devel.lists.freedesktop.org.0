Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A43DD3A962
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8239E10E441;
	Mon, 19 Jan 2026 12:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mZsKkAoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEF710E434
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:50:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1D90C60131;
 Mon, 19 Jan 2026 12:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48084C116C6;
 Mon, 19 Jan 2026 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827022;
 bh=ep8JVLt5f2TE1ckPZ9fgZZ5MIxnCeDbI9r/puPzHE3U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mZsKkAoVL0lD4wTATeiKro7PpSGorfE2JBNOc1Lq+B9NHWTQDD3LfUWOX6wPtnTFr
 G3VzWswvOVhWAz9SItR6nBgHfwOsnVrKz+Xy585i1+CCs9cqc2WnOmyjzRkblFzjOx
 oSMv6z05P1ng6obGbHvNoC96XTjTZ01re6LtWg/dDly8FEvgESTsTDs9MWcSx0Rf3N
 1xpr4yP1Z3H8EM1C+3ONRCC7I1DUdVqT9LQ8nCqQ/yUHdIhn01tTzzWtvA9uYYOO1G
 iaMnq6wa+96ooJi/ZMbF/3/zi6NgJl0vMV0hlqAFPUSaUNeOtTo9eSMBpVIlsGCJpN
 +OnCa0FR/mU4w==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:00 +0100
Subject: [PATCH v3 04/15] drm/bridge: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-4-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918; i=mripard@redhat.com;
 h=from:subject:message-id; bh=ep8JVLt5f2TE1ckPZ9fgZZ5MIxnCeDbI9r/puPzHE3U=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GtWK12yP7fXe53FDeXMk01PXTq+nnx6/9XolW/jUe
 FW5ff3zjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRi98YG9ZwHs3WntLd65iZ
 YFi/7vX8//mRZ46rblp346zz/BTNkiP1X5Zca3ls59oq1vTz52+BTsb6hNOBLeGxjPaFem9e6if
 VhRvol2hZs1k+lefbF7X4Z059vr/DpRfxgY5VN1fG7vjoFwsA
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
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
index 6dcf8f6d3ecfa6f689dcf71dbc9bdac4dad7fd9c..316cf84519de54c4dc4bfb3bc3addc4990a200f5 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -458,11 +458,27 @@ drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
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
+		return ERR_CAST(state);
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
@@ -535,30 +551,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
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
2.52.0

