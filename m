Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F28383A1E92
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1E989DD3;
	Wed,  9 Jun 2021 21:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6B889DD3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:08:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id v22so38895349lfa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 14:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ZQOtd0ByDjaczfKXfIr+MHiHDjb02iNVQUiVh4wRno=;
 b=Zvi9E7L75493WIick/Oj4qTsc7QJMFNxmplSUqgG5B62jn5OGPif4wEhChZNkyD6K8
 uyPp+yEIXKXh4HcAQT8yaDnQezDmr4qJK2f0x9pf4mL9jovoUx+yv3W3HVEkdrcNeV/5
 tQqFgbfscsw7ga4BqGMlsTk2sHW29jAdgjItnAcgLSA5YoLGuuI35B03FcBDyrtVbn9s
 bZ+DSmNFxLFCGaEjOuhQTPqFRx8FrpaHXmzRGylcQZh7ym6U0lt8/87V1OGMHK7vTLYD
 atIs6W5wzRsDTJlv2unZRwJXDHFBrsokEA8DI83tDB+5HA0r8FNU7djbuFQgQLdWlteG
 AB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ZQOtd0ByDjaczfKXfIr+MHiHDjb02iNVQUiVh4wRno=;
 b=IfDm2KVXoQ6faM1x9oaKFy0coHCipwiL6cD+d5zqcNBIETWXWdsDXtGU4gRQWIuWGW
 ogdrQ/f95v0p4TiFzZqSQ8VDj7LzKWiOHufV/Z+DVH2O8+Mm2LOM7va0nn6MvXCTLkbE
 yYH1WsD2bVBxwl0Y0BWtdh7n1PQAizJZAa2qlHYNaF671UVJX7qnCN3xxsH5APznTiEF
 WF9+AidH/Jl1ELaF0oPmcH91nsJ4A/kBQOaOMC1cUeIXPF8vf9PGh/8Aph6DH1Nh01W/
 GytO91tLt1lVWjYd+LeUFMMw56FyDMch89KN3XNLzAaEajKWz8osfz1vMpFYzseY0tI7
 KpVQ==
X-Gm-Message-State: AOAM533jjMOqkxfehy1jCqGiZCXVi/J1HSEA9fIWczArbIjCJTf4lK+5
 rSropc7otzrBrBcFKzskeafFVg==
X-Google-Smtp-Source: ABdhPJwl3HmkCLHgm+iST2iLvNkHoTFPB84q6c6ST2CQaCzKZeB//Z+KfVlkWiMP/FmhCnrN+SDuJQ==
X-Received: by 2002:a05:6512:3457:: with SMTP id
 j23mr862152lfr.146.1623272924839; 
 Wed, 09 Jun 2021 14:08:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w24sm93873lfl.123.2021.06.09.14.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:08:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v4] drm/msm/dsi: add continuous clock support for 7nm PHY
Date: Thu, 10 Jun 2021 00:08:43 +0300
Message-Id: <20210609210843.2557846-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike previous generations, 7nm PHYs are required to collaborate with
the host for conitnuos clock mode. Add changes neccessary to enable
continuous clock mode in the 7nm DSI PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Chanes since v3:
 - Invert the DSI_LANE_CTRL_HS_REQ_SEL_PHY bit logic, as noted by
   Abhinav.

Changes since v2:
 - Really drop msm_dsi_phy_needs_hs_phy_sel()

Changes since v1:
 - Remove the need for a separate msm_dsi_phy_needs_hs_phy_sel() call
 - Fix setting continuous clock for a dual DSI case.
---
 drivers/gpu/drm/msm/dsi/dsi.h             |  3 ++-
 drivers/gpu/drm/msm/dsi/dsi.xml.h         |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c        | 12 ++++++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c     |  4 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  9 +++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 17 +++++++++++++++++
 7 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 9b8e9b07eced..58e63bf34fe9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -109,7 +109,7 @@ int msm_dsi_host_enable(struct mipi_dsi_host *host);
 int msm_dsi_host_disable(struct mipi_dsi_host *host);
 int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings,
-			bool is_dual_dsi);
+			bool is_dual_dsi, struct msm_dsi_phy *phy);
 int msm_dsi_host_power_off(struct mipi_dsi_host *host);
 int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 				  const struct drm_display_mode *mode);
@@ -175,6 +175,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
 int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
+bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool enable);
 
 #endif /* __DSI_CONNECTOR_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 50eb4d1b8fdd..9762af6035e9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -510,6 +510,7 @@ static inline uint32_t DSI_CLKOUT_TIMING_CTRL_T_CLK_POST(uint32_t val)
 #define DSI_LANE_STATUS_DLN0_DIRECTION				0x00010000
 
 #define REG_DSI_LANE_CTRL					0x000000a8
