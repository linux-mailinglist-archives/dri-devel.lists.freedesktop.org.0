Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F083D057
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 00:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9566B10EE74;
	Thu, 25 Jan 2024 23:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0270110EC9F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 23:03:49 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2cf205dc075so28527521fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706223767; x=1706828567; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JBWEWQ1lHx25M39T9M547AD4gOAvWiz91uIbsab7PCM=;
 b=M1GPQxg7tCH+deqBX8+7V655n5ml5zXljKnOjP/dpyHwAr9gBF4Wcfd0WPPESVHCZe
 eonypfrnhrQl0aX1RQwhfThEwRnm3S5hx82sO4tb7ZbMirVwNU1K9a9rWgmlww2R/NyD
 Ej4moV+DEdH08+SzT2VS5f2oU3hPjfxd8yqL22IWFYty0g8P+cqhIlKeQ4R1mCVO3zbB
 FEAJJjpl/5zE5PveSvIlpzXlLAkga2jzDDNJm73fxQhKG9gy1qXaDfZpUEDdWoA3xr7I
 u/LQxFf5uW8XlohEe6zhjIgFWt7bjcNNUc+hEeh2ggcHLug7qrMAeF3y5C6fIHBmB/zv
 Vhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706223767; x=1706828567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JBWEWQ1lHx25M39T9M547AD4gOAvWiz91uIbsab7PCM=;
 b=ljXW2pArejn7BmV+U2u6z/OJpS/qae99QmhJpMNlNHE/rju/ayYM2A2NCyupZ9B3n7
 8I4lEJIHq4gP81x6aZ7JjA38vKqbS/lG58bZ1ZNOGEVFnAYoz1oSAWrEBiX62PSBRPti
 WsK5/UKe5D6PdccBjzMfPIXa/TqDZF0Zt8ZKNzkdiGHNNd4r8oS+DqIHThCSZT4hfoYy
 GwHOTaVQvjppbZZWsIM/g5yeU8SuAC6rVP3HNjWR7UWtPMnSvP3wsgCycZxR86E79mzC
 u3WlqRXRO4bQPHVuJ4XnXqeYJOaRfL0T9UIvADlwA2pXm/khhjoEreP2RHnzMQiktmwo
 jpAQ==
X-Gm-Message-State: AOJu0YzdVK8/J/QGecZvFx3tJiSGyKERft+l2RINKb7FLoH7JJvndBR4
 rpSI3AAaV2HCBRa3eUsWLJUsH0mr3DC75gm4zn5boHHGpDPKPGHCpr7tGXsaZ90=
X-Google-Smtp-Source: AGHT+IGmXTzF1XCeO5l+noEmnjal0gV1HMGsrRPlq5RQxStpXWXCReOoLU/UL4lZ8ZSLk3uiTboRlA==
X-Received: by 2002:a2e:9dc9:0:b0:2cd:3663:97a1 with SMTP id
 x9-20020a2e9dc9000000b002cd366397a1mr194033ljj.86.1706223767359; 
 Thu, 25 Jan 2024 15:02:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 15:02:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:40 +0200
Subject: [PATCH v3 11/15] drm/msm/dp: handle PHY directly in dp_ctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-11-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6372;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=wVNyfHlk6qxMhT/7/ZVII3sNHgLBjpEAI4YnszPdTtw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiIRqRpFV7MlCt13vzYaKBl+VMyoS+o11Q6/
 v4w1y9VJuCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLoiAAKCRCLPIo+Aiko
 1bK9B/40MdcrDQcEb60DSvsJZSRpF49oHC71229SZ23NVdvBi2c8JWkObQIoBZQ+rFXu3v7sgdN
 cBFuwZWCNBo27pwhA3Xu4/ehh7Pj4t4ctS8vKcsWukTl2OaLx91JbmKi2UiQNzuaL2ucPUjohA5
 /xsACn0UJ00Rjs4Mb1/KBKOAUlNTM3rRSg0iglQKZ4Lpei7WysIO6GyxBnnQPp/Cl6UlzNI/6Fd
 5J6Mus6UrNuZZCGTidUGw+aFQ+5NOzQPMo45GxwuunU+wJSTedJxdbUs5K7UUZQBk/FsmLIvqi5
 Ks/zSDBSOxXK8RcCPbuVY+n6/0Li0x4wj4z/Ku9rTVQxQvu+
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

