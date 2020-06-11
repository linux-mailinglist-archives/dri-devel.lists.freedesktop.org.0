Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D361F82BD
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB3C6E43B;
	Sat, 13 Jun 2020 10:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4C26E055
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 09:19:29 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t7so2118594plr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 02:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HczxMDhMRr8/hNQIlMXzHTTLGivphiSA47fqKD0v9bQ=;
 b=cMlgAgmobGI9jxlp9yTuDymhSyivA9JgvQ/vSyuhKvVTFVzuX1EcaGa+XpuAYCFyrn
 YVEVRcJDzRWMnb8a2CJsdQ17ze4SVG6V56BsIHDlU+zI7ED4Q3FmX3xPMWefNOE958cR
 p5bCK6sDInzkMDG1LA6/pdG9Mq/NQri/PXYXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HczxMDhMRr8/hNQIlMXzHTTLGivphiSA47fqKD0v9bQ=;
 b=qzQ49Xo8EncvXo5PoOfCN3MCrsC+OnN3K+w3SjtraTcBvax3evCypzndphTyTrfp/z
 +OLtLSscz2gEYH7nLP0rOiGsXAkrSpWgM1GdstshmLBJ7Wm7G8+8UU/uzNeUKtlHQVSR
 poWjzsTNSj7IkUx8vuABZ1aFq8uHhHpLvDgGYtuXZlaKeJ6rHkclG1VihlI9MZJSMOdY
 /9m6xq+OxulM78B2pKI7Te20ggyFAKUn8Dxgo4DdyS2dLKixa+xBgSsgJokRn3GnjA13
 jwO+AeM0rIB5FEGa8Xz7AI6xxVU3u56i78Ty5x49EHOdNGWudzV/8/+c8/XCxT4TVdjH
 k64g==
X-Gm-Message-State: AOAM530oqj9RLQTONw9woSs+l+327151Y+fkFdlZid9ZEH57D7x12ZC7
 IeLKLn8lTmd3q3a4WU6zNMGm3w==
X-Google-Smtp-Source: ABdhPJwUPOl9Jvq55QS+nJq07fGP99ZG0B4tLcmvE55jPg3rGVuDKzkR8qDa795bESdGxz8ddl0aIg==
X-Received: by 2002:a17:90a:f8e:: with SMTP id
 14mr7643194pjz.172.1591867169205; 
 Thu, 11 Jun 2020 02:19:29 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id 1sm2367852pfx.210.2020.06.11.02.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 02:19:28 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH/RFC 8/8] drm/msm/dp: Use qmp phy for DP PLL and PHY
Date: Thu, 11 Jun 2020 02:19:19 -0700
Message-Id: <20200611091919.108018-9-swboyd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200611091919.108018-1-swboyd@chromium.org>
References: <20200611091919.108018-1-swboyd@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manu Gautam <mgautam@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, Sandeep Maheswaram <sanm@codeaurora.org>,
 Vara Reddy <varar@codeaurora.org>, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the necessary changes to the DP driver to use the qmp phy from the
common phy framework instead of rolling our own in the drm subsystem.
This also removes the PLL code and adds proper includes so things build.

Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/Kconfig                   |  13 -
 drivers/gpu/drm/msm/Makefile                  |   4 -
 drivers/gpu/drm/msm/dp/dp_aux.c               |  27 +-
 drivers/gpu/drm/msm/dp/dp_aux.h               |   6 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c           | 247 +--------
 drivers/gpu/drm/msm/dp/dp_catalog.h           |  11 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  58 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |  50 +-
 drivers/gpu/drm/msm/dp/dp_display.h           |   3 -
 drivers/gpu/drm/msm/dp/dp_link.c              |   2 +
 drivers/gpu/drm/msm/dp/dp_panel.c             |   1 +
 drivers/gpu/drm/msm/dp/dp_parser.c            | 123 +---
 drivers/gpu/drm/msm/dp/dp_parser.h            |  81 +--
 drivers/gpu/drm/msm/dp/dp_power.c             |  78 +--
 drivers/gpu/drm/msm/dp/dp_power.h             |  21 -
 drivers/gpu/drm/msm/dp/pll/dp_pll.c           | 127 -----
 drivers/gpu/drm/msm/dp/pll/dp_pll.h           |  57 --
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c      | 401 --------------
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h      |  86 ---
 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c | 524 ------------------
 20 files changed, 91 insertions(+), 1829 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.c
 delete mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.h
 delete mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
 delete mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
 delete mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 43544c18b4ee..ea3c4d094d09 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -65,19 +65,6 @@ config DRM_MSM_DP
 	  display support is enabled through this config option. It can
 	  be primary or secondary display on device.
 
-config DRM_MSM_DP_PLL
-	bool "Enable DP PLL driver in MSM DRM"
-	depends on DRM_MSM_DP && COMMON_CLK
-	help
-	  Choose this option to enable DP PLL driver which provides DP
-	  source clocks under common clock framework.
-
-config DRM_MSM_DP_10NM_PLL
-	bool "Enable DP 10nm PLL driver in MSM DRM (used by SDM845)"
-	depends on DRM_MSM_DP_PLL
-	help
-	  Choose this option if DP PLL on SDM845 is used on the platform.
-
 config DRM_MSM_DSI
 	bool "Enable DSI support in MSM DRM driver"
 	depends on DRM_MSM
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index a6f68fb013ab..3e078d574aeb 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -139,8 +139,4 @@ msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/pll/dsi_pll_14nm.o
 msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/pll/dsi_pll_10nm.o
 endif
 
-msm-$(CONFIG_DRM_MSM_DP_PLL)+= dp/pll/dp_pll.o
-msm-$(CONFIG_DRM_MSM_DP_10NM_PLL)+= dp/pll/dp_pll_10nm.o \
-	dp/pll/dp_pll_10nm_util.o
-
 obj-$(CONFIG_DRM_MSM)	+= msm.o
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 73e0388a6b73..f0278d192c09 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/delay.h>
+#include <drm/drm_print.h>
 
 #include "dp_reg.h"
 #include "dp_aux.h"
@@ -356,8 +357,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *drm_aux,
 		if (aux->native) {
 			aux->retry_cnt++;
 			if (!(aux->retry_cnt % retry_count))
-				dp_catalog_aux_update_cfg(aux->catalog,
-					aux->dp_aux.cfg, PHY_AUX_CFG1);
+				dp_catalog_aux_update_cfg(aux->catalog);
 			dp_catalog_aux_reset(aux->catalog);
 		}
 		goto unlock_exit;
@@ -385,14 +385,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *drm_aux,
 	return ret;
 }
 
-static void dp_aux_reset_phy_config_indices(struct dp_aux_cfg *aux_cfg)
-{
-	int i;
-
-	for (i = 0; i < PHY_AUX_CFG_MAX; i++)
-		aux_cfg[i].current_index = 0;
-}
-
 void dp_aux_isr(struct dp_aux *dp_aux)
 {
 	struct dp_aux_private *aux;
@@ -421,24 +413,21 @@ void dp_aux_reconfig(struct dp_aux *dp_aux)
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
-	dp_catalog_aux_update_cfg(aux->catalog,
-			dp_aux->cfg, PHY_AUX_CFG1);
+	dp_catalog_aux_update_cfg(aux->catalog);
 	dp_catalog_aux_reset(aux->catalog);
 }
 
-void dp_aux_init(struct dp_aux *dp_aux, struct dp_aux_cfg *aux_cfg)
+void dp_aux_init(struct dp_aux *dp_aux)
 {
 	struct dp_aux_private *aux;
 
-	if (!dp_aux || !aux_cfg) {
+	if (!dp_aux) {
 		DRM_ERROR("invalid input\n");
 		return;
 	}
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
-	dp_aux_reset_phy_config_indices(aux_cfg);
-	dp_catalog_aux_setup(aux->catalog, aux_cfg);
 	dp_catalog_aux_reset(aux->catalog);
 	dp_catalog_aux_enable(aux->catalog, true);
 	aux->retry_cnt = 0;
@@ -487,13 +476,12 @@ void dp_aux_unregister(struct dp_aux *dp_aux)
 	drm_dp_aux_unregister(&aux->drm_aux);
 }
 
-struct dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
-			  struct dp_aux_cfg *aux_cfg)
+struct dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog)
 {
 	struct dp_aux_private *aux;
 	struct dp_aux *dp_aux;
 
-	if (!catalog || !aux_cfg) {
+	if (!catalog) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-ENODEV);
 	}
@@ -509,7 +497,6 @@ struct dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
 
 	aux->dev = dev;
 	aux->catalog = catalog;
-	aux->dp_aux.cfg = aux_cfg;
 	dp_aux = &aux->dp_aux;
 	aux->retry_cnt = 0;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 18f560b1d29a..3b93c8a3252b 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -18,18 +18,16 @@
 
 struct dp_aux {
 	struct drm_dp_aux *drm_aux;
-	struct dp_aux_cfg *cfg;
 };
 
 int dp_aux_register(struct dp_aux *aux);
 void dp_aux_unregister(struct dp_aux *aux);
 void dp_aux_isr(struct dp_aux *aux);
-void dp_aux_init(struct dp_aux *aux, struct dp_aux_cfg *aux_cfg);
+void dp_aux_init(struct dp_aux *aux);
 void dp_aux_deinit(struct dp_aux *aux);
 void dp_aux_reconfig(struct dp_aux *aux);
 
-struct dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
-			  struct dp_aux_cfg *aux_cfg);
+struct dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog);
 void dp_aux_put(struct dp_aux *aux);
 
 #endif /*__DP_AUX_H_*/
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7987eb3947a1..f7058d1c587d 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -8,7 +8,10 @@
 #include <linux/rational.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-dp.h>
 #include <drm/drm_dp_helper.h>
+#include <drm/drm_print.h>
 
 #include "dp_catalog.h"
 #include "dp_reg.h"
@@ -121,76 +124,6 @@ static inline void dp_write_ahb(struct dp_catalog_private *catalog,
 	writel(data, catalog->io->dp_ahb.base + offset);
 }
 
