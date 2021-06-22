Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2C3B04FE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051576E4F3;
	Tue, 22 Jun 2021 12:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795306E4EC;
 Tue, 22 Jun 2021 12:43:12 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 22 Jun 2021 05:43:12 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 22 Jun 2021 05:43:11 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 22 Jun 2021 18:12:40 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 4723521516; Tue, 22 Jun 2021 18:12:39 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v2 2/3] drm/msm/dsi: Add PHY configuration for SC7280
Date: Tue, 22 Jun 2021 18:12:27 +0530
Message-Id: <1624365748-24224-3-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
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
Cc: jonathan@marek.ca, Rajeev Nandan <rajeevny@codeaurora.org>,
 mkrishn@codeaurora.org, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 robdclark@gmail.com, robh+dt@kernel.org, kalyan_t@codeaurora.org,
 dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver with
different enable|disable regulator loads.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes in v2:
- Fixed clang warning for max_pll_rate as per [1] (Dmitry Baryshkov)
- Fixed num_dsi_phy and io_start (Dmitry Baryshkov)

[1] https://lore.kernel.org/linux-arm-msm/20210514213032.575161-1-arnd@kernel.org/

 drivers/gpu/drm/msm/Kconfig               |  6 +++---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 26 ++++++++++++++++++++++++++
 4 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 10f693e..7c9d9f1 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -114,9 +114,9 @@ config DRM_MSM_DSI_10NM_PHY
 	  Choose this option if DSI PHY on SDM845 is used on the platform.
 
 config DRM_MSM_DSI_7NM_PHY
-	bool "Enable DSI 7nm PHY driver in MSM DRM (used by SM8150/SM8250)"
+	bool "Enable DSI 7nm PHY driver in MSM DRM"
 	depends on DRM_MSM_DSI
 	default y
 	help
-	  Choose this option if DSI PHY on SM8150/SM8250 is used on the
-	  platform.
+	  Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
+	  the platform.
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index ff7f2ec..ea023d4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -593,6 +593,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_7nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-7nm-8150",
 	  .data = &dsi_phy_7nm_8150_cfgs },
+	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
+	  .data = &dsi_phy_7nm_7280_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 94a77ac..bc91dc8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -51,6 +51,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e76ce40..144c7c0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -998,3 +998,29 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
+	.has_phy_lane = true,
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdds", 37550, 0},
+		},
+	},
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000ULL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae94400 },
+	.num_dsi_phy = 1,
+	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
+};
-- 
2.7.4

