Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AFF8BCF16
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B858B10FABC;
	Mon,  6 May 2024 13:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fkIFGsQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4793710FABC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:35:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B04B261180;
 Mon,  6 May 2024 13:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6E7C4DDE0;
 Mon,  6 May 2024 13:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002552;
 bh=WxRrG6WTFlRQfn6WWcefR6HHCbkvvHD6Cc1lLV/qbGE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fkIFGsQvkv1zts7XnHArWvq5f6naVeYQf+gyv4hIjws7yh55elTEiD8E/gZClAhKt
 2Nm8vAV4FymXXd+glXnlSr9Wi4znWxmiXt0ju4tdA60Zf/sl9QcxuMD6XMzogZ0i+f
 XZekXyKMV8g+eGYA8o2AxeORRn1LY73iuelV5XTvS8qB9VhsOyNcdYRR1VI7F31Bqy
 61wBlpLyw6poCnKygq72ifnnqGRa2Y9LtUlhMr6OB6IDF7522UfUhiu07Dc907F4GA
 LrfmNplDZxSkhYiQGJjHvN4Rf3vmZd1re2RAEgCYpFFCwgSkRTME6JNwvTXNNQaen+
 +vPi2Xo0NRgZQ==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:39 +0200
Subject: [PATCH 10/20] drm/bridge: tc358775: simplify lvds_link property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-10-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
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

The LVDS link can either be a single link or a dual link. No need for a
u8. Replace it with a bool "lvds_dual_link".

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index a9d731e87970..be2175571b99 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -231,7 +231,7 @@ struct tc_data {
 	struct regulator	*vddio;
 	struct gpio_desc	*reset_gpio;
 	struct gpio_desc	*stby_gpio;
-	u8			lvds_link; /* single-link or dual-link */
+	bool			lvds_dual_link;
 	u8			bpc;
 
 	enum tc3587x5_type	type;
@@ -409,7 +409,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	regmap_write(tc->regmap, VFUEN, VFUEN_EN);
 
 	val = LVCFG_LVEN_BIT;
-	if (tc->lvds_link == DUAL_LINK) {
+	if (tc->lvds_dual_link) {
 		val |= TC358775_LVCFG_LVDLINK(1);
 		val |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_6);
 	} else {
@@ -460,8 +460,8 @@ tc_mode_valid(struct drm_bridge *bridge,
 	 * Maximum pixel clock speed 135MHz for single-link
 	 * 270MHz for dual-link
 	 */
-	if ((mode->clock > 135000 && tc->lvds_link == SINGLE_LINK) ||
-	    (mode->clock > 270000 && tc->lvds_link == DUAL_LINK))
+	if ((mode->clock > 135000 && !tc->lvds_dual_link) ||
+	    (mode->clock > 270000 && tc->lvds_dual_link))
 		return MODE_CLOCK_HIGH;
 
 	switch (info->bus_formats[0]) {
@@ -516,7 +516,6 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 
 	of_node_put(tc->host_node);
 
-	tc->lvds_link = SINGLE_LINK;
 	endpoint = of_graph_get_endpoint_by_regs(tc->dev->of_node,
 						 TC358775_LVDS_OUT1, -1);
 	if (endpoint) {
@@ -525,13 +524,14 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 
 		if (remote) {
 			if (of_device_is_available(remote))
-				tc->lvds_link = DUAL_LINK;
+				tc->lvds_dual_link = true;
 			of_node_put(remote);
 		}
 	}
 
 	dev_dbg(tc->dev, "no.of dsi lanes: %d\n", tc->num_dsi_lanes);
-	dev_dbg(tc->dev, "operating in %d-link mode\n",	tc->lvds_link);
+	dev_dbg(tc->dev, "operating in %s-link mode\n",
+		tc->lvds_dual_link ? "dual" : "single");
 
 	return 0;
 }

-- 
2.39.2