-static inline void dp_write_phy(struct dp_catalog_private *catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, catalog->io->phy_io.base + offset);
-}
-
-static inline u32 dp_read_phy(struct dp_catalog_private *catalog,
-			       u32 offset)
-{
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	return readl_relaxed(catalog->io->phy_io.base + offset);
-}
-
-static inline void dp_write_pll(struct dp_catalog_private *catalog,
-			       u32 offset, u32 data)
-{
-	writel_relaxed(data, catalog->io->dp_pll_io.base + offset);
-}
-
-static inline void dp_write_ln_tx0(struct dp_catalog_private *catalog,
-			       u32 offset, u32 data)
-{
-	writel_relaxed(data, catalog->io->ln_tx0_io.base + offset);
-}
-
-static inline void dp_write_ln_tx1(struct dp_catalog_private *catalog,
-			       u32 offset, u32 data)
-{
-	writel_relaxed(data, catalog->io->ln_tx1_io.base + offset);
-}
-
-static inline u32 dp_read_ln_tx0(struct dp_catalog_private *catalog,
-			       u32 offset)
-{
-	return readl_relaxed(catalog->io->ln_tx0_io.base + offset);
-}
-
-static inline u32 dp_read_ln_tx1(struct dp_catalog_private *catalog,
-			       u32 offset)
-{
-	return readl_relaxed(catalog->io->ln_tx1_io.base + offset);
-}
-
-static inline void dp_write_usb_cm(struct dp_catalog_private *catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure usb reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, catalog->io->usb3_dp_com.base + offset);
-}
-
-static inline u32 dp_read_usb_cm(struct dp_catalog_private *catalog,
-			       u32 offset)
-{
-	/*
-	 * To make sure usb reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	return readl_relaxed(catalog->io->usb3_dp_com.base + offset);
-}
-
 static inline void dp_write_p0(struct dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
@@ -304,27 +237,14 @@ void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable)
 	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
-void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog,
-		struct dp_aux_cfg *cfg, enum dp_phy_aux_config_type type)
+void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
-	u32 new_index = 0, current_index = 0;
+	struct dp_io *dp_io = catalog->io;
+	struct phy *phy = dp_io->phy;
 
-	if (type >= PHY_AUX_CFG_MAX) {
-		DRM_ERROR("invalid input\n");
-		return;
-	}
-
-	current_index = cfg[type].current_index;
-	new_index = (current_index + 1) % cfg[type].cfg_cnt;
-	DRM_DEBUG_DP("Updating %s from 0x%08x to 0x%08x\n",
-		dp_phy_aux_config_type_to_string(type),
-	cfg[type].lut[current_index], cfg[type].lut[new_index]);
-
-	dp_write_phy(catalog, cfg[type].offset,
-			cfg[type].lut[new_index]);
-	cfg[type].current_index = new_index;
+	phy_calibrate(phy);
 }
 
 void dump_regs(void * __iomem *base, int len)
@@ -360,65 +280,6 @@ void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
 
 	pr_info("P0CLK regs\n");
 	dump_regs(catalog->io->dp_p0.base, catalog->io->dp_p0.len);
-
-	pr_info("USB3 DP COM regs\n");
-	dump_regs(catalog->io->usb3_dp_com.base, catalog->io->usb3_dp_com.len);
-
-	pr_info("LN TX0 regs\n");
-	dump_regs(catalog->io->ln_tx0_io.base, catalog->io->ln_tx0_io.len);
-
-	pr_info("LN TX1 regs\n");
-	dump_regs(catalog->io->ln_tx1_io.base, catalog->io->ln_tx1_io.len);
-
-	pr_info("DP PHY regs\n");
-	dump_regs(catalog->io->phy_io.base, catalog->io->phy_io.len);
-}
-
-void dp_catalog_aux_setup(struct dp_catalog *dp_catalog,
-		struct dp_aux_cfg *cfg)
-{
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
-	int i = 0;
-
-	dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PWRDN |
-		DP_PHY_PD_CTL_AUX_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
-		DP_PHY_PD_CTL_DP_CLAMP_EN);
-
-	/* Turn on BIAS current for PHY/PLL */
-	dp_write_pll(catalog,
-		QSERDES_COM_BIAS_EN_CLKBUFLR_EN, QSERDES_COM_BIAS_EN |
-		QSERDES_COM_BIAS_EN_MUX | QSERDES_COM_CLKBUF_L_EN |
-		QSERDES_COM_EN_SYSCLK_TX_SEL);
-
-	dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PSR_PWRDN);
-
-	/* Make sure that hardware is done with  PSR power down */
-	wmb();
-	dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PWRDN |
-		DP_PHY_PD_CTL_AUX_PWRDN | DP_PHY_PD_CTL_LANE_0_1_PWRDN
-		| DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN
-		| DP_PHY_PD_CTL_DP_CLAMP_EN);
-
-	dp_write_pll(catalog,
-		QSERDES_COM_BIAS_EN_CLKBUFLR_EN, QSERDES_COM_BIAS_EN |
-		QSERDES_COM_BIAS_EN_MUX | QSERDES_COM_CLKBUF_R_EN |
-		QSERDES_COM_CLKBUF_L_EN | QSERDES_COM_EN_SYSCLK_TX_SEL |
-		QSERDES_COM_CLKBUF_RX_DRIVE_L);
-
-	/* DP AUX CFG register programming */
-	for (i = 0; i < PHY_AUX_CFG_MAX; i++) {
-		DRM_DEBUG_DP("%s: offset=0x%08x, value=0x%08x\n",
-			dp_phy_aux_config_type_to_string(i),
-			cfg[i].offset, cfg[i].lut[cfg[i].current_index]);
-		dp_write_phy(catalog, cfg[i].offset,
-			cfg[i].lut[cfg[i].current_index]);
-	}
-
-	dp_write_phy(catalog, REG_DP_PHY_AUX_INTERRUPT_MASK,
-			PHY_AUX_STOP_ERR_MASK |	PHY_AUX_DEC_ERR_MASK |
-			PHY_AUX_SYNC_ERR_MASK |	PHY_AUX_ALIGN_ERR_MASK |
-			PHY_AUX_REQ_ERR_MASK);
 }
 
 int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
@@ -537,7 +398,7 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 					bool fixed_nvid)
 {
 	u32 pixel_m, pixel_n;
-	u32 mvid, nvid, div, pixel_div = 0, dispcc_input_rate;
+	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;
@@ -546,14 +407,11 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	div = dp_read_phy(catalog, REG_DP_PHY_VCO_DIV);
-	div &= 0x03;
-
-	if (div == 0)
+	if (rate == link_rate_hbr3)
 		pixel_div = 6;
-	else if (div == 1)
+	else if (rate == 1620000 || rate == 270000)
 		pixel_div = 2;
-	else if (div == 2)
+	else if (rate == link_rate_hbr2)
 		pixel_div = 4;
 	else
 		DRM_ERROR("Invalid pixel mux divider\n");
@@ -619,36 +477,6 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
 	return 0;
 }
 
-void dp_catalog_ctrl_usb_reset(struct dp_catalog *dp_catalog, bool flip)
-{
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
-	u32 typec_ctrl;
-
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_RESET_OVRD_CTRL,
-			USB3_DP_COM_OVRD_CTRL_SW_DPPHY_RESET_MUX |
-			USB3_DP_COM_OVRD_CTRL_SW_USB3PHY_RESET_MUX);
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_PHY_MODE_CTRL,
-						USB3_DP_COM_PHY_MODE_DP);
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_SW_RESET,
-						USB3_DP_COM_SW_RESET_SET);
-
-	/* Default configuration i.e CC1 */
-	typec_ctrl = USB3_DP_COM_TYPEC_CTRL_PORTSEL_MUX;
-	if (flip)
-		typec_ctrl |= USB3_DP_COM_TYPEC_CTRL_PORTSEL;
-
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_TYPEC_CTRL, typec_ctrl);
-
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_SWI_CTRL, 0x00);
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_SW_RESET, 0x00);
-
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_POWER_DOWN_CTRL,
-					USB3_DP_COM_POWER_DOWN_CTRL_SW_PWRDN);
-	dp_write_usb_cm(catalog, REG_USB3_DP_COM_RESET_OVRD_CTRL, 0x00);
-
-}
-
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
 {
 	u32 sw_reset;
@@ -776,59 +604,26 @@ void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog)
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	dp_write_ahb(catalog, REG_DP_PHY_CTRL,
-			DP_PHY_CTRL_SW_RESET_PLL | DP_PHY_CTRL_SW_RESET);
+	dp_write_ahb(catalog, REG_DP_PHY_CTRL, DP_PHY_CTRL_SW_RESET_PLL);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 	dp_write_ahb(catalog, REG_DP_PHY_CTRL, 0x0);
 }
 
-void dp_catalog_ctrl_phy_lane_cfg(struct dp_catalog *dp_catalog,
-		bool flipped, u8 ln_cnt)
-{
-	u32 info;
-	struct dp_catalog_private *catalog = container_of(dp_catalog,
-				struct dp_catalog_private, dp_catalog);
-	u8 orientation = BIT(!!flipped);
-
-	info = ln_cnt & DP_PHY_SPARE0_MASK;
-	info |= (orientation & DP_PHY_SPARE0_MASK)
-			<< DP_PHY_SPARE0_ORIENTATION_INFO_SHIFT;
-	DRM_DEBUG_DP("Shared Info = 0x%x\n", info);
-
-	dp_write_phy(catalog, REG_DP_PHY_SPARE0, info);
-}
-
 int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog,
 		u8 v_level, u8 p_level)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
-	u8 voltage_swing_cfg, pre_emphasis_cfg;
-
-	DRM_DEBUG_DP("hw: v=%d p=%d\n", v_level, p_level);
-
-	voltage_swing_cfg = vm_voltage_swing_hbr_rbr[v_level][p_level];
-	pre_emphasis_cfg = vm_pre_emphasis_hbr_rbr[v_level][p_level];
-
-	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF) {
-		DRM_ERROR("invalid vx (0x%x=0x%x), px (0x%x=0x%x\n",
-			v_level, voltage_swing_cfg, p_level, pre_emphasis_cfg);
-		return -EINVAL;
-	}
+	struct dp_io *dp_io = catalog->io;
+	struct phy *phy = dp_io->phy;
+	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
 
-	/* Enable MUX to use Cursor values from these registers */
-	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
-	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
-
-	/* Configure host and panel only if both values are allowed */
-	dp_write_ln_tx0(catalog, REG_DP_PHY_TXn_TX_DRV_LVL, voltage_swing_cfg);
-	dp_write_ln_tx1(catalog, REG_DP_PHY_TXn_TX_DRV_LVL, voltage_swing_cfg);
-	dp_write_ln_tx0(catalog, REG_DP_PHY_TXn_TX_EMP_POST1_LVL,
-					pre_emphasis_cfg);
-	dp_write_ln_tx1(catalog, REG_DP_PHY_TXn_TX_EMP_POST1_LVL,
-					pre_emphasis_cfg);
-	DRM_DEBUG_DP("hw: vx_value=0x%x px_value=0x%x\n",
-			voltage_swing_cfg, pre_emphasis_cfg);
+	/* TODO: Update for all lanes instead of just first one */
+	opts_dp->voltage[0] = v_level;
+	opts_dp->pre[0] = p_level;
+	opts_dp->set_voltages = 1;
+	phy_configure(phy, &dp_io->phy_opts);
+	opts_dp->set_voltages = 0;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 23d1cec7a517..61361da6b4c7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -6,6 +6,8 @@
 #ifndef _DP_CATALOG_H_
 #define _DP_CATALOG_H_
 
+#include <drm/drm_modes.h>
+
 #include "dp_parser.h"
 
 /* interrupts */
@@ -40,11 +42,8 @@ int dp_catalog_aux_write_trans(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_clear_trans(struct dp_catalog *dp_catalog, bool read);
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
-void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog,
-			struct dp_aux_cfg *cfg,
-			enum dp_phy_aux_config_type type);
-void dp_catalog_aux_setup(struct dp_catalog *dp_catalog,
-			struct dp_aux_cfg *aux_cfg);
+void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
+void dp_catalog_aux_setup(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
 /* DP Controller APIs */
@@ -65,8 +64,6 @@ void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog);
 u32 dp_catalog_hpd_get_intr_status(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
-void dp_catalog_ctrl_phy_lane_cfg(struct dp_catalog *dp_catalog, bool flipped,
-				u8 lane_cnt);
 int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
 				u8 p_level);
 int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index fa15d65c8d7a..15cd2b2e3364 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -8,8 +8,11 @@
 #include <linux/types.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-dp.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_dp_helper.h>
