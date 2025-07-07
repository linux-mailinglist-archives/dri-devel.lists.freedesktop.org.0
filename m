Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEDFAFB8F4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F2810E4E4;
	Mon,  7 Jul 2025 16:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="AIKF8kQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C147610E4E7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=YpitKWsGYdvkCnrR1mHFS1FP2h9VNXePXRkQPh7Xnq8=; b=AIKF8kQRHi8mNwcFM+zhxqLyl6
 Ge/ez06ZIr4EFSDUVGczPLCZiaO3f+uSZ/kjawcOUBkqqKpCWZmXisTdeZhMnqsvmmQa3W84mTdOl
 MepxtMwXCbvF4G4403s+qSumq4ZnBZZ9K0wbi8Igi7UHOjqfIUYTeyyy+qNjHUQDHo6s+Z0xbx2mk
 5e0BZm/C0w33YqocUYHABh26i0o7cTQHBrrd1Dhrn6BnMVAAu8WgeUqEJuPu5lUQNYrxVY2OPy0GQ
 OAyekpgppxNmuEd7UKIG3qkt/GJ0x9fy8Rea+CNQH8R0AYcbVI/L7I98pr9USHRgf0e7CZInB0mf5
 7vUZrHxw==;
Received: from i53875bf5.versanet.de ([83.135.91.245]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uYp1q-0004yl-A5; Mon, 07 Jul 2025 18:49:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com, andyshrk@163.com,
 nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 02/13] drm/panel: ilitek-ili9881c: move display_on/_off dcs
 calls to (un-)prepare
Date: Mon,  7 Jul 2025 18:48:55 +0200
Message-ID: <20250707164906.1445288-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
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

At least for panel-bridges, the atomic_enable call is defined as being
called right after the preceding element in the display pipe is enabled.

It is also stated that "The bridge can assume that the display pipe (i.e.
clocks and timing signals) feeding it is running when this callback is
called"

This means the DSI controller driving this display would have already
switched over to video-mode from command mode and thus dcs functions
should not be called anymore at this point.

This caused a non-working display for me, when trying to enable
the rk3576 dsi controller using a display using this controller.

Therefore move the display_on/off calls the more appropriate
prepare/unprepare callbacks.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 27 +++++--------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index d7a17dca2a9c..a20b52181ea0 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -1315,35 +1315,24 @@ static int ili9881c_prepare(struct drm_panel *panel)
 	if (ret)
 		goto disable_power;
 
-	return 0;
-
-disable_power:
-	regulator_disable(ctx->power);
-	return ret;
-}
-
-static int ili9881c_enable(struct drm_panel *panel)
-{
-	struct ili9881c *ctx = panel_to_ili9881c(panel);
-
 	msleep(120);
 
-	mipi_dsi_dcs_set_display_on(ctx->dsi);
+	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
+	if (ret)
+		goto disable_power;
 
 	return 0;
-}
 
-static int ili9881c_disable(struct drm_panel *panel)
-{
-	struct ili9881c *ctx = panel_to_ili9881c(panel);
-
-	return mipi_dsi_dcs_set_display_off(ctx->dsi);
+disable_power:
+	regulator_disable(ctx->power);
+	return ret;
 }
 
 static int ili9881c_unprepare(struct drm_panel *panel)
 {
 	struct ili9881c *ctx = panel_to_ili9881c(panel);
 
+	mipi_dsi_dcs_set_display_off(ctx->dsi);
 	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
 	regulator_disable(ctx->power);
 	gpiod_set_value_cansleep(ctx->reset, 1);
@@ -1499,8 +1488,6 @@ static enum drm_panel_orientation ili9881c_get_orientation(struct drm_panel *pan
 static const struct drm_panel_funcs ili9881c_funcs = {
 	.prepare	= ili9881c_prepare,
 	.unprepare	= ili9881c_unprepare,
-	.enable		= ili9881c_enable,
-	.disable	= ili9881c_disable,
 	.get_modes	= ili9881c_get_modes,
 	.get_orientation = ili9881c_get_orientation,
 };
-- 
2.47.2

