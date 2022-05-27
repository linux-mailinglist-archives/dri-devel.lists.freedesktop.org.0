Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5261B5365B1
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 18:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E2510FD57;
	Fri, 27 May 2022 16:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D44010FA7F;
 Fri, 27 May 2022 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653667707; x=1685203707;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=7LWKa5uK/HBcrdAGPDiw0XsZaR+hzoSnR4DiYW1nRCw=;
 b=hcCmrV6bueZimr0FCSdXRjVklgTaHyB36aZNvDS6DmJMY6sUAe/nZI8Q
 SR63t3UTG/M0ywlyk/Y38q7ITvf/jGBu8dBufaynTrLOYIjLrjzmzzZo9
 aDF/H1pVd+5w1A9taQkljWjzzbByYAGa+Qb42zWHJEnlbmBk7kS+A/0g3 g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 27 May 2022 09:08:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 09:08:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 27 May 2022 09:08:25 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 27 May 2022 09:08:24 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v3] drm/msm/dp: force link training for display resolution
 change
Date: Fri, 27 May 2022 09:08:16 -0700
Message-ID: <1653667696-25560-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
followed by display enabling with new resolution. At current
implementation, display enable function manually kicks up
irq_hpd_handle which will read panel link status and start link
training if link status is not in sync state. However, there is rare
case that panel links status stay in synch which cause link training
be skipped. Hence display resolution change failed. This patch force
main link always be retrained during display enable procedure to
prevent rare failed case from happening. Also this implementation
are more efficient than manual kicking off irq_hpd_handle function.

Changes in v2:
-- set force_link_train flag on DP only (is_edp == false)

Changes in v3:
-- revise commit  text
-- add Fixes tag

Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  6 +++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index af7a80c..bea93eb 100644
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
+	if (force_link_train || !dp_ctrl_channel_eq_ok(ctrl))
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

