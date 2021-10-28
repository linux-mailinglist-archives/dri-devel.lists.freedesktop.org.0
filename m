Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D37643DC28
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 09:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D276E921;
	Thu, 28 Oct 2021 07:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91E46E5AB;
 Thu, 28 Oct 2021 02:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635386487; x=1666922487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=2w+3dbaIJvKI6UZBYIHQTP+MHLtDal/bltQL0fKnLvE=;
 b=YPnxAxnM4ERkZ4a6qSnwIpZXQ8uoJfkqVkqXThsWphpMZul6bYqiTBax
 2rLKwME+HsZIJY7o9TlsDbW9vg4kqlFwptTb7Zg/rIT4yF09rlDTu29Xr
 CSJuR/zwYjJZOw3BeowpslUJoGepzTiAPAaTKA7yIX14kUF1kFj3BPt+l g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Oct 2021 18:55:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 18:55:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 27 Oct 2021 18:55:22 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 27 Oct 2021 18:55:17 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: Sankeerth Billakanti <quic_sbillaka@quicinc.com>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>, <kalyan_t@codeaurora.org>,
 <abhinavk@codeaurora.org>, <dianders@chromium.org>, <khsieh@codeaurora.org>,
 <mkrishn@codeaurora.org>, <sbillaka@codeaurora.org>
Subject: [PATCH v3 2/6] drm/msm/dp: Add DP controllers for sc7280
Date: Thu, 28 Oct 2021 07:24:44 +0530
Message-ID: <1635386088-18089-3-git-send-email-quic_sbillaka@quicinc.com>
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

The eDP controller on SC7280 is similar to the eDP/DP controllers
supported by the current driver implementation.

SC7280 supports one EDP and one DP controller which can operate
concurrently.

This change adds the support for eDP and DP controller on sc7280.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

changes in v3:
    - Split into patches according to function (Dmitry Baryshkov)
    - Use DP_CONTROLLER_1 for eDP controller intf (Dmitry Baryshkov)
    - Use DP_CONTROLLER_0 for sc7280-dp (Dmitry Baryshkov)
    - Add macro in drm_helper.h for checking ssc capability (Stephen Boyd)
    - Use existing macro to check assr capability (Stephen Boyd)
    - Add comment for HPD_INIT_SETUP delay (Stephen Boyd)

changes in v2:
    - Don't initialize variables to 0 (Stephen Boyd)
    - Use const for read-only dpcd (Stephen Boyd)
    - Remove zero pixel clock check (Stephen Boyd)
    - Sort compatible strings alphabetically (Stephen Boyd)
    - Use pwm_bl.c for backlight instead of gpio (Stephen Boyd)
    - Change return type for functions returning always 0 (Matthias Kaehlcke)
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/dp/dp_display.c            | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ce6f32a..2b4dc9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -856,9 +856,9 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 };
 
 static const struct dpu_intf_cfg sc7280_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
-	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_EDP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
+	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
 };
 
 /*************************************************************
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aba8aa4..61385d6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -135,8 +135,17 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_descs = 1,
 };
 
+static const struct msm_dp_config sc7280_dp_cfg = {
+	.descs = (const struct msm_dp_desc[]) {
+		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP },
+	},
+	.num_descs = 2,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
+	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
 	{}
 };
 
-- 
2.7.4

