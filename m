Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FFF98753A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 16:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0292D10EB63;
	Thu, 26 Sep 2024 14:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="JtbDKFIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F43910EB63
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 14:12:56 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id D737A1FA5E;
 Thu, 26 Sep 2024 16:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1727359974;
 bh=WppZHrQT1Rzii/cRjg1/sys9dUOQvw27vjIghFpwOKo=; h=From:To:Subject;
 b=JtbDKFIQ7A+dY2lmKEEZ+uVqqrJ6iY2eL7pXVIWk0kGf9TFuk1wPYbaxvleZLvjPo
 n8fYAj+o0nNu1sVyNStPHZ1XkVev1N7eqk6TwLmE9fRfyFVwFVhFBs16NtBhtkYDL6
 /sT6U1ZYdjjlP51d2c0XOKGneqsqYjD/I9VbdP0VoVNPnMXB9OkgYFXIg19/oz59vH
 bjE+hhey4jihlgM+7NRWvJ9P6WfDR8D7L5tAACr+g2OKLD20DQ9J5jrA3NZZcn60kR
 rFCTFqnAs+4EVp6i8iCDoEAmmCDCmNeeXo+ArwqraW1F4OJrNv+6bIysL4xWoPvzIM
 LMRmytBMkWBlA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH v1] drm/bridge: tc358768: Fix DSI command tx
Date: Thu, 26 Sep 2024 16:12:46 +0200
Message-Id: <20240926141246.48282-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Wait for the command transmission to be completed in the DSI transfer
function polling for the dc_start bit to go back to idle state after the
transmission is started.

This is documented in the datasheet and failures to do so lead to
commands corruption.

Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 0e8813278a2f..bb1750a3dab0 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -125,6 +125,9 @@
 #define TC358768_DSI_CONFW_MODE_CLR	(6 << 29)
 #define TC358768_DSI_CONFW_ADDR_DSI_CONTROL	(0x3 << 24)
 
+/* TC358768_DSICMD_TX (0x0600) register */
+#define TC358768_DSI_CMDTX_DC_START	BIT(0)
+
 static const char * const tc358768_supplies[] = {
 	"vddc", "vddmipi", "vddio"
 };
@@ -229,6 +232,21 @@ static void tc358768_update_bits(struct tc358768_priv *priv, u32 reg, u32 mask,
 		tc358768_write(priv, reg, tmp);
 }
 
+static void tc358768_dsicmd_tx(struct tc358768_priv *priv)
+{
+	u32 val;
+
+	/* start transfer */
+	tc358768_write(priv, TC358768_DSICMD_TX, TC358768_DSI_CMDTX_DC_START);
+	if (priv->error)
+		return;
+
+	/* wait transfer completion */
+	priv->error = regmap_read_poll_timeout(priv->regmap, TC358768_DSICMD_TX, val,
+					       (val & TC358768_DSI_CMDTX_DC_START) == 0,
+					       100, 100000);
+}
+
 static int tc358768_sw_reset(struct tc358768_priv *priv)
 {
 	/* Assert Reset */
@@ -516,8 +534,7 @@ static ssize_t tc358768_dsi_host_transfer(struct mipi_dsi_host *host,
 		}
 	}
 
-	/* start transfer */
-	tc358768_write(priv, TC358768_DSICMD_TX, 1);
+	tc358768_dsicmd_tx(priv);
 
 	ret = tc358768_clear_error(priv);
 	if (ret)
-- 
2.39.5

