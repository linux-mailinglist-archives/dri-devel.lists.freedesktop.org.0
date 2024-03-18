Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BC487F14D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 21:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488C0112071;
	Mon, 18 Mar 2024 20:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDBF11206F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 20:39:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rmJlY-0004vF-1b; Mon, 18 Mar 2024 21:39:28 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rmJlV-0078y6-Fb; Mon, 18 Mar 2024 21:39:25 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 2/3] drm/bridge: analogix_dp: simplify
 analogix_dp_{set/get}_lane_link_training helpers
Date: Mon, 18 Mar 2024 21:39:24 +0100
Message-Id: <20240318203925.2837689-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318203925.2837689-1-l.stach@pengutronix.de>
References: <20240318203925.2837689-1-l.stach@pengutronix.de>
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

From: Wyon Bi <bivvy.bi@rock-chips.com>

There is no need for separate functions for each lane, as we can deduct the
register offset to read/write from the lane index.

Signed-off-by: Wyon Bi <bivvy.bi@rock-chips.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  97 ++-------------
 .../drm/bridge/analogix/analogix_dp_core.h    |  22 +---
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 114 +++---------------
 3 files changed, 26 insertions(+), 207 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index df9370e0ff23..300385db7502 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -234,28 +234,6 @@ static int analogix_dp_training_pattern_dis(struct analogix_dp_device *dp)
 	return ret < 0 ? ret : 0;
 }
 
-static void
-analogix_dp_set_lane_lane_pre_emphasis(struct analogix_dp_device *dp,
-				       int pre_emphasis, int lane)
-{
-	switch (lane) {
-	case 0:
-		analogix_dp_set_lane0_pre_emphasis(dp, pre_emphasis);
-		break;
-	case 1:
-		analogix_dp_set_lane1_pre_emphasis(dp, pre_emphasis);
-		break;
-
-	case 2:
-		analogix_dp_set_lane2_pre_emphasis(dp, pre_emphasis);
-		break;
-
-	case 3:
-		analogix_dp_set_lane3_pre_emphasis(dp, pre_emphasis);
-		break;
-	}
-}
-
 static int analogix_dp_link_start(struct analogix_dp_device *dp)
 {
 	u8 buf[4];
@@ -286,10 +264,12 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 		return retval;
 	}
 
-	/* Set TX pre-emphasis to minimum */
+	/* Set TX voltage-swing and pre-emphasis to minimum */
 	for (lane = 0; lane < lane_count; lane++)
-		analogix_dp_set_lane_lane_pre_emphasis(dp,
-			PRE_EMPHASIS_LEVEL_0, lane);
+		dp->link_train.training_lane[lane] =
+					DP_TRAIN_VOLTAGE_SWING_LEVEL_0 |
+					DP_TRAIN_PRE_EMPH_LEVEL_0;
+	analogix_dp_set_lane_link_training(dp);
 
 	/* Wait for PLL lock */
 	pll_tries = 0;
@@ -384,54 +364,6 @@ static unsigned char analogix_dp_get_adjust_request_pre_emphasis(
 	return ((link_value >> shift) & 0xc) >> 2;
 }
 
-static void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp,
-					       u8 training_lane_set, int lane)
-{
-	switch (lane) {
-	case 0:
-		analogix_dp_set_lane0_link_training(dp, training_lane_set);
-		break;
-	case 1:
-		analogix_dp_set_lane1_link_training(dp, training_lane_set);
-		break;
-
-	case 2:
-		analogix_dp_set_lane2_link_training(dp, training_lane_set);
-		break;
-
-	case 3:
-		analogix_dp_set_lane3_link_training(dp, training_lane_set);
-		break;
-	}
-}
-
-static unsigned int
-analogix_dp_get_lane_link_training(struct analogix_dp_device *dp,
-				   int lane)
-{
-	u32 reg;
-
-	switch (lane) {
-	case 0:
-		reg = analogix_dp_get_lane0_link_training(dp);
-		break;
-	case 1:
-		reg = analogix_dp_get_lane1_link_training(dp);
-		break;
-	case 2:
-		reg = analogix_dp_get_lane2_link_training(dp);
-		break;
-	case 3:
-		reg = analogix_dp_get_lane3_link_training(dp);
-		break;
-	default:
-		WARN_ON(1);
-		return 0;
-	}
-
-	return reg;
-}
-
 static void analogix_dp_reduce_link_rate(struct analogix_dp_device *dp)
 {
 	analogix_dp_training_pattern_dis(dp);
@@ -523,10 +455,7 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 	}
 
 	analogix_dp_get_adjust_training_lane(dp, adjust_request);
-
-	for (lane = 0; lane < lane_count; lane++)
-		analogix_dp_set_lane_link_training(dp,
-			dp->link_train.training_lane[lane], lane);
+	analogix_dp_set_lane_link_training(dp);
 
 	retval = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
 				   dp->link_train.training_lane, lane_count);
@@ -538,7 +467,7 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 
 static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 {
-	int lane, lane_count, retval;
+	int lane_count, retval;
 	u32 reg;
 	u8 link_align, link_status[2], adjust_request[2];
 
@@ -598,9 +527,7 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 		return -EIO;
 	}
 
-	for (lane = 0; lane < lane_count; lane++)
-		analogix_dp_set_lane_link_training(dp,
-			dp->link_train.training_lane[lane], lane);
+	analogix_dp_set_lane_link_training(dp);
 
 	retval = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
 				   dp->link_train.training_lane, lane_count);
