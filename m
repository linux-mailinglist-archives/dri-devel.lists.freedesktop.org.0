Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E737BBF6BED
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5B510E5F5;
	Tue, 21 Oct 2025 13:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jlMiv3AK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97D210E5FA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:23:36 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA85C1387;
 Tue, 21 Oct 2025 15:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761052912;
 bh=xl8LY50t1nFK7zo4QzL7OcSdYgLXevi6DdqZ8vAxkZc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jlMiv3AKx9bOhdxMU2qjoo4hNQrVsbTBgEwwnMy7ZwXpJ+ihjVWlXDug90uCo3T+7
 WdAiou0SevEWkyJuKRFO3edfodSjKFpzwWm5g9l+MXpCQZAizOHnxLuFHIo8dNYoQb
 WG4GzfVxk8Quq8Cs/mFMwXGKEpb4IlLDOEuSa3FM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 21 Oct 2025 16:23:02 +0300
Subject: [PATCH 6/7] drm/bridge: tc358768: Separate video format config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tc358768-v1-6-d590dc6a1a0c@ideasonboard.com>
References: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
In-Reply-To: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4393;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=xl8LY50t1nFK7zo4QzL7OcSdYgLXevi6DdqZ8vAxkZc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo94lQtX58PnZsZyqBj8eP8d4yuGewfVKxFzG1X
 wi8ZD0+mIWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaPeJUAAKCRD6PaqMvJYe
 9YrYD/4qklqPfSrDnIP20YzrHXaO2FCZlFjV6WzMPDi69e9xb8/6kVhVx7lvASWfPnzSCRDVwpn
 SsbK4p2hOaq46mH/zkByg+LdRj2wbkxcef2jM+kI/iiDgM5yckpm0/MBFC+A2SsbVapSBjlPwG3
 WHnNutdTUWRb7QvUvtI+kzM/yDWCHhzPUyiXKp7RhB8J9q6hytOTq3AWG6BvOdWZ7tH9/NLYpKY
 h1o3mpABMlG7dRut8nEalIPhpvoqBH/jTCHaaSH/NBEGaty0qChhzquLcJ69zzB0kr2u5LYZ6xt
 MjZ+EUUGKmVoHZXU9O8JmySr9UpBdcEPT7JWxc0U3DdI6F4xGN7dQRYrvUaSRPLbwKgebtPnLhE
 PedJDZhJ2n60SBhN8EU4PYTH4UiRPHoQh2j3lap74INrEv1m4KQVBbseZ4HIRH/HI6hVKqNToa7
 TLOuN/0CgZ6W5+mR7juDbZrF6MMs9MvfkHlrmlv6x8Rn8dFpi5Ehyl1DllkllSQCNR9mpNqI/Dj
 xk0zfWa8jgoCWNdUxGjsuqITsh1KEVpqXH+HLVAaSjmRdHZ/npaI4dlHLXRaWP0mSQrlAcy1+FF
 RQkVkf9fNNk/rAvflcnG0txyHSB6JsNSvPzCBmMGKNRnVectaXU/cbN3R5JGZyDSLJmrZjNDbfG
 /zGVugup6J4IJ7w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Sending long commands using the video buffer (to be implemented in
following patches) requires setting TC358768_DATAFMT and
TC358768_DSITX_DT registers for command transfer. The same registers
also need to be configured properly for video transfer.

The long commands will be sent between the bridge's pre_enable() and
enable(), and currently we configure the registers for video transfer in
pre_enable(). Thus, they would be overwritten by the long command
transfer code.

To prevent that from happening, set those registers for video transfer
in enable(), not in pre_enable().

Based on code from Parth Pancholi <parth.pancholi@toradex.com>

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 51 ++++++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index a7a14c125ac4..e1ed4003b3c5 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -722,7 +722,7 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 	struct mipi_dsi_device *dsi_dev = priv->output.dev;
-	u32 val, mask, val2, lptxcnt, hact, data_type;
+	u32 val, mask, val2, lptxcnt, hact;
 	s32 raw_val;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector_state *conn_state;
@@ -768,30 +768,20 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	dsiclk = priv->dsiclk;
 	hsbyteclk = dsiclk / 4;
 
-	/* Data Format Control Register */
-	val = BIT(2) | BIT(1) | BIT(0); /* rdswap_en | dsitx_en | txdt_en */
 	switch (dsi_dev->format) {
 	case MIPI_DSI_FMT_RGB888:
-		val |= (0x3 << 4);
 		hact = vm.hactive * 3;
-		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_24;
 		break;
 	case MIPI_DSI_FMT_RGB666:
-		val |= (0x4 << 4);
 		hact = vm.hactive * 3;
-		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_18;
 		break;
 
 	case MIPI_DSI_FMT_RGB666_PACKED:
-		val |= (0x4 << 4) | BIT(3);
 		hact = vm.hactive * 18 / 8;
-		data_type = MIPI_DSI_PIXEL_STREAM_3BYTE_18;
 		break;
 
 	case MIPI_DSI_FMT_RGB565:
-		val |= (0x5 << 4);
 		hact = vm.hactive * 2;
-		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
 		break;
 	default:
 		dev_err(dev, "Invalid data format (%u)\n",
@@ -947,9 +937,6 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* VSDly[9:0] */
 	tc358768_write(priv, TC358768_VSDLY, dsi_vsdly - internal_dly);
 
-	tc358768_write(priv, TC358768_DATAFMT, val);
-	tc358768_write(priv, TC358768_DSITX_DT, data_type);
-
 	/* Enable D-PHY (HiZ->LP11) */
 	tc358768_write(priv, TC358768_CLW_CNTRL, 0x0000);
 	/* Enable lanes */
@@ -1113,6 +1100,39 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		dev_err(dev, "Bridge pre_enable failed: %d\n", ret);
 }
 
+static void tc358768_config_video_format(struct tc358768_priv *priv)
+{
+	struct mipi_dsi_device *dsi_dev = priv->output.dev;
+	u32 val, data_type;
+
+	/* Data Format Control Register */
+	val = BIT(2) | BIT(1) | BIT(0); /* rdswap_en | dsitx_en | txdt_en */
+	switch (dsi_dev->format) {
+	case MIPI_DSI_FMT_RGB888:
+		val |= (0x3 << 4);
+		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_24;
+		break;
+	case MIPI_DSI_FMT_RGB666:
+		val |= (0x4 << 4);
+		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_18;
+		break;
+	case MIPI_DSI_FMT_RGB666_PACKED:
+		val |= (0x4 << 4) | BIT(3);
+		data_type = MIPI_DSI_PIXEL_STREAM_3BYTE_18;
+		break;
+	case MIPI_DSI_FMT_RGB565:
+		val |= (0x5 << 4);
+		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
+		break;
+	default:
+		dev_err(priv->dev, "Invalid data format (%u)\n", dsi_dev->format);
+		return;
+	}
+
+	tc358768_write(priv, TC358768_DATAFMT, val);
+	tc358768_write(priv, TC358768_DSITX_DT, data_type);
+}
+
 static void tc358768_bridge_atomic_enable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *state)
 {
@@ -1124,6 +1144,9 @@ static void tc358768_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
+	/* Configure video format registers */
+	tc358768_config_video_format(priv);
+
 	/* Enable HS mode for video TX */
 	tc358768_confw_update_bits(priv, TC358768_DSI_CONTROL,
 				   TC358768_DSI_CONTROL_TXMD,

-- 
2.43.0

