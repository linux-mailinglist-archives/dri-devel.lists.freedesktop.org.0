Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C2F249C3F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1406E217;
	Wed, 19 Aug 2020 11:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128756E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D01F420FC3;
 Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=PMSCx91UuI0iU1z8Xdy+dm9zH5wudcsA4IhUqHhDVd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qwr09NsgIwD0CS3ttYbUNdcKRklSMzPwQaXlYBkjGlfFHBb4LGoKN3GdrqIhpGQ+K
 SoxFpu46J646xTzPoIMb/xPw1l3FpepPNlEKkLiJ35bFJgRrLXVB1rZpOksRSyrZ6q
 JJhGJ4BFRATqH4b1wRLBDfvEKBdTqVlWRN653XCc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXr-00EuaF-JU; Wed, 19 Aug 2020 13:46:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 07/49] staging: hikey9xx/gpu: Solve HDMI compatibility Problem.
Date: Wed, 19 Aug 2020 13:45:35 +0200
Message-Id: <dd5ac54d6a1a2a792b3c49960c77a5cb1b447e7b.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, devel@driverdev.osuosl.org,
 Liwei Cai <cailiwei@hisilicon.com>, Wanchun Zheng <zhengwanchun@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linuxarm@huawei.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Liuyao An <anliuyao@huawei.com>, Bogdan Togorean <bogdan.togorean@analog.com>,
 mauro.chehab@huawei.com, Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiubin Zhang <zhangxiubin1@huawei.com>

Modfiy pix_clk and dsi lanes to improve HDMI compatibility for hikey970.

Signed-off-by: Xiubin Zhang <zhangxiubin1@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/dw_drm_dsi.c     |  53 ++-----
 drivers/staging/hikey9xx/gpu/hdmi/adv7535.c   |   9 +-
 .../hikey9xx/gpu/kirin_drm_dpe_utils.c        | 133 ++----------------
 .../hikey9xx/gpu/kirin_drm_dpe_utils.h        |   2 +-
 drivers/staging/hikey9xx/gpu/kirin_drm_drv.c  |   7 -
 drivers/staging/hikey9xx/gpu/kirin_drm_dss.c  |  17 +--
 .../hikey9xx/gpu/kirin_drm_overlay_utils.c    |   3 -
 drivers/staging/hikey9xx/gpu/kirin_fb_panel.h |   5 -
 drivers/staging/hikey9xx/gpu/kirin_fbdev.c    |  10 +-
 9 files changed, 41 insertions(+), 198 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
index e69f4a9bca58..e87363ab7373 100644
--- a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
@@ -312,6 +312,7 @@ void dsi_set_output_client(struct drm_device *dev)
 }
 EXPORT_SYMBOL(dsi_set_output_client);
 
+#if defined (CONFIG_HISI_FB_970)
 static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 							struct mipi_phy_params *phy_ctrl)
 {
@@ -357,10 +358,8 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->client[id].format);
 	if (bpp < 0)
 		return;
-	if (mode->clock > 80000)
-	    dsi->client[id].lanes = 4;
-	else
-	    dsi->client[id].lanes = 3;
+
+	dsi->client[id].lanes = 4;
 
 	if (dsi->client[id].phy_clock)
 		dphy_req_kHz = dsi->client[id].phy_clock;
@@ -387,33 +386,7 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 	m_n_int = lane_clock * vco_div * 1000000UL / DEFAULT_MIPI_CLK_RATE;
 	m_n_fract = ((lane_clock * vco_div * 1000000UL * 1000UL / DEFAULT_MIPI_CLK_RATE) % 1000) * 10 / 1000;
 
-	if (m_n_int % 2 == 0) {
-		if (m_n_fract * 6 >= 50) {
-			n_pll = 2;
-			m_pll = (m_n_int + 1) * n_pll;
-		} else if (m_n_fract * 6 >= 30) {
-			n_pll = 3;
-			m_pll = m_n_int * n_pll + 2;
-		} else {
-			n_pll = 1;
-			m_pll = m_n_int * n_pll;
-		}
-	} else {
-		if (m_n_fract * 6 >= 50) {
-			n_pll = 1;
-			m_pll = (m_n_int + 1) * n_pll;
-		} else if (m_n_fract * 6 >= 30) {
-			n_pll = 1;
-			m_pll = (m_n_int + 1) * n_pll;
-		} else if (m_n_fract * 6 >= 10) {
-			n_pll = 3;
-			m_pll = m_n_int * n_pll + 1;
-		} else {
-			n_pll = 2;
-			m_pll = m_n_int * n_pll;
-		}
-	}
-	//n_pll = 2;
+	n_pll = 2;
 
 	m_pll = (u32)(lane_clock * vco_div * n_pll * 1000000UL / DEFAULT_MIPI_CLK_RATE);
 
