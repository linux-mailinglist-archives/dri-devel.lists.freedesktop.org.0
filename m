Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3F4241FF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 17:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0D56EDA3;
	Wed,  6 Oct 2021 15:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF67B6EDA3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 15:59:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633535986; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rAlDy/tgm9JVIvTKe6rje74SMjSz8pCctMzm0HGvymI=;
 b=MLyEfdqQnNUpY9b+48aQFFU9EjrJnwBWNhTB31ZTxPo3vXewgyOoHMGqnC3CerHLHnwUN/23
 u1zdKS2vw6YoiJU5NNOc87UjHsU5G1ECqf8WXEFaICiYSOpYzXagkEn0iZinH2jV0GnQwzLx
 pmv8W1X4fmNcOfcB0P762hBZj/o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615dc7e8ff0285fb0a52a402 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Oct 2021 15:59:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 881E5C4360D; Wed,  6 Oct 2021 15:59:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BD2EEC4338F;
 Wed,  6 Oct 2021 15:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BD2EEC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 dmitry.baryshkov@linaro.org, bjorn.andersson@linaro.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, khsieh@codeaurora.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: do not initialize combo phy until plugin interrupt
Date: Wed,  6 Oct 2021 08:59:26 -0700
Message-Id: <1633535966-21005-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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

Combo phy support both USB3 and DP simultaneously. USB3 is the
master of combo phy so that USB3 should initialize and power on
its phy before DP initialize its phy. At current implementation,
DP driver initialize its phy happen earlier than  USB3 initialize
its phy which cause timeout error at procedure of power up USB3 phy
which prevent USB3 from working. To avoid confliction of phy
initialization between USB3 and DP, this patch have DP driver postpone
phy initialization until plugin interrupt handler. DP driver only enable
regulator, configure its HPD controller and enable interrupt so that it
is able to receive HPD interrupts after completion of the initialization
phase. DP driver will initialize and power up phy at plugin interrupt
handler during normal operation so that both USB3 and DP are work
simultaneously.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 68 ++++++++++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  9 +++--
 drivers/gpu/drm/msm/dp/dp_display.c | 51 +++++++++++++++++++++-------
 3 files changed, 84 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 5551a8d..4c5d507 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1378,7 +1378,25 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
+void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl, bool flip)
+{
+	struct dp_ctrl_private *ctrl;
+
+	if (!dp_ctrl) {
+		DRM_ERROR("Invalid input data\n");
+		return;
+	}
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	ctrl->dp_ctrl.orientation = flip;
+
+	dp_catalog_ctrl_reset(ctrl->catalog);
+
+	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
+}
+
+void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
@@ -1386,33 +1404,44 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
 
 	if (!dp_ctrl) {
 		DRM_ERROR("Invalid input data\n");
-		return -EINVAL;
+		return;
 	}
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
-	ctrl->dp_ctrl.orientation = flip;
-
-	if (reset)
-		dp_catalog_ctrl_reset(ctrl->catalog);
-
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
-	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
+}
 
-	return 0;
+void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+	struct dp_io *dp_io;
+	struct phy *phy;
+
+	if (!dp_ctrl) {
+		DRM_ERROR("Invalid input data\n");
+		return;
+	}
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
+
+	dp_catalog_ctrl_phy_reset(ctrl->catalog);
+	phy_exit(phy);
 }
 
 /**
- * dp_ctrl_host_deinit() - Uninitialize DP controller
+ * dp_ctrl_irq_phy_exit() - disable dp irq and exit phy
  * @dp_ctrl: Display Port Driver data
  *
  * Perform required steps to uninitialize DP controller
  * and its resources.
  */
-void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
+void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
@@ -1866,23 +1895,6 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	return ret;
 }
 
-void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl)
-{
-	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
-	struct phy *phy;
-
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
-
-	dp_catalog_ctrl_reset(ctrl->catalog);
-
-	phy_exit(phy);
-
-	DRM_DEBUG_DP("DP off phy done\n");
-}
-
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 2363a2d..c1e4b1b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,12 +19,9 @@ struct dp_ctrl {
 	u32 pixel_rate;
 };
 
-int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
-void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
@@ -34,4 +31,10 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_power *power, struct dp_catalog *catalog,
 			struct dp_parser *parser);
 
+void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl, bool flip);
+void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cad25dd..44032ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -62,6 +62,11 @@ enum {
 	EV_DISCONNECT_PENDING_TIMEOUT,
 };
 
+enum {
+	TYPE_eDP = 1,
+	TYPE_DP,
+};
+
 #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
 #define DP_EVENT_Q_MAX	8
 
