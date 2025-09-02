Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAFCB3F89B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4A710E5FC;
	Tue,  2 Sep 2025 08:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b5PU6oYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E494010E5FE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:34:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CB89044362;
 Tue,  2 Sep 2025 08:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6186DC4CEF5;
 Tue,  2 Sep 2025 08:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802066;
 bh=nreBoH6ThRerXR2wNJa5hb8U1Wgw8f5LJn4gcdb2KpY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=b5PU6oYphv9O+QNCyshbf1R2+dTpKQkl8jJqMnC38IA+GupA1IZGeAP6v6ydv1VuS
 i1iK8w+x/GFYmWQzQlmJ3eRzCIqyK6iua9GZARjfIzmqXW7m5hHNW2CHKfvHgwQ2uo
 r5/qxjFZ8oY+XFTxmQnxYBjyMa9FwAmzDXO26WJXDn+VCOw9A2NWlT5oKdz16RSs8j
 mneyfwSydEia0VoIV+1KDLq7Defdk3xBtKU6hcf40oqlIVrqOSrBcWZJHRJYIY7+2C
 vyMyIRPn6AVJwsm6XBtEHOO/sfAka4TWKXKakm6uTv9pbQwMZDjXvo7MhoX+6alcpG
 /0cGUygBbNo+A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:57 +0200
Subject: [PATCH 29/29] drm/bridge: sii902x: Implement hw state readout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-29-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3469; i=mripard@kernel.org;
 h=from:subject:message-id; bh=nreBoH6ThRerXR2wNJa5hb8U1Wgw8f5LJn4gcdb2KpY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVh/U9Zm/efutmxbKefuehdkHG+67+WPnq8gv176u6
 vd/Jyor2zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmovCLsaHv0nqvrh1bpsUv
 qfryTEkj5ESnoil/xqKlTDtl7y45ZffZYV6BcG1o9awAVznDDieHHMaGxtBjSjxGyefzmS6tPj5
 RRmyL+aQw0c1PuNdEv5pipXJaeamOaMb5hmyWnB8PbGt2eD8FAA==
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

Let's implement the hardware state readout for the sii902x bridge now
that we have all the infrastructure in place.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/sii902x.c | 51 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index d537b1d036fb09ce55a690a0809dcc28fc0f41be..5ffceb9131540d2cb1b82a74b4f7cec9bc7fd8ca 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -540,17 +540,66 @@ sii902x_bridge_mode_valid(struct drm_bridge *bridge,
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
 }
 
+static int sii902x_bridge_connector_hw_readout(struct drm_bridge *bridge,
+					       struct drm_atomic_state *state,
+					       struct drm_connector_state *conn_state)
+{
+	struct sii902x *sii902x = bridge_to_sii902x(bridge);
+	struct drm_connector *connector = conn_state->connector;
+	struct drm_crtc_state *crtc_state;
+	struct drm_encoder *encoder;
+	struct drm_crtc *crtc;
+
+	if (regmap_test_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA, SII902X_SYS_CTRL_PWR_DWN))
+		return 0;
+
+	encoder = bridge->encoder;
+	crtc = encoder->funcs->get_current_crtc(encoder);
+	if (!crtc)
+		return -ENODEV;
+
+	crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	if (!crtc_state)
+		return -ENODEV;
+
+	crtc_state->encoder_mask |= drm_encoder_mask(encoder);
+	crtc_state->connector_mask |= drm_connector_mask(connector);
+
+	conn_state->crtc = crtc;
+	conn_state->best_encoder = encoder;
+
+	return 0;
+}
+
+static int sii902x_bridge_readout_state(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct sii902x *sii902x = bridge_to_sii902x(bridge);
+
+	if (regmap_test_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA, SII902X_SYS_CTRL_PWR_DWN))
+		return 0;
+
+	/* bridge_state is pretty trivial, we don't have anything to do here */
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.attach = sii902x_bridge_attach,
 	.mode_set = sii902x_bridge_mode_set,
 	.atomic_disable = sii902x_bridge_atomic_disable,
 	.atomic_enable = sii902x_bridge_atomic_enable,
+	.connector_hw_readout = sii902x_bridge_connector_hw_readout,
 	.detect = sii902x_bridge_detect,
 	.edid_read = sii902x_bridge_edid_read,
+	.atomic_compare_state = drm_atomic_helper_bridge_compare_state,
+	.atomic_readout_state = sii902x_bridge_readout_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_input_bus_fmts = sii902x_bridge_atomic_get_input_bus_fmts,
 	.atomic_check = sii902x_bridge_atomic_check,
@@ -1136,11 +1185,11 @@ static int sii902x_init(struct sii902x *sii902x)
 	if (ret)
 		goto err_unreg_audio;
 
 	sii902x->bridge.of_node = dev->of_node;
 	sii902x->bridge.timings = &default_sii902x_timings;
-	sii902x->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	sii902x->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_CONNECTOR_HW_READOUT;
 	sii902x->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
 	if (sii902x->i2c->irq > 0)
 		sii902x->bridge.ops |= DRM_BRIDGE_OP_HPD;
 

-- 
2.50.1