+#include <drm/drm_print.h>
 
 #include "dp_reg.h"
 #include "dp_ctrl.h"
@@ -1283,7 +1286,7 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl, bool train)
 }
 
 static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
-				   char *name, u32 rate)
+				   char *name, unsigned long rate)
 {
 	u32 num = ctrl->parser->mp[DP_CTRL_PM].num_clk;
 	struct dss_clk *cfg = ctrl->parser->mp[DP_CTRL_PM].clk_config;
@@ -1293,38 +1296,45 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
 		cfg++;
 	}
 
-	DRM_DEBUG_DP("setting rate=%d on clk=%s\n", rate, name);
+	DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
 
 	if (num)
 		cfg->rate = rate;
 	else
-		DRM_ERROR("%s clock doesn't exit to set rate %d\n",
+		DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
 				name, rate);
 }
 
 static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 {
-	int ret = 0;
-
-	dp_power_set_link_clk_parent(ctrl->power);
-	dp_power_set_pixel_clk_parent(ctrl->power);
+	struct dp_io *dp_io = &ctrl->parser->io;
+	struct phy *phy = dp_io->phy;
+	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
+	int ret;
 
+	opts_dp->lanes = ctrl->link->link_params.num_lanes;
+	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
 	dp_ctrl_set_clock_rate(ctrl, "ctrl_link_clk",
-					ctrl->link->link_params.rate);
+					ctrl->link->link_params.rate * 1000);
 
 	dp_ctrl_set_clock_rate(ctrl, "ctrl_pixel_clk",
-					ctrl->dp_ctrl.pixel_rate);
+					ctrl->dp_ctrl.pixel_rate * 1000);
+
+	phy_configure(phy, &dp_io->phy_opts);
+	phy_power_on(phy);
 
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
 	if (ret)
 		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
 
-	return ret;
+	return 0;
 }
 
 int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip)
 {
 	struct dp_ctrl_private *ctrl;
+	struct dp_io *dp_io;
+	struct phy *phy;
 
 	if (!dp_ctrl) {
 		DRM_ERROR("Invalid input data\n");
@@ -1332,10 +1342,12 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip)
 	}
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
 
 	ctrl->dp_ctrl.orientation = flip;
 
-	dp_catalog_ctrl_usb_reset(ctrl->catalog, flip);
+	phy_init(phy);
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
 
@@ -1374,7 +1386,7 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 	 * whenever connected to a VGA dongle downstream.
 	 */
 	if (drm_dp_is_branch(dpcd))
-		return (drm_dp_has_quirk(&ctrl->panel->desc,
+		return (drm_dp_has_quirk(&ctrl->panel->desc, 0,
 				DP_DPCD_QUIRK_CONSTANT_N));
 
 	return false;
@@ -1383,10 +1395,13 @@ static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
+	struct dp_io *dp_io = &ctrl->parser->io;
+	struct phy *phy = dp_io->phy;
+	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
-	dp_catalog_ctrl_phy_lane_cfg(ctrl->catalog,
-		ctrl->dp_ctrl.orientation, ctrl->link->link_params.num_lanes);
+	opts_dp->lanes = ctrl->link->link_params.num_lanes;
+	phy_configure(phy, &dp_io->phy_opts);
 	/*
 	 * Disable and re-enable the mainlink clock since the
 	 * link clock might have been adjusted as part of the
@@ -1397,6 +1412,7 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
 		return ret;
 	}
+	phy_power_off(phy);
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
 
@@ -1584,10 +1600,6 @@ int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
 		ctrl->link->link_params.rate,
 		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
 
-	dp_catalog_ctrl_phy_lane_cfg(ctrl->catalog,
-			ctrl->dp_ctrl.orientation,
-			ctrl->link->link_params.num_lanes);
-
 	rc = dp_ctrl_enable_mainlink_clocks(ctrl);
 	if (rc)
 		return rc;
@@ -1616,20 +1628,20 @@ int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
+	struct dp_io *dp_io;
+	struct phy *phy;
 	int ret = 0;
 
 	if (!dp_ctrl)
 		return -EINVAL;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 	dp_catalog_ctrl_reset(ctrl->catalog);
-	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
-	if (ret) {
-		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
-		return ret;
-	}
+	phy_power_off(phy);
 
 	DRM_DEBUG_DP("DP off done\n");
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0cc94ca88f20..4e9b2d1de6f3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -63,46 +63,6 @@ static const struct of_device_id dp_dt_match[] = {
 	{}
 };
 
-static int dp_get_pll(struct dp_display_private *dp_priv)
-{
-	struct platform_device *pdev = NULL;
-	struct platform_device *pll_pdev;
-	struct device_node *pll_node;
-	struct dp_parser *dp_parser = NULL;
-
-	pdev = dp_priv->pdev;
-	dp_parser = dp_priv->parser;
-
-	if (!dp_parser) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: Parser not initialized\n",
-				__func__);
-		return -EINVAL;
-	}
-
-	pll_node = of_parse_phandle(pdev->dev.of_node, "pll-node", 0);
-	if (!pll_node) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: cannot find pll device\n",
-				__func__);
-		return -ENXIO;
-	}
-
-	pll_pdev = of_find_device_by_node(pll_node);
-	if (pll_pdev)
-		dp_parser->pll = platform_get_drvdata(pll_pdev);
-
-	of_node_put(pll_node);
-
-	if (!pll_pdev || !dp_parser->pll) {
-		DRM_DEV_ERROR(&pdev->dev, "%s: pll driver is not ready\n",
-				__func__);
-		return -EPROBE_DEFER;
-	}
-
-	dp_parser->pll_dev = get_device(&pll_pdev->dev);
-
-	return 0;
-}
-
 static irqreturn_t dp_display_irq(int irq, void *dev_id)
 {
 	struct dp_display_private *dp = dev_id;
@@ -200,10 +160,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
-	rc = dp_get_pll(dp);
-	if (rc)
-		goto end;
-
 	rc = dp_aux_register(dp->aux);
 	if (rc) {
 		DRM_ERROR("DRM DP AUX register failed\n");
@@ -357,7 +313,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
 
 	dp_power_init(dp->power, flip);
 	dp_ctrl_host_init(dp->ctrl, flip);
-	dp_aux_init(dp->aux, dp->parser->aux_cfg);
+	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
 }
 
@@ -553,7 +509,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
-	dp->aux = dp_aux_get(dev, dp->catalog, dp->parser->aux_cfg);
+	dp->aux = dp_aux_get(dev, dp->catalog);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
 		DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
@@ -867,7 +823,6 @@ int __init msm_dp_register(void)
 {
 	int ret;
 
-	msm_dp_pll_driver_register();
 	ret = platform_driver_register(&dp_display_driver);
 	if (ret)
 		DRM_ERROR("Dp display driver register failed");
@@ -877,7 +832,6 @@ int __init msm_dp_register(void)
 
 void __exit msm_dp_unregister(void)
 {
-	msm_dp_pll_driver_unregister();
 	platform_driver_unregister(&dp_display_driver);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 4c53ed55d1cc..dad8610685a6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -25,7 +25,4 @@ int dp_display_request_irq(struct msm_dp *dp_display);
 bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
 
-void __init msm_dp_pll_driver_register(void);
-void __exit msm_dp_pll_driver_unregister(void);
-
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index b7869dbb1ed0..0a0e62732b74 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -5,6 +5,8 @@
 
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
 
+#include <drm/drm_print.h>
+
 #include "dp_link.h"
 #include "dp_panel.h"
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index a129924aff27..327ae38af5d7 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 
 #define DP_MAX_DS_PORT_COUNT 1
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 08c1abeaf1d3..8763a43318bd 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -4,6 +4,9 @@
  */
 
 #include <linux/of_gpio.h>
+#include <linux/phy/phy.h>
+
+#include <drm/drm_print.h>
 
 #include "dp_parser.h"
 
@@ -55,11 +58,6 @@ static void dp_parser_unmap_io_resources(struct dp_parser *parser)
 	msm_dss_iounmap(&io->dp_aux);
 	msm_dss_iounmap(&io->dp_link);
 	msm_dss_iounmap(&io->dp_p0);
-	msm_dss_iounmap(&io->phy_io);
-	msm_dss_iounmap(&io->ln_tx0_io);
-	msm_dss_iounmap(&io->ln_tx0_io);
-	msm_dss_iounmap(&io->dp_pll_io);
-	msm_dss_iounmap(&io->usb3_dp_com);
 	msm_dss_iounmap(&io->qfprom_io);
 }
 
@@ -101,118 +99,21 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 		goto err;
 	}
 
-	rc = msm_dss_ioremap_byname(pdev, &io->phy_io, "dp_phy");
-	if (rc) {
-		DRM_ERROR("unable to remap dp PHY resources, rc=%d\n", rc);
-		goto err;
-	}
-
-	rc = msm_dss_ioremap_byname(pdev, &io->ln_tx0_io, "dp_ln_tx0");
-	if (rc) {
-		DRM_ERROR("unable to remap dp TX0 resources, rc=%d\n", rc);
-		goto err;
-	}
-
-	rc = msm_dss_ioremap_byname(pdev, &io->ln_tx1_io, "dp_ln_tx1");
-	if (rc) {
-		DRM_ERROR("unable to remap dp TX1 resources, rc=%d\n", rc);
-		goto err;
-	}
-
-	rc = msm_dss_ioremap_byname(pdev, &io->dp_pll_io, "dp_pll");
-	if (rc) {
-		DRM_ERROR("unable to remap DP PLL resources, rc=%d\n", rc);
-		goto err;
-	}
+	if (msm_dss_ioremap_byname(pdev, &io->qfprom_io, "qfprom_physical"))
+		pr_warn("unable to remap dp qfprom resources\n");
 
-	rc = msm_dss_ioremap_byname(pdev, &io->usb3_dp_com, "usb3_dp_com");
-	if (rc) {
-		DRM_ERROR("unable to remap USB3 DP com resources, rc=%d\n", rc);
+	io->phy = devm_phy_get(&pdev->dev, "dp");
+	if (IS_ERR(io->phy)) {
+		rc = PTR_ERR(io->phy);
 		goto err;
 	}
 
-	if (msm_dss_ioremap_byname(pdev, &io->qfprom_io, "qfprom_physical"))
-		pr_warn("unable to remap dp qfprom resources\n");
-
 	return 0;
 err:
 	dp_parser_unmap_io_resources(parser);
 	return rc;
 }
 
