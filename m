Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCEBA12D3F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB52D10E80C;
	Wed, 15 Jan 2025 21:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ViWP2XFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5684810E810
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F65D5C5E72;
 Wed, 15 Jan 2025 21:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075AEC4CED1;
 Wed, 15 Jan 2025 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975215;
 bh=IFyKqYW5kHErE1g3zqtG1lE+48aizUrsrSVZsplb+88=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ViWP2XFOSZIy71cyqnNaXxpksuVvC3WszqizJsdRSwArAyedVNvA/rg9WmtmoSYtm
 PfsmiWGZx3S1Y2KoTEt13xyJczZyuirxgUkSVI+akQ6SNboZkBxp1F+KDNUhm0t41d
 K7JLCMVOXvBXOwXs6PMxzk4/1JrQ7Z5TdREleSXOs/YVD9bDl6ylQe1hNLxQ6IN0wP
 yb3Fkl/k3BRTdjCpdr3JdVj1jjKnsLhngkCjqiV54Ctu4vIulpC+1G6JE7R4VrqI8s
 P2Gpoha96R3BQtKE80akwHILXs0tAwwT676mMNAlqvix6zNB64YIojakwwjMeEpE0x
 xqQ8Sn6DsxiiQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:34 +0100
Subject: [PATCH 27/29] drm/bridge: tc358775: Switch to atomic commit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-27-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3798; i=mripard@kernel.org;
 h=from:subject:message-id; bh=IFyKqYW5kHErE1g3zqtG1lE+48aizUrsrSVZsplb+88=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyoqvkxK+5Gi9s/tu+GTW1nOP34gyX7p1f/qVZLPiW
 Ym9HwI7OqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEckwZ62yTj19ONXNbNOHd
 1KmJi1O7t7xZfCLH9JLBz6yP7+dGPv7DE39z0s91PuYhF14cOP9M7wNjfc2KpAQz56AlYssOHeh
 fcPjaveu7jl44Uph9MfXoXKPIF7lz1DOn/1z868RJ8btO+tpL3wAA
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
retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
in the bridge state, so we can move to atomic callbacks and drop that
deprecated pointer usage.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 0b4efaca6d682320b76ce09ed41824ae7f84ca2d..8f8ed8dc033daf001fc188d919fb38918673bd72 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -285,11 +285,12 @@ struct tc_data {
 static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
 {
 	return container_of(b, struct tc_data, bridge);
 }
 
-static void tc_bridge_pre_enable(struct drm_bridge *bridge)
+static void tc_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	struct device *dev = &tc->dsi->dev;
 	int ret;
 
@@ -308,11 +309,12 @@ static void tc_bridge_pre_enable(struct drm_bridge *bridge)
 
 	gpiod_set_value(tc->reset_gpio, 0);
 	usleep_range(10, 20);
 }
 
-static void tc_bridge_post_disable(struct drm_bridge *bridge)
+static void tc_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	struct device *dev = &tc->dsi->dev;
 	int ret;
 
@@ -367,34 +369,22 @@ static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
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
+				    struct drm_bridge_state *bridge_state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2;
 	u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2;
 	u32 val = 0;
 	u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
 	struct drm_display_mode *mode;
-	struct drm_connector *connector = get_connector(bridge->encoder);
+	struct drm_connector *connector = bridge_state->connector;
 
-	mode = &bridge->encoder->crtc->state->adjusted_mode;
+	mode = &bridge_state->crtc->state->adjusted_mode;
 
 	hback_porch = mode->htotal - mode->hsync_end;
 	hsync_len  = mode->hsync_end - mode->hsync_start;
 	vback_porch = mode->vtotal - mode->vsync_end;
 	vsync_len  = mode->vsync_end - mode->vsync_start;
@@ -599,14 +589,14 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
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
 };
 
 static int tc_attach_host(struct tc_data *tc)
 {
 	struct device *dev = &tc->i2c->dev;

-- 
2.47.1

