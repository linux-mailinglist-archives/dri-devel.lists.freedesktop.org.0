Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9914A91189
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 04:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE69F10EA0B;
	Thu, 17 Apr 2025 02:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bVi/KaNr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8468F10EA03;
 Thu, 17 Apr 2025 02:13:57 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so2999875e9.2; 
 Wed, 16 Apr 2025 19:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744856036; x=1745460836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rYDK8MO7JAoEQRHU7R+shDCnltN0/XfcZdUoIFwe50E=;
 b=bVi/KaNrgMpoP3xZZy7E+JLjCGHklldng//Nx+PYtwGsh1tS6RDGDLcGK3QrySEKFz
 4cPNANMtjjqcgLDeZVAdFP6qRKTYPq9++Ms4UFRlstY0viW2asbM9irLbHdVrO6C8ogS
 dqZtykE2Vs/QP4sz5aiizh2otvd2AE9vINHTALbwWrDiHsXNIWCA7zV0fd6/Gw+5niaR
 dGdhV/a94eNFZMfPr6sArBM2rVuC9X0aTCPkpdZHHPIK+6CjK/tkDgPcBsSH0EpJToDr
 j0AsFp2wfpH0nHHbYjpuEpPbgSc3yYuhr9UytXQeU6kaxpGWcjJyyyOBFYJ/sM5INE3g
 +PDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744856036; x=1745460836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rYDK8MO7JAoEQRHU7R+shDCnltN0/XfcZdUoIFwe50E=;
 b=KShkYY0HirduJZP4qTkv1XAcsQolVQDIY8KimOXAfJ4MWWzN+cmBxp6/r3Ei3yWogu
 sdjJErlikYYxTR6vw1O3vbRJ1Gf5u2FuwiIsRsZjwemlCzSmSoR3sH4eKsN4Ulo8mr8k
 zvVQ0w6S72BXxGQyNiUuS0UjHRDI7I/wYQvW3WwZvKXqqYTwQ4eYVLoX0/jgX7jKuWiN
 gLvQoFiQQtw0d9Qjm6fYNR5DkniXak8Q/JipGkCbP5y8HSSI8880jkm9ZbXB7YJIclW5
 iHPWbtH82T2hLBpjEOV4H+0z3ZZkO7guw806rtvj+0OiJmqittADrCLJcLIDt2B8SR0n
 0edg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2evIezdMd3mfx2l1d7mrTkFG5SDGAgNb4LqROeNeUnJYnYjpM6mrPqlLmhc6zm1kwhf+MSx0R990z@lists.freedesktop.org,
 AJvYcCUWRJcKkxApgaqNhGZ6q0tWgQQanq0fyvIP1ol5NljCxmLlZNQDGx8EihrTHXXtaMKEcQd7akU+hWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywaeq7Ctjmctf55tKM1gNxGZYKwAVH3EqYlsgTxpxgqfsCzmzR6
 Wm16jZuonRe+R/SOi+F6NGyzwGJpQqQbzh8Py50QOjbugeFWDXE=
X-Gm-Gg: ASbGncvFpKvdeVJxK4zakcgqhCC5BLtSYQVVoxppeJd+nVeN7kpViZWVAP+EPs5MKqs
 qphK03IEcWgAg75lIa8N2bRd2N1CR5vdcKOV0QSyTsb9SCsaSqRBe/Q891NuN1/RnpWlZHiGIMp
 qsmJNwQh3g72EVO0+YVVyYQTYYKf/rqrhaVZ5aoKWZvzNMBDHjUYcg3yNfEUABTaWp0+Si0NxNa
 7n3z2TTHZ2olWypq3R6qZUw6XaKIkdMa7BSnN2E7ckSVkplVMa+vB/5IrK4NR+bKZw3XNcguSUH
 0KAjg6+F9tCe7ea/SMb6idq2WDMs0bn07au1yrWqdyiCZw==
X-Google-Smtp-Source: AGHT+IHcvL6u4p6HIC4ZehG4yHbh215Az7JL1A+vQxM3e7+Tr4ILiUpxPezP6UqCtyeQ8mKF9xaknQ==
X-Received: by 2002:a05:600c:570b:b0:43d:b32:40aa with SMTP id
 5b1f17b1804b1-4405d5fda03mr31634345e9.3.1744856035449; 
 Wed, 16 Apr 2025 19:13:55 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4d1236sm36940485e9.13.2025.04.16.19.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 19:13:55 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [PATCH v3 4/4] drm/msm/dp: Introduce link training per-segment for
 LTTPRs
Date: Thu, 17 Apr 2025 04:10:35 +0200
Message-ID: <20250417021349.148911-5-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250417021349.148911-1-alex.vinarskis@gmail.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
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