-static const char *dp_get_phy_aux_config_property(u32 cfg_type)
-{
-	switch (cfg_type) {
-	case PHY_AUX_CFG0:
-		return "aux-cfg0-settings";
-	case PHY_AUX_CFG1:
-		return "aux-cfg1-settings";
-	case PHY_AUX_CFG2:
-		return "aux-cfg2-settings";
-	case PHY_AUX_CFG3:
-		return "aux-cfg3-settings";
-	case PHY_AUX_CFG4:
-		return "aux-cfg4-settings";
-	case PHY_AUX_CFG5:
-		return "aux-cfg5-settings";
-	case PHY_AUX_CFG6:
-		return "aux-cfg6-settings";
-	case PHY_AUX_CFG7:
-		return "aux-cfg7-settings";
-	case PHY_AUX_CFG8:
-		return "aux-cfg8-settings";
-	case PHY_AUX_CFG9:
-		return "aux-cfg9-settings";
-	default:
-		return "unknown";
-	}
-}
-
-static int dp_parser_aux(struct dp_parser *parser)
-{
-	struct device_node *of_node = parser->pdev->dev.of_node;
-	int len = 0, i = 0, j = 0, config_count = 0;
-	const char *data;
-
-	for (i = 0; i < PHY_AUX_CFG_MAX; i++) {
-		const char *property = dp_get_phy_aux_config_property(i);
-
-		data = of_get_property(of_node, property, &len);
-		if (!data) {
-			DRM_ERROR("Unable to read %s\n", property);
-			goto error;
-		}
-
-		config_count = len - 1;
-		if (config_count < 1 || /* minimum config count = 1 */
-			config_count > DP_AUX_CFG_MAX_VALUE_CNT) {
-			DRM_ERROR("Invalid config count (%d) configs for %s\n",
-					config_count, property);
-			goto error;
-		}
-
-		parser->aux_cfg[i].offset = data[0];
-		parser->aux_cfg[i].cfg_cnt = config_count;
-		DRM_DEBUG_DP("%s offset=0x%x, cfg_cnt=%d\n",
-				property,
-				parser->aux_cfg[i].offset,
-				parser->aux_cfg[i].cfg_cnt);
-		for (j = 1; j < len; j++) {
-			parser->aux_cfg[i].lut[j - 1] = data[j];
-			DRM_DEBUG_DP("%s lut[%d]=0x%x\n",
-					property,
-					i,
-					parser->aux_cfg[i].lut[j - 1]);
-		}
-	}
-		return 0;
-
-error:
-	memset(parser->aux_cfg, 0, sizeof(parser->aux_cfg));
-
-	return -EINVAL;
-}
-
 static int dp_parser_misc(struct dp_parser *parser)
 {
 	u32 rc;
@@ -257,7 +158,7 @@ static int dp_parser_pinctrl(struct dp_parser *parser)
 	pinctrl->state_active = pinctrl_lookup_state(pinctrl->pin,
 					"mdss_dp_active");
 	if (IS_ERR(pinctrl->state_active)) {
-		DRM_ERROR("failed to get pinctrl active state, %d\n",
+		DRM_ERROR("failed to get pinctrl active state, %ld\n",
 			PTR_ERR(pinctrl->state_active));
 		return -EINVAL;
 	}
@@ -265,7 +166,7 @@ static int dp_parser_pinctrl(struct dp_parser *parser)
 	pinctrl->state_suspend = pinctrl_lookup_state(pinctrl->pin,
 					"mdss_dp_sleep");
 	if (IS_ERR(pinctrl->state_suspend)) {
-		DRM_ERROR("failed to get pinctrl suspend state, %d\n",
+		DRM_ERROR("failed to get pinctrl suspend state, %ld\n",
 			PTR_ERR(pinctrl->state_suspend));
 		return -EINVAL;
 	}
@@ -451,10 +352,6 @@ static int dp_parser_parse(struct dp_parser *parser)
 	if (rc)
 		return rc;
 
-	rc = dp_parser_aux(parser);
-	if (rc)
-		return rc;
-
 	rc = dp_parser_misc(parser);
 	if (rc)
 		return rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index f9c572e8fd90..e1972ad48c45 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -6,7 +6,10 @@
 #ifndef _DP_PARSER_H_
 #define _DP_PARSER_H_
 
-#include "pll/dp_pll.h"
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-dp.h>
+
+#include "dpu_io_util.h"
 
 #define DP_LABEL "MDSS DP DISPLAY"
 #define AUX_CFG_LEN	10
@@ -59,12 +62,7 @@ struct dp_display_data {
  * @dp_aux: controller's aux mapped memory address
  * @dp_link: controller's link mapped memory address
  * @dp_p0: controller's p0 mapped memory address
- * @phy_io: phy's mapped memory address
- * @ln_tx0_io: USB-DP lane TX0's mapped memory address
- * @ln_tx1_io: USB-DP lane TX1's mapped memory address
  * @qfprom_io: qfprom's mapped memory address
- * @dp_pll_io: DP PLL mapped memory address
- * @usb3_dp_com: USB3 DP PHY combo mapped memory address
  */
 struct dp_io {
 	struct dss_io_data ctrl_io;
@@ -72,12 +70,9 @@ struct dp_io {
 	struct dss_io_data dp_aux;
 	struct dss_io_data dp_link;
 	struct dss_io_data dp_p0;
-	struct dss_io_data phy_io;
-	struct dss_io_data ln_tx0_io;
-	struct dss_io_data ln_tx1_io;
 	struct dss_io_data qfprom_io;
-	struct dss_io_data dp_pll_io;
-	struct dss_io_data usb3_dp_com;
+	struct phy *phy;
+	union phy_configure_opts phy_opts;
 };
 
 /**
@@ -95,38 +90,6 @@ struct dp_pinctrl {
 	struct pinctrl_state *state_suspend;
 };
 
-#define DP_ENUM_STR(x)	#x
-#define DP_AUX_CFG_MAX_VALUE_CNT 3
-/**
- * struct dp_aux_cfg - DP's AUX configuration settings
- *
- * @cfg_cnt: count of the configurable settings for the AUX register
- * @current_index: current index of the AUX config lut
- * @offset: register offset of the AUX config register
- * @lut: look up table for the AUX config values for this register
- */
-struct dp_aux_cfg {
-	u32 cfg_cnt;
-	u32 current_index;
-	u32 offset;
-	u32 lut[DP_AUX_CFG_MAX_VALUE_CNT];
-};
-
-/* PHY AUX config registers */
-enum dp_phy_aux_config_type {
-	PHY_AUX_CFG0,
-	PHY_AUX_CFG1,
-	PHY_AUX_CFG2,
-	PHY_AUX_CFG3,
-	PHY_AUX_CFG4,
-	PHY_AUX_CFG5,
-	PHY_AUX_CFG6,
-	PHY_AUX_CFG7,
-	PHY_AUX_CFG8,
-	PHY_AUX_CFG9,
-	PHY_AUX_CFG_MAX,
-};
-
 #define DP_DEV_REGULATOR_MAX	4
 
 /* Regulators for DP devices */
@@ -141,35 +104,6 @@ struct dp_regulator_cfg {
 	struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];
 };
 
-
-static inline char *dp_phy_aux_config_type_to_string(u32 cfg_type)
-{
-	switch (cfg_type) {
-	case PHY_AUX_CFG0:
-		return DP_ENUM_STR(PHY_AUX_CFG0);
-	case PHY_AUX_CFG1:
-		return DP_ENUM_STR(PHY_AUX_CFG1);
-	case PHY_AUX_CFG2:
-		return DP_ENUM_STR(PHY_AUX_CFG2);
-	case PHY_AUX_CFG3:
-		return DP_ENUM_STR(PHY_AUX_CFG3);
-	case PHY_AUX_CFG4:
-		return DP_ENUM_STR(PHY_AUX_CFG4);
-	case PHY_AUX_CFG5:
-		return DP_ENUM_STR(PHY_AUX_CFG5);
-	case PHY_AUX_CFG6:
-		return DP_ENUM_STR(PHY_AUX_CFG6);
-	case PHY_AUX_CFG7:
-		return DP_ENUM_STR(PHY_AUX_CFG7);
-	case PHY_AUX_CFG8:
-		return DP_ENUM_STR(PHY_AUX_CFG8);
-	case PHY_AUX_CFG9:
-		return DP_ENUM_STR(PHY_AUX_CFG9);
-	default:
-		return "unknown";
-	}
-}
-
 /**
  * struct dp_parser - DP parser's data exposed to clients
  *
@@ -194,11 +128,8 @@ struct dp_parser {
 	bool combo_phy_en;
 	struct dp_io io;
 	struct dp_display_data disp_data;
-	struct msm_dp_pll *pll;
-	struct device *pll_dev;
 	const struct dp_regulator_cfg *regulator_cfg;
 	u8 l_map[4];
-	struct dp_aux_cfg aux_cfg[AUX_CFG_LEN];
 	u32 max_pclk_khz;
 	u32 max_dp_lanes;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 26f84b351c7b..f6fd83beeb73 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -9,6 +9,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/of_gpio.h>
 #include "dp_power.h"
+#include "msm_drv.h"
 
 struct dp_power_private {
 	struct dp_parser *parser;
@@ -124,16 +125,6 @@ static int dp_power_clk_init(struct dp_power_private *power)
 	core = &power->parser->mp[DP_CORE_PM];
 	ctrl = &power->parser->mp[DP_CTRL_PM];
 
-	if (power->parser->pll && power->parser->pll->get_provider) {
-		rc = power->parser->pll->get_provider(power->parser->pll,
-				&power->link_provider, &power->pixel_provider);
-		if (rc) {
-			DRM_ERROR("%s:provider failed,don't set parent\n",
-					__func__);
-			return 0;
-		}
-	}
-
 	rc = msm_dss_get_clk(dev, core->clk_config, core->num_clk);
 	if (rc) {
 		DRM_ERROR("failed to get %s clk. err=%d\n",
@@ -390,73 +381,6 @@ void dp_power_client_deinit(struct dp_power *dp_power)
 
 }
 
-int dp_power_set_link_clk_parent(struct dp_power *dp_power)
-{
-	int rc = 0;
-	struct dp_power_private *power;
-	u32 num;
-	struct dss_clk *cfg;
-	char *name = "ctrl_link_clk";
-
-	if (!dp_power) {
-		DRM_ERROR("invalid power data\n");
-		rc = -EINVAL;
-		goto exit;
-	}
-
-	power = container_of(dp_power, struct dp_power_private, dp_power);
-
-	num = power->parser->mp[DP_CTRL_PM].num_clk;
-	cfg = power->parser->mp[DP_CTRL_PM].clk_config;
-
-	while (num && strcmp(cfg->clk_name, name)) {
-		num--;
-		cfg++;
-	}
-
-	if (num && power->link_provider) {
-		power->link_clk_src = clk_get_parent(cfg->clk);
-			if (power->link_clk_src) {
-				clk_set_parent(power->link_clk_src,
-						power->link_provider);
-				DRM_DEBUG_DP("%s: is the parent of clk=%s\n",
-					__clk_get_name(power->link_provider),
-					__clk_get_name(power->link_clk_src));
-			} else {
-				DRM_ERROR("couldn't get parent for clk=%s\n",
-					name);
-				rc = -EINVAL;
-			}
-	} else {
-		DRM_ERROR("%s clock could not be set parent\n", name);
-		rc = -EINVAL;
-	}
-exit:
-	return rc;
-}
-
-int dp_power_set_pixel_clk_parent(struct dp_power *dp_power)
-{
-	int rc = 0;
-	struct dp_power_private *power;
-
-	power = container_of(dp_power, struct dp_power_private, dp_power);
-
-	if (power->pixel_clk_rcg && power->pixel_provider) {
-		rc = clk_set_parent(power->pixel_clk_rcg,
-				power->pixel_provider);
-		if (rc) {
-			DRM_ERROR("failed to set parent clk src, %d\n", rc);
-			return rc;
-		}
-		DRM_DEBUG_DP("%s: is the parent of clk=%s\n",
-				__clk_get_name(power->pixel_provider),
-				__clk_get_name(power->pixel_clk_rcg));
-	}
-
-	return 0;
-}
-
 int dp_power_init(struct dp_power *dp_power, bool flip)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 3dc4a525f435..d61194eb58aa 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -57,27 +57,6 @@ int dp_power_deinit(struct dp_power *power);
 
 int dp_power_clk_enable(struct dp_power *power, enum dp_pm_type pm_type,
 				bool enable);
-/**
- * dp_power_set_link_clk_parent() - configures parent of link clocks
- *
- * @power: instance of power module
- * return: 0 for success, error for failures
- *
- * This API will set the link clock parent source
- */
-int dp_power_set_link_clk_parent(struct dp_power *power);
-
-
-/**
- * dp_power_set_pixel_clk_parent() - configures parent of pixel clocks
- *
- * @power: instance of power module
- * return: 0 for success, error for failures
- *
- * This API will set the pixel clock parent source
- */
-int dp_power_set_pixel_clk_parent(struct dp_power *power);
-
 /**
  * dp_power_clinet_init() - initialize clock and regulator modules
  *
diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll.c b/drivers/gpu/drm/msm/dp/pll/dp_pll.c
deleted file mode 100644
index a58eb710685e..000000000000
--- a/drivers/gpu/drm/msm/dp/pll/dp_pll.c
+++ /dev/null
@@ -1,127 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
- */
-
-#include "dp_pll.h"
-
-int msm_dp_pll_util_parse_dt_clock(struct platform_device *pdev,
-					struct msm_dp_pll *pll)
-{
-	u32 i = 0, rc = 0;
-	struct dss_module_power *mp = &pll->mp;
-	const char *clock_name;
-
-	mp->num_clk = of_property_count_strings(pdev->dev.of_node,
-							"clock-names");
-	if (mp->num_clk <= 0) {
-		DRM_DEV_ERROR(&pdev->dev, "%s:clocks are not defined\n",
-				__func__);
-		goto clk_err;
-	}
-
-	mp->clk_config = devm_kcalloc(&pdev->dev,
-			sizeof(struct dss_clk), mp->num_clk, GFP_KERNEL);
-	if (!mp->clk_config) {
-		rc = -ENOMEM;
-		mp->num_clk = 0;
-		goto clk_err;
-	}
-
-	for (i = 0; i < mp->num_clk; i++) {
-		of_property_read_string_index(pdev->dev.of_node, "clock-names",
-							i, &clock_name);
-		strlcpy(mp->clk_config[i].clk_name, clock_name,
-				sizeof(mp->clk_config[i].clk_name));
-
-		mp->clk_config[i].type = DSS_CLK_AHB;
-	}
-
-clk_err:
-	return rc;
-}
-
-struct msm_dp_pll *msm_dp_pll_init(struct platform_device *pdev,
-			enum msm_dp_pll_type type, int id)
-{
-	struct device *dev = &pdev->dev;
-	struct msm_dp_pll *pll;
-
-	switch (type) {
-	case MSM_DP_PLL_10NM:
-		pll = msm_dp_pll_10nm_init(pdev, id);
-		break;
-	default:
-		pll = ERR_PTR(-ENXIO);
-		break;
-	}
-
-	if (IS_ERR(pll)) {
-		DRM_DEV_ERROR(dev, "%s: failed to init DP PLL\n", __func__);
-		return pll;
-	}
-
-	pll->type = type;
-
-	DRM_DEBUG_DP("DP:%d PLL registered", id);
-
-	return pll;
-}
-
-static const struct of_device_id dp_pll_dt_match[] = {
-	{ .compatible = "qcom,dp-pll-10nm" },
-	{ }
-};
-
-static int dp_pll_driver_probe(struct platform_device *pdev)
-{
-	struct msm_dp_pll *pll;
-	struct device *dev = &pdev->dev;
-	const struct of_device_id *match;
-
-	match = of_match_node(dp_pll_dt_match, dev->of_node);
-	if (!match)
-		return -ENODEV;
-
-	pll = msm_dp_pll_init(pdev, MSM_DP_PLL_10NM, 0);
-	if (IS_ERR_OR_NULL(pll)) {
-		DRM_DEV_ERROR(dev,
-			"%s: pll init failed: %ld\n",__func__, PTR_ERR(pll));
-		return -ENODEV;
-	}
-
-	platform_set_drvdata(pdev, pll);
-
-	return 0;
-}
-
-static int dp_pll_driver_remove(struct platform_device *pdev)
-{
-	struct msm_dp_pll *pll = platform_get_drvdata(pdev);
-
-	if (pll)
-		pll = NULL;
-
-	platform_set_drvdata(pdev, NULL);
-
-	return 0;
-}
-
-static struct platform_driver dp_pll_platform_driver = {
-	.probe      = dp_pll_driver_probe,
-	.remove     = dp_pll_driver_remove,
-	.driver     = {
-		.name   = "msm_dp_pll",
-		.of_match_table = dp_pll_dt_match,
-	},
-};
-
-void __init msm_dp_pll_driver_register(void)
-{
-	platform_driver_register(&dp_pll_platform_driver);
-}
-
-void __exit msm_dp_pll_driver_unregister(void)
-{
-	platform_driver_unregister(&dp_pll_platform_driver);
-}
diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll.h b/drivers/gpu/drm/msm/dp/pll/dp_pll.h
deleted file mode 100644
index 236a55bee8da..000000000000
--- a/drivers/gpu/drm/msm/dp/pll/dp_pll.h
+++ /dev/null
@@ -1,57 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
- */
-
-#ifndef __DP_PLL_H
-#define __DP_PLL_H
-
-#include <linux/clk.h>
-#include <linux/clk-provider.h>
-#include <linux/platform_device.h>
-
-#include "dpu_io_util.h"
-#include "msm_drv.h"
-
-#define PLL_REG_W(base, offset, data)	\
-				writel((data), (base) + (offset))
-#define PLL_REG_R(base, offset)	readl((base) + (offset))
-
-enum msm_dp_pll_type {
-	MSM_DP_PLL_10NM,
-	MSM_DP_PLL_MAX
-};
-
-struct msm_dp_pll {
-	enum msm_dp_pll_type type;
-	struct clk_hw clk_hw;
-	unsigned long	rate;		/* current vco rate */
-	u64		min_rate;	/* min vco rate */
-	u64		max_rate;	/* max vco rate */
-	bool		pll_on;
-	void		*priv;
-	/* Pll specific resources like GPIO, power supply, clocks, etc*/
-	struct dss_module_power mp;
-	int (*get_provider)(struct msm_dp_pll *pll,
-			struct clk **link_clk_provider,
-			struct clk **pixel_clk_provider);
-};
-
-#define to_msm_dp_pll(x) container_of(x, struct msm_dp_pll, clk_hw)
-
-struct msm_dp_pll *msm_dp_pll_init(struct platform_device *pdev,
-				enum msm_dp_pll_type type, int id);
-
-int msm_dp_pll_util_parse_dt_clock(struct platform_device *pdev,
-				struct msm_dp_pll *pll);
-
-#ifdef CONFIG_DRM_MSM_DP_10NM_PLL
-struct msm_dp_pll *msm_dp_pll_10nm_init(struct platform_device *pdev, int id);
-#else
-static inline struct msm_dp_pll *
-msm_dp_pll_10nm_init(struct platform_device *pdev, int id)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
-#endif /* __DP_PLL_H */
diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
deleted file mode 100644
index aa845d0f5a03..000000000000
--- a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
+++ /dev/null
@@ -1,401 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
- */
-
-/*
- * Display Port PLL driver block diagram for branch clocks
- *
- *              +------------------------------+
- *              |         DP_VCO_CLK           |
- *              |                              |
- *              |    +-------------------+     |
- *              |    |   (DP PLL/VCO)    |     |
- *              |    +---------+---------+     |
- *              |              v               |
- *              |   +----------+-----------+   |
- *              |   | hsclk_divsel_clk_src |   |
- *              |   +----------+-----------+   |
- *              +------------------------------+
- *                              |
- *          +---------<---------v------------>----------+
- *          |                                           |
- * +--------v---------+                                 |
- * |    dp_phy_pll    |                                 |
- * |     link_clk     |                                 |
- * +--------+---------+                                 |
- *          |                                           |
- *          |                                           |
- *          v                                           v
- * Input to DISPCC block                                |
- * for link clk, crypto clk                             |
- * and interface clock                                  |
- *                                                      |
- *                                                      |
- *      +--------<------------+-----------------+---<---+
- *      |                     |                 |
- * +----v---------+  +--------v-----+  +--------v------+
- * | vco_divided  |  | vco_divided  |  | vco_divided   |
- * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
- * |              |  |              |  |               |
- * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
- * +-------+------+  +-----+--------+  +--------+------+
- *         |                 |                  |
- *         v---->----------v-------------<------v
- *                         |
- *              +----------+---------+
- *              |   dp_phy_pll_vco   |
- *              |       div_clk      |
- *              +---------+----------+
- *                        |
- *                        v
- *              Input to DISPCC block
- *              for DP pixel clock
- *
- */
-
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/err.h>
-#include <linux/kernel.h>
-#include <linux/regmap.h>
-
-#include "dp_pll_10nm.h"
-
-#define NUM_PROVIDED_CLKS		2
-
-#define DP_LINK_CLK_SRC			0
-#define DP_PIXEL_CLK_SRC		1
-
-static struct dp_pll_10nm *dp_pdb;
-
-static const struct clk_ops dp_10nm_vco_clk_ops = {
-	.recalc_rate = dp_vco_recalc_rate_10nm,
-	.set_rate = dp_vco_set_rate_10nm,
-	.round_rate = dp_vco_round_rate_10nm,
-	.prepare = dp_vco_prepare_10nm,
-	.unprepare = dp_vco_unprepare_10nm,
-};
-
-struct dp_pll_10nm_pclksel {
-	struct clk_hw hw;
-
-	/* divider params */
-	u8 shift;
-	u8 width;
-	u8 flags; /* same flags as used by clk_divider struct */
-
-	struct dp_pll_10nm *pll;
-};
-#define to_pll_10nm_pclksel(_hw) \
-	container_of(_hw, struct dp_pll_10nm_pclksel, hw)
-
-static const struct clk_parent_data disp_cc_parent_data_0[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dp_phy_pll_link_clk", .name = "dp_phy_pll_link_clk" },
-	{ .fw_name = "dp_phy_pll_vco_div_clk",
-				.name = "dp_phy_pll_vco_div_clk"},
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
-};
-
-static int dp_pll_mux_set_parent_10nm(struct clk_hw *hw, u8 val)
-{
-	struct dp_pll_10nm_pclksel *pclksel = to_pll_10nm_pclksel(hw);
-	struct dp_pll_10nm *dp_res = pclksel->pll;
-	u32 auxclk_div;
-
-	auxclk_div = PLL_REG_R(dp_res->phy_base, REG_DP_PHY_VCO_DIV);
-	auxclk_div &= ~0x03;
-
-	if (val == 0)
-		auxclk_div |= 1;
-	else if (val == 1)
-		auxclk_div |= 2;
-	else if (val == 2)
-		auxclk_div |= 0;
-
-	PLL_REG_W(dp_res->phy_base,
-			REG_DP_PHY_VCO_DIV, auxclk_div);
-	DRM_DEBUG_DP("%s: mux=%d auxclk_div=%x\n", __func__, val, auxclk_div);
-
-	return 0;
-}
-
-static u8 dp_pll_mux_get_parent_10nm(struct clk_hw *hw)
-{
-	u32 auxclk_div = 0;
-	struct dp_pll_10nm_pclksel *pclksel = to_pll_10nm_pclksel(hw);
-	struct dp_pll_10nm *dp_res = pclksel->pll;
-	u8 val = 0;
-
-	auxclk_div = PLL_REG_R(dp_res->phy_base, REG_DP_PHY_VCO_DIV);
-	auxclk_div &= 0x03;
-
-	if (auxclk_div == 1) /* Default divider */
-		val = 0;
-	else if (auxclk_div == 2)
-		val = 1;
-	else if (auxclk_div == 0)
-		val = 2;
-
-	DRM_DEBUG_DP("%s: auxclk_div=%d, val=%d\n", __func__, auxclk_div, val);
-
-	return val;
-}
-
-static int dp_pll_clk_mux_determine_rate(struct clk_hw *hw,
-				     struct clk_rate_request *req)
-{
-	unsigned long rate = 0;
-	int ret = 0;
-
-	rate = clk_get_rate(hw->clk);
-
-	if (rate <= 0) {
-		DRM_ERROR("Rate is not set properly\n");
-		return -EINVAL;
-	}
-
-	req->rate = rate;
-
-	DRM_DEBUG_DP("%s: rate=%ld\n", __func__, req->rate);
-	/* Set the new parent of mux if there is a new valid parent */
-	if (hw->clk && req->best_parent_hw->clk) {
-		ret = clk_set_parent(hw->clk, req->best_parent_hw->clk);
-		if (ret) {
-			DRM_ERROR("%s: clk_set_parent failed: ret=%d\n",
-					__func__, ret);
-			return ret;
-		}
-	}
-	return 0;
-}
-
-static unsigned long dp_pll_mux_recalc_rate(struct clk_hw *hw,
-					unsigned long parent_rate)
-{
-	struct clk_hw *div_clk_hw = NULL, *vco_clk_hw = NULL;
-	struct msm_dp_pll *vco = NULL;
-
-	div_clk_hw = clk_hw_get_parent(hw);
-	if (!div_clk_hw)
-		return 0;
-
-	vco_clk_hw = clk_hw_get_parent(div_clk_hw);
-	if (!vco_clk_hw)
-		return 0;
-
-	vco = to_msm_dp_pll(vco_clk_hw);
-	if (!vco)
-		return 0;
-
-	if (vco->rate == DP_VCO_HSCLK_RATE_8100MHZDIV1000)
-		return (vco->rate / 6);
-	else if (vco->rate == DP_VCO_HSCLK_RATE_5400MHZDIV1000)
-		return (vco->rate / 4);
-	else
-		return (vco->rate / 2);
-}
-
-static int dp_pll_10nm_get_provider(struct msm_dp_pll *pll,
-				     struct clk **link_clk_provider,
-				     struct clk **pixel_clk_provider)
-{
-	struct dp_pll_10nm *pll_10nm = to_dp_pll_10nm(pll);
-	struct clk_hw_onecell_data *hw_data = pll_10nm->hw_data;
-
-	if (link_clk_provider)
-		*link_clk_provider = hw_data->hws[DP_LINK_CLK_SRC]->clk;
-	if (pixel_clk_provider)
-		*pixel_clk_provider = hw_data->hws[DP_PIXEL_CLK_SRC]->clk;
-
-	return 0;
-}
-
-static const struct clk_ops dp_10nm_pclksel_clk_ops = {
-	.get_parent = dp_pll_mux_get_parent_10nm,
-	.set_parent = dp_pll_mux_set_parent_10nm,
-	.recalc_rate = dp_pll_mux_recalc_rate,
-	.determine_rate = dp_pll_clk_mux_determine_rate,
-};
-
-static struct clk_hw *dp_pll_10nm_pixel_clk_sel(struct dp_pll_10nm *pll_10nm)
-{
-	struct device *dev = &pll_10nm->pdev->dev;
-	struct dp_pll_10nm_pclksel *pll_pclksel;
-	struct clk_init_data pclksel_init = {
-		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 3,
-		.name = "dp_phy_pll_vco_div_clk",
-		.ops = &dp_10nm_pclksel_clk_ops,
-	};
-	int ret;
-
-	pll_pclksel = devm_kzalloc(dev, sizeof(*pll_pclksel), GFP_KERNEL);
-	if (!pll_pclksel)
-		return ERR_PTR(-ENOMEM);
-
-	pll_pclksel->pll = pll_10nm;
-	pll_pclksel->shift = 0;
-	pll_pclksel->width = 4;
-	pll_pclksel->flags = CLK_DIVIDER_ONE_BASED;
-	pll_pclksel->hw.init = &pclksel_init;
-
-	ret = clk_hw_register(dev, &pll_pclksel->hw);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return &pll_pclksel->hw;
-}
-
-static int dp_pll_10nm_register(struct dp_pll_10nm *pll_10nm)
-{
-	struct clk_init_data vco_init = {
-		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "bi_tcxo",
-		},
-		.num_parents = 1,
-		.name = "dp_vco_clk",
-		.ops = &dp_10nm_vco_clk_ops,
-	};
-	struct device *dev = &pll_10nm->pdev->dev;
-	struct clk_hw **hws = pll_10nm->hws;
-	struct clk_hw_onecell_data *hw_data;
-	struct clk_hw *hw;
-	int num = 0;
-	int ret;
-
-	DRM_DEBUG_DP("DP->id = %d", pll_10nm->id);
-
-	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
-			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
-			       GFP_KERNEL);
-	if (!hw_data)
-		return -ENOMEM;
-
-	pll_10nm->base.clk_hw.init = &vco_init;
-	ret = clk_hw_register(dev, &pll_10nm->base.clk_hw);
-	if (ret)
-		return ret;
-	hws[num++] = &pll_10nm->base.clk_hw;
-
-	hw = clk_hw_register_fixed_factor(dev, "dp_phy_pll_link_clk", "dp_vco_clk",
-					  CLK_SET_RATE_PARENT, 1, 10);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-	hws[num++] = hw;
-	hw_data->hws[DP_LINK_CLK_SRC] = hw;
-
-	hw = clk_hw_register_fixed_factor(dev, "dp_vco_divsel_two_clk_src", "dp_vco_clk",
-					  0, 1, 2);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-	hws[num++] = hw;
-
-	hw = clk_hw_register_fixed_factor(dev, "dp_vco_divsel_four_clk_src", "dp_vco_clk",
-					  0, 1, 4);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-	hws[num++] = hw;
-
-	hw = clk_hw_register_fixed_factor(dev, "dp_vco_divsel_six_clk_src", "dp_vco_clk",
-					  0, 1, 6);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-	hws[num++] = hw;
-
-	hw = dp_pll_10nm_pixel_clk_sel(pll_10nm);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-
-	hws[num++] = hw;
-	hw_data->hws[DP_PIXEL_CLK_SRC] = hw;
-
-	pll_10nm->num_hws = num;
-
-	hw_data->num = NUM_PROVIDED_CLKS;
-	pll_10nm->hw_data = hw_data;
-
-	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				     pll_10nm->hw_data);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n",
-				ret);
-		return ret;
-	}
-
-	return ret;
-}
-
-struct msm_dp_pll *msm_dp_pll_10nm_init(struct platform_device *pdev, int id)
-{
-	struct dp_pll_10nm *dp_10nm_pll;
-	struct msm_dp_pll *pll;
-	int ret;
-
-	if (!pdev)
-		return ERR_PTR(-ENODEV);
-
-	dp_10nm_pll = devm_kzalloc(&pdev->dev,
-					sizeof(*dp_10nm_pll), GFP_KERNEL);
-	if (!dp_10nm_pll)
-		return ERR_PTR(-ENOMEM);
-
-	DRM_DEBUG_DP("DP PLL%d", id);
-
-	dp_10nm_pll->pdev = pdev;
-	dp_10nm_pll->id = id;
-	dp_pdb = dp_10nm_pll;
-
-	dp_10nm_pll->pll_base = msm_ioremap(pdev, "pll_base", "DP_PLL");
-	if (IS_ERR_OR_NULL(dp_10nm_pll->pll_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PLL base\n");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	dp_10nm_pll->phy_base = msm_ioremap(pdev, "phy_base", "DP_PHY");
-	if (IS_ERR_OR_NULL(dp_10nm_pll->phy_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN PHY base\n");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	dp_10nm_pll->ln_tx0_base = msm_ioremap(pdev, "ln_tx0_base",
-						"DP_LN_TX0");
-	if (IS_ERR_OR_NULL(dp_10nm_pll->ln_tx0_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN LN_TX0 base\n");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	dp_10nm_pll->ln_tx1_base = msm_ioremap(pdev, "ln_tx1_base",
-						"DP_LN_TX1");
-	if (IS_ERR_OR_NULL(dp_10nm_pll->ln_tx1_base)) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to map CMN LN_TX1 base\n");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	ret = of_property_read_u32(pdev->dev.of_node, "cell-index",
-				&dp_10nm_pll->index);
-	if (ret) {
-		DRM_ERROR("Unable to get the cell-index ret=%d\n", ret);
-		dp_10nm_pll->index = 0;
-	}
-
-	ret = msm_dp_pll_util_parse_dt_clock(pdev, &dp_10nm_pll->base);
-	if (ret) {
-		DRM_ERROR("Unable to parse dt clocks ret=%d\n", ret);
-		return ERR_PTR(ret);
-	}
-
-	ret = dp_pll_10nm_register(dp_10nm_pll);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-		return ERR_PTR(ret);
-	}
-
-	pll = &dp_10nm_pll->base;
-	pll->min_rate = DP_VCO_HSCLK_RATE_1620MHZDIV1000;
-	pll->max_rate = DP_VCO_HSCLK_RATE_8100MHZDIV1000;
-	pll->get_provider = dp_pll_10nm_get_provider;
-
-	return pll;
-}
diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
deleted file mode 100644
index 84664634a53d..000000000000
--- a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
+++ /dev/null
@@ -1,86 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
- */
-
-#ifndef __DP_PLL_10NM_H
-#define __DP_PLL_10NM_H
-
-#include "dp_pll.h"
-#include "dp_reg.h"
-
-#define DP_VCO_HSCLK_RATE_1620MHZDIV1000	1620000UL
-#define DP_VCO_HSCLK_RATE_2700MHZDIV1000	2700000UL
-#define DP_VCO_HSCLK_RATE_5400MHZDIV1000	5400000UL
-#define DP_VCO_HSCLK_RATE_8100MHZDIV1000	8100000UL
-
-#define NUM_DP_CLOCKS_MAX			6
-
-#define DP_PHY_PLL_POLL_SLEEP_US		500
-#define DP_PHY_PLL_POLL_TIMEOUT_US		10000
-
-#define DP_VCO_RATE_8100MHZDIV1000		8100000UL
-#define DP_VCO_RATE_9720MHZDIV1000		9720000UL
-#define DP_VCO_RATE_10800MHZDIV1000		10800000UL
-
-struct dp_pll_10nm {
-	struct msm_dp_pll base;
-
-	int id;
-	struct platform_device *pdev;
-
-	void __iomem *pll_base;
-	void __iomem *phy_base;
-	void __iomem *ln_tx0_base;
-	void __iomem *ln_tx1_base;
-
-	/* private clocks: */
-	struct clk_hw *hws[NUM_DP_CLOCKS_MAX];
-	u32 num_hws;
-
-	/* clock-provider: */
-	struct clk_hw_onecell_data *hw_data;
-
-	/* lane and orientation settings */
-	u8 lane_cnt;
-	u8 orientation;
-
-	/* COM PHY settings */
-	u32 hsclk_sel;
-	u32 dec_start_mode0;
-	u32 div_frac_start1_mode0;
-	u32 div_frac_start2_mode0;
-	u32 div_frac_start3_mode0;
-	u32 integloop_gain0_mode0;
-	u32 integloop_gain1_mode0;
-	u32 vco_tune_map;
-	u32 lock_cmp1_mode0;
-	u32 lock_cmp2_mode0;
-	u32 lock_cmp3_mode0;
-	u32 lock_cmp_en;
-
-	/* PHY vco divider */
-	u32 phy_vco_div;
-	/*
-	 * Certain pll's needs to update the same vco rate after resume in
-	 * suspend/resume scenario. Cached the vco rate for such plls.
-	 */
-	unsigned long	vco_cached_rate;
-	u32		cached_cfg0;
-	u32		cached_cfg1;
-	u32		cached_outdiv;
-
-	uint32_t index;
-};
-
-#define to_dp_pll_10nm(x)	container_of(x, struct dp_pll_10nm, base)
-
-int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
-				unsigned long parent_rate);
-unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
-				unsigned long parent_rate);
-long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate);
-int dp_vco_prepare_10nm(struct clk_hw *hw);
-void dp_vco_unprepare_10nm(struct clk_hw *hw);
-#endif /* __DP_PLL_10NM_H */
diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c
deleted file mode 100644
index fff2e8d16e3b..000000000000
--- a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c
+++ /dev/null
@@ -1,524 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
- */
-
-#define pr_fmt(fmt)	"%s: " fmt, __func__
-
-#include <linux/delay.h>
-#include <linux/err.h>
-#include <linux/iopoll.h>
-#include <linux/kernel.h>
-
-#include "dp_hpd.h"
-#include "dp_pll.h"
-#include "dp_pll_10nm.h"
-
-static int dp_vco_pll_init_db_10nm(struct msm_dp_pll *pll,
-		unsigned long rate)
-{
-	struct dp_pll_10nm *dp_res = to_dp_pll_10nm(pll);
-	u32 spare_value = 0;
-
-	spare_value = PLL_REG_R(dp_res->phy_base, REG_DP_PHY_SPARE0);
-	dp_res->lane_cnt = spare_value & 0x0F;
-	dp_res->orientation = (spare_value & 0xF0) >> 4;
-
-	DRM_DEBUG_DP("%s: spare_value=0x%x, ln_cnt=0x%x, orientation=0x%x\n",
-			__func__, spare_value, dp_res->lane_cnt,
-			dp_res->orientation);
-
-	switch (rate) {
-	case DP_VCO_HSCLK_RATE_1620MHZDIV1000:
-		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
-				DP_VCO_RATE_9720MHZDIV1000);
-		dp_res->hsclk_sel = 0x0c;
-		dp_res->dec_start_mode0 = 0x69;
-		dp_res->div_frac_start1_mode0 = 0x00;
-		dp_res->div_frac_start2_mode0 = 0x80;
-		dp_res->div_frac_start3_mode0 = 0x07;
-		dp_res->integloop_gain0_mode0 = 0x3f;
-		dp_res->integloop_gain1_mode0 = 0x00;
-		dp_res->vco_tune_map = 0x00;
-		dp_res->lock_cmp1_mode0 = 0x6f;
-		dp_res->lock_cmp2_mode0 = 0x08;
-		dp_res->lock_cmp3_mode0 = 0x00;
-		dp_res->phy_vco_div = 0x1;
-		dp_res->lock_cmp_en = 0x00;
-		break;
-	case DP_VCO_HSCLK_RATE_2700MHZDIV1000:
-		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
-				DP_VCO_RATE_10800MHZDIV1000);
-		dp_res->hsclk_sel = 0x04;
-		dp_res->dec_start_mode0 = 0x69;
-		dp_res->div_frac_start1_mode0 = 0x00;
-		dp_res->div_frac_start2_mode0 = 0x80;
-		dp_res->div_frac_start3_mode0 = 0x07;
-		dp_res->integloop_gain0_mode0 = 0x3f;
-		dp_res->integloop_gain1_mode0 = 0x00;
-		dp_res->vco_tune_map = 0x00;
-		dp_res->lock_cmp1_mode0 = 0x0f;
-		dp_res->lock_cmp2_mode0 = 0x0e;
-		dp_res->lock_cmp3_mode0 = 0x00;
-		dp_res->phy_vco_div = 0x1;
-		dp_res->lock_cmp_en = 0x00;
-		break;
-	case DP_VCO_HSCLK_RATE_5400MHZDIV1000:
-		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
-				DP_VCO_RATE_10800MHZDIV1000);
-		dp_res->hsclk_sel = 0x00;
-		dp_res->dec_start_mode0 = 0x8c;
-		dp_res->div_frac_start1_mode0 = 0x00;
-		dp_res->div_frac_start2_mode0 = 0x00;
-		dp_res->div_frac_start3_mode0 = 0x0a;
-		dp_res->integloop_gain0_mode0 = 0x3f;
-		dp_res->integloop_gain1_mode0 = 0x00;
-		dp_res->vco_tune_map = 0x00;
-		dp_res->lock_cmp1_mode0 = 0x1f;
-		dp_res->lock_cmp2_mode0 = 0x1c;
-		dp_res->lock_cmp3_mode0 = 0x00;
-		dp_res->phy_vco_div = 0x2;
-		dp_res->lock_cmp_en = 0x00;
-		break;
-	case DP_VCO_HSCLK_RATE_8100MHZDIV1000:
-		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
-				DP_VCO_RATE_8100MHZDIV1000);
-		dp_res->hsclk_sel = 0x03;
-		dp_res->dec_start_mode0 = 0x69;
-		dp_res->div_frac_start1_mode0 = 0x00;
-		dp_res->div_frac_start2_mode0 = 0x80;
-		dp_res->div_frac_start3_mode0 = 0x07;
-		dp_res->integloop_gain0_mode0 = 0x3f;
-		dp_res->integloop_gain1_mode0 = 0x00;
-		dp_res->vco_tune_map = 0x00;
-		dp_res->lock_cmp1_mode0 = 0x2f;
-		dp_res->lock_cmp2_mode0 = 0x2a;
-		dp_res->lock_cmp3_mode0 = 0x00;
-		dp_res->phy_vco_div = 0x0;
-		dp_res->lock_cmp_en = 0x08;
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static int dp_config_vco_rate_10nm(struct msm_dp_pll *pll,
-		unsigned long rate)
-{
-	u32 res = 0;
-	struct dp_pll_10nm *dp_res = to_dp_pll_10nm(pll);
-
-	res = dp_vco_pll_init_db_10nm(pll, rate);
-	if (res) {
-		DRM_ERROR("VCO Init DB failed\n");
-		return res;
-	}
-
-	if (dp_res->lane_cnt != 4) {
-		if (dp_res->orientation == ORIENTATION_CC2)
-			PLL_REG_W(dp_res->phy_base, REG_DP_PHY_PD_CTL, 0x6d);
-		else
-			PLL_REG_W(dp_res->phy_base, REG_DP_PHY_PD_CTL, 0x75);
-	} else {
-		PLL_REG_W(dp_res->phy_base, REG_DP_PHY_PD_CTL, 0x7d);
-	}
-
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_SVS_MODE_CLK_SEL, 0x01);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_SYSCLK_EN_SEL, 0x37);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_SYS_CLK_CTRL, 0x02);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_CLK_ENABLE1, 0x0e);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_SYSCLK_BUF_ENABLE, 0x06);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_CLK_SEL, 0x30);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_CMN_CONFIG, 0x02);
-
-	/* Different for each clock rates */
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_HSCLK_SEL, dp_res->hsclk_sel);
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_DEC_START_MODE0, dp_res->dec_start_mode0);
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_DIV_FRAC_START1_MODE0,
-		dp_res->div_frac_start1_mode0);
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_DIV_FRAC_START2_MODE0,
-		dp_res->div_frac_start2_mode0);
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_DIV_FRAC_START3_MODE0,
-		dp_res->div_frac_start3_mode0);
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_INTEGLOOP_GAIN0_MODE0,
-		dp_res->integloop_gain0_mode0);
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_INTEGLOOP_GAIN1_MODE0,
-		dp_res->integloop_gain1_mode0);
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_VCO_TUNE_MAP, dp_res->vco_tune_map);
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_LOCK_CMP1_MODE0, dp_res->lock_cmp1_mode0);
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_LOCK_CMP2_MODE0, dp_res->lock_cmp2_mode0);
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_LOCK_CMP3_MODE0, dp_res->lock_cmp3_mode0);
-
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_BG_TIMER, 0x0a);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_CORECLK_DIV_MODE0, 0x0a);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_VCO_TUNE_CTRL, 0x00);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x3f);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_CORE_CLK_EN, 0x1f);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_PLL_IVCO, 0x07);
-	PLL_REG_W(dp_res->pll_base,
-		QSERDES_COM_LOCK_CMP_EN, dp_res->lock_cmp_en);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_PLL_CCTRL_MODE0, 0x36);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_CP_CTRL_MODE0, 0x06);
-
-	if (dp_res->orientation == ORIENTATION_CC2)
-		PLL_REG_W(dp_res->phy_base, REG_DP_PHY_MODE, 0x4c);
-	else
-		PLL_REG_W(dp_res->phy_base, REG_DP_PHY_MODE, 0x5c);
-
-	/* TX Lane configuration */
-	PLL_REG_W(dp_res->phy_base,
-			REG_DP_PHY_TX0_TX1_LANE_CTL, 0x05);
-	PLL_REG_W(dp_res->phy_base,
-			REG_DP_PHY_TX2_TX3_LANE_CTL, 0x05);
-
-	/* TX-0 register configuration */
-	PLL_REG_W(dp_res->ln_tx0_base,
-			REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, 0x1a);
-	PLL_REG_W(dp_res->ln_tx0_base,
-			REG_DP_PHY_TXn_VMODE_CTRL1, 0x40);
-	PLL_REG_W(dp_res->ln_tx0_base,
-			REG_DP_PHY_TXn_PRE_STALL_LDO_BOOST_EN, 0x30);
-	PLL_REG_W(dp_res->ln_tx0_base,
-			REG_DP_PHY_TXn_INTERFACE_SELECT, 0x3d);
-	PLL_REG_W(dp_res->ln_tx0_base,
-			REG_DP_PHY_TXn_CLKBUF_ENABLE, 0x0f);
-	PLL_REG_W(dp_res->ln_tx0_base,
-			REG_DP_PHY_TXn_RESET_TSYNC_EN, 0x03);
-	PLL_REG_W(dp_res->ln_tx0_base,
-			REG_DP_PHY_TXn_TRAN_DRVR_EMP_EN, 0x03);
-	PLL_REG_W(dp_res->ln_tx0_base,
-			REG_DP_PHY_TXn_PARRATE_REC_DETECT_IDLE_EN, 0x00);
-	PLL_REG_W(dp_res->ln_tx0_base,
-			REG_DP_PHY_TXn_TX_INTERFACE_MODE, 0x00);
-	PLL_REG_W(dp_res->ln_tx0_base, REG_DP_PHY_TXn_TX_BAND, 0x4);
-
-	/* TX-1 register configuration */
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, 0x1a);
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_VMODE_CTRL1, 0x40);
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_PRE_STALL_LDO_BOOST_EN, 0x30);
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_INTERFACE_SELECT, 0x3d);
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_CLKBUF_ENABLE, 0x0f);
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_RESET_TSYNC_EN, 0x03);
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_TRAN_DRVR_EMP_EN, 0x03);
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_PARRATE_REC_DETECT_IDLE_EN, 0x00);
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_TX_INTERFACE_MODE, 0x00);
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_TX_BAND, 0x4);
-
-	/* dependent on the vco frequency */
-	PLL_REG_W(dp_res->phy_base,
-			REG_DP_PHY_VCO_DIV, dp_res->phy_vco_div);
-
-	return res;
-}
-
-static bool dp_10nm_pll_lock_status(struct dp_pll_10nm *dp_res)
-{
-	u32 status;
-	bool pll_locked;
-
-	/* poll for PLL lock status */
-	if (readl_poll_timeout_atomic((dp_res->pll_base +
-			QSERDES_COM_C_READY_STATUS),
-			status,
-			((status & BIT(0)) > 0),
-			DP_PHY_PLL_POLL_SLEEP_US,
-			DP_PHY_PLL_POLL_TIMEOUT_US)) {
-		DRM_ERROR("%s: C_READY status is not high. Status=%x\n",
-				__func__, status);
-		pll_locked = false;
-	} else {
-		pll_locked = true;
-	}
-
-	return pll_locked;
-}
-
-static bool dp_10nm_phy_rdy_status(struct dp_pll_10nm *dp_res)
-{
-	u32 status;
-	bool phy_ready = true;
-
-	/* poll for PHY ready status */
-	if (readl_poll_timeout_atomic((dp_res->phy_base +
-			REG_DP_PHY_STATUS),
-			status,
-			((status & (BIT(1))) > 0),
-			DP_PHY_PLL_POLL_SLEEP_US,
-			DP_PHY_PLL_POLL_TIMEOUT_US)) {
-		DRM_ERROR("%s: Phy_ready is not high. Status=%x\n",
-				__func__, status);
-		phy_ready = false;
-	}
-
-	return phy_ready;
-}
-
-static int dp_pll_enable_10nm(struct clk_hw *hw)
-{
-	int rc = 0;
-	struct msm_dp_pll *pll = to_msm_dp_pll(hw);
-	struct dp_pll_10nm *dp_res = to_dp_pll_10nm(pll);
-	u32 bias_en, drvr_en;
-
-	PLL_REG_W(dp_res->phy_base, REG_DP_PHY_AUX_CFG2, 0x04);
-	PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x01);
-	PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x05);
-	PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x01);
-	PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x09);
-
-	PLL_REG_W(dp_res->pll_base, QSERDES_COM_RESETSM_CNTRL, 0x20);
-
-	if (!dp_10nm_pll_lock_status(dp_res)) {
-		rc = -EINVAL;
-		goto lock_err;
-	}
-
-	PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x19);
-	/* poll for PHY ready status */
-	if (!dp_10nm_phy_rdy_status(dp_res)) {
-		rc = -EINVAL;
-		goto lock_err;
-	}
-
-	DRM_DEBUG_DP("%s: PLL is locked\n", __func__);
-
-	if (dp_res->lane_cnt == 1) {
-		bias_en = 0x3e;
-		drvr_en = 0x13;
-	} else {
-		bias_en = 0x3f;
-		drvr_en = 0x10;
-	}
-
-	if (dp_res->lane_cnt != 4) {
-		if (dp_res->orientation == ORIENTATION_CC1) {
-			PLL_REG_W(dp_res->ln_tx1_base,
-				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
-			PLL_REG_W(dp_res->ln_tx1_base,
-				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
-		} else {
-			PLL_REG_W(dp_res->ln_tx0_base,
-				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
-			PLL_REG_W(dp_res->ln_tx0_base,
-				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
-		}
-	} else {
-		PLL_REG_W(dp_res->ln_tx0_base,
-				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
-		PLL_REG_W(dp_res->ln_tx0_base,
-				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
-		PLL_REG_W(dp_res->ln_tx1_base,
-				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
-		PLL_REG_W(dp_res->ln_tx1_base,
-				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
-	}
-
-	PLL_REG_W(dp_res->ln_tx0_base, REG_DP_PHY_TXn_TX_POL_INV, 0x0a);
-	PLL_REG_W(dp_res->ln_tx1_base, REG_DP_PHY_TXn_TX_POL_INV, 0x0a);
-	PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x18);
-	udelay(2000);
-
-	PLL_REG_W(dp_res->phy_base, REG_DP_PHY_CFG, 0x19);
-
-	/* poll for PHY ready status */
-	if (!dp_10nm_phy_rdy_status(dp_res)) {
-		rc = -EINVAL;
-		goto lock_err;
-	}
-
-	PLL_REG_W(dp_res->ln_tx0_base, REG_DP_PHY_TXn_TX_DRV_LVL, 0x38);
-	PLL_REG_W(dp_res->ln_tx1_base, REG_DP_PHY_TXn_TX_DRV_LVL, 0x38);
-	PLL_REG_W(dp_res->ln_tx0_base, REG_DP_PHY_TXn_TX_EMP_POST1_LVL, 0x20);
-	PLL_REG_W(dp_res->ln_tx1_base, REG_DP_PHY_TXn_TX_EMP_POST1_LVL, 0x20);
-	PLL_REG_W(dp_res->ln_tx0_base,
-			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_TX, 0x06);
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_TX, 0x06);
-	PLL_REG_W(dp_res->ln_tx0_base,
-			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_RX, 0x07);
-	PLL_REG_W(dp_res->ln_tx1_base,
-			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_RX, 0x07);
-
-lock_err:
-	return rc;
-}
-
-static int dp_pll_disable_10nm(struct clk_hw *hw)
-{
-	int rc = 0;
-	struct msm_dp_pll *pll = to_msm_dp_pll(hw);
-	struct dp_pll_10nm *dp_res = to_dp_pll_10nm(pll);
-
-	/* Assert DP PHY power down */
-	PLL_REG_W(dp_res->phy_base, REG_DP_PHY_PD_CTL, 0x2);
-
-	return rc;
-}
-
-
-int dp_vco_prepare_10nm(struct clk_hw *hw)
-{
-	int rc = 0;
-	struct msm_dp_pll *pll = to_msm_dp_pll(hw);
-	struct dp_pll_10nm *dp_res = to_dp_pll_10nm(pll);
-
-	DRM_DEBUG_DP("%s: rate = %ld\n", __func__, pll->rate);
-	if ((dp_res->vco_cached_rate != 0)
-		&& (dp_res->vco_cached_rate == pll->rate)) {
-		rc = dp_vco_set_rate_10nm(hw,
-			dp_res->vco_cached_rate, dp_res->vco_cached_rate);
-		if (rc) {
-			DRM_ERROR("index=%d vco_set_rate failed. rc=%d\n",
-				rc, dp_res->index);
-			goto error;
-		}
-	}
-
-	rc = dp_pll_enable_10nm(hw);
-	if (rc) {
-		DRM_ERROR("ndx=%d failed to enable dp pll\n",
-					dp_res->index);
-		goto error;
-	}
-
-	pll->pll_on = true;
-error:
-	return rc;
-}
-
-void dp_vco_unprepare_10nm(struct clk_hw *hw)
-{
-	struct msm_dp_pll *pll = to_msm_dp_pll(hw);
-	struct dp_pll_10nm *dp_res = to_dp_pll_10nm(pll);
-
-	if (!dp_res) {
-		DRM_ERROR("Invalid input parameter\n");
-		return;
-	}
-
-	if (!pll->pll_on) {
-		DRM_ERROR("pll resource can't be enabled\n");
-		return;
-	}
-	dp_res->vco_cached_rate = pll->rate;
-	dp_pll_disable_10nm(hw);
-
-	pll->pll_on = false;
-}
-
-int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
-					unsigned long parent_rate)
-{
-	struct msm_dp_pll *pll = to_msm_dp_pll(hw);
-	int rc;
-
-	DRM_DEBUG_DP("DP lane CLK rate=%ld\n", rate);
-
-	rc = dp_config_vco_rate_10nm(pll, rate);
-	if (rc)
-		DRM_ERROR("%s: Failed to set clk rate\n", __func__);
-
-	pll->rate = rate;
-
-	return 0;
-}
-
-unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
-					unsigned long parent_rate)
-{
-	struct msm_dp_pll *pll = to_msm_dp_pll(hw);
-	struct dp_pll_10nm *dp_res = to_dp_pll_10nm(pll);
-	u32 div, hsclk_div, link_clk_div = 0;
-	u64 vco_rate;
-
-	div = PLL_REG_R(dp_res->pll_base, QSERDES_COM_HSCLK_SEL);
-	div &= 0x0f;
-
-	if (div == 12)
-		hsclk_div = 6; /* Default */
-	else if (div == 4)
-		hsclk_div = 4;
-	else if (div == 0)
-		hsclk_div = 2;
-	else if (div == 3)
-		hsclk_div = 1;
-	else {
-		DRM_DEBUG_DP("unknown divider. forcing to default\n");
-		hsclk_div = 5;
-	}
-
-	div = PLL_REG_R(dp_res->phy_base, REG_DP_PHY_AUX_CFG2);
-	div >>= 2;
-
-	if ((div & 0x3) == 0)
-		link_clk_div = 5;
-	else if ((div & 0x3) == 1)
-		link_clk_div = 10;
-	else if ((div & 0x3) == 2)
-		link_clk_div = 20;
-	else
-		DRM_ERROR("%s: unsupported div. Phy_mode: %d\n", __func__, div);
-
-	if (link_clk_div == 20) {
-		vco_rate = DP_VCO_HSCLK_RATE_2700MHZDIV1000;
-	} else {
-		if (hsclk_div == 6)
-			vco_rate = DP_VCO_HSCLK_RATE_1620MHZDIV1000;
-		else if (hsclk_div == 4)
-			vco_rate = DP_VCO_HSCLK_RATE_2700MHZDIV1000;
-		else if (hsclk_div == 2)
-			vco_rate = DP_VCO_HSCLK_RATE_5400MHZDIV1000;
-		else
-			vco_rate = DP_VCO_HSCLK_RATE_8100MHZDIV1000;
-	}
-
-	DRM_DEBUG_DP("returning vco rate = %lu\n", (unsigned long)vco_rate);
-
-	dp_res->vco_cached_rate = pll->rate = vco_rate;
-	return (unsigned long)vco_rate;
-}
-
-long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
-			unsigned long *parent_rate)
-{
-	unsigned long rrate = rate;
-	struct msm_dp_pll *pll = to_msm_dp_pll(hw);
-
-	if (rate <= pll->min_rate)
-		rrate = pll->min_rate;
-	else if (rate <= DP_VCO_HSCLK_RATE_2700MHZDIV1000)
-		rrate = DP_VCO_HSCLK_RATE_2700MHZDIV1000;
-	else if (rate <= DP_VCO_HSCLK_RATE_5400MHZDIV1000)
-		rrate = DP_VCO_HSCLK_RATE_5400MHZDIV1000;
-	else
-		rrate = pll->max_rate;
-
-	DRM_DEBUG_DP("%s: rrate=%ld\n", __func__, rrate);
-
-	*parent_rate = rrate;
-	return rrate;
-}
-
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
