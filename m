Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ED648A140
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 21:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DD210E64F;
	Mon, 10 Jan 2022 20:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF2710E64F;
 Mon, 10 Jan 2022 20:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1641848190; x=1673384190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=rPI9+4W9MEMrQmP0+FkgmDWaxmtT4g093MVJF1yVLtc=;
 b=iPjX1Voq5eYfya0cIVICaTYXxXPnfUPoYNFk3LYxiyJKB5r4HCl1jMeb
 RNpgGwVJx9ud2PekF8HNVsn5Tg7ldt7i6q+rjof+s6xsWP1/xuUa24SlK
 4XqCCyPcD4WonTbca2SfWeRiYTQzPctZYx6fUNCPtstUfNzMknY73mxql Q=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Jan 2022 12:56:29 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 12:56:28 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 10 Jan 2022 12:56:28 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 10 Jan 2022 12:56:27 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v10 1/5] drm/msm/dp: dp_link_parse_sink_count() return
 immediately if aux read failed
Date: Mon, 10 Jan 2022 12:55:40 -0800
Message-ID: <1641848144-25147-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641848144-25147-1-git-send-email-quic_khsieh@quicinc.com>
References: <1641848144-25147-1-git-send-email-quic_khsieh@quicinc.com>
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
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add checking aux read/write status at both dp_link_parse_sink_count()
and dp_link_parse_sink_status_filed() to avoid long timeout delay if
dp aux read/write failed at timeout due to cable unplugged. Also make
sure dp controller had been initialized before start dpcd read and write.

Changes in V4:
-- split this patch as stand alone patch

Changes in v5:
-- rebase on msm-next branch

Changes in v6:
-- add more details commit text

Changes in v10:
--  group into one series

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 12 +++++++++---
 drivers/gpu/drm/msm/dp/dp_link.c    | 19 ++++++++++++++-----
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3d61459..0766752 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -692,9 +692,15 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
-	if (ret == -ECONNRESET) { /* cable unplugged */
-		dp->core_initialized = false;
+	/*
+	 * dp core (ahb/aux clks) must be initialized before
+	 * irq_hpd be handled
+	 */
+	if (dp->core_initialized) {
+		ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
+		if (ret == -ECONNRESET) { /* cable unplugged */
+			dp->core_initialized = false;
+		}
 	}
 	DRM_DEBUG_DP("hpd_state=%d\n", state);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index a5bdfc5..d4d31e5 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -737,18 +737,25 @@ static int dp_link_parse_sink_count(struct dp_link *dp_link)
 	return 0;
 }
 
-static void dp_link_parse_sink_status_field(struct dp_link_private *link)
+static int dp_link_parse_sink_status_field(struct dp_link_private *link)
 {
 	int len = 0;
 
 	link->prev_sink_count = link->dp_link.sink_count;
-	dp_link_parse_sink_count(&link->dp_link);
+	len = dp_link_parse_sink_count(&link->dp_link);
+	if (len < 0) {
+		DRM_ERROR("DP parse sink count failed\n");
+		return len;
+	}
 
 	len = drm_dp_dpcd_read_link_status(link->aux,
 		link->link_status);
-	if (len < DP_LINK_STATUS_SIZE)
+	if (len < DP_LINK_STATUS_SIZE) {
 		DRM_ERROR("DP link status read failed\n");
-	dp_link_parse_request(link);
+		return len;
+	}
+
+	return dp_link_parse_request(link);
 }
 
 /**
@@ -1023,7 +1030,9 @@ int dp_link_process_request(struct dp_link *dp_link)
 
 	dp_link_reset_data(link);
 
-	dp_link_parse_sink_status_field(link);
+	ret = dp_link_parse_sink_status_field(link);
+	if (ret)
+		return ret;
 
 	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
 		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

