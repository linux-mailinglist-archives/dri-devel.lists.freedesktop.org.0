Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C151061C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5753010E109;
	Tue, 26 Apr 2022 17:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2529910F1B9;
 Tue, 26 Apr 2022 17:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650995958; x=1682531958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=0w4vLNpWSM8gww0c0W8qx9hRDJaEnUPxl2y0z+xyygA=;
 b=SWYztX3+Hd4hHW4yhxxgVwTm4vD5B+mIyQpUIN+jYY8dbrX0Gdki0oZo
 6lTaF5dfFCDCqu3AqMdrx76NV1LDaokkwjXDLrAzEpMjOiXxqiFPnhrdY
 ZXqz/yEEaviMvNlbB6o3XDlknuUh3p2+1/axNILYr/vAjVAEoLDy73RQc A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 10:59:18 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:59:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 10:59:16 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 10:59:16 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v3 2/2] drm/msm/dp: do not stop transmitting phy test pattern
 during DP phy compliance test
Date: Tue, 26 Apr 2022 10:58:59 -0700
Message-ID: <1650995939-28467-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650995939-28467-1-git-send-email-quic_khsieh@quicinc.com>
References: <1650995939-28467-1-git-send-email-quic_khsieh@quicinc.com>
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
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At normal operation, transmit phy test pattern has to be terminated before
DP controller switch to video ready state. However during phy compliance
testing, transmit phy test pattern should not be terminated until end of
compliance test which usually indicated by unplugged interrupt.

Only stop sending the train pattern in dp_ctrl_on_stream() if we're not
doing compliance testing. We also no longer reset 'p_level' and
'v_level' within dp_ctrl_on_link() due to both 'p_level' and 'v_level'
are acquired from link status at previous dpcd read and we like to use
those level to start link training.

Changes in v2:
-- add more details commit text
-- correct Fixes

Changes in v3:
-- drop unnecessary braces

Fixes: 2e0adc765d88 ("drm/msm/dp: do not end dp link training until video is ready")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 193cc1a..08cc48a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1699,8 +1699,6 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		ctrl->link->link_params.rate,
 		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
 
-	ctrl->link->phy_params.p_level = 0;
-	ctrl->link->phy_params.v_level = 0;
 
 	rc = dp_ctrl_enable_mainlink_clocks(ctrl);
 	if (rc)
@@ -1822,12 +1820,6 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 		}
 	}
 
-	if (!dp_ctrl_channel_eq_ok(ctrl))
-		dp_ctrl_link_retrain(ctrl);
-
-	/* stop txing train pattern to end link training */
-	dp_ctrl_clear_training_pattern(ctrl);
-
 	ret = dp_ctrl_enable_stream_clocks(ctrl);
 	if (ret) {
 		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
@@ -1839,6 +1831,12 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 		return 0;
 	}
 
+	if (!dp_ctrl_channel_eq_ok(ctrl))
+		dp_ctrl_link_retrain(ctrl);
+
+	/* stop txing train pattern to end link training */
+	dp_ctrl_clear_training_pattern(ctrl);
+
 	/*
 	 * Set up transfer unit values and set controller state to send
 	 * video.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

