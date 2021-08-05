Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A71253E1A0E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 19:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D5B6EB18;
	Thu,  5 Aug 2021 17:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80816EB14
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 17:08:19 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p38so12580190lfa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u5iij8rID6SAk24Gs2UckGpZrRbqv5ALWYEAvBtS4mY=;
 b=HihlEB7QQCsFTB7m+r/iDAPKeJlly9uHAUNgUoNvFpkED6Sq13q3A39T6yGWWvyIRM
 dHl1lYp/dNL8tb/8x4AWFOcv8iz6BEvrNoR64kXCnCZLIMTyTq+PkC7iYjUFeALvzr6o
 lDvDD/6cEGkrzj64tBO8X+WosK1kMz7JfhNZucPvOqktE+lxFMshAFEqUPl5v6ZXWzxS
 o5XKKsmeSZLNvtyI39w8UpqAPOY3t96adfVB1G0BAhsVJcZe1vrjSi9TKLzKhrkQFcll
 YI6EUT38/GEpLaFDHpYR1+dPktXbqWlLFdXfcaIkMu8Lt+YeoDlTbwYyUi1Yw9/IUzPV
 zudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u5iij8rID6SAk24Gs2UckGpZrRbqv5ALWYEAvBtS4mY=;
 b=UfIpCo3HwXGQZDJWwHD9YrPzxxbGnor1cTPZ0PwWzhG8tClq8umIyngUs06HiYqvF5
 oTU5AjmgYBCE1Iqj4LxhllBOpW8NbmxJ6Ov8OG+OfhnwqFgOlYmfINXoLEytSNqkaoJr
 P1w41He806hQRYDrBedlLGxaoKk5Mvf16NxTlS2gWxwrEeHARB++xZVfUmEFBwUGlTc6
 GXlpblwwyusdbBEj6nFqWmXWYI52bZWSzFFjbQL4tHU9f3ZBwtEwZiqVgMtHzKWRD0py
 +ZeAn3BtaeguxhmRUZX3PACjVGmvaXVRxAKz/b7IrQFwIJuNBySoVw6xtXzebz+7NdBp
 u/TA==
X-Gm-Message-State: AOAM532jdEghfko4w+Kub9McWZfwBXraFwHD15HlEIJPaiiNGSM80Ale
 rWjljz6qpS+vQ7h8NTdyamrJ3w==
X-Google-Smtp-Source: ABdhPJx+iKXMxN1ZaUHnr/vBFWgK62YDFCoxXE2ugla5zcpEvl/+wWZVyK8vcLL/S3SfYk6G/g+yAw==
X-Received: by 2002:a19:e00a:: with SMTP id x10mr4679538lfg.536.1628183298064; 
 Thu, 05 Aug 2021 10:08:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v19sm568935lfg.134.2021.08.05.10.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 10:08:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v5] drm/msm/dsi: add continuous clock support for 7nm PHY
Date: Thu,  5 Aug 2021 20:08:17 +0300
Message-Id: <20210805170817.3337665-1-dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike previous generations, 7nm PHYs are required to collaborate with
the host for conitnuos clock mode. Add changes neccessary to enable
continuous clock mode in the 7nm DSI PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v4:
 - Fix the comment regarding msm_dsi_phy_set_continuous_clock()

Changes since v3:
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
index eadbcc78fd72..473c81605054 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -518,6 +518,7 @@ static inline uint32_t DSI_CLKOUT_TIMING_CTRL_T_CLK_POST(uint32_t val)
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
index 4ebfedc4a9ac..1b89fef8f805 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -381,7 +381,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (ret)
 		goto phy_en_fail;
 
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
index 6ca6bfd4809b..723d2eeafa69 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -835,6 +835,15 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 		phy->usecase = uc;
 }
 
+/* Returns true if we have to clear DSI_LANE_CTRL.HS_REQ_SEL_PHY */
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
index 7c23d4c47338..a78a0c45d101 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -932,6 +932,21 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
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
@@ -972,6 +987,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 		.save_pll_state = dsi_7nm_pll_save_state,
 		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
 	},
 	.min_pll_rate = 600000000UL,
 #ifdef CONFIG_64BIT
@@ -998,6 +1014,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.pll_init = dsi_pll_7nm_init,
 		.save_pll_state = dsi_7nm_pll_save_state,
 		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
-- 
2.30.2

