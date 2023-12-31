Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF92820959
	for <lists+dri-devel@lfdr.de>; Sun, 31 Dec 2023 01:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7C010E106;
	Sun, 31 Dec 2023 00:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E3110E0E6
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Dec 2023 00:44:04 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50e68e93be1so7003082e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 16:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703983443; x=1704588243; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FDjngIAgyaNOEXPfDUMIuujOfmjvFlpOeLVhFSGQ3io=;
 b=Mg4e6+EwPJGVpvFALa+scZj1iI9bONnjdycjyNSn0JFapnSac+16SwyutsJZXxPKjh
 Y5/vI990+ZYNcdEc31tSawvo0Oo+VvmkCkd0EgHRhT+ClaA9xV0bUDA7jNgNO5cA6KHm
 nUrcPkzX+US4vUeiPa1H9tgztqjiuSracbaHZ/iw4TLLXIoXEkCn6EKoKKKL5frSSNc/
 qfPvlFYSgDLlVTSt43zM2fVA0B6+H3sUNs71fKPUbE8C/jyu1ISdgru6DXHpnoK3yhrZ
 g7aRNx1muc91rovDRpYWR1LYEWs47MoDH/ujKyEdYETLiFHPPAvGevNtBddT7w+WEn00
 bLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703983443; x=1704588243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDjngIAgyaNOEXPfDUMIuujOfmjvFlpOeLVhFSGQ3io=;
 b=GePjhilh1mw0j6S6E7HMTcR1LHrTAZvQNWaAhJ2O+KcHKlplo5HwbikX5rxkpRYGEJ
 TQIrbwnlLl4zcHP8CKaT71Cc4VWY/SKZuXeAtYSu4eUZ8ut66iPzsJFxsUr2wcTH0+VR
 GEEihEfTxjkH/hbOTj1wWADsTwBpnfykK3cbdyXLUPWam/pW3y+pH2PhlVZ4XB/F5kHu
 NJEF0/P7JkWpSEUaPtn52HeUePFLX1HG3BmRFGwls4m5u+VETmfgiIBVxoW7ly8arSWK
 CFkWskNJjWrgQrQbJAxxhBineYSHksb6uOSo1Ds3LgPnbddgafZfkIQFconKi48hZpRC
 2tpg==
X-Gm-Message-State: AOJu0YxJVPXQcm1wJBwPoYhem+z/yHJ1lHGV4x6EKaqU2CJbumc3jok9
 q0JtZ9HFtC/9eRw8B9ybNizU6UhPR5RJkg==
X-Google-Smtp-Source: AGHT+IG2Dmq005vFZQacVNihz3kjkXTIw6fEUE/vqK2TYzyt+fFrP8NiaBuS7lsgmWOsdDAjbmD8bg==
X-Received: by 2002:a05:6512:1109:b0:50e:76ca:8d28 with SMTP id
 l9-20020a056512110900b0050e76ca8d28mr4825016lfg.34.1703983442962; 
 Sat, 30 Dec 2023 16:44:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 16:44:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:55 +0200
Subject: [PATCH v2 08/15] drm/msm/dp: split dp_ctrl_clk_enable into four
 functuions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-8-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=15067;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CuOUcUYoOW9aEzG7k566U8KJoISzql09wErRpuOUKaE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlKDWR08VDjNPqcsHj2WrSBgWkR+IXxUx674
 BPw4rD6KeqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SgAKCRCLPIo+Aiko
 1dZpB/9dat5uBA0Spg0tVDJXyxWClaBN5J/ZM4mOIB5qnh+pmRjmX6tleUSYQcoeqCACFP2eq09
 ikE3xEo3QIs7mk2UpgOwdtlx15x/8nEHvhOpLWkYTYgV4mKJfGnXqLIEIn3V6BoZK4OvZuAxn12
 eK9ihmVb1k/2ZEAtPmmueRqSRYzSyevG+KbokiXyfCBJELNJZFwBRbNbN4F6f0YoXf65nKknG+H
 +XD/6NQYCs73KYLHyaPmiqQW962RvY/75xQs7lgmS+VqKO9Zt5sjXSZJZDsI9WbBAKge6Bcl3YQ
 OlndYqbUTvz/z0T3KElzOxImaQVjWhRKVRZaufolgIJzRR8L
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split the dp_ctrl_clk_enable() beast into four functions, each of them
doing just a single item: enabling or disabling core or link clocks.
This allows us to cleanup the dss_module_power structure and makes
several dp_ctrl functions return void.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 220 +++++++++++++++++-------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  16 +--
 drivers/gpu/drm/msm/dp/dp_display.c |   4 +-
 3 files changed, 108 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cfcf6136ffa6..e367eb8e5bea 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -69,11 +69,6 @@ struct dp_vc_tu_mapping_table {
 	u8 tu_size_minus1;
 };
 
