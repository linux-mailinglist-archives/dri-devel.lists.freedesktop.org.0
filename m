Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D97481E83
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037CD10E24E;
	Thu, 30 Dec 2021 17:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0660810E338;
 Thu, 30 Dec 2021 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640856320; x=1672392320;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=cJT0mRgNSm3r1hN5CeIpBXvKOVR2ymfeBG+t0V3+HQA=;
 b=GKkxkytsA4mCNUNstVWPLtQh3SBCbyaWQHCd8UjOyeKxuUKP7YP/3maB
 YjvOU+YiVJJ31Pd7KuzVoRLEwgdmyQ3kWzcNn7LpkeEF/jOD4cAlNTViR
 Eox3RREjfSarYOWpIuoCdo7e2QPw7U3jK4E1/EmeEOwuj/3Wa6W+V5Xoz g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 30 Dec 2021 01:25:20 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 30 Dec 2021 01:25:18 -0800
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 30 Dec 2021 14:55:11 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id CDBA921A28; Thu, 30 Dec 2021 14:55:09 +0530 (IST)
From: Rajeev Nandan <quic_rajeevny@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1 2/2] drm/msm/dsi: Add 10nm dsi phy tuning configuration support
Date: Thu, 30 Dec 2021 14:54:36 +0530
Message-Id: <1640856276-14697-3-git-send-email-quic_rajeevny@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640856276-14697-1-git-send-email-quic_rajeevny@quicinc.com>
References: <1640856276-14697-1-git-send-email-quic_rajeevny@quicinc.com>
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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
Cc: quic_kalyant@quicinc.com, jonathan@marek.ca, airlied@linux.ie,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, quic_mkrishn@quicinc.com,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In most cases the default values of DSI PHY tuning registers
should be sufficient as they are fully optimized. However, in
some cases (for example, where extreme board parasitics cause
the eye shape to degrade), the override bits can be used to
improve the signal quality.

As per the MSM DSI PHY (10nm) tuning guideline, the drive strength
can be adjusted using DSIPHY_RESCODE_OFFSET_TOP & DSIPHY_RESCODE_OFFSET_BOT
registers, and the drive level can be adjusted using DSIPHY_CMN_VREG_CTRL
register.

Add DSI PHY tuning support for 10nm PHY. This can be extended to other
DSI PHY versions if needed.

Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 55 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 23 +++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 31 +++++++++++++----
 3 files changed, 103 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 8c65ef6..bf630b7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -669,10 +669,42 @@ static int dsi_phy_get_id(struct msm_dsi_phy *phy)
 	return -EINVAL;
 }
 
+static int dsi_phy_parse_dt_per_lane_cfgs(struct platform_device *pdev,
+					  struct dsi_phy_per_lane_cfgs *cfg,
+					  char *property)
+{
+	int i = 0, j = 0;
+	const u8 *data;
+	u32 len = 0;
+
+	data = of_get_property(pdev->dev.of_node, property, &len);
+	if (!data) {
+		DRM_DEV_ERROR(&pdev->dev, "couldn't find %s property\n", property);
+		return -EINVAL;
+	}
+
+	if (len != DSI_LANE_MAX * cfg->count_per_lane) {
+		DRM_DEV_ERROR(&pdev->dev, "incorrect phy %s settings, exp=%d, act=%d\n",
+		       property, (DSI_LANE_MAX * cfg->count_per_lane), len);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < DSI_LANE_MAX; i++) {
+		for (j = 0; j < cfg->count_per_lane; j++) {
+			cfg->val[i][j] = *data;
+			data++;
+		}
+	}
+
+	return 0;
+}
+
 static int dsi_phy_driver_probe(struct platform_device *pdev)
 {
 	struct msm_dsi_phy *phy;
 	struct device *dev = &pdev->dev;
+	struct dsi_phy_per_lane_cfgs *strength;
+	struct dsi_phy_per_lane_cfgs *level;
 	u32 phy_type;
 	int ret;
 
@@ -707,6 +739,29 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(dev->of_node, "phy-type", &phy_type))
 		phy->cphy_mode = (phy_type == PHY_TYPE_CPHY);
 
