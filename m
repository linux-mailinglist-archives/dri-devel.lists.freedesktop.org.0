Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C174BA85C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 19:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639EE10E6A3;
	Thu, 17 Feb 2022 18:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5D010E69A;
 Thu, 17 Feb 2022 18:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645122946; x=1676658946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=sEmE1WZUmqWjwfocPA6SyYXNPkOmoqNqw4Foo23Ps54=;
 b=kz3G2Fj2eHV18RdZ6YVWsItvTfsrkbeCuZYzKNXjXG1v4Q0sa+xCQf4R
 ZhIEWbltIX26ZIUd4O/j8oD01Kr46PRYuKW00YjtvkryulcAcZcQWj3Tk
 UZwSLdXM++K4AJmFgyKESYUCymIDxPWI1o3YMdvJtSGEt3Lssoafk7Qar c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 17 Feb 2022 10:35:45 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 10:35:45 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 17 Feb 2022 10:35:44 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 17 Feb 2022 10:35:43 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v4 2/3] drm/msm/dp: enhance debug info related to dp phy
Date: Thu, 17 Feb 2022 10:35:29 -0800
Message-ID: <1645122930-23863-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645122930-23863-1-git-send-email-quic_khsieh@quicinc.com>
References: <1645122930-23863-1-git-send-email-quic_khsieh@quicinc.com>
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
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP phy should be initialized and exited symmetrically to avoid
clock being stucked at either on or off error. Add debug info
to cover all DP phy to identify clock issues easily.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 245e1b9..dcd0126 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1396,6 +1396,8 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
+	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
+			phy, phy->init_count, phy->power_count);
 }
 
 void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
@@ -1410,6 +1412,8 @@ void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_exit(phy);
+	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
+			phy, phy->init_count, phy->power_count);
 }
 
 static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
@@ -1484,6 +1488,8 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	phy_exit(phy);
 	phy_init(phy);
 
+	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
+			phy, phy->init_count, phy->power_count);
 	return 0;
 }
 
@@ -1895,14 +1901,12 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 
 	phy_power_off(phy);
 
-	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
-		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
-
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
 
-	DRM_DEBUG_DP("DP off link/stream done\n");
+	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
+			phy, phy->init_count, phy->power_count);
 	return ret;
 }
 
@@ -1933,13 +1937,9 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 	}
 
-	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
-		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
-
 	phy_power_off(phy);
-
-	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
-		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
+	DRM_DEBUG_DP("phy=%p init=%d power_on=%d\n",
+			phy, phy->init_count, phy->power_count);
 
 	return ret;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