-struct dss_module_power {
-	unsigned int num_clk;
-	struct clk_bulk_data *clocks;
-};
-
 struct dp_ctrl_private {
 	struct dp_ctrl dp_ctrl;
 	struct drm_device *drm_dev;
@@ -84,7 +79,12 @@ struct dp_ctrl_private {
 	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
-	struct dss_module_power mp[DP_MAX_PM];
+	unsigned int num_core_clks;
+	struct clk_bulk_data *core_clks;
+
+	unsigned int num_link_clks;
+	struct clk_bulk_data *link_clks;
+
 	struct clk *pixel_clk;
 
 	struct completion idle_comp;
@@ -96,15 +96,6 @@ struct dp_ctrl_private {
 	bool stream_clks_on;
 };
 
-static inline const char *dp_pm_name(enum dp_pm_type module)
-{
-	switch (module) {
-	case DP_CORE_PM:	return "DP_CORE_PM";
-	case DP_CTRL_PM:	return "DP_CTRL_PM";
-	default:		return "???";
-	}
-}
-
 static int dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct dp_link_info *link)
 {
@@ -1337,67 +1328,76 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 	return ret;
 }
 
-int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
-		       enum dp_pm_type pm_type, bool enable)
+int dp_ctrl_core_clk_enable(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dss_module_power *mp;
 	int ret = 0;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
-	if (pm_type != DP_CORE_PM &&
-	    pm_type != DP_CTRL_PM) {
-		DRM_ERROR("unsupported ctrl module: %s\n",
-			  dp_pm_name(pm_type));
-		return -EINVAL;
+	if (ctrl->core_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "core clks already enabled\n");
+		return 0;
 	}
 
-	if (enable) {
-		if (pm_type == DP_CORE_PM && ctrl->core_clks_on) {
-			drm_dbg_dp(ctrl->drm_dev,
-				   "core clks already enabled\n");
-			return 0;
-		}
+	ret = clk_bulk_prepare_enable(ctrl->num_core_clks, ctrl->core_clks);
+	if (ret)
+		return ret;
 
-		if (pm_type == DP_CTRL_PM && ctrl->link_clks_on) {
-			drm_dbg_dp(ctrl->drm_dev,
-				   "links clks already enabled\n");
-			return 0;
-		}
+	ctrl->core_clks_on = true;
 
-		if ((pm_type == DP_CTRL_PM) && (!ctrl->core_clks_on)) {
-			drm_dbg_dp(ctrl->drm_dev,
-				   "Enable core clks before link clks\n");
-			mp = &ctrl->mp[DP_CORE_PM];
+	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
+	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
+		   ctrl->stream_clks_on ? "on" : "off",
+		   ctrl->link_clks_on ? "on" : "off",
+		   ctrl->core_clks_on ? "on" : "off");
 
-			ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
-			if (ret)
-				return ret;
+	return 0;
+}
 
-			ctrl->core_clks_on = true;
-		}
+void dp_ctrl_core_clk_disable(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	clk_bulk_disable_unprepare(ctrl->num_core_clks, ctrl->core_clks);
+
+	ctrl->core_clks_on = false;
+
+	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
+	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
+		   ctrl->stream_clks_on ? "on" : "off",
+		   ctrl->link_clks_on ? "on" : "off",
+		   ctrl->core_clks_on ? "on" : "off");
+}
+
+static int dp_ctrl_link_clk_enable(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+	int ret = 0;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	if (ctrl->link_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "links clks already enabled\n");
+		return 0;
 	}
 
