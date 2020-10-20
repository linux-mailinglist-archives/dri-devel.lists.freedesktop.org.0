Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1B02948C8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A176F476;
	Wed, 21 Oct 2020 07:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0388E6E0FC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 22:05:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603231555; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=mlPj7fHUpRRtLXqaKr8zfFXtq5AIPkZSJCf6RrMHo5A=;
 b=dEMLp57VDw1LF43XQ+L7vtj1elJ/VOSyVGLVCi3C77ji7xBoPwX/16ZTy7bT7tpmBJKiYxSg
 W7gUXGD/BRZajtjotoOBYGExc218g5STZPS27nqh+8l7Ug+HZP1MxAMOuNHrVQ2Gkci1SVWR
 ZBoCieCs9WIeaIhTQ8NtzJhi/Eo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f8f5f0f3711fec7b1a4f9a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Oct 2020 22:05:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B93ADC43387; Tue, 20 Oct 2020 22:05:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 001FDC433C9;
 Tue, 20 Oct 2020 22:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 001FDC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH v3] drm/msm/dp: add opp_table corner voting support base on
 dp_ink_clk rate
Date: Tue, 20 Oct 2020 15:04:54 -0700
Message-Id: <20201020220454.23512-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: rnayak@codeaurora.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set link rate by using OPP set rate api so that CX level will be set
accordingly based on the link rate.

Changes in v2:
-- remove dev from dp_ctrl_put() parameters
-- Add more information to commit message

Changes in v3:
-- return when dev_pm_opp_set_clkname() failed

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 28 ++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_power.c   | 44 ++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_power.h   |  2 +-
 4 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 76e891c91c6e..f12767793211 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
+#include <linux/pm_opp.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_print.h>
@@ -76,6 +77,8 @@ struct dp_ctrl_private {
 	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
+	struct opp_table *opp_table;
+
 	struct completion idle_comp;
 	struct completion video_comp;
 };
@@ -1833,6 +1836,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_parser *parser)
 {
 	struct dp_ctrl_private *ctrl;
+	int ret;
 
 	if (!dev || !panel || !aux ||
 	    !link || !catalog) {
@@ -1846,6 +1850,21 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 		return ERR_PTR(-ENOMEM);
 	}
 
+	ctrl->opp_table = dev_pm_opp_set_clkname(dev, "ctrl_link");
+	if (IS_ERR(ctrl->opp_table)) {
+		dev_err(dev, "invalid DP OPP table in device tree\n");
+		/* caller do PTR_ERR(ctrl->opp_table) */
+		return (struct dp_ctrl *)ctrl->opp_table;
+	}
+
+	/* OPP table is optional */
+	ret = dev_pm_opp_of_add_table(dev);
+	if (ret) {
+		dev_err(dev, "failed to add DP OPP table\n");
+		dev_pm_opp_put_clkname(ctrl->opp_table);
+		ctrl->opp_table = NULL;
+	}
+
 	init_completion(&ctrl->idle_comp);
 	init_completion(&ctrl->video_comp);
 
@@ -1863,4 +1882,13 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 
 void dp_ctrl_put(struct dp_ctrl *dp_ctrl)
 {
+	struct dp_ctrl_private *ctrl;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	if (ctrl->opp_table) {
+		dev_pm_opp_of_remove_table(ctrl->dev);
+		dev_pm_opp_put_clkname(ctrl->opp_table);
+		ctrl->opp_table = NULL;
+	}
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c0665a0a4c78..f76139dd495a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -702,7 +702,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->power = dp_power_get(dp->parser);
+	dp->power = dp_power_get(dev, dp->parser);
 	if (IS_ERR(dp->power)) {
 		rc = PTR_ERR(dp->power);
 		DRM_ERROR("failed to initialize power, rc = %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 17c1fc6a2d44..9c4ea00a5f2a 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -8,12 +8,14 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/regulator/consumer.h>
+#include <linux/pm_opp.h>
 #include "dp_power.h"
 #include "msm_drv.h"
 
 struct dp_power_private {
 	struct dp_parser *parser;
 	struct platform_device *pdev;
+	struct device *dev;
 	struct clk *link_clk_src;
 	struct clk *pixel_provider;
 	struct clk *link_provider;
@@ -148,18 +150,51 @@ static int dp_power_clk_deinit(struct dp_power_private *power)
 	return 0;
 }
 
+static int dp_power_clk_set_link_rate(struct dp_power_private *power,
+			struct dss_clk *clk_arry, int num_clk, int enable)
+{
+	u32 rate;
+	int i, rc = 0;
+
+	for (i = 0; i < num_clk; i++) {
+		if (clk_arry[i].clk) {
+			if (clk_arry[i].type == DSS_CLK_PCLK) {
+				if (enable)
+					rate = clk_arry[i].rate;
+				else
+					rate = 0;
+
+				rc = dev_pm_opp_set_rate(power->dev, rate);
+				if (rc)
+					break;
+			}
+
+		}
+	}
+	return rc;
+}
+
 static int dp_power_clk_set_rate(struct dp_power_private *power,
 		enum dp_pm_type module, bool enable)
 {
 	int rc = 0;
 	struct dss_module_power *mp = &power->parser->mp[module];
 
-	if (enable) {
-		rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
+	if (module == DP_CTRL_PM) {
+		rc = dp_power_clk_set_link_rate(power, mp->clk_config, mp->num_clk, enable);
 		if (rc) {
-			DRM_ERROR("failed to set clks rate.\n");
+			DRM_ERROR("failed to set link clks rate\n");
 			return rc;
 		}
+	} else {
+
+		if (enable) {
+			rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
+			if (rc) {
+				DRM_ERROR("failed to set clks rate\n");
+				return rc;
+			}
+		}
 	}
 
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
@@ -349,7 +384,7 @@ int dp_power_deinit(struct dp_power *dp_power)
 	return 0;
 }
 
-struct dp_power *dp_power_get(struct dp_parser *parser)
+struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
 {
 	struct dp_power_private *power;
 	struct dp_power *dp_power;
@@ -365,6 +400,7 @@ struct dp_power *dp_power_get(struct dp_parser *parser)
 
 	power->parser = parser;
 	power->pdev = parser->pdev;
+	power->dev = dev;
 
 	dp_power = &power->dp_power;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 76743d755833..7d0327bbc0d5 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -102,6 +102,6 @@ void dp_power_client_deinit(struct dp_power *power);
  * methods to be called by the client to configure the power related
  * modueles.
  */
-struct dp_power *dp_power_get(struct dp_parser *parser);
+struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser);
 
 #endif /* _DP_POWER_H_ */

base-commit: 0855cb4b31953b8c539e57b970da8146bcd4405a
prerequisite-patch-id: 6221bf61b4663cab27a511b59735639aa475ee6c
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