DisplayPort requires per-segment link training when LTTPR are switched
to non-transparent mode, starting with LTTPR closest to the source.
Only when each segment is trained individually, source can link train
to sink.

Implement per-segment link traning when LTTPR(s) are detected, to
support external docking stations. On higher level, changes are:

* Pass phy being trained down to all required helpers
* Run CR, EQ link training per phy
* Set voltage swing, pre-emphasis levels per phy

This ensures successful link training both when connected directly to
the monitor (single LTTPR onboard most X1E laptops) and via the docking
station (at least two LTTPRs).

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---------
 1 file changed, 89 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 69a26bb5fabd..a50bfafbb4ea 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1034,10 +1034,12 @@ static int msm_dp_ctrl_set_vx_px(struct msm_dp_ctrl_private *ctrl,
 	return 0;
 }
 
-static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_update_phy_vx_px(struct msm_dp_ctrl_private *ctrl,
+					enum drm_dp_phy dp_phy)
 {
 	struct msm_dp_link *link = ctrl->link;
-	int ret = 0, lane, lane_cnt;
+	int lane, lane_cnt, reg;
+	int ret = 0;
 	u8 buf[4];
 	u32 max_level_reached = 0;
 	u32 voltage_swing_level = link->phy_params.v_level;
@@ -1075,8 +1077,13 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "sink: p|v=0x%x\n",
 			voltage_swing_level | pre_emphasis_level);
-	ret = drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
-					buf, lane_cnt);
+
+	if (dp_phy == DP_PHY_DPRX)
+		reg = DP_TRAINING_LANE0_SET;
+	else
+		reg = DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy);
+
+	ret = drm_dp_dpcd_write(ctrl->aux, reg, buf, lane_cnt);
 	if (ret == lane_cnt)
 		ret = 0;
 
@@ -1084,9 +1091,10 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
 }
 
 static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
-		u8 pattern)
+		u8 pattern, enum drm_dp_phy dp_phy)
 {
 	u8 buf;
+	int reg;
 	int ret = 0;
 
 	drm_dbg_dp(ctrl->drm_dev, "sink: pattern=%x\n", pattern);
@@ -1096,17 +1104,26 @@ static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
 	if (pattern && pattern != DP_TRAINING_PATTERN_4)
 		buf |= DP_LINK_SCRAMBLING_DISABLE;
 
-	ret = drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, buf);
+	if (dp_phy == DP_PHY_DPRX)
+		reg = DP_TRAINING_PATTERN_SET;
+	else
+		reg = DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy);
+
+	ret = drm_dp_dpcd_writeb(ctrl->aux, reg, buf);
 	return ret == 1;
 }
 
 static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
-			int *training_step)
+			int *training_step, enum drm_dp_phy dp_phy)
 {
+	int delay_us;
 	int tries, old_v_level, ret = 0;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	int const maximum_retries = 4;
 
+	delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
+						    ctrl->panel->dpcd, dp_phy, false);
+
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
 	*training_step = DP_TRAINING_1;
@@ -1115,18 +1132,19 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	if (ret)
 		return ret;
 	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
-		DP_LINK_SCRAMBLING_DISABLE);
+		DP_LINK_SCRAMBLING_DISABLE, dp_phy);
 
-	ret = msm_dp_ctrl_update_vx_px(ctrl);
+	msm_dp_link_reset_phy_params_vx_px(ctrl->link);
+	ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
 	if (ret)
 		return ret;
 
 	tries = 0;
 	old_v_level = ctrl->link->phy_params.v_level;
 	for (tries = 0; tries < maximum_retries; tries++) {
-		drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
+		fsleep(delay_us);
 
-		ret = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
+		ret = drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_phy, link_status);
 		if (ret)
 			return ret;
 
@@ -1147,7 +1165,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 		}
 
 		msm_dp_link_adjust_levels(ctrl->link, link_status);
-		ret = msm_dp_ctrl_update_vx_px(ctrl);
+		ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
 		if (ret)
 			return ret;
 	}
@@ -1199,21 +1217,31 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
 	return 0;
 }
 
-static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl,
+					       enum drm_dp_phy dp_phy)
 {
-	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
-	drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
+	int delay_us;
+
+	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE, dp_phy);
+
+	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
+						ctrl->panel->dpcd, dp_phy, false);
+	fsleep(delay_us);
 }
 
 static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