-	mp = &ctrl->mp[pm_type];
-	if (enable) {
-		ret = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
-		if (ret)
-			return ret;
-	} else {
-		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
+	if (!ctrl->core_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "Enable core clks before link clks\n");
+
+		dp_ctrl_core_clk_enable(dp_ctrl);
 	}
 
-	if (pm_type == DP_CORE_PM)
-		ctrl->core_clks_on = enable;
-	else
-		ctrl->link_clks_on = enable;
+	ret = clk_bulk_prepare_enable(ctrl->num_link_clks, ctrl->link_clks);
+	if (ret)
+		return ret;
 
-	drm_dbg_dp(ctrl->drm_dev, "%s clocks for %s\n",
-		   enable ? "enable" : "disable",
-		   dp_pm_name(pm_type));
-	drm_dbg_dp(ctrl->drm_dev,
-		   "stream_clks:%s link_clks:%s core_clks:%s\n",
+	ctrl->link_clks_on = true;
+
+	drm_dbg_dp(ctrl->drm_dev, "enale link clocks\n");
+	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
 		   ctrl->stream_clks_on ? "on" : "off",
 		   ctrl->link_clks_on ? "on" : "off",
 		   ctrl->core_clks_on ? "on" : "off");
@@ -1405,6 +1405,23 @@ int dp_ctrl_clk_enable(struct dp_ctrl *dp_ctrl,
 	return 0;
 }
 
+static void dp_ctrl_link_clk_disable(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	clk_bulk_disable_unprepare(ctrl->num_link_clks, ctrl->link_clks);
+
+	ctrl->link_clks_on = false;
+
+	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
+	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
+		   ctrl->stream_clks_on ? "on" : "off",
+		   ctrl->link_clks_on ? "on" : "off",
+		   ctrl->core_clks_on ? "on" : "off");
+}
+
 static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
@@ -1421,7 +1438,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	phy_power_on(phy);
 
 	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, true);
+	ret = dp_ctrl_link_clk_enable(&ctrl->dp_ctrl);
 	if (ret)
 		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
 
@@ -1569,11 +1586,9 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	 * link maintenance.
 	 */
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
-		return ret;
-	}
+
+	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
+
 	phy_power_off(phy);
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
@@ -1591,7 +1606,6 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
 	struct dp_io *dp_io;
 	struct phy *phy;
-	int ret;
 
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
@@ -1601,10 +1615,7 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
-	}
+	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
 
 	phy_power_off(phy);
 
@@ -1708,11 +1719,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	ret = dp_ctrl_off(&ctrl->dp_ctrl);
-	if (ret) {
-		DRM_ERROR("failed to disable DP controller\n");
-		return ret;
-	}
+	dp_ctrl_off(&ctrl->dp_ctrl);
 
 	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
 	if (ret) {
@@ -1828,7 +1835,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 	rate = ctrl->panel->link_info.rate;
 	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
-	dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CORE_PM, true);
+	dp_ctrl_core_clk_enable(&ctrl->dp_ctrl);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		drm_dbg_dp(ctrl->drm_dev,
@@ -2024,12 +2031,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 	return ret;
 }
 
-int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
+void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
 	struct phy *phy;
-	int ret;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
@@ -2046,11 +2052,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
-		return ret;
-	}
+	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
 
 	phy_power_off(phy);
 
@@ -2060,15 +2062,13 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
 			phy, phy->init_count, phy->power_count);
-	return ret;
 }
 
-int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
+void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
 	struct phy *phy;
-	int ret;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
@@ -2076,10 +2076,7 @@ int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
-	}
+	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
 
 	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
 		phy, phy->init_count, phy->power_count);
@@ -2088,19 +2085,13 @@ int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 
 	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
 		phy, phy->init_count, phy->power_count);
-
-	return ret;
 }
 
