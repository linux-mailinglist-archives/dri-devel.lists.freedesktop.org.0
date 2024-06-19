Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD6190F633
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 20:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06F110ED83;
	Wed, 19 Jun 2024 18:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3392410ED83
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 18:43:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sK0H6-0005c6-VO; Wed, 19 Jun 2024 20:43:16 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sJzwX-003WTo-5J; Wed, 19 Jun 2024 20:22:01 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de
Subject: [PATCH v2 11/14] drm/bridge: analogix_dp: don't wait for PLL lock too
 early
Date: Wed, 19 Jun 2024 20:21:57 +0200
Message-Id: <20240619182200.3752465-11-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619182200.3752465-1-l.stach@pengutronix.de>
References: <20240619182200.3752465-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

The PLL will be reconfigured later, which may cause it to go out of lock
anyway, so there is no point in waiting for the PLL to lock here. Instead
we can continue execution of the link setup, which will properly set the
PLL parameters and will wait for the PLL to lock at the appropriate times.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index d267cf05cbca..e9c643a8b6fc 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -356,7 +356,6 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 int analogix_dp_init_analog_func(struct analogix_dp_device *dp)
 {
 	u32 reg;
-	int timeout_loop = 0;
 
 	analogix_dp_set_analog_power_down(dp, POWER_ALL, 0);
 
@@ -368,18 +367,7 @@ int analogix_dp_init_analog_func(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_DEBUG_CTL);
 
 	/* Power up PLL */
-	if (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
-		analogix_dp_set_pll_power_down(dp, 0);
-
-		while (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
-			timeout_loop++;
-			if (DP_TIMEOUT_LOOP_COUNT < timeout_loop) {
-				dev_err(dp->dev, "failed to get pll lock status\n");
-				return -ETIMEDOUT;
-			}
-			usleep_range(10, 20);
-		}
-	}
+	analogix_dp_set_pll_power_down(dp, 0);
 
 	/* Enable Serdes FIFO function and Link symbol clock domain module */
 	reg = readl(dp->reg_base + ANALOGIX_DP_FUNC_EN_2);
-- 
2.39.2

