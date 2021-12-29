Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82204481603
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 19:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B8710E24C;
	Wed, 29 Dec 2021 18:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4373710E24A;
 Wed, 29 Dec 2021 18:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640801770; x=1672337770;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=nKCGZC1i14SkhxDK6T+Y972E1r0o8n/KfzGBlXfse4M=;
 b=siL/IO1KGGglqIFcU5079w4aG4g9MZgdqLH9IF4zAEA13nl8RXSPVLvi
 Lxe/YRLiK5oYwICjZOJAzHkGxBveUc/oAfog0zZW+gKSlHkPcPvloFAjX
 cUre66K5hQh54cOVK3BX5lS26xfDnsqDYYShi6j8R+vRJlQ+PwlolKyI9 8=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 29 Dec 2021 10:16:09 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2021 10:15:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 29 Dec 2021 10:15:53 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 29 Dec 2021 10:15:52 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v2] drm/msm/dp: add support of tps4 (training pattern 4) for
 HBR3
Date: Wed, 29 Dec 2021 10:15:45 -0800
Message-ID: <1640801745-16234-1-git-send-email-quic_khsieh@quicinc.com>
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
 quic_khsieh@quicinc.com, Kuogee Hsieh <khsieh@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kuogee Hsieh <khsieh@codeaurora.org>

Some DP sinkers prefer to use tps4 instead of tps3 during training #2.
This patch will use tps4 to perform link training #2 if sinker's DPCD
supports it.

Changes in V2:
-- replace  dp_catalog_ctrl_set_pattern() with  dp_catalog_ctrl_set_pattern_state_bit()

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 12 ++++++------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 ++++++++++++++-----
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 6ae9b29..64f0b26 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -456,19 +456,19 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 	dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
 }
 
-int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
-					u32 pattern)
+int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
+					u32 state_bit)
 {
 	int bit, ret;
 	u32 data;
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	bit = BIT(pattern - 1);
-	DRM_DEBUG_DP("hw: bit=%d train=%d\n", bit, pattern);
+	bit = BIT(state_bit - 1);
+	DRM_DEBUG_DP("hw: bit=%d train=%d\n", bit, state_bit);
 	dp_catalog_ctrl_state_ctrl(dp_catalog, bit);
 
-	bit = BIT(pattern - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
+	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
 
 	/* Poll for mainlink ready status */
 	ret = readx_poll_timeout(readl, catalog->io->dp_controller.link.base +
@@ -476,7 +476,7 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
 					data, data & bit,
 					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
 	if (ret < 0) {
-		DRM_ERROR("set pattern for link_train=%d failed\n", pattern);
+		DRM_ERROR("set state_bit for link_train=%d failed\n", state_bit);
 		return ret;
 	}
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6965afa..7dea101 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -94,7 +94,7 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool fixed_nvid);
-int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog, u32 pattern);
+int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog, u32 pattern);
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
 bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 39558a2..da6c083 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1078,12 +1078,13 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
 	int tries, old_v_level, ret = 0;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	int const maximum_retries = 4;
+	char state_ctrl_bit = 1;
 
 	dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
 	*training_step = DP_TRAINING_1;
 
-	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, DP_TRAINING_PATTERN_1);
+	ret = dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
 	if (ret)
 		return ret;
 	dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
@@ -1181,7 +1182,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 			int *training_step)
 {
 	int tries = 0, ret = 0;
-	char pattern;
+	char pattern, state_ctrl_bit;
 	int const maximum_retries = 5;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 
@@ -1189,12 +1190,20 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 
 	*training_step = DP_TRAINING_2;
 
-	if (drm_dp_tps3_supported(ctrl->panel->dpcd))
+	if (drm_dp_tps4_supported(ctrl->panel->dpcd)) {
+		pattern = DP_TRAINING_PATTERN_4;
+		state_ctrl_bit = 4;
+	}
+	else if (drm_dp_tps3_supported(ctrl->panel->dpcd)) {
 		pattern = DP_TRAINING_PATTERN_3;
-	else
+		state_ctrl_bit = 3;
+	}
+	else {
 		pattern = DP_TRAINING_PATTERN_2;
+		state_ctrl_bit = 2;
+	}
 
-	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, pattern);
+	ret = dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
 	if (ret)
 		return ret;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

