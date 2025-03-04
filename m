Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1528CA4DC0B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8074810E597;
	Tue,  4 Mar 2025 11:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lfQ7EgwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3591E10E597
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:11:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CFE3D5C58A0;
 Tue,  4 Mar 2025 11:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043BDC4CEE5;
 Tue,  4 Mar 2025 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741086698;
 bh=xslq81ieLAR0jhY4WYdedCthgDAt8uUrAzOcxRWwIkg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lfQ7EgwMErpiyCCIQtBqZJOSAVkCtyZG0loG1v21Q/mLBe1YtyeyvvWNF9XyoU9gL
 DziHSEsUAV7Y6uSTnmV49WxXRCnTBs0iew5vszQPdaj1YDdigC0yYZDl4HE3Go5Aen
 rxn0DwGGnAZwxbHO0P7AKmg7haHc/+Z4lOKWzNLQX0BKVJtqoGU0qZCBw0MQT51Dne
 3G3w9ncz+Z0QHcAeRQRiLYM7Jjjf2vXYbhi3NYWsrpeDtTOa2c0/2CSBYp4owWiPCC
 ZmvsAiRubSg1mggwLG9HfAfflMxYFzE5Ks0FP376lzWtsP5VUOw3be4wuBlYu2nqsM
 Q3vupHGDSnp7g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Mar 2025 12:10:56 +0100
Subject: [PATCH v5 13/16] drm/bridge: tc358775: Switch to atomic commit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bridge-connector-v5-13-aacf461d2157@kernel.org>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
In-Reply-To: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4332; i=mripard@kernel.org;
 h=from:subject:message-id; bh=xslq81ieLAR0jhY4WYdedCthgDAt8uUrAzOcxRWwIkg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnH7h/6Z3t0xZx4qZmea9tuN3xpOcIjeaXtaEcB3wq+R
 0Jha0JfdkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJcEQyNryQW11/viXjG+cZ
 //17Em6KXfVY35P8rVA/K2f9hHmGR7T2GpRqV2xs2zZN5Gl2y8SXjxnrY/y//5ph3XYlevnatAv
 bfzs95o2fvz1ltwIf/2LRzmlnGb4lvfUJr+0qmLJYeN2VhZqSAA==
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

Fortunately, the atomic hooks provide the drm_atomic_state and we can
access our current CRTC from that, going from the bridge to its encoder,
to its connector, and to its CRTC.

Let's convert this bridge driver to atomic so we can get rid of the
drm_encoder->crtc dereference.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 42 ++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 13cd48e77d2d3f8dd646078fb7de95c420f29f73..1b10e6ee1724ffb4bb8946f86d2f18e53428381a 100644
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
 
@@ -366,34 +368,25 @@ static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
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
+	struct drm_connector *connector =
+		drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc_state *crtc_state =
+		drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 
 	hback_porch = mode->htotal - mode->hsync_end;
 	hsync_len  = mode->hsync_end - mode->hsync_start;
 	vback_porch = mode->vtotal - mode->vsync_end;
 	vsync_len  = mode->vsync_end - mode->vsync_start;
@@ -599,14 +592,17 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
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
2.48.1

