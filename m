Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D65552C59F
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 23:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D32E113ED4;
	Wed, 18 May 2022 21:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E59113E91;
 Wed, 18 May 2022 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652909811; x=1684445811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Rc4W+0c0j6GG4qhGAFHBxATve5Nhu1jI/NrmHYw5zd8=;
 b=X/UYccHvUOfQnUy/sBEpU6QcnTgXboIj0UkKl5y4YeoUBfLbj0IEjlox
 kSZt89ZYgdvfzr7Os7ng9JoYB24r/gGsGzzw4oqJuu95aA3NqRDjsg5E4
 0YTu414a1Jhm++1zzfScJBiE3d0YbaOhh2sRhmpe3UrqaJZ3xwhNlUmY/ U=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 18 May 2022 14:36:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 14:36:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 18 May 2022 14:36:50 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 18 May 2022 14:36:49 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v4 3/3] drm/msm/dp: delete vdda regulator related functions
 from eDP/DP controller
Date: Wed, 18 May 2022 14:36:30 -0700
Message-ID: <1652909790-16245-4-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652909790-16245-1-git-send-email-quic_khsieh@quicinc.com>
References: <1652909790-16245-1-git-send-email-quic_khsieh@quicinc.com>
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

Vdda regulators are related to both eDP and DP phy so that it should be
managed at eDP and DP phy driver instead of controller. This patch removes
vdda regulators related functions out of eDP/DP controller.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 14 ------
 drivers/gpu/drm/msm/dp/dp_parser.h |  6 ---
 drivers/gpu/drm/msm/dp/dp_power.c  | 95 +-------------------------------------
 3 files changed, 2 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 8f9fed9..4ef2130 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -22,14 +22,6 @@
 #define DP_DEFAULT_P0_OFFSET	0x1000
 #define DP_DEFAULT_P0_SIZE	0x0400
 
-static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
-	.num = 2,
-	.regs = {
-		{"vdda-1p2", 21800, 4 },	/* 1.2 V */
-		{"vdda-0p9", 36000, 32 },	/* 0.9 V */
-	},
-};
-
 static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
@@ -298,12 +290,6 @@ static int dp_parser_parse(struct dp_parser *parser)
 	if (rc)
 		return rc;
 
-	/* Map the corresponding regulator information according to
-	 * version. Currently, since we only have one supported platform,
-	 * mapping the regulator directly.
-	 */
-	parser->regulator_cfg = &sdm845_dp_reg_cfg;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 3a4d797..b56b4d7 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -101,11 +101,6 @@ struct dp_reg_entry {
 	int disable_load;
 };
 
-struct dp_regulator_cfg {
-	int num;
-	struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];
-};
-
 /**
  * struct dp_parser - DP parser's data exposed to clients
  *
@@ -121,7 +116,6 @@ struct dp_parser {
 	struct dp_pinctrl pinctrl;
 	struct dp_io io;
 	struct dp_display_data disp_data;
-	const struct dp_regulator_cfg *regulator_cfg;
 	u32 max_dp_lanes;
 	struct drm_bridge *next_bridge;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index d9e0117..b52ac1d 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -20,82 +20,10 @@ struct dp_power_private {
 	struct clk *link_clk_src;
 	struct clk *pixel_provider;
 	struct clk *link_provider;
-	struct regulator_bulk_data supplies[DP_DEV_REGULATOR_MAX];
 
 	struct dp_power dp_power;
 };
 
-static void dp_power_regulator_disable(struct dp_power_private *power)
-{
-	struct regulator_bulk_data *s = power->supplies;
-	const struct dp_reg_entry *regs = power->parser->regulator_cfg->regs;
-	int num = power->parser->regulator_cfg->num;
-	int i;
-
-	DBG("");
-	for (i = num - 1; i >= 0; i--)
-		if (regs[i].disable_load >= 0)
-			regulator_set_load(s[i].consumer,
-					   regs[i].disable_load);
-
-	regulator_bulk_disable(num, s);
-}
-
-static int dp_power_regulator_enable(struct dp_power_private *power)
-{
-	struct regulator_bulk_data *s = power->supplies;
-	const struct dp_reg_entry *regs = power->parser->regulator_cfg->regs;
-	int num = power->parser->regulator_cfg->num;
-	int ret, i;
-
-	DBG("");
-	for (i = 0; i < num; i++) {
-		if (regs[i].enable_load >= 0) {
-			ret = regulator_set_load(s[i].consumer,
-						 regs[i].enable_load);
-			if (ret < 0) {
-				pr_err("regulator %d set op mode failed, %d\n",
-					i, ret);
-				goto fail;
-			}
-		}
-	}
-
-	ret = regulator_bulk_enable(num, s);
-	if (ret < 0) {
-		pr_err("regulator enable failed, %d\n", ret);
-		goto fail;
-	}
-
-	return 0;
-
-fail:
-	for (i--; i >= 0; i--)
-		regulator_set_load(s[i].consumer, regs[i].disable_load);
-	return ret;
-}
-
-static int dp_power_regulator_init(struct dp_power_private *power)
-{
-	struct regulator_bulk_data *s = power->supplies;
-	const struct dp_reg_entry *regs = power->parser->regulator_cfg->regs;
-	struct platform_device *pdev = power->pdev;
-	int num = power->parser->regulator_cfg->num;
-	int i, ret;
-
-	for (i = 0; i < num; i++)
-		s[i].supply = regs[i].name;
-
-	ret = devm_regulator_bulk_get(&pdev->dev, num, s);
-	if (ret < 0) {
-		pr_err("%s: failed to init regulator, ret=%d\n",
-						__func__, ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int dp_power_clk_init(struct dp_power_private *power)
 {
 	int rc = 0;
@@ -318,21 +246,10 @@ int dp_power_client_init(struct dp_power *dp_power)
 
 	pm_runtime_enable(&power->pdev->dev);
 
-	rc = dp_power_regulator_init(power);
-	if (rc) {
-		DRM_ERROR("failed to init regulators %d\n", rc);
-		goto error;
-	}
-
 	rc = dp_power_clk_init(power);
-	if (rc) {
+	if (rc)
 		DRM_ERROR("failed to init clocks %d\n", rc);
-		goto error;
-	}
-	return 0;
 
-error:
-	pm_runtime_disable(&power->pdev->dev);
 	return rc;
 }
 
@@ -365,22 +282,15 @@ int dp_power_init(struct dp_power *dp_power, bool flip)
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
 	pm_runtime_get_sync(&power->pdev->dev);
-	rc = dp_power_regulator_enable(power);
-	if (rc) {
-		DRM_ERROR("failed to enable regulators, %d\n", rc);
-		goto exit;
-	}
 
 	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
 	if (rc) {
 		DRM_ERROR("failed to enable DP core clocks, %d\n", rc);
-		goto err_clk;
+		goto exit;
 	}
 
 	return 0;
 
-err_clk:
-	dp_power_regulator_disable(power);
 exit:
 	pm_runtime_put_sync(&power->pdev->dev);
 	return rc;
@@ -393,7 +303,6 @@ int dp_power_deinit(struct dp_power *dp_power)
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
 	dp_power_clk_enable(dp_power, DP_CORE_PM, false);
-	dp_power_regulator_disable(power);
 	pm_runtime_put_sync(&power->pdev->dev);
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

