Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A6AA2752F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9DE10E691;
	Tue,  4 Feb 2025 15:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W5IzrFDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0A810E691
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:01:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 934A45C6AB7;
 Tue,  4 Feb 2025 15:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E0CC4CEE4;
 Tue,  4 Feb 2025 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681272;
 bh=GCv/2JmRe5GDE3+8f4+/zLcZeqXTw0FcTdudDdF3K5o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=W5IzrFDqrPQ3HmfsKpwLnE83bBI337BY9apuLRd/tjn87W8vXHvy0qdziRV7584L1
 7w8SDr4dopvCxlBH2cCWv6KFSu8X4sLByBNzumUvKb5Op5SM2zdeQlCBVraxiRaQGG
 7KMFa/aRQvGEty3O0e32p35PZdTR2tkwNci64H4tRizX6NbFxxz7C1C/7mV181wTDL
 bjIqpi8vyfF/JLWRnXABYqmleQCtqCcl8gN+51m0SVrOYXGa2G38dTrf/9whdImvnr
 0Q6CSkFK129uPQ/26eyInjsOG1Skc+/ikiSRJ4B8FJ70lq5Oe886nJHuP2cp+dQmI0
 OU+JZLKeTF2Ow==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:58:02 +0100
Subject: [PATCH v2 34/35] drm/bridge: tc358768: Convert to atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-34-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373; i=mripard@kernel.org;
 h=from:subject:message-id; bh=GCv/2JmRe5GDE3+8f4+/zLcZeqXTw0FcTdudDdF3K5o=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtH7Y+T/T25hc2rRmqljj3YqToXprP0w3+NBW4jnrZ
 J9Ywu3MjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRTCfG+sKNSzfYJFlFrbPw
 +O+z+dq2uSX/nq4095xou2/NQ97Tb6QF3znz/RFuehNR5nPTxr9+AWPDrG1m8+x7DQL1LA9rbZ8
 6X8rCcpLmVKtfxYeOJMuvcug7ViSmyNv++s3WqmTt/Q7b89kB
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

The tc358768 driver follows the drm_encoder->crtc pointer that is
deprecated and shouldn't be used by atomic drivers.

This was due to the fact that we did't have any other alternative to
retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
in the bridge state, so we can move to atomic callbacks and drop that
deprecated pointer usage.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/tc358768.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 6db18d1e8824dd7d387211d6d1e668645cf88bbe..6ff6b29e8075d7c6fa0b74b4fec83c5230512d96 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -601,17 +601,29 @@ static void tc358768_bridge_disable(struct drm_bridge *bridge)
 	ret = tc358768_clear_error(priv);
 	if (ret)
 		dev_warn(priv->dev, "Software disable failed: %d\n", ret);
 }
 
+static void tc358768_bridge_atomic_disable(struct drm_bridge *bridge,
+					   struct drm_atomic_state *state)
+{
+	tc358768_bridge_disable(bridge);
+}
+
 static void tc358768_bridge_post_disable(struct drm_bridge *bridge)
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 
 	tc358768_hw_disable(priv);
 }
 
+static void tc358768_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_atomic_state *state)
+{
+	tc358768_bridge_post_disable(bridge);
+}
+
 static int tc358768_setup_pll(struct tc358768_priv *priv,
 			      const struct drm_display_mode *mode)
 {
 	u32 fbd, prd, frs;
 	int ret;
@@ -681,17 +693,19 @@ static u32 tc358768_dsi_bytes_to_ns(struct tc358768_priv *priv, u32 val)
 	u64 n = priv->dsiclk / 4 * priv->dsi_lanes;
 
 	return (u32)div_u64(m, n);
 }
 
-static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
+static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_atomic_state *state)
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 	struct mipi_dsi_device *dsi_dev = priv->output.dev;
 	unsigned long mode_flags = dsi_dev->mode_flags;
 	u32 val, val2, lptxcnt, hact, data_type;
 	s32 raw_val;
+	struct drm_bridge_state *bridge_state;
 	const struct drm_display_mode *mode;
 	u32 hsbyteclk_ps, dsiclk_ps, ui_ps;
 	u32 dsiclk, hsbyteclk;
 	int ret, i;
 	struct videomode vm;
@@ -718,11 +732,12 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		dev_err(dev, "Software reset failed: %d\n", ret);
 		tc358768_hw_disable(priv);
 		return;
 	}
 
-	mode = &bridge->encoder->crtc->state->adjusted_mode;
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	mode = &bridge_state->crtc->state->adjusted_mode;
 	ret = tc358768_setup_pll(priv, mode);
 	if (ret) {
 		dev_err(dev, "PLL setup failed: %d\n", ret);
 		tc358768_hw_disable(priv);
 		return;
@@ -1082,11 +1097,12 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		tc358768_bridge_disable(bridge);
 		tc358768_bridge_post_disable(bridge);
 	}
 }
 
-static void tc358768_bridge_enable(struct drm_bridge *bridge)
+static void tc358768_bridge_atomic_enable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 	int ret;
 
 	if (!priv->enabled) {
@@ -1165,14 +1181,14 @@ static bool tc358768_mode_fixup(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs tc358768_bridge_funcs = {
 	.attach = tc358768_bridge_attach,
 	.mode_valid = tc358768_bridge_mode_valid,
 	.mode_fixup = tc358768_mode_fixup,
-	.pre_enable = tc358768_bridge_pre_enable,
-	.enable = tc358768_bridge_enable,
-	.disable = tc358768_bridge_disable,
-	.post_disable = tc358768_bridge_post_disable,
+	.atomic_pre_enable = tc358768_bridge_atomic_pre_enable,
+	.atomic_enable = tc358768_bridge_atomic_enable,
+	.atomic_disable = tc358768_bridge_atomic_disable,
+	.atomic_post_disable = tc358768_bridge_atomic_post_disable,
 
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_get_input_bus_fmts = tc358768_atomic_get_input_bus_fmts,

-- 
2.48.0