@@ -568,7 +541,7 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 		phy_ctrl->data_lane_hs2lp_time,
 		phy_ctrl->phy_stop_wait_time);
 }
-
+#else
 static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
 							struct mipi_phy_params *phy_ctrl)
 {
@@ -887,7 +860,7 @@ static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
 		phy_ctrl->data_t_hs_trial,
 		phy_ctrl->data_t_ta_go,
 		phy_ctrl->data_t_ta_get);
-	DRM_INFO("clk_lane_lp2hs_time=%u\n"
+	DRM_DEBUG("clk_lane_lp2hs_time=%u\n"
 		"clk_lane_hs2lp_time=%u\n"
 		"data_lane_lp2hs_time=%u\n"
 		"data_lane_hs2lp_time=%u\n"
@@ -898,6 +871,7 @@ static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
 		phy_ctrl->data_lane_hs2lp_time,
 		phy_ctrl->phy_stop_wait_time);
 }
+#endif
 
 static void dw_dsi_set_mode(struct dw_dsi *dsi, enum dsi_work_mode mode)
 {
@@ -962,13 +936,11 @@ static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi, char __iomem
 
 	lanes =  dsi->client[dsi->cur_client].lanes - 1;
 
-#if defined (CONFIG_HISI_FB_970)
-	for (i = 0; i <= lanes; i++) {
+	for (i = 0; i <= (lanes+1); i++) {
 		//Lane Transmission Property
 		addr = MIPIDSI_PHY_TST_LANE_TRANSMISSION_PROPERTY + (i << 5);
 		dsi_phy_tst_set(mipi_dsi_base, addr, 0x43);
 	}
-#endif
 
 	//pre_delay of clock lane request setting
 	dsi_phy_tst_set(mipi_dsi_base, MIPIDSI_PHY_TST_CLK_PRE_DELAY, DSS_REDUCE(dsi->phy.clk_pre_delay));
@@ -988,7 +960,7 @@ static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi, char __iomem
 	//clock lane timing ctrl - t_hs_trial
 	dsi_phy_tst_set(mipi_dsi_base, MIPIDSI_PHY_TST_CLK_TRAIL, DSS_REDUCE(dsi->phy.clk_t_hs_trial));
 
-	for (i = 0; i <= (lanes + 1); i++) {//lint !e850
+	for (i = 0; i <= (lanes + 1); i++) {
 		if (i == 2) {
 			i++;  //addr: lane0:0x60; lane1:0x80; lane2:0xC0; lane3:0xE0
 		}
@@ -1039,7 +1011,6 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	u32 hsa_time = 0;
 	u32 hbp_time = 0;
 	u64 pixel_clk = 0;
-	u32 i = 0;
 	u32 id = 0;
 	unsigned long dw_jiffies = 0;
 	u32 tmp = 0;
@@ -1161,7 +1132,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	/* clock lane timing ctrl - t_hs_trial*/
 	dsi_phy_tst_set(mipi_dsi_base, 0x25, dsi->phy.clk_t_hs_trial);
 
-	for (i = 0; i <= lanes; i++) {
+	for (int i = 0; i <= lanes; i++) {
 		/* data lane pre_delay*/
 		tmp = 0x30 + (i << 4);
 		dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_pre_delay));
@@ -1391,8 +1362,9 @@ static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 static int mipi_dsi_on_sub2(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 {
 	WARN_ON(!mipi_dsi_base);
-	u64 pctrl_dphytx_stopcnt = 0;
+	u64 pctrl_dphytx_stopcnt;
 
+	pctrl_dphytx_stopcnt = 0;
 	/* switch to video mode */
 	set_reg(mipi_dsi_base + MIPIDSI_MODE_CFG_OFFSET, 0x0, 1, 0);
 
@@ -1938,7 +1910,6 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 		DRM_ERROR ("failed to get dsi base resource.\n");
 		return -ENXIO;
 	}
-	DRM_INFO("dsi base =0x%x.\n", ctx->base);
 
 	ctx->peri_crg_base = of_iomap(np, 1);
 	if (!(ctx->peri_crg_base)) {
diff --git a/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
index 3dd6059ea603..0343b2cd4c45 100644
--- a/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
+++ b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
@@ -380,7 +380,6 @@ static void adv7511_set_link_config(struct adv7511 *adv7511,
 
 static void adv7511_dsi_config_tgen(struct adv7511 *adv7511)
 {
-	struct mipi_dsi_device *dsi = adv7511->dsi;
 	struct drm_display_mode *mode = &adv7511->curr_mode;
 	u8 clock_div_by_lanes[] = { 6, 4, 3 }; /* 2, 3, 4 lanes */
 	unsigned int hsw, hfp, hbp, vsw, vfp, vbp;
@@ -402,10 +401,6 @@ static void adv7511_dsi_config_tgen(struct adv7511 *adv7511)
 			clock_div_by_lanes[adv7511->num_dsi_lanes - 2] << 3);
 #endif
 
-	/* set pixel clock divider mode */
-	/*regmap_write(adv7511->regmap_cec, 0x16,
-			clock_div_by_lanes[dsi->lanes - 2] << 3);*/
-
 	/* horizontal porch params */
 	regmap_write(adv7511->regmap_cec, 0x28, mode->htotal >> 4);
 	regmap_write(adv7511->regmap_cec, 0x29, (mode->htotal << 4) & 0xff);
@@ -944,10 +939,14 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 		struct mipi_dsi_device *dsi = adv7511->dsi;
 		int lanes, ret;
 
+#if defined(CONFIG_HISI_FB_970)
+		lanes = 4;
+#else
 		if (adj_mode->clock > 80000)
 			lanes = 4;
 		else
 			lanes = 3;
+#endif
 
 		if (lanes != dsi->lanes) {
 			mipi_dsi_detach(dsi);
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
index 470e08ed646b..d891ee17f48d 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
@@ -19,8 +19,6 @@ int g_debug_set_reg_val = 0;
 
 DEFINE_SEMAPHORE(hisi_fb_dss_regulator_sem);
 
-static int dss_regulator_refcount;
-
 extern u32 g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX];
 
 mipi_ifbc_division_t g_mipi_ifbc_division[MIPI_DPHY_NUM][IFBC_TYPE_MAX] = {
@@ -119,28 +117,6 @@ uint32_t set_bits32(uint32_t old_val, uint32_t val, uint8_t bw, uint8_t bs)
 	return (tmp | ((val & mask) << bs));
 }
 
-struct dss_clk_rate *get_dss_clk_rate(struct dss_hw_ctx *ctx)
-{
-	struct dss_clk_rate *pdss_clk_rate = NULL;
-	uint64_t default_dss_pri_clk_rate;
-
-	if (ctx == NULL) {
-		DRM_ERROR("ctx is null.\n");
-		return pdss_clk_rate;
-	}
-
-	pdss_clk_rate = &(ctx->dss_clk);
-	default_dss_pri_clk_rate = DEFAULT_DSS_CORE_CLK_RATE_L1;
-
-	pdss_clk_rate->dss_pri_clk_rate = default_dss_pri_clk_rate;
-	pdss_clk_rate->dss_mmbuf_rate = DEFAULT_DSS_MMBUF_CLK_RATE_L1;
-	pdss_clk_rate->dss_pclk_dss_rate = DEFAULT_PCLK_DSS_RATE;
-	pdss_clk_rate->dss_pclk_pctrl_rate = DEFAULT_PCLK_PCTRL_RATE;
-
-
-	return pdss_clk_rate;
-}
-
 static int mipi_ifbc_get_rect(struct dss_rect *rect)
 {
 	u32 ifbc_type;
@@ -399,9 +375,11 @@ void init_dbuf(struct dss_crtc *acrtc)
 		"hsw=%d\n"
 		"hbp=%d\n"
 		"hfp=%d\n"
+		"htotal=%d\n"
 		"vfp = %d\n"
 		"vbp = %d\n"
 		"vsw = %d\n"
+		"vtotal=%d\n"
 		"mode->hdisplay=%d\n"
 		"mode->vdisplay=%d\n",
 		dfs_time,
@@ -409,9 +387,11 @@ void init_dbuf(struct dss_crtc *acrtc)
 		hsw,
 		hbp,
 		hfp,
+		mode->htotal,
 		vfp,
 		vbp,
 		vsw,
+		mode->vtotal,
 		mode->hdisplay,
 		mode->vdisplay);
 
@@ -758,72 +738,13 @@ void dss_inner_clk_pdp_enable(struct dss_hw_ctx *ctx)
 	outp32(dss_base + DSS_DPP_DITHER_OFFSET + DITHER_MEM_CTRL, 0x00000008);
 }
 
-static void dss_normal_set_reg(char __iomem *dss_base)
-{
-	if (NULL == dss_base) {
-		DRM_ERROR("dss_base is null.\n");
-		return;
-	}
-	//core/axi/mmbuf
-	outp32(dss_base + DSS_CMDLIST_OFFSET + CMD_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_RCH_VG0_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);
-	outp32(dss_base + DSS_RCH_VG0_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x00000008);
-
-	outp32(dss_base + DSS_RCH_VG0_ARSR_OFFSET + ARSR2P_LB_MEM_CTRL, 0x00000008);
-
-	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + VPP_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);
-
-	outp32(dss_base + DSS_RCH_VG1_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);
-	outp32(dss_base + DSS_RCH_VG1_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);
-
-	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + HFBCD_MEM_CTRL, 0x88888888);
-	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + HFBCD_MEM_CTRL_1, 0x00000888);
-	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + HFBCD_MEM_CTRL, 0x88888888);
-	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + HFBCD_MEM_CTRL_1, 0x00000888);
-
-	outp32(dss_base + DSS_RCH_VG2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
-
-	outp32(dss_base + DSS_RCH_G0_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);
-	outp32(dss_base + DSS_RCH_G0_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x0000008);
-	outp32(dss_base + DSS_RCH_G0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_RCH_G0_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);
-
-	outp32(dss_base + DSS_RCH_G1_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);
-	outp32(dss_base + DSS_RCH_G1_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x0000008);
-	outp32(dss_base + DSS_RCH_G1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_RCH_G1_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);
-
-	outp32(dss_base + DSS_RCH_D0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_RCH_D0_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);
-	outp32(dss_base + DSS_RCH_D1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_RCH_D2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_RCH_D3_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
-
-	outp32(dss_base + DSS_WCH0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_WCH0_DMA_OFFSET + AFBCE_MEM_CTRL, 0x00000888);
-	outp32(dss_base + DSS_WCH0_DMA_OFFSET + ROT_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_WCH1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
-	outp32(dss_base + DSS_WCH1_DMA_OFFSET + AFBCE_MEM_CTRL, 0x88888888);
-	outp32(dss_base + DSS_WCH1_DMA_OFFSET + AFBCE_MEM_CTRL_1, 0x00000088);
-	outp32(dss_base + DSS_WCH1_DMA_OFFSET + ROT_MEM_CTRL, 0x00000008);
-
-	outp32(dss_base + DSS_WCH1_DMA_OFFSET + WCH_SCF_COEF_MEM_CTRL, 0x00000088);
-	outp32(dss_base + DSS_WCH1_DMA_OFFSET + WCH_SCF_LB_MEM_CTRL, 0x00000088);
-	outp32(dss_base + GLB_DSS_MEM_CTRL, 0x02605550);
-
-}
-
 void dss_inner_clk_common_enable(struct dss_hw_ctx *ctx)
 {
 	char __iomem *dss_base;
 
 	if (NULL == ctx) {
 		DRM_ERROR("NULL Pointer!\n");
-		return -EINVAL;
+		return ;
 	}
 
 	dss_base = ctx->base;
@@ -923,23 +844,6 @@ int dpe_irq_disable(struct dss_crtc *acrtc)
 	return 0;
 }
 
-void mds_regulator_enable(struct dss_hw_ctx *ctx)
-{
-	int ret = 0;
-
-	if (NULL == ctx) {
-		DRM_ERROR("NULL ptr.\n");
-		return -EINVAL;
-	}
-
-	ret = regulator_bulk_enable(1, ctx->media_subsys_regulator);
-	if (ret) {
-		DRM_ERROR(" media subsys regulator_enable failed, error=%d!\n", ret);
-	}
-
-	return ret;
-}
-
 int dpe_common_clk_enable(struct dss_hw_ctx *ctx)
 {
 	int ret = 0;
@@ -1073,7 +977,6 @@ int dpe_inner_clk_enable(struct dss_hw_ctx *ctx)
 
 int dpe_inner_clk_disable(struct dss_hw_ctx *ctx)
 {
-	int ret = 0;
 	struct clk *clk_tmp = NULL;
 
 	if (ctx == NULL) {
@@ -1151,9 +1054,7 @@ int dpe_regulator_disable(struct dss_hw_ctx *ctx)
 
 int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 {
-	struct dss_clk_rate *pdss_clk_rate = NULL;
-	uint64_t dss_pri_clk_rate;
-	uint64_t dss_mmbuf_rate;
+	uint64_t clk_rate;
 	int ret = 0;
 
 	if (NULL == ctx) {
@@ -1161,21 +1062,14 @@ int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 		return -EINVAL;
 	}
 
-#if 0
-	pdss_clk_rate = get_dss_clk_rate(ctx);
-	if (NULL == pdss_clk_rate) {
-		DRM_ERROR("NULL Pointer!\n");
-		return -EINVAL;
-	}
-#endif
+	clk_rate = DEFAULT_DSS_CORE_CLK_RATE_L1;
 	ret = clk_set_rate(ctx->dss_pri_clk, DEFAULT_DSS_CORE_CLK_RATE_L1);
 	if (ret < 0) {
-		DRM_ERROR("dss_pri_clk clk_set_rate(%llu) failed, error=%d!\n",
-			dss_pri_clk_rate, ret);
+		DRM_ERROR("dss_pri_clk clk_set_rate failed, error=%d!\n", ret);
 		return -EINVAL;
 	}
 	DRM_INFO("dss_pri_clk:[%llu]->[%llu].\n",
-		dss_pri_clk_rate, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
+		clk_rate, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
 
 #if 0 /* it will be set on dss_ldi_set_mode func */
 	ret = clk_set_rate(ctx->dss_pxl0_clk, pinfo->pxl_clk_rate);
@@ -1191,24 +1085,21 @@ int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 			pinfo->pxl_clk_rate, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
 #endif
 
+	clk_rate = DEFAULT_DSS_MMBUF_CLK_RATE_L1;
 	ret = clk_set_rate(ctx->dss_mmbuf_clk, DEFAULT_DSS_MMBUF_CLK_RATE_L1);
 	if (ret < 0) {
-		DRM_ERROR("dss_mmbuf clk_set_rate(%llu) failed, error=%d!\n",
-			dss_mmbuf_rate, ret);
+		DRM_ERROR("dss_mmbuf clk_set_rate failed, error=%d!\n", ret);
 		return -EINVAL;
 	}
 
 	DRM_INFO("dss_mmbuf_clk:[%llu]->[%llu].\n",
-		dss_mmbuf_rate, (uint64_t)clk_get_rate(ctx->dss_mmbuf_clk));
+		clk_rate, (uint64_t)clk_get_rate(ctx->dss_mmbuf_clk));
 
 	return ret;
 }
 
 int dpe_set_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
 {
-	struct dss_clk_rate *pdss_clk_rate = NULL;
-	uint64_t dss_pri_clk_rate;
-	uint64_t dss_mmbuf_rate;
 	int ret;
 	uint64_t clk_rate;
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
index d62ea734319b..f27e01cb43f8 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
@@ -57,7 +57,7 @@ int dpe_irq_disable(struct dss_crtc *acrtc);
 
 int dpe_init(struct dss_crtc *acrtc);
 int dpe_deinit(struct dss_crtc *acrtc);
-void dpe_check_itf_status(acrtc);
+void dpe_check_itf_status(struct dss_crtc *acrtc);
 int dpe_set_clk_rate_on_pll0(struct dss_hw_ctx *ctx);
 
 void hisifb_dss_on(struct dss_hw_ctx *ctx);
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
index a92594553b80..958aafa1a09c 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
@@ -374,8 +374,6 @@ static int kirin_drm_platform_remove(struct platform_device *pdev)
 
 static int kirin_drm_platform_suspend(struct platform_device *pdev, pm_message_t state)
 {
-	struct device *dev = &pdev->dev;
-
 	DRM_INFO("+. pdev->name is %s, m_message is %d \n", pdev->name, state.event);
 	if (!dc_ops) {
 		DRM_ERROR("dc_ops is NULL\n");
@@ -383,22 +381,17 @@ static int kirin_drm_platform_suspend(struct platform_device *pdev, pm_message_t
 	}
 	dc_ops->suspend(pdev, state);
 
-	DRM_INFO("-. \n");
 	return 0;
 }
 
 static int kirin_drm_platform_resume(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
-
-	DRM_INFO("+. pdev->name is %s \n", pdev->name);
 	if (!dc_ops) {
 		DRM_ERROR("dc_ops is NULL\n");
 		return -EINVAL;
 	}
 	dc_ops->resume(pdev);
 
-	DRM_INFO("-. \n");
 	return 0;
 }
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
index b5ac4d7ae829..b13efd9b9735 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
@@ -265,7 +265,7 @@ static void dss_ldi_set_mode(struct dss_crtc *acrtc)
 		if (mode->clock == 148500)
 			clk_Hz = 144000 * 1000UL;
 		else if (mode->clock == 83496)
-			clk_Hz = 80000 * 1000UL;
+			clk_Hz = 84000 * 1000UL;
 		else if (mode->clock == 74440)
 			clk_Hz = 72000 * 1000UL;
 		else if (mode->clock == 74250)
@@ -282,7 +282,7 @@ static void dss_ldi_set_mode(struct dss_crtc *acrtc)
 		 */
 		ret = clk_set_rate(ctx->dss_pxl0_clk, clk_Hz);
 		if (ret) {
-			DRM_ERROR("failed to set pixel clk %dHz (%d)\n", clk_Hz, ret);
+			DRM_ERROR("failed to set pixel clk %llu Hz (%d)\n", clk_Hz, ret);
 		}
 #endif
 		adj_mode->clock = clk_Hz / 1000;
@@ -304,20 +304,20 @@ static void dss_ldi_set_mode(struct dss_crtc *acrtc)
 		 */
 		ret = clk_set_rate(ctx->dss_pxl0_clk, clk_Hz);
 		if (ret) {
-			DRM_ERROR("failed to set pixel clk %dHz (%d)\n", clk_Hz, ret);
+			DRM_ERROR("failed to set pixel clk %llu Hz (%d)\n", clk_Hz, ret);
 		}
 		adj_mode->clock = clk_get_rate(ctx->dss_pxl0_clk) / 1000;
 	}
 
-	DRM_INFO("dss_pxl0_clk [%llu]->[%llu] \n", clk_Hz, clk_get_rate(ctx->dss_pxl0_clk));
+	DRM_INFO("dss_pxl0_clk [%llu]->[%lu] \n", clk_Hz, clk_get_rate(ctx->dss_pxl0_clk));
 
 	dpe_init(acrtc);
 }
 
 static int dss_power_up(struct dss_crtc *acrtc)
 {
-	int ret;
 	struct dss_hw_ctx *ctx = acrtc->ctx;
+	int ret = 0;
 
 #if defined (CONFIG_HISI_FB_970)
 	dpe_common_clk_enable(ctx);
@@ -367,7 +367,8 @@ static int dss_power_up(struct dss_crtc *acrtc)
 	dpe_interrupt_unmask(acrtc);
 
 	ctx->power_on = true;
-	return 0;
+
+	return ret;
 }
 
 static void dss_power_down(struct dss_crtc *acrtc)
@@ -427,8 +428,6 @@ static irqreturn_t dss_irq_handler(int irq, void *data)
 
 	u32 isr_s1 = 0;
 	u32 isr_s2 = 0;
-	u32 isr_s2_dpp = 0;
-	u32 isr_s2_smmu = 0;
 	u32 mask = 0;
 
 	isr_s1 = inp32(dss_base + GLB_CPU_PDP_INTS);
@@ -632,7 +631,6 @@ static int dss_plane_atomic_check(struct drm_plane *plane,
 static void dss_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
-	struct drm_atomic_state *atomic_state;
 	hisi_fb_pan_display(plane);
 }
 
@@ -731,7 +729,6 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 		DRM_ERROR ("failed to get dss base resource.\n");
 		return -ENXIO;
 	}
-	DRM_INFO("dss base =0x%x.\n", ctx->base);
 
 	ctx->peri_crg_base  = of_iomap(np, 1);
 	if (!(ctx->peri_crg_base)) {
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
index 5ec71ec53e23..b1081cac5c1c 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
@@ -1356,7 +1356,6 @@ void hisi_dss_smmu_on(struct dss_hw_ctx *ctx)
 	struct iommu_domain_data *domain_data = NULL;
 	uint32_t phy_pgd_base = 0;
 	uint64_t fama_phy_pgd_base;
-	uint32_t fama_ptw_msb;
 
 	if (!ctx) {
 		DRM_ERROR("ctx is NULL!\n");
@@ -1448,7 +1447,6 @@ void hisifb_mctl_sw_clr(struct dss_crtc *acrtc)
 {
 	char __iomem *mctl_base = NULL;
 	struct dss_hw_ctx *ctx = acrtc->ctx;
-	int mctl_idx;
 	int mctl_status;
 	int delay_count = 0;
 	bool is_timeout;
@@ -1546,7 +1544,6 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	u32 display_addr = 0;
 	u32 hal_fmt;
 	int chn_idx = DSS_RCHN_D2;
-	char filename[256] = {0};
 
 	int crtc_x = state->crtc_x;
 	int crtc_y = state->crtc_y;
diff --git a/drivers/staging/hikey9xx/gpu/kirin_fb_panel.h b/drivers/staging/hikey9xx/gpu/kirin_fb_panel.h
index d5be79490b03..0f69af49a355 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_fb_panel.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_fb_panel.h
@@ -184,14 +184,9 @@ int vcc_cmds_tx(struct platform_device *pdev, struct vcc_desc *cmds, int cnt);
 int pinctrl_cmds_tx(struct platform_device *pdev, struct pinctrl_cmd_desc *cmds, int cnt);
 int gpio_cmds_tx(struct gpio_desc *cmds, int cnt);
 extern struct spi_device *g_spi_dev;
-int spi_cmds_tx(struct spi_device *spi, struct spi_cmd_desc *cmds, int cnt);
 int hisi_pwm_set_backlight(struct backlight_device *bl, uint32_t bl_level);
 
 int hisi_pwm_off(void);
 int hisi_pwm_on(void);
 
-int hisi_lcd_backlight_on(struct drm_panel *p);
-int hisi_lcd_backlight_off(struct drm_panel *p);
-
-
 #endif /* KIRIN_FB_PANEL_H */
diff --git a/drivers/staging/hikey9xx/gpu/kirin_fbdev.c b/drivers/staging/hikey9xx/gpu/kirin_fbdev.c
index 80e3dd713914..5d09cf3784a5 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_fbdev.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_fbdev.c
@@ -114,7 +114,7 @@ unsigned long kirin_alloc_fb_buffer(struct kirin_fbdev *fbdev, int size)
 	fbdev->ion_client = client;
 	fbdev->ion_handle = handle;
 
-	DRM_INFO("fbdev->smem_start = 0x%x, fbdev->screen_base = 0x%x\n",
+	DRM_INFO("fbdev->smem_start = 0x%lu, fbdev->screen_base = 0x%p\n",
 		fbdev->smem_start, fbdev->screen_base);
 
 	return buf_addr;
@@ -164,12 +164,12 @@ static int kirin_fbdev_mmap(struct fb_info *info, struct vm_area_struct * vma)
 	addr = vma->vm_start;
 	offset = vma->vm_pgoff * PAGE_SIZE;
 	size = vma->vm_end - vma->vm_start;
-	DRM_INFO("addr = 0x%x, offset = %d, size = %d!\n", addr, offset, size);
+	DRM_INFO("addr = 0x%lu, offset = 0x%lu, size = %lu!\n", addr, offset, size);
 	if (size > info->fix.smem_len) {
 		DRM_ERROR("size=%lu is out of range(%u)!\n", size, info->fix.smem_len);
 		return -EFAULT;
 	}
-	DRM_INFO("fbdev->smem_start = 0x%x, fbdev->screen_base = 0x%x\n",
+	DRM_INFO("fbdev->smem_start = 0x%lu, fbdev->screen_base = 0x%p\n",
 		fbdev->smem_start, fbdev->screen_base);
 
 	for_each_sg(table->sgl, sg, table->nents, i) {
@@ -194,12 +194,12 @@ static int kirin_fbdev_mmap(struct fb_info *info, struct vm_area_struct * vma)
 
 		addr += len;
 		if (addr >= vma->vm_end) {
-			DRM_INFO("addr = 0x%x!, vma->vm_end = 0x%x\n", addr, vma->vm_end);
+			DRM_INFO("addr = 0x%lu!, vma->vm_end = 0x%lu \n", addr, vma->vm_end);
 			return 0;
 		}
 	}
 
-	DRM_INFO("kirin_fbdev_mmap addr = 0x%x!\n", addr);
+	DRM_INFO("kirin_fbdev_mmap addr = 0x%lu!\n", addr);
 
 	return 0;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
