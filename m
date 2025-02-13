Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96758A3433B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D89610EAF4;
	Thu, 13 Feb 2025 14:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GYnepvL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5C710EAF4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 54D25A4201C;
 Thu, 13 Feb 2025 14:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006BEC4CED1;
 Thu, 13 Feb 2025 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457933;
 bh=JrG+Qes6Uhu9pUPHN00ADosGqM1HiFLiaRHuI+fbxOg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GYnepvL+PQoMzH4kEcgxpqBusT4jAwpFWfu3l3VRLx9RnAGJFN16Oy711NmVfVOjX
 laMsvvJKqNUiy98nN5EDrE2OoTOqEgj72pIOS9jfy6mEa1G9vwVbOEXOlQwBAZycP1
 L+ZxUbpDHBTil5xxWy/7ULKtHHWIqMUG3t4fu34UNpJW0o6UKcbAjg2KbZyIz2KYSo
 iq8LwtbjJ3nh49mWbIahEtU8QQUaYJS29Q93G02fpX2S7MnIORQfXYncdwYM4SyfQA
 Kqp6mPZyNQRcTVKCkduTpuo9So1bPGJM2o31BTmzx3DxP4TwcY53FPZ+peZpQDxVgL
 hqR/wDPWxaLJQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:55 +0100
Subject: [PATCH v3 36/37] drm/bridge: tc358768: Convert to atomic helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-36-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4540; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JrG+Qes6Uhu9pUPHN00ADosGqM1HiFLiaRHuI+fbxOg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWNV4/nebSdy4kb1Of6bc3sY6tlVe+1sM3J1yJtxud
 XogZKbWMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACaS1cJY7ybXHizy/yxHiHrr
 Up2iT3WVdZ9bdplFFp27bvny7NSWnY5zwtYVC2T6Fhybf0vwnPsZxobZjnGRk1N5D36xc7Ou3Sw
 5b8ns5B1TX93f9Lsow/6n8f+YiQ6qu+Uydx7effD28bNvnvsBAA==
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
 drivers/gpu/drm/bridge/tc358768.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 6b65ba8aed86012bc0f464bd5ee44325dae677c6..7358f412439e4f6e9d45806181ab58ad5cb39a50 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -579,11 +579,12 @@ tc358768_bridge_mode_valid(struct drm_bridge *bridge,
 		return MODE_CLOCK_RANGE;
 
 	return MODE_OK;
 }
 
-static void tc358768_bridge_disable(struct drm_bridge *bridge)
+static void tc358768_bridge_atomic_disable(struct drm_bridge *bridge,
+					   struct drm_atomic_state *state)
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 	int ret;
 
 	/* set FrmStop */
@@ -601,11 +602,12 @@ static void tc358768_bridge_disable(struct drm_bridge *bridge)
 	ret = tc358768_clear_error(priv);
 	if (ret)
 		dev_warn(priv->dev, "Software disable failed: %d\n", ret);
 }
 
-static void tc358768_bridge_post_disable(struct drm_bridge *bridge)
+static void tc358768_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_atomic_state *state)
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 
 	tc358768_hw_disable(priv);
 }
@@ -681,17 +683,20 @@ static u32 tc358768_dsi_bytes_to_ns(struct tc358768_priv *priv, u32 val)
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
+	struct drm_crtc_state *crtc_state;
+	struct drm_bridge_state *bridge_state;
 	const struct drm_display_mode *mode;
 	u32 hsbyteclk_ps, dsiclk_ps, ui_ps;
 	u32 dsiclk, hsbyteclk;
 	int ret, i;
 	struct videomode vm;
@@ -718,11 +723,13 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		dev_err(dev, "Software reset failed: %d\n", ret);
 		tc358768_hw_disable(priv);
 		return;
 	}
 
-	mode = &bridge->encoder->crtc->state->adjusted_mode;
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	crtc_state = drm_atomic_get_new_crtc_state(state, bridge_state->crtc);
+	mode = &crtc_state->adjusted_mode;
 	ret = tc358768_setup_pll(priv, mode);
 	if (ret) {
 		dev_err(dev, "PLL setup failed: %d\n", ret);
 		tc358768_hw_disable(priv);
 		return;
@@ -1079,11 +1086,12 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	ret = tc358768_clear_error(priv);
 	if (ret)
 		dev_err(dev, "Bridge pre_enable failed: %d\n", ret);
 }
 
-static void tc358768_bridge_enable(struct drm_bridge *bridge)
+static void tc358768_bridge_atomic_enable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 	int ret;
 
 	if (!priv->enabled) {
@@ -1159,14 +1167,14 @@ static bool tc358768_mode_fixup(struct drm_bridge *bridge,
 
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