@@ -81,6 +86,7 @@ struct dp_display_private {
 	int irq;
 
 	int id;
+	int type;
 
 	/* state variables */
 	bool core_initialized;
@@ -121,31 +127,37 @@ struct dp_display_private {
 
 struct msm_dp_config { 
 	phys_addr_t io_start[3];
+	int type;
 	size_t num_dp;
 };
 
 static const struct msm_dp_config sc7180_dp_cfg = {
 	.io_start = { 0x0ae90000 },
+	.type = TYPE_DP,
 	.num_dp = 1,
 };
 
 static const struct msm_dp_config sc8180x_dp_cfg = {
 	.io_start = { 0xae90000, 0xae98000, 0 },
+	.type = TYPE_DP,
 	.num_dp = 3,
 };
 
 static const struct msm_dp_config sc8180x_edp_cfg = {
 	.io_start = { 0, 0, 0xae9a000 },
 	.num_dp = 3,
+	.type = TYPE_eDP,
 };
 
 static const struct msm_dp_config sc7280_edp_cfg = {
 	.io_start = { 0xaea0000, 0 },
+	.type = TYPE_eDP,
 	.num_dp = 2,
 };
 
 static const struct msm_dp_config sc7280_dp_cfg = { 
 	.io_start = { 0, 0xae90000 },
+	.type = TYPE_DP,
 	.num_dp = 2,
 };
 
@@ -392,7 +404,7 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	return rc;
 }
 
-static void dp_display_host_init(struct dp_display_private *dp, int reset)
+static void dp_display_host_init(struct dp_display_private *dp)
 {
 	bool flip = false;
 
@@ -404,12 +416,21 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
 	if (dp->usbpd->orientation == ORIENTATION_CC2)
 		flip = true;
 
-	dp_power_init(dp->power, flip);
-	dp_ctrl_host_init(dp->ctrl, flip, reset);
+	dp_power_init(dp->power, false);
+	dp_ctrl_irq_enable(dp->ctrl, flip);
+
+	if (dp->type == TYPE_eDP)
+		dp_ctrl_phy_init(dp->ctrl);
+
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
 }
 
+static void dp_display_host_phy_init(struct dp_display_private *dp)
+{
+	dp_ctrl_phy_init(dp->ctrl);
+}
+
 static void dp_display_host_deinit(struct dp_display_private *dp)
 {
 	if (!dp->core_initialized) {
@@ -417,7 +438,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 		return;
 	}
 
-	dp_ctrl_host_deinit(dp->ctrl);
+	dp_ctrl_irq_phy_exit(dp->ctrl);
 	dp_aux_deinit(dp->aux);
 	dp_power_deinit(dp->power);
 
@@ -435,7 +456,7 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 		goto end;
 	}
 
-	dp_display_host_init(dp, false);
+	dp_display_host_phy_init(dp);
 
 	rc = dp_display_process_hpd_high(dp);
 end:
@@ -646,9 +667,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	if (state == ST_DISCONNECTED) {
 		/* triggered by irq_hdp with sink_count = 0 */
 		if (dp->link->sink_count == 0) {
-			dp_ctrl_off_phy(dp->ctrl);
+			dp_ctrl_phy_exit(dp->ctrl);
 			hpd->hpd_high = 0;
-			dp->core_initialized = false;
 		}
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -1040,7 +1060,7 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
 static void dp_display_config_hpd(struct dp_display_private *dp)
 {
 
-	dp_display_host_init(dp, true);
+	dp_display_host_init(dp);
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
 	/* Enable interrupt first time
@@ -1222,7 +1242,8 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 	return 0;
 }
 
-static int dp_display_get_id(struct platform_device *pdev)
+static int dp_display_get_id(struct platform_device *pdev,
+				struct msm_dp_config *dp_cfg)
 {
 	const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
 	struct resource *res;
@@ -1234,8 +1255,10 @@ static int dp_display_get_id(struct platform_device *pdev)
 		return -EINVAL;
 
 	for (i = 0; i < cfg->num_dp; i++) {
-		if (cfg->io_start[i] == res->start)
+		if (cfg->io_start[i] == res->start) {
+			*dp_cfg = *cfg;
 			return i;
+		}
 	}
 
 	dev_err(&pdev->dev, "unknown displayport instance\n");
@@ -1246,6 +1269,7 @@ static int dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
 	struct dp_display_private *dp;
+	struct msm_dp_config dp_cfg;
 
 	if (!pdev || !pdev->dev.of_node) {
 		DRM_ERROR("pdev not found\n");
@@ -1256,12 +1280,13 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
-	dp->id = dp_display_get_id(pdev);
+	dp->id = dp_display_get_id(pdev, &dp_cfg);
 	if (dp->id < 0)
 		return -EINVAL;
 
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
+	dp->type = dp_cfg.type;
 
 	rc = dp_init_sub_modules(dp);
 	if (rc) {
@@ -1314,7 +1339,7 @@ static int dp_pm_resume(struct device *dev)
 	dp->hpd_state = ST_DISCONNECTED;
 
 	/* turn on dp ctrl/phy */
-	dp_display_host_init(dp, true);
+	dp_display_host_init(dp);
 
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
@@ -1531,7 +1556,7 @@ int msm_dp_display_enable(struct msm_drm_private *priv, struct drm_encoder *enco
 	state =  dp_display->hpd_state;
 
 	if (state == ST_DISPLAY_OFF)
-		dp_display_host_init(dp_display, true);
+		dp_display_host_phy_init(dp_display);
 
 	dp_display_enable(dp_display, 0);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

