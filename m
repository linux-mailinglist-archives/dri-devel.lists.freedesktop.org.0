Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D130A34332
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D6A10EAEC;
	Thu, 13 Feb 2025 14:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xgp+R+O/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142A810EAEC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F1F30A41D5E;
 Thu, 13 Feb 2025 14:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C730C4CED1;
 Thu, 13 Feb 2025 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457920;
 bh=Ruzd7GaGYJAPLi37bBN3Pff7BVs07Ll4eqdWqarhwco=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Xgp+R+O/z93DPt+x7Qefi98Vy07rr01er3TsIWIOyie1vBEkWJBgZc7KtqFcXuw+e
 /zmMe8id6kiX/eDpIP4Cn9V5V5H1WFDuAKb2nPJAypb+dXUCAnKyIBHFJ+osgaTa//
 zYlqvTBQXQySTFqfmjkJDqrreOKP3pr7VCVFo3ZPUkwjk/60lYyW5jaAxfwVXwRduF
 BAGyQ7tis1ULCBCIqhF792H+IpHtFafPf2mXvXUf6jqyrcc5+fVtkjt8gDtUqADR5A
 DTakyBKGBFXT/mo8EwXx16Z2f+M1/JIoLHYYEnBPuy+PNFUD9kjPQBVfNHBFbNaA1W
 00F6r80yuJc7w==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:50 +0100
Subject: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector and
 crtc in bridge state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3321; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Ruzd7GaGYJAPLi37bBN3Pff7BVs07Ll4eqdWqarhwco=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWFWMk2vEvvQ27ucR7P5urHQteMXKAw9n+x0yXOD8a
 8+aTRv3dUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJXN7L2NCZ/mhaymalk/te
 ZztNutXC+3Wav2nQiennN9wrvqTLlGmh9zh5kWnZJSeHsI5k5ctbBBjrE0ukTr1cxLNbdefKjtW
 lCgFHVqhw3zq8fLGP6Sm1vZnrMpPV1Y6H2K6IPH3muuC3yu/yAA==
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
 drivers/gpu/drm/drm_bridge.c              |  5 +++++
 include/drm/drm_atomic.h                  | 14 ++++++++++++++
 3 files changed, 24 insertions(+)

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
index b6d24092674c8fa33d9b6ebab9ece0f91fb8f8ea..db2e9834939217d65720ab7a2f82a9ca3db796b0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -812,10 +812,15 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
 							       bridge);
 		if (WARN_ON(!bridge_state))
 			return -EINVAL;
 
+		bridge_state->crtc = crtc_state->crtc;
+
+		drm_connector_get(conn_state->connector);
+		bridge_state->connector = conn_state->connector;
+
 		if (bridge->funcs->atomic_check) {
 			ret = bridge->funcs->atomic_check(bridge, bridge_state,
 							  crtc_state, conn_state);
 			if (ret)
 				return ret;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 4c673f0698fef6b60f77db980378d5e88e0e250e..293e2538a428bc14013d7fabea57a6b858ed7b47 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1216,10 +1216,24 @@ struct drm_bridge_state {
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
2.48.0

