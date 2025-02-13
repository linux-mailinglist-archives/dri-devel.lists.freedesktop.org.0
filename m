Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64177A34336
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95DA10EAF9;
	Thu, 13 Feb 2025 14:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F2Br8AR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1214910EAF2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA3D6A42016;
 Thu, 13 Feb 2025 14:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9976DC4CEE4;
 Thu, 13 Feb 2025 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457927;
 bh=yIwvG87ThxOh9khY9GFKY72FMB/xyv2RheSYDDPgfBw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=F2Br8AR1VbRQSoFiav8nwUFKWf1wCnHBz1pXsSUSv7RBWBnCqsAi5XhFH9/Vw9TxN
 wY/qu/rUrmtxtFYiCiVHfxZrt1dFnu1vFYXEH8if7GQuA+hGhvLhrlQF5WpNwe9d3a
 up/WRK+wDTlILlGM/H04pAXpPITUx6YdCbvahfajEOCkxWxRzKQppmA2RH0cXvALXe
 UHo/lZ7oYDzAd+uK1VkJiYcfbrQb6VQdm9/dJM2kg6r+Dfuw39v6IzXC33oLR9FE0F
 ul+hbY7kc1DEyPhE/eWha5G12G2D6mlcqeFnq4F4OEhwOB+AU8IYHPky6oRUlhrxw0
 E1g02Po0Xs/pQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:53 +0100
Subject: [PATCH v3 34/37] drm/bridge: tc358775: Switch to atomic commit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-34-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4179; i=mripard@kernel.org;
 h=from:subject:message-id; bh=yIwvG87ThxOh9khY9GFKY72FMB/xyv2RheSYDDPgfBw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWFXbXJ6sv7i2bO5x27mRmfP1eqZkMFg1MXt1MiReC
 gqcNrmyYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwkZz5jffmD5bI7XNnC5A74
 z84RfJa8fCrXPeE7nw1zFucIzE2QOnlH1e3JOpVHCin5QiuYzS6IM9bwXbRsMnikcems65ubfJf
 ldgRs4F81I2b93luvXM2WMW3xYFwTJVhytLuSbW2M6JtfOx8CAA==
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

The tc358775 driver follows the drm_encoder->crtc pointer that is
deprecated and shouldn't be used by atomic drivers.

This was due to the fact that we did't have any other alternative to
retrieve the CRTC pointer. Fortunately, the CRTC pointer is now provided
in the bridge state, so we can move to atomic callbacks and drop that
deprecated pointer usage.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 41 +++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 13cd48e77d2d3f8dd646078fb7de95c420f29f73..3288960ddc86b9650939e821f235ffb0ef1e5288 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -284,11 +284,12 @@ struct tc_data {
 static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
 {
 	return container_of(b, struct tc_data, bridge);
 }
 
-static void tc_bridge_pre_enable(struct drm_bridge *bridge)
+static void tc_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	struct device *dev = &tc->dsi->dev;
 	int ret;
 
@@ -307,11 +308,12 @@ static void tc_bridge_pre_enable(struct drm_bridge *bridge)
 
 	gpiod_set_value(tc->reset_gpio, 0);
 	usleep_range(10, 20);
 }
 
-static void tc_bridge_post_disable(struct drm_bridge *bridge)
+static void tc_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	struct device *dev = &tc->dsi->dev;
 	int ret;
 
@@ -366,34 +368,24 @@ static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
 	if (ret < 0)
 		dev_err(&i2c->dev, "Error %d writing to subaddress 0x%x\n",
 			ret, addr);
 }
 
-/* helper function to access bus_formats */
-static struct drm_connector *get_connector(struct drm_encoder *encoder)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_connector *connector;
-
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
-		if (connector->encoder == encoder)
-			return connector;
-
-	return NULL;
-}
-
-static void tc_bridge_enable(struct drm_bridge *bridge)
+static void tc_bridge_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2;
 	u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2;
 	u32 val = 0;
 	u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
-	struct drm_display_mode *mode;
-	struct drm_connector *connector = get_connector(bridge->encoder);
-
-	mode = &bridge->encoder->crtc->state->adjusted_mode;
+	struct drm_bridge_state *bridge_state =
+		drm_atomic_get_new_bridge_state(state, bridge);
+	struct drm_connector *connector = bridge_state->connector;
+	struct drm_crtc_state *crtc_state =
+		drm_atomic_get_new_crtc_state(state, bridge_state->crtc);
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 
 	hback_porch = mode->htotal - mode->hsync_end;
 	hsync_len  = mode->hsync_end - mode->hsync_start;
 	vback_porch = mode->vtotal - mode->vsync_end;
 	vsync_len  = mode->vsync_end - mode->vsync_start;
@@ -599,14 +591,17 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 				 &tc->bridge, flags);
 }
 
 static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.attach = tc_bridge_attach,
-	.pre_enable = tc_bridge_pre_enable,
-	.enable = tc_bridge_enable,
+	.atomic_pre_enable = tc_bridge_atomic_pre_enable,
+	.atomic_enable = tc_bridge_atomic_enable,
 	.mode_valid = tc_mode_valid,
-	.post_disable = tc_bridge_post_disable,
+	.atomic_post_disable = tc_bridge_atomic_post_disable,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 };
 
 static int tc_attach_host(struct tc_data *tc)
 {
 	struct device *dev = &tc->i2c->dev;

-- 
2.48.0

