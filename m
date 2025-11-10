Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C4EC4579B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 09:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0A110E2BA;
	Mon, 10 Nov 2025 08:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="O3rVIxIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973182.qiye.163.com (mail-m1973182.qiye.163.com
 [220.197.31.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F172E10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:58:56 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 29068b539;
 Mon, 10 Nov 2025 16:58:50 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 4/4] drm/bridge: analogix_dp: Apply DP helper APIs to get
 adjusted voltages and pre-emphasises
Date: Mon, 10 Nov 2025 16:58:23 +0800
Message-Id: <20251110085823.1197472-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251110085823.1197472-1-damon.ding@rock-chips.com>
References: <20251110085823.1197472-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a6cfd4baf03a3kunm91e8d29910ac63a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhgfSFZNHkpPHx0fGkhLSENWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=O3rVIxIeKj031LO6gC8cXthXGkyG4plX49kBzyYvzXi0wSxDYYzhUhxz7fm1nH6y5ySln8sCkNVijuHvfSYhUxL7WlUdiinr21ebE3cRqy2MpRSWbjfFvyhHdYMEa9Ye1MhmeaKT17LBK0GWTy2WrHi+dDBv1jRubn7w4gAKYQw=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=3gW86vskonft7Jl2Q50EbOmDui7TylloSuDk8Dc/iLU=;
 h=date:mime-version:subject:message-id:from;
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

Replace analogix_dp_get_adjust_request_voltage() and
analogix_dp_get_adjust_request_pre_emphasis() with existing DP helper
APIs with the same function.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 49 ++++---------------
 1 file changed, 9 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 227ef30b8a9e..6ec3d811b5f0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -293,25 +293,6 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 	return 0;
 }
 
-static unsigned char
-analogix_dp_get_adjust_request_voltage(u8 adjust_request[2], int lane)
-{
-	int shift = (lane & 1) * 4;
-	u8 link_value = adjust_request[lane >> 1];
-
-	return (link_value >> shift) & 0x3;
-}
-
-static unsigned char analogix_dp_get_adjust_request_pre_emphasis(
-					u8 adjust_request[2],
-					int lane)
-{
-	int shift = (lane & 1) * 4;
-	u8 link_value = adjust_request[lane >> 1];
-
-	return ((link_value >> shift) & 0xc) >> 2;
-}
-
 static void analogix_dp_reduce_link_rate(struct analogix_dp_device *dp)
 {
 	analogix_dp_training_pattern_dis(dp);
@@ -321,17 +302,15 @@ static void analogix_dp_reduce_link_rate(struct analogix_dp_device *dp)
 }
 
 static void analogix_dp_get_adjust_training_lane(struct analogix_dp_device *dp,
-						 u8 adjust_request[2])
+						 u8 link_status[DP_LINK_STATUS_SIZE])
 {
 	int lane, lane_count;
 	u8 voltage_swing, pre_emphasis, training_lane;
 
 	lane_count = dp->link_train.lane_count;
 	for (lane = 0; lane < lane_count; lane++) {
-		voltage_swing = analogix_dp_get_adjust_request_voltage(
-						adjust_request, lane);
-		pre_emphasis = analogix_dp_get_adjust_request_pre_emphasis(
-						adjust_request, lane);
+		voltage_swing = drm_dp_get_adjust_request_voltage(link_status, lane);
+		pre_emphasis = drm_dp_get_adjust_request_pre_emphasis(link_status, lane);
 		training_lane = DPCD_VOLTAGE_SWING_SET(voltage_swing) |
 				DPCD_PRE_EMPHASIS_SET(pre_emphasis);
 
@@ -348,7 +327,7 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 {
 	int lane, lane_count, retval;
 	u8 voltage_swing, pre_emphasis, training_lane;
-	u8 link_status[DP_LINK_STATUS_SIZE], adjust_request[2];
+	u8 link_status[DP_LINK_STATUS_SIZE];
 
 	usleep_range(100, 101);
 
@@ -374,15 +353,10 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 		return 0;
 	}
 
-	retval = drm_dp_dpcd_read(&dp->aux, DP_ADJUST_REQUEST_LANE0_1,
-				  adjust_request, 2);
-	if (retval < 0)
-		return retval;
-
 	for (lane = 0; lane < lane_count; lane++) {
 		training_lane = analogix_dp_get_lane_link_training(dp, lane);
-		voltage_swing = analogix_dp_get_adjust_request_voltage(adjust_request, lane);
-		pre_emphasis = analogix_dp_get_adjust_request_pre_emphasis(adjust_request, lane);
+		voltage_swing = drm_dp_get_adjust_request_voltage(link_status, lane);
+		pre_emphasis = drm_dp_get_adjust_request_pre_emphasis(link_status, lane);
 
 		if (DPCD_VOLTAGE_SWING_GET(training_lane) == voltage_swing &&
 		    DPCD_PRE_EMPHASIS_GET(training_lane) == pre_emphasis)
@@ -399,7 +373,7 @@ static int analogix_dp_process_clock_recovery(struct analogix_dp_device *dp)
 		}
 	}
 
-	analogix_dp_get_adjust_training_lane(dp, adjust_request);
+	analogix_dp_get_adjust_training_lane(dp, link_status);
 	analogix_dp_set_lane_link_training(dp);
 
 	retval = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
@@ -414,7 +388,7 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 {
 	int lane_count, retval;
 	u32 reg;
-	u8 link_status[DP_LINK_STATUS_SIZE], adjust_request[2];
+	u8 link_status[DP_LINK_STATUS_SIZE];
 
 	usleep_range(400, 401);
 
@@ -429,12 +403,7 @@ static int analogix_dp_process_equalizer_training(struct analogix_dp_device *dp)
 		return -EIO;
 	}
 
-	retval = drm_dp_dpcd_read(&dp->aux, DP_ADJUST_REQUEST_LANE0_1,
-				  adjust_request, 2);
-	if (retval < 0)
-		return retval;
-
-	analogix_dp_get_adjust_training_lane(dp, adjust_request);
+	analogix_dp_get_adjust_training_lane(dp, link_status);
 
 	if (drm_dp_channel_eq_ok(link_status, lane_count)) {
 		/* traing pattern Set to Normal */
-- 
2.34.1