-int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
+void dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
 	struct phy *phy;
-	int ret = 0;
-
-	if (!dp_ctrl)
-		return -EINVAL;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
@@ -2116,16 +2107,11 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	}
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
-	ret = dp_ctrl_clk_enable(&ctrl->dp_ctrl, DP_CTRL_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
-	}
+	dp_ctrl_link_clk_disable(&ctrl->dp_ctrl);
 
 	phy_power_off(phy);
 	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
 			phy, phy->init_count, phy->power_count);
-
-	return ret;
 }
 
 irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
@@ -2186,37 +2172,33 @@ static const char *ctrl_clks[] = {
 static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dss_module_power *core, *link;
 	struct device *dev;
 	int i, rc;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dev = ctrl->dev;
 
-	core = &ctrl->mp[DP_CORE_PM];
-	link = &ctrl->mp[DP_CTRL_PM];
-
-	core->num_clk = ARRAY_SIZE(core_clks);
-	core->clocks = devm_kcalloc(dev, core->num_clk, sizeof(*core->clocks), GFP_KERNEL);
-	if (!core->clocks)
+	ctrl->num_core_clks = ARRAY_SIZE(core_clks);
+	ctrl->core_clks = devm_kcalloc(dev, ctrl->num_core_clks, sizeof(*ctrl->core_clks), GFP_KERNEL);
+	if (!ctrl->core_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < core->num_clk; i++)
-		core->clocks[i].id = core_clks[i];
+	for (i = 0; i < ctrl->num_core_clks; i++)
+		ctrl->core_clks[i].id = core_clks[i];
 
-	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
+	rc = devm_clk_bulk_get(dev, ctrl->num_core_clks, ctrl->core_clks);
 	if (rc)
 		return rc;
 
-	link->num_clk = ARRAY_SIZE(ctrl_clks);
-	link->clocks = devm_kcalloc(dev, link->num_clk, sizeof(*link->clocks), GFP_KERNEL);
-	if (!link->clocks)
+	ctrl->num_link_clks = ARRAY_SIZE(ctrl_clks);
+	ctrl->link_clks = devm_kcalloc(dev, ctrl->num_link_clks, sizeof(*ctrl->link_clks), GFP_KERNEL);
+	if (!ctrl->link_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < link->num_clk; i++)
-		link->clocks[i].id = ctrl_clks[i];
+	for (i = 0; i < ctrl->num_link_clks; i++)
+		ctrl->link_clks[i].id = ctrl_clks[i];
 
-	rc = devm_clk_bulk_get(dev, link->num_clk, link->clocks);
+	rc = devm_clk_bulk_get(dev, ctrl->num_link_clks, ctrl->link_clks);
 	if (rc)
 		return rc;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index d8007a9d8260..023f14d0b021 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,17 +17,11 @@ struct dp_ctrl {
 	bool wide_bus_en;
 };
 
-enum dp_pm_type {
-	DP_CORE_PM,
-	DP_CTRL_PM,
-	DP_MAX_PM
-};
-
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
-int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
-int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
-int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_off(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
 irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
@@ -44,7 +38,7 @@ void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enable);
 void dp_ctrl_config_psr(struct dp_ctrl *dp_ctrl);
 
-int dp_ctrl_clk_enable(struct dp_ctrl *ctrl, enum dp_pm_type pm_type,
-		       bool enable);
+int dp_ctrl_core_clk_enable(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_core_clk_disable(struct dp_ctrl *dp_ctrl);
 
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 33e9d7deb3f8..6fbbd0f93d13 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -432,7 +432,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_ctrl_clk_enable(dp->ctrl, DP_CORE_PM, true);
+	dp_ctrl_core_clk_enable(dp->ctrl);
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
@@ -446,7 +446,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
 	dp_aux_deinit(dp->aux);
-	dp_ctrl_clk_enable(dp->ctrl, DP_CORE_PM, false);
+	dp_ctrl_core_clk_disable(dp->ctrl);
 	dp->core_initialized = false;
 }
 

-- 
2.39.2

