Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83789BF6BE1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02B310E5FF;
	Tue, 21 Oct 2025 13:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A0/p/8sK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E901010E5F4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:23:33 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C63291121;
 Tue, 21 Oct 2025 15:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761052909;
 bh=TJPT0LieahSnk5Eq/06H6MhVA9q7usSPmShU4un2ep4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=A0/p/8sKgbZUg5jUJ+C+sWzSuXcdcATBrEBzwqjgcBJhWWlHTMyvp4Xl/c0RgN14L
 5UPNfKWXsig2XETlcc2VBHO/7pPUJCtBfH7EYJkQjNlx3rk/YT3Xs2HvhvPO/nv3DE
 pq5j4g8OnqKjppzvwJBN68w76JqsSBRwYWYiUbqE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 21 Oct 2025 16:22:59 +0300
Subject: [PATCH 3/7] drm/bridge: tc358768: Separate indirect register
 writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tc358768-v1-3-d590dc6a1a0c@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3907;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=TJPT0LieahSnk5Eq/06H6MhVA9q7usSPmShU4un2ep4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo94lPvq9UztZYZACDQgcbYBbcPmZgU8xYx76I/
 tKA8emJmTiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaPeJTwAKCRD6PaqMvJYe
 9SBcEACCV9kOijU18AuwGCpU+a+qwqHUmOv8b9lcwqyVYDJ8ORfBGbyrTbGYxqX+G6rnndX6MH6
 9my+aNEOep/KlTJoqkAog9KkvrwpuLXRiDW7INkFMMa7ZsrgNJf67EQ722a5HF2cEJAFkmUSxBW
 j1LUa/33AnhdXlV1v+Voeyo/CVmiRHuvMT5zQpteEf3IB7zmQ78wc8AQ+Q6MmcgUhIC55GqcQrs
 ZmKT3CnRIM7KGqFumI0oUazPEMkkIHqWuakfqeZsbI3kOG3WCDlAG/wOt7vN9RTJpF/0BQj5oBc
 ohR7XBC4NVKfmIEJqQ3ceEjAklz2ty2IwUH7GLGJS3V8mXrpxnijPkscZxrisoLRmmj6t3Brv5k
 07PI9vWICa3QK409d8fd+is0fobRePBtlfJmopLa+unp+eW9cMFLKOnS7m+cHCj5gVov60dmk3Y
 5+7XDDihtdgoDG04AOVaLkr63/MnAs+tfBhOeJzSw4sabJpCX9uOnBxLHB1GVScVI30F7qWILfH
 whLpTYxx1ejmUrStJqDHB1eua7aiKxe8y2WB9e4oCWvJ0HlTy0/cCTisK4bEGwmzZ+QTvzoLn4g
 4Fw3oIu2Dg6za45SDExlMuiFyOzk/gLJyhObNZD2ku8SkaRUoknQRUnOHVq/2NAy4F6fuOhM347
 JnqsII2IAP2nd8A==
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

Some registers can only be written indirectly, using DSI_CONFW register.
We don't have many uses for those registers (in fact, only DSI_CONTROL
is currently written), but the code to do those writes inline is a bit
confusing.

Add a new function, tc358768_confw_update_bits() which can be used to
write the bits indirectly. Only DSI_CONTROL is currently supported.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 52 +++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index dab9cdf5cb98..755ed6483b2e 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -123,7 +123,7 @@
 /* TC358768_DSI_CONFW (0x0500) register */
 #define TC358768_DSI_CONFW_MODE_SET	(5 << 29)
 #define TC358768_DSI_CONFW_MODE_CLR	(6 << 29)
-#define TC358768_DSI_CONFW_ADDR_DSI_CONTROL	(0x3 << 24)
+#define TC358768_DSI_CONFW_ADDR(x)	((x) << 24)
 
 /* TC358768_DSICMD_TX (0x0600) register */
 #define TC358768_DSI_CMDTX_DC_START	BIT(0)
@@ -232,6 +232,36 @@ static void tc358768_update_bits(struct tc358768_priv *priv, u32 reg, u32 mask,
 		tc358768_write(priv, reg, tmp);
 }
 
+static void tc358768_confw_update_bits(struct tc358768_priv *priv, u16 reg,
+				       u16 mask, u16 val)
+{
+	u8 confw_addr;
+	u32 confw_val;
+
+	switch (reg) {
+	case TC358768_DSI_CONTROL:
+		confw_addr = 0x3;
+		break;
+	default:
+		priv->error = -EINVAL;
+		return;
+	}
+
+	if (mask != val) {
+		confw_val = TC358768_DSI_CONFW_MODE_CLR |
+			TC358768_DSI_CONFW_ADDR(confw_addr) |
+			mask;
+		tc358768_write(priv, TC358768_DSI_CONFW, confw_val);
+	}
+
+	if (val & mask) {
+		confw_val = TC358768_DSI_CONFW_MODE_SET |
+			TC358768_DSI_CONFW_ADDR(confw_addr) |
+			(val & mask);
+		tc358768_write(priv, TC358768_DSI_CONFW, confw_val);
+	}
+}
+
 static void tc358768_dsicmd_tx(struct tc358768_priv *priv)
 {
 	u32 val;
@@ -693,7 +723,7 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 	struct mipi_dsi_device *dsi_dev = priv->output.dev;
 	unsigned long mode_flags = dsi_dev->mode_flags;
-	u32 val, val2, lptxcnt, hact, data_type;
+	u32 val, mask, val2, lptxcnt, hact, data_type;
 	s32 raw_val;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector_state *conn_state;
@@ -1065,13 +1095,7 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	tc358768_write(priv, TC358768_DSI_START, 0x1);
 
 	/* Configure DSI_Control register */
-	val = TC358768_DSI_CONFW_MODE_CLR | TC358768_DSI_CONFW_ADDR_DSI_CONTROL;
-	val |= TC358768_DSI_CONTROL_TXMD | TC358768_DSI_CONTROL_HSCKMD |
-	       0x3 << 1 | TC358768_DSI_CONTROL_EOTDIS;
-	tc358768_write(priv, TC358768_DSI_CONFW, val);
-
-	val = TC358768_DSI_CONFW_MODE_SET | TC358768_DSI_CONFW_ADDR_DSI_CONTROL;
-	val |= (dsi_dev->lanes - 1) << 1;
+	val = (dsi_dev->lanes - 1) << 1;
 
 	val |= TC358768_DSI_CONTROL_TXMD;
 
@@ -1081,11 +1105,13 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		val |= TC358768_DSI_CONTROL_EOTDIS;
 
-	tc358768_write(priv, TC358768_DSI_CONFW, val);
+	mask = TC358768_DSI_CONTROL_TXMD | TC358768_DSI_CONTROL_HSCKMD |
+	       0x3 << 1 | TC358768_DSI_CONTROL_EOTDIS;
+
+	tc358768_confw_update_bits(priv, TC358768_DSI_CONTROL, mask, val);
 
-	val = TC358768_DSI_CONFW_MODE_CLR | TC358768_DSI_CONFW_ADDR_DSI_CONTROL;
-	val |= TC358768_DSI_CONTROL_DSI_MODE;
-	tc358768_write(priv, TC358768_DSI_CONFW, val);
+	tc358768_confw_update_bits(priv, TC358768_DSI_CONTROL,
+				   TC358768_DSI_CONTROL_DSI_MODE, 0);
 
 	ret = tc358768_clear_error(priv);
 	if (ret)

-- 
2.43.0

