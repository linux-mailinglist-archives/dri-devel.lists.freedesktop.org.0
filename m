Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD0290F632
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 20:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FB510ED85;
	Wed, 19 Jun 2024 18:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF4510ED83
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 18:43:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sK0H7-0005dP-Dc; Wed, 19 Jun 2024 20:43:17 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sJzwX-003WTo-8S; Wed, 19 Jun 2024 20:22:01 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de
Subject: [PATCH v2 12/14] drm/bridge: analogix_dp: simplify and correct PLL
 lock checks
Date: Wed, 19 Jun 2024 20:21:58 +0200
Message-Id: <20240619182200.3752465-12-l.stach@pengutronix.de>
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

Move the wait loop into its own function, so it doesn't need to be
replicated in multiple locations. Also move the PLL lock checks between
setting the link bandwidth, which may cause the PLL to unlock, and the
MACRO_RST which needs the PLL to be locked.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 34 +++++++------------
 .../drm/bridge/analogix/analogix_dp_core.h    |  7 +---
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 12 +++----
 3 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index d2c7a9117ce3..ddf1e4424ffd 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -231,7 +231,7 @@ static int analogix_dp_training_pattern_dis(struct analogix_dp_device *dp)
 static int analogix_dp_link_start(struct analogix_dp_device *dp)
 {
 	u8 buf[4];
-	int lane, lane_count, pll_tries, retval;
+	int lane, lane_count, retval;
 
 	lane_count = dp->link_train.lane_count;
 
@@ -243,6 +243,11 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 
 	/* Set link rate and count as you want to establish*/
 	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
+	retval = analogix_dp_wait_pll_locked(dp);
+	if (retval) {
+		DRM_DEV_ERROR(dp->dev, "Wait for pll lock failed %d\n", retval);
+		return retval;
+	}
 	/*
 	 * MACRO_RST must be applied after the PLL_LOCK to avoid
 	 * the DP inter pair skew issue for at least 10 us
@@ -270,18 +275,6 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 					DP_TRAIN_PRE_EMPH_LEVEL_0;
 	analogix_dp_set_lane_link_training(dp);
 
-	/* Wait for PLL lock */
-	pll_tries = 0;
-	while (analogix_dp_get_pll_lock_status(dp) == PLL_UNLOCKED) {
-		if (pll_tries == DP_TIMEOUT_LOOP_COUNT) {
-			dev_err(dp->dev, "Wait for PLL lock timed out\n");
-			return -ETIMEDOUT;
-		}
-
-		pll_tries++;
-		usleep_range(90, 120);
-	}
-
 	/* Set training pattern 1 */
 	analogix_dp_set_training_pattern(dp, TRAINING_PTN1);
 
@@ -631,9 +624,14 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 {
 	int ret;
 	u8 link_align, link_status[2];
-	enum pll_status status;
 
 	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
+	ret = analogix_dp_wait_pll_locked(dp);
+	if (ret) {
+		DRM_DEV_ERROR(dp->dev, "Wait for pll lock failed %d\n", ret);
+		return ret;
+	}
+
 	/*
 	 * MACRO_RST must be applied after the PLL_LOCK to avoid
 	 * the DP inter pair skew issue for at least 10 us
@@ -642,14 +640,6 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 	analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
 	analogix_dp_set_lane_link_training(dp);
 
-	ret = readx_poll_timeout(analogix_dp_get_pll_lock_status, dp, status,
-				 status != PLL_UNLOCKED, 120,
-				 120 * DP_TIMEOUT_LOOP_COUNT);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev, "Wait for pll lock failed %d\n", ret);
-		return ret;
-	}
-
 	/* source Set training pattern 1 */
 	analogix_dp_set_training_pattern(dp, TRAINING_PTN1);
 	/* From DP spec, pattern must be on-screen for a minimum 500us */
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 382b2f068ab9..774d11574b09 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -95,11 +95,6 @@ enum dynamic_range {
 	CEA
 };
 
-enum pll_status {
-	PLL_UNLOCKED,
-	PLL_LOCKED
-};
-
 enum clock_recovery_m_value_type {
 	CALCULATED_M,
 	REGISTER_M
@@ -191,7 +186,7 @@ void analogix_dp_swreset(struct analogix_dp_device *dp);
 void analogix_dp_config_interrupt(struct analogix_dp_device *dp);
 void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp);
 void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp);
-enum pll_status analogix_dp_get_pll_lock_status(struct analogix_dp_device *dp);
+int analogix_dp_wait_pll_locked(struct analogix_dp_device *dp);
 void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool enable);
 void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 				       enum analog_power_block block,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index e9c643a8b6fc..143a78b1d156 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -217,15 +217,13 @@ void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
 }
 
-enum pll_status analogix_dp_get_pll_lock_status(struct analogix_dp_device *dp)
+int analogix_dp_wait_pll_locked(struct analogix_dp_device *dp)
 {
-	u32 reg;
+	u32 val;
 
-	reg = readl(dp->reg_base + ANALOGIX_DP_DEBUG_CTL);
-	if (reg & PLL_LOCK)
-		return PLL_LOCKED;
-	else
-		return PLL_UNLOCKED;
+	return readl_poll_timeout(dp->reg_base + ANALOGIX_DP_DEBUG_CTL, val,
+				  val & PLL_LOCK, 120,
+				  120 * DP_TIMEOUT_LOOP_COUNT);
 }
 
 void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool enable)
-- 
2.39.2