+	/* dsi phy tuning configurations */
+	if (phy->cfg->drive_strength_cfg_count) {
+		strength = &phy->tuning_cfg.drive_strength;
+		strength->count_per_lane = phy->cfg->drive_strength_cfg_count;
+		ret = dsi_phy_parse_dt_per_lane_cfgs(pdev, strength,
+						"phy-drive-strength-cfg");
+		if (ret) {
+			DRM_DEV_ERROR(dev, "failed to parse PHY drive strength cfg, %d\n", ret);
+			goto fail;
+		}
+	}
+
+	if (phy->cfg->drive_level_cfg_count) {
+		level = &phy->tuning_cfg.drive_level;
+		level->count_per_lane = phy->cfg->drive_level_cfg_count;
+		ret = dsi_phy_parse_dt_per_lane_cfgs(pdev, level,
+						"phy-drive-level-cfg");
+		if (ret) {
+			DRM_DEV_ERROR(dev, "failed to parse PHY drive level cfg, %d\n", ret);
+			goto fail;
+		}
+	}
+
 	phy->base = msm_ioremap_size(pdev, "dsi_phy", "DSI_PHY", &phy->base_size);
 	if (IS_ERR(phy->base)) {
 		DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index b91303a..9ff733a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -39,6 +39,10 @@ struct msm_dsi_phy_cfg {
 	const int quirks;
 	bool has_phy_regulator;
 	bool has_phy_lane;
+
+	/* phy tuning config counts per lane */
+	u32 drive_strength_cfg_count;
+	u32 drive_level_cfg_count;
 };
 
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
@@ -81,6 +85,24 @@ struct msm_dsi_dphy_timing {
 #define DSI_PIXEL_PLL_CLK		1
 #define NUM_PROVIDED_CLKS		2
 
+#define DSI_LANE_MAX			5
+#define DSI_MAX_SETTINGS		8
+
+/**
+ * struct dsi_phy_per_lane_cfgs - Holds register values for PHY parameters
+ * @val: Register values for all lanes
+ * @count_per_lane: Number of values per lane.
+ */
+struct dsi_phy_per_lane_cfgs {
+	u8 val[DSI_LANE_MAX][DSI_MAX_SETTINGS];
+	u32 count_per_lane;
+};
+
+struct msm_dsi_phy_tuning_cfg {
+	struct dsi_phy_per_lane_cfgs drive_strength;
+	struct dsi_phy_per_lane_cfgs drive_level;
+};
+
 struct msm_dsi_phy {
 	struct platform_device *pdev;
 	void __iomem *base;
@@ -98,6 +120,7 @@ struct msm_dsi_phy {
 
 	struct msm_dsi_dphy_timing timing;
 	const struct msm_dsi_phy_cfg *cfg;
+	struct msm_dsi_phy_tuning_cfg tuning_cfg;
 
 	enum msm_dsi_phy_usecase usecase;
 	bool regulator_ldo_mode;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index d8128f5..ac974c06 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -775,10 +775,20 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG2(i), 0x0);
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_CFG3(i),
 			      i == 4 ? 0x80 : 0x0);
-		dsi_phy_write(lane_base +
-			      REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i), 0x0);
-		dsi_phy_write(lane_base +
-			      REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i), 0x0);
+
+		/* platform specific dsi phy drive strength adjustment */
+		if (phy->cfg->drive_strength_cfg_count) {
+			dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i),
+				phy->tuning_cfg.drive_strength.val[i][0]);
+			dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i),
+				phy->tuning_cfg.drive_strength.val[i][1]);
+		} else {
+			dsi_phy_write(lane_base +
+				      REG_DSI_10nm_PHY_LN_OFFSET_TOP_CTRL(i), 0x0);
+			dsi_phy_write(lane_base +
+				      REG_DSI_10nm_PHY_LN_OFFSET_BOT_CTRL(i), 0x0);
+		}
+
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(i),
 			      tx_dctrl[i]);
 	}
@@ -834,8 +844,13 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Select MS1 byte-clk */
 	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_GLBL_CTRL, 0x10);
 
-	/* Enable LDO */
-	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_VREG_CTRL, 0x59);
+	/* Enable LDO with platform specific drive level/amplitude adjustment */
+	if (phy->cfg->drive_level_cfg_count) {
+		dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_VREG_CTRL,
+			phy->tuning_cfg.drive_level.val[0][0]);
+	} else {
+		dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_VREG_CTRL, 0x59);
+	}
 
 	/* Configure PHY lane swap (TODO: we need to calculate this) */
 	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CFG0, 0x21);
@@ -941,6 +956,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 	.max_pll_rate = 3500000000UL,
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
+	.drive_strength_cfg_count = 2,
+	.drive_level_cfg_count = 1,
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
@@ -963,4 +980,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_10NM_QUIRK_OLD_TIMINGS,
+	.drive_strength_cfg_count = 2,
+	.drive_level_cfg_count = 1,
 };
-- 
2.7.4

