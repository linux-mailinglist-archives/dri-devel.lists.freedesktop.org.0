Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD99343DC29
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 09:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF766E922;
	Thu, 28 Oct 2021 07:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F44D6E5AB;
 Thu, 28 Oct 2021 02:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635386509; x=1666922509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=lMD3kYWOFV+pivVI9FG3pMqNQ7yrz03GZ9yD9lYfO+U=;
 b=svsEXAPNfU945MTHkKyvN7YsqtgyRKKwVr2UMhtDpdCIe8dkun18TgAY
 MLHvt+mkMJzQGqi9mby45HTQzLKxwYVM0a1ip+g10sjfzyMxb99bsRheJ
 YNc+dTWNkH1jugXr9K66/ln9Z5v/G19sKajmp/PVh7JEUUVDYgJJR0uu0 w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Oct 2021 18:55:45 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 18:55:44 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 27 Oct 2021 18:55:44 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 27 Oct 2021 18:55:40 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: Sankeerth Billakanti <quic_sbillaka@quicinc.com>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>, <kalyan_t@codeaurora.org>,
 <abhinavk@codeaurora.org>, <dianders@chromium.org>, <khsieh@codeaurora.org>,
 <mkrishn@codeaurora.org>, <sbillaka@codeaurora.org>
Subject: [PATCH v3 5/6] drm/msm/dp: Enable ASSR for supported DP sinks
Date: Thu, 28 Oct 2021 07:24:47 +0530
Message-ID: <1635386088-18089-6-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Thu, 28 Oct 2021 07:35:12 +0000
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

The eDP sink on sc7280 supports ASSR and dp driver will
enable ASSR in the source hardware. The driver needs to
enable the ASSR field in the DPCD configuration register
to avoid screen corruption. This change will enable ASSR
if supported in the sink device.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a40e798..c724cb0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -119,13 +119,13 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
 static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 {
 	u32 config = 0, tbd;
-	u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = ctrl->panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
 
 	/* Scrambler reset enable */
-	if (dpcd[DP_EDP_CONFIGURATION_CAP] & DP_ALTERNATE_SCRAMBLER_RESET_CAP)
+	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
 		config |= DP_CONFIGURATION_CTRL_ASSR;
 
 	tbd = dp_link_get_test_bits_depth(ctrl->link,
@@ -1231,6 +1231,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 	const u8 *dpcd = ctrl->panel->dpcd;
 	u8 encoding = DP_SET_ANSI_8B10B;
 	u8 ssc;
+	u8 assr;
 	struct dp_link_info link_info = {0};
 
 	dp_ctrl_config_ctrl(ctrl);
@@ -1249,6 +1250,12 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
 				&encoding, 1);
 
+	if (drm_dp_alternate_scrambler_reset_cap(dpcd)) {
+		assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
+		drm_dp_dpcd_write(ctrl->aux, DP_EDP_CONFIGURATION_SET,
+				&assr, 1);
+	}
+
 	ret = dp_ctrl_link_train_1(ctrl, training_step);
 	if (ret) {
 		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
-- 
2.7.4

