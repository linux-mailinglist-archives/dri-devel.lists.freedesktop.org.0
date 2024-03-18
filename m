Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE4E87F14C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 21:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79E411206F;
	Mon, 18 Mar 2024 20:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2893611206D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 20:39:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rmJlY-0004vG-1b; Mon, 18 Mar 2024 21:39:28 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rmJlV-0078y6-Id; Mon, 18 Mar 2024 21:39:25 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 3/3] drm/bridge: analogix_dp: don't adjust further when clock
 recovery succeeded
Date: Mon, 18 Mar 2024 21:39:25 +0100
Message-Id: <20240318203925.2837689-3-l.stach@pengutronix.de>
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

Take a early return from the clock recovery training when the sink reports
CR_DONE for all lanes. There is no point in trying to adjust the link
parameters further.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 300385db7502..98454f0af90e 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -410,11 +410,6 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 	if (retval < 0)
 		return retval;
 
-	retval = drm_dp_dpcd_read(&dp->aux, DP_ADJUST_REQUEST_LANE0_1,
-				  adjust_request, 2);
-	if (retval < 0)
-		return retval;
-
 	if (analogix_dp_clock_recovery_ok(link_status, lane_count) == 0) {
 		/* set training pattern 2 for EQ */
 		analogix_dp_set_training_pattern(dp, TRAINING_PTN2);
@@ -427,30 +422,35 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 
 		dev_dbg(dp->dev, "Link Training Clock Recovery success\n");
 		dp->link_train.lt_state = EQUALIZER_TRAINING;
-	} else {
-		for (lane = 0; lane < lane_count; lane++) {
-			training_lane = analogix_dp_get_lane_link_training(
-							dp, lane);
-			voltage_swing = analogix_dp_get_adjust_request_voltage(
-							adjust_request, lane);
-			pre_emphasis = analogix_dp_get_adjust_request_pre_emphasis(
-							adjust_request, lane);
-
-			if (DPCD_VOLTAGE_SWING_GET(training_lane) ==
-					voltage_swing &&
-			    DPCD_PRE_EMPHASIS_GET(training_lane) ==
-					pre_emphasis)
-				dp->link_train.cr_loop[lane]++;
-
-			if (dp->link_train.cr_loop[lane] == MAX_CR_LOOP ||
-			    voltage_swing == VOLTAGE_LEVEL_3 ||
-			    pre_emphasis == PRE_EMPHASIS_LEVEL_3) {
-				dev_err(dp->dev, "CR Max reached (%d,%d,%d)\n",
-					dp->link_train.cr_loop[lane],
-					voltage_swing, pre_emphasis);
-				analogix_dp_reduce_link_rate(dp);
-				return -EIO;
-			}
+
+		return 0;
+	}
+
+	retval = drm_dp_dpcd_read(&dp->aux, DP_ADJUST_REQUEST_LANE0_1,
+				  adjust_request, 2);
+	if (retval < 0)
+		return retval;
+
+	for (lane = 0; lane < lane_count; lane++) {
+		training_lane = analogix_dp_get_lane_link_training(
+						dp, lane);
+		voltage_swing = analogix_dp_get_adjust_request_voltage(
+						adjust_request, lane);
+		pre_emphasis = analogix_dp_get_adjust_request_pre_emphasis(
+						adjust_request, lane);
+
+		if (DPCD_VOLTAGE_SWING_GET(training_lane) == voltage_swing &&
+		    DPCD_PRE_EMPHASIS_GET(training_lane) == pre_emphasis)
+			dp->link_train.cr_loop[lane]++;
+
+		if (dp->link_train.cr_loop[lane] == MAX_CR_LOOP ||
+		    voltage_swing == VOLTAGE_LEVEL_3 ||
+		    pre_emphasis == PRE_EMPHASIS_LEVEL_3) {
+			dev_err(dp->dev, "CR Max reached (%d,%d,%d)\n",
+				dp->link_train.cr_loop[lane],
+				voltage_swing, pre_emphasis);
+			analogix_dp_reduce_link_rate(dp);
+			return -EIO;
 		}
 	}
 
-- 
2.39.2

