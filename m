Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C652E057
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 01:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836D710E998;
	Thu, 19 May 2022 23:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5F510EE08;
 Thu, 19 May 2022 23:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653001917; x=1684537917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ERbn40i4E+97W8JEG92Nq+eQzXedvo4gIO3584AzFj8=;
 b=ikw/rduAAhAdKOjtrRJeRhrg0VR3CCK1ohcDZcjwn9tw9DIZwURsrYuc
 SebCPZrLuPucUCgCKh2upvJHsYCXB3EQ5QocbYqBLncXk2Ng/DFzG+2Dw
 RyYfjsNCr1Mdn6mZFq79/Q/wOybZgtIOmfZNXxU61DQjxU6LAiC4znzUz A=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 19 May 2022 16:11:56 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 16:11:55 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 19 May 2022 16:11:55 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 19 May 2022 16:11:54 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v6 1/3] phy: qcom-edp: add regulator_set_load to edp phy
Date: Thu, 19 May 2022 16:11:40 -0700
Message-ID: <1653001902-26910-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653001902-26910-1-git-send-email-quic_khsieh@quicinc.com>
References: <1653001902-26910-1-git-send-email-quic_khsieh@quicinc.com>
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

This patch add regulator_set_load() before enable regulator at
eDP phy driver.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index cacd32f..78b7306 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -87,14 +87,19 @@ struct qcom_edp {
 
 	struct clk_bulk_data clks[2];
 	struct regulator_bulk_data supplies[2];
+	int enable_load[2];
 };
 
 static int qcom_edp_phy_init(struct phy *phy)
 {
 	struct qcom_edp *edp = phy_get_drvdata(phy);
 	int ret;
+	int i;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
+	for (i = 0; i < 2; i++)
+		regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
+
+	ret = regulator_bulk_enable(2, edp->supplies);
 	if (ret)
 		return ret;
 
@@ -635,6 +640,8 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
 
 	edp->supplies[0].supply = "vdda-phy";
 	edp->supplies[1].supply = "vdda-pll";
+	edp->enable_load[0] = 21800;	/* load for 1.2 V vdda-phy supply */
+	edp->enable_load[1] = 36000;	/* load for 0.9 V vdda-pll supply */
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
 	if (ret)
 		return ret;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