@@ -712,7 +639,7 @@ static int analogix_dp_full_link_train(struct analogix_dp_device *dp,
 
 static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 {
-	int i, ret;
+	int ret;
 	u8 link_align, link_status[2];
 	enum pll_status status;
 
@@ -720,11 +647,7 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 
 	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
 	analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
-
-	for (i = 0; i < dp->link_train.lane_count; i++) {
-		analogix_dp_set_lane_link_training(dp,
-			dp->link_train.training_lane[i], i);
-	}
+	analogix_dp_set_lane_link_training(dp);
 
 	ret = readx_poll_timeout(analogix_dp_get_pll_lock_status, dp, status,
 				 status != PLL_UNLOCKED, 120,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 433f2d7efa0c..382b2f068ab9 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -213,26 +213,8 @@ void analogix_dp_enable_enhanced_mode(struct analogix_dp_device *dp,
 				      bool enable);
 void analogix_dp_set_training_pattern(struct analogix_dp_device *dp,
 				      enum pattern_set pattern);
-void analogix_dp_set_lane0_pre_emphasis(struct analogix_dp_device *dp,
-					u32 level);
-void analogix_dp_set_lane1_pre_emphasis(struct analogix_dp_device *dp,
-					u32 level);
-void analogix_dp_set_lane2_pre_emphasis(struct analogix_dp_device *dp,
-					u32 level);
-void analogix_dp_set_lane3_pre_emphasis(struct analogix_dp_device *dp,
-					u32 level);
-void analogix_dp_set_lane0_link_training(struct analogix_dp_device *dp,
-					 u32 training_lane);
-void analogix_dp_set_lane1_link_training(struct analogix_dp_device *dp,
-					 u32 training_lane);
-void analogix_dp_set_lane2_link_training(struct analogix_dp_device *dp,
-					 u32 training_lane);
-void analogix_dp_set_lane3_link_training(struct analogix_dp_device *dp,
-					 u32 training_lane);
-u32 analogix_dp_get_lane0_link_training(struct analogix_dp_device *dp);
-u32 analogix_dp_get_lane1_link_training(struct analogix_dp_device *dp);
-u32 analogix_dp_get_lane2_link_training(struct analogix_dp_device *dp);
-u32 analogix_dp_get_lane3_link_training(struct analogix_dp_device *dp);
+void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp);
+u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8 lane);
 void analogix_dp_reset_macro(struct analogix_dp_device *dp);
 void analogix_dp_init_video(struct analogix_dp_device *dp);
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 7b0bc9704eac..d267cf05cbca 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -557,6 +557,20 @@ void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
 	*count = reg;
 }
 
+void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
+{
+	u8 lane;
+
+	for (lane = 0; lane < dp->link_train.lane_count; lane++)
+		writel(dp->link_train.training_lane[lane],
+		       dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
+}
+
+u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8 lane)
+{
+	return readl(dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
+}
+
 void analogix_dp_enable_enhanced_mode(struct analogix_dp_device *dp,
 				      bool enable)
 {
@@ -606,106 +620,6 @@ void analogix_dp_set_training_pattern(struct analogix_dp_device *dp,
 	}
 }
 
-void analogix_dp_set_lane0_pre_emphasis(struct analogix_dp_device *dp,
-					u32 level)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
-	reg &= ~PRE_EMPHASIS_SET_MASK;
-	reg |= level << PRE_EMPHASIS_SET_SHIFT;
-	writel(reg, dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
-}
-
-void analogix_dp_set_lane1_pre_emphasis(struct analogix_dp_device *dp,
-					u32 level)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
-	reg &= ~PRE_EMPHASIS_SET_MASK;
-	reg |= level << PRE_EMPHASIS_SET_SHIFT;
-	writel(reg, dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
-}
-
-void analogix_dp_set_lane2_pre_emphasis(struct analogix_dp_device *dp,
-					u32 level)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
-	reg &= ~PRE_EMPHASIS_SET_MASK;
-	reg |= level << PRE_EMPHASIS_SET_SHIFT;
-	writel(reg, dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
-}
-
-void analogix_dp_set_lane3_pre_emphasis(struct analogix_dp_device *dp,
-					u32 level)
-{
-	u32 reg;
-
-	reg = readl(dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
-	reg &= ~PRE_EMPHASIS_SET_MASK;
-	reg |= level << PRE_EMPHASIS_SET_SHIFT;
-	writel(reg, dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
-}
-
-void analogix_dp_set_lane0_link_training(struct analogix_dp_device *dp,
-					 u32 training_lane)
-{
-	u32 reg;
-
-	reg = training_lane;
-	writel(reg, dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
-}
-
-void analogix_dp_set_lane1_link_training(struct analogix_dp_device *dp,
-					 u32 training_lane)
-{
-	u32 reg;
-
-	reg = training_lane;
-	writel(reg, dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
-}
-
-void analogix_dp_set_lane2_link_training(struct analogix_dp_device *dp,
-					 u32 training_lane)
-{
-	u32 reg;
-
-	reg = training_lane;
-	writel(reg, dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
-}
-
-void analogix_dp_set_lane3_link_training(struct analogix_dp_device *dp,
-					 u32 training_lane)
-{
-	u32 reg;
-
-	reg = training_lane;
-	writel(reg, dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
-}
-
-u32 analogix_dp_get_lane0_link_training(struct analogix_dp_device *dp)
-{
-	return readl(dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
-}
-
-u32 analogix_dp_get_lane1_link_training(struct analogix_dp_device *dp)
-{
-	return readl(dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
-}
-
-u32 analogix_dp_get_lane2_link_training(struct analogix_dp_device *dp)
-{
-	return readl(dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
-}
-
-u32 analogix_dp_get_lane3_link_training(struct analogix_dp_device *dp)
-{
-	return readl(dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
-}
-
 void analogix_dp_reset_macro(struct analogix_dp_device *dp)
 {
 	u32 reg;
-- 
2.39.2