There is little point in going trough dp_parser->io indirection each
time the driver needs to access the PHY. Store the pointer directly in
dp_ctrl_private.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 37 +++++++++++++------------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 3 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 4aea72a2b8e8..fc7ce315ae41 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -76,9 +76,10 @@ struct dp_ctrl_private {
 	struct drm_dp_aux *aux;
 	struct dp_panel *panel;
 	struct dp_link *link;
-	struct dp_parser *parser;
 	struct dp_catalog *catalog;
 
+	struct phy *phy;
+
 	unsigned int num_core_clks;
 	struct clk_bulk_data *core_clks;
 
@@ -1028,7 +1029,7 @@ static int dp_ctrl_set_vx_px(struct dp_ctrl_private *ctrl,
 	phy_opts->dp.voltage[0] = v_level;
 	phy_opts->dp.pre[0] = p_level;
 	phy_opts->dp.set_voltages = 1;
-	phy_configure(ctrl->parser->io.phy, phy_opts);
+	phy_configure(ctrl->phy, phy_opts);
 	phy_opts->dp.set_voltages = 0;
 
 	return 0;
@@ -1442,7 +1443,7 @@ static void dp_ctrl_link_clk_disable(struct dp_ctrl *dp_ctrl)
 static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
-	struct phy *phy = ctrl->parser->io.phy;
+	struct phy *phy = ctrl->phy;
 	const u8 *dpcd = ctrl->panel->dpcd;
 
 	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
@@ -1540,12 +1541,10 @@ void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
 void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
@@ -1557,12 +1556,10 @@ void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_exit(phy);
@@ -1587,7 +1584,7 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 
 static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
-	struct phy *phy = ctrl->parser->io.phy;
+	struct phy *phy = ctrl->phy;
 	int ret = 0;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
@@ -1617,11 +1614,9 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 
 static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
-	struct dp_io *dp_io;
 	struct phy *phy;
 
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
@@ -2047,12 +2042,10 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	/* set dongle to D3 (power off) mode */
 	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
@@ -2080,12 +2073,10 @@ void dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
@@ -2103,12 +2094,10 @@ void dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
 void dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
 	struct phy *phy;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
+	phy = ctrl->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
@@ -2225,7 +2214,7 @@ static int dp_ctrl_clk_init(struct dp_ctrl *dp_ctrl)
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
 			struct dp_catalog *catalog,
-			struct dp_parser *parser)
+			struct phy *phy)
 {
 	struct dp_ctrl_private *ctrl;
 	int ret;
@@ -2259,12 +2248,12 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 	init_completion(&ctrl->video_comp);
 
 	/* in parameters */
-	ctrl->parser   = parser;
 	ctrl->panel    = panel;
 	ctrl->aux      = aux;
 	ctrl->link     = link;
 	ctrl->catalog  = catalog;
 	ctrl->dev      = dev;
+	ctrl->phy      = phy;
 
 	ret = dp_ctrl_clk_init(&ctrl->dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 023f14d0b021..6e9f375b856a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -28,7 +28,7 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
 			struct dp_catalog *catalog,
-			struct dp_parser *parser);
+			struct phy *phy);
 
 void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable);
 void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c1a51c498e01..b8388e04bd0f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -760,7 +760,8 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	}
 
 	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
-			       dp->catalog, dp->parser);
+			       dp->catalog,
+			       dp->parser->io.phy);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);

-- 
2.39.2