+#define DSI_LANE_CTRL_HS_REQ_SEL_PHY				0x01000000
 #define DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST			0x10000000
 
 #define REG_DSI_LANE_SWAP_CTRL					0x000000ac
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ed504fe5074f..3558e5cd400f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -834,7 +834,7 @@ static inline enum dsi_cmd_dst_format dsi_get_cmd_fmt(
 }
 
 static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
-			struct msm_dsi_phy_shared_timings *phy_shared_timings)
+			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct msm_dsi_phy *phy)
 {
 	u32 flags = msm_host->mode_flags;
 	enum mipi_dsi_pixel_format mipi_fmt = msm_host->format;
@@ -929,6 +929,10 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 
 	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
 		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
+
+		if (msm_dsi_phy_set_continuous_clock(phy, enable))
+			lane_ctrl &= ~DSI_LANE_CTRL_HS_REQ_SEL_PHY;
+
 		dsi_write(msm_host, REG_DSI_LANE_CTRL,
 			lane_ctrl | DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
 	}
@@ -2354,7 +2358,7 @@ static void msm_dsi_sfpb_config(struct msm_dsi_host *msm_host, bool enable)
 
 int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings,
-			bool is_dual_dsi)
+			bool is_dual_dsi, struct msm_dsi_phy *phy)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
@@ -2394,7 +2398,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 
 	dsi_timing_setup(msm_host, is_dual_dsi);
 	dsi_sw_reset(msm_host);
-	dsi_ctrl_config(msm_host, true, phy_shared_timings);
+	dsi_ctrl_config(msm_host, true, phy_shared_timings, phy);
 
 	if (msm_host->disp_en_gpio)
 		gpiod_set_value(msm_host->disp_en_gpio, 1);
@@ -2425,7 +2429,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 		goto unlock_ret;
 	}
 
-	dsi_ctrl_config(msm_host, false, NULL);
+	dsi_ctrl_config(msm_host, false, NULL, NULL);
 
 	if (msm_host->disp_en_gpio)
 		gpiod_set_value(msm_host->disp_en_gpio, 0);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cd016576e8c5..94d10a596038 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -381,7 +381,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
 		return;
 
-	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_dual_dsi);
+	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_dual_dsi, msm_dsi->phy);
 	if (ret) {
 		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
 		goto host_on_fail;
@@ -389,7 +389,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 
 	if (is_dual_dsi && msm_dsi1) {
 		ret = msm_dsi_host_power_on(msm_dsi1->host,
-				&phy_shared_timings[DSI_1], is_dual_dsi);
+				&phy_shared_timings[DSI_1], is_dual_dsi, msm_dsi1->phy);
 		if (ret) {
 			pr_err("%s: power on host1 failed, %d\n",
 							__func__, ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 6ca6bfd4809b..e443f7335a51 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -835,6 +835,15 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 		phy->usecase = uc;
 }
 
+/* Returns true if we have to enable DSI_LANE_CTRL.HS_REQ_SEL_PHY */
+bool msm_dsi_phy_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
+{
+	if (!phy || !phy->cfg->ops.set_continuous_clock)
+		return false;
+
+	return phy->cfg->ops.set_continuous_clock(phy, enable);
+}
+
 int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
 {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 5b0feef87127..43dee28450b4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -24,6 +24,7 @@ struct msm_dsi_phy_ops {
 	void (*disable)(struct msm_dsi_phy *phy);
 	void (*save_pll_state)(struct msm_dsi_phy *phy);
 	int (*restore_pll_state)(struct msm_dsi_phy *phy);
+	bool (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
 };
 
 struct msm_dsi_phy_cfg {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index accd6b4eb7c2..664c70161d51 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -930,6 +930,21 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	return 0;
 }
 
+static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
+{
+	void __iomem *base = phy->base;
+	u32 data;
+
+	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1);
+	if (enable)
+		data |= BIT(5) | BIT(6);
+	else
+		data &= ~(BIT(5) | BIT(6));
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL1, data);
+
+	return enable;
+}
+
 static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 {
 	void __iomem *base = phy->base;
@@ -970,6 +985,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 		.save_pll_state = dsi_7nm_pll_save_state,
 		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
 	},
 	.min_pll_rate = 600000000UL,
 #ifdef CONFIG_64BIT
@@ -996,6 +1012,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 		.save_pll_state = dsi_7nm_pll_save_state,
 		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
-- 
2.30.2

