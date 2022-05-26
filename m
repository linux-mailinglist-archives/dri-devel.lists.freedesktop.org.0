Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C2E53564E
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 01:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FA310E603;
	Thu, 26 May 2022 23:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3ED10E603;
 Thu, 26 May 2022 23:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653606566; x=1685142566;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Eu1TB8lO4RI0dmN05S+4d62yQlVMgFzQS6LVRnYCMCk=;
 b=Dhpfn3gVlKDIXcFHBFjrWAo2Mip/xxv8xPC3Y3oPlXcSg94Hzo4eho4I
 WmoHcoiJGKfq4SGlxU4CixEW5SY0NV+Fo5yGnCmDt8wBnKLzDouMk9O2d
 Zt9zzQcjWyr9WpFqHeSzAyKB+9XiX97iGcnbEC0Rq+m0jAVx7h4P6F8VS A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 26 May 2022 16:09:25 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 16:09:24 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 26 May 2022 16:09:24 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 26 May 2022 16:09:23 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v2] drm/msm/dp: force link training for display resolution
 change
Date: Thu, 26 May 2022 16:09:15 -0700
Message-ID: <1653606555-18675-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During display resolution changes display have to be disabled first
followed by display enable with new resolution. This patch force
main link always be retrained during display enable procedure to
simplify implementation instead of manually kicking of irq_hpd
handle.

Changes in v2:
-- set force_link_train flag on DP only (is_edp == false)

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  6 +++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index af7a80c..ac226f5 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1551,7 +1551,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 
 	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
 	if (!ret)
-		ret = dp_ctrl_on_stream(&ctrl->dp_ctrl);
+		ret = dp_ctrl_on_stream(&ctrl->dp_ctrl, false);
 	else
 		DRM_ERROR("failed to enable DP link controller\n");
 
@@ -1807,7 +1807,7 @@ static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
 	return dp_ctrl_setup_main_link(ctrl, &training_step);
 }
 
-int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
+int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -1848,7 +1848,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 		return 0;
 	}
 
-	if (!dp_ctrl_channel_eq_ok(ctrl))
+	if (force_link_tarin || !dp_ctrl_channel_eq_ok(ctrl))
 		dp_ctrl_link_retrain(ctrl);
 
 	/* stop txing train pattern to end link training */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 0745fde..b563e2e 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -21,7 +21,7 @@ struct dp_ctrl {
 };
 
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
-int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
+int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
 int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c388323..370348d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -872,7 +872,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	rc = dp_ctrl_on_stream(dp->ctrl);
+	rc = dp_ctrl_on_stream(dp->ctrl, data);
 	if (!rc)
 		dp_display->power_on = true;
 
@@ -1654,6 +1654,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	int rc = 0;
 	struct dp_display_private *dp_display;
 	u32 state;
+	bool force_link_train = false;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 	if (!dp_display->dp_mode.drm_mode.clock) {
@@ -1688,10 +1689,14 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 
 	state =  dp_display->hpd_state;
 
-	if (state == ST_DISPLAY_OFF)
+	if (state == ST_DISPLAY_OFF) {
 		dp_display_host_phy_init(dp_display);
 
-	dp_display_enable(dp_display, 0);
+		if (!dp->is_edp)
+			force_link_train = true;
+	}
+
+	dp_display_enable(dp_display, force_link_train);
 
 	rc = dp_display_post_enable(dp);
 	if (rc) {
@@ -1700,10 +1705,6 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 		dp_display_unprepare(dp);
 	}
 
-	/* manual kick off plug event to train link */
-	if (state == ST_DISPLAY_OFF)
-		dp_add_event(dp_display, EV_IRQ_HPD_INT, 0, 0);
-
 	/* completed connection */
 	dp_display->hpd_state = ST_CONNECTED;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