-			int *training_step)
+			int *training_step, enum drm_dp_phy dp_phy)
 {
+	int delay_us;
 	int tries = 0, ret = 0;
 	u8 pattern;
 	u32 state_ctrl_bit;
 	int const maximum_retries = 5;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 
+	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
+						ctrl->panel->dpcd, dp_phy, false);
+
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
 	*training_step = DP_TRAINING_2;
@@ -1233,12 +1261,12 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	if (ret)
 		return ret;
 
-	msm_dp_ctrl_train_pattern_set(ctrl, pattern);
+	msm_dp_ctrl_train_pattern_set(ctrl, pattern, dp_phy);
 
 	for (tries = 0; tries <= maximum_retries; tries++) {
-		drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
+		fsleep(delay_us);
 
-		ret = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
+		ret = drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_phy, link_status);
 		if (ret)
 			return ret;
 
@@ -1248,7 +1276,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 		}
 
 		msm_dp_link_adjust_levels(ctrl->link, link_status);
-		ret = msm_dp_ctrl_update_vx_px(ctrl);
+		ret = msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
 		if (ret)
 			return ret;
 
@@ -1257,9 +1285,32 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	return -ETIMEDOUT;
 }
 
+static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
+				      int *training_step, enum drm_dp_phy dp_phy)
+{
+	int ret;
+
+	ret = msm_dp_ctrl_link_train_1(ctrl, training_step, dp_phy);
+	if (ret) {
+		DRM_ERROR("link training #1 on phy %d failed. ret=%d\n", dp_phy, ret);
+		return ret;
+	}
+	drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d successful\n", dp_phy);
+
+	ret = msm_dp_ctrl_link_train_2(ctrl, training_step, dp_phy);
+	if (ret) {
+		DRM_ERROR("link training #2 on phy %d failed. ret=%d\n", dp_phy, ret);
+		return ret;
+	}
+	drm_dbg_dp(ctrl->drm_dev, "link training #2 on phy %d successful\n", dp_phy);
+
+	return 0;
+}
+
 static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 			int *training_step)
 {
+	int i;
 	int ret = 0;
 	const u8 *dpcd = ctrl->panel->dpcd;
 	u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
@@ -1272,8 +1323,6 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	link_info.rate = ctrl->link->link_params.rate;
 	link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
 
-	msm_dp_link_reset_phy_params_vx_px(ctrl->link);
-
 	msm_dp_aux_link_configure(ctrl->aux, &link_info);
 
 	if (drm_dp_max_downspread(dpcd))
@@ -1288,24 +1337,27 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 				&assr, 1);
 	}
 
-	ret = msm_dp_ctrl_link_train_1(ctrl, training_step);
+	for (i = ctrl->link->lttpr_count - 1; i >= 0; i--) {
+		enum drm_dp_phy dp_phy = DP_PHY_LTTPR(i);
+
+		ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, dp_phy);
+		msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
+
+		if (ret)
+			break;
+	}
+
 	if (ret) {
-		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
+		DRM_ERROR("link training of LTTPR(s) failed. ret=%d\n", ret);
 		goto end;
 	}
 
-	/* print success info as this is a result of user initiated action */
-	drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
-
-	ret = msm_dp_ctrl_link_train_2(ctrl, training_step);
+	ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DPRX);
 	if (ret) {
-		DRM_ERROR("link training #2 failed. ret=%d\n", ret);
+		DRM_ERROR("link training on sink failed. ret=%d\n", ret);
 		goto end;
 	}
 
-	/* print success info as this is a result of user initiated action */
-	drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
-
 end:
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
@@ -1622,7 +1674,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 	if (ret)
 		goto end;
 
-	msm_dp_ctrl_clear_training_pattern(ctrl);
+	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
 
@@ -1646,7 +1698,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 		return false;
 	}
 	msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
-	msm_dp_ctrl_update_vx_px(ctrl);
+	msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
 	msm_dp_link_send_test_response(ctrl->link);
 
 	pattern_sent = msm_dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
@@ -1888,7 +1940,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			}
 
 			/* stop link training before start re training  */
-			msm_dp_ctrl_clear_training_pattern(ctrl);
+			msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 		}
 
 		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl);
@@ -1912,7 +1964,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 		 * link training failed
 		 * end txing train pattern here
 		 */
-		msm_dp_ctrl_clear_training_pattern(ctrl);
+		msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
 		msm_dp_ctrl_deinitialize_mainlink(ctrl);
 		rc = -ECONNRESET;
@@ -1983,7 +2035,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		msm_dp_ctrl_link_retrain(ctrl);
 
 	/* stop txing train pattern to end link training */
-	msm_dp_ctrl_clear_training_pattern(ctrl);
+	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
 	/*
 	 * Set up transfer unit values and set controller state to send
-- 
2.45.2

