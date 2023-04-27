Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9016F0766
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 16:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9414F10E314;
	Thu, 27 Apr 2023 14:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796A110E2A0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 14:29:44 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id C28EC20B57;
 Thu, 27 Apr 2023 16:29:40 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/9] drm/bridge: tc358768: fix PLL target frequency
Date: Thu, 27 Apr 2023 16:29:28 +0200
Message-Id: <20230427142934.55435-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427142934.55435-1-francesco@dolcini.it>
References: <20230427142934.55435-1-francesco@dolcini.it>
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Correctly compute the PLL target frequency, the current formula works
correctly only when the input bus width is 24bit, actually to properly
compute the PLL target frequency what is relevant is the bits-per-pixel
on the DSI link.

No regression expected since the DSI format is currently hard-coded as
MIPI_DSI_FMT_RGB888.

Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index e9e3f9e02bba..dba1bf3912f1 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -146,6 +146,7 @@ struct tc358768_priv {
 
 	u32 pd_lines; /* number of Parallel Port Input Data Lines */
 	u32 dsi_lanes; /* number of DSI Lanes */
+	u32 dsi_bpp; /* number of Bits Per Pixel over DSI */
 
 	/* Parameters for PLL programming */
 	u32 fbd;	/* PLL feedback divider */
@@ -284,12 +285,12 @@ static void tc358768_hw_disable(struct tc358768_priv *priv)
 
 static u32 tc358768_pll_to_pclk(struct tc358768_priv *priv, u32 pll_clk)
 {
-	return (u32)div_u64((u64)pll_clk * priv->dsi_lanes, priv->pd_lines);
+	return (u32)div_u64((u64)pll_clk * priv->dsi_lanes, priv->dsi_bpp);
 }
 
 static u32 tc358768_pclk_to_pll(struct tc358768_priv *priv, u32 pclk)
 {
-	return (u32)div_u64((u64)pclk * priv->pd_lines, priv->dsi_lanes);
+	return (u32)div_u64((u64)pclk * priv->dsi_bpp, priv->dsi_lanes);
 }
 
 static int tc358768_calc_pll(struct tc358768_priv *priv,
@@ -426,6 +427,7 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 	priv->output.panel = panel;
 
 	priv->dsi_lanes = dev->lanes;
+	priv->dsi_bpp = mipi_dsi_pixel_format_to_bpp(dev->format);
 
 	/* get input ep (port0/endpoint0) */
 	ret = -EINVAL;
@@ -437,7 +439,7 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 	}
 
 	if (ret)
-		priv->pd_lines = mipi_dsi_pixel_format_to_bpp(dev->format);
+		priv->pd_lines = priv->dsi_bpp;
 
 	drm_bridge_add(&priv->bridge);
 
-- 
2.25.1

