Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EC0492DC1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 19:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62C310E4E3;
	Tue, 18 Jan 2022 18:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF15E10E43D;
 Tue, 18 Jan 2022 18:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642531669; x=1674067669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=pfoQ5BboI4iWma110GILo0a/QjTbyn8jZoAt2MIZDP8=;
 b=itsVZqY4NznjraRjlV+sw28MWH5eVJ5GC0YsFudh/AF5785Q8kNZTKVH
 9tBMZ0J861HW+k6jxkMi2f26YtW5Pa1YFKmVScLmk55UXSMo+BVw9VyaZ
 7uhDiapJWcFXpG/2KMX6OFq+Ueg+0h0KrIhlrh/a8tCWQwXZz3wWGAWCq U=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 18 Jan 2022 10:47:48 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 10:47:47 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 18 Jan 2022 10:47:47 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 18 Jan 2022 10:47:46 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v18 3/4] drm/msm/dp: add support of tps4 (training pattern 4)
 for HBR3
Date: Tue, 18 Jan 2022 10:47:27 -0800
Message-ID: <1642531648-8448-4-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642531648-8448-1-git-send-email-quic_khsieh@quicinc.com>
References: <1642531648-8448-1-git-send-email-quic_khsieh@quicinc.com>
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
 quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
 Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kuogee Hsieh <khsieh@codeaurora.org>

Some DP sinkers prefer to use tps4 instead of tps3 during training #2.
This patch will use tps4 to perform link training #2 if sinker's DPCD
supports it.

Changes in V2:
-- replace  dp_catalog_ctrl_set_pattern() with  dp_catalog_ctrl_set_pattern_state_bit()

Changes in V3:
-- change state_ctrl_bits type to u32 and pattern type to u8

Changes in V4:
-- align } else if { and } else {

Changes in v10:
--  group into one series

Changes in v11:
-- drop drm/msm/dp: dp_link_parse_sink_count() return immediately if aux read

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 12 ++++++------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 17 ++++++++++++-----
 3 files changed, 19 insertions(+), 12 deletions(-)

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
index 9c80b49..f98df93 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1083,7 +1083,7 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
 
 	*training_step = DP_TRAINING_1;
 
-	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, DP_TRAINING_PATTERN_1);
+	ret = dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, 1);
 	if (ret)
 		return ret;
 	dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
@@ -1181,7 +1181,8 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 			int *training_step)
 {
 	int tries = 0, ret = 0;
-	char pattern;
+	u8 pattern;
+	u32 state_ctrl_bit;
 	int const maximum_retries = 5;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 
@@ -1189,12 +1190,18 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 
 	*training_step = DP_TRAINING_2;
 
-	if (drm_dp_tps3_supported(ctrl->panel->dpcd))
+	if (drm_dp_tps4_supported(ctrl->panel->dpcd)) {
+		pattern = DP_TRAINING_PATTERN_4;
+		state_ctrl_bit = 4;
+	} else if (drm_dp_tps3_supported(ctrl->panel->dpcd)) {
 		pattern = DP_TRAINING_PATTERN_3;
-	else
+		state_ctrl_bit = 3;
+	} else {
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

