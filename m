Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D00724AFEF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602826E907;
	Thu, 20 Aug 2020 07:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87126E23D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD5EC20888;
 Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=ijILiBuccFgo5BcpNMJHjBgFNmtmfX0QFrSF372QVvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W4yQ/sGQaDOp8ahjp2/ViO9eKJHoDC0zNTQKePxhdQHiiok2MvhOxcNEigOb5+OCa
 ptn3DoWeBvB6sjdTt+P7lnhc9fYi6u508zDwHTKHFJgfGJGyxaYaeaqUBErsM2QuO4
 zlxOQOuW8nzmxPsyjdrfJo9tEoYhGQ2G7ZY8SusE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXr-00Eua7-9A; Wed, 19 Aug 2020 13:46:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 05/49] staging: hikey9xx/gpu: add support to hikey970 HDMI and
 panel
Date: Wed, 19 Aug 2020 13:45:33 +0200
Message-Id: <49a34e29bcb3df7c4152d38ece298aae07103d1b.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Clark <robdclark@chromium.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, devel@driverdev.osuosl.org,
 Liwei Cai <cailiwei@hisilicon.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>, Liuyao An <anliuyao@huawei.com>,
 mauro.chehab@huawei.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiubin Zhang <zhangxiubin1@huawei.com>

Add a driver for adv7535 and change the driver for it to
work with HDMI and panel displays.

[mchehab+huawei@kernel.org: for now, don't touch Kconfig/Makefile,
 and don't add the actual display driver here]

Signed-off-by: Liwei Cai <cailiwei@hisilicon.com>
Signed-off-by: Xiubin Zhang <zhangxiubin1@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/Makefile         |    4 +
 drivers/staging/hikey9xx/gpu/dw_drm_dsi.c     |  454 +-
 drivers/staging/hikey9xx/gpu/hdmi/adv7535.c   | 1653 +++++++
 drivers/staging/hikey9xx/gpu/hdmi/adv7535.h   |  351 ++
 .../staging/hikey9xx/gpu/hdmi/adv7535_audio.c |  313 ++
 .../staging/hikey9xx/gpu/kirin970_dpe_reg.h   | 4267 +++++++++++++++++
 drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h  |  144 +-
 .../hikey9xx/gpu/kirin_drm_dpe_utils.c        |  368 +-
 .../hikey9xx/gpu/kirin_drm_dpe_utils.h        |   16 +-
 drivers/staging/hikey9xx/gpu/kirin_drm_drv.c  |   27 +-
 drivers/staging/hikey9xx/gpu/kirin_drm_drv.h  |    2 +-
 drivers/staging/hikey9xx/gpu/kirin_drm_dss.c  |  369 +-
 .../hikey9xx/gpu/kirin_drm_overlay_utils.c    |  487 +-
 drivers/staging/hikey9xx/gpu/kirin_fb.c       |    2 +-
 drivers/staging/hikey9xx/gpu/kirin_fb_panel.h |  197 +
 drivers/staging/hikey9xx/gpu/kirin_fbdev.c    |   36 +-
 drivers/staging/hikey9xx/gpu/kirin_pwm.c      |  400 ++
 17 files changed, 8938 insertions(+), 152 deletions(-)
 create mode 100644 drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
 create mode 100644 drivers/staging/hikey9xx/gpu/hdmi/adv7535.h
 create mode 100644 drivers/staging/hikey9xx/gpu/hdmi/adv7535_audio.c
 create mode 100644 drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
 create mode 100644 drivers/staging/hikey9xx/gpu/kirin_fb_panel.h
 create mode 100644 drivers/staging/hikey9xx/gpu/kirin_pwm.c

diff --git a/drivers/staging/hikey9xx/gpu/Makefile b/drivers/staging/hikey9xx/gpu/Makefile
index 42d1ed179264..5d7cf738a7d6 100644
--- a/drivers/staging/hikey9xx/gpu/Makefile
+++ b/drivers/staging/hikey9xx/gpu/Makefile
@@ -7,6 +7,10 @@ kirin-drm-y := kirin_fbdev.o \
 		kirin_drm_dss.o \
 		kirin_drm_dpe_utils.o \
 		kirin_drm_overlay_utils.o \
+		kirin_pwm.o \
+		hdmi/adv7535.o \
 
+
+obj-$(CONFIG_HDMI_ADV7511_AUDIO) += hdmi/adv7535_audio.o
 obj-$(CONFIG_DRM_KIRIN_960) += kirin-drm.o
 obj-$(CONFIG_HISI_KIRIN_DW_DSI) += dw_drm_dsi.o
diff --git a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
index db408beb33ec..f1376ed01dce 100644
--- a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
@@ -30,10 +30,19 @@
 #include <drm/drm_panel.h>
 
 #include "dw_dsi_reg.h"
+#if defined (CONFIG_HISI_FB_970)
+#include "kirin970_dpe_reg.h"
+#else
 #include "kirin_dpe_reg.h"
+#endif
 #include "kirin_drm_dpe_utils.h"
+#include "kirin_drm_drv.h"
 
+#if defined (CONFIG_HISI_FB_970)
+#define DTS_COMP_DSI_NAME "hisilicon,kirin970-dsi"
+#else
 #define DTS_COMP_DSI_NAME "hisilicon,hi3660-dsi"
+#endif
 
 #define ROUND(x, y)		((x) / (y) + \
 				((x) % (y) * 10 / (y) >= 5 ? 1 : 0))
@@ -110,11 +119,26 @@ struct mipi_phy_params {
 	u32 rg_pll_refsel;				/*0x16[1:0]*/
 	u32 rg_pll_cp;				/*0x16[7:5]*/
 	u32 load_command;
+
+	// for CDPHY
+	uint32_t rg_cphy_div;	//Q
+	uint32_t rg_div;		//M 0x4A[7:0]
+	uint32_t rg_pre_div;	//N 0x49[0]
+	uint32_t rg_320m;		//0x48[2]
+	uint32_t rg_2p5g;		//0x48[1]
+	uint32_t rg_0p8v;		//0x48[0]
+	uint32_t rg_lpf_r;		//0x46[5:4]
+	uint32_t rg_cp;			//0x46[3:0]
+	uint32_t t_prepare;
+	uint32_t t_lpx;
+	uint32_t t_prebegin;
+	uint32_t t_post;
 };
 
 struct dsi_hw_ctx {
 	void __iomem *base;
 	char __iomem *peri_crg_base;
+	void __iomem *pctrl_base;
 
 	struct clk *dss_dphy0_ref_clk;
 	struct clk *dss_dphy1_ref_clk;
@@ -171,6 +195,9 @@ struct mipi_panel_info {
 	/*only for Chicago<3660> use*/
 	u32 rg_vrefsel_vcm_clk_adjust;
 	u32 rg_vrefsel_vcm_data_adjust;
+
+	u32 phy_mode;  //0: DPHY, 1:CPHY
+	u32 lp11_flag;
 };
 
 struct ldi_panel_info {
@@ -285,6 +312,263 @@ void dsi_set_output_client(struct drm_device *dev)
 }
 EXPORT_SYMBOL(dsi_set_output_client);
 
+static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
+							struct mipi_phy_params *phy_ctrl)
+{
+	struct mipi_panel_info *mipi = NULL;
+	struct drm_display_mode *mode = NULL;
+	u32 dphy_req_kHz;
+	int bpp;
+	u32 id = 0;
+	u32 ui = 0;
+	u32 m_pll = 0;
+	u32 n_pll = 0;
+	u64 lane_clock = 0;
+	u64 vco_div = 1;
+	u32 m_n_fract = 0;
+	u32 m_n_int = 0;
+
+	u32 accuracy = 0;
+	u32 unit_tx_byte_clk_hs = 0;
+	u32 clk_post = 0;
+	u32 clk_pre = 0;
+	u32 clk_t_hs_exit = 0;
+	u32 clk_pre_delay = 0;
+	u32 clk_t_hs_prepare = 0;
+	u32 clk_t_lpx = 0;
+	u32 clk_t_hs_zero = 0;
+	u32 clk_t_hs_trial = 0;
+	u32 data_post_delay = 0;
+	u32 data_t_hs_prepare = 0;
+	u32 data_t_hs_zero = 0;
+	u32 data_t_hs_trial = 0;
+	u32 data_t_lpx = 0;
+
+	WARN_ON(!phy_ctrl);
+	WARN_ON(!dsi);
+
+	id = dsi->cur_client;
+	mode = &dsi->cur_mode;
+	mipi = &dsi->mipi;
+
+	/*
+	 * count phy params
+	 */
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->client[id].format);
+	if (bpp < 0)
+		return;
+	if (mode->clock > 80000)
+	    dsi->client[id].lanes = 4;
+	else
+	    dsi->client[id].lanes = 3;
+
+	if (dsi->client[id].phy_clock)
+		dphy_req_kHz = dsi->client[id].phy_clock;
+	else
+		dphy_req_kHz = mode->clock * bpp / dsi->client[id].lanes;
+
+	lane_clock = dphy_req_kHz / 1000;
+	DRM_INFO("Expected : lane_clock = %llu M\n", lane_clock);
+
+	/************************  PLL parameters config  *********************/
+	//chip spec :
+	//If the output data rate is below 320 Mbps, RG_BNAD_SEL should be set to 1.
+	//At this mode a post divider of 1/4 will be applied to VCO.
+	if ((320 <= lane_clock) && (lane_clock <= 2500)) {
+		phy_ctrl->rg_band_sel = 0;
+		vco_div = 1;
+	} else if ((80 <= lane_clock) && (lane_clock < 320)) {
+		phy_ctrl->rg_band_sel = 1;
+		vco_div = 4;
+	} else {
+		DRM_ERROR("80M <= lane_clock< = 2500M, not support lane_clock = %llu M.\n", lane_clock);
+	}
+
+	m_n_int = lane_clock * vco_div * 1000000UL / DEFAULT_MIPI_CLK_RATE;
+	m_n_fract = ((lane_clock * vco_div * 1000000UL * 1000UL / DEFAULT_MIPI_CLK_RATE) % 1000) * 10 / 1000;
+
+	if (m_n_int % 2 == 0) {
+		if (m_n_fract * 6 >= 50) {
+			n_pll = 2;
+			m_pll = (m_n_int + 1) * n_pll;
+		} else if (m_n_fract * 6 >= 30) {
+			n_pll = 3;
+			m_pll = m_n_int * n_pll + 2;
+		} else {
+			n_pll = 1;
+			m_pll = m_n_int * n_pll;
+		}
+	} else {
+		if (m_n_fract * 6 >= 50) {
+			n_pll = 1;
+			m_pll = (m_n_int + 1) * n_pll;
+		} else if (m_n_fract * 6 >= 30) {
+			n_pll = 1;
+			m_pll = (m_n_int + 1) * n_pll;
+		} else if (m_n_fract * 6 >= 10) {
+			n_pll = 3;
+			m_pll = m_n_int * n_pll + 1;
+		} else {
+			n_pll = 2;
+			m_pll = m_n_int * n_pll;
+		}
+	}
+	//n_pll = 2;
+
+	m_pll = (u32)(lane_clock * vco_div * n_pll * 1000000UL / DEFAULT_MIPI_CLK_RATE);
+
+	lane_clock = m_pll * (DEFAULT_MIPI_CLK_RATE / n_pll) / vco_div;
+	if (lane_clock > 750000000) {
+		phy_ctrl->rg_cp = 3;
+	} else if ((80000000 <= lane_clock) && (lane_clock <= 750000000)) {
+		phy_ctrl->rg_cp = 1;
+	} else {
+		DRM_ERROR("80M <= lane_clock< = 2500M, not support lane_clock = %llu M.\n", lane_clock);
+	}
+
+	//chip spec :
+	phy_ctrl->rg_pre_div = n_pll - 1;
+	phy_ctrl->rg_div = m_pll;
+	phy_ctrl->rg_0p8v = 0;
+	phy_ctrl->rg_2p5g = 1;
+	phy_ctrl->rg_320m = 0;
+	phy_ctrl->rg_lpf_r = 0;
+
+	//TO DO HSTX select VCM VREF
+	phy_ctrl->rg_vrefsel_vcm = 0x5d;
+
+	/********************  clock/data lane parameters config  ******************/
+	accuracy = 10;
+	ui =  (u32)(10 * 1000000000UL * accuracy / lane_clock);
+	//unit of measurement
+	unit_tx_byte_clk_hs = 8 * ui;
+
+	// D-PHY Specification : 60ns + 52*UI <= clk_post
+	clk_post = 600 * accuracy + 52 * ui + unit_tx_byte_clk_hs + mipi->clk_post_adjust * ui;
+
+	// D-PHY Specification : clk_pre >= 8*UI
+	clk_pre = 8 * ui + unit_tx_byte_clk_hs + mipi->clk_pre_adjust * ui;
+
+	// D-PHY Specification : clk_t_hs_exit >= 100ns
+	clk_t_hs_exit = 1000 * accuracy + 100 * accuracy + mipi->clk_t_hs_exit_adjust * ui;
+
+	// clocked by TXBYTECLKHS
+	clk_pre_delay = 0 + mipi->clk_pre_delay_adjust * ui;
+
+	// D-PHY Specification : clk_t_hs_trial >= 60ns
+	// clocked by TXBYTECLKHS
+	clk_t_hs_trial = 600 * accuracy + 3 * unit_tx_byte_clk_hs + mipi->clk_t_hs_trial_adjust * ui;
+
+	// D-PHY Specification : 38ns <= clk_t_hs_prepare <= 95ns
+	// clocked by TXBYTECLKHS
+	clk_t_hs_prepare = 660 * accuracy;
+
+	// clocked by TXBYTECLKHS
+	data_post_delay = 0 + mipi->data_post_delay_adjust * ui;
+
+	// D-PHY Specification : data_t_hs_trial >= max( n*8*UI, 60ns + n*4*UI ), n = 1
+	// clocked by TXBYTECLKHS
+	data_t_hs_trial = ((600 * accuracy + 4 * ui) >= (8 * ui) ? (600 * accuracy + 4 * ui) : (8 * ui)) +
+		2 * unit_tx_byte_clk_hs + mipi->data_t_hs_trial_adjust * ui;
+
+	// D-PHY Specification : 40ns + 4*UI <= data_t_hs_prepare <= 85ns + 6*UI
+	// clocked by TXBYTECLKHS
+	data_t_hs_prepare = 400 * accuracy + 4*ui;
+	// D-PHY chip spec : clk_t_lpx + clk_t_hs_prepare > 200ns
+	// D-PHY Specification : clk_t_lpx >= 50ns
+	// clocked by TXBYTECLKHS
+	clk_t_lpx = (uint32_t)(2000 * accuracy + 10 * accuracy + mipi->clk_t_lpx_adjust * ui - clk_t_hs_prepare);
+
+	// D-PHY Specification : clk_t_hs_zero + clk_t_hs_prepare >= 300 ns
+	// clocked by TXBYTECLKHS
+	clk_t_hs_zero = (uint32_t)(3000 * accuracy + 3 * unit_tx_byte_clk_hs + mipi->clk_t_hs_zero_adjust * ui - clk_t_hs_prepare);
+
+	// D-PHY chip spec : data_t_lpx + data_t_hs_prepare > 200ns
+	// D-PHY Specification : data_t_lpx >= 50ns
+	// clocked by TXBYTECLKHS
+	data_t_lpx = (uint32_t)(2000 * accuracy + 10 * accuracy + mipi->data_t_lpx_adjust * ui - data_t_hs_prepare);
+
+	// D-PHY Specification : data_t_hs_zero + data_t_hs_prepare >= 145ns + 10*UI
+	// clocked by TXBYTECLKHS
+	data_t_hs_zero = (uint32_t)(1450 * accuracy + 10 * ui +
+		3 * unit_tx_byte_clk_hs + mipi->data_t_hs_zero_adjust * ui - data_t_hs_prepare);
+
+	phy_ctrl->clk_pre_delay = ROUND1(clk_pre_delay, unit_tx_byte_clk_hs);
+	phy_ctrl->clk_t_hs_prepare = ROUND1(clk_t_hs_prepare, unit_tx_byte_clk_hs);
+	phy_ctrl->clk_t_lpx = ROUND1(clk_t_lpx, unit_tx_byte_clk_hs);
+	phy_ctrl->clk_t_hs_zero = ROUND1(clk_t_hs_zero, unit_tx_byte_clk_hs);
+	phy_ctrl->clk_t_hs_trial = ROUND1(clk_t_hs_trial, unit_tx_byte_clk_hs);
+
+	phy_ctrl->data_post_delay = ROUND1(data_post_delay, unit_tx_byte_clk_hs);
+	phy_ctrl->data_t_hs_prepare = ROUND1(data_t_hs_prepare, unit_tx_byte_clk_hs);
+	phy_ctrl->data_t_lpx = ROUND1(data_t_lpx, unit_tx_byte_clk_hs);
+	phy_ctrl->data_t_hs_zero = ROUND1(data_t_hs_zero, unit_tx_byte_clk_hs);
+	phy_ctrl->data_t_hs_trial = ROUND1(data_t_hs_trial, unit_tx_byte_clk_hs);
+
+	phy_ctrl->clk_post_delay = phy_ctrl->data_t_hs_trial + ROUND1(clk_post, unit_tx_byte_clk_hs);
+	phy_ctrl->data_pre_delay = phy_ctrl->clk_pre_delay + 2 + phy_ctrl->clk_t_lpx +
+		phy_ctrl->clk_t_hs_prepare + phy_ctrl->clk_t_hs_zero + 8 + ROUND1(clk_pre, unit_tx_byte_clk_hs) ;
+
+	phy_ctrl->clk_lane_lp2hs_time = phy_ctrl->clk_pre_delay + phy_ctrl->clk_t_lpx + phy_ctrl->clk_t_hs_prepare +
+		phy_ctrl->clk_t_hs_zero + 5 + 7;
+	phy_ctrl->clk_lane_hs2lp_time = phy_ctrl->clk_t_hs_trial + phy_ctrl->clk_post_delay + 8 + 4;
+	phy_ctrl->data_lane_lp2hs_time = phy_ctrl->data_pre_delay + phy_ctrl->data_t_lpx + phy_ctrl->data_t_hs_prepare +
+		phy_ctrl->data_t_hs_zero + 5 + 7;
+	phy_ctrl->data_lane_hs2lp_time = phy_ctrl->data_t_hs_trial + 8 + 5;
+
+	phy_ctrl->phy_stop_wait_time = phy_ctrl->clk_post_delay + 4 + phy_ctrl->clk_t_hs_trial +
+		ROUND1(clk_t_hs_exit, unit_tx_byte_clk_hs) - (phy_ctrl->data_post_delay + 4 + phy_ctrl->data_t_hs_trial) + 3;
+
+	phy_ctrl->lane_byte_clk = lane_clock / 8;
+	phy_ctrl->clk_division = (((phy_ctrl->lane_byte_clk / 2) % mipi->max_tx_esc_clk) > 0) ?
+		(uint32_t)(phy_ctrl->lane_byte_clk / 2 / mipi->max_tx_esc_clk + 1) :
+		(uint32_t)(phy_ctrl->lane_byte_clk / 2 / mipi->max_tx_esc_clk);
+
+	DRM_DEBUG("DPHY clock_lane and data_lane config : \n"
+		"lane_clock = %llu, n_pll=%d, m_pll=%d\n"
+		"rg_cp=%d\n"
+		"rg_band_sel=%d\n"
+		"rg_vrefsel_vcm=%d\n"
+		"clk_pre_delay=%d\n"
+		"clk_post_delay=%d\n"
+		"clk_t_hs_prepare=%d\n"
+		"clk_t_lpx=%d\n"
+		"clk_t_hs_zero=%d\n"
+		"clk_t_hs_trial=%d\n"
+		"data_pre_delay=%d\n"
+		"data_post_delay=%d\n"
+		"data_t_hs_prepare=%d\n"
+		"data_t_lpx=%d\n"
+		"data_t_hs_zero=%d\n"
+		"data_t_hs_trial=%d\n"
+		"clk_lane_lp2hs_time=%d\n"
+		"clk_lane_hs2lp_time=%d\n"
+		"data_lane_lp2hs_time=%d\n"
+		"data_lane_hs2lp_time=%d\n"
+		"phy_stop_wait_time=%d\n",
+		lane_clock, n_pll, m_pll,
+		phy_ctrl->rg_cp,
+		phy_ctrl->rg_band_sel,
+		phy_ctrl->rg_vrefsel_vcm,
+		phy_ctrl->clk_pre_delay,
+		phy_ctrl->clk_post_delay,
+		phy_ctrl->clk_t_hs_prepare,
+		phy_ctrl->clk_t_lpx,
+		phy_ctrl->clk_t_hs_zero,
+		phy_ctrl->clk_t_hs_trial,
+		phy_ctrl->data_pre_delay,
+		phy_ctrl->data_post_delay,
+		phy_ctrl->data_t_hs_prepare,
+		phy_ctrl->data_t_lpx,
+		phy_ctrl->data_t_hs_zero,
+		phy_ctrl->data_t_hs_trial,
+		phy_ctrl->clk_lane_lp2hs_time,
+		phy_ctrl->clk_lane_hs2lp_time,
+		phy_ctrl->data_lane_lp2hs_time,
+		phy_ctrl->data_lane_hs2lp_time,
+		phy_ctrl->phy_stop_wait_time);
+}
+
 static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
 							struct mipi_phy_params *phy_ctrl)
 {
@@ -572,7 +856,7 @@ static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
 		(phy_ctrl->lane_byte_clk / 2 / mipi->max_tx_esc_clk + 1) :
 		(phy_ctrl->lane_byte_clk / 2 / mipi->max_tx_esc_clk);
 
-	DRM_INFO("PHY clock_lane and data_lane config : \n"
+	DRM_DEBUG("PHY clock_lane and data_lane config : \n"
 		"rg_vrefsel_vcm=%u\n"
 		"clk_pre_delay=%u\n"
 		"clk_post_delay=%u\n"
@@ -644,6 +928,7 @@ static void dsi_set_burst_mode(void __iomem *base, unsigned long flags)
 	else
 		val = DSI_BURST_SYNC_PULSES_1;
 
+	DRM_INFO("burst_mode = 0x%x (DSI_NON_BURST_SYNC_PULSES => 0)", val);
 	set_reg(base + MIPIDSI_VID_MODE_CFG_OFFSET, val, 2, 0);
 }
 
@@ -669,6 +954,85 @@ static void dsi_phy_tst_set(void __iomem *base, u32 reg, u32 val)
 	writel(0x00, base + MIPIDSI_PHY_TST_CTRL0_OFFSET);
 }
 
+static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
+{
+	uint32_t i;
+	uint32_t addr = 0;
+	u32 lanes;
+
+	lanes =  dsi->client[dsi->cur_client].lanes - 1;
+
+#if defined (CONFIG_HISI_FB_970)
+	for (i = 0; i <= lanes; i++) {
+		//Lane Transmission Property
+		addr = MIPIDSI_PHY_TST_LANE_TRANSMISSION_PROPERTY + (i << 5);
+		dsi_phy_tst_set(mipi_dsi_base, addr, 0x43);
+	}
+#endif
+
+	//pre_delay of clock lane request setting
+	dsi_phy_tst_set(mipi_dsi_base, MIPIDSI_PHY_TST_CLK_PRE_DELAY, DSS_REDUCE(dsi->phy.clk_pre_delay));
+
+	//post_delay of clock lane request setting
+	dsi_phy_tst_set(mipi_dsi_base, MIPIDSI_PHY_TST_CLK_POST_DELAY, DSS_REDUCE(dsi->phy.clk_post_delay));
+
+	//clock lane timing ctrl - t_lpx
+	dsi_phy_tst_set(mipi_dsi_base, MIPIDSI_PHY_TST_CLK_TLPX, DSS_REDUCE(dsi->phy.clk_t_lpx));
+
+	//clock lane timing ctrl - t_hs_prepare
+	dsi_phy_tst_set(mipi_dsi_base, MIPIDSI_PHY_TST_CLK_PREPARE, DSS_REDUCE(dsi->phy.clk_t_hs_prepare));
+
+	//clock lane timing ctrl - t_hs_zero
+	dsi_phy_tst_set(mipi_dsi_base, MIPIDSI_PHY_TST_CLK_ZERO, DSS_REDUCE(dsi->phy.clk_t_hs_zero));
+
+	//clock lane timing ctrl - t_hs_trial
+	dsi_phy_tst_set(mipi_dsi_base, MIPIDSI_PHY_TST_CLK_TRAIL, DSS_REDUCE(dsi->phy.clk_t_hs_trial));
+
+	for (i = 0; i <= (lanes + 1); i++) {//lint !e850
+		if (i == 2) {
+			i++;  //addr: lane0:0x60; lane1:0x80; lane2:0xC0; lane3:0xE0
+		}
+
+		//data lane pre_delay
+		addr = MIPIDSI_PHY_TST_DATA_PRE_DELAY + (i << 5);
+		dsi_phy_tst_set(mipi_dsi_base, addr, DSS_REDUCE(dsi->phy.data_pre_delay));
+
+		//data lane post_delay
+		addr = MIPIDSI_PHY_TST_DATA_POST_DELAY + (i << 5);
+		dsi_phy_tst_set(mipi_dsi_base, addr, DSS_REDUCE(dsi->phy.data_post_delay));
+
+		//data lane timing ctrl - t_lpx
+		addr = MIPIDSI_PHY_TST_DATA_TLPX + (i << 5);
+		dsi_phy_tst_set(mipi_dsi_base, addr, DSS_REDUCE(dsi->phy.data_t_lpx));
+
+		//data lane timing ctrl - t_hs_prepare
+		addr = MIPIDSI_PHY_TST_DATA_PREPARE + (i << 5);
+		dsi_phy_tst_set(mipi_dsi_base, addr, DSS_REDUCE(dsi->phy.data_t_hs_prepare));
+
+		//data lane timing ctrl - t_hs_zero
+		addr = MIPIDSI_PHY_TST_DATA_ZERO + (i << 5);
+		dsi_phy_tst_set(mipi_dsi_base, addr, DSS_REDUCE(dsi->phy.data_t_hs_zero));
+
+		//data lane timing ctrl - t_hs_trial
+		addr = MIPIDSI_PHY_TST_DATA_TRAIL + (i << 5);
+		dsi_phy_tst_set(mipi_dsi_base, addr, DSS_REDUCE(dsi->phy.data_t_hs_trial));
+
+		DRM_DEBUG("DPHY spec1v2 config : \n"
+			"addr=0x%x\n"
+			"clk_pre_delay=%u\n"
+			"clk_t_hs_trial=%u\n"
+			"data_t_hs_zero=%u\n"
+			"data_t_lpx=%u\n"
+			"data_t_hs_prepare=%u\n",
+			addr,
+			dsi->phy.clk_pre_delay,
+			dsi->phy.clk_t_hs_trial,
+			dsi->phy.data_t_hs_zero,
+			dsi->phy.data_t_lpx,
+			dsi->phy.data_t_hs_prepare);
+	}
+}
+
 static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 {
 	u32 hline_time = 0;
@@ -697,7 +1061,12 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	}
 
 	memset(&dsi->phy, 0, sizeof(struct mipi_phy_params));
+
+#if defined (CONFIG_HISI_FB_970)
+	get_dsi_dphy_ctrl(dsi, &dsi->phy);
+#else
 	get_dsi_phy_ctrl(dsi, &dsi->phy);
+#endif
 
 	rect.x = 0;
 	rect.y = 0;
@@ -716,6 +1085,36 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	outp32(mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET, 0x00000001);
 	outp32(mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET, 0x00000000);
 
+#if defined (CONFIG_HISI_FB_970)
+	dsi_phy_tst_set(mipi_dsi_base, 0x0042, 0x21);
+	//PLL configuration I
+	dsi_phy_tst_set(mipi_dsi_base, 0x0046, dsi->phy.rg_cp + (dsi->phy.rg_lpf_r << 4));
+
+	//PLL configuration II
+	dsi_phy_tst_set(mipi_dsi_base, 0x0048, dsi->phy.rg_0p8v + (dsi->phy.rg_2p5g << 1) +
+		(dsi->phy.rg_320m << 2) + (dsi->phy.rg_band_sel << 3));
+
+	//PLL configuration III
+	dsi_phy_tst_set(mipi_dsi_base, 0x0049, dsi->phy.rg_pre_div);
+
+	//PLL configuration IV
+	dsi_phy_tst_set(mipi_dsi_base, 0x004A, dsi->phy.rg_div);
+
+	dsi_phy_tst_set(mipi_dsi_base, 0x004F, 0xf0);
+	dsi_phy_tst_set(mipi_dsi_base, 0x0050, 0xc0);
+	dsi_phy_tst_set(mipi_dsi_base, 0x0051, 0x22);
+
+	dsi_phy_tst_set(mipi_dsi_base, 0x0053, dsi->phy.rg_vrefsel_vcm);
+
+	/*enable BTA*/
+	dsi_phy_tst_set(mipi_dsi_base, 0x0054, 0x03);
+
+	//PLL update control
+	dsi_phy_tst_set(mipi_dsi_base, 0x004B, 0x1);
+
+	//set dphy spec parameter
+	mipi_config_dphy_spec1v2_parameter(dsi, mipi_dsi_base);
+#else
 	/* physical configuration PLL I*/
 	dsi_phy_tst_set(mipi_dsi_base, 0x14,
 		(dsi->phy.rg_pll_fbd_s << 4) + (dsi->phy.rg_pll_enswc << 3) +
@@ -794,6 +1193,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 		tmp = 0x37 + (i << 4);
 		dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_t_ta_get));
 	}
+#endif
 
 	outp32(mipi_dsi_base + MIPIDSI_PHY_RSTZ_OFFSET, 0x00000007);
 
@@ -924,6 +1324,13 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_CFG_OFFSET, dsi->phy.data_lane_lp2hs_time, 10, 0);
 	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_CFG_OFFSET, dsi->phy.data_lane_hs2lp_time, 10, 16);
 
+#if defined (CONFIG_HISI_FB_970)
+	//16~19bit:pclk_en, pclk_sel, dpipclk_en, dpipclk_sel
+	set_reg(mipi_dsi_base + MIPIDSI_CLKMGR_CFG_OFFSET, 0x5, 4, 16);
+	//0:dphy
+	set_reg(mipi_dsi_base + PHY_MODE, 0x0, 1, 0);
+#endif
+
 	/* Waking up Core*/
 	set_reg(mipi_dsi_base + MIPIDSI_PWR_UP_OFFSET, 0x1, 1, 0);
 }
@@ -962,7 +1369,12 @@ static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 
 	/* mipi init */
 	dsi_mipi_init(dsi, mipi_dsi_base);
-	DRM_INFO("dsi_mipi_init ok\n");
+
+	/* dsi memory init */
+#if defined (CONFIG_HISI_FB_970)
+	outp32(mipi_dsi_base + DSI_MEM_CTRL, 0x02600008);
+#endif
+
 	/* switch to cmd mode */
 	set_reg(mipi_dsi_base + MIPIDSI_MODE_CFG_OFFSET, 0x1, 1, 0);
 	/* cmd mode: low power mode */
@@ -979,6 +1391,7 @@ static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 static int mipi_dsi_on_sub2(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 {
 	WARN_ON(!mipi_dsi_base);
+	u64 pctrl_dphytx_stopcnt = 0;
 
 	/* switch to video mode */
 	set_reg(mipi_dsi_base + MIPIDSI_MODE_CFG_OFFSET, 0x0, 1, 0);
@@ -989,6 +1402,17 @@ static int mipi_dsi_on_sub2(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	/* enable generate High Speed clock, continue clock */
 	set_reg(mipi_dsi_base + MIPIDSI_LPCLK_CTRL_OFFSET, 0x1, 2, 0);
 
+#if defined(CONFIG_HISI_FB_970)
+	// init: wait DPHY 4 data lane stopstate
+	pctrl_dphytx_stopcnt = (u64)(dsi->ldi.h_back_porch +
+		dsi->ldi.h_front_porch + dsi->ldi.h_pulse_width + dsi->cur_mode.hdisplay + 5) *
+		DEFAULT_PCLK_PCTRL_RATE / (dsi->cur_mode.clock * 1000);
+	DRM_DEBUG("pctrl_dphytx_stopcnt = %llu\n", pctrl_dphytx_stopcnt);
+
+	//FIXME:
+	outp32(dsi->ctx->pctrl_base + PERI_CTRL29, (u32)pctrl_dphytx_stopcnt);
+#endif
+
 	return 0;
 }
 
@@ -1504,29 +1928,40 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 
 	np = of_find_compatible_node(NULL, NULL, DTS_COMP_DSI_NAME);
 	if (!np) {
-			DRM_ERROR("NOT FOUND device node %s!\n",
-				    DTS_COMP_DSI_NAME);
-			return -ENXIO;
+		DRM_ERROR("NOT FOUND device node %s!\n",
+				   DTS_COMP_DSI_NAME);
+		return -ENXIO;
 	}
 
 	ctx->base = of_iomap(np, 0);
 	if (!(ctx->base)) {
-			DRM_ERROR ("failed to get base resource.\n");
-			return -ENXIO;
+		DRM_ERROR ("failed to get dsi base resource.\n");
+		return -ENXIO;
 	}
+	DRM_INFO("dsi base =0x%x.\n", ctx->base);
 
 	ctx->peri_crg_base = of_iomap(np, 1);
 	if (!(ctx->peri_crg_base)) {
-			DRM_ERROR ("failed to get peri_crg_base resource.\n");
-			return -ENXIO;
+		DRM_ERROR ("failed to get peri_crg_base resource.\n");
+		return -ENXIO;
 	}
 
+#if defined (CONFIG_HISI_FB_970)
+	ctx->pctrl_base = of_iomap(np, 2);
+	if (!(ctx->pctrl_base)) {
+		DRM_ERROR ("failed to get dss pctrl_base resource.\n");
+		return -ENXIO;
+	}
+#endif
+
 	dsi->gpio_mux = devm_gpiod_get(&pdev->dev, "mux", GPIOD_OUT_HIGH);
 	if (IS_ERR(dsi->gpio_mux))
 		return PTR_ERR(dsi->gpio_mux);
+
 	/* set dsi default output to panel */
 	dsi->cur_client = OUT_PANEL;
 
+	DRM_INFO("dsi  cur_client is %d  <0->hdmi;1->panel> \n", dsi->cur_client);
 	/*dis-reset*/
 	/*ip_reset_dis_dsi0, ip_reset_dis_dsi1*/
 	outp32(ctx->peri_crg_base + PERRSTDIS3, 0x30000000);
@@ -1630,6 +2065,7 @@ static int dsi_remove(struct platform_device *pdev)
 
 static const struct of_device_id dsi_of_match[] = {
 	{.compatible = "hisilicon,hi3660-dsi"},
+	{.compatible = "hisilicon,kirin970-dsi"},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dsi_of_match);
diff --git a/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
new file mode 100644
index 000000000000..818b4b65334c
--- /dev/null
+++ b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
@@ -0,0 +1,1653 @@
+/*
+ * Analog Devices ADV7511 HDMI transmitter driver
+ *
+ * Copyright 2012 Analog Devices Inc.
+ *
+ * Licensed under the GPL-2.
+ */
+
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/of_graph.h>
+
+#include <drm/drmP.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_encoder_slave.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_mipi_dsi.h>
+
+#include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+
+#include "adv7535.h"
+
+#define HPD_ENABLE	1
+//#define TEST_COLORBAR_DISPLAY
+#ifdef CONFIG_HDMI_ADV7511_AUDIO
+extern int adv7511_audio_init(struct device *dev);
+#endif
+static struct adv7511 *encoder_to_adv7511(struct drm_encoder *encoder)
+{
+	return to_encoder_slave(encoder)->slave_priv;
+}
+
+/* ADI recommended values for proper operation. */
+static const struct reg_sequence adv7511_fixed_registers[] = {
+	{ 0x98, 0x03 },
+	{ 0x9a, 0xe0 },
+	{ 0x9c, 0x30 },
+	{ 0x9d, 0x61 },
+	{ 0xa2, 0xa4 },
+	{ 0xa3, 0xa4 },
+	{ 0xe0, 0xd0 },
+	{ 0xf9, 0x00 },
+	{ 0x55, 0x02 },
+};
+
+/* ADI recommended values for proper operation. */
+static const struct reg_sequence adv7533_fixed_registers[] = {
+	{ 0x16, 0x20 },
+	{ 0x9a, 0xe0 },
+	{ 0xba, 0x70 },
+	{ 0xde, 0x82 },
+	{ 0xe4, 0x40 },
+	{ 0xe5, 0x80 },
+};
+
+static const struct reg_sequence adv7533_cec_fixed_registers[] = {
+	{ 0x15, 0xd0 },
+	{ 0x17, 0xd0 },
+	{ 0x24, 0x20 },
+	{ 0x57, 0x11 },
+	{ 0x05, 0xc8 },
+};
+
+/* -----------------------------------------------------------------------------
+ * Register access
+ */
+
+static const uint8_t adv7511_register_defaults[] = {
+	0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 00 */
+	0x00, 0x00, 0x01, 0x0e, 0xbc, 0x18, 0x01, 0x13,
+	0x25, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 10 */
+	0x46, 0x62, 0x04, 0xa8, 0x00, 0x00, 0x1c, 0x84,
+	0x1c, 0xbf, 0x04, 0xa8, 0x1e, 0x70, 0x02, 0x1e, /* 20 */
+	0x00, 0x00, 0x04, 0xa8, 0x08, 0x12, 0x1b, 0xac,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 30 */
+	0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0xb0,
+	0x00, 0x50, 0x90, 0x7e, 0x79, 0x70, 0x00, 0x00, /* 40 */
+	0x00, 0xa8, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x02, 0x0d, 0x00, 0x00, 0x00, 0x00, /* 50 */
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 60 */
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x01, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 70 */
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 80 */
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00, /* 90 */
+	0x0b, 0x02, 0x00, 0x18, 0x5a, 0x60, 0x00, 0x00,
+	0x00, 0x00, 0x80, 0x80, 0x08, 0x04, 0x00, 0x00, /* a0 */
+	0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x40, 0x14,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* b0 */
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* c0 */
+	0x00, 0x03, 0x00, 0x00, 0x02, 0x00, 0x01, 0x04,
+	0x30, 0xff, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00, /* d0 */
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x01,
+	0x80, 0x75, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, /* e0 */
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x75, 0x11, 0x00, /* f0 */
+	0x00, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+};
+
+static bool adv7511_register_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ADV7511_REG_CHIP_REVISION:
+	case ADV7511_REG_SPDIF_FREQ:
+	case ADV7511_REG_CTS_AUTOMATIC1:
+	case ADV7511_REG_CTS_AUTOMATIC2:
+	case ADV7511_REG_VIC_DETECTED:
+	case ADV7511_REG_VIC_SEND:
+	case ADV7511_REG_AUX_VIC_DETECTED:
+	case ADV7511_REG_STATUS:
+	case ADV7511_REG_GC(1):
+	case ADV7511_REG_INT(0):
+	case ADV7511_REG_INT(1):
+	case ADV7511_REG_PLL_STATUS:
+	case ADV7511_REG_AN(0):
+	case ADV7511_REG_AN(1):
+	case ADV7511_REG_AN(2):
+	case ADV7511_REG_AN(3):
+	case ADV7511_REG_AN(4):
+	case ADV7511_REG_AN(5):
+	case ADV7511_REG_AN(6):
+	case ADV7511_REG_AN(7):
+	case ADV7511_REG_HDCP_STATUS:
+	case ADV7511_REG_BCAPS:
+	case ADV7511_REG_BKSV(0):
+	case ADV7511_REG_BKSV(1):
+	case ADV7511_REG_BKSV(2):
+	case ADV7511_REG_BKSV(3):
+	case ADV7511_REG_BKSV(4):
+	case ADV7511_REG_DDC_STATUS:
+	case ADV7511_REG_BSTATUS(0):
+	case ADV7511_REG_BSTATUS(1):
+	case ADV7511_REG_CHIP_ID_HIGH:
+	case ADV7511_REG_CHIP_ID_LOW:
+		return true;
+	}
+
+	return false;
+}
+
+static const struct regmap_config adv7511_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = 0xff,
+	.cache_type = REGCACHE_RBTREE,
+	.reg_defaults_raw = adv7511_register_defaults,
+	.num_reg_defaults_raw = ARRAY_SIZE(adv7511_register_defaults),
+
+	.volatile_reg = adv7511_register_volatile,
+};
+
+static const struct regmap_config adv7533_cec_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = 0xff,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static const struct regmap_config adv7533_packet_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = 0xff,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+
+/* -----------------------------------------------------------------------------
+ * Hardware configuration
+ */
+
+static void adv7511_set_colormap(struct adv7511 *adv7511, bool enable,
+				 const uint16_t *coeff,
+				 unsigned int scaling_factor)
+{
+	unsigned int i;
+
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_CSC_UPPER(1),
+			   ADV7511_CSC_UPDATE_MODE, ADV7511_CSC_UPDATE_MODE);
+
+	if (enable) {
+		for (i = 0; i < 12; ++i) {
+			regmap_update_bits(adv7511->regmap,
+					   ADV7511_REG_CSC_UPPER(i),
+					   0x1f, coeff[i] >> 8);
+			regmap_write(adv7511->regmap,
+				     ADV7511_REG_CSC_LOWER(i),
+				     coeff[i] & 0xff);
+		}
+	}
+
+	if (enable)
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_CSC_UPPER(0),
+				   0xe0, 0x80 | (scaling_factor << 5));
+	else
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_CSC_UPPER(0),
+				   0x80, 0x00);
+
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_CSC_UPPER(1),
+			   ADV7511_CSC_UPDATE_MODE, 0);
+}
+
+int adv7511_packet_enable(struct adv7511 *adv7511, unsigned int packet)
+{
+	if (packet & 0xff)
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_PACKET_ENABLE0,
+				   packet, 0xff);
+
+	if (packet & 0xff00) {
+		packet >>= 8;
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_PACKET_ENABLE1,
+				   packet, 0xff);
+	}
+
+	return 0;
+}
+
+int adv7511_packet_disable(struct adv7511 *adv7511, unsigned int packet)
+{
+	if (packet & 0xff)
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_PACKET_ENABLE0,
+				   packet, 0x00);
+
+	if (packet & 0xff00) {
+		packet >>= 8;
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_PACKET_ENABLE1,
+				   packet, 0x00);
+	}
+
+	return 0;
+}
+
+/* Coefficients for adv7511 color space conversion */
+static const uint16_t adv7511_csc_ycbcr_to_rgb[] = {
+	0x0734, 0x04ad, 0x0000, 0x1c1b,
+	0x1ddc, 0x04ad, 0x1f24, 0x0135,
+	0x0000, 0x04ad, 0x087c, 0x1b77,
+};
+
+static void adv7511_set_config_csc(struct adv7511 *adv7511,
+				   struct drm_connector *connector,
+				   bool rgb)
+{
+	struct adv7511_video_config config;
+	bool output_format_422, output_format_ycbcr;
+	unsigned int mode;
+	uint8_t infoframe[17];
+
+	if (adv7511->edid)
+		config.hdmi_mode = drm_detect_hdmi_monitor(adv7511->edid);
+	else
+		config.hdmi_mode = false;
+
+	hdmi_avi_infoframe_init(&config.avi_infoframe);
+
+	config.avi_infoframe.scan_mode = HDMI_SCAN_MODE_UNDERSCAN;
+
+	if (rgb) {
+		config.csc_enable = false;
+		config.avi_infoframe.colorspace = HDMI_COLORSPACE_RGB;
+	} else {
+		config.csc_scaling_factor = ADV7511_CSC_SCALING_4;
+		config.csc_coefficents = adv7511_csc_ycbcr_to_rgb;
+
+		if ((connector->display_info.color_formats &
+		     DRM_COLOR_FORMAT_YCRCB422) &&
+		    config.hdmi_mode) {
+			config.csc_enable = false;
+			config.avi_infoframe.colorspace =
+				HDMI_COLORSPACE_YUV422;
+		} else {
+			config.csc_enable = true;
+			config.avi_infoframe.colorspace = HDMI_COLORSPACE_RGB;
+		}
+	}
+
+	if (config.hdmi_mode) {
+		mode = ADV7511_HDMI_CFG_MODE_HDMI;
+
+		switch (config.avi_infoframe.colorspace) {
+		case HDMI_COLORSPACE_YUV444:
+			output_format_422 = false;
+			output_format_ycbcr = true;
+			break;
+		case HDMI_COLORSPACE_YUV422:
+			output_format_422 = true;
+			output_format_ycbcr = true;
+			break;
+		default:
+			output_format_422 = false;
+			output_format_ycbcr = false;
+			break;
+		}
+	} else {
+		mode = ADV7511_HDMI_CFG_MODE_DVI;
+		output_format_422 = false;
+		output_format_ycbcr = false;
+	}
+
+	adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+
+	adv7511_set_colormap(adv7511, config.csc_enable,
+			     config.csc_coefficents,
+			     config.csc_scaling_factor);
+
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_VIDEO_INPUT_CFG1, 0x81,
+			   (output_format_422 << 7) | output_format_ycbcr);
+
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_HDCP_HDMI_CFG,
+			   ADV7511_HDMI_CFG_MODE_MASK, mode);
+
+	hdmi_avi_infoframe_pack(&config.avi_infoframe, infoframe,
+				sizeof(infoframe));
+
+	/* The AVI infoframe id is not configurable */
+	regmap_bulk_write(adv7511->regmap, ADV7511_REG_AVI_INFOFRAME_VERSION,
+			  infoframe + 1, sizeof(infoframe) - 1);
+
+	adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_AVI_INFOFRAME);
+}
+
+static void adv7511_set_link_config(struct adv7511 *adv7511,
+				    const struct adv7511_link_config *config)
+{
+	/*
+	 * The input style values documented in the datasheet don't match the
+	 * hardware register field values :-(
+	 */
+	static const unsigned int input_styles[4] = { 0, 2, 1, 3 };
+
+	unsigned int clock_delay;
+	unsigned int color_depth;
+	unsigned int input_id;
+
+	clock_delay = (config->clock_delay + 1200) / 400;
+	color_depth = config->input_color_depth == 8 ? 3
+		    : (config->input_color_depth == 10 ? 1 : 2);
+
+	/* TODO Support input ID 6 */
+	if (config->input_colorspace != HDMI_COLORSPACE_YUV422)
+		input_id = config->input_clock == ADV7511_INPUT_CLOCK_DDR
+			 ? 5 : 0;
+	else if (config->input_clock == ADV7511_INPUT_CLOCK_DDR)
+		input_id = config->embedded_sync ? 8 : 7;
+	else if (config->input_clock == ADV7511_INPUT_CLOCK_2X)
+		input_id = config->embedded_sync ? 4 : 3;
+	else
+		input_id = config->embedded_sync ? 2 : 1;
+
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_I2C_FREQ_ID_CFG, 0xf,
+			   input_id);
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_VIDEO_INPUT_CFG1, 0x7e,
+			   (color_depth << 4) |
+			   (input_styles[config->input_style] << 2));
+	regmap_write(adv7511->regmap, ADV7511_REG_VIDEO_INPUT_CFG2,
+		     config->input_justification << 3);
+	regmap_write(adv7511->regmap, ADV7511_REG_TIMING_GEN_SEQ,
+		     config->sync_pulse << 2);
+
+	regmap_write(adv7511->regmap, 0xba, clock_delay << 5);
+
+	adv7511->embedded_sync = config->embedded_sync;
+	adv7511->hsync_polarity = config->hsync_polarity;
+	adv7511->vsync_polarity = config->vsync_polarity;
+	adv7511->rgb = config->input_colorspace == HDMI_COLORSPACE_RGB;
+}
+
+static void adv7511_dsi_config_tgen(struct adv7511 *adv7511)
+{
+	struct mipi_dsi_device *dsi = adv7511->dsi;
+	struct drm_display_mode *mode = &adv7511->curr_mode;
+	u8 clock_div_by_lanes[] = { 6, 4, 3 }; /* 2, 3, 4 lanes */
+	unsigned int hsw, hfp, hbp, vsw, vfp, vbp;
+
+	hsw = mode->hsync_end - mode->hsync_start;
+	hfp = mode->hsync_start - mode->hdisplay;
+	hbp = mode->htotal - mode->hsync_end;
+	vsw = mode->vsync_end - mode->vsync_start;
+	vfp = mode->vsync_start - mode->vdisplay;
+	vbp = mode->vtotal - mode->vsync_end;
+
+#ifdef TEST_COLORBAR_DISPLAY
+	/* set pixel clock auto mode */
+	regmap_write(adv7511->regmap_cec, 0x16,
+			0x00);
+#else
+	/* set pixel clock divider mode */
+	regmap_write(adv7511->regmap_cec, 0x16,
+			clock_div_by_lanes[adv7511->num_dsi_lanes - 2] << 3);
+#endif
+
+	/* set pixel clock divider mode */
+	/*regmap_write(adv7511->regmap_cec, 0x16,
+			clock_div_by_lanes[dsi->lanes - 2] << 3);*/
+
+	/* horizontal porch params */
+	regmap_write(adv7511->regmap_cec, 0x28, mode->htotal >> 4);
+	regmap_write(adv7511->regmap_cec, 0x29, (mode->htotal << 4) & 0xff);
+	regmap_write(adv7511->regmap_cec, 0x2a, hsw >> 4);
+	regmap_write(adv7511->regmap_cec, 0x2b, (hsw << 4) & 0xff);
+	regmap_write(adv7511->regmap_cec, 0x2c, hfp >> 4);
+	regmap_write(adv7511->regmap_cec, 0x2d, (hfp << 4) & 0xff);
+	regmap_write(adv7511->regmap_cec, 0x2e, hbp >> 4);
+	regmap_write(adv7511->regmap_cec, 0x2f, (hbp << 4) & 0xff);
+
+	/* vertical porch params */
+	regmap_write(adv7511->regmap_cec, 0x30, mode->vtotal >> 4);
+	regmap_write(adv7511->regmap_cec, 0x31, (mode->vtotal << 4) & 0xff);
+	regmap_write(adv7511->regmap_cec, 0x32, vsw >> 4);
+	regmap_write(adv7511->regmap_cec, 0x33, (vsw << 4) & 0xff);
+	regmap_write(adv7511->regmap_cec, 0x34, vfp >> 4);
+	regmap_write(adv7511->regmap_cec, 0x35, (vfp << 4) & 0xff);
+	regmap_write(adv7511->regmap_cec, 0x36, vbp >> 4);
+	regmap_write(adv7511->regmap_cec, 0x37, (vbp << 4) & 0xff);
+}
+
+static void adv7511_dsi_receiver_dpms(struct adv7511 *adv7511)
+{
+	if (adv7511->type != ADV7533)
+		return;
+
+	if (adv7511->powered) {
+		struct mipi_dsi_device *dsi = adv7511->dsi;
+
+		adv7511_dsi_config_tgen(adv7511);
+
+		/* set number of dsi lanes */
+		regmap_write(adv7511->regmap_cec, 0x1c, dsi->lanes << 4);
+
+#ifdef TEST_COLORBAR_DISPLAY
+		/* reset internal timing generator */
+		regmap_write(adv7511->regmap_cec, 0x27, 0xcb);
+		regmap_write(adv7511->regmap_cec, 0x27, 0x8b);
+		regmap_write(adv7511->regmap_cec, 0x27, 0xcb);
+#else
+		/* disable internal timing generator */
+		regmap_write(adv7511->regmap_cec, 0x27, 0x0b);
+#endif
+
+
+		/* enable hdmi */
+		regmap_write(adv7511->regmap_cec, 0x03, 0x89);
+#ifdef TEST_COLORBAR_DISPLAY
+		/*enable test mode */
+		regmap_write(adv7511->regmap_cec, 0x55, 0x80);//display colorbar
+#else
+		/* disable test mode */
+		regmap_write(adv7511->regmap_cec, 0x55, 0x00);
+#endif
+		/* disable test mode */
+		//regmap_write(adv7511->regmap_cec, 0x55, 0x00);
+		/* SPD */
+		{
+			static const unsigned char spd_if[] = {
+				0x83, 0x01, 25, 0x00,
+				'L', 'i', 'n', 'a', 'r', 'o', 0, 0,
+				'9', '6', 'b', 'o', 'a', 'r', 'd', 's',
+				':', 'H', 'i', 'k', 'e', 'y', 0, 0,
+			};
+			int n;
+
+			for (n = 0; n < sizeof(spd_if); n++)
+				regmap_write(adv7511->regmap_packet, n, spd_if[n]);
+
+			/* enable send SPD */
+			regmap_update_bits(adv7511->regmap, 0x40, BIT(6), BIT(6));
+		}
+
+		/* force audio */
+		/* hide Audio infoframe updates */
+		regmap_update_bits(adv7511->regmap, 0x4a, BIT(5), BIT(5));
+
+		/* i2s, internal mclk, mclk-256 */
+		regmap_update_bits(adv7511->regmap, 0x0a, 0x1f, 1);
+		regmap_update_bits(adv7511->regmap, 0x0b, 0xe0, 0);
+		/* enable i2s, use i2s format, sample rate from i2s */
+		regmap_update_bits(adv7511->regmap, 0x0c, 0xc7, BIT(2));
+		/* 16 bit audio */
+		regmap_update_bits(adv7511->regmap, 0x0d, 0xff, 16);
+		/* 16-bit audio */
+		regmap_update_bits(adv7511->regmap, 0x14, 0x0f, 2 << 4);
+		/* 48kHz */
+		regmap_update_bits(adv7511->regmap, 0x15, 0xf0, 2 << 4);
+		/* enable N/CTS, enable Audio sample packets */
+		regmap_update_bits(adv7511->regmap, 0x44, BIT(5), BIT(5));
+		/* N = 6144 */
+		regmap_write(adv7511->regmap, 1, (6144 >> 16) & 0xf);
+		regmap_write(adv7511->regmap, 2, (6144 >> 8) & 0xff);
+		regmap_write(adv7511->regmap, 3, (6144) & 0xff);
+		/* automatic cts */
+		regmap_update_bits(adv7511->regmap, 0x0a, BIT(7), 0);
+		/* enable N/CTS */
+		regmap_update_bits(adv7511->regmap, 0x44, BIT(6), BIT(6));
+		/* not copyrighted */
+		regmap_update_bits(adv7511->regmap, 0x12, BIT(5), BIT(5));
+
+		/* left source */
+		regmap_update_bits(adv7511->regmap, 0x0e, 7 << 3, 0);
+		/* right source */
+		regmap_update_bits(adv7511->regmap, 0x0e, 7 << 0, 1);
+		/* number of channels: sect 4.5.4: set to 0 */
+		regmap_update_bits(adv7511->regmap, 0x73, 7, 1);
+		/* number of channels: sect 4.5.4: set to 0 */
+		regmap_update_bits(adv7511->regmap, 0x73, 0xf0, 1 << 4);
+		/* sample rate: 48kHz */
+		regmap_update_bits(adv7511->regmap, 0x74, 7 << 2, 3 << 2);
+		/* channel allocation reg: sect 4.5.4: set to 0 */
+		regmap_update_bits(adv7511->regmap, 0x76, 0xff, 0);
+		/* enable audio infoframes */
+		regmap_update_bits(adv7511->regmap, 0x44, BIT(3), BIT(3));
+
+		/* AV mute disable */
+		regmap_update_bits(adv7511->regmap, 0x4b, BIT(7) | BIT(6), BIT(7));
+
+		/* use Audio infoframe updated info */
+		regmap_update_bits(adv7511->regmap, 0x4a, BIT(5), 0);
+	} else {
+		regmap_write(adv7511->regmap_cec, 0x03, 0x0b);
+		regmap_write(adv7511->regmap_cec, 0x27, 0x0b);
+	}
+}
+
+static void adv7511_power_on(struct adv7511 *adv7511)
+{
+	adv7511->current_edid_segment = -1;
+
+	regmap_write(adv7511->regmap, ADV7511_REG_INT(0),
+		     ADV7511_INT0_EDID_READY);
+	regmap_write(adv7511->regmap, ADV7511_REG_INT(1),
+		     ADV7511_INT1_DDC_ERROR);
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER,
+			   ADV7511_POWER_POWER_DOWN, 0);
+
+	/*
+	 * Per spec it is allowed to pulse the HDP signal to indicate that the
+	 * EDID information has changed. Some monitors do this when they wakeup
+	 * from standby or are enabled. When the HDP goes low the adv7511 is
+	 * reset and the outputs are disabled which might cause the monitor to
+	 * go to standby again. To avoid this we ignore the HDP pin for the
+	 * first few seconds after enabling the output.
+	 */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
+			   ADV7511_REG_POWER2_HDP_SRC_MASK,
+			   ADV7511_REG_POWER2_HDP_SRC_NONE);
+
+	/*
+	 * Most of the registers are reset during power down or when HPD is low.
+	 */
+	regcache_sync(adv7511->regmap);
+
+	if (adv7511->type == ADV7533)
+		regmap_register_patch(adv7511->regmap_cec,
+				      adv7533_cec_fixed_registers,
+				      ARRAY_SIZE(adv7533_cec_fixed_registers));
+	adv7511->powered = true;
+
+	adv7511_dsi_receiver_dpms(adv7511);
+}
+
+static void adv7511_power_off(struct adv7511 *adv7511)
+{
+	/* TODO: setup additional power down modes */
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER,
+			   ADV7511_POWER_POWER_DOWN,
+			   ADV7511_POWER_POWER_DOWN);
+	regcache_mark_dirty(adv7511->regmap);
+
+	adv7511->powered = false;
+
+	adv7511_dsi_receiver_dpms(adv7511);
+}
+
+/* -----------------------------------------------------------------------------
+ * Interrupt and hotplug detection
+ */
+
+#if HPD_ENABLE
+static bool adv7511_hpd(struct adv7511 *adv7511)
+{
+	unsigned int irq0;
+	int ret;
+
+	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
+	if (ret < 0)
+		return false;
+
+	if (irq0 & ADV7511_INT0_HDP) {
+		regmap_write(adv7511->regmap, ADV7511_REG_INT(0),
+			     ADV7511_INT0_HDP);
+		return true;
+	}
+
+	return false;
+}
+#endif
+
+static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
+{
+	unsigned int irq0, irq1;
+	int ret;
+
+	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(1), &irq1);
+	if (ret < 0)
+		return ret;
+
+	regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
+	regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
+
+	if (process_hpd && irq0 & ADV7511_INT0_HDP && adv7511->encoder)
+		drm_helper_hpd_irq_event(adv7511->encoder->dev);
+
+	if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_ERROR) {
+		adv7511->edid_read = true;
+
+		if (adv7511->i2c_main->irq)
+			wake_up_all(&adv7511->wq);
+	}
+
+	return 0;
+}
+
+static irqreturn_t adv7511_irq_handler(int irq, void *devid)
+{
+	struct adv7511 *adv7511 = devid;
+	int ret;
+
+	ret = adv7511_irq_process(adv7511, true);
+	return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
+}
+
+/* -----------------------------------------------------------------------------
+ * EDID retrieval
+ */
+
+static int adv7511_wait_for_edid(struct adv7511 *adv7511, int timeout)
+{
+	int ret;
+
+	if (adv7511->i2c_main->irq) {
+		ret = wait_event_interruptible_timeout(adv7511->wq,
+				adv7511->edid_read, msecs_to_jiffies(timeout));
+	} else {
+		for (; timeout > 0; timeout -= 25) {
+			ret = adv7511_irq_process(adv7511, false);
+			if (ret < 0)
+				break;
+
+			if (adv7511->edid_read)
+				break;
+
+			msleep(25);
+		}
+	}
+
+	return adv7511->edid_read ? 0 : -EIO;
+}
+
+static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
+				  size_t len)
+{
+	struct adv7511 *adv7511 = data;
+	struct i2c_msg xfer[2];
+	uint8_t offset;
+	unsigned int i;
+	int ret;
+
+	if (len > 128)
+		return -EINVAL;
+
+	if (adv7511->current_edid_segment != block / 2) {
+		unsigned int status;
+
+		ret = regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
+				  &status);
+		if (ret < 0)
+			return ret;
+
+		if (status != 2) {
+			adv7511->edid_read = false;
+			regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
+				     block);
+			ret = adv7511_wait_for_edid(adv7511, 200);
+			if (ret < 0)
+				return ret;
+		}
+
+		/* Break this apart, hopefully more I2C controllers will
+		 * support 64 byte transfers than 256 byte transfers
+		 */
+
+		xfer[0].addr = adv7511->i2c_edid->addr;
+		xfer[0].flags = 0;
+		xfer[0].len = 1;
+		xfer[0].buf = &offset;
+		xfer[1].addr = adv7511->i2c_edid->addr;
+		xfer[1].flags = I2C_M_RD;
+		xfer[1].len = 64;
+		xfer[1].buf = adv7511->edid_buf;
+
+		offset = 0;
+
+		for (i = 0; i < 4; ++i) {
+			ret = i2c_transfer(adv7511->i2c_edid->adapter, xfer,
+					   ARRAY_SIZE(xfer));
+			if (ret < 0)
+				return ret;
+			else if (ret != 2)
+				return -EIO;
+
+			xfer[1].buf += 64;
+			offset += 64;
+		}
+
+		adv7511->current_edid_segment = block / 2;
+	}
+
+	if (block % 2 == 0)
+		memcpy(buf, adv7511->edid_buf, len);
+	else
+		memcpy(buf, adv7511->edid_buf + 128, len);
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * ADV75xx helpers
+ */
+static int adv7511_get_modes(struct adv7511 *adv7511,
+		struct drm_connector *connector)
+{
+	struct edid *edid;
+	unsigned int count;
+
+	/* Reading the EDID only works if the device is powered */
+	if (!adv7511->powered) {
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
+				   ADV7511_REG_POWER2_HDP_SRC_MASK,
+				   ADV7511_REG_POWER2_HDP_SRC_NONE);
+		regmap_write(adv7511->regmap, ADV7511_REG_INT(0),
+			     ADV7511_INT0_EDID_READY);
+		regmap_write(adv7511->regmap, ADV7511_REG_INT(1),
+			     ADV7511_INT1_DDC_ERROR);
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER,
+				   ADV7511_POWER_POWER_DOWN, 0);
+		adv7511->current_edid_segment = -1;
+		/* wait some time for edid is ready */
+		msleep(200);
+	}
+
+	edid = drm_do_get_edid(connector, adv7511_get_edid_block, adv7511);
+
+	if (!adv7511->powered)
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER,
+				   ADV7511_POWER_POWER_DOWN,
+				   ADV7511_POWER_POWER_DOWN);
+
+	kfree(adv7511->edid);
+	adv7511->edid = edid;
+	if (!edid)
+		return 0;
+
+	drm_mode_connector_update_edid_property(connector, edid);
+	count = drm_add_edid_modes(connector, edid);
+
+	adv7511_set_config_csc(adv7511, connector, adv7511->rgb);
+
+	return count;
+}
+
+static enum drm_connector_status
+adv7511_detect(struct adv7511 *adv7511,
+		       struct drm_connector *connector)
+{
+	enum drm_connector_status status;
+	unsigned int val;
+#if HPD_ENABLE
+	bool hpd;
+#endif
+	int ret;
+
+	ret = regmap_read(adv7511->regmap, ADV7511_REG_STATUS, &val);
+	if (ret < 0)
+		return connector_status_disconnected;
+
+	if (val & ADV7511_STATUS_HPD)
+		status = connector_status_connected;
+	else
+		status = connector_status_disconnected;
+
+#if HPD_ENABLE
+	hpd = adv7511_hpd(adv7511);
+
+	/* The chip resets itself when the cable is disconnected, so in case
+	 * there is a pending HPD interrupt and the cable is connected there was
+	 * at least one transition from disconnected to connected and the chip
+	 * has to be reinitialized. */
+	if (status == connector_status_connected && hpd && adv7511->powered) {
+		regcache_mark_dirty(adv7511->regmap);
+		adv7511_power_on(adv7511);
+		adv7511_get_modes(adv7511, connector);
+		if (adv7511->status == connector_status_connected)
+			status = connector_status_disconnected;
+	} else {
+		/* Renable HDP sensing */
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
+				   ADV7511_REG_POWER2_HDP_SRC_MASK,
+				   ADV7511_REG_POWER2_HDP_SRC_BOTH);
+	}
+#endif
+
+	adv7511->status = status;
+	return status;
+}
+
+static int adv7511_mode_valid(struct adv7511 *adv7511,
+				     struct drm_display_mode *mode)
+{
+	if (mode->clock > 165000)
+		return MODE_CLOCK_HIGH;
+	/*
+	 * some work well modes which want to put in the front of the mode list.
+	 */
+	printk("Checking mode %ix%i@%i clock: %i...",
+		  mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode), mode->clock);
+	if ((mode->hdisplay == 1920 && mode->vdisplay == 1080 && mode->clock == 148500) ||
+	    (mode->hdisplay == 1280 && mode->vdisplay == 800 && mode->clock == 83496) ||
+	    (mode->hdisplay == 1280 && mode->vdisplay == 720 && mode->clock == 74440) ||
+	    (mode->hdisplay == 1280 && mode->vdisplay == 720 && mode->clock == 74250) ||
+	    (mode->hdisplay == 1024 && mode->vdisplay == 768 && mode->clock == 75000) ||
+	    (mode->hdisplay == 1024 && mode->vdisplay == 768 && mode->clock == 81833) ||
+	    (mode->hdisplay == 800 && mode->vdisplay == 600 && mode->clock == 40000)) {
+		mode->type |= DRM_MODE_TYPE_PREFERRED;
+		printk("OK\n");
+		return MODE_OK;
+	}
+	printk("BAD\n");
+	return MODE_BAD;
+}
+
+static void adv7511_mode_set(struct adv7511 *adv7511,
+				     struct drm_display_mode *mode,
+				     struct drm_display_mode *adj_mode)
+{
+	unsigned int low_refresh_rate;
+	unsigned int hsync_polarity = 0;
+	unsigned int vsync_polarity = 0;
+
+	if (adv7511->embedded_sync) {
+		unsigned int hsync_offset, hsync_len;
+		unsigned int vsync_offset, vsync_len;
+
+		hsync_offset = adj_mode->crtc_hsync_start -
+			       adj_mode->crtc_hdisplay;
+		vsync_offset = adj_mode->crtc_vsync_start -
+			       adj_mode->crtc_vdisplay;
+		hsync_len = adj_mode->crtc_hsync_end -
+			    adj_mode->crtc_hsync_start;
+		vsync_len = adj_mode->crtc_vsync_end -
+			    adj_mode->crtc_vsync_start;
+
+		/* The hardware vsync generator has a off-by-one bug */
+		vsync_offset += 1;
+
+		regmap_write(adv7511->regmap, ADV7511_REG_HSYNC_PLACEMENT_MSB,
+			     ((hsync_offset >> 10) & 0x7) << 5);
+		regmap_write(adv7511->regmap, ADV7511_REG_SYNC_DECODER(0),
+			     (hsync_offset >> 2) & 0xff);
+		regmap_write(adv7511->regmap, ADV7511_REG_SYNC_DECODER(1),
+			     ((hsync_offset & 0x3) << 6) |
+			     ((hsync_len >> 4) & 0x3f));
+		regmap_write(adv7511->regmap, ADV7511_REG_SYNC_DECODER(2),
+			     ((hsync_len & 0xf) << 4) |
+			     ((vsync_offset >> 6) & 0xf));
+		regmap_write(adv7511->regmap, ADV7511_REG_SYNC_DECODER(3),
+			     ((vsync_offset & 0x3f) << 2) |
+			     ((vsync_len >> 8) & 0x3));
+		regmap_write(adv7511->regmap, ADV7511_REG_SYNC_DECODER(4),
+			     vsync_len & 0xff);
+
+		hsync_polarity = !(adj_mode->flags & DRM_MODE_FLAG_PHSYNC);
+		vsync_polarity = !(adj_mode->flags & DRM_MODE_FLAG_PVSYNC);
+	} else {
+		enum adv7511_sync_polarity mode_hsync_polarity;
+		enum adv7511_sync_polarity mode_vsync_polarity;
+
+		/**
+		 * If the input signal is always low or always high we want to
+		 * invert or let it passthrough depending on the polarity of the
+		 * current mode.
+		 **/
+		if (adj_mode->flags & DRM_MODE_FLAG_NHSYNC)
+			mode_hsync_polarity = ADV7511_SYNC_POLARITY_LOW;
+		else
+			mode_hsync_polarity = ADV7511_SYNC_POLARITY_HIGH;
+
+		if (adj_mode->flags & DRM_MODE_FLAG_NVSYNC)
+			mode_vsync_polarity = ADV7511_SYNC_POLARITY_LOW;
+		else
+			mode_vsync_polarity = ADV7511_SYNC_POLARITY_HIGH;
+
+		if (adv7511->hsync_polarity != mode_hsync_polarity &&
+		    adv7511->hsync_polarity !=
+		    ADV7511_SYNC_POLARITY_PASSTHROUGH)
+			hsync_polarity = 1;
+
+		if (adv7511->vsync_polarity != mode_vsync_polarity &&
+		    adv7511->vsync_polarity !=
+		    ADV7511_SYNC_POLARITY_PASSTHROUGH)
+			vsync_polarity = 1;
+	}
+
+	if (mode->vrefresh <= 24000)
+		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_24HZ;
+	else if (mode->vrefresh <= 25000)
+		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_25HZ;
+	else if (mode->vrefresh <= 30000)
+		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_30HZ;
+	else
+		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
+
+	regmap_update_bits(adv7511->regmap, 0xfb,
+		0x6, low_refresh_rate << 1);
+	regmap_update_bits(adv7511->regmap, 0x17,
+		0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
+
+	if (adv7511->type == ADV7533 && adv7511->num_dsi_lanes == 4) {
+		struct mipi_dsi_device *dsi = adv7511->dsi;
+		int lanes, ret;
+
+		if (adj_mode->clock > 80000)
+			lanes = 4;
+		else
+			lanes = 3;
+
+		if (lanes != dsi->lanes) {
+			mipi_dsi_detach(dsi);
+			dsi->lanes = lanes;
+			ret = mipi_dsi_attach(dsi);
+			if (ret) {
+				DRM_ERROR("Failed to change host lanes\n");
+				return;
+			}
+		}
+	}
+
+	drm_mode_copy(&adv7511->curr_mode, adj_mode);
+
+	/*
+	 * TODO Test first order 4:2:2 to 4:4:4 up conversion method, which is
+	 * supposed to give better results.
+	 */
+
+	adv7511->f_tmds = mode->clock;
+}
+
+/* -----------------------------------------------------------------------------
+ * Encoder operations
+ */
+
+static int adv7511_encoder_get_modes(struct drm_encoder *encoder,
+			     struct drm_connector *connector)
+{
+	struct adv7511 *adv7511 = encoder_to_adv7511(encoder);
+
+	return adv7511_get_modes(adv7511, connector);
+}
+
+static void adv7511_encoder_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct adv7511 *adv7511 = encoder_to_adv7511(encoder);
+
+	if (mode == DRM_MODE_DPMS_ON)
+		adv7511_power_on(adv7511);
+	else
+		adv7511_power_off(adv7511);
+}
+
+static enum drm_connector_status
+adv7511_encoder_detect(struct drm_encoder *encoder,
+		       struct drm_connector *connector)
+{
+	struct adv7511 *adv7511 = encoder_to_adv7511(encoder);
+
+	return adv7511_detect(adv7511, connector);
+}
+
+static int adv7511_encoder_mode_valid(struct drm_encoder *encoder,
+				      struct drm_display_mode *mode)
+{
+	struct adv7511 *adv7511 = encoder_to_adv7511(encoder);
+
+	return adv7511_mode_valid(adv7511, mode);
+}
+
+static void adv7511_encoder_mode_set(struct drm_encoder *encoder,
+				     struct drm_display_mode *mode,
+				     struct drm_display_mode *adj_mode)
+{
+	struct adv7511 *adv7511 = encoder_to_adv7511(encoder);
+
+	adv7511_mode_set(adv7511, mode, adj_mode);
+}
+
+static struct drm_encoder_slave_funcs adv7511_encoder_funcs = {
+	.dpms = adv7511_encoder_dpms,
+	.mode_valid = adv7511_encoder_mode_valid,
+	.mode_set = adv7511_encoder_mode_set,
+	.detect = adv7511_encoder_detect,
+	.get_modes = adv7511_encoder_get_modes,
+};
+
+/* -----------------------------------------------------------------------------
+ * Bridge and connector functions
+ */
+
+static struct adv7511 *connector_to_adv7511(struct drm_connector *connector)
+{
+	return container_of(connector, struct adv7511, connector);
+}
+
+/* Connector helper functions */
+static int adv7533_connector_get_modes(struct drm_connector *connector)
+{
+	struct adv7511 *adv = connector_to_adv7511(connector);
+
+	return adv7511_get_modes(adv, connector);
+}
+
+static struct drm_encoder *
+adv7533_connector_best_encoder(struct drm_connector *connector)
+{
+	struct adv7511 *adv = connector_to_adv7511(connector);
+
+	return adv->bridge.encoder;
+}
+
+static enum drm_mode_status
+adv7533_connector_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	struct adv7511 *adv = connector_to_adv7511(connector);
+
+	return adv7511_mode_valid(adv, mode);
+}
+
+static struct drm_connector_helper_funcs adv7533_connector_helper_funcs = {
+	.get_modes = adv7533_connector_get_modes,
+	.best_encoder = adv7533_connector_best_encoder,
+	.mode_valid = adv7533_connector_mode_valid,
+};
+
+static enum drm_connector_status
+adv7533_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct adv7511 *adv = connector_to_adv7511(connector);
+
+	return adv7511_detect(adv, connector);
+}
+
+static struct drm_connector_funcs adv7533_connector_funcs = {
+	.dpms = drm_atomic_helper_connector_dpms,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = adv7533_connector_detect,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+/* Bridge funcs */
+static struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct adv7511, bridge);
+}
+
+static void adv7533_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	adv7511_power_on(adv);
+}
+
+static void adv7533_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+#if HPD_ENABLE
+	if (!adv->powered)
+		return;
+#endif
+
+	adv7511_power_off(adv);
+}
+
+static void adv7533_bridge_enable(struct drm_bridge *bridge)
+{
+}
+
+static void adv7533_bridge_disable(struct drm_bridge *bridge)
+{
+}
+
+static void adv7533_bridge_mode_set(struct drm_bridge *bridge,
+				     struct drm_display_mode *mode,
+				     struct drm_display_mode *adj_mode)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	adv7511_mode_set(adv, mode, adj_mode);
+}
+
+static int adv7533_attach_dsi(struct adv7511 *adv7511)
+{
+	struct device *dev = &adv7511->i2c_main->dev;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
+	int ret;
+	const struct mipi_dsi_device_info info = { .type = "adv7533",
+					   .channel = 0,
+					   .node = NULL,
+					 };
+
+	host = of_find_mipi_dsi_host_by_node(adv7511->host_node);
+	if (!host) {
+		dev_err(dev, "failed to find dsi host\n");
+		return -EPROBE_DEFER;
+	}
+
+	dsi = mipi_dsi_device_register_full(host, &info);
+	if (IS_ERR(dsi)) {
+		dev_err(dev, "failed to create dummy dsi device\n");
+		ret = PTR_ERR(dsi);
+		goto err_dsi_device;
+	}
+
+	adv7511->dsi = dsi;
+
+	dsi->lanes = adv7511->num_dsi_lanes;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE
+			| MIPI_DSI_MODE_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "failed to attach dsi to host\n");
+		goto err_dsi_attach;
+	}
+
+	return 0;
+
+err_dsi_attach:
+	mipi_dsi_device_unregister(dsi);
+err_dsi_device:
+	return ret;
+}
+
+static int adv7533_bridge_attach(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+	int ret;
+
+	adv->encoder = bridge->encoder;
+
+	if (!bridge->encoder) {
+		DRM_ERROR("Parent encoder object not found");
+		return -ENODEV;
+	}
+
+#if HPD_ENABLE
+	adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
+#endif
+
+	ret = drm_connector_init(bridge->dev, &adv->connector,
+			&adv7533_connector_funcs, DRM_MODE_CONNECTOR_HDMIA);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector with drm\n");
+		return ret;
+	}
+	drm_connector_helper_add(&adv->connector,
+					&adv7533_connector_helper_funcs);
+	drm_mode_connector_attach_encoder(&adv->connector, adv->encoder);
+
+#if HPD_ENABLE
+	drm_helper_hpd_irq_event(adv->connector.dev);
+#endif
+
+	adv7533_attach_dsi(adv);
+
+	return ret;
+}
+
+static struct drm_bridge_funcs adv7533_bridge_funcs = {
+	.pre_enable = adv7533_bridge_pre_enable,
+	.enable = adv7533_bridge_enable,
+	.disable = adv7533_bridge_disable,
+	.post_disable = adv7533_bridge_post_disable,
+	.mode_set = adv7533_bridge_mode_set,
+	.attach = adv7533_bridge_attach,
+};
+
+/* =========================================================*/
+static int adv7533_init_regulators(struct adv7511 *adv75xx, struct device *dev)
+{
+	int ret;
+
+	adv75xx->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(adv75xx->vdd)) {
+		ret = PTR_ERR(adv75xx->vdd);
+		dev_err(dev, "failed to get vdd regulator %d\n", ret);
+		return ret;
+	}
+
+	adv75xx->v1p2 = devm_regulator_get(dev, "v1p2");
+	if (IS_ERR(adv75xx->v1p2)) {
+		ret = PTR_ERR(adv75xx->v1p2);
+		dev_err(dev, "failed to get v1p2 regulator %d\n", ret);
+		//return ret;
+	}
+
+	ret = regulator_set_voltage(adv75xx->vdd, 1800000, 1800000);
+	//ret = regulator_set_voltage(adv75xx->vdd, 1500000, 1500000);
+	//ret = regulator_set_voltage(adv75xx->vdd, 2000000, 2000000);
+	if (ret) {
+		dev_err(dev, "failed to set avdd voltage %d\n", ret);
+		return ret;
+	}
+
+
+	DRM_INFO(" adv75xx->vdd = %d \n", regulator_get_voltage(adv75xx->vdd));
+	//ret = regulator_set_voltage(adv75xx->v1p2, 1200000, 1200000);
+	if (ret) {
+		dev_err(dev, "failed to set v1p2 voltage %d\n", ret);
+		//return ret;
+	}
+
+	/* keep the regulators always on */
+	ret = regulator_enable(adv75xx->vdd);
+	if (ret) {
+		dev_err(dev, "failed to enable vdd %d\n", ret);
+		return ret;
+	}
+
+	//ret = regulator_enable(adv75xx->v1p2);
+	if (ret) {
+		dev_err(dev, "failed to enable v1p2 %d\n", ret);
+		//return ret;
+	}
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Probe & remove
+ */
+
+static int adv7511_parse_dt(struct device_node *np,
+			    struct adv7511_link_config *config)
+{
+	const char *str;
+	int ret;
+
+	of_property_read_u32(np, "adi,input-depth", &config->input_color_depth);
+	if (config->input_color_depth != 8 && config->input_color_depth != 10 &&
+	    config->input_color_depth != 12)
+		return -EINVAL;
+
+	ret = of_property_read_string(np, "adi,input-colorspace", &str);
+	if (ret < 0)
+		return ret;
+
+	if (!strcmp(str, "rgb"))
+		config->input_colorspace = HDMI_COLORSPACE_RGB;
+	else if (!strcmp(str, "yuv422"))
+		config->input_colorspace = HDMI_COLORSPACE_YUV422;
+	else if (!strcmp(str, "yuv444"))
+		config->input_colorspace = HDMI_COLORSPACE_YUV444;
+	else
+		return -EINVAL;
+
+	ret = of_property_read_string(np, "adi,input-clock", &str);
+	if (ret < 0)
+		return ret;
+
+	if (!strcmp(str, "1x"))
+		config->input_clock = ADV7511_INPUT_CLOCK_1X;
+	else if (!strcmp(str, "2x"))
+		config->input_clock = ADV7511_INPUT_CLOCK_2X;
+	else if (!strcmp(str, "ddr"))
+		config->input_clock = ADV7511_INPUT_CLOCK_DDR;
+	else
+		return -EINVAL;
+
+	if (config->input_colorspace == HDMI_COLORSPACE_YUV422 ||
+	    config->input_clock != ADV7511_INPUT_CLOCK_1X) {
+		ret = of_property_read_u32(np, "adi,input-style",
+					   &config->input_style);
+		if (ret)
+			return ret;
+
+		if (config->input_style < 1 || config->input_style > 3)
+			return -EINVAL;
+
+		ret = of_property_read_string(np, "adi,input-justification",
+					      &str);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(str, "left"))
+			config->input_justification =
+				ADV7511_INPUT_JUSTIFICATION_LEFT;
+		else if (!strcmp(str, "evenly"))
+			config->input_justification =
+				ADV7511_INPUT_JUSTIFICATION_EVENLY;
+		else if (!strcmp(str, "right"))
+			config->input_justification =
+				ADV7511_INPUT_JUSTIFICATION_RIGHT;
+		else
+			return -EINVAL;
+
+	} else {
+		config->input_style = 1;
+		config->input_justification = ADV7511_INPUT_JUSTIFICATION_LEFT;
+	}
+
+	of_property_read_u32(np, "adi,clock-delay", &config->clock_delay);
+	if (config->clock_delay < -1200 || config->clock_delay > 1600)
+		return -EINVAL;
+
+	config->embedded_sync = of_property_read_bool(np, "adi,embedded-sync");
+
+	/* Hardcode the sync pulse configurations for now. */
+	config->sync_pulse = ADV7511_INPUT_SYNC_PULSE_NONE;
+	config->vsync_polarity = ADV7511_SYNC_POLARITY_PASSTHROUGH;
+	config->hsync_polarity = ADV7511_SYNC_POLARITY_PASSTHROUGH;
+
+	return 0;
+}
+
+static int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv7511)
+{
+	u32 num_lanes;
+	struct device_node *endpoint;
+
+	of_property_read_u32(np, "adi,dsi-lanes", &num_lanes);
+
+	if (num_lanes < 1 || num_lanes > 4)
+		return -EINVAL;
+
+	adv7511->num_dsi_lanes = num_lanes;
+
+	endpoint = of_graph_get_next_endpoint(np, NULL);
+	if (!endpoint) {
+		DRM_ERROR("adv dsi input endpoint not found\n");
+		return -ENODEV;
+	}
+
+	adv7511->host_node = of_graph_get_remote_port_parent(endpoint);
+	if (!adv7511->host_node) {
+		DRM_ERROR("dsi host node not found\n");
+		of_node_put(endpoint);
+		return -ENODEV;
+	}
+
+	of_node_put(endpoint);
+	of_node_put(adv7511->host_node);
+
+	/* TODO: Check if these need to be parsed by DT or not */
+	adv7511->rgb = true;
+	adv7511->embedded_sync = false;
+
+	return 0;
+}
+
+static const int edid_i2c_addr = 0x7e;
+static const int packet_i2c_addr = 0x70;
+static const int cec_i2c_addr = 0x78;
+
+static const struct of_device_id adv7511_of_ids[] = {
+	{ .compatible = "adi,adv7511", .data = (void *) ADV7511 },
+	{ .compatible = "adi,adv7511w", .data = (void *) ADV7511 },
+	{ .compatible = "adi,adv7513", .data = (void *) ADV7511 },
+	{ .compatible = "adi,adv7533", .data = (void *) ADV7533 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adv7511_of_ids);
+
+static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
+{
+	struct adv7511_link_config link_config;
+	struct adv7511 *adv7511;
+	struct device *dev = &i2c->dev;
+	unsigned int val;
+	int ret;
+
+	if (!dev->of_node)
+		return -EINVAL;
+
+	adv7511 = devm_kzalloc(dev, sizeof(*adv7511), GFP_KERNEL);
+	if (!adv7511)
+		return -ENOMEM;
+
+	adv7511->powered = false;
+	adv7511->status = connector_status_disconnected;
+
+	if (dev->of_node) {
+		const struct of_device_id *of_id;
+
+		of_id = of_match_node(adv7511_of_ids, dev->of_node);
+		adv7511->type = (enum adv7511_type) of_id->data;
+	} else {
+		adv7511->type = id->driver_data;
+	}
+
+	DRM_INFO("adv match_node ok \n");
+	memset(&link_config, 0, sizeof(link_config));
+
+	if (adv7511->type == ADV7511)
+		ret = adv7511_parse_dt(dev->of_node, &link_config);
+	else
+		ret = adv7533_parse_dt(dev->of_node, adv7511);
+	if (ret)
+		return ret;
+
+	DRM_INFO("adv parse_dt ok , adv7511->type = %d <0--ADV7511, 1--ADV7533>\n", adv7511->type);
+
+	if (adv7511->type == ADV7533) {
+		ret = adv7533_init_regulators(adv7511, dev); // adv7533 vdd--1.8v  v1p2--1.2v
+		if (ret)
+			return ret;
+	}
+	DRM_INFO("adv7533_init_regulators ok \n");
+	/*
+	 * The power down GPIO is optional. If present, toggle it from active to
+	 * inactive to wake up the encoder.
+	 */
+	adv7511->gpio_pd = devm_gpiod_get_optional(dev, "pd", GPIOD_OUT_HIGH);
+	if (IS_ERR(adv7511->gpio_pd))
+		return PTR_ERR(adv7511->gpio_pd);
+
+	if (adv7511->gpio_pd) {
+		mdelay(5);
+		gpiod_set_value_cansleep(adv7511->gpio_pd, 0);
+	}
+
+	DRM_INFO("adv get gpio_pd ok \n");
+
+	adv7511->regmap = devm_regmap_init_i2c(i2c, &adv7511_regmap_config);
+	if (IS_ERR(adv7511->regmap))
+		return PTR_ERR(adv7511->regmap);
+
+	DRM_INFO("adv devm_regmap_init_i2c ok \n");
+	ret = regmap_read(adv7511->regmap, ADV7511_REG_CHIP_REVISION, &val);
+	if (ret)
+		return ret;
+	dev_dbg(dev, "Rev. %d\n", val);
+	DRM_INFO("regmap_read ok, regmap_read Rev.= %d \n", val);
+
+	if (adv7511->type == ADV7511) {
+		ret = regmap_register_patch(adv7511->regmap,
+				adv7511_fixed_registers,
+				ARRAY_SIZE(adv7511_fixed_registers));
+		if (ret)
+			return ret;
+	} else {
+		ret = regmap_register_patch(adv7511->regmap,
+				adv7533_fixed_registers,
+				ARRAY_SIZE(adv7533_fixed_registers));
+		if (ret)
+			return ret;
+	}
+
+	regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR, edid_i2c_addr);
+	regmap_write(adv7511->regmap, ADV7511_REG_PACKET_I2C_ADDR,
+		     packet_i2c_addr);
+	regmap_write(adv7511->regmap, ADV7511_REG_CEC_I2C_ADDR, cec_i2c_addr);
+	adv7511_packet_disable(adv7511, 0xffff);
+
+	adv7511->i2c_main = i2c;
+
+	adv7511->i2c_packet = i2c_new_dummy(i2c->adapter, packet_i2c_addr >> 1);
+	if (!adv7511->i2c_packet)
+		return -ENOMEM;
+
+	adv7511->i2c_edid = i2c_new_dummy(i2c->adapter, edid_i2c_addr >> 1);
+	if (!adv7511->i2c_edid)
+		goto err_i2c_unregister_packet;
+
+	adv7511->i2c_cec = i2c_new_dummy(i2c->adapter, cec_i2c_addr >> 1);
+	if (!adv7511->i2c_cec) {
+		ret = -ENOMEM;
+		goto err_i2c_unregister_edid;
+	}
+
+	adv7511->regmap_cec = devm_regmap_init_i2c(adv7511->i2c_cec,
+					&adv7533_cec_regmap_config);
+	if (IS_ERR(adv7511->regmap_cec)) {
+		ret = PTR_ERR(adv7511->regmap_cec);
+		goto err_i2c_unregister_cec;
+	}
+
+	adv7511->regmap_packet = devm_regmap_init_i2c(adv7511->i2c_packet,
+		&adv7533_packet_regmap_config);
+	if (IS_ERR(adv7511->regmap_packet)) {
+		ret = PTR_ERR(adv7511->regmap_packet);
+		goto err_i2c_unregister_cec;
+	}
+
+	if (adv7511->type == ADV7533) {
+		ret = regmap_register_patch(adv7511->regmap_cec,
+				adv7533_cec_fixed_registers,
+				ARRAY_SIZE(adv7533_cec_fixed_registers));
+		if (ret)
+			return ret;
+	}
+
+	if (i2c->irq) {
+		init_waitqueue_head(&adv7511->wq);
+
+		ret = devm_request_threaded_irq(dev, i2c->irq, NULL,
+						adv7511_irq_handler,
+						IRQF_ONESHOT, dev_name(dev),
+						adv7511);
+		if (ret)
+			goto err_i2c_unregister_cec;
+	}
+
+	/* CEC is unused for now */
+	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
+		     ADV7511_CEC_CTRL_POWER_DOWN);
+
+	adv7511_power_off(adv7511);
+
+	i2c_set_clientdata(i2c, adv7511);
+
+	if (adv7511->type == ADV7511)
+		adv7511_set_link_config(adv7511, &link_config);
+
+	if (adv7511->type == ADV7533) {
+		adv7511->bridge.funcs = &adv7533_bridge_funcs;
+		adv7511->bridge.of_node = dev->of_node;
+
+		ret = drm_bridge_add(&adv7511->bridge);
+		if (ret) {
+			dev_err(dev, "failed to add adv7533 bridge\n");
+			goto err_i2c_unregister_cec;
+		}
+	}
+#ifdef CONFIG_HDMI_ADV7511_AUDIO
+	adv7511_audio_init(dev);
+#endif
+	return 0;
+
+err_i2c_unregister_cec:
+	i2c_unregister_device(adv7511->i2c_cec);
+err_i2c_unregister_edid:
+	i2c_unregister_device(adv7511->i2c_edid);
+err_i2c_unregister_packet:
+	i2c_unregister_device(adv7511->i2c_packet);
+
+	return ret;
+}
+
+static int adv7511_remove(struct i2c_client *i2c)
+{
+	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
+
+	//adv7511_audio_exit(&i2c->dev);
+	i2c_unregister_device(adv7511->i2c_cec);
+	i2c_unregister_device(adv7511->i2c_edid);
+
+	kfree(adv7511->edid);
+
+	if (adv7511->type == ADV7533) {
+		mipi_dsi_detach(adv7511->dsi);
+		//mipi_dsi_unregister_device(adv7511->dsi);
+		drm_bridge_remove(&adv7511->bridge);
+	}
+
+	return 0;
+}
+
+static int adv7511_encoder_init(struct i2c_client *i2c, struct drm_device *dev,
+				struct drm_encoder_slave *encoder)
+{
+
+	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
+
+	if (adv7511->type == ADV7533)
+		return -ENODEV;
+
+	encoder->slave_priv = adv7511;
+	encoder->slave_funcs = &adv7511_encoder_funcs;
+
+	adv7511->encoder = &encoder->base;
+
+	return 0;
+}
+
+static const struct i2c_device_id adv7511_i2c_ids[] = {
+	{ "adv7511", ADV7511 },
+	{ "adv7511w", ADV7511 },
+	{ "adv7513", ADV7511 },
+	{ "adv7533", ADV7533 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, adv7511_i2c_ids);
+
+static struct drm_i2c_encoder_driver adv7511_driver = {
+	.i2c_driver = {
+		.driver = {
+			.name = "adv7511",
+			.of_match_table = adv7511_of_ids,
+		},
+		.id_table = adv7511_i2c_ids,
+		.probe = adv7511_probe,
+		.remove = adv7511_remove,
+	},
+
+	.encoder_init = adv7511_encoder_init,
+};
+
+static int __init adv7511_init(void)
+{
+	return drm_i2c_encoder_register(THIS_MODULE, &adv7511_driver);
+}
+module_init(adv7511_init);
+
+static void __exit adv7511_exit(void)
+{
+	drm_i2c_encoder_unregister(&adv7511_driver);
+}
+module_exit(adv7511_exit);
+
+MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
+MODULE_DESCRIPTION("ADV7511 HDMI transmitter driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/staging/hikey9xx/gpu/hdmi/adv7535.h b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.h
new file mode 100644
index 000000000000..b37748c065a7
--- /dev/null
+++ b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.h
@@ -0,0 +1,351 @@
+/*
+ * Analog Devices ADV7511 HDMI transmitter driver
+ *
+ * Copyright 2012 Analog Devices Inc.
+ *
+ * Licensed under the GPL-2.
+ */
+
+#ifndef __DRM_I2C_ADV7511_H__
+#define __DRM_I2C_ADV7511_H__
+
+#include <linux/hdmi.h>
+#include <drm/drm_crtc_helper.h>
+
+struct regmap;
+struct adv7511;
+
+int adv7511_packet_enable(struct adv7511 *adv7511, unsigned int packet);
+int adv7511_packet_disable(struct adv7511 *adv7511, unsigned int packet);
+
+int adv7511_audio_init(struct device *dev);
+void adv7511_audio_exit(struct device *dev);
+
+#define ADV7511_REG_CHIP_REVISION		0x00
+#define ADV7511_REG_N0				0x01
+#define ADV7511_REG_N1				0x02
+#define ADV7511_REG_N2				0x03
+#define ADV7511_REG_SPDIF_FREQ			0x04
+#define ADV7511_REG_CTS_AUTOMATIC1		0x05
+#define ADV7511_REG_CTS_AUTOMATIC2		0x06
+#define ADV7511_REG_CTS_MANUAL0			0x07
+#define ADV7511_REG_CTS_MANUAL1			0x08
+#define ADV7511_REG_CTS_MANUAL2			0x09
+#define ADV7511_REG_AUDIO_SOURCE		0x0a
+#define ADV7511_REG_AUDIO_CONFIG		0x0b
+#define ADV7511_REG_I2S_CONFIG			0x0c
+#define ADV7511_REG_I2S_WIDTH			0x0d
+#define ADV7511_REG_AUDIO_SUB_SRC0		0x0e
+#define ADV7511_REG_AUDIO_SUB_SRC1		0x0f
+#define ADV7511_REG_AUDIO_SUB_SRC2		0x10
+#define ADV7511_REG_AUDIO_SUB_SRC3		0x11
+#define ADV7511_REG_AUDIO_CFG1			0x12
+#define ADV7511_REG_AUDIO_CFG2			0x13
+#define ADV7511_REG_AUDIO_CFG3			0x14
+#define ADV7511_REG_I2C_FREQ_ID_CFG		0x15
+#define ADV7511_REG_VIDEO_INPUT_CFG1		0x16
+#define ADV7511_REG_CSC_UPPER(x)		(0x18 + (x) * 2)
+#define ADV7511_REG_CSC_LOWER(x)		(0x19 + (x) * 2)
+#define ADV7511_REG_SYNC_DECODER(x)		(0x30 + (x))
+#define ADV7511_REG_DE_GENERATOR		(0x35 + (x))
+#define ADV7511_REG_PIXEL_REPETITION		0x3b
+#define ADV7511_REG_VIC_MANUAL			0x3c
+#define ADV7511_REG_VIC_SEND			0x3d
+#define ADV7511_REG_VIC_DETECTED		0x3e
+#define ADV7511_REG_AUX_VIC_DETECTED		0x3f
+#define ADV7511_REG_PACKET_ENABLE0		0x40
+#define ADV7511_REG_POWER			0x41
+#define ADV7511_REG_STATUS			0x42
+#define ADV7511_REG_EDID_I2C_ADDR		0x43
+#define ADV7511_REG_PACKET_ENABLE1		0x44
+#define ADV7511_REG_PACKET_I2C_ADDR		0x45
+#define ADV7511_REG_DSD_ENABLE			0x46
+#define ADV7511_REG_VIDEO_INPUT_CFG2		0x48
+#define ADV7511_REG_INFOFRAME_UPDATE		0x4a
+#define ADV7511_REG_GC(x)			(0x4b + (x)) /* 0x4b - 0x51 */
+#define ADV7511_REG_AVI_INFOFRAME_VERSION	0x52
+#define ADV7511_REG_AVI_INFOFRAME_LENGTH	0x53
+#define ADV7511_REG_AVI_INFOFRAME_CHECKSUM	0x54
+#define ADV7511_REG_AVI_INFOFRAME(x)		(0x55 + (x)) /* 0x55 - 0x6f */
+#define ADV7511_REG_AUDIO_INFOFRAME_VERSION	0x70
+#define ADV7511_REG_AUDIO_INFOFRAME_LENGTH	0x71
+#define ADV7511_REG_AUDIO_INFOFRAME_CHECKSUM	0x72
+#define ADV7511_REG_AUDIO_INFOFRAME(x)		(0x73 + (x)) /* 0x73 - 0x7c */
+#define ADV7511_REG_INT_ENABLE(x)		(0x94 + (x))
+#define ADV7511_REG_INT(x)			(0x96 + (x))
+#define ADV7511_REG_INPUT_CLK_DIV		0x9d
+#define ADV7511_REG_PLL_STATUS			0x9e
+#define ADV7511_REG_HDMI_POWER			0xa1
+#define ADV7511_REG_HDCP_HDMI_CFG		0xaf
+#define ADV7511_REG_AN(x)			(0xb0 + (x)) /* 0xb0 - 0xb7 */
+#define ADV7511_REG_HDCP_STATUS			0xb8
+#define ADV7511_REG_BCAPS			0xbe
+#define ADV7511_REG_BKSV(x)			(0xc0 + (x)) /* 0xc0 - 0xc3 */
+#define ADV7511_REG_EDID_SEGMENT		0xc4
+#define ADV7511_REG_DDC_STATUS			0xc8
+#define ADV7511_REG_EDID_READ_CTRL		0xc9
+#define ADV7511_REG_BSTATUS(x)			(0xca + (x)) /* 0xca - 0xcb */
+#define ADV7511_REG_TIMING_GEN_SEQ		0xd0
+#define ADV7511_REG_POWER2			0xd6
+#define ADV7511_REG_HSYNC_PLACEMENT_MSB		0xfa
+
+#define ADV7511_REG_SYNC_ADJUSTMENT(x)		(0xd7 + (x)) /* 0xd7 - 0xdc */
+#define ADV7511_REG_TMDS_CLOCK_INV		0xde
+#define ADV7511_REG_ARC_CTRL			0xdf
+#define ADV7511_REG_CEC_I2C_ADDR		0xe1
+#define ADV7511_REG_CEC_CTRL			0xe2
+#define ADV7511_REG_CHIP_ID_HIGH		0xf5
+#define ADV7511_REG_CHIP_ID_LOW			0xf6
+
+#define ADV7511_CSC_ENABLE			BIT(7)
+#define ADV7511_CSC_UPDATE_MODE			BIT(5)
+
+#define ADV7511_INT0_HDP			BIT(7)
+#define ADV7511_INT0_VSYNC			BIT(5)
+#define ADV7511_INT0_AUDIO_FIFO_FULL		BIT(4)
+#define ADV7511_INT0_EDID_READY			BIT(2)
+#define ADV7511_INT0_HDCP_AUTHENTICATED		BIT(1)
+
+#define ADV7511_INT1_DDC_ERROR			BIT(7)
+#define ADV7511_INT1_BKSV			BIT(6)
+#define ADV7511_INT1_CEC_TX_READY		BIT(5)
+#define ADV7511_INT1_CEC_TX_ARBIT_LOST		BIT(4)
+#define ADV7511_INT1_CEC_TX_RETRY_TIMEOUT	BIT(3)
+#define ADV7511_INT1_CEC_RX_READY3		BIT(2)
+#define ADV7511_INT1_CEC_RX_READY2		BIT(1)
+#define ADV7511_INT1_CEC_RX_READY1		BIT(0)
+
+#define ADV7511_ARC_CTRL_POWER_DOWN		BIT(0)
+
+#define ADV7511_CEC_CTRL_POWER_DOWN		BIT(0)
+
+#define ADV7511_POWER_POWER_DOWN		BIT(6)
+
+#define ADV7511_HDMI_CFG_MODE_MASK		0x2
+#define ADV7511_HDMI_CFG_MODE_DVI		0x0
+#define ADV7511_HDMI_CFG_MODE_HDMI		0x2
+
+#define ADV7511_AUDIO_SELECT_I2C		0x0
+#define ADV7511_AUDIO_SELECT_SPDIF		0x1
+#define ADV7511_AUDIO_SELECT_DSD		0x2
+#define ADV7511_AUDIO_SELECT_HBR		0x3
+#define ADV7511_AUDIO_SELECT_DST		0x4
+
+#define ADV7511_I2S_SAMPLE_LEN_16		0x2
+#define ADV7511_I2S_SAMPLE_LEN_20		0x3
+#define ADV7511_I2S_SAMPLE_LEN_18		0x4
+#define ADV7511_I2S_SAMPLE_LEN_22		0x5
+#define ADV7511_I2S_SAMPLE_LEN_19		0x8
+#define ADV7511_I2S_SAMPLE_LEN_23		0x9
+#define ADV7511_I2S_SAMPLE_LEN_24		0xb
+#define ADV7511_I2S_SAMPLE_LEN_17		0xc
+#define ADV7511_I2S_SAMPLE_LEN_21		0xd
+
+#define ADV7511_SAMPLE_FREQ_44100		0x0
+#define ADV7511_SAMPLE_FREQ_48000		0x2
+#define ADV7511_SAMPLE_FREQ_32000		0x3
+#define ADV7511_SAMPLE_FREQ_88200		0x8
+#define ADV7511_SAMPLE_FREQ_96000		0xa
+#define ADV7511_SAMPLE_FREQ_176400		0xc
+#define ADV7511_SAMPLE_FREQ_192000		0xe
+
+#define ADV7511_STATUS_POWER_DOWN_POLARITY	BIT(7)
+#define ADV7511_STATUS_HPD			BIT(6)
+#define ADV7511_STATUS_MONITOR_SENSE		BIT(5)
+#define ADV7511_STATUS_I2S_32BIT_MODE		BIT(3)
+
+#define ADV7511_PACKET_ENABLE_N_CTS		BIT(8+6)
+#define ADV7511_PACKET_ENABLE_AUDIO_SAMPLE	BIT(8+5)
+#define ADV7511_PACKET_ENABLE_AVI_INFOFRAME	BIT(8+4)
+#define ADV7511_PACKET_ENABLE_AUDIO_INFOFRAME	BIT(8+3)
+#define ADV7511_PACKET_ENABLE_GC		BIT(7)
+#define ADV7511_PACKET_ENABLE_SPD		BIT(6)
+#define ADV7511_PACKET_ENABLE_MPEG		BIT(5)
+#define ADV7511_PACKET_ENABLE_ACP		BIT(4)
+#define ADV7511_PACKET_ENABLE_ISRC		BIT(3)
+#define ADV7511_PACKET_ENABLE_GM		BIT(2)
+#define ADV7511_PACKET_ENABLE_SPARE2		BIT(1)
+#define ADV7511_PACKET_ENABLE_SPARE1		BIT(0)
+
+#define ADV7511_REG_POWER2_HDP_SRC_MASK		0xc0
+#define ADV7511_REG_POWER2_HDP_SRC_BOTH		0x00
+#define ADV7511_REG_POWER2_HDP_SRC_HDP		0x40
+#define ADV7511_REG_POWER2_HDP_SRC_CEC		0x80
+#define ADV7511_REG_POWER2_HDP_SRC_NONE		0xc0
+#define ADV7511_REG_POWER2_TDMS_ENABLE		BIT(4)
+#define ADV7511_REG_POWER2_GATE_INPUT_CLK	BIT(0)
+
+#define ADV7511_LOW_REFRESH_RATE_NONE		0x0
+#define ADV7511_LOW_REFRESH_RATE_24HZ		0x1
+#define ADV7511_LOW_REFRESH_RATE_25HZ		0x2
+#define ADV7511_LOW_REFRESH_RATE_30HZ		0x3
+
+#define ADV7511_AUDIO_CFG3_LEN_MASK		0x0f
+#define ADV7511_I2C_FREQ_ID_CFG_RATE_MASK	0xf0
+
+#define ADV7511_AUDIO_SOURCE_I2S		0
+#define ADV7511_AUDIO_SOURCE_SPDIF		1
+
+#define ADV7511_I2S_FORMAT_I2S			0
+#define ADV7511_I2S_FORMAT_RIGHT_J		1
+#define ADV7511_I2S_FORMAT_LEFT_J		2
+
+#define ADV7511_PACKET(p, x)	    ((p) * 0x20 + (x))
+#define ADV7511_PACKET_SDP(x)	    ADV7511_PACKET(0, x)
+#define ADV7511_PACKET_MPEG(x)	    ADV7511_PACKET(1, x)
+#define ADV7511_PACKET_ACP(x)	    ADV7511_PACKET(2, x)
+#define ADV7511_PACKET_ISRC1(x)	    ADV7511_PACKET(3, x)
+#define ADV7511_PACKET_ISRC2(x)	    ADV7511_PACKET(4, x)
+#define ADV7511_PACKET_GM(x)	    ADV7511_PACKET(5, x)
+#define ADV7511_PACKET_SPARE(x)	    ADV7511_PACKET(6, x)
+
+enum adv7511_input_clock {
+	ADV7511_INPUT_CLOCK_1X,
+	ADV7511_INPUT_CLOCK_2X,
+	ADV7511_INPUT_CLOCK_DDR,
+};
+
+enum adv7511_input_justification {
+	ADV7511_INPUT_JUSTIFICATION_EVENLY = 0,
+	ADV7511_INPUT_JUSTIFICATION_RIGHT = 1,
+	ADV7511_INPUT_JUSTIFICATION_LEFT = 2,
+};
+
+enum adv7511_input_sync_pulse {
+	ADV7511_INPUT_SYNC_PULSE_DE = 0,
+	ADV7511_INPUT_SYNC_PULSE_HSYNC = 1,
+	ADV7511_INPUT_SYNC_PULSE_VSYNC = 2,
+	ADV7511_INPUT_SYNC_PULSE_NONE = 3,
+};
+
+/**
+ * enum adv7511_sync_polarity - Polarity for the input sync signals
+ * @ADV7511_SYNC_POLARITY_PASSTHROUGH:  Sync polarity matches that of
+ *				       the currently configured mode.
+ * @ADV7511_SYNC_POLARITY_LOW:	    Sync polarity is low
+ * @ADV7511_SYNC_POLARITY_HIGH:	    Sync polarity is high
+ *
+ * If the polarity is set to either LOW or HIGH the driver will configure the
+ * ADV7511 to internally invert the sync signal if required to match the sync
+ * polarity setting for the currently selected output mode.
+ *
+ * If the polarity is set to PASSTHROUGH, the ADV7511 will route the signal
+ * unchanged. This is used when the upstream graphics core already generates
+ * the sync signals with the correct polarity.
+ */
+enum adv7511_sync_polarity {
+	ADV7511_SYNC_POLARITY_PASSTHROUGH,
+	ADV7511_SYNC_POLARITY_LOW,
+	ADV7511_SYNC_POLARITY_HIGH,
+};
+
+enum adv7511_type {
+	ADV7511,
+	ADV7533,
+};
+
+struct adv7511 {
+	struct i2c_client *i2c_main;
+	struct i2c_client *i2c_edid;
+	struct i2c_client *i2c_cec;
+	struct i2c_client *i2c_packet;
+
+	struct regmap *regmap;
+	struct regmap *regmap_cec;
+	struct regmap *regmap_packet;
+	enum drm_connector_status status;
+	bool powered;
+	struct regulator *vdd;
+	struct regulator *v1p2;
+
+	struct drm_display_mode curr_mode;
+
+	unsigned int f_tmds;
+	unsigned int f_audio;
+	unsigned int audio_source;
+
+	unsigned int current_edid_segment;
+	uint8_t edid_buf[256];
+	bool edid_read;
+
+	wait_queue_head_t wq;
+	struct drm_encoder *encoder;
+
+	struct drm_connector connector;
+	struct drm_bridge bridge;
+
+	bool embedded_sync;
+	enum adv7511_sync_polarity vsync_polarity;
+	enum adv7511_sync_polarity hsync_polarity;
+	bool rgb;
+
+	struct edid *edid;
+
+	struct gpio_desc *gpio_pd;
+
+	/* ADV7533 DSI RX related params */
+	struct device_node *host_node;
+	struct mipi_dsi_device *dsi;
+	u8 num_dsi_lanes;
+
+	enum adv7511_type type;
+};
+
+/**
+ * struct adv7511_link_config - Describes adv7511 hardware configuration
+ * @input_color_depth:		Number of bits per color component (8, 10 or 12)
+ * @input_colorspace:		The input colorspace (RGB, YUV444, YUV422)
+ * @input_clock:		The input video clock style (1x, 2x, DDR)
+ * @input_style:		The input component arrangement variant
+ * @input_justification:	Video input format bit justification
+ * @clock_delay:		Clock delay for the input clock (in ps)
+ * @embedded_sync:		Video input uses BT.656-style embedded sync
+ * @sync_pulse:			Select the sync pulse
+ * @vsync_polarity:		vsync input signal configuration
+ * @hsync_polarity:		hsync input signal configuration
+ */
+struct adv7511_link_config {
+	unsigned int input_color_depth;
+	enum hdmi_colorspace input_colorspace;
+	enum adv7511_input_clock input_clock;
+	unsigned int input_style;
+	enum adv7511_input_justification input_justification;
+
+	int clock_delay;
+
+	bool embedded_sync;
+	enum adv7511_input_sync_pulse sync_pulse;
+	enum adv7511_sync_polarity vsync_polarity;
+	enum adv7511_sync_polarity hsync_polarity;
+};
+
+/**
+ * enum adv7511_csc_scaling - Scaling factor for the ADV7511 CSC
+ * @ADV7511_CSC_SCALING_1: CSC results are not scaled
+ * @ADV7511_CSC_SCALING_2: CSC results are scaled by a factor of two
+ * @ADV7511_CSC_SCALING_4: CSC results are scalled by a factor of four
+ */
+enum adv7511_csc_scaling {
+	ADV7511_CSC_SCALING_1 = 0,
+	ADV7511_CSC_SCALING_2 = 1,
+	ADV7511_CSC_SCALING_4 = 2,
+};
+
+/**
+ * struct adv7511_video_config - Describes adv7511 hardware configuration
+ * @csc_enable:			Whether to enable color space conversion
+ * @csc_scaling_factor:		Color space conversion scaling factor
+ * @csc_coefficents:		Color space conversion coefficents
+ * @hdmi_mode:			Whether to use HDMI or DVI output mode
+ * @avi_infoframe:		HDMI infoframe
+ */
+struct adv7511_video_config {
+	bool csc_enable;
+	enum adv7511_csc_scaling csc_scaling_factor;
+	const uint16_t *csc_coefficents;
+
+	bool hdmi_mode;
+	struct hdmi_avi_infoframe avi_infoframe;
+};
+
+#endif /* __DRM_I2C_ADV7511_H__ */
diff --git a/drivers/staging/hikey9xx/gpu/hdmi/adv7535_audio.c b/drivers/staging/hikey9xx/gpu/hdmi/adv7535_audio.c
new file mode 100644
index 000000000000..8357ce5f53c6
--- /dev/null
+++ b/drivers/staging/hikey9xx/gpu/hdmi/adv7535_audio.c
@@ -0,0 +1,313 @@
+/*
+ * Analog Devices ADV7511 HDMI transmitter driver
+ *
+ * Copyright 2012 Analog Devices Inc.
+ *
+ * Licensed under the GPL-2.
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/pm.h>
+#include <linux/i2c.h>
+#include <linux/spi/spi.h>
+#include <linux/slab.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+
+#include "adv7535.h"
+
+static const struct snd_soc_dapm_widget adv7511_dapm_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("TMDS"),
+	SND_SOC_DAPM_AIF_IN("AIFIN", "Playback", 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route adv7511_routes[] = {
+	{ "TMDS", NULL, "AIFIN" },
+};
+
+static void adv7511_calc_cts_n(unsigned int f_tmds, unsigned int fs,
+			       unsigned int *cts, unsigned int *n)
+{
+	switch (fs) {
+	case 32000:
+		*n = 4096;
+		break;
+	case 44100:
+		*n = 6272;
+		break;
+	case 48000:
+		*n = 6144;
+		break;
+	}
+
+	*cts = ((f_tmds * *n) / (128 * fs)) * 1000;
+}
+
+static int adv7511_update_cts_n(struct adv7511 *adv7511)
+{
+	unsigned int cts = 0;
+	unsigned int n = 0;
+
+	adv7511_calc_cts_n(adv7511->f_tmds, adv7511->f_audio, &cts, &n);
+
+	regmap_write(adv7511->regmap, ADV7511_REG_N0, (n >> 16) & 0xf);
+	regmap_write(adv7511->regmap, ADV7511_REG_N1, (n >> 8) & 0xff);
+	regmap_write(adv7511->regmap, ADV7511_REG_N2, n & 0xff);
+
+	regmap_write(adv7511->regmap, ADV7511_REG_CTS_MANUAL0,
+		     (cts >> 16) & 0xf);
+	regmap_write(adv7511->regmap, ADV7511_REG_CTS_MANUAL1,
+		     (cts >> 8) & 0xff);
+	regmap_write(adv7511->regmap, ADV7511_REG_CTS_MANUAL2,
+		     cts & 0xff);
+
+	return 0;
+}
+
+static int adv7511_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_codec *codec = rtd->codec;
+	struct adv7511 *adv7511 = snd_soc_codec_get_drvdata(codec);
+	unsigned int rate;
+	unsigned int len;
+	switch (params_rate(params)) {
+	case 32000:
+		rate = ADV7511_SAMPLE_FREQ_32000;
+		break;
+	case 44100:
+		rate = ADV7511_SAMPLE_FREQ_44100;
+		break;
+	case 48000:
+		rate = ADV7511_SAMPLE_FREQ_48000;
+		break;
+	case 88200:
+		rate = ADV7511_SAMPLE_FREQ_88200;
+		break;
+	case 96000:
+		rate = ADV7511_SAMPLE_FREQ_96000;
+		break;
+	case 176400:
+		rate = ADV7511_SAMPLE_FREQ_176400;
+		break;
+	case 192000:
+		rate = ADV7511_SAMPLE_FREQ_192000;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		len = ADV7511_I2S_SAMPLE_LEN_16;
+		break;
+	case SNDRV_PCM_FORMAT_S18_3LE:
+		len = ADV7511_I2S_SAMPLE_LEN_18;
+		break;
+	case SNDRV_PCM_FORMAT_S20_3LE:
+		len = ADV7511_I2S_SAMPLE_LEN_20;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		len = ADV7511_I2S_SAMPLE_LEN_24;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	adv7511->f_audio = params_rate(params);
+
+	adv7511_update_cts_n(adv7511);
+
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CFG3,
+			   ADV7511_AUDIO_CFG3_LEN_MASK, len);
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_I2C_FREQ_ID_CFG,
+			   ADV7511_I2C_FREQ_ID_CFG_RATE_MASK, rate << 4);
+	regmap_write(adv7511->regmap, 0x73, 0x1);
+
+	return 0;
+}
+
+static int adv7511_set_dai_fmt(struct snd_soc_dai *codec_dai,
+			       unsigned int fmt)
+{
+	struct snd_soc_codec *codec = codec_dai->codec;
+	struct adv7511 *adv7511 = snd_soc_codec_get_drvdata(codec);
+	unsigned int audio_source, i2s_format = 0;
+	unsigned int invert_clock;
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		audio_source = ADV7511_AUDIO_SOURCE_I2S;
+		i2s_format = ADV7511_I2S_FORMAT_I2S;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		audio_source = ADV7511_AUDIO_SOURCE_I2S;
+		i2s_format = ADV7511_I2S_FORMAT_RIGHT_J;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		audio_source = ADV7511_AUDIO_SOURCE_I2S;
+		i2s_format = ADV7511_I2S_FORMAT_LEFT_J;
+		break;
+//	case SND_SOC_DAIFMT_SPDIF:
+//		audio_source = ADV7511_AUDIO_SOURCE_SPDIF;
+//		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		invert_clock = 0;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		invert_clock = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_SOURCE, 0x70,
+			   audio_source << 4);
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG, BIT(6),
+			   invert_clock << 6);
+	regmap_update_bits(adv7511->regmap, ADV7511_REG_I2S_CONFIG, 0x03,
+			   i2s_format);
+
+	adv7511->audio_source = audio_source;
+
+	return 0;
+}
+
+static int adv7511_set_bias_level(struct snd_soc_codec *codec,
+				  enum snd_soc_bias_level level)
+{
+	struct adv7511 *adv7511 = snd_soc_codec_get_drvdata(codec);
+	struct snd_soc_dapm_context *dapm = snd_soc_codec_get_dapm(codec);
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		switch (adv7511->audio_source) {
+		case ADV7511_AUDIO_SOURCE_I2S:
+			break;
+		case ADV7511_AUDIO_SOURCE_SPDIF:
+			regmap_update_bits(adv7511->regmap,
+					   ADV7511_REG_AUDIO_CONFIG, BIT(7),
+					   BIT(7));
+			break;
+		}
+		break;
+	case SND_SOC_BIAS_PREPARE:
+		if (dapm->bias_level == SND_SOC_BIAS_STANDBY) {
+			adv7511_packet_enable(adv7511,
+					ADV7511_PACKET_ENABLE_AUDIO_SAMPLE);
+			adv7511_packet_enable(adv7511,
+					ADV7511_PACKET_ENABLE_AUDIO_INFOFRAME);
+			adv7511_packet_enable(adv7511,
+					ADV7511_PACKET_ENABLE_N_CTS);
+		} else {
+			adv7511_packet_disable(adv7511,
+					ADV7511_PACKET_ENABLE_AUDIO_SAMPLE);
+			adv7511_packet_disable(adv7511,
+					ADV7511_PACKET_ENABLE_AUDIO_INFOFRAME);
+			adv7511_packet_disable(adv7511,
+					ADV7511_PACKET_ENABLE_N_CTS);
+		}
+		break;
+	case SND_SOC_BIAS_STANDBY:
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_AUDIO_CONFIG,
+				   BIT(7), 0);
+		break;
+	case SND_SOC_BIAS_OFF:
+		break;
+	}
+	dapm->bias_level = level;
+	return 0;
+}
+
+#define ADV7511_RATES (SNDRV_PCM_RATE_32000 |\
+		SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
+		SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 |\
+		SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000)
+
+#define ADV7511_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S18_3LE |\
+		SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE)
+
+static const struct snd_soc_dai_ops adv7511_dai_ops = {
+	.hw_params	= adv7511_hw_params,
+	/*.set_sysclk	= adv7511_set_dai_sysclk,*/
+	.set_fmt	= adv7511_set_dai_fmt,
+};
+
+static struct snd_soc_dai_driver adv7511_dai = {
+	.name = "adv7511",
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = ADV7511_RATES,
+		.formats = ADV7511_FORMATS,
+	},
+	.ops = &adv7511_dai_ops,
+};
+
+static int adv7511_suspend(struct snd_soc_codec *codec)
+{
+	return adv7511_set_bias_level(codec, SND_SOC_BIAS_OFF);
+}
+
+static int adv7511_resume(struct snd_soc_codec *codec)
+{
+	return adv7511_set_bias_level(codec, SND_SOC_BIAS_STANDBY);
+}
+
+static int adv7511_probe(struct snd_soc_codec *codec)
+{
+	return adv7511_set_bias_level(codec, SND_SOC_BIAS_STANDBY);
+}
+
+static int adv7511_remove(struct snd_soc_codec *codec)
+{
+	adv7511_set_bias_level(codec, SND_SOC_BIAS_OFF);
+	return 0;
+}
+
+static struct snd_soc_codec_driver adv7511_codec_driver = {
+	.probe		    = adv7511_probe,
+	.remove		    = adv7511_remove,
+	.suspend	    = adv7511_suspend,
+	.resume		    = adv7511_resume,
+	.set_bias_level	    = adv7511_set_bias_level,
+	.component_driver = {
+		.dapm_widgets	    = adv7511_dapm_widgets,
+		.num_dapm_widgets   = ARRAY_SIZE(adv7511_dapm_widgets),
+		.dapm_routes	    = adv7511_routes,
+		.num_dapm_routes    = ARRAY_SIZE(adv7511_routes),
+	},
+};
+
+int adv7511_audio_init(struct device *dev)
+{
+    return snd_soc_register_codec(dev, &adv7511_codec_driver,
+		&adv7511_dai, 1);
+}
+
+void adv7511_audio_exit(struct device *dev)
+{
+	snd_soc_unregister_codec(dev);
+}
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
new file mode 100644
index 000000000000..6e7e5dc0a20a
--- /dev/null
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -0,0 +1,4267 @@
+/*
+ * Copyright (c) 2016 Linaro Limited.
+ * Copyright (c) 2014-2016 Hisilicon Limited.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __KIRIN970_DPE_REG_H__
+#define __KIRIN970_DPE_REG_H__
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/string.h>
+#include <linux/platform_device.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/wait.h>
+#include <linux/bug.h>
+#include <linux/iommu.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+
+#include <linux/ion.h>
+#include <linux/hisi/hisi_ion.h>
+
+#define FB_ACCEL_HI62xx 	0x1
+#define FB_ACCEL_HI363x 	0x2
+#define FB_ACCEL_HI365x 	0x4
+#define FB_ACCEL_HI625x 	0x8
+#define FB_ACCEL_HI366x 	0x10
+#define FB_ACCEL_KIRIN970_ES  0x20
+#define FB_ACCEL_KIRIN970  0x40
+#define FB_ACCEL_KIRIN660  0x80
+#define FB_ACCEL_KIRIN980_ES  0x100
+#define FB_ACCEL_KIRIN980  0x200
+#define FB_ACCEL_PLATFORM_TYPE_FPGA     0x10000000   //FPGA
+#define FB_ACCEL_PLATFORM_TYPE_ASIC     0x20000000   //ASIC
+
+/* vcc name */
+#define REGULATOR_PDP_NAME	"regulator_dsssubsys"
+#define REGULATOR_MMBUF	"regulator_mmbuf"
+
+/*******************************************************************************
+**
+*/
+enum dss_chn_idx {
+	DSS_RCHN_NONE = -1,
+	DSS_RCHN_D2 = 0,
+	DSS_RCHN_D3,
+	DSS_RCHN_V0,
+	DSS_RCHN_G0,
+	DSS_RCHN_V1,
+	DSS_RCHN_G1,
+	DSS_RCHN_D0,
+	DSS_RCHN_D1,
+
+	DSS_WCHN_W0,
+	DSS_WCHN_W1,
+
+	DSS_CHN_MAX,
+
+	DSS_RCHN_V2 = DSS_CHN_MAX,  /*for copybit, only supported in chicago*/
+	DSS_WCHN_W2,
+
+	DSS_COPYBIT_MAX,
+};
+
+enum dss_channel {
+	DSS_CH1 = 0,	/* channel 1 for primary plane */
+	DSS_CH_NUM
+};
+
+#define PRIMARY_CH	DSS_CH1 /* primary plane */
+
+typedef struct dss_rect {
+	s32 x;
+	s32 y;
+	s32 w;
+	s32 h;
+} dss_rect_t;
+
+typedef struct dss_rect_ltrb {
+	s32 left;
+	s32 top;
+	s32 right;
+	s32 bottom;
+} dss_rect_ltrb_t;
+
+enum {
+	DSI_1_LANES = 0,
+	DSI_2_LANES,
+	DSI_3_LANES,
+	DSI_4_LANES,
+};
+
+enum dss_ovl_idx {
+	DSS_OVL0 = 0,
+	DSS_OVL1,
+	DSS_OVL2,
+	DSS_OVL3,
+	DSS_OVL_IDX_MAX,
+};
+
+#define DSS_WCH_MAX  (2)
+
+typedef struct dss_img {
+	uint32_t format;
+	uint32_t width;
+	uint32_t height;
+	uint32_t bpp;		/* bytes per pixel */
+	uint32_t buf_size;
+	uint32_t stride;
+	uint32_t stride_plane1;
+	uint32_t stride_plane2;
+	uint64_t phy_addr;
+	uint64_t vir_addr;
+	uint32_t offset_plane1;
+	uint32_t offset_plane2;
+
+	uint64_t afbc_header_addr;
+	uint64_t afbc_payload_addr;
+	uint32_t afbc_header_stride;
+	uint32_t afbc_payload_stride;
+	uint32_t afbc_scramble_mode;
+	uint32_t mmbuf_base;
+	uint32_t mmbuf_size;
+
+	uint32_t mmu_enable;
+	uint32_t csc_mode;
+	uint32_t secure_mode;
+	int32_t shared_fd;
+	uint32_t reserved0;
+} dss_img_t;
+
+typedef struct drm_dss_layer {
+	dss_img_t img;
+	dss_rect_t src_rect;
+	dss_rect_t src_rect_mask;
+	dss_rect_t dst_rect;
+	uint32_t transform;
+	int32_t blending;
+	uint32_t glb_alpha;
+	uint32_t color;		/* background color or dim color */
+	int32_t layer_idx;
+	int32_t chn_idx;
+	uint32_t need_cap;
+	int32_t acquire_fence;
+} drm_dss_layer_t;
+
+
+/*******************************************************************************
+**
+*/
+#define DEFAULT_MIPI_CLK_RATE	(192 * 100000L)
+#define DEFAULT_PCLK_DSI_RATE	(120 * 1000000L)
+
+#define DSS_MAX_PXL0_CLK_144M (144000000UL)
+
+#define DSS_ADDR  0xE8600000
+#define DSS_DSI_ADDR	(DSS_ADDR + 0x01000)
+#define DSS_LDI_ADDR	(DSS_ADDR + 0x7d000)
+#define PMC_BASE	(0xFFF31000)
+#define PERI_CRG_BASE	(0xFFF35000)
+#define SCTRL_BASE	(0xFFF0A000)
+#define PCTRL_BASE		(0xE8A09000)
+
+#define GPIO_LCD_POWER_1V2  (54)
+#define GPIO_LCD_STANDBY    (67)
+#define GPIO_LCD_RESETN     (65)
+#define GPIO_LCD_GATING     (60)
+#define GPIO_LCD_PCLK_GATING (58)
+#define GPIO_LCD_REFCLK_GATING (59)
+#define GPIO_LCD_SPICS         (168)
+#define GPIO_LCD_DRV_EN        (73)
+
+#define GPIO_PG_SEL_A (72)
+#define GPIO_TX_RX_A (74)
+#define GPIO_PG_SEL_B (76)
+#define GPIO_TX_RX_B (78)
+
+
+/*******************************************************************************
+**
+*/
+#define CRGPERI_PLL0_CLK_RATE	(1660000000UL)
+#define CRGPERI_PLL2_CLK_RATE	(1920000000UL)
+#define CRGPERI_PLL3_CLK_RATE	(1200000000UL)
+#define CRGPERI_PLL7_CLK_RATE	(1782000000UL)
+
+/*core_clk: 0.65v-300M, 0.75-415M, 0.8-553.33M*/
+#define DEFAULT_DSS_CORE_CLK_RATE_L3	(554000000UL)
+#define DEFAULT_DSS_CORE_CLK_RATE_L2	(415000000UL)
+#define DEFAULT_DSS_CORE_CLK_RATE_L1	(300000000UL)
+
+#define DEFAULT_DSS_CORE_CLK_RATE_ES	(400000000UL)
+
+/*pix0_clk: 0.65v-300M, 0.75-415M, 0.8-645M*/
+#define DEFAULT_DSS_PXL0_CLK_RATE_L3	(645000000UL)
+#define DEFAULT_DSS_PXL0_CLK_RATE_L2	(415000000UL)
+#define DEFAULT_DSS_PXL0_CLK_RATE_L1	(300000000UL)
+
+/*mmbuf_clk: 0.65v-237.14M, 0.75-332M, 0.8-480M*/
+#define DEFAULT_DSS_MMBUF_CLK_RATE_L3 	(480000000UL)
+#define DEFAULT_DSS_MMBUF_CLK_RATE_L2	(332000000UL)
+#define DEFAULT_DSS_MMBUF_CLK_RATE_L1	(238000000UL)
+
+/*pix1_clk: 0.65v-254.57M, 0.75-415M, 0.8-594M*/
+#define DEFAULT_DSS_PXL1_CLK_RATE_L3	(594000000UL)
+#define DEFAULT_DSS_PXL1_CLK_RATE_L2	(415000000UL)
+#define DEFAULT_DSS_PXL1_CLK_RATE_L1	(255000000UL)
+
+/*mdc_dvfs_clk: 0.65v-240M, 0.75-332M, 0.8-553.33M*/
+#define DEFAULT_MDC_CORE_CLK_RATE_L3	(554000000UL)
+#define DEFAULT_MDC_CORE_CLK_RATE_L2	(332000000UL)
+#define DEFAULT_MDC_CORE_CLK_RATE_L1	(240000000UL)
+
+/*dss clk power off */
+#define DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF   	(277000000UL)
+#define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF    	(277000000UL)
+#define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF 	(238000000UL)
+#define DEFAULT_DSS_PXL1_CLK_RATE_POWER_OFF 	(238000000UL)
+
+#define DEFAULT_PCLK_DSS_RATE	(114000000UL)
+#define DEFAULT_PCLK_PCTRL_RATE	(80000000UL)
+#define DSS_MAX_PXL0_CLK_288M (288000000UL)
+
+#define DEFAULT_DSS_CORE_CLK_08V_RATE	(535000000UL)
+#define DEFAULT_DSS_CORE_CLK_07V_RATE	(400000000UL)
+
+#define MMBUF_SIZE_MAX	(288 * 1024)
+#define HISI_DSS_CMDLIST_MAX	(16)
+#define HISI_DSS_CMDLIST_IDXS_MAX (0xFFFF)
+#define HISI_DSS_COPYBIT_CMDLIST_IDXS	 (0xC000)
+#define HISI_DSS_DPP_MAX_SUPPORT_BIT (0x7ff)
+#define HISIFB_DSS_PLATFORM_TYPE  (FB_ACCEL_HI366x | FB_ACCEL_PLATFORM_TYPE_ASIC)
+
+#define DSS_MIF_SMMU_SMRX_IDX_STEP (16)
+#define CRG_PERI_DIS3_DEFAULT_VAL     (0x0002F000)
+#define SCF_LINE_BUF	(2560)
+#define DSS_GLB_MODULE_CLK_SEL_DEFAULT_VAL  (0xF0000008)
+#define DSS_LDI_CLK_SEL_DEFAULT_VAL    (0x00000004)
+#define DSS_DBUF_MEM_CTRL_DEFAULT_VAL  (0x00000008)
+#define DSS_SMMU_RLD_EN0_DEFAULT_VAL    (0xffffffff)
+#define DSS_SMMU_RLD_EN1_DEFAULT_VAL    (0xffffff8f)
+#define DSS_SMMU_OUTSTANDING_VAL		(0xf)
+#define DSS_MIF_CTRL2_INVAL_SEL3_STRIDE_MASK		(0xc)
+#define DSS_AFBCE_ENC_OS_CFG_DEFAULT_VAL			(0x7)
+#define TUI_SEC_RCH			(DSS_RCHN_V0)
+#define DSS_CHN_MAX_DEFINE (DSS_COPYBIT_MAX)
+
+/* perf stat */
+#define DSS_DEVMEM_PERF_BASE (0xFDF10000)
+#define CRG_PERIPH_APB_PERRSTSTAT0_REG (0x68)
+#define CRG_PERIPH_APB_IP_RST_PERF_STAT_BIT (18)
+#define PERF_SAMPSTOP_REG (0x10)
+#define DEVMEM_PERF_SIZE (0x100)
+
+/* dp clock used for hdmi */
+#define DEFAULT_AUXCLK_DPCTRL_RATE	16000000UL
+#define DEFAULT_ACLK_DPCTRL_RATE_ES	288000000UL
+#define DEFAULT_ACLK_DPCTRL_RATE_CS	207000000UL
+#define DEFAULT_MIDIA_PPLL7_CLOCK_FREQ	1782000000UL
+
+#define KIRIN970_VCO_MIN_FREQ_OUPUT         1000000 /*Boston: 1000 * 1000*/
+#define KIRIN970_SYS_19M2   19200 /*Boston: 19.2f * 1000 */
+
+#define MIDIA_PPLL7_CTRL0	0x50c
+#define MIDIA_PPLL7_CTRL1	0x510
+
+#define MIDIA_PPLL7_FREQ_DEVIDER_MASK	GENMASK(25, 2)
+#define MIDIA_PPLL7_FRAC_MODE_MASK	GENMASK(25, 0)
+
+#define ACCESS_REGISTER_FN_MAIN_ID_HDCP           0xc500aa01
+#define ACCESS_REGISTER_FN_SUB_ID_HDCP_CTRL   (0x55bbccf1)
+#define ACCESS_REGISTER_FN_SUB_ID_HDCP_INT   (0x55bbccf2)
+
+/*
+ * DSS Registers
+*/
+
+/* MACROS */
+#define DSS_WIDTH(width)	((width) - 1)
+#define DSS_HEIGHT(height)	((height) - 1)
+
+#define RES_540P	(960 * 540)
+#define RES_720P	(1280 * 720)
+#define RES_1080P	(1920 * 1080)
+#define RES_1200P	(1920 * 1200)
+#define RES_1440P	(2560 * 1440)
+#define RES_1600P	(2560 * 1600)
+#define RES_4K_PHONE	(3840 * 2160)
+#define RES_4K_PAD	(3840 * 2400)
+
+#define DFC_MAX_CLIP_NUM	(31)
+
+/* for DFS */
+/* 1480 * 144bits */
+#define DFS_TIME	(80)
+#define DFS_TIME_MIN	(50)
+#define DFS_TIME_MIN_4K	(10)
+#define DBUF0_DEPTH	(1408)
+#define DBUF1_DEPTH	(512)
+#define DBUF_WIDTH_BIT	(144)
+
+#define GET_THD_RQOS_IN(max_depth)	((max_depth) * 10 / 100)
+#define GET_THD_RQOS_OUT(max_depth)	((max_depth) * 30 / 100)
+#define GET_THD_WQOS_IN(max_depth)	((max_depth) * 95 / 100)
+#define GET_THD_WQOS_OUT(max_depth)	((max_depth) * 70 / 100)
+#define GET_THD_CG_IN(max_depth)	((max_depth) - 1)
+#define GET_THD_CG_OUT(max_depth)	((max_depth) * 70 / 100)
+#define GET_FLUX_REQ_IN(max_depth)	((max_depth) * 50 / 100)
+#define GET_FLUX_REQ_OUT(max_depth)	((max_depth) * 90 / 100)
+#define GET_THD_OTHER_DFS_CG_HOLD(max_depth)	(0x20)
+#define GET_THD_OTHER_WR_WAIT(max_depth)	((max_depth) * 90 / 100)
+
+#define GET_RDMA_ROT_HQOS_ASSERT_LEV(max_depth)	((max_depth) * 30 / 100)
+#define GET_RDMA_ROT_HQOS_REMOVE_LEV(max_depth)	((max_depth) * 60 / 100)
+
+enum lcd_orientation {
+	LCD_LANDSCAPE = 0,
+	LCD_PORTRAIT,
+};
+
+enum lcd_format {
+	LCD_RGB888 = 0,
+	LCD_RGB101010,
+	LCD_RGB565,
+};
+
+enum lcd_rgb_order {
+	LCD_RGB = 0,
+	LCD_BGR,
+};
+
+enum dss_addr {
+	DSS_ADDR_PLANE0 = 0,
+	DSS_ADDR_PLANE1,
+	DSS_ADDR_PLANE2,
+};
+
+enum dss_transform {
+	DSS_TRANSFORM_NOP = 0x0,
+	DSS_TRANSFORM_FLIP_H = 0x01,
+	DSS_TRANSFORM_FLIP_V = 0x02,
+	DSS_TRANSFORM_ROT = 0x04,
+};
+
+enum dss_dfc_format {
+	DFC_PIXEL_FORMAT_RGB_565 = 0,
+	DFC_PIXEL_FORMAT_XRGB_4444,
+	DFC_PIXEL_FORMAT_ARGB_4444,
+	DFC_PIXEL_FORMAT_XRGB_5551,
+	DFC_PIXEL_FORMAT_ARGB_5551,
+	DFC_PIXEL_FORMAT_XRGB_8888,
+	DFC_PIXEL_FORMAT_ARGB_8888,
+	DFC_PIXEL_FORMAT_BGR_565,
+	DFC_PIXEL_FORMAT_XBGR_4444,
+	DFC_PIXEL_FORMAT_ABGR_4444,
+	DFC_PIXEL_FORMAT_XBGR_5551,
+	DFC_PIXEL_FORMAT_ABGR_5551,
+	DFC_PIXEL_FORMAT_XBGR_8888,
+	DFC_PIXEL_FORMAT_ABGR_8888,
+
+	DFC_PIXEL_FORMAT_YUV444,
+	DFC_PIXEL_FORMAT_YVU444,
+	DFC_PIXEL_FORMAT_YUYV422,
+	DFC_PIXEL_FORMAT_YVYU422,
+	DFC_PIXEL_FORMAT_VYUY422,
+	DFC_PIXEL_FORMAT_UYVY422,
+};
+
+enum dss_dma_format {
+	DMA_PIXEL_FORMAT_RGB_565 = 0,
+	DMA_PIXEL_FORMAT_ARGB_4444,
+	DMA_PIXEL_FORMAT_XRGB_4444,
+	DMA_PIXEL_FORMAT_ARGB_5551,
+	DMA_PIXEL_FORMAT_XRGB_5551,
+	DMA_PIXEL_FORMAT_ARGB_8888,
+	DMA_PIXEL_FORMAT_XRGB_8888,
+
+	DMA_PIXEL_FORMAT_RESERVED0,
+
+	DMA_PIXEL_FORMAT_YUYV_422_Pkg,
+	DMA_PIXEL_FORMAT_YUV_420_SP_HP,
+	DMA_PIXEL_FORMAT_YUV_420_P_HP,
+	DMA_PIXEL_FORMAT_YUV_422_SP_HP,
+	DMA_PIXEL_FORMAT_YUV_422_P_HP,
+	DMA_PIXEL_FORMAT_AYUV_4444,
+};
+
+enum dss_buf_format {
+	DSS_BUF_LINEAR = 0,
+	DSS_BUF_TILE,
+};
+
+enum dss_blend_mode {
+	DSS_BLEND_CLEAR = 0,
+	DSS_BLEND_SRC,
+	DSS_BLEND_DST,
+	DSS_BLEND_SRC_OVER_DST,
+	DSS_BLEND_DST_OVER_SRC,
+	DSS_BLEND_SRC_IN_DST,
+	DSS_BLEND_DST_IN_SRC,
+	DSS_BLEND_SRC_OUT_DST,
+	DSS_BLEND_DST_OUT_SRC,
+	DSS_BLEND_SRC_ATOP_DST,
+	DSS_BLEND_DST_ATOP_SRC,
+	DSS_BLEND_SRC_XOR_DST,
+	DSS_BLEND_SRC_ADD_DST,
+	DSS_BLEND_FIX_OVER,
+	DSS_BLEND_FIX_PER0,
+	DSS_BLEND_FIX_PER1,
+	DSS_BLEND_FIX_PER2,
+	DSS_BLEND_FIX_PER3,
+	DSS_BLEND_FIX_PER4,
+	DSS_BLEND_FIX_PER5,
+	DSS_BLEND_FIX_PER6,
+	DSS_BLEND_FIX_PER7,
+	DSS_BLEND_FIX_PER8,
+	DSS_BLEND_FIX_PER9,
+	DSS_BLEND_FIX_PER10,
+	DSS_BLEND_FIX_PER11,
+	DSS_BLEND_FIX_PER12,
+	DSS_BLEND_FIX_PER13,
+	DSS_BLEND_FIX_PER14,
+	DSS_BLEND_FIX_PER15,
+	DSS_BLEND_FIX_PER16,
+	DSS_BLEND_FIX_PER17,
+
+	DSS_BLEND_MAX,
+};
+
+enum dss_chn_module {
+	MODULE_MIF_CHN,
+	MODULE_AIF0_CHN,
+	MODULE_AIF1_CHN,
+	MODULE_MCTL_CHN_MUTEX,
+	MODULE_MCTL_CHN_FLUSH_EN,
+	MODULE_MCTL_CHN_OV_OEN,
+	MODULE_MCTL_CHN_STARTY,
+	MODULE_MCTL_CHN_MOD_DBG,
+	MODULE_DMA,
+	MODULE_DFC,
+	MODULE_SCL,
+	MODULE_SCL_LUT,
+	MODULE_ARSR2P,
+	MODULE_ARSR2P_LUT,
+	MODULE_POST_CLIP,
+	MODULE_PCSC,
+	MODULE_CSC,
+	MODULE_CHN_MAX,
+};
+
+enum dss_chn_cap {
+	MODULE_CAP_ROT,
+	MODULE_CAP_SCL,
+	MODULE_CAP_CSC,
+	MODULE_CAP_SHARPNESS_1D,
+	MODULE_CAP_SHARPNESS_2D,
+	MODULE_CAP_CE,
+	MODULE_CAP_AFBCD,
+	MODULE_CAP_AFBCE,
+	MODULE_CAP_YUV_PLANAR,
+	MODULE_CAP_YUV_SEMI_PLANAR,
+	MODULE_CAP_YUV_PACKAGE,
+	MODULE_CAP_MAX,
+};
+
+enum dss_ovl_module {
+	MODULE_OVL_BASE,
+	MODULE_MCTL_BASE,
+	MODULE_OVL_MAX,
+};
+
+enum dss_axi_idx {
+	AXI_CHN0 = 0,
+	AXI_CHN1,
+	AXI_CHN_MAX,
+};
+
+#define AXI0_MAX_DSS_CHN_THRESHOLD	(3)
+#define AXI1_MAX_DSS_CHN_THRESHOLD	(3)
+
+#define DEFAULT_AXI_CLK_RATE0	(120 * 1000000)
+#define DEFAULT_AXI_CLK_RATE1	(240 * 1000000)
+#define DEFAULT_AXI_CLK_RATE2	(360 * 1000000)
+#define DEFAULT_AXI_CLK_RATE3	(480 * 1000000)
+#define DEFAULT_AXI_CLK_RATE4	(667 * 1000000)
+#define DEFAULT_AXI_CLK_RATE5	(800 * 1000000)
+
+enum dss_rdma_idx {
+	DSS_RDMA0 = 0,
+	DSS_RDMA1,
+	DSS_RDMA2,
+	DSS_RDMA3,
+	DSS_RDMA4,
+	DSS_RDMA_MAX,
+};
+
+/*******************************************************************************
+ **
+ */
+
+#define PEREN0	(0x000)
+#define PERDIS0	(0x004)
+#define PEREN2	(0x020)
+#define PERDIS2	(0x024)
+#define PERCLKEN2	(0x028)
+#define PERSTAT2	(0x02C)
+#define PEREN3	(0x030)
+#define PERDIS3	(0x034)
+#define PERCLKEN3	(0x038)
+#define PERSTAT3	(0x03C)
+#define PEREN4	(0x040)
+#define PERDIS4	(0x044)
+#define PEREN5	(0x050)
+#define PERDIS5	(0x054)
+#define PERCLKEN5	(0x058)
+#define PERSTAT5	(0x05C)
+#define PERRSTEN0	(0x060)
+#define PERRSTDIS0	(0x064)
+#define PERRSTEN2	(0x078)
+#define PERRSTDIS2	(0x07C)
+#define PERRSTEN3	(0x084)
+#define PERRSTDIS3	(0x088)
+#define PERRSTSTAT3 (0x08c)
+#define PERRSTEN4	(0x090)
+#define PERRSTDIS4	(0x094)
+#define PERRSTSTAT4 (0x098)
+#define PERRSTDIS5	(0x0A0)
+#define CLKDIV3	(0x0B4)
+#define CLKDIV5	(0x0BC)
+#define CLKDIV10	(0x0D0)
+#define CLKDIV18	(0x0F0)
+#define CLKDIV20	(0x0F8)
+#define ISOEN	(0x144)
+#define ISODIS	(0x148)
+#define ISOSTAT	(0x14c)
+#define PERPWREN	(0x150)
+#define PERPWRDIS	(0x154)
+#define PERPWRSTAT (0x158)
+#define PERI_AUTODIV8	(0x380)
+#define PERI_AUTODIV9	(0x384)
+#define PERI_AUTODIV10	(0x388)
+#define PEREN6	(0x410)
+#define PERDIS6	(0x414)
+
+// PMC
+#define NOC_POWER_IDLEREQ	(0x380)
+#define NOC_POWER_IDLEACK	(0x384)
+#define NOC_POWER_IDLE	(0x388)
+
+//SYSCTRL
+#define SCISODIS 	(0x044)
+#define SCPERCLKEN1 (0x048)
+#define SCPWREN 	(0x060)
+#define SCPEREN1 	(0x170)
+#define SCPERDIS1  	(0x174)
+#define SCPEREN4 	(0x1B0)
+#define SCPERDIS4  	(0x1B4)
+#define SCPERRSTDIS1	(0x210)
+#define SCCLKDIV2	(0x258)
+#define SCCLKDIV4	(0x260)
+
+
+//PCTRL
+#define PERI_CTRL23	(0x060)
+#define PERI_CTRL29	(0x078)
+#define PERI_CTRL30	(0x07C)
+#define PERI_CTRL32	(0x084)
+#define PERI_CTRL33	(0x088)
+#define PERI_STAT0	(0x094)
+#define PERI_STAT1	(0x098)
+#define PERI_STAT16	(0x0D4)
+
+#define PCTRL_DPHYTX_ULPSEXIT1	BIT(4)
+#define PCTRL_DPHYTX_ULPSEXIT0	BIT(3)
+
+#define PCTRL_DPHYTX_CTRL1	BIT(1)
+#define PCTRL_DPHYTX_CTRL0	BIT(0)
+
+/*******************************************************************************
+ **
+ */
+#define BIT_DSS_GLB_INTS	BIT(30)
+#define BIT_MMU_IRPT_S	BIT(29)
+#define BIT_MMU_IRPT_NS	BIT(28)
+#define BIT_DBG_MCTL_INTS	BIT(27)
+#define BIT_DBG_WCH1_INTS	BIT(26)
+#define BIT_DBG_WCH0_INTS	BIT(25)
+#define BIT_DBG_RCH7_INTS	BIT(24)
+#define BIT_DBG_RCH6_INTS	BIT(23)
+#define BIT_DBG_RCH5_INTS	BIT(22)
+#define BIT_DBG_RCH4_INTS	BIT(21)
+#define BIT_DBG_RCH3_INTS	BIT(20)
+#define BIT_DBG_RCH2_INTS	BIT(19)
+#define BIT_DBG_RCH1_INTS	BIT(18)
+#define BIT_DBG_RCH0_INTS	BIT(17)
+#define BIT_ITF0_INTS	BIT(16)
+#define BIT_DPP_INTS	BIT(15)
+#define BIT_CMDLIST13	BIT(14)
+#define BIT_CMDLIST12	BIT(13)
+#define BIT_CMDLIST11	BIT(12)
+#define BIT_CMDLIST10	BIT(11)
+#define BIT_CMDLIST9	BIT(10)
+#define BIT_CMDLIST8	BIT(9)
+#define BIT_CMDLIST7	BIT(8)
+#define BIT_CMDLIST6	BIT(7)
+#define BIT_CMDLIST5	BIT(6)
+#define BIT_CMDLIST4	BIT(5)
+#define BIT_CMDLIST3	BIT(4)
+#define BIT_CMDLIST2	BIT(3)
+#define BIT_CMDLIST1	BIT(2)
+#define BIT_CMDLIST0	BIT(1)
+
+
+// CPU_SDP_INTS		0x22C
+// CPU_SDP_INT_MSK	0x230
+#define BIT_SDP_DSS_GLB_INTS	BIT(29)
+#define BIT_SDP_MMU_IRPT_S	BIT(28)
+#define BIT_SDP_MMU_IRPT_NS	BIT(27)
+#define BIT_SDP_DBG_MCTL_INTS	BIT(26)
+#define BIT_SDP_DBG_WCH1_INTS	BIT(25)
+#define BIT_SDP_DBG_WCH0_INTS	BIT(24)
+#define BIT_SDP_DBG_RCH7_INTS	BIT(23)
+#define BIT_SDP_DBG_RCH6_INTS	BIT(22)
+#define BIT_SDP_DBG_RCH5_INTS	BIT(21)
+#define BIT_SDP_DBG_RCH4_INTS	BIT(20)
+#define BIT_SDP_DBG_RCH3_INTS	BIT(19)
+#define BIT_SDP_DBG_RCH2_INTS	BIT(18)
+#define BIT_SDP_DBG_RCH1_INTS	BIT(17)
+#define BIT_SDP_DBG_RCH0_INTS	BIT(16)
+#define BIT_SDP_ITF1_INTS	BIT(15)
+#define BIT_SDP_CMDLIST13	BIT(14)
+#define BIT_SDP_CMDLIST12	BIT(13)
+#define BIT_SDP_CMDLIST11	BIT(12)
+#define BIT_SDP_CMDLIST10	BIT(11)
+#define BIT_SDP_CMDLIST9	BIT(10)
+#define BIT_SDP_CMDLIST8	BIT(9)
+#define BIT_SDP_CMDLIST7	BIT(8)
+#define BIT_SDP_CMDLIST6	BIT(7)
+#define BIT_SDP_CMDLIST5	BIT(6)
+#define BIT_SDP_CMDLIST4	BIT(5)
+#define BIT_SDP_CMDLIST3	BIT(4)
+#define BIT_SDP_SDP_CMDLIST2	BIT(3)
+#define BIT_SDP_CMDLIST1	BIT(2)
+#define BIT_SDP_CMDLIST0	BIT(1)
+#define BIT_SDP_RCH_CE_INTS	BIT(0)
+
+
+// CPU_OFF_INTS	0x234
+// CPU_OFF_INT_MASK	0x238
+#define BIT_OFF_DSS_GLB_INTS	BIT(31)
+#define BIT_OFF_MMU_IRPT_S	BIT(30)
+#define BIT_OFF_MMU_IRPT_NS	BIT(29)
+#define BIT_OFF_DBG_MCTL_INTS	BIT(28)
+#define BIT_OFF_DBG_WCH1_INTS	BIT(27)
+#define BIT_OFF_DBG_WCH0_INTS	BIT(26)
+#define BIT_OFF_DBG_RCH7_INTS	BIT(25)
+#define BIT_OFF_DBG_RCH6_INTS	BIT(24)
+#define BIT_OFF_DBG_RCH5_INTS	BIT(23)
+#define BIT_OFF_DBG_RCH4_INTS	BIT(22)
+#define BIT_OFF_DBG_RCH3_INTS	BIT(21)
+#define BIT_OFF_DBG_RCH2_INTS	BIT(20)
+#define BIT_OFF_DBG_RCH1_INTS	BIT(19)
+#define BIT_OFF_DBG_RCH0_INTS	BIT(18)
+#define BIT_OFF_WCH1_INTS	BIT(17)
+#define BIT_OFF_WCH0_INTS	BIT(16)
+#define BIT_OFF_WCH0_WCH1_FRM_END_INT	BIT(15)
+#define BIT_OFF_CMDLIST13	BIT(14)
+#define BIT_OFF_CMDLIST12	BIT(13)
+#define BIT_OFF_CMDLIST11	BIT(12)
+#define BIT_OFF_CMDLIST10	BIT(11)
+#define BIT_OFF_CMDLIST9	BIT(10)
+#define BIT_OFF_CMDLIST8	BIT(9)
+#define BIT_OFF_CMDLIST7	BIT(8)
+#define BIT_OFF_CMDLIST6	BIT(7)
+#define BIT_OFF_CMDLIST5	BIT(6)
+#define BIT_OFF_CMDLIST4	BIT(5)
+#define BIT_OFF_CMDLIST3	BIT(4)
+#define BIT_OFF_CMDLIST2	BIT(3)
+#define BIT_OFF_CMDLIST1	BIT(2)
+#define BIT_OFF_CMDLIST0	BIT(1)
+#define BIT_OFF_RCH_CE_INTS	BIT(0)
+
+#define BIT_OFF_CAM_DBG_WCH2_INTS	BIT(4)
+#define BIT_OFF_CAM_DBG_RCH8_INTS	BIT(3)
+#define BIT_OFF_CAM_WCH2_FRMEND_INTS  BIT(2)
+#define BIT_OFF_CAM_CMDLIST15_INTS	BIT(1)
+#define BIT_OFF_CAM_CMDLIST14_INTS	BIT(0)
+
+#define BIT_VACTIVE_CNT	BIT(14)
+#define BIT_DSI_TE_TRI	BIT(13)
+#define BIT_LCD_TE0_PIN	BIT(12)
+#define BIT_LCD_TE1_PIN	BIT(11)
+#define BIT_VACTIVE1_END	BIT(10)
+#define BIT_VACTIVE1_START	BIT(9)
+#define BIT_VACTIVE0_END	BIT(8)
+#define BIT_VACTIVE0_START	BIT(7)
+#define BIT_VFRONTPORCH	BIT(6)
+#define BIT_VBACKPORCH	BIT(5)
+#define BIT_VSYNC	BIT(4)
+#define BIT_VFRONTPORCH_END	BIT(3)
+#define BIT_LDI_UNFLOW	BIT(2)
+#define BIT_FRM_END	BIT(1)
+#define BIT_FRM_START	BIT(0)
+
+#define BIT_CTL_FLUSH_EN	BIT(21)
+#define BIT_SCF_FLUSH_EN	BIT(19)
+#define BIT_DPP0_FLUSH_EN	BIT(18)
+#define BIT_DBUF1_FLUSH_EN	BIT(17)
+#define BIT_DBUF0_FLUSH_EN	BIT(16)
+#define BIT_OV3_FLUSH_EN	BIT(15)
+#define BIT_OV2_FLUSH_EN	BIT(14)
+#define BIT_OV1_FLUSH_EN	BIT(13)
+#define BIT_OV0_FLUSH_EN	BIT(12)
+#define BIT_WB1_FLUSH_EN	BIT(11)
+#define BIT_WB0_FLUSH_EN	BIT(10)
+#define BIT_DMA3_FLUSH_EN	BIT(9)
+#define BIT_DMA2_FLUSH_EN	BIT(8)
+#define BIT_DMA1_FLUSH_EN	BIT(7)
+#define BIT_DMA0_FLUSH_EN	BIT(6)
+#define BIT_RGB1_FLUSH_EN	BIT(4)
+#define BIT_RGB0_FLUSH_EN	BIT(3)
+#define BIT_VIG1_FLUSH_EN	BIT(1)
+#define BIT_VIG0_FLUSH_EN	BIT(0)
+
+#define BIT_BUS_DBG_INT	BIT(5)
+#define BIT_CRC_SUM_INT	BIT(4)
+#define BIT_CRC_ITF1_INT	BIT(3)
+#define BIT_CRC_ITF0_INT	BIT(2)
+#define BIT_CRC_OV1_INT	BIT(1)
+#define BIT_CRC_OV0_INT	BIT(0)
+
+#define BIT_SBL_SEND_FRAME_OUT	BIT(19)
+#define BIT_SBL_STOP_FRAME_OUT	BIT(18)
+#define BIT_SBL_BACKLIGHT_OUT	BIT(17)
+#define BIT_SBL_DARKENH_OUT		BIT(16)
+#define BIT_SBL_BRIGHTPTR_OUT	BIT(15)
+#define BIT_STRENGTH_INROI_OUT	BIT(14)
+#define BIT_STRENGTH_OUTROI_OUT	BIT(13)
+#define BIT_DONE_OUT			BIT(12)
+#define BIT_PPROC_DONE_OUT		BIT(11)
+
+#define BIT_HIACE_IND	BIT(8)
+#define BIT_STRENGTH_INTP	BIT(7)
+#define BIT_BACKLIGHT_INTP	BIT(6)
+#define BIT_CE_END_IND	BIT(5)
+#define BIT_CE_CANCEL_IND	BIT(4)
+#define BIT_CE_LUT1_RW_COLLIDE_IND	BIT(3)
+#define BIT_CE_LUT0_RW_COLLIDE_IND	BIT(2)
+#define BIT_CE_HIST1_RW_COLLIDE_IND	BIT(1)
+#define BIT_CE_HIST0_RW_COLLIDE_IND	BIT(0)
+
+/*******************************************************************************
+** MODULE BASE ADDRESS
+*/
+//DSI0 DSI1
+#define DSS_MIPI_DSI0_OFFSET	(0x00001000)
+#define DSS_MIPI_DSI1_OFFSET	(0x00001400)
+// GLB0
+#define DSS_GLB0_OFFSET	(0x12000)
+// debug
+#define DSS_DBG_OFFSET	(0x11000)
+
+// CMDLIST
+#define DSS_CMDLIST_OFFSET	(0x2000)
+
+//SMMU
+#define DSS_SMMU_OFFSET	(0x80000)
+
+//AIF
+#define DSS_VBIF0_AIF	(0x7000)
+#define DSS_VBIF1_AIF	(0x9000)
+
+// MIF
+#define DSS_MIF_OFFSET	(0xA000)
+
+// MCTL SYS
+#define DSS_MCTRL_SYS_OFFSET	(0x10000)
+
+// MCTL MUTEX
+#define DSS_MCTRL_CTL0_OFFSET	(0x10800)
+#define DSS_MCTRL_CTL1_OFFSET	(0x10900)
+#define DSS_MCTRL_CTL2_OFFSET	(0x10A00)
+#define DSS_MCTRL_CTL3_OFFSET	(0x10B00)
+#define DSS_MCTRL_CTL4_OFFSET	(0x10C00)
+#define DSS_MCTRL_CTL5_OFFSET	(0x10D00)
+
+// RCH_V
+#define DSS_RCH_VG0_DMA_OFFSET			(0x20000)
+#define DSS_RCH_VG0_DFC_OFFSET 			(0x20100)
+#define DSS_RCH_VG0_SCL_OFFSET			(0x20200)
+#define DSS_RCH_VG0_ARSR_OFFSET			(0x20300)
+#define DSS_RCH_VG0_POST_CLIP_OFFSET_ES	(0x203A0)
+#define DSS_RCH_VG0_PCSC_OFFSET			(0x20400)
+#define DSS_RCH_VG0_POST_CLIP_OFFSET	(0x20480)
+#define DSS_RCH_VG0_CSC_OFFSET			(0x20500)
+#define DSS_RCH_VG0_DEBUG_OFFSET		(0x20600)
+#define DSS_RCH_VG0_VPP_OFFSET			(0x20700)
+#define DSS_RCH_VG0_DMA_BUF_OFFSET		(0x20800)
+#define DSS_RCH_VG0_AFBCD_OFFSET		(0x20900)
+#define DSS_RCH_VG0_REG_DEFAULT_OFFSET	(0x20A00)
+#define DSS_RCH_VG0_SCL_LUT_OFFSET		(0x21000)
+#define DSS_RCH_VG0_ARSR_LUT_OFFSET		(0x25000)
+
+#define DSS_RCH_VG1_DMA_OFFSET			(0x28000)
+#define DSS_RCH_VG1_DFC_OFFSET 			(0x28100)
+#define DSS_RCH_VG1_SCL_OFFSET			(0x28200)
+#define DSS_RCH_VG1_POST_CLIP_OFFSET_ES	(0x283A0)
+#define DSS_RCH_VG1_POST_CLIP_OFFSET	(0x28480)
+#define DSS_RCH_VG1_CSC_OFFSET			(0x28500)
+#define DSS_RCH_VG1_DEBUG_OFFSET		(0x28600)
+#define DSS_RCH_VG1_VPP_OFFSET			(0x28700)
+#define DSS_RCH_VG1_DMA_BUF_OFFSET		(0x28800)
+#define DSS_RCH_VG1_AFBCD_OFFSET		(0x28900)
+#define DSS_RCH_VG1_REG_DEFAULT_OFFSET	(0x28A00)
+#define DSS_RCH_VG1_SCL_LUT_OFFSET		(0x29000)
+
+#define DSS_RCH_VG2_DMA_OFFSET			(0x30000)
+#define DSS_RCH_VG2_DFC_OFFSET 			(0x30100)
+#define DSS_RCH_VG2_SCL_OFFSET			(0x30200)
+#define DSS_RCH_VG2_POST_CLIP_OFFSET_ES	(0x303A0)
+#define DSS_RCH_VG2_POST_CLIP_OFFSET	(0x30480)
+#define DSS_RCH_VG2_CSC_OFFSET			(0x30500)
+#define DSS_RCH_VG2_DEBUG_OFFSET		(0x30600)
+#define DSS_RCH_VG2_VPP_OFFSET			(0x30700)
+#define DSS_RCH_VG2_DMA_BUF_OFFSET		(0x30800)
+#define DSS_RCH_VG2_REG_DEFAULT_OFFSET	(0x30A00)
+#define DSS_RCH_VG2_SCL_LUT_OFFSET		(0x31000)   //ES
+
+// RCH_G
+#define DSS_RCH_G0_DMA_OFFSET				(0x38000)
+#define DSS_RCH_G0_DFC_OFFSET				(0x38100)
+#define DSS_RCH_G0_SCL_OFFSET				(0x38200)
+#define DSS_RCH_G0_POST_CLIP_OFFSET_ES		(0x383A0)
+#define DSS_RCH_G0_POST_CLIP_OFFSET 		(0x38480)
+#define DSS_RCH_G0_CSC_OFFSET 			(0x38500)
+#define DSS_RCH_G0_DEBUG_OFFSET 			(0x38600)
+#define DSS_RCH_G0_DMA_BUF_OFFSET 		(0x38800)
+#define DSS_RCH_G0_AFBCD_OFFSET 			(0x38900)
+#define DSS_RCH_G0_REG_DEFAULT_OFFSET 	(0x38A00)
+
+#define DSS_RCH_G1_DMA_OFFSET				(0x40000)
+#define DSS_RCH_G1_DFC_OFFSET				(0x40100)
+#define DSS_RCH_G1_SCL_OFFSET				(0x40200)
+#define DSS_RCH_G1_POST_CLIP_OFFSET_ES	(0x403A0)
+#define DSS_RCH_G1_POST_CLIP_OFFSET		(0x40480)
+#define DSS_RCH_G1_CSC_OFFSET 			(0x40500)
+#define DSS_RCH_G1_DEBUG_OFFSET 			(0x40600)
+#define DSS_RCH_G1_DMA_BUF_OFFSET 		(0x40800)
+#define DSS_RCH_G1_AFBCD_OFFSET 			(0x40900)
+#define DSS_RCH_G1_REG_DEFAULT_OFFSET 	(0x40A00)
+
+// RCH_D
+#define DSS_RCH_D2_DMA_OFFSET			(0x50000)
+#define DSS_RCH_D2_DFC_OFFSET			(0x50100)
+#define DSS_RCH_D2_CSC_OFFSET			(0x50500)
+#define DSS_RCH_D2_DEBUG_OFFSET		(0x50600)
+#define DSS_RCH_D2_DMA_BUF_OFFSET	(0x50800)
+
+#define DSS_RCH_D3_DMA_OFFSET			(0x51000)
+#define DSS_RCH_D3_DFC_OFFSET			(0x51100)
+#define DSS_RCH_D3_CSC_OFFSET			(0x51500)
+#define DSS_RCH_D3_DEBUG_OFFSET		(0x51600)
+#define DSS_RCH_D3_DMA_BUF_OFFSET	(0x51800)
+
+#define DSS_RCH_D0_DMA_OFFSET			(0x52000)
+#define DSS_RCH_D0_DFC_OFFSET			(0x52100)
+#define DSS_RCH_D0_CSC_OFFSET			(0x52500)
+#define DSS_RCH_D0_DEBUG_OFFSET		(0x52600)
+#define DSS_RCH_D0_DMA_BUF_OFFSET	(0x52800)
+#define DSS_RCH_D0_AFBCD_OFFSET		(0x52900)
+
+#define DSS_RCH_D1_DMA_OFFSET			(0x53000)
+#define DSS_RCH_D1_DFC_OFFSET			(0x53100)
+#define DSS_RCH_D1_CSC_OFFSET			(0x53500)
+#define DSS_RCH_D1_DEBUG_OFFSET		(0x53600)
+#define DSS_RCH_D1_DMA_BUF_OFFSET	(0x53800)
+
+// WCH
+#define DSS_WCH0_DMA_OFFSET			(0x5A000)
+#define DSS_WCH0_DFC_OFFSET			(0x5A100)
+#define DSS_WCH0_BITEXT_OFFSET 		(0x5A140)
+#define DSS_WCH0_DITHER_OFFSET            (0x5A1D0)
+#define DSS_WCH0_PCSC_OFFSET			(0x5A400)
+#define DSS_WCH0_CSC_OFFSET			(0x5A500)
+#define DSS_WCH0_ROT_OFFSET			(0x5A530)
+#define DSS_WCH0_DEBUG_OFFSET		(0x5A600)
+#define DSS_WCH0_DMA_BUFFER_OFFSET	(0x5A800)
+#define DSS_WCH0_AFBCE_OFFSET			(0x5A900)
+#define DSS_WCH0_FBCE_CREG_CTRL_GATE (0x5A964)
+
+#define DSS_WCH1_DMA_OFFSET			(0x5C000)
+#define DSS_WCH1_DFC_OFFSET			(0x5C100)
+#define DSS_WCH1_BITEXT_OFFSET 		(0x5C140)
+#define DSS_WCH1_DITHER_OFFSET            (0x5C1D0)
+#define DSS_WCH1_SCL_OFFSET          		(0x5C200)
+#define DSS_WCH1_PCSC_OFFSET			(0x5C400)
+#define DSS_WCH1_CSC_OFFSET			(0x5C500)
+#define DSS_WCH1_ROT_OFFSET			(0x5C530)
+#define DSS_WCH1_DEBUG_OFFSET		(0x5C600)
+#define DSS_WCH1_DMA_BUFFER_OFFSET	(0x5C800)
+#define DSS_WCH1_AFBCE_OFFSET			(0x5C900)
+#define DSS_WCH1_FBCE_CREG_CTRL_GATE 	(0x5C964)
+
+#define DSS_WCH2_DMA_OFFSET			(0x5E000)
+#define DSS_WCH2_DFC_OFFSET			(0x5E100)
+#define DSS_WCH2_CSC_OFFSET			(0x5E500)
+#define DSS_WCH2_ROT_OFFSET			(0x5E500)
+#define DSS_WCH2_DEBUG_OFFSET		(0x5E600)
+#define DSS_WCH2_DMA_BUFFER_OFFSET	(0x5E800)
+#define DSS_WCH2_AFBCE_OFFSET			(0x5E900)
+
+
+
+// OVL
+#define DSS_OVL0_OFFSET	(0x60000)
+#define DSS_OVL1_OFFSET	(0x60400)
+#define DSS_OVL2_OFFSET	(0x60800)
+#define DSS_OVL3_OFFSET	(0x60C00)
+
+//DBUF
+#define DSS_DBUF0_OFFSET	(0x6D000)
+#define DSS_DBUF1_OFFSET	(0x6E000)
+
+//HI_ACE
+#define DSS_HI_ACE_OFFSET	(0x6F000)
+
+// DPP
+#define DSS_DPP_OFFSET	(0x70000)
+#define DSS_TOP_OFFSET	(0x70000)
+#define DSS_DPP_COLORBAR_OFFSET	(0x70100)
+#define DSS_DPP_CLIP_OFFSET	(0x70180)
+#define DSS_DPP_DITHER_OFFSET	(0x70200)
+#define DSS_DPP_CSC_RGB2YUV10B_OFFSET	(0x70300)
+#define DSS_DPP_CSC_YUV2RGB10B_OFFSET	(0x70400)
+#define DSS_DPP_GAMA_OFFSET	(0x70600)
+#define DSS_DPP_ACM_OFFSET	(0x70700)
+#define DSS_DPP_XCC_OFFSET	(0x70900)
+#define DSS_DPP_DEGAMMA_OFFSET	(0x70950)
+#define DSS_DPP_GMP_OFFSET	(0x709A0)
+#define DSS_DPP_ARSR_POST_OFFSET	(0x70A00)
+#define DSS_DPP_GAMA_LUT_OFFSET	(0x71000)
+#define DSS_DPP_ACM_LUT_OFFSET	(0x72000)
+#define DSS_DPP_GMP_LUT_OFFSET	(0x73000)
+#define DSS_DPP_GAMA_PRE_LUT_OFFSET	(0x75000)
+#define DSS_DPP_DEGAMMA_LUT_OFFSET	(0x78000)
+#define DSS_DPP_ARSR_POST_LUT_OFFSET	(0x7B000)
+//ace for ES
+#define DSS_DPP_ACE_OFFSET	(0x70800)
+#define DSS_DPP_ACE_LUT_OFFSET	(0x79000)
+//ACE LUT
+#define ACE_HIST0	(0x000)
+#define ACE_HIST1	(0x400)
+#define ACE_LUT0	(0x800)
+#define ACE_LUT1	(0xA00)
+
+//for boston es
+#define DSS_DPP_LCP_OFFSET_ES	(0x70900)
+#define DSS_DPP_LCP_LUT_OFFSET_ES	(0x73000)
+
+// POST SCF
+#define DSS_POST_SCF_OFFSET	DSS_DPP_ARSR_POST_OFFSET
+#define DSS_POST_SCF_LUT_OFFSET	DSS_DPP_ARSR_POST_LUT_OFFSET
+//POST SCF for ES
+#define DSS_POST_SCF_LUT_OFFSET_ES	(0x7B000)
+
+#define DSS_DPP_SBL_OFFSET	(0x7C000)
+#define DSS_LDI0_OFFSET	(0x7D000)
+#define DSS_IFBC_OFFSET	(0x7D800)
+#define DSS_DSC_OFFSET	(0x7DC00)
+#define DSS_LDI1_OFFSET	(0x7E000)
+
+/*******************************************************************************
+** GLB
+*/
+#define GLB_DSS_TAG	 (DSS_GLB0_OFFSET + 0x0000)
+//APB
+#define GLB_APB_CTL	 (DSS_GLB0_OFFSET + 0x0004)
+//RST
+#define GLB_DSS_AXI_RST_EN	(DSS_GLB0_OFFSET + 0x0118)
+#define GLB_DSS_APB_RST_EN	(DSS_GLB0_OFFSET + 0x011C)
+#define GLB_DSS_CORE_RST_EN	(DSS_GLB0_OFFSET + 0x0120)
+#define GLB_PXL0_DIV2_RST_EN	(DSS_GLB0_OFFSET + 0x0124)
+#define GLB_PXL0_DIV4_RST_EN	(DSS_GLB0_OFFSET + 0x0128)
+#define GLB_PXL0_RST_EN	(DSS_GLB0_OFFSET + 0x012C)
+#define GLB_PXL0_DSI_RST_EN	(DSS_GLB0_OFFSET + 0x0130)
+#define GLB_DSS_PXL1_RST_EN	(DSS_GLB0_OFFSET + 0x0134)
+#define GLB_MM_AXI_CLK_RST_EN	(DSS_GLB0_OFFSET + 0x0138)
+#define GLB_AFBCD0_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0140)
+#define GLB_AFBCD1_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0144)
+#define GLB_AFBCD2_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0148)
+#define GLB_AFBCD3_IP_RST_EN	(DSS_GLB0_OFFSET + 0x014C)
+#define GLB_AFBCD4_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0150)
+#define GLB_AFBCD5_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0154)
+#define GLB_AFBCD6_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0158)
+#define GLB_AFBCD7_IP_RST_EN	(DSS_GLB0_OFFSET + 0x015C)
+#define GLB_AFBCE0_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0160)
+#define GLB_AFBCE1_IP_RST_EN	(DSS_GLB0_OFFSET + 0x0164)
+
+//MCU CPU first class interrupts
+#define GLB_MCU_PDP_INTS	(DSS_GLB0_OFFSET + 0x20C)
+#define GLB_MCU_PDP_INT_MSK	(DSS_GLB0_OFFSET + 0x210)
+#define GLB_MCU_SDP_INTS	(DSS_GLB0_OFFSET + 0x214)
+#define GLB_MCU_SDP_INT_MSK	(DSS_GLB0_OFFSET + 0x218)
+#define GLB_MCU_OFF_INTS	(DSS_GLB0_OFFSET + 0x21C)
+#define GLB_MCU_OFF_INT_MSK	(DSS_GLB0_OFFSET + 0x220)
+#define GLB_MCU_OFF_CAM_INTS	(DSS_GLB0_OFFSET + 0x2B4)
+#define GLB_MCU_OFF_CAM_INT_MSK	(DSS_GLB0_OFFSET + 0x2B8)
+#define GLB_CPU_PDP_INTS	(DSS_GLB0_OFFSET + 0x224)
+#define GLB_CPU_PDP_INT_MSK	(DSS_GLB0_OFFSET + 0x228)
+#define GLB_CPU_SDP_INTS	(DSS_GLB0_OFFSET + 0x22C)
+#define GLB_CPU_SDP_INT_MSK	(DSS_GLB0_OFFSET + 0x230)
+#define GLB_CPU_OFF_INTS	(DSS_GLB0_OFFSET + 0x234)
+#define GLB_CPU_OFF_INT_MSK	(DSS_GLB0_OFFSET + 0x238)
+#define GLB_CPU_OFF_CAM_INTS	(DSS_GLB0_OFFSET + 0x2AC)
+#define GLB_CPU_OFF_CAM_INT_MSK	(DSS_GLB0_OFFSET + 0x2B0)
+
+//core clock area, first class gating
+#define GLB_MODULE_CLK_SEL	(DSS_GLB0_OFFSET + 0x0300)
+#define GLB_MODULE_CLK_EN	(DSS_GLB0_OFFSET + 0x0304)
+//irq debug
+#define GLB_GLB0_DBG_SEL	(DSS_GLB0_OFFSET + 0x310)
+#define GLB_GLB1_DBG_SEL	(DSS_GLB0_OFFSET + 0x314)
+#define GLB_DBG_IRQ_CPU	(DSS_GLB0_OFFSET + 0x320)
+#define GLB_DBG_IRQ_MCU	(DSS_GLB0_OFFSET + 0x324)
+//glb reserved
+#define GLB_TP_SEL	(DSS_GLB0_OFFSET + 0x0400)
+#define GLB_CRC_DBG_LDI0	(DSS_GLB0_OFFSET + 0x0404)
+#define GLB_CRC_DBG_LDI1	(DSS_GLB0_OFFSET + 0x0408)
+#define GLB_CRC_LDI0_EN	(DSS_GLB0_OFFSET + 0x040C)
+#define GLB_CRC_LDI0_FRM	(DSS_GLB0_OFFSET + 0x0410)
+#define GLB_CRC_LDI1_EN	(DSS_GLB0_OFFSET + 0x0414)
+#define GLB_CRC_LDI1_FRM	(DSS_GLB0_OFFSET + 0x0418)
+//memory lowpower
+#define GLB_DSS_MEM_CTRL	(DSS_GLB0_OFFSET + 0x0600)
+#define GLB_DSS_PM_CTRL	(DSS_GLB0_OFFSET + 0x0604)
+
+/*******************************************************************************
+** DBG
+*/
+#define DBG_CRC_DBG_OV0	(0x0000)
+#define DBG_CRC_DBG_OV1	(0x0004)
+#define DBG_CRC_DBG_SUM	(0x0008)
+#define DBG_CRC_OV0_EN	(0x000C)
+#define DBG_DSS_GLB_DBG_O	(0x0010)
+#define DBG_DSS_GLB_DBG_I	(0x0014)
+#define DBG_CRC_OV0_FRM	(0x0018)
+#define DBG_CRC_OV1_EN	(0x001C)
+#define DBG_CRC_OV1_FRM	(0x0020)
+#define DBG_CRC_SUM_EN	(0x0024)
+#define DBG_CRC_SUM_FRM	(0x0028)
+//second class interrupt
+#define DBG_MCTL_INTS	(0x023C)
+#define DBG_MCTL_INT_MSK	(0x0240)
+#define DBG_WCH0_INTS	(0x0244)
+#define DBG_WCH0_INT_MSK	(0x0248)
+#define DBG_WCH1_INTS	(0x024C)
+#define DBG_WCH1_INT_MSK	(0x0250)
+#define DBG_RCH0_INTS	(0x0254)
+#define DBG_RCH0_INT_MSK	(0x0258)
+#define DBG_RCH1_INTS	(0x025C)
+#define DBG_RCH1_INT_MSK	(0x0260)
+#define DBG_RCH2_INTS	(0x0264)
+#define DBG_RCH2_INT_MSK	(0x0268)
+#define DBG_RCH3_INTS	(0x026C)
+#define DBG_RCH3_INT_MSK	(0x0270)
+#define DBG_RCH4_INTS	(0x0274)
+#define DBG_RCH4_INT_MSK	(0x0278)
+#define DBG_RCH5_INTS	(0x027C)
+#define DBG_RCH5_INT_MSK	(0x0280)
+#define DBG_RCH6_INTS	(0x0284)
+#define DBG_RCH6_INT_MSK	(0x0288)
+#define DBG_RCH7_INTS	(0x028C)
+#define DBG_RCH7_INT_MSK	(0x0290)
+#define DBG_DSS_GLB_INTS	(0x0294)
+#define DBG_DSS_GLB_INT_MSK	(0x0298)
+#define DBG_WCH2_INTS	(0x029C)
+#define DBG_WCH2_INT_MSK	(0x02A0)
+#define DBG_RCH8_INTS	(0x02A4)
+#define DBG_RCH8_INT_MSK	(0x02A8)
+
+/*******************************************************************************
+** CMDLIST
+*/
+//DSS_CMD_OFFSET +  CMDLIST_CH0_* + 0x40 * i
+#define CMDLIST_CH0_PENDING_CLR	(0x0000)
+#define CMDLIST_CH0_CTRL	(0x0004)
+#define CMDLIST_CH0_STATUS	(0x0008)
+#define CMDLIST_CH0_STAAD	(0x000C)
+#define CMDLIST_CH0_CURAD	(0x0010)
+#define CMDLIST_CH0_INTE	(0x0014)
+#define CMDLIST_CH0_INTC	(0x0018)
+#define CMDLIST_CH0_INTS	(0x001C)
+#define CMDLIST_CH0_SCENE	(0x0020)
+#define CMDLIST_CH0_DBG	(0x0028)
+
+#define CMDLIST_DBG	(0x0700)
+#define CMDLIST_BUF_DBG_EN	(0x0704)
+#define CMDLIST_BUF_DBG_CNT_CLR	(0x0708)
+#define CMDLIST_BUF_DBG_CNT	(0x070C)
+#define CMDLIST_TIMEOUT_TH	(0x0710)
+#define CMDLIST_START	(0x0714)
+#define CMDLIST_ADDR_MASK_EN	(0x0718)
+#define CMDLIST_ADDR_MASK_DIS	(0x071C)
+#define CMDLIST_ADDR_MASK_STATUS	(0x0720)
+#define CMDLIST_TASK_CONTINUE	(0x0724)
+#define CMDLIST_TASK_STATUS	(0x0728)
+#define CMDLIST_CTRL	(0x072C)
+#define CMDLIST_SECU	(0x0730)
+#define CMDLIST_INTS	(0x0734)
+#define CMDLIST_SWRST	(0x0738)
+#define CMD_MEM_CTRL	(0x073C)
+#define CMD_CLK_SEL		(0x0740)
+#define CMD_CLK_EN	(0x0744)
+
+#define HISI_DSS_MIN_ROT_AFBCE_BLOCK_SIZE (256)
+#define HISI_DSS_MAX_ROT_AFBCE_BLOCK_SIZE (480)
+
+//cmdlist channel interrupt status  0x1c
+#define BIT_CMDLIST_CH_TASKDONE_INTS	    BIT(7)
+#define BIT_CMDLIST_CH_TIMEOUT_INTS	    BIT(6)
+#define BIT_CMDLIST_CH_BADCMD_INTS	    BIT(5)
+#define BIT_CMDLIST_CH_START_INTS	           BIT(4)
+#define BIT_CMDLIST_CH_PENDING_INTS	    BIT(3)
+#define BIT_CMDLIST_CH_AXIERR_INTS	    BIT(2)
+#define BIT_CMDLIST_CH_ALLDONE_INTS	    BIT(1)
+#define BIT_CMDLIST_CH_ONEDONE_INTS	    BIT(0)
+//cmdlist interrupt status 0x734
+#define BIT_CMDLIST_CH15_INTS	BIT(15)
+#define BIT_CMDLIST_CH14_INTS	BIT(14)
+#define BIT_CMDLIST_CH13_INTS	BIT(13)
+#define BIT_CMDLIST_CH12_INTS	BIT(12)
+#define BIT_CMDLIST_CH11_INTS	BIT(11)
+#define BIT_CMDLIST_CH10_INTS	BIT(10)
+#define BIT_CMDLIST_CH9_INTS	BIT(9)
+#define BIT_CMDLIST_CH8_INTS	BIT(8)
+#define BIT_CMDLIST_CH7_INTS	BIT(7)
+#define BIT_CMDLIST_CH6_INTS	BIT(6)
+#define BIT_CMDLIST_CH5_INTS	BIT(5)
+#define BIT_CMDLIST_CH4_INTS	BIT(4)
+#define BIT_CMDLIST_CH3_INTS	BIT(3)
+#define BIT_CMDLIST_CH2_INTS	BIT(2)
+#define BIT_CMDLIST_CH1_INTS	BIT(1)
+#define BIT_CMDLIST_CH0_INTS	BIT(0)
+
+/*******************************************************************************
+** AIF
+*/
+#define AIF0_CH0_OFFSET		(DSS_VBIF0_AIF + 0x00)
+#define AIF0_CH1_OFFSET		(DSS_VBIF0_AIF + 0x20)
+#define AIF0_CH2_OFFSET		(DSS_VBIF0_AIF + 0x40)
+#define AIF0_CH3_OFFSET		(DSS_VBIF0_AIF + 0x60)
+#define AIF0_CH4_OFFSET		(DSS_VBIF0_AIF + 0x80)
+#define AIF0_CH5_OFFSET		(DSS_VBIF0_AIF + 0xA0)
+#define AIF0_CH6_OFFSET		(DSS_VBIF0_AIF + 0xC0)
+#define AIF0_CH7_OFFSET		(DSS_VBIF0_AIF + 0xE0)
+#define AIF0_CH8_OFFSET		(DSS_VBIF0_AIF + 0x100)
+#define AIF0_CH9_OFFSET		(DSS_VBIF0_AIF + 0x120)
+#define AIF0_CH10_OFFSET	(DSS_VBIF0_AIF + 0x140)
+#define AIF0_CH11_OFFSET	(DSS_VBIF0_AIF + 0x160)
+#define AIF0_CH12_OFFSET	(DSS_VBIF0_AIF + 0x180)
+
+#define AIF1_CH0_OFFSET		(DSS_VBIF1_AIF + 0x00)
+#define AIF1_CH1_OFFSET		(DSS_VBIF1_AIF + 0x20)
+#define AIF1_CH2_OFFSET		(DSS_VBIF1_AIF + 0x40)
+#define AIF1_CH3_OFFSET		(DSS_VBIF1_AIF + 0x60)
+#define AIF1_CH4_OFFSET		(DSS_VBIF1_AIF + 0x80)
+#define AIF1_CH5_OFFSET		(DSS_VBIF1_AIF + 0xA0)
+#define AIF1_CH6_OFFSET		(DSS_VBIF1_AIF + 0xC0)
+#define AIF1_CH7_OFFSET		(DSS_VBIF1_AIF + 0xE0)
+#define AIF1_CH8_OFFSET		(DSS_VBIF1_AIF + 0x100)
+#define AIF1_CH9_OFFSET		(DSS_VBIF1_AIF + 0x120)
+#define AIF1_CH10_OFFSET	(DSS_VBIF1_AIF + 0x140)
+#define AIF1_CH11_OFFSET	(DSS_VBIF1_AIF + 0x160)
+#define AIF1_CH12_OFFSET	(DSS_VBIF1_AIF + 0x180)
+
+/* aif dmax */
+//(0x0000+0x20*n)
+#define AIF_CH_CTL	(0x0000)
+//(0x0004+0x20*n)  //ES
+#define AIF_CH_CTL_ADD 	(0x0004)
+//(0x0004+0x20*n)
+#define AIF_CH_HS 	(0x0004)
+//(0x0008+0x20*n)
+#define AIF_CH_LS 	(0x0008)
+
+/* aif common */
+#define AXI0_RID_MSK0	(0x0800)
+#define AXI0_RID_MSK1	(0x0804)
+#define AXI0_WID_MSK	(0x0808)
+#define AXI0_R_QOS_MAP	(0x080c)
+#define AXI1_RID_MSK0	(0x0810)
+#define AXI1_RID_MSK1	(0x0814)
+#define AXI1_WID_MSK	(0x0818)
+#define AXI1_R_QOS_MAP	(0x081c)
+#define AIF_CLK_SEL0	(0x0820)
+#define AIF_CLK_SEL1	(0x0824)
+#define AIF_CLK_EN0	(0x0828)
+#define AIF_CLK_EN1	(0x082c)
+#define MONITOR_CTRL	(0x0830)
+#define MONITOR_TIMER_INI	(0x0834)
+#define DEBUG_BUF_BASE	(0x0838)
+#define DEBUG_CTRL	(0x083C)
+#define AIF_SHADOW_READ	(0x0840)
+#define AIF_MEM_CTRL	(0x0844)
+#define AIF_MONITOR_EN	(0x0848)
+#define AIF_MONITOR_CTRL	(0x084C)
+#define AIF_MONITOR_SAMPLE_MUN	(0x0850)
+#define AIF_MONITOR_SAMPLE_TIME	(0x0854)
+#define AIF_MONITOR_SAMPLE_FLOW	(0x0858)
+
+/* aif debug */
+#define AIF_MONITOR_READ_DATA	(0x0880)
+#define AIF_MONITOR_WRITE_DATA	(0x0884)
+#define AIF_MONITOR_WINDOW_CYCLE	(0x0888)
+#define AIF_MONITOR_WBURST_CNT	(0x088C)
+#define AIF_MONITOR_MIN_WR_CYCLE	(0x0890)
+#define AIF_MONITOR_MAX_WR_CYCLE	(0x0894)
+#define AIF_MONITOR_AVR_WR_CYCLE	(0x0898)
+#define AIF_MONITOR_MIN_WRW_CYCLE	(0x089C)
+#define AIF_MONITOR_MAX_WRW_CYCLE	(0x08A0)
+#define AIF_MONITOR_AVR_WRW_CYCLE	(0x08A4)
+#define AIF_MONITOR_RBURST_CNT	(0x08A8)
+#define AIF_MONITOR_MIN_RD_CYCLE	(0x08AC)
+#define AIF_MONITOR_MAX_RD_CYCLE	(0x08B0)
+#define AIF_MONITOR_AVR_RD_CYCLE	(0x08B4)
+#define AIF_MONITOR_MIN_RDW_CYCLE	(0x08B8)
+#define AIF_MONITOR_MAX_RDW_CYCLE	(0x08BC)
+#define AIF_MONITOR_AVR_RDW_CYCLE	(0x08C0)
+#define AIF_CH_STAT_0	(0x08C4)
+#define AIF_CH_STAT_1	(0x08C8)
+//axi mm_axi clock area, first class gating
+#define AIF_MODULE_CLK_SEL	(0x0A04)
+#define AIF_MODULE_CLK_EN	(0x0A08)
+
+typedef struct dss_aif {
+	uint32_t aif_ch_ctl;
+	uint32_t aif_ch_ctl_add;  //ES
+	uint32_t aif_ch_hs;
+	uint32_t aif_ch_ls;
+} dss_aif_t;
+
+typedef struct dss_aif_bw {
+	uint64_t bw;
+	uint8_t chn_idx;
+	int8_t axi_sel;
+	uint8_t is_used;
+} dss_aif_bw_t;
+
+/*******************************************************************************
+** MIF
+*/
+#define MIF_ENABLE	(0x0000)
+#define MIF_MEM_CTRL	(0x0004)
+
+#define MIF_CTRL0	(0x000)
+#define MIF_CTRL1	(0x004)
+#define MIF_CTRL2	(0x008)
+#define MIF_CTRL3	(0x00C)
+#define MIF_CTRL4	(0x010)
+#define MIF_CTRL5	(0x014)
+#define REG_DEFAULT (0x0500)
+#define MIF_SHADOW_READ	(0x0504)
+#define MIF_CLK_CTL	(0x0508)
+//0x0160+16*k
+#define MIF_STAT0	(0x0600)
+//0x0164+16*k
+#define MIF_STAT1	(0x0604)
+//0x0168+16*k
+#define MIF_STAT2	(0x0608)
+
+#define MIF_CTRL_OFFSET	(0x20)
+#define MIF_CH0_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*1)
+#define MIF_CH1_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*2)
+#define MIF_CH2_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*3)
+#define MIF_CH3_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*4)
+#define MIF_CH4_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*5)
+#define MIF_CH5_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*6)
+#define MIF_CH6_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*7)
+#define MIF_CH7_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*8)
+#define MIF_CH8_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*9)
+#define MIF_CH9_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*10)
+#define MIF_CH10_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*11)
+#define MIF_CH11_OFFSET	(DSS_MIF_OFFSET + MIF_CTRL_OFFSET*12)
+#define MIF_CTRL_NUM	(12)
+
+
+#define LITTLE_LAYER_BUF_SIZE	(256 * 1024)
+#define MIF_STRIDE_UNIT (4 * 1024)
+
+typedef struct dss_mif {
+	uint32_t mif_ctrl1;
+	uint32_t mif_ctrl2;
+	uint32_t mif_ctrl3;
+	uint32_t mif_ctrl4;
+	uint32_t mif_ctrl5;
+} dss_mif_t;
+
+/*
+** stretch blt, linear/tile, rotation, pixel format
+** 0 0 000
+*/
+enum dss_mmu_tlb_tag_org {
+	MMU_TLB_TAG_ORG_0x0 = 0x0,
+	MMU_TLB_TAG_ORG_0x1 = 0x1,
+	MMU_TLB_TAG_ORG_0x2 = 0x2,
+	MMU_TLB_TAG_ORG_0x3 = 0x3,
+	MMU_TLB_TAG_ORG_0x4 = 0x4,
+	MMU_TLB_TAG_ORG_0x7 = 0x7,
+
+	MMU_TLB_TAG_ORG_0x8 = 0x8,
+	MMU_TLB_TAG_ORG_0x9 = 0x9,
+	MMU_TLB_TAG_ORG_0xA = 0xA,
+	MMU_TLB_TAG_ORG_0xB = 0xB,
+	MMU_TLB_TAG_ORG_0xC = 0xC,
+	MMU_TLB_TAG_ORG_0xF = 0xF,
+
+	MMU_TLB_TAG_ORG_0x10 = 0x10,
+	MMU_TLB_TAG_ORG_0x11 = 0x11,
+	MMU_TLB_TAG_ORG_0x12 = 0x12,
+	MMU_TLB_TAG_ORG_0x13 = 0x13,
+	MMU_TLB_TAG_ORG_0x14 = 0x14,
+	MMU_TLB_TAG_ORG_0x17 = 0x17,
+
+	MMU_TLB_TAG_ORG_0x18 = 0x18,
+	MMU_TLB_TAG_ORG_0x19 = 0x19,
+	MMU_TLB_TAG_ORG_0x1A = 0x1A,
+	MMU_TLB_TAG_ORG_0x1B = 0x1B,
+	MMU_TLB_TAG_ORG_0x1C = 0x1C,
+	MMU_TLB_TAG_ORG_0x1F = 0x1F,
+};
+
+/*******************************************************************************
+**SMMU
+*/
+#define SMMU_SCR	(0x0000)
+#define SMMU_MEMCTRL	(0x0004)
+#define SMMU_LP_CTRL	(0x0008)
+#define SMMU_PRESS_REMAP	(0x000C)
+#define SMMU_INTMASK_NS	(0x0010)
+#define SMMU_INTRAW_NS	(0x0014)
+#define SMMU_INTSTAT_NS	(0x0018)
+#define SMMU_INTCLR_NS	(0x001C)
+//(0x0020+n*0x4)
+#define SMMU_SMRx_NS	(0x0020)
+#define SMMU_RLD_EN0_NS	(0x01F0)
+#define SMMU_RLD_EN1_NS	(0x01F4)
+#define SMMU_RLD_EN2_NS	(0x01F8)
+#define SMMU_CB_SCTRL	(0x0200)
+#define SMMU_CB_TTBR0	(0x0204)
+#define SMMU_CB_TTBR1	(0x0208)
+#define SMMU_CB_TTBCR	(0x020C)
+#define SMMU_OFFSET_ADDR_NS	(0x0210)
+#define SMMU_SCACHEI_ALL	(0x0214)
+#define SMMU_SCACHEI_L1	(0x0218)
+#define SMMU_SCACHEI_L2L3	(0x021C)
+#define SMMU_FAMA_CTRL0	(0x0220)
+#define SMMU_FAMA_CTRL1	(0x0224)
+#define SMMU_ADDR_MSB	(0x0300)
+#define SMMU_ERR_RDADDR	(0x0304)
+#define SMMU_ERR_WRADDR	(0x0308)
+#define SMMU_FAULT_ADDR_TCU (0x0310)
+#define SMMU_FAULT_ID_TCU	(0x0314)
+//(0x0320+n*0x10)
+#define SMMU_FAULT_ADDR_TBUx	(0x0320)
+#define SMMU_FAULT_ID_TBUx	(0x0324)
+#define SMMU_FAULT_INFOx	(0x0328)
+#define SMMU_DBGRPTR_TLB	(0x0380)
+#define SMMU_DBGRDATA_TLB	(0x0380)
+#define SMMU_DBGRDATA0_CACHE	(0x038C)
+#define SMMU_DBGRDATA1_CACHE	(0x0390)
+#define SMMU_DBGAXI_CTRL	(0x0394)
+#define SMMU_OVA_ADDR	(0x0398)
+#define SMMU_OPA_ADDR	(0x039C)
+#define SMMU_OVA_CTRL	(0x03A0)
+#define SMMU_OPREF_ADDR	(0x03A4)
+#define SMMU_OPREF_CTRL	(0x03A8)
+#define SMMU_OPREF_CNT	(0x03AC)
+//(0x0500+n*0x4)
+#define SMMU_SMRx_S	(0x0500)
+#define SMMU_RLD_EN0_S	(0x06F0)
+#define SMMU_RLD_EN1_S	(0x06F4)
+#define SMMU_RLD_EN2_S	(0x06F8)
+#define SMMU_INTMAS_S	(0x0700)
+#define SMMU_INTRAW_S	(0x0704)
+#define SMMU_INTSTAT_S	(0x0708)
+#define SMMU_INTCLR_S	(0x070C)
+#define SMMU_SCR_S	(0x0710)
+#define SMMU_SCB_SCTRL	(0x0714)
+#define SMMU_SCB_TTBR	(0x0718)
+#define SMMU_SCB_TTBCR	(0x071C)
+#define SMMU_OFFSET_ADDR_S	(0x0720)
+
+#define SMMU_SMRx_P	(0x10000)
+#define SMMU_RLD_EN0_P	(0x101F0)
+#define SMMU_RLD_EN1_P	(0x101F4)
+#define SMMU_RLD_EN2_P	(0x101F8)
+#define SMMU_INTMAS_P	(0x10200)
+#define SMMU_INTRAW_P	(0x10204)
+#define SMMU_INTSTAT_P	(0x10208)
+#define SMMU_INTCLR_P	(0x1020C)
+#define SMMU_SCR_P		(0x10210)
+#define SMMU_PCB_SCTRL	(0x10214)
+#define SMMU_PCB_TTBR	(0x10218)
+#define SMMU_PCB_TTBCR	(0x1021C)
+#define SMMU_OFFSET_ADDR_P	(0x10220)
+
+#define SMMU_SID_NUM	(64)
+
+typedef struct dss_smmu {
+	uint32_t smmu_scr;
+	uint32_t smmu_memctrl;
+	uint32_t smmu_lp_ctrl;
+	uint32_t smmu_press_remap;
+	uint32_t smmu_intmask_ns;
+	uint32_t smmu_intraw_ns;
+	uint32_t smmu_intstat_ns;
+	uint32_t smmu_intclr_ns;
+	uint32_t smmu_smrx_ns[SMMU_SID_NUM];
+	uint32_t smmu_rld_en0_ns;
+	uint32_t smmu_rld_en1_ns;
+	uint32_t smmu_rld_en2_ns;
+	uint32_t smmu_cb_sctrl;
+	uint32_t smmu_cb_ttbr0;
+	uint32_t smmu_cb_ttbr1;
+	uint32_t smmu_cb_ttbcr;
+	uint32_t smmu_offset_addr_ns;
+	uint32_t smmu_scachei_all;
+	uint32_t smmu_scachei_l1;
+	uint32_t smmu_scachei_l2l3;
+	uint32_t smmu_fama_ctrl0_ns;
+	uint32_t smmu_fama_ctrl1_ns;
+	uint32_t smmu_addr_msb;
+	uint32_t smmu_err_rdaddr;
+	uint32_t smmu_err_wraddr;
+	uint32_t smmu_fault_addr_tcu;
+	uint32_t smmu_fault_id_tcu;
+	uint32_t smmu_fault_addr_tbux;
+	uint32_t smmu_fault_id_tbux;
+	uint32_t smmu_fault_infox;
+	uint32_t smmu_dbgrptr_tlb;
+	uint32_t smmu_dbgrdata_tlb;
+	uint32_t smmu_dbgrptr_cache;
+	uint32_t smmu_dbgrdata0_cache;
+	uint32_t smmu_dbgrdata1_cache;
+	uint32_t smmu_dbgaxi_ctrl;
+	uint32_t smmu_ova_addr;
+	uint32_t smmu_opa_addr;
+	uint32_t smmu_ova_ctrl;
+	uint32_t smmu_opref_addr;
+	uint32_t smmu_opref_ctrl;
+	uint32_t smmu_opref_cnt;
+	uint32_t smmu_smrx_s[SMMU_SID_NUM];
+	uint32_t smmu_rld_en0_s;
+	uint32_t smmu_rld_en1_s;
+	uint32_t smmu_rld_en2_s;
+	uint32_t smmu_intmas_s;
+	uint32_t smmu_intraw_s;
+	uint32_t smmu_intstat_s;
+	uint32_t smmu_intclr_s;
+	uint32_t smmu_scr_s;
+	uint32_t smmu_scb_sctrl;
+	uint32_t smmu_scb_ttbr;
+	uint32_t smmu_scb_ttbcr;
+	uint32_t smmu_offset_addr_s;
+
+	uint8_t smmu_smrx_ns_used[DSS_CHN_MAX_DEFINE];
+} dss_smmu_t;
+
+/*******************************************************************************
+** RDMA
+*/
+
+//DMA_CMN
+#define DMA_OFT_X0	(0x0000)
+#define DMA_OFT_Y0	(0x0004)
+#define DMA_OFT_X1	(0x0008)
+#define DMA_OFT_Y1	(0x000C)
+#define DMA_MASK0	(0x0010)
+#define DMA_MASK1	(0x0014)
+#define DMA_STRETCH_SIZE_VRT	(0x0018)
+#define DMA_CTRL	(0x001C)
+#define DMA_TILE_SCRAM	(0x0020)
+
+#define DMA_PULSE	(0x0028)
+#define DMA_CORE_GT	(0x002C)
+#define RWCH_CFG0	(0x0030)
+
+//WDMA_CMN
+#define WDMA_DMA_SW_MASK_EN	(0x004C)
+#define WDMA_DMA_START_MASK0	(0x0050)
+#define WDMA_DMA_END_MASK0	(0x0054)
+#define WDMA_DMA_START_MASK1	(0x0058)
+#define WDMA_DMA_END_MASK1	(0x005C)
+
+//Y
+#define DMA_DATA_ADDR0	(0x0060)
+#define DMA_STRIDE0	(0x0064)
+#define DMA_STRETCH_STRIDE0	(0x0068)
+#define DMA_DATA_NUM0	(0x006C)
+
+#define DMA_TEST0	(0x0070)
+#define DMA_TEST1	(0x0074)
+#define DMA_TEST3	(0x0078)
+#define DMA_TEST4	(0x007C)
+#define DMA_STATUS_Y	(0x0080)
+
+//U
+#define DMA_DATA_ADDR1	(0x0084)
+#define DMA_STRIDE1	(0x0088)
+#define DMA_STRETCH_STRIDE1	(0x008C)
+#define DMA_DATA_NUM1	(0x0090)
+
+#define DMA_TEST0_U	(0x0094)
+#define DMA_TEST1_U	(0x0098)
+#define DMA_TEST3_U	(0x009C)
+#define DMA_TEST4_U	(0x00A0)
+#define DMA_STATUS_U	(0x00A4)
+
+//V
+#define DMA_DATA_ADDR2	(0x00A8)
+#define DMA_STRIDE2	(0x00AC)
+#define DMA_STRETCH_STRIDE2	(0x00B0)
+#define DMA_DATA_NUM2	(0x00B4)
+
+#define DMA_TEST0_V	(0x00B8)
+#define DMA_TEST1_V	(0x00BC)
+#define DMA_TEST3_V	(0x00C0)
+#define DMA_TEST4_V	(0x00C4)
+#define DMA_STATUS_V	(0x00C8)
+
+//CH
+#define CH_RD_SHADOW	(0x00D0)
+#define CH_CTL	(0x00D4)
+#define CH_SECU_EN	(0x00D8)
+#define CH_SW_END_REQ	(0x00DC)
+#define CH_CLK_SEL	(0x00E0)
+#define CH_CLK_EN	(0x00E4)
+
+/*******************************************************************************
+** DFC
+*/
+#define DFC_DISP_SIZE		(0x0000)
+#define DFC_PIX_IN_NUM		(0x0004)
+#define DFC_GLB_ALPHA01		(0x0008)
+#define DFC_DISP_FMT		(0x000C)
+#define DFC_CLIP_CTL_HRZ	(0x0010)
+#define DFC_CLIP_CTL_VRZ	(0x0014)
+#define DFC_CTL_CLIP_EN		(0x0018)
+#define DFC_ICG_MODULE		(0x001C)
+#define DFC_DITHER_ENABLE	(0x0020)
+#define DFC_PADDING_CTL		(0x0024)
+#define DFC_GLB_ALPHA23		(0x0028)
+#define DFC_BITEXT_CTL		(0x0040)
+#define DFC_DITHER_CTL1      (0x00D0)
+
+typedef struct dss_dfc {
+	uint32_t disp_size;
+	uint32_t pix_in_num;
+	uint32_t disp_fmt;
+	uint32_t clip_ctl_hrz;
+	uint32_t clip_ctl_vrz;
+	uint32_t ctl_clip_en;
+	uint32_t icg_module;
+	uint32_t dither_enable;
+	uint32_t padding_ctl;
+	uint32_t bitext_ctl;
+} dss_dfc_t;
+
+/*******************************************************************************
+** SCF
+*/
+#define DSS_SCF_H0_Y_COEF_OFFSET	(0x0000)
+#define DSS_SCF_Y_COEF_OFFSET	(0x2000)
+#define DSS_SCF_UV_COEF_OFFSET	(0x2800)
+
+#define SCF_EN_HSCL_STR	(0x0000)
+#define SCF_EN_VSCL_STR	(0x0004)
+#define SCF_H_V_ORDER	(0x0008)
+#define SCF_SCF_CORE_GT	(0x000C)
+#define SCF_INPUT_WIDTH_HEIGHT	(0x0010)
+#define SCF_OUTPUT_WIDTH_HEIGHT	(0x0014)
+#define SCF_COEF_MEM_CTRL  (0x0018)
+#define SCF_EN_HSCL	(0x001C)
+#define SCF_EN_VSCL	(0x0020)
+#define SCF_ACC_HSCL	(0x0024)
+#define SCF_ACC_HSCL1	(0x0028)
+#define SCF_INC_HSCL	(0x0034)
+#define SCF_ACC_VSCL	(0x0038)
+#define SCF_ACC_VSCL1	(0x003C)
+#define SCF_INC_VSCL	(0x0048)
+#define SCF_EN_NONLINEAR	(0x004C)
+#define SCF_EN_MMP	(0x007C)
+#define SCF_DB_H0	(0x0080)
+#define SCF_DB_H1	(0x0084)
+#define SCF_DB_V0	(0x0088)
+#define SCF_DB_V1	(0x008C)
+#define SCF_LB_MEM_CTRL	(0x0090)
+#define SCF_RD_SHADOW	(0x00F0)
+#define SCF_CLK_SEL	(0x00F8)
+#define SCF_CLK_EN	(0x00FC)
+#define WCH_SCF_COEF_MEM_CTRL (0x0218)
+#define WCH_SCF_LB_MEM_CTRL 	(0x290)
+
+/* MACROS */
+#define SCF_MIN_INPUT	(16) //SCF min input pix 16x16
+#define SCF_MIN_OUTPUT	(16) //SCF min output pix 16x16
+
+/* Threshold for SCF Stretch and SCF filter */
+#define RDMA_STRETCH_THRESHOLD	(2)
+#define SCF_INC_FACTOR	(1 << 18) //(262144)
+#define SCF_UPSCALE_MAX	(60)
+#define SCF_DOWNSCALE_MAX	  (60)
+#define SCF_EDGE_FACTOR (3)
+#define ARSR2P_INC_FACTOR (65536)
+
+typedef struct dss_scl {
+	uint32_t en_hscl_str;
+	uint32_t en_vscl_str;
+	uint32_t h_v_order;
+	uint32_t input_width_height;
+	uint32_t output_width_height;
+	uint32_t en_hscl;
+	uint32_t en_vscl;
+	uint32_t acc_hscl;
+	uint32_t inc_hscl;
+	uint32_t inc_vscl;
+	uint32_t en_mmp;
+	uint32_t scf_ch_core_gt;
+	uint32_t fmt;
+} dss_scl_t;
+
+enum scl_coef_lut_idx {
+	SCL_COEF_NONE_IDX = -1,
+	SCL_COEF_YUV_IDX = 0,
+	SCL_COEF_RGB_IDX = 1,
+	SCL_COEF_IDX_MAX = 2,
+};
+
+/*******************************************************************************
+** ARSR2P ES  v0
+*/
+#define ARSR2P_INPUT_WIDTH_HEIGHT_ES	(0x000)
+#define ARSR2P_OUTPUT_WIDTH_HEIGHT_ES	(0x004)
+#define ARSR2P_IHLEFT_ES	(0x008)
+#define ARSR2P_IHRIGHT_ES	(0x00C)
+#define ARSR2P_IVTOP_ES		(0x010)
+#define ARSR2P_IVBOTTOM_ES	(0x014)
+#define ARSR2P_IHINC_ES		(0x018)
+#define ARSR2P_IVINC_ES		(0x01C)
+#define ARSR2P_UV_OFFSET_ES	(0x020)
+#define ARSR2P_MODE_ES		(0x024)
+#define ARSR2P_SKIN_THRES_Y_ES	(0x028)
+#define ARSR2P_SKIN_THRES_U_ES	(0x02C)
+#define ARSR2P_SKIN_THRES_V_ES	(0x030)
+#define ARSR2P_SKIN_CFG0_ES	(0x034)
+#define ARSR2P_SKIN_CFG1_ES	(0x038)
+#define ARSR2P_SKIN_CFG2_ES	(0x03C)
+#define ARSR2P_SHOOT_CFG1_ES	(0x040)
+#define ARSR2P_SHOOT_CFG2_ES	(0x044)
+#define ARSR2P_SHARP_CFG1_ES	(0x048)
+#define ARSR2P_SHARP_CFG2_ES	(0x04C)
+#define ARSR2P_SHARP_CFG3_ES	(0x050)
+#define ARSR2P_SHARP_CFG4_ES	(0x054)
+#define ARSR2P_SHARP_CFG5_ES	(0x058)
+#define ARSR2P_SHARP_CFG6_ES	(0x05C)
+#define ARSR2P_SHARP_CFG7_ES	(0x060)
+#define ARSR2P_SHARP_CFG8_ES	(0x064)
+#define ARSR2P_SHARP_CFG9_ES	(0x068)
+#define ARSR2P_TEXTURW_ANALYSTS_ES	(0x06C)
+#define ARSR2P_INTPLSHOOTCTRL_ES	(0x070)
+#define ARSR2P_DEBUG0_ES	(0x074)
+#define ARSR2P_DEBUG1_ES	(0x078)
+#define ARSR2P_DEBUG2_ES	(0x07C)
+#define ARSR2P_DEBUG3_ES	(0x080)
+#define ARSR2P_LB_MEM_CTRL_ES	(0x084)
+#define ARSR2P_IHLEFT1_ES	(0x088)
+#define ARSR2P_IHRIGHT1_ES	(0x090)
+#define ARSR2P_IVBOTTOM1_ES	(0x094)
+
+#define ARSR2P_LUT_COEFY_V_OFFSET_ES	(0x0000)
+#define ARSR2P_LUT_COEFY_H_OFFSET_ES	(0x0100)
+#define ARSR2P_LUT_COEFA_V_OFFSET_ES	(0x0300)
+#define ARSR2P_LUT_COEFA_H_OFFSET_ES	(0x0400)
+#define ARSR2P_LUT_COEFUV_V_OFFSET_ES	(0x0600)
+#define ARSR2P_LUT_COEFUV_H_OFFSET_ES	(0x0700)
+
+
+/*******************************************************************************
+** ARSR2P  v0
+*/
+#define ARSR2P_INPUT_WIDTH_HEIGHT (0x000)
+#define ARSR2P_OUTPUT_WIDTH_HEIGHT (0x004)
+#define ARSR2P_IHLEFT (0x008)
+#define ARSR2P_IHLEFT1 (0x00C)
+#define ARSR2P_IHRIGHT (0x010)
+#define ARSR2P_IHRIGHT1 (0x014)
+#define ARSR2P_IVTOP (0x018)
+#define ARSR2P_IVBOTTOM (0x01C)
+#define ARSR2P_IVBOTTOM1 (0x020)
+#define ARSR2P_IHINC (0x024)
+#define ARSR2P_IVINC (0x028)
+#define ARSR2P_OFFSET (0x02C)
+#define ARSR2P_MODE (0x030)
+#define ARSR2P_SKIN_THRES_Y (0x034)
+#define ARSR2P_SKIN_THRES_U (0x038)
+#define ARSR2P_SKIN_THRES_V (0x03C)
+#define ARSR2P_SKIN_CFG0 (0x040)
+#define ARSR2P_SKIN_CFG1 (0x044)
+#define ARSR2P_SKIN_CFG2 (0x048)
+#define ARSR2P_SHOOT_CFG1 (0x04C)
+#define ARSR2P_SHOOT_CFG2 (0x050)
+#define ARSR2P_SHOOT_CFG3 (0x054)
+#define ARSR2P_SHARP_CFG1 (0x080)
+#define ARSR2P_SHARP_CFG2 (0x084)
+#define ARSR2P_SHARP_CFG3 (0x088)
+#define ARSR2P_SHARP_CFG4 (0x08C)
+#define ARSR2P_SHARP_CFG5 (0x090)
+#define ARSR2P_SHARP_CFG6 (0x094)
+#define ARSR2P_SHARP_CFG7 (0x098)
+#define ARSR2P_SHARP_CFG8 (0x09C)
+#define ARSR2P_SHARP_CFG9 (0x0A0)
+#define ARSR2P_SHARP_CFG10 (0x0A4)
+#define ARSR2P_SHARP_CFG11 (0x0A8)
+#define ARSR2P_SHARP_CFG12 (0x0AC)
+#define ARSR2P_TEXTURW_ANALYSTS (0x0D0)
+#define ARSR2P_INTPLSHOOTCTRL (0x0D4)
+#define ARSR2P_DEBUG0 (0x0D8)
+#define ARSR2P_DEBUG1 (0x0DC)
+#define ARSR2P_DEBUG2 (0x0E0)
+#define ARSR2P_DEBUG3 (0x0E4)
+#define ARSR2P_LB_MEM_CTRL (0x0E8)
+
+#define ARSR2P_LUT_COEFY_V_OFFSET (0x0000)
+#define ARSR2P_LUT_COEFY_H_OFFSET (0x0100)
+#define ARSR2P_LUT_COEFA_V_OFFSET (0x0300)
+#define ARSR2P_LUT_COEFA_H_OFFSET (0x0400)
+#define ARSR2P_LUT_COEFUV_V_OFFSET (0x0600)
+#define ARSR2P_LUT_COEFUV_H_OFFSET (0x0700)
+
+/*******************************************************************************
+** POST_CLIP  v g
+*/
+#define POST_CLIP_DISP_SIZE			(0x0000)
+#define POST_CLIP_CTL_HRZ			(0x0004)
+#define POST_CLIP_CTL_VRZ			(0x0008)
+#define POST_CLIP_EN				(0x000C)
+
+#define POST_CLIP_DISP_SIZE_ES		(0x0000)
+#define POST_CLIP_CTL_HRZ_ES		(0x0010)
+#define POST_CLIP_CTL_VRZ_ES		(0x0014)
+#define POST_CLIP_EN_ES			(0x0018)
+
+typedef struct dss_post_clip{
+	uint32_t disp_size;
+	uint32_t clip_ctl_hrz;
+	uint32_t clip_ctl_vrz;
+	uint32_t ctl_clip_en;
+} dss_post_clip_t;
+
+/*******************************************************************************
+** PCSC v
+*/
+#define PCSC_IDC0	(0x0000)
+#define PCSC_IDC2	(0x0004)
+#define PCSC_ODC0	(0x0008)
+#define PCSC_ODC2	(0x000C)
+#define PCSC_P0	(0x0010)
+#define PCSC_P1	(0x0014)
+#define PCSC_P2	(0x0018)
+#define PCSC_P3	(0x001C)
+#define PCSC_P4	(0x0020)
+#define PCSC_ICG_MODULE	(0x0024)
+#define PCSC_MPREC	(0x0028)
+
+typedef struct dss_pcsc{
+	uint32_t pcsc_idc0;
+} dss_pcsc_t;
+
+/*******************************************************************************
+** CSC
+*/
+#define CSC_IDC0			(0x0000)
+#define CSC_IDC2			(0x0004)
+#define CSC_ODC0			(0x0008)
+#define CSC_ODC2			(0x000C)
+#define CSC_P0				(0x0010)
+#define CSC_P1				(0x0014)
+#define CSC_P2				(0x0018)
+#define CSC_P3				(0x001C)
+#define CSC_P4				(0x0020)
+#define CSC_ICG_MODULE_ES	(0x0024)
+#define CSC_MPREC			(0x0028)
+#define CSC_P00				(0x0010)
+#define CSC_P01				(0x0014)
+#define CSC_P02				(0x0018)
+#define CSC_P10				(0x001C)
+#define CSC_P11				(0x0020)
+#define CSC_P12				(0x0024)
+#define CSC_P20				(0x0028)
+#define CSC_P21				(0x002C)
+#define CSC_P22				(0x0030)
+#define CSC_ICG_MODULE		(0x0034)
+
+typedef struct dss_csc {
+	uint32_t idc0;
+	uint32_t idc2;
+	uint32_t odc0;
+	uint32_t odc2;
+	uint32_t p0;
+	uint32_t p1;
+	uint32_t p2;
+	uint32_t p3;
+	uint32_t p4;
+	uint32_t icg_module_es;
+	uint32_t mprec;
+	uint32_t p00;
+	uint32_t p01;
+	uint32_t p02;
+	uint32_t p10;
+	uint32_t p11;
+	uint32_t p12;
+	uint32_t p20;
+	uint32_t p21;
+	uint32_t p22;
+	uint32_t icg_module;
+} dss_csc_t;
+
+/*******************************************************************************
+**channel DEBUG
+*/
+#define CH_DEBUG_SEL (0x600)
+
+/*******************************************************************************
+** VPP
+*/
+#define VPP_CTRL (0x700)
+#define VPP_MEM_CTRL (0x704)
+
+/*******************************************************************************
+**DMA BUF
+*/
+#define DMA_BUF_CTRL	(0x800)
+#define DMA_BUF_SIZE  (0x850)
+#define DMA_BUF_MEM_CTRL	(0x854)
+#define DMA_BUF_DBG0 (0x0838)
+#define DMA_BUF_DBG1 (0x083c)
+
+
+//AFBCD
+#define AFBCD_HREG_HDR_PTR_LO		(0x900)
+#define AFBCD_HREG_PIC_WIDTH			(0x904)
+#define AFBCD_HREG_PIC_HEIGHT			(0x90C)
+#define AFBCD_HREG_FORMAT				(0x910)
+#define AFBCD_CTL						(0x914)
+#define AFBCD_STR						(0x918)
+#define AFBCD_LINE_CROP				(0x91C)
+#define AFBCD_INPUT_HEADER_STRIDE	(0x920)
+#define AFBCD_PAYLOAD_STRIDE			(0x924)
+#define AFBCD_MM_BASE_0				(0x928)
+#define AFBCD_AFBCD_PAYLOAD_POINTER	(0x930)
+#define AFBCD_HEIGHT_BF_STR			(0x934)
+#define AFBCD_OS_CFG					(0x938)
+#define AFBCD_MEM_CTRL					(0x93C)
+#define AFBCD_SCRAMBLE_MODE			(0x940)
+#define AFBCD_HEADER_POINTER_OFFSET	(0x944)
+#define AFBCD_MONITOR_REG1_OFFSET	(0x948)
+#define AFBCD_MONITOR_REG2_OFFSET	(0x94C)
+#define AFBCD_MONITOR_REG3_OFFSET	(0x950)
+#define AFBCD_DEBUG_REG0_OFFSET		(0x954)
+#define AFBCD_CREG_FBCD_CTRL_MODE  	(0x960)
+#define AFBCD_HREG_HDR_PTR_L1 		(0x964)
+#define AFBCD_HREG_PLD_PTR_L1 		(0x968)
+#define AFBCD_HEADER_SRTIDE_1 		(0x96C)
+#define AFBCD_PAYLOAD_SRTIDE_1	 	(0x970)
+#define AFBCD_HREG_HDR_PTR_L1 		(0x964)
+#define AFBCD_HREG_PLD_PTR_L1 		(0x968)
+#define AFBCD_HEADER_SRTIDE_1 		(0x96C)
+#define AFBCD_PAYLOAD_SRTIDE_1 		(0x970)
+#define AFBCD_BLOCK_TYPE				(0x974)
+#define AFBCD_MM_BASE_1				(0x978)
+#define AFBCD_MM_BASE_2				(0x97C)
+#define AFBCD_MM_BASE_3				(0x980)
+#define HFBCD_MEM_CTRL				(0x984)
+#define HFBCD_MEM_CTRL_1				(0x988)
+
+//AFBCE
+#define AFBCE_HREG_PIC_BLKS			(0x900)
+#define AFBCE_HREG_FORMAT				(0x904)
+#define AFBCE_HREG_HDR_PTR_L0 		(0x908)
+#define AFBCE_HREG_PLD_PTR_L0 		(0x90C)
+#define AFBCE_PICTURE_SIZE				(0x910)
+#define AFBCE_CTL						(0x914)
+#define AFBCE_HEADER_SRTIDE			(0x918)
+#define AFBCE_PAYLOAD_STRIDE			(0x91C)
+#define AFBCE_ENC_OS_CFG				(0x920)
+#define AFBCE_MEM_CTRL					(0x924)
+#define AFBCE_QOS_CFG					(0x928)
+#define AFBCE_THRESHOLD				(0x92C)
+#define AFBCE_SCRAMBLE_MODE			(0x930)
+#define AFBCE_HEADER_POINTER_OFFSET	(0x934)
+#define AFBCE_CREG_FBCE_CTRL_MODE  	(0x950)
+#define AFBCE_HREG_HDR_PTR_L1 		(0x954)
+#define AFBCE_HREG_PLD_PTR_L1 		(0x958)
+#define AFBCE_HEADER_SRTIDE_1 			(0x95C)
+#define AFBCE_PAYLOAD_SRTIDE_1 		(0x960)
+#define AFBCE_MEM_CTRL_1 				(0x968)
+#define FBCD_CREG_FBCD_CTRL_GATE		(0x98C)
+
+//ROT
+#define ROT_FIRST_LNS			(0x530)
+#define ROT_STATE				(0x534)
+#define ROT_MEM_CTRL_ES		(0x538)
+#define ROT_SIZE_ES 			(0x53C)
+#define ROT_CPU_CTL0			(0x540)
+#define ROT_CPU_START0			(0x544)
+#define ROT_CPU_ADDR0			(0x548)
+#define ROT_CPU_RDATA0		(0x54C)
+#define ROT_CPU_RDATA1		(0x550)
+#define ROT_CPU_WDATA0		(0x554)
+#define ROT_CPU_WDATA1		(0x558)
+#define ROT_CPU_CTL1			(0x55C)
+#define ROT_CPU_START1			(0x560)
+#define ROT_CPU_ADDR1			(0x564)
+#define ROT_CPU_RDATA2		(0x568)
+#define ROT_CPU_RDATA3		(0x56C)
+#define ROT_CPU_WDATA2		(0x570)
+#define ROT_CPU_WDATA3		(0x574)
+
+#define ROT_MEM_CTRL		   	(0x588)
+#define ROT_SIZE 				(0x58C)
+#define ROT_422_MODE			(0x590)
+
+//REG_DEFAULT
+#define CH_REG_DEFAULT (0x0A00)
+
+/* MACROS */
+#define MIN_INTERLEAVE	(7)
+#define MAX_TILE_SURPORT_NUM	(6)
+
+/* DMA aligned limited:  128bits aligned */
+#define DMA_ALIGN_BYTES	(128 / BITS_PER_BYTE)
+#define DMA_ADDR_ALIGN	(128 / BITS_PER_BYTE)
+#define DMA_STRIDE_ALIGN	(128 / BITS_PER_BYTE)
+
+#define TILE_DMA_ADDR_ALIGN	(256 * 1024)
+
+#define DMA_IN_WIDTH_MAX	(2048)
+#define DMA_IN_HEIGHT_MAX	(8192)
+
+
+#define AFBC_PIC_WIDTH_MIN	(16)
+#define AFBC_PIC_WIDTH_MAX	(8192)
+#define AFBC_PIC_HEIGHT_MIN	(16)
+#define AFBC_PIC_HEIGHT_MAX	(4096)
+
+#define AFBCD_TOP_CROP_MAX	(15)
+#define AFBCD_BOTTOM_CROP_MAX	(15)
+
+//16Bytes
+#define AFBC_HEADER_STRIDE_BLOCK	(16)
+//32BPP:1024, 16BPP 512
+#define AFBC_PAYLOAD_STRIDE_BLOCK	(1024)
+
+#define AFBC_SUPER_GRAPH_HEADER_ADDR_ALIGN	(128)
+#define AFBC_HEADER_ADDR_ALIGN	(16)
+#define AFBC_HEADER_STRIDE_ALIGN	(16)
+
+#define AFBC_PAYLOAD_ADDR_ALIGN_32	(1024)
+#define AFBC_PAYLOAD_STRIDE_ALIGN_32	(1024)
+#define AFBC_PAYLOAD_ADDR_ALIGN_16	(512)
+#define AFBC_PAYLOAD_STRIDE_ALIGN_16	(512)
+
+//16Pixels
+#define AFBC_BLOCK_ALIGN	(16)
+
+#define AFBCE_IN_WIDTH_MAX	(512)
+#define WROT_IN_WIDTH_MAX	(512)
+
+#define MMBUF_BASE	(0x40) //(0xea800000)
+#define MMBUF_LINE_NUM	(8)
+#define MMBUF_BLOCK0_LINE_NUM	(8)
+#define MMBUF_BLOCK0_ROT_LINE_NUM	(64)
+#define MMBUF_BLOCK1_LINE_NUM	(16)
+#define MMBUF_ADDR_ALIGN	(64)
+
+#define HFBC_PIC_WIDTH_MIN	(64)
+#define HFBC_PIC_WIDTH_ROT_MIN	(16)
+#define HFBC_PIC_WIDTH_MAX	(512)
+#define HFBC_PIC_WIDTH_ROT_MAX  (4096)
+#define HFBC_PIC_HEIGHT_MIN	(8)
+#define HFBC_PIC_HEIGHT_ROT_MIN	(32)
+#define HFBC_PIC_HEIGHT_MAX	(8196)
+#define HFBC_PIC_HEIGHT_ROT_MAX	(2160)
+#define HFBC_BLOCK0_WIDTH_ALIGN 	(64)
+#define HFBC_BLOCK0_HEIGHT_ALIGN     (8)
+#define HFBC_BLOCK1_WIDTH_ALIGN	 (32)
+#define HFBC_BLOCK1_HEIGHT_ALIGN   (16)
+#define HFBC_HEADER_ADDR_ALIGN	  (4)
+#define HFBC_HEADER_STRIDE_ALIGN	  (32)
+#define HFBC_HEADER_STRIDE_BLOCK	  (4)
+#define HFBC_PAYLOAD0_ALIGN_8BIT       (512)
+#define HFBC_PAYLOAD1_ALIGN_8BIT       (256)
+#define HFBC_PAYLOAD_ALIGN_10BIT	(1024)
+
+#define HFBCD_BLOCK0_CROP_MAX	(7)
+#define HFBCD_BLOCK0_ROT_CROP_MAX	(63)
+#define HFBCD_BLOCK1_CROP_MAX	(15)
+
+enum DSS_AFBC_HALF_BLOCK_MODE {
+	AFBC_HALF_BLOCK_UPPER_LOWER_ALL = 0,
+	AFBC_HALF_BLOCK_LOWER_UPPER_ALL,
+	AFBC_HALF_BLOCK_UPPER_ONLY,
+	AFBC_HALF_BLOCK_LOWER_ONLY,
+};
+
+typedef struct dss_rdma {
+	uint32_t oft_x0;
+	uint32_t oft_y0;
+	uint32_t oft_x1;
+	uint32_t oft_y1;
+	uint32_t mask0;
+	uint32_t mask1;
+	uint32_t stretch_size_vrt;
+	uint32_t ctrl;
+	uint32_t tile_scram;
+
+	uint32_t data_addr0;
+	uint32_t stride0;
+	uint32_t stretch_stride0;
+	uint32_t data_num0;
+
+	uint32_t data_addr1;
+	uint32_t stride1;
+	uint32_t stretch_stride1;
+	uint32_t data_num1;
+
+	uint32_t data_addr2;
+	uint32_t stride2;
+	uint32_t stretch_stride2;
+	uint32_t data_num2;
+
+	uint32_t ch_rd_shadow;
+	uint32_t ch_ctl;
+
+	uint32_t dma_buf_ctrl;
+
+	uint32_t vpp_ctrl;
+	uint32_t vpp_mem_ctrl;
+
+	uint32_t afbcd_hreg_hdr_ptr_lo;
+	uint32_t afbcd_hreg_pic_width;
+	uint32_t afbcd_hreg_pic_height;
+	uint32_t afbcd_hreg_format;
+	uint32_t afbcd_ctl;
+	uint32_t afbcd_str;
+	uint32_t afbcd_line_crop;
+	uint32_t afbcd_input_header_stride;
+	uint32_t afbcd_payload_stride;
+	uint32_t afbcd_mm_base_0;
+	//uint32_t afbcd_mm_base_1;
+	uint32_t afbcd_afbcd_payload_pointer;
+	uint32_t afbcd_height_bf_str;
+	uint32_t afbcd_os_cfg;
+	uint32_t afbcd_mem_ctrl;
+	uint32_t afbcd_scramble_mode;
+	uint32_t afbcd_header_pointer_offset;
+
+	uint32_t hfbcd_hreg_hdr_ptr_l0;
+	uint32_t hfbcd_hreg_pic_width;
+	uint32_t hfbcd_hreg_pic_height;
+	uint32_t hfbcd_line_crop;
+	uint32_t hfbcd_input_header_stride0;
+	uint32_t hfbcd_payload_stride0;
+	uint32_t hfbcd_payload_pointer; //hfbcd_hreg_pld_ptr_l0;
+	uint32_t hfbcd_scramble_mode;
+	uint32_t hfbcd_creg_fbcd_ctrl_mode;
+	uint32_t hfbcd_hreg_hdr_ptr_l1;
+	uint32_t hfbcd_hreg_pld_ptr_l1;
+	uint32_t hfbcd_header_stride1;
+	uint32_t hfbcd_payload_stride1;
+	uint32_t hfbcd_block_type;
+	uint32_t hfbcd_mm_base0_y8;
+	uint32_t hfbcd_mm_base1_c8;
+	uint32_t hfbcd_mm_base2_y2;
+	uint32_t hfbcd_mm_base3_c2;
+
+	uint8_t vpp_used;
+	uint8_t afbc_used;
+	uint8_t hfbcd_used;
+} dss_rdma_t;
+
+typedef struct dss_wdma {
+	uint32_t oft_x0;
+	uint32_t oft_y0;
+	uint32_t oft_x1;
+	uint32_t oft_y1;
+
+	uint32_t mask0;
+	uint32_t mask1;
+	uint32_t stretch_size_vrt;
+	uint32_t ctrl;
+	uint32_t tile_scram;
+
+	uint32_t sw_mask_en;
+	uint32_t start_mask0;
+	uint32_t end_mask0;
+	uint32_t start_mask1;
+	uint32_t end_mask1;
+
+	uint32_t data_addr;
+	uint32_t stride0;
+	uint32_t data1_addr;
+	uint32_t stride1;
+
+	uint32_t stretch_stride;
+	uint32_t data_num;
+
+	uint32_t ch_rd_shadow;
+	uint32_t ch_ctl;
+	uint32_t ch_secu_en;
+	uint32_t ch_sw_end_req;
+
+	uint32_t dma_buf_ctrl;
+	uint32_t dma_buf_size;
+
+	uint32_t rot_size;
+
+	uint32_t afbce_hreg_pic_blks;
+	uint32_t afbce_hreg_format;
+	uint32_t afbce_hreg_hdr_ptr_l0;
+	uint32_t afbce_hreg_pld_ptr_l0;
+	uint32_t afbce_picture_size;
+	uint32_t afbce_ctl;
+	uint32_t afbce_header_srtide;
+	uint32_t afbce_payload_stride;
+	uint32_t afbce_enc_os_cfg;
+	uint32_t afbce_mem_ctrl;
+	uint32_t afbce_qos_cfg;
+	uint32_t afbce_threshold;
+	uint32_t afbce_scramble_mode;
+	uint32_t afbce_header_pointer_offset;
+
+	uint32_t hfbce_hreg_pic_blks;
+	uint32_t hfbce_hreg_hdr_ptr_l0;
+	uint32_t hfbce_hreg_pld_ptr_l0;
+	uint32_t hfbce_picture_size;
+	uint32_t hfbce_scramble_mode;
+	uint32_t hfbce_header_stride0;
+	uint32_t hfbce_payload_stride0;
+	uint32_t hfbce_header_pointer_offset;
+	uint32_t fbce_creg_fbce_ctrl_mode;
+	uint32_t hfbce_hreg_hdr_ptr_l1;
+	uint32_t hfbce_hreg_pld_ptr_l1;
+	uint32_t hfbce_header_stride1;
+	uint32_t hfbce_payload_stride1;
+
+	uint8_t afbc_used;
+	uint8_t hfbce_used;
+	uint8_t rot_used;
+} dss_wdma_t;
+
+/*******************************************************************************
+** MCTL  MUTEX0 1 2 3 4 5
+*/
+#define MCTL_CTL_EN	(0x0000)
+#define MCTL_CTL_MUTEX	(0x0004)
+#define MCTL_CTL_MUTEX_STATUS	(0x0008)
+#define MCTL_CTL_MUTEX_ITF	(0x000C)
+#define MCTL_CTL_MUTEX_DBUF	(0x0010)
+#define MCTL_CTL_MUTEX_SCF	(0x0014)
+#define MCTL_CTL_MUTEX_OV	(0x0018)
+#define MCTL_CTL_MUTEX_WCH0	(0x0020)
+#define MCTL_CTL_MUTEX_WCH1	(0x0024)
+#define MCTL_CTL_MUTEX_WCH2	(0x0028)
+#define MCTL_CTL_MUTEX_RCH8	(0x002C)
+#define MCTL_CTL_MUTEX_RCH0	(0x0030)
+#define MCTL_CTL_MUTEX_RCH1	(0x0034)
+#define MCTL_CTL_MUTEX_RCH2	(0x0038)
+#define MCTL_CTL_MUTEX_RCH3	(0x003C)
+#define MCTL_CTL_MUTEX_RCH4	(0x0040)
+#define MCTL_CTL_MUTEX_RCH5	(0x0044)
+#define MCTL_CTL_MUTEX_RCH6	(0x0048)
+#define MCTL_CTL_MUTEX_RCH7	(0x004C)
+#define MCTL_CTL_TOP	(0x0050)
+#define MCTL_CTL_FLUSH_STATUS	(0x0054)
+#define MCTL_CTL_CLEAR	(0x0058)
+#define MCTL_CTL_CACK_TOUT	(0x0060)
+#define MCTL_CTL_MUTEX_TOUT	(0x0064)
+#define MCTL_CTL_STATUS	(0x0068)
+#define MCTL_CTL_INTEN	(0x006C)
+#define MCTL_CTL_SW_ST	(0x0070)
+#define MCTL_CTL_ST_SEL	(0x0074)
+#define MCTL_CTL_END_SEL	(0x0078)
+#define MCTL_CTL_CLK_SEL	(0x0080)
+#define MCTL_CTL_CLK_EN	(0x0084)
+#define MCTL_CTL_DBG	(0x00E0)
+
+/*******************************************************************************
+** MCTL  SYS
+*/
+//SECU
+#define MCTL_CTL_SECU_CFG			(0x0000)
+#define MCTL_PAY_SECU_FLUSH_EN  	(0x0018)
+#define MCTL_CTL_SECU_GATE0    (0x0080)
+#define MCTL_CTL_SECU_GATE1    (0x0084)
+#define MCTL_CTL_SECU_GATE2    (0x0088)
+#define MCTL_DSI0_SECU_CFG_EN  (0x00A0)
+#define MCTL_DSI1_SECU_CFG_EN  (0x00A4)
+#define MCTL_RCH0_SECU_GATE		(0x0080)
+#define MCTL_RCH1_SECU_GATE		(0x0084)
+#define MCTL_RCH2_SECU_GATE		(0x0088)
+#define MCTL_RCH3_SECU_GATE		(0x008C)
+#define MCTL_RCH4_SECU_GATE		(0x0090)
+#define MCTL_RCH5_SECU_GATE		(0x0094)
+#define MCTL_RCH6_SECU_GATE		(0x0098)
+#define MCTL_RCH7_SECU_GATE		(0x009C)
+#define MCTL_RCH8_SECU_GATE		(0x00A0)
+#define MCTL_OV2_SECU_GATE		(0x00B0)
+#define MCTL_OV3_SECU_GATE		(0x00B4)
+#define MCTL_DSI0_SECU_CFG			(0x00C0)
+#define MCTL_DSI1_SECU_CFG			(0x00C4)
+#define MCTL_DP_SECU_GATE			(0x00C8)
+#define MCTL_DSI_MUX_SECU_GATE	(0x00CC)
+//FLUSH EN
+#define MCTL_RCH0_FLUSH_EN	(0x0100)
+#define MCTL_RCH1_FLUSH_EN	(0x0104)
+#define MCTL_RCH2_FLUSH_EN	(0x0108)
+#define MCTL_RCH3_FLUSH_EN	(0x010C)
+#define MCTL_RCH4_FLUSH_EN	(0x0110)
+#define MCTL_RCH5_FLUSH_EN	(0x0114)
+#define MCTL_RCH6_FLUSH_EN	(0x0118)
+#define MCTL_RCH7_FLUSH_EN	(0x011C)
+#define MCTL_WCH0_FLUSH_EN	(0x0120)
+#define MCTL_WCH1_FLUSH_EN	(0x0124)
+#define MCTL_OV0_FLUSH_EN	(0x0128)
+#define MCTL_OV1_FLUSH_EN	(0x012C)
+#define MCTL_OV2_FLUSH_EN	(0x0130)
+#define MCTL_OV3_FLUSH_EN	(0x0134)
+#define MCTL_RCH8_FLUSH_EN	(0x0138)
+#define MCTL_WCH2_FLUSH_EN	(0x013C)
+//SW FOR RCH
+#define MCTL_RCH0_OV_OEN	(0x0160)
+#define MCTL_RCH1_OV_OEN	(0x0164)
+#define MCTL_RCH2_OV_OEN	(0x0168)
+#define MCTL_RCH3_OV_OEN	(0x016C)
+#define MCTL_RCH4_OV_OEN	(0x0170)
+#define MCTL_RCH5_OV_OEN	(0x0174)
+#define MCTL_RCH6_OV_OEN	(0x0178)
+#define MCTL_RCH7_OV_OEN	(0x017C)
+#define MCTL_RCH8_OV_OEN	(0x015C)
+//SW FOR OV
+#define MCTL_RCH_OV0_SEL	(0x0180)
+#define MCTL_RCH_OV1_SEL	(0x0184)
+#define MCTL_RCH_OV2_SEL	(0x0188)
+#define MCTL_RCH_OV3_SEL	(0x018C)
+#define MCTL_RCH_OV0_SEL1  (0x0190)
+#define MCTL_RCH_OV1_SEL1  (0x0194)
+#define MCTL_RCH_OV2_SEL1  (0x0198)
+//SW FOR WCH
+#define MCTL_WCH0_OV_IEN   (0x01A0)
+#define MCTL_WCH1_OV_IEN   (0x01A4)
+//SW FOR OV2/3 OUTPUT
+#define MCTL_WCH_OV2_SEL   (0x01A8)
+#define MCTL_WCH_OV3_SEL   (0x01AC)
+//SW
+#define MCTL_WB_ENC_SEL	(0x01B0)
+#define MCTL_DSI_MUX_SEL	(0x01B4)
+//RCH STARTY
+#define MCTL_RCH0_STARTY	(0x01C0)
+#define MCTL_RCH1_STARTY	(0x01C4)
+#define MCTL_RCH2_STARTY	(0x01C8)
+#define MCTL_RCH3_STARTY	(0x01CC)
+#define MCTL_RCH4_STARTY	(0x01D0)
+#define MCTL_RCH5_STARTY	(0x01D4)
+#define MCTL_RCH6_STARTY	(0x01D8)
+#define MCTL_RCH7_STARTY	(0x01DC)
+#define MCTL_RCH8_STARTY	(0x01E0)
+//LP
+#define MCTL_MCTL_CLK_SEL	(0x01F0)
+#define MCTL_MCTL_CLK_EN	(0x01F4)
+#define MCTL_MOD_CLK_SEL	(0x01F8)
+#define MCTL_MOD_CLK_EN	(0x01FC)
+
+#define MCTL_MOD0_DBG	(0x0200)
+#define MCTL_MOD1_DBG	(0x0204)
+#define MCTL_MOD2_DBG	(0x0208)
+#define MCTL_MOD3_DBG	(0x020C)
+#define MCTL_MOD4_DBG	(0x0210)
+#define MCTL_MOD5_DBG	(0x0214)
+#define MCTL_MOD6_DBG	(0x0218)
+#define MCTL_MOD7_DBG	(0x021C)
+#define MCTL_MOD8_DBG	(0x0220)
+#define MCTL_MOD9_DBG	(0x0224)
+#define MCTL_MOD10_DBG	(0x0228)
+#define MCTL_MOD11_DBG	(0x022C)
+#define MCTL_MOD12_DBG	(0x0230)
+#define MCTL_MOD13_DBG	(0x0234)
+#define MCTL_MOD14_DBG	(0x0238)
+#define MCTL_MOD15_DBG	(0x023C)
+#define MCTL_MOD16_DBG	(0x0240)
+#define MCTL_MOD17_DBG	(0x0244)
+#define MCTL_MOD18_DBG	(0x0248)
+#define MCTL_MOD19_DBG	(0x024C)
+#define MCTL_MOD20_DBG	(0x0250)
+#define MCTL_MOD0_STATUS	(0x0280)
+#define MCTL_MOD1_STATUS	(0x0284)
+#define MCTL_MOD2_STATUS	(0x0288)
+#define MCTL_MOD3_STATUS	(0x028C)
+#define MCTL_MOD4_STATUS	(0x0290)
+#define MCTL_MOD5_STATUS	(0x0294)
+#define MCTL_MOD6_STATUS	(0x0298)
+#define MCTL_MOD7_STATUS	(0x029C)
+#define MCTL_MOD8_STATUS	(0x02A0)
+#define MCTL_MOD9_STATUS	(0x02A4)
+#define MCTL_MOD10_STATUS	(0x02A8)
+#define MCTL_MOD11_STATUS	(0x02AC)
+#define MCTL_MOD12_STATUS	(0x02B0)
+#define MCTL_MOD13_STATUS	(0x02B4)
+#define MCTL_MOD14_STATUS	(0x02B8)
+#define MCTL_MOD15_STATUS	(0x02BC)
+#define MCTL_MOD16_STATUS	(0x02C0)
+#define MCTL_MOD17_STATUS	(0x02C4)
+#define MCTL_MOD18_STATUS	(0x02C8)
+#define MCTL_MOD19_STATUS	(0x02CC)
+#define MCTL_MOD20_STATUS	(0x02D0)
+#define MCTL_SW_DBG	(0x0300)
+#define MCTL_SW0_STATUS0	(0x0304)
+#define MCTL_SW0_STATUS1	(0x0308)
+#define MCTL_SW0_STATUS2	(0x030C)
+#define MCTL_SW0_STATUS3	(0x0310)
+#define MCTL_SW0_STATUS4	(0x0314)
+#define MCTL_SW0_STATUS5	(0x0318)
+#define MCTL_SW0_STATUS6	(0x031C)
+#define MCTL_SW0_STATUS7	(0x0320)
+#define MCTL_SW1_STATUS	(0x0324)
+
+//RCH
+#define MCTL_MOD_DBG_CH_NUM (10)
+#define MCTL_MOD_DBG_OV_NUM (4)
+#define MCTL_MOD_DBG_DBUF_NUM (2)
+#define MCTL_MOD_DBG_SCF_NUM (1)
+#define MCTL_MOD_DBG_ITF_NUM (2)
+#define MCTL_MOD_DBG_ADD_CH_NUM (2)  // copybit
+
+enum dss_mctl_idx {
+	DSS_MCTL0 = 0,
+	DSS_MCTL1,
+	DSS_MCTL2,
+	DSS_MCTL3,
+	DSS_MCTL4,
+	DSS_MCTL5,
+	DSS_MCTL_IDX_MAX,
+};
+
+typedef struct dss_mctl {
+	uint32_t ctl_mutex_itf;
+	uint32_t ctl_mutex_dbuf;
+	uint32_t ctl_mutex_scf;
+	uint32_t ctl_mutex_ov;
+} dss_mctl_t;
+
+typedef struct dss_mctl_ch {
+	uint32_t chn_mutex;
+	uint32_t chn_flush_en;
+	uint32_t chn_ov_oen;
+	uint32_t chn_starty;
+	uint32_t chn_mod_dbg;
+} dss_mctl_ch_t;
+
+typedef struct dss_mctl_sys {
+	uint32_t ov_flush_en[DSS_OVL_IDX_MAX];
+	uint32_t chn_ov_sel[DSS_OVL_IDX_MAX];
+	uint32_t chn_ov_sel1[DSS_OVL_IDX_MAX];
+	uint32_t wchn_ov_sel[DSS_WCH_MAX];
+	uint8_t ov_flush_en_used[DSS_OVL_IDX_MAX];
+	uint8_t chn_ov_sel_used[DSS_OVL_IDX_MAX];
+	uint8_t wch_ov_sel_used[DSS_WCH_MAX];
+} dss_mctl_sys_t;
+
+/*******************************************************************************
+** OVL ES
+*/
+#define OVL_SIZE	(0x0000)
+#define OVL_BG_COLOR	(0x4)
+#define OVL_DST_STARTPOS	(0x8)
+#define OVL_DST_ENDPOS	(0xC)
+#define OVL_GCFG	(0x10)
+#define OVL_LAYER0_POS	(0x14)
+#define OVL_LAYER0_SIZE	(0x18)
+#define OVL_LAYER0_SRCLOKEY	(0x1C)
+#define OVL_LAYER0_SRCHIKEY	(0x20)
+#define OVL_LAYER0_DSTLOKEY	(0x24)
+#define OVL_LAYER0_DSTHIKEY	(0x28)
+#define OVL_LAYER0_PATTERN	(0x2C)
+#define OVL_LAYER0_ALPHA	(0x30)
+#define OVL_LAYER0_CFG	(0x34)
+#define OVL_LAYER0_INFO_ALPHA	(0x40)
+#define OVL_LAYER0_INFO_SRCCOLOR	(0x44)
+#define OVL_LAYER1_POS	(0x50)
+#define OVL_LAYER1_SIZE	(0x54)
+#define OVL_LAYER1_SRCLOKEY	(0x58)
+#define OVL_LAYER1_SRCHIKEY	(0x5C)
+#define OVL_LAYER1_DSTLOKEY	(0x60)
+#define OVL_LAYER1_DSTHIKEY	(0x64)
+#define OVL_LAYER1_PATTERN	(0x68)
+#define OVL_LAYER1_ALPHA	(0x6C)
+#define OVL_LAYER1_CFG	(0x70)
+#define OVL_LAYER1_INFO_ALPHA	(0x7C)
+#define OVL_LAYER1_INFO_SRCCOLOR	(0x80)
+#define OVL_LAYER2_POS	(0x8C)
+#define OVL_LAYER2_SIZE	(0x90)
+#define OVL_LAYER2_SRCLOKEY	(0x94)
+#define OVL_LAYER2_SRCHIKEY	(0x98)
+#define OVL_LAYER2_DSTLOKEY	(0x9C)
+#define OVL_LAYER2_DSTHIKEY	(0xA0)
+#define OVL_LAYER2_PATTERN	(0xA4)
+#define OVL_LAYER2_ALPHA	(0xA8)
+#define OVL_LAYER2_CFG	(0xAC)
+#define OVL_LAYER2_INFO_ALPHA	(0xB8)
+#define OVL_LAYER2_INFO_SRCCOLOR	(0xBC)
+#define OVL_LAYER3_POS	(0xC8)
+#define OVL_LAYER3_SIZE	(0xCC)
+#define OVL_LAYER3_SRCLOKEY	(0xD0)
+#define OVL_LAYER3_SRCHIKEY	(0xD4)
+#define OVL_LAYER3_DSTLOKEY	(0xD8)
+#define OVL_LAYER3_DSTHIKEY	(0xDC)
+#define OVL_LAYER3_PATTERN	(0xE0)
+#define OVL_LAYER3_ALPHA	(0xE4)
+#define OVL_LAYER3_CFG	(0xE8)
+#define OVL_LAYER3_INFO_ALPHA	(0xF4)
+#define OVL_LAYER3_INFO_SRCCOLOR	(0xF8)
+#define OVL_LAYER4_POS	(0x104)
+#define OVL_LAYER4_SIZE	(0x108)
+#define OVL_LAYER4_SRCLOKEY	(0x10C)
+#define OVL_LAYER4_SRCHIKEY	(0x110)
+#define OVL_LAYER4_DSTLOKEY	(0x114)
+#define OVL_LAYER4_DSTHIKEY	(0x118)
+#define OVL_LAYER4_PATTERN	(0x11C)
+#define OVL_LAYER4_ALPHA	(0x120)
+#define OVL_LAYER4_CFG	(0x124)
+#define OVL_LAYER4_INFO_ALPHA	(0x130)
+#define OVL_LAYER4_INFO_SRCCOLOR	(0x134)
+#define OVL_LAYER5_POS	(0x140)
+#define OVL_LAYER5_SIZE	(0x144)
+#define OVL_LAYER5_SRCLOKEY	(0x148)
+#define OVL_LAYER5_SRCHIKEY	(0x14C)
+#define OVL_LAYER5_DSTLOKEY	(0x150)
+#define OVL_LAYER5_DSTHIKEY	(0x154)
+#define OVL_LAYER5_PATTERN	(0x158)
+#define OVL_LAYER5_ALPHA	(0x15C)
+#define OVL_LAYER5_CFG	(0x160)
+#define OVL_LAYER5_INFO_ALPHA	(0x16C)
+#define OVL_LAYER5_INFO_SRCCOLOR	(0x170)
+#define OVL_LAYER6_POS	(0x14)
+#define OVL_LAYER6_SIZE	(0x18)
+#define OVL_LAYER6_SRCLOKEY	(0x1C)
+#define OVL_LAYER6_SRCHIKEY	(0x20)
+#define OVL_LAYER6_DSTLOKEY	(0x24)
+#define OVL_LAYER6_DSTHIKEY	(0x28)
+#define OVL_LAYER6_PATTERN	(0x2C)
+#define OVL_LAYER6_ALPHA	(0x30)
+#define OVL_LAYER6_CFG	(0x34)
+#define OVL_LAYER6_INFO_ALPHA	(0x40)
+#define OVL_LAYER6_INFO_SRCCOLOR	(0x44)
+#define OVL_LAYER7_POS	(0x50)
+#define OVL_LAYER7_SIZE	(0x54)
+#define OVL_LAYER7_SRCLOKEY	(0x58)
+#define OVL_LAYER7_SRCHIKEY	(0x5C)
+#define OVL_LAYER7_DSTLOKEY	(0x60)
+#define OVL_LAYER7_DSTHIKEY	(0x64)
+#define OVL_LAYER7_PATTERN	(0x68)
+#define OVL_LAYER7_ALPHA	(0x6C)
+#define OVL_LAYER7_CFG	(0x70)
+#define OVL_LAYER7_INFO_ALPHA	(0x7C)
+#define OVL_LAYER7_INFO_SRCCOLOR	(0x80)
+#define OVL_LAYER0_ST_INFO	(0x48)
+#define OVL_LAYER1_ST_INFO	(0x84)
+#define OVL_LAYER2_ST_INFO	(0xC0)
+#define OVL_LAYER3_ST_INFO	(0xFC)
+#define OVL_LAYER4_ST_INFO	(0x138)
+#define OVL_LAYER5_ST_INFO	(0x174)
+#define OVL_LAYER6_ST_INFO	(0x48)
+#define OVL_LAYER7_ST_INFO	(0x84)
+#define OVL_LAYER0_IST_INFO	(0x4C)
+#define OVL_LAYER1_IST_INFO	(0x88)
+#define OVL_LAYER2_IST_INFO	(0xC4)
+#define OVL_LAYER3_IST_INFO	(0x100)
+#define OVL_LAYER4_IST_INFO	(0x13C)
+#define OVL_LAYER5_IST_INFO	(0x178)
+#define OVL_LAYER6_IST_INFO	(0x4C)
+#define OVL_LAYER7_IST_INFO	(0x88)
+#define OVL_LAYER0_PSPOS	(0x38)
+#define OVL_LAYER0_PEPOS	(0x3C)
+#define OVL_LAYER1_PSPOS	(0x74)
+#define OVL_LAYER1_PEPOS	(0x78)
+#define OVL_LAYER2_PSPOS	(0xB0)
+#define OVL_LAYER2_PEPOS	(0xB4)
+#define OVL_LAYER3_PSPOS	(0xEC)
+#define OVL_LAYER3_PEPOS	(0xF0)
+#define OVL_LAYER4_PSPOS	(0x128)
+#define OVL_LAYER4_PEPOS	(0x12C)
+#define OVL_LAYER5_PSPOS	(0x164)
+#define OVL_LAYER5_PEPOS	(0x168)
+#define OVL_LAYER6_PSPOS	(0x38)
+#define OVL_LAYER6_PEPOS	(0x3C)
+#define OVL_LAYER7_PSPOS	(0x74)
+#define OVL_LAYER7_PEPOS	(0x78)
+
+#define OVL6_BASE_ST_INFO	(0x17C)
+#define OVL6_BASE_IST_INFO	(0x180)
+#define OVL6_GATE_CTRL	(0x184)
+#define OVL6_RD_SHADOW_SEL	(0x188)
+#define OVL6_OV_CLK_SEL	(0x18C)
+#define OVL6_OV_CLK_EN	(0x190)
+#define OVL6_BLOCK_SIZE	(0x1A0)
+#define OVL6_BLOCK_DBG	(0x1A4)
+#define OVL6_REG_DEFAULT (0x1A8)
+
+#define OVL2_BASE_ST_INFO	(0x8C)
+#define OVL2_BASE_IST_INFO	(0x90)
+#define OVL2_GATE_CTRL	(0x94)
+#define OVL2_OV_RD_SHADOW_SEL	(0x98)
+#define OVL2_OV_CLK_SEL	(0x9C)
+#define OVL2_OV_CLK_EN	(0xA0)
+#define OVL2_BLOCK_SIZE	(0xB0)
+#define OVL2_BLOCK_DBG	(0xB4)
+#define OVL2_REG_DEFAULT	(0xB8)
+
+
+/* LAYER0_CFG */
+#define BIT_OVL_LAYER_SRC_CFG	BIT(8)
+#define BIT_OVL_LAYER_ENABLE	BIT(0)
+
+/* LAYER0_INFO_ALPHA */
+#define BIT_OVL_LAYER_SRCALPHA_FLAG	BIT(3)
+#define BIT_OVL_LAYER_DSTALPHA_FLAG	BIT(2)
+
+/* LAYER0_INFO_SRCCOLOR */
+#define BIT_OVL_LAYER_SRCCOLOR_FLAG	BIT(0)
+
+
+#define OVL_6LAYER_NUM		(6)
+#define OVL_2LAYER_NUM		(2)
+
+/*******************************************************************************
+** OVL
+*/
+#define OV_SIZE						(0x000)
+#define OV_BG_COLOR_RGB 			(0x004)
+#define OV_BG_COLOR_A 				(0x008)
+#define OV_DST_STARTPOS 			(0x00C)
+#define OV_DST_ENDPOS 				(0x010)
+#define OV_GCFG 					(0x014)
+#define OV_LAYER0_POS 				(0x030)
+#define OV_LAYER0_SIZE 				(0x034)
+#define OV_LAYER0_SRCLOKEY		(0x038)
+#define OV_LAYER0_SRCHIKEY 		(0x03C)
+#define OV_LAYER0_DSTLOKEY 		(0x040)
+#define OV_LAYER0_DSTHIKEY 		(0x044)
+#define OV_LAYER0_PATTERN_RGB 	(0x048)
+#define OV_LAYER0_PATTERN_A 		(0x04C)
+#define OV_LAYER0_ALPHA_MODE 		(0x050)
+#define OV_LAYER0_ALPHA_A 			(0x054)
+#define OV_LAYER0_CFG 				(0x058)
+#define OV_LAYER0_PSPOS 			(0x05C)
+#define OV_LAYER0_PEPOS 			(0x060)
+#define OV_LAYER0_INFO_ALPHA 		(0x064)
+#define OV_LAYER0_INFO_SRCCOLOR 	(0x068)
+#define OV_LAYER0_DBG_INFO 		(0x06C)
+#define OV8_BASE_DBG_INFO			(0x340)
+#define OV8_RD_SHADOW_SEL			(0x344)
+#define OV8_CLK_SEL					(0x348)
+#define OV8_CLK_EN 					(0x34C)
+#define OV8_BLOCK_SIZE 				(0x350)
+#define OV8_BLOCK_DBG 				(0x354)
+#define OV8_REG_DEFAULT 			(0x358)
+#define OV2_BASE_DBG_INFO			(0x200)
+#define OV2_RD_SHADOW_SEL			(0x204)
+#define OV2_CLK_SEL					(0x208)
+#define OV2_CLK_EN 					(0x20C)
+#define OV2_BLOCK_SIZE 				(0x210)
+#define OV2_BLOCK_DBG 				(0x214)
+#define OV2_REG_DEFAULT 			(0x218)
+
+#define OV_8LAYER_NUM				(8)
+
+typedef struct dss_ovl_layer {
+	uint32_t layer_pos;
+	uint32_t layer_size;
+	uint32_t layer_pattern;
+	uint32_t layer_pattern_alpha;
+	uint32_t layer_alpha_a;
+	uint32_t layer_alpha;
+	uint32_t layer_cfg;
+} dss_ovl_layer_t;
+
+typedef struct dss_ovl_layer_pos {
+	uint32_t layer_pspos;
+	uint32_t layer_pepos;
+} dss_ovl_layer_pos_t;
+
+typedef struct dss_ovl {
+	uint32_t ovl_size;
+	uint32_t ovl_bg_color;
+	uint32_t ovl_bg_color_alpha;
+	uint32_t ovl_dst_startpos;
+	uint32_t ovl_dst_endpos;
+	uint32_t ovl_gcfg;
+	uint32_t ovl_block_size;
+	dss_ovl_layer_t ovl_layer[OV_8LAYER_NUM];
+	dss_ovl_layer_pos_t ovl_layer_pos[OV_8LAYER_NUM];
+	uint8_t ovl_layer_used[OV_8LAYER_NUM];
+} dss_ovl_t;
+
+typedef struct dss_ovl_alpha {
+	uint32_t src_amode;
+	uint32_t src_gmode;
+	uint32_t alpha_offsrc;
+	uint32_t src_lmode;
+	uint32_t src_pmode;
+
+	uint32_t alpha_smode;
+
+	uint32_t dst_amode;
+	uint32_t dst_gmode;
+	uint32_t alpha_offdst;
+	uint32_t dst_pmode;
+
+	uint32_t fix_mode;
+} dss_ovl_alpha_t;
+
+
+/*******************************************************************************
+** DBUF
+*/
+#define DBUF_FRM_SIZE	(0x0000)
+#define DBUF_FRM_HSIZE	(0x0004)
+#define DBUF_SRAM_VALID_NUM	(0x0008)
+#define DBUF_WBE_EN	(0x000C)
+#define DBUF_THD_FILL_LEV0	(0x0010)
+#define DBUF_DFS_FILL_LEV1	(0x0014)
+#define DBUF_THD_RQOS	(0x0018)
+#define DBUF_THD_WQOS	(0x001C)
+#define DBUF_THD_CG	(0x0020)
+#define DBUF_THD_OTHER	(0x0024)
+#define DBUF_FILL_LEV0_CNT	(0x0028)
+#define DBUF_FILL_LEV1_CNT	(0x002C)
+#define DBUF_FILL_LEV2_CNT	(0x0030)
+#define DBUF_FILL_LEV3_CNT	(0x0034)
+#define DBUF_FILL_LEV4_CNT	(0x0038)
+#define DBUF_ONLINE_FILL_LEVEL	(0x003C)
+#define DBUF_WB_FILL_LEVEL	(0x0040)
+#define DBUF_DFS_STATUS	(0x0044)
+#define DBUF_THD_FLUX_REQ_BEF	(0x0048)
+#define DBUF_DFS_LP_CTRL	(0x004C)
+#define DBUF_RD_SHADOW_SEL	(0x0050)
+#define DBUF_MEM_CTRL	(0x0054)
+#define DBUF_PM_CTRL	(0x0058)
+#define DBUF_CLK_SEL	(0x005C)
+#define DBUF_CLK_EN  	(0x0060)
+#define DBUF_THD_FLUX_REQ_AFT (0x0064)
+#define DBUF_THD_DFS_OK (0x0068)
+#define DBUF_FLUX_REQ_CTRL (0x006C)
+#define DBUF_REG_DEFAULT  (0x00A4)
+#define DBUF_DFS_RAM_MANAGE  (0x00A8)
+#define DBUF_DFS_DATA_FILL_OUT  (0x00AC)
+
+/*******************************************************************************
+** SBL
+*/
+//SBL FOR ES
+#define SBL_REG_FRMT_MODE_ES                          (0x0000)
+#define SBL_REG_FRMT_DBUF_CTRL_ES                     (0x0008)
+#define SBL_REG_FRMT_FRAME_WIDTH_7_TO_0_ES            (0x0010)
+#define SBL_REG_FRMT_FRAME_WIDTH_15_TO_8_ES           (0x0014)
+#define SBL_REG_FRMT_FRAME_HEIGHT_7_TO_0_ES           (0x0018)
+#define SBL_REG_FRMT_FRAME_HEIGHT_15_TO_8_ES          (0x001c)
+#define SBL_REG_FRMT_ROI_HOR_START_7_TO_0_ES          (0x0080)
+#define SBL_REG_FRMT_ROI_HOR_START_15_TO_8_ES         (0x0084)
+#define SBL_REG_FRMT_ROI_HOR_END_7_TO_0_ES            (0x0088)
+#define SBL_REG_FRMT_ROI_HOR_END_15_TO_8_ES           (0x008c)
+#define SBL_REG_FRMT_ROI_VER_START_7_TO_0_ES          (0x0090)
+#define SBL_REG_FRMT_ROI_VER_START_15_TO_8_ES         (0x0094)
+#define SBL_REG_FRMT_ROI_VER_END_7_TO_0_ES            (0x0098)
+#define SBL_REG_FRMT_ROI_VER_END_15_TO_8_ES           (0x009c)
+#define SBL_REG_CALC_CONTROL_0_ES                     (0x0400)
+#define SBL_REG_CALC_CONTROL_1_ES                     (0x0404)
+#define SBL_REG_CALC_AMBIENT_LIGHT_7_TO_0_ES          (0x0408)
+#define SBL_REG_CALC_AMBIENT_LIGHT_15_TO_8_ES         (0x040c)
+#define SBL_REG_CALC_BACKLIGHT_7_TO_0_ES              (0x0410)
+#define SBL_REG_CALC_BACKLIGHT_15_TO_8_ES             (0x0414)
+#define SBL_REG_CALC_ASSERTIVENESS_ES                 (0x0418)
+#define SBL_REG_CALC_TF_CONTROL_ES                    (0x041c)
+#define SBL_REG_CALC_STRENGTH_MANUAL_7_TO_0_ES        (0x0420)
+#define SBL_REG_CALC_STRENGTH_MANUAL_9_TO_8_ES        (0x0424)
+#define SBL_REG_CALC_GAIN_AA_MANUAL_7_TO_0_ES         (0x0428)
+#define SBL_REG_CALC_GAIN_AA_MANUAL_11_TO_8_ES        (0x042c)
+#define SBL_REG_CALC_ROI_FACTOR_IN_7_TO_0_ES          (0x0430)
+#define SBL_REG_CALC_ROI_FACTOR_IN_15_TO_8_ES         (0x0434)
+#define SBL_REG_CALC_ROI_FACTOR_OUT_7_TO_0_ES         (0x0438)
+#define SBL_REG_CALC_ROI_FACTOR_OUT_15_TO_8_ES        (0x043c)
+#define SBL_REG_CALC_PSR_DELTA_CHANGE_7_TO_0_ES       (0x0448)
+#define SBL_REG_CALC_PSR_DELTA_CHANGE_15_TO_8_ES      (0x044c)
+#define SBL_REG_CALC_PSR_DELTA_SETTLE_7_TO_0_ES       (0x0450)
+#define SBL_REG_CALC_PSR_DELTA_SETTLE_15_TO_8_ES      (0x0454)
+#define SBL_REG_CALC_AL_SCALE_7_TO_0_ES               (0x0458)
+#define SBL_REG_CALC_AL_SCALE_15_TO_8_ES              (0x045c)
+#define SBL_REG_CALC_AL_TF_STEP_SAMPLE_ES             (0x0460)
+#define SBL_REG_CALC_AL_TF_STEP_WAIT_7_TO_0_ES        (0x0468)
+#define SBL_REG_CALC_AL_TF_STEP_WAIT_11_TO_8_ES       (0x046c)
+#define SBL_REG_CALC_AL_TF_STEP_WAITUP_7_TO_0_ES      (0x0470)
+#define SBL_REG_CALC_AL_TF_STEP_WAITUP_11_TO_8_ES     (0x0474)
+#define SBL_REG_CALC_AL_TF_STEP_SIZE_7_TO_0_ES        (0x0478)
+#define SBL_REG_CALC_AL_TF_STEP_SIZE_11_TO_8_ES       (0x047c)
+#define SBL_REG_CALC_AL_TF_LIMIT_7_TO_0_ES            (0x0480)
+#define SBL_REG_CALC_AL_TF_LIMIT_15_TO_8_ES           (0x0484)
+#define SBL_REG_CALC_AL_TF_ALPHA_ES                   (0x0488)
+#define SBL_REG_CALC_AL_TF_ALPHA_UP_ES                (0x048c)
+#define SBL_REG_CALC_AL_TF_NOISE_7_TO_0_ES            (0x0490)
+#define SBL_REG_CALC_AL_TF_NOISE_15_TO_8_ES           (0x0494)
+#define SBL_REG_CALC_AL_TF_M_INC_7_TO_0_ES            (0x0498)
+#define SBL_REG_CALC_AL_TF_M_INC_15_TO_8_ES           (0x049c)
+#define SBL_REG_CALC_AL_TF_K_INC_7_TO_0_ES            (0x04a0)
+#define SBL_REG_CALC_AL_TF_K_INC_15_TO_8_ES           (0x04a4)
+#define SBL_REG_CALC_AL_TF_M_DEC_7_TO_0_ES            (0x04a8)
+#define SBL_REG_CALC_AL_TF_M_DEC_15_TO_8_ES           (0x04ac)
+#define SBL_REG_CALC_AL_TF_K_DEC_7_TO_0_ES            (0x04b0)
+#define SBL_REG_CALC_AL_TF_K_DEC_15_TO_8_ES           (0x04b4)
+#define SBL_REG_CALC_AL_TF_AGGRESSIVENESS_ES          (0x04b8)
+#define SBL_REG_CALC_AL_RTF_FILTER_A_7_TO_0_ES        (0x04c0)
+#define SBL_REG_CALC_AL_RTF_FILTER_A_15_TO_8_ES       (0x04c4)
+#define SBL_REG_CALC_AL_RTF_FILTER_B_7_TO_0_ES        (0x04c8)
+#define SBL_REG_CALC_AL_RTF_FILTER_B_15_TO_8_ES       (0x04cc)
+#define SBL_REG_CALC_AL_RTF_FILTER_C_7_TO_0_ES        (0x04d0)
+#define SBL_REG_CALC_AL_RTF_FILTER_C_15_TO_8_ES       (0x04d4)
+#define SBL_REG_CALC_AB_AL_KNEE1_7_TO_0_ES            (0x04d8)
+#define SBL_REG_CALC_AB_AL_KNEE1_15_TO_8_ES           (0x04dc)
+#define SBL_REG_CALC_AB_AL_KNEE2_7_TO_0_ES            (0x04e0)
+#define SBL_REG_CALC_AB_AL_KNEE2_15_TO_8_ES           (0x04e4)
+#define SBL_REG_CALC_AB_BL_KNEE1_7_TO_0_ES            (0x04e8)
+#define SBL_REG_CALC_AB_BL_KNEE1_15_TO_8_ES           (0x04ec)
+#define SBL_REG_CALC_AB_BL_KNEE2_7_TO_0_ES            (0x04f0)
+#define SBL_REG_CALC_AB_BL_KNEE2_15_TO_8_ES           (0x04f4)
+#define SBL_REG_CALC_BL_PANEL_MAX_7_TO_0_ES           (0x04f8)
+#define SBL_REG_CALC_BL_PANEL_MAX_15_TO_8_ES          (0x04fc)
+#define SBL_REG_CALC_BL_OFFSET_7_TO_0_ES              (0x0500)
+#define SBL_REG_CALC_BL_OFFSET_15_TO_8_ES             (0x0504)
+#define SBL_REG_CALC_BL_MIN_7_TO_0_ES                 (0x0508)
+#define SBL_REG_CALC_BL_MIN_15_TO_8_ES                (0x050c)
+#define SBL_REG_CALC_BL_ATTEN_ALPHA_7_TO_0_ES         (0x0510)
+#define SBL_REG_CALC_BL_ATTEN_ALPHA_9_TO_8_ES         (0x0514)
+#define SBL_REG_CALC_SBC1_TF_DEPTH_7_TO_0_ES          (0x0518)
+#define SBL_REG_CALC_SBC1_TF_DEPTH_15_TO_8_ES         (0x051c)
+#define SBL_REG_CALC_SBC1_TF_STEP_7_TO_0_ES           (0x0520)
+#define SBL_REG_CALC_SBC1_TF_STEP_15_TO_8_ES          (0x0524)
+#define SBL_REG_CALC_SBC1_TF_ASYM_ES                  (0x0528)
+#define SBL_REG_CALC_SBC1_TF_DEPTH_LOG_7_TO_0_ES      (0x0530)
+#define SBL_REG_CALC_SBC1_TF_DEPTH_LOG_15_TO_8_ES     (0x0534)
+#define SBL_REG_CALC_SBC1_TF_STEP_LOG_7_TO_0_ES       (0x0538)
+#define SBL_REG_CALC_SBC1_TF_STEP_LOG_15_TO_8_ES      (0x053c)
+#define SBL_REG_CALC_SBC1_TF_ASYM_LOG_ES              (0x0540)
+#define SBL_REG_CALC_SBC2_TF_DEPTH_7_TO_0_ES          (0x0548)
+#define SBL_REG_CALC_SBC2_TF_DEPTH_15_TO_8_ES         (0x054c)
+#define SBL_REG_CALC_SBC2_TF_STEP_7_TO_0_ES           (0x0550)
+#define SBL_REG_CALC_SBC2_TF_STEP_15_TO_8_ES          (0x0554)
+#define SBL_REG_CALC_SBC2_TF_ASYM_ES                  (0x0558)
+#define SBL_REG_CALC_SBC2_TF_DEPTH_LOG_7_TO_0_ES      (0x0560)
+#define SBL_REG_CALC_SBC2_TF_DEPTH_LOG_15_TO_8_ES     (0x0564)
+#define SBL_REG_CALC_SBC2_TF_STEP_LOG_7_TO_0_ES       (0x0568)
+#define SBL_REG_CALC_SBC2_TF_STEP_LOG_15_TO_8_ES      (0x056c)
+#define SBL_REG_CALC_SBC2_TF_ASYM_LOG_ES              (0x0570)
+#define SBL_REG_CALC_CALIBRATION_A_7_TO_0_ES          (0x05b8)
+#define SBL_REG_CALC_CALIBRATION_A_15_TO_8_ES         (0x05bc)
+#define SBL_REG_CALC_CALIBRATION_B_7_TO_0_ES          (0x05c0)
+#define SBL_REG_CALC_CALIBRATION_B_15_TO_8_ES         (0x05c4)
+#define SBL_REG_CALC_CALIBRATION_C_7_TO_0_ES          (0x05c8)
+#define SBL_REG_CALC_CALIBRATION_C_15_TO_8_ES         (0x05cc)
+#define SBL_REG_CALC_CALIBRATION_D_7_TO_0_ES          (0x05d0)
+#define SBL_REG_CALC_CALIBRATION_D_15_TO_8_ES         (0x05d4)
+#define SBL_REG_CALC_CALIBRATION_E_7_TO_0_ES          (0x05d8)
+#define SBL_REG_CALC_CALIBRATION_E_15_TO_8_ES         (0x05dc)
+#define SBL_REG_CALC_BACKLIGHT_SCALE_7_TO_0_ES        (0x05e0)
+#define SBL_REG_CALC_BACKLIGHT_SCALE_15_TO_8_ES       (0x05e4)
+#define SBL_REG_CALC_GAIN_AA_TF_DEPTH_7_TO_0_ES       (0x05e8)
+#define SBL_REG_CALC_GAIN_AA_TF_DEPTH_15_TO_8_ES      (0x05ec)
+#define SBL_REG_CALC_GAIN_AA_TF_STEP_7_TO_0_ES        (0x05f0)
+#define SBL_REG_CALC_GAIN_AA_TF_STEP_11_TO_8_ES       (0x05f4)
+#define SBL_REG_CALC_GAIN_AA_TF_ASYM_ES               (0x05f8)
+#define SBL_REG_CALC_STRENGTH_LIMIT_7_TO_0_ES         (0x0600)
+#define SBL_REG_CALC_STRENGTH_LIMIT_9_TO_8_ES         (0x0604)
+#define SBL_REG_CALC_ICUT_HIST_MIN_ES                 (0x0608)
+#define SBL_REG_CALC_ICUT_BL_MIN_7_TO_0_ES            (0x0610)
+#define SBL_REG_CALC_ICUT_BL_MIN_15_TO_8_ES           (0x0614)
+#define SBL_REG_CALC_GAIN_CA_TF_DEPTH_7_TO_0_ES       (0x0618)
+#define SBL_REG_CALC_GAIN_CA_TF_DEPTH_15_TO_8_ES      (0x061c)
+#define SBL_REG_CALC_GAIN_CA_TF_STEP_7_TO_0_ES        (0x0620)
+#define SBL_REG_CALC_GAIN_CA_TF_STEP_11_TO_8_ES       (0x0624)
+#define SBL_REG_CALC_GAIN_CA_TF_ASYM_ES               (0x0628)
+#define SBL_REG_CALC_GAIN_MAX_7_TO_0_ES               (0x0630)
+#define SBL_REG_CALC_GAIN_MAX_11_TO_8_ES              (0x0634)
+#define SBL_REG_CALC_GAIN_MIDDLE_7_TO_0_ES            (0x0638)
+#define SBL_REG_CALC_GAIN_MIDDLE_11_TO_8_ES           (0x063c)
+#define SBL_REG_CALC_BRIGHTPR_ES                      (0x0640)
+#define SBL_REG_CALC_BPR_CORRECT_ES                   (0x0648)
+#define SBL_CALC_BACKLIGHT_OUT_7_TO_0_ES              (0x0650)
+#define SBL_CALC_BACKLIGHT_OUT_15_TO_8_ES             (0x0654)
+#define SBL_CALC_STRENGTH_INROI_OUT_7_TO_0_ES         (0x0658)
+#define SBL_CALC_STRENGTH_INROI_OUT_9_TO_8_ES         (0x065c)
+#define SBL_CALC_STRENGTH_OUTROI_OUT_7_TO_0_ES        (0x0660)
+#define SBL_CALC_STRENGTH_OUTROI_OUT_9_TO_8_ES        (0x0664)
+#define SBL_CALC_DARKENH_OUT_7_TO_0_ES                (0x0668)
+#define SBL_CALC_DARKENH_OUT_15_TO_8_ES               (0x066c)
+#define SBL_CALC_BRIGHTPR_OUT_ES                      (0x0670)
+#define SBL_CALC_STAT_OUT_7_TO_0_ES                   (0x0678)
+#define SBL_CALC_STAT_OUT_15_TO_8_ES                  (0x067c)
+#define SBL_REG_CALC_AL_DELTA_SETTLE_7_TO_0_ES        (0x0680)
+#define SBL_REG_CALC_AL_DELTA_SETTLE_15_TO_8_ES       (0x0684)
+#define SBL_REG_CALC_BL_DELTA_SETTLE_7_TO_0_ES        (0x0688)
+#define SBL_REG_CALC_BL_DELTA_SETTLE_15_TO_8_ES       (0x068c)
+#define SBL_CALC_AL_CALIB_LUT_ADDR_I_ES               (0x06c0)
+#define SBL_CALC_AL_CALIB_LUT_DATA_W_7_TO_0_ES        (0x06d0)
+#define SBL_CALC_AL_CALIB_LUT_DATA_W_15_TO_8_ES       (0x06d4)
+#define SBL_CALC_BL_IN_LUT_ADDR_I_ES                  (0x0700)
+#define SBL_CALC_BL_IN_LUT_DATA_W_7_TO_0_ES           (0x0710)
+#define SBL_CALC_BL_IN_LUT_DATA_W_15_TO_8_ES          (0x0714)
+#define SBL_CALC_BL_OUT_LUT_ADDR_I_ES                 (0x0740)
+#define SBL_CALC_BL_OUT_LUT_DATA_W_7_TO_0_ES          (0x0750)
+#define SBL_CALC_BL_OUT_LUT_DATA_W_15_TO_8_ES         (0x0754)
+#define SBL_CALC_BL_ATTEN_LUT_ADDR_I_ES               (0x0780)
+#define SBL_CALC_BL_ATTEN_LUT_DATA_W_7_TO_0_ES        (0x0790)
+#define SBL_CALC_BL_ATTEN_LUT_DATA_W_15_TO_8_ES       (0x0794)
+#define SBL_CALC_BL_AUTO_LUT_ADDR_I_ES                (0x07c0)
+#define SBL_CALC_BL_AUTO_LUT_DATA_W_7_TO_0_ES         (0x07d0)
+#define SBL_CALC_BL_AUTO_LUT_DATA_W_15_TO_8_ES        (0x07d4)
+#define SBL_CALC_AL_CHANGE_LUT_ADDR_I_ES              (0x0800)
+#define SBL_CALC_AL_CHANGE_LUT_DATA_W_7_TO_0_ES       (0x0810)
+#define SBL_CALC_AL_CHANGE_LUT_DATA_W_15_TO_8_ES      (0x0814)
+#define SBL_REG_CABC_INTENSITY_7_TO_0_ES              (0x0900)
+#define SBL_REG_CABC_INTENSITY_11_TO_8_ES             (0x0904)
+#define SBL_REG_CABC_ICUT_SELECT_ES                   (0x0908)
+#define SBL_REG_CABC_ICUT_MANUAL_ES                   (0x090c)
+#define SBL_CABC_ICUT_OUT_ES                          (0x0910)
+#define SBL_REG_CORE1_VC_CONTROL_0_ES                 (0x0c00)
+#define SBL_REG_CORE1_IRDX_CONTROL_0_ES               (0x0c40)
+#define SBL_REG_CORE1_IRDX_CONTROL_1_ES               (0x0c44)
+#define SBL_REG_CORE1_IRDX_VARIANCE_ES                (0x0c4c)
+#define SBL_REG_CORE1_IRDX_SLOPE_MAX_ES               (0x0c50)
+#define SBL_REG_CORE1_IRDX_SLOPE_MIN_ES               (0x0c54)
+#define SBL_REG_CORE1_IRDX_BLACK_LEVEL_7_TO_0_ES      (0x0c58)
+#define SBL_REG_CORE1_IRDX_BLACK_LEVEL_9_TO_8_ES      (0x0c5c)
+#define SBL_REG_CORE1_IRDX_WHITE_LEVEL_7_TO_0_ES      (0x0c60)
+#define SBL_REG_CORE1_IRDX_WHITE_LEVEL_9_TO_8_ES      (0x0c64)
+#define SBL_REG_CORE1_IRDX_LIMIT_AMPL_ES              (0x0c68)
+#define SBL_REG_CORE1_IRDX_DITHER_ES                  (0x0c6c)
+#define SBL_REG_CORE1_IRDX_STRENGTH_INROI_7_TO_0_ES   (0x0c70)
+#define SBL_REG_CORE1_IRDX_STRENGTH_INROI_9_TO_8_ES   (0x0c74)
+#define SBL_REG_CORE1_IRDX_STRENGTH_OUTROI_7_TO_0_ES  (0x0c78)
+#define SBL_REG_CORE1_IRDX_STRENGTH_OUTROI_9_TO_8_ES  (0x0c7c)
+#define SBL_CORE1_IRDX_ASYMMETRY_LUT_ADDR_I_ES        (0x0c80)
+#define SBL_CORE1_IRDX_ASYMMETRY_LUT_DATA_W_7_TO_0_ES (0x0c84)
+#define SBL_CORE1_IRDX_ASYMMETRY_LUT_DATA_W_11_TO_8_ES (0x0c88)
+#define SBL_CORE1_IRDX_COLOR_LUT_ADDR_I_ES            (0x0cc0)
+#define SBL_CORE1_IRDX_COLOR_LUT_DATA_W_7_TO_0_ES     (0x0cc4)
+#define SBL_CORE1_IRDX_COLOR_LUT_DATA_W_11_TO_8_ES    (0x0cc8)
+#define SBL_REG_CORE1_IRDX_FILTER_CTRL_ES             (0x0d00)
+#define SBL_REG_CORE1_IRDX_SVARIANCE_ES               (0x0d04)
+#define SBL_REG_CORE1_IRDX_BRIGHTPR_ES                (0x0d08)
+#define SBL_REG_CORE1_IRDX_CONTRAST_ES                (0x0d0c)
+#define SBL_REG_CORE1_IRDX_DARKENH_7_TO_0_ES          (0x0d10)
+#define SBL_REG_CORE1_IRDX_DARKENH_15_TO_8_ES         (0x0d14)
+#define SBL_REG_CORE1_DTHR_CONTROL_ES                 (0x0dc0)
+#define SBL_REG_CORE1_LOGO_TOP_ES                     (0x0dd0)
+#define SBL_REG_CORE1_LOGO_LEFT_ES                    (0x0dd4)
+#define SBL_REG_CORE1_CA_D_ARTITHRESH_7_TO_0_ES       (0x0e00)
+#define SBL_REG_CORE1_CA_D_ARTITHRESH_9_TO_8_ES       (0x0e04)
+#define SBL_CORE1_CA_STR_ATTEN_7_TO_0_ES              (0x0e10)
+#define SBL_CORE1_CA_STR_ATTEN_15_TO_8_ES             (0x0e14)
+#define SBL_CORE1_CA_STR_ATTEN_16_ES                  (0x0e18)
+#define SBL_REG_CORE1_FRD_D_THRESH_7_TO_0_ES          (0x0e20)
+#define SBL_REG_CORE1_FRD_D_THRESH_9_TO_8_ES          (0x0e24)
+#define SBL_REG_CORE1_REG0_7_TO_0_ES                  (0x0e28)
+#define SBL_REG_CORE1_REG0_15_TO_8_ES                 (0x0e2c)
+#define SBL_REG_CORE1_REG1_7_TO_0_ES                  (0x0e30)
+#define SBL_REG_CORE1_REG1_15_TO_8_ES                 (0x0e34)
+#define SBL_REG_CORE1_REG2_7_TO_0_ES                  (0x0e38)
+#define SBL_REG_CORE1_REG2_15_TO_8_ES                 (0x0e3c)
+#define SBL_REG_CORE1_REG3_7_TO_0_ES                  (0x0e40)
+#define SBL_REG_CORE1_REG3_15_TO_8_ES                 (0x0e44)
+#define SBL_REG_CORE1_REG4_7_TO_0_ES                  (0x0e48)
+#define SBL_REG_CORE1_REG4_15_TO_8_ES                 (0x0e4c)
+#define SBL_REG_CORE1_REG5_7_TO_0_ES                  (0x0e50)
+#define SBL_REG_CORE1_REG5_15_TO_8_ES                 (0x0e54)
+#define SBL_CORE1_REG_OUT0_7_TO_0_ES                  (0x0e58)
+#define SBL_CORE1_REG_OUT0_15_TO_8_ES                 (0x0e5c)
+#define SBL_CORE1_REG_OUT1_7_TO_0_ES                  (0x0e60)
+#define SBL_CORE1_REG_OUT1_15_TO_8_ES                 (0x0e64)
+
+typedef struct dss_sbl {
+	int sbl_backlight_l;
+	int sbl_backlight_h;
+	int sbl_ambient_light_l;
+	int sbl_ambient_light_h;
+	int sbl_calibration_a_l;
+	int sbl_calibration_a_h;
+	int sbl_calibration_b_l;
+	int sbl_calibration_b_h;
+	int sbl_calibration_c_l;
+	int sbl_calibration_c_h;
+	int sbl_calibration_d_l;
+	int sbl_calibration_d_h;
+	int sbl_enable;
+} dss_sbl_t;
+
+//SBL for 970
+#define SBL_REG_FRMT_MODE                                  (0x0000)
+#define SBL_REG_FRMT_FRAME_DIMEN                           (0x0004)
+#define SBL_REG_FRMT_HW_VERSION                            (0x0014)
+#define SBL_REG_FRMT_ROI_HOR                               (0x0020)
+#define SBL_REG_FRMT_ROI_VER                               (0x0024)
+#define SBL_REG_CALC_CONTROL                               (0x0100)
+#define SBL_REG_AL_BL                                      (0x0104)
+#define SBL_REG_FILTERS_CTRL                               (0x0108)
+#define SBL_REG_MANUAL                                     (0x010c)
+#define SBL_REG_CALC_ROI_FACTOR                            (0x0110)
+#define SBL_REG_CALC_PSR_DELTA                             (0x0114)
+#define SBL_REG_CALC_AL                                    (0x0118)
+#define SBL_REG_CALC_AL_TF_STEP_WAIT                       (0x011c)
+#define SBL_REG_CALC_AL_TF_STEP_SIZE_LIMIT                 (0x0120)
+#define SBL_REG_CALC_AL_TF_ALPHA                           (0x0124)
+#define SBL_REG_CALC_AL_TF_NOISE_M_INC                     (0x0128)
+#define SBL_REG_CALC_AL_TF_K_INC_M_DEC                     (0x012c)
+#define SBL_REG_CALC_AL_TF_K_DEC_AGGRESSIVENESS            (0x0130)
+#define SBL_REG_CALC_AL_RTF_FILTER_A_7_TO_0                (0x0134)
+#define SBL_REG_CALC_AL_RTF_FILTER_C_AB_AL_KNEE1           (0x0138)
+#define SBL_REG_CALC_AB_AL_KNEE2_AB_BL_KNEE1               (0x013c)
+#define SBL_REG_CALC_AB_BL_KNEE2_BL_PANEL_MAX              (0x0140)
+#define SBL_REG_CALC_BL_OFFSET_BL_MIN                      (0x0144)
+#define SBL_REG_CALC_BL_ATTEN_ALPHA_SBC1_TF_DEPTH          (0x0148)
+#define SBL_REG_CALC_SBC1_TF_STEP_SBC1_TF_ASYM             (0x014c)
+#define SBL_REG_CALC_SBC1_TF_DEPTH_LOG_SBC1_TF_STEP_LOG    (0x0150)
+#define SBL_REG_CALC_SBC1_TF_ASYM_LOG_SBC2_TF_DEPTH        (0x0154)
+#define SBL_REG_CALC_SBC2_TF_STEP_SBC2_TF_ASYM             (0x0158)
+#define SBL_REG_CALC_SBC2_TF_DEPTH_LOG_SBC2_TF_STEP_LOG    (0x015c)
+#define SBL_REG_CALC_SBC2_TF_ASYM_LOG                      (0x0160)
+#define SBL_REG_CALC_CALIBRATION_A_B                       (0x0170)
+#define SBL_REG_CALC_CALIBRATION_C_D                       (0x0174)
+#define SBL_REG_CALC_CALIBRATION_E_BACKLIGHT_SCALE         (0x0178)
+#define SBL_REG_CALC_GAIN_AA_TF_DEPTH_STEP                 (0x017c)
+#define SBL_REG_CALC_GAIN_AA_TF_ASYM_STRENGTH_LIMIT        (0x0180)
+#define SBL_REG_CALC_ICUT_HIST_MIN_ICUT_BL_MIN             (0x0184)
+#define SBL_REG_CALC_GAIN_CA_TF_DEPTH_GAIN_CA_TF_STEP      (0x0188)
+#define SBL_REG_CALC_GAIN_CA_TF_ASYM_GAIN_MAX              (0x018c)
+#define SBL_REG_CALC_GAIN_MIDDLE_CALC_BRIGHTPR             (0x0190)
+#define SBL_REG_CALC_BPR_CORRECT_CALC_BACKLIGHT_OUT        (0x0194)
+#define SBL_CALC_STRENGTH_INROI_OUTROI_OUT                 (0x0198)
+#define SBL_CALC_DARKENH_OUT_CALC_BRIGHTPR_OUT             (0x019c)
+#define SBL_CALC_STAT_OUT                                  (0x01A0)
+#define SBL_REG_CALC_BL_DELTA_SETTLE                       (0x01A4)
+#define SBL_CALC_AL_CALIB_LUT_ADDR_I                       (0x01B0)
+#define SBL_CALC_AL_CALIB_LUT_DATA_W                       (0x01B4)
+#define SBL_CALC_BL_IN_LUT_ADDR_I                          (0x01C0)
+#define SBL_CALC_BL_IN_LUT_DATA_W                          (0x01C4)
+#define SBL_CALC_BL_OUT_LUT_ADDR_I                         (0x01D0)
+#define SBL_CALC_BL_OUT_LUT_DATA_W                         (0x01D4)
+#define SBL_CALC_BL_ATTEN_LUT_ADDR_I                       (0x01E0)
+#define SBL_CALC_BL_ATTEN_LUT_DATA_W                       (0x01E4)
+#define SBL_CALC_BL_AUTO_LUT_ADDR_I                        (0x01F0)
+#define SBL_CALC_BL_AUTO_LUT_DATA_W                        (0x01F4)
+#define SBL_CALC_AL_CHANGE_LUT_ADDR_I                      (0x0200)
+#define SBL_CALC_AL_CHANGE_LUT_DATA_W                      (0x0204)
+#define SBL_REG_CABC_INTENSITY_CABC_ICUT_SELECT            (0x0240)
+#define SBL_REG_CABC_ICUT_MANUAL_CABC_ICUT_OUT             (0x0244)
+#define SBL_REG_VC_VC_CONTROL_0                            (0x0300)
+#define SBL_REG_VC_IRDX_CONTROL                            (0x0308)
+#define SBL_REG_VC_IRDX_ALPHA_MANUAL_VC_IRDX_BETA_MANUA    (0x030c)
+#define SBL_REG_VC_IRDX_VARIANCE                           (0x0310)
+#define SBL_REG_VC_IRDX_SLOPE_MAX_MIN                      (0x0314)
+#define SBL_REG_VC_IRDX_BLACK_WHITE_LEVEL_7_TO_0           (0x0318)
+#define SBL_REG_VC_IRDX_LIMIT_AMPL_VC_IRDX_DITHER          (0x031c)
+#define SBL_REG_VC_IRDX_STRENGTH_INROI_OUTROI              (0x0320)
+#define SBL_CORE1_IRDX_ASYMMETRY_LUT_ADDR_I                (0x0324)
+#define SBL_CORE1_IRDX_ASYMMETRY_LUT_DATA_W                (0x0328)
+#define SBL_CORE1_IRDX_COLOR_LUT_ADDR_I                    (0x0334)
+#define SBL_CORE1_IRDX_COLOR_LUT_DATA_W                    (0x0338)
+#define SBL_REG_VC_IRDX_FILTER_CTRL                        (0x0344)
+#define SBL_REG_VC_IRDX_BRIGHTPR                           (0x0348)
+#define SBL_REG_VC_IRDX_CONTRAST                           (0x034c)
+#define SBL_REG_VC_IRDX_DARKENH                            (0x0350)
+#define SBL_REG_VC_DTHR_CONTROL                            (0x0370)
+#define SBL_REG_VC_LOGO_TOP_LEFT                           (0x0374)
+#define SBL_REG_VC_CA_D_ARTITHRESH                         (0x0380)
+#define SBL_VC_CA_STR_ATTEN                                (0x0384)
+#define SBL_REG_VC_REG1_REG2                               (0x038c)
+#define SBL_REG_VC_REG3_REG4                               (0x0390)
+#define SBL_REG_VC_REG5_REG_OUT0                           (0x0394)
+#define SBL_VC_REG_OUT1                                    (0x0398)
+#define SBL_VC_ANTI_FLCKR_CONTROL                          (0x039c)
+#define SBL_VC_ANTI_FLCKR_RFD_FRD_THR                      (0x03a0)
+#define SBL_VC_ANTI_FLCKR_SCD_THR_ANTI_FLCKR_FD3_SC_DLY    (0x03a4)
+#define SBL_VC_ANTI_FLCKR_AL_ANTI_FLCKR_T_DURATION         (0x03a8)
+#define SBL_VC_ANTI_FLCKR_ALPHA                            (0x03ac)
+
+/*******************************************************************************
+** DPP
+*/
+//DPP TOP
+#define DPP_RD_SHADOW_SEL	(0x000)
+#define DPP_DEFAULT	(0x004)
+#define DPP_ID	(0x008)
+#define DPP_IMG_SIZE_BEF_SR	(0x00C)
+#define DPP_IMG_SIZE_AFT_SR	(0x010)
+#define DPP_SBL	(0x014)
+#define DPP_SBL_MEM_CTRL	(0x018)
+//#define DPP_ARSR1P_MEM_CTRL	(0x01C)
+#define DPP_ARSR_POST_MEM_CTRL	(0x01C)
+#define DPP_CLK_SEL	(0x020)
+#define DPP_CLK_EN	(0x024)
+#define DPP_DBG1_CNT	(0x028)
+#define DPP_DBG2_CNT	(0x02C)
+#define DPP_DBG1	(0x030)
+#define DPP_DBG2	(0x034)
+#define DPP_DBG3	(0x038)
+#define DPP_DBG4	(0x03C)
+#define DPP_INTS	(0x040)
+#define DPP_INT_MSK	(0x044)
+//#define DPP_ARSR1P	(0x048)
+#define DPP_DBG_CNT  DPP_DBG1_CNT
+
+
+//COLORBAR
+#define DPP_CLRBAR_CTRL (0x100)
+#define DPP_CLRBAR_1ST_CLR (0x104)
+#define DPP_CLRBAR_2ND_CLR (0x108)
+#define DPP_CLRBAR_3RD_CLR (0x10C)
+
+//DPP CLIP
+#define DPP_CLIP_TOP (0x180)
+#define DPP_CLIP_BOTTOM (0x184)
+#define DPP_CLIP_LEFT (0x188)
+#define DPP_CLIP_RIGHT (0x18C)
+#define DPP_CLIP_EN (0x190)
+#define DPP_CLIP_DBG (0x194)
+
+//DITHER
+#define DITHER_CTL1 (0x000)
+#define DITHER_CTL0 (0x004)
+#define DITHER_TRI_THD12_0 (0x008)
+#define DITHER_TRI_THD12_1 (0x00C)
+#define DITHER_TRI_THD10 (0x010)
+#define DITHER_TRI_THD12_UNI_0 (0x014)
+#define DITHER_TRI_THD12_UNI_1 (0x018)
+#define DITHER_TRI_THD10_UNI (0x01C)
+#define DITHER_BAYER_CTL (0x020)
+#define DITHER_BAYER_ALPHA_THD (0x024)
+#define DITHER_MATRIX_PART1 (0x028)
+#define DITHER_MATRIX_PART0 (0x02C)
+#define DITHER_HIFREQ_REG_INI_CFG_EN (0x030)
+#define DITHER_HIFREQ_REG_INI0_0 (0x034)
+#define DITHER_HIFREQ_REG_INI0_1 (0x038)
+#define DITHER_HIFREQ_REG_INI0_2 (0x03C)
+#define DITHER_HIFREQ_REG_INI0_3 (0x040)
+#define DITHER_HIFREQ_REG_INI1_0 (0x044)
+#define DITHER_HIFREQ_REG_INI1_1 (0x048)
+#define DITHER_HIFREQ_REG_INI1_2 (0x04C)
+#define DITHER_HIFREQ_REG_INI1_3 (0x050)
+#define DITHER_HIFREQ_REG_INI2_0 (0x054)
+#define DITHER_HIFREQ_REG_INI2_1 (0x058)
+#define DITHER_HIFREQ_REG_INI2_2 (0x05C)
+#define DITHER_HIFREQ_REG_INI2_3 (0x060)
+#define DITHER_HIFREQ_POWER_CTRL (0x064)
+#define DITHER_HIFREQ_FILT_0 (0x068)
+#define DITHER_HIFREQ_FILT_1 (0x06C)
+#define DITHER_HIFREQ_FILT_2 (0x070)
+#define DITHER_HIFREQ_THD_R0 (0x074)
+#define DITHER_HIFREQ_THD_R1 (0x078)
+#define DITHER_HIFREQ_THD_G0 (0x07C)
+#define DITHER_HIFREQ_THD_G1 (0x080)
+#define DITHER_HIFREQ_THD_B0 (0x084)
+#define DITHER_HIFREQ_THD_B1 (0x088)
+#define DITHER_HIFREQ_DBG0 (0x08C)
+#define DITHER_HIFREQ_DBG1 (0x090)
+#define DITHER_HIFREQ_DBG2 (0x094)
+#define DITHER_ERRDIFF_CTL (0x098)
+#define DITHER_ERRDIFF_WEIGHT (0x09C)
+#define DITHER_FRC_CTL (0x0A0)
+#define DITHER_FRC_01_PART1 (0x0A4)
+#define DITHER_FRC_01_PART0 (0x0A8)
+#define DITHER_FRC_10_PART1 (0x0AC)
+#define DITHER_FRC_10_PART0 (0x0B0)
+#define DITHER_FRC_11_PART1 (0x0B4)
+#define DITHER_FRC_11_PART0 (0x0B8)
+#define DITHER_MEM_CTRL (0x0BC)
+#define DITHER_DBG0 (0x0C0)
+#define DITHER_DBG1 (0x0C4)
+#define DITHER_DBG2 (0x0C8)
+#define DITHER_CTRL2 (0x0CC)
+
+//Dither for ES
+#define DITHER_PARA_ES (0x000)
+#define DITHER_CTL_ES (0x004)
+#define DITHER_MATRIX_PART1_ES (0x008)
+#define DITHER_MATRIX_PART0_ES (0x00C)
+#define DITHER_ERRDIFF_WEIGHT_ES (0x010)
+#define DITHER_FRC_01_PART1_ES (0x014)
+#define DITHER_FRC_01_PART0_ES (0x018)
+#define DITHER_FRC_10_PART1_ES (0x01C)
+#define DITHER_FRC_10_PART0_ES (0x020)
+#define DITHER_FRC_11_PART1_ES (0x024)
+#define DITHER_FRC_11_PART0_ES (0x028)
+#define DITHER_MEM_CTRL_ES (0x02C)
+#define DITHER_DBG0_ES (0x030)
+#define DITHER_DBG1_ES (0x034)
+#define DITHER_DBG2_ES (0x038)
+
+
+
+//CSC_RGB2YUV_10bits  CSC_YUV2RGB_10bits
+#define CSC10B_IDC0	(0x000)
+#define CSC10B_IDC1	(0x004)
+#define CSC10B_IDC2	(0x008)
+#define CSC10B_ODC0	(0x00C)
+#define CSC10B_ODC1	(0x010)
+#define CSC10B_ODC2	(0x014)
+#define CSC10B_P00	(0x018)
+#define CSC10B_P01	(0x01C)
+#define CSC10B_P02	(0x020)
+#define CSC10B_P10	(0x024)
+#define CSC10B_P11	(0x028)
+#define CSC10B_P12	(0x02C)
+#define CSC10B_P20	(0x030)
+#define CSC10B_P21	(0x034)
+#define CSC10B_P22	(0x038)
+#define CSC10B_MODULE_EN	(0x03C)
+#define CSC10B_MPREC	(0x040)
+
+//GAMA
+#define GAMA_EN	(0x000)
+#define GAMA_MEM_CTRL	(0x004)
+#define GAMA_LUT_SEL (0x008)
+#define GAMA_DBG0 (0x00C)
+#define GAMA_DBG1 (0x010)
+
+//ACM for ES
+#define ACM_EN_ES            (0x000)
+#define ACM_SATA_OFFSET_ES   (0x004)
+#define ACM_HUESEL_ES        (0x008)
+#define ACM_CSC_IDC0_ES      (0x00C)
+#define ACM_CSC_IDC1_ES      (0x010)
+#define ACM_CSC_IDC2_ES      (0x014)
+#define ACM_CSC_P00_ES       (0x018)
+#define ACM_CSC_P01_ES       (0x01C)
+#define ACM_CSC_P02_ES       (0x020)
+#define ACM_CSC_P10_ES       (0x024)
+#define ACM_CSC_P11_ES       (0x028)
+#define ACM_CSC_P12_ES       (0x02C)
+#define ACM_CSC_P20_ES       (0x030)
+#define ACM_CSC_P21_ES       (0x034)
+#define ACM_CSC_P22_ES       (0x038)
+#define ACM_CSC_MRREC_ES     (0x03C)
+#define ACM_R0_H_ES          (0x040)
+#define ACM_R1_H_ES          (0x044)
+#define ACM_R2_H_ES          (0x048)
+#define ACM_R3_H_ES          (0x04C)
+#define ACM_R4_H_ES          (0x050)
+#define ACM_R5_H_ES          (0x054)
+#define ACM_R6_H_ES          (0x058)
+#define ACM_LUT_DIS0_ES      (0x05C)
+#define ACM_LUT_DIS1_ES      (0x060)
+#define ACM_LUT_DIS2_ES      (0x064)
+#define ACM_LUT_DIS3_ES      (0x068)
+#define ACM_LUT_DIS4_ES      (0x06C)
+#define ACM_LUT_DIS5_ES      (0x070)
+#define ACM_LUT_DIS6_ES      (0x074)
+#define ACM_LUT_DIS7_ES      (0x078)
+#define ACM_LUT_PARAM0_ES    (0x07C)
+#define ACM_LUT_PARAM1_ES    (0x080)
+#define ACM_LUT_PARAM2_ES    (0x084)
+#define ACM_LUT_PARAM3_ES    (0x088)
+#define ACM_LUT_PARAM4_ES    (0x08C)
+#define ACM_LUT_PARAM5_ES    (0x090)
+#define ACM_LUT_PARAM6_ES    (0x094)
+#define ACM_LUT_PARAM7_ES    (0x098)
+#define ACM_LUT_SEL_ES       (0x09C)
+#define ACM_MEM_CTRL_ES      (0x0A0)
+#define ACM_DEBUG_TOP_ES     (0x0A4)
+#define ACM_DEBUG_CFG_ES     (0x0A8)
+#define ACM_DEBUG_W_ES       (0x0AC)
+
+
+//ACM
+#define ACM_EN	(0x000)
+#define ACM_SATA_OFFSET	(0x004)
+#define ACM_CSC_IDC0 (0x00C)
+#define ACM_CSC_IDC1 (0x010)
+#define ACM_CSC_IDC2 (0x014)
+#define ACM_CSC_P00 (0x018)
+#define ACM_CSC_P01 (0x01C)
+#define ACM_CSC_P02 (0x020)
+#define ACM_CSC_P10 (0x024)
+#define ACM_CSC_P11 (0x028)
+#define ACM_CSC_P12 (0x02C)
+#define ACM_CSC_P20 (0x030)
+#define ACM_CSC_P21 (0x034)
+#define ACM_CSC_P22 (0x038)
+#define ACM_HUE_RLH01 (0x040)
+#define ACM_HUE_RLH23 (0x044)
+#define ACM_HUE_RLH45 (0x048)
+#define ACM_HUE_RLH67 (0x04C)
+#define ACM_HUE_PARAM01 (0x060)
+#define ACM_HUE_PARAM23 (0x064)
+#define ACM_HUE_PARAM45 (0x068)
+#define ACM_HUE_PARAM67 (0x06C)
+#define ACM_HUE_SMOOTH0 (0x070)
+#define ACM_HUE_SMOOTH1 (0x074)
+#define ACM_HUE_SMOOTH2 (0x078)
+#define ACM_HUE_SMOOTH3 (0x07C)
+#define ACM_HUE_SMOOTH4 (0x080)
+#define ACM_HUE_SMOOTH5 (0x084)
+#define ACM_HUE_SMOOTH6 (0x088)
+#define ACM_HUE_SMOOTH7 (0x08C)
+#define ACM_LUT_SEL (0x09C)
+#define ACM_MEM_CTRL (0x0A0)
+#define ACM_DBG_TOP (0x0A4)
+#define ACM_DBG_CFG (0x0A8)
+#define ACM_DBG_W (0x0AC)
+#define ACM_COLOR_CHOOSE (0x0B0)
+#define ACM_RGB2YUV_IDC0 (0x0C0)
+#define ACM_RGB2YUV_IDC1 (0x0C4)
+#define ACM_RGB2YUV_IDC2 (0x0C8)
+#define ACM_RGB2YUV_P00 (0x0CC)
+#define ACM_RGB2YUV_P01 (0x0D0)
+#define ACM_RGB2YUV_P02 (0x0D4)
+#define ACM_RGB2YUV_P10 (0x0D8)
+#define ACM_RGB2YUV_P11 (0x0DC)
+#define ACM_RGB2YUV_P12 (0x0E0)
+#define ACM_RGB2YUV_P20 (0x0E4)
+#define ACM_RGB2YUV_P21 (0x0E8)
+#define ACM_RGB2YUV_P22 (0x0EC)
+#define ACM_FACE_CRTL (0x100)
+#define ACM_FACE_STARTXY (0x104)
+#define ACM_FACE_SMOOTH_LEN01 (0x108)
+#define ACM_FACE_SMOOTH_LEN23 (0x10C)
+#define ACM_FACE_SMOOTH_PARAM0 (0x118)
+#define ACM_FACE_SMOOTH_PARAM1 (0x11C)
+#define ACM_FACE_SMOOTH_PARAM2 (0x120)
+#define ACM_FACE_SMOOTH_PARAM3 (0x124)
+#define ACM_FACE_SMOOTH_PARAM4 (0x128)
+#define ACM_FACE_SMOOTH_PARAM5 (0x12C)
+#define ACM_FACE_SMOOTH_PARAM6 (0x130)
+#define ACM_FACE_SMOOTH_PARAM7 (0x134)
+#define ACM_FACE_AREA_SEL (0x138)
+#define ACM_FACE_SAT_LH (0x13C)
+#define ACM_FACE_SAT_SMOOTH_LH (0x140)
+#define ACM_FACE_SAT_SMO_PARAM_LH (0x148)
+#define ACM_L_CONT_EN (0x160)
+#define ACM_LC_PARAM01 (0x174)
+#define ACM_LC_PARAM23 (0x178)
+#define ACM_LC_PARAM45 (0x17C)
+#define ACM_LC_PARAM67 (0x180)
+#define ACM_L_ADJ_CTRL (0x1A0)
+#define ACM_CAPTURE_CTRL (0x1B0)
+#define ACM_CAPTURE_IN (0x1B4)
+#define ACM_CAPTURE_OUT (0x1B8)
+#define ACM_INK_CTRL (0x1C0)
+#define ACM_INK_OUT (0x1C4)
+//#define ACM_HUESEL	(0x008)
+//#define ACM_CSC_MRREC	(0x03C)
+//#define ACM_R0_H	(0x040)
+//#define ACM_R1_H	(0x044)
+//#define ACM_R2_H	(0x048)
+//#define ACM_R3_H	(0x04C)
+//#define ACM_R4_H	(0x050)
+//#define ACM_R5_H	(0x054)
+//#define ACM_R6_H	(0x058)
+//#define ACM_LUT_DIS0	(0x05C)
+//#define ACM_LUT_DIS1	(0x060)
+//#define ACM_LUT_DIS2	(0x064)
+//#define ACM_LUT_DIS3	(0x068)
+//#define ACM_LUT_DIS4	(0x06C)
+//#define ACM_LUT_DIS5	(0x070)
+//#define ACM_LUT_DIS6	(0x074)
+//#define ACM_LUT_DIS7	(0x078)
+//#define ACM_LUT_PARAM0	(0x07C)
+//#define ACM_LUT_PARAM1	(0x080)
+//#define ACM_LUT_PARAM2	(0x084)
+//#define ACM_LUT_PARAM3	(0x088)
+//#define ACM_LUT_PARAM4	(0x08C)
+//#define ACM_LUT_PARAM5	(0x090)
+//#define ACM_LUT_PARAM6	(0x094)
+//#define ACM_LUT_PARAM7	(0x098)
+//#define ACM_DEBUG_TOP	(0x0A4)
+//#define ACM_DEBUG_CFG	(0x0A8)
+//#define ACM_DEBUG_W	(0x0AC)
+
+//ACE FOR ES
+#define ACE_EN	(0x000)
+#define ACE_SKIN_CFG	(0x004)
+#define ACE_LUT_SEL	(0x008)
+#define ACE_HIST_IND	(0x00C)
+#define ACE_ACTIVE	(0x010)
+#define ACE_DBG	(0x014)
+#define ACE_MEM_CTRL	(0x018)
+#define ACE_IN_SEL	(0x01C)
+#define ACE_R2Y	(0x020)
+#define ACE_G2Y	(0x024)
+#define ACE_B2Y	(0x028)
+#define ACE_Y_OFFSET	(0x02C)
+#define ACE_Y_CEN	(0x030)
+#define ACE_U_CEN	(0x034)
+#define ACE_V_CEN	(0x038)
+#define ACE_Y_EXT	(0x03C)
+#define ACE_U_EXT	(0x040)
+#define ACE_V_EXT	(0x044)
+#define ACE_Y_ATTENU 	(0x048)
+#define ACE_U_ATTENU	(0x04C)
+#define ACE_V_ATTENU	(0x050)
+#define ACE_ROTA	(0x054)
+#define ACE_ROTB 	(0x058)
+#define ACE_Y_CORE	(0x05C)
+#define ACE_U_CORE	(0x060)
+#define ACE_V_CORE	(0x064)
+
+//LCP
+//#define LCP_XCC_COEF_00	(0x000)
+//#define LCP_XCC_COEF_01	(0x004)
+//#define LCP_XCC_COEF_02	(0x008)
+//#define LCP_XCC_COEF_03	(0x00C)
+//#define LCP_XCC_COEF_10	(0x010)
+//#define LCP_XCC_COEF_11	(0x014)
+//#define LCP_XCC_COEF_12	(0x018)
+//#define LCP_XCC_COEF_13	(0x01C)
+//#define LCP_XCC_COEF_20	(0x020)
+//#define LCP_XCC_COEF_21	(0x024)
+//#define LCP_XCC_COEF_22	(0x028)
+//#define LCP_XCC_COEF_23	(0x02C)
+#define LCP_GMP_BYPASS_EN_ES	(0x030)
+#define LCP_XCC_BYPASS_EN_ES	(0x034)
+#define LCP_DEGAMA_EN_ES	(0x038)
+#define LCP_DEGAMA_MEM_CTRL_ES	(0x03C)
+#define LCP_GMP_MEM_CTRL_ES	(0x040)
+
+//XCC
+#define XCC_COEF_00 (0x000)
+#define XCC_COEF_01 (0x004)
+#define XCC_COEF_02 (0x008)
+#define XCC_COEF_03 (0x00C)
+#define XCC_COEF_10 (0x010)
+#define XCC_COEF_11 (0x014)
+#define XCC_COEF_12 (0x018)
+#define XCC_COEF_13 (0x01C)
+#define XCC_COEF_20 (0x020)
+#define XCC_COEF_21 (0x024)
+#define XCC_COEF_22 (0x028)
+#define XCC_COEF_23 (0x02C)
+#define XCC_EN (0x034)
+
+//DEGAMMA
+#define DEGAMA_EN (0x000)
+#define DEGAMA_MEM_CTRL (0x004)
+#define DEGAMA_LUT_SEL (0x008)
+#define DEGAMA_DBG0 (0x00C)
+#define DEGAMA_DBG1 (0x010)
+
+//GMP
+#define GMP_EN (0x000)
+#define GMP_MEM_CTRL (0x004)
+#define GMP_LUT_SEL (0x008)
+#define GMP_DBG_W0 (0x00C)
+#define GMP_DBG_R0 (0x010)
+#define GMP_DBG_R1 (0x014)
+#define GMP_DBG_R2 (0x018)
+
+//ARSR1P ES
+#define ARSR1P_IHLEFT_ES             	(0x000)
+#define ARSR1P_IHRIGHT_ES          (0x004)
+#define ARSR1P_IHLEFT1_ES          (0x008)
+#define ARSR1P_IHRIGHT1_ES         (0x00C)
+#define ARSR1P_IVTOP_ES            (0x010)
+#define ARSR1P_IVBOTTOM_ES         (0x014)
+#define ARSR1P_UV_OFFSET_ES          	(0x018)
+#define ARSR1P_IHINC_ES            (0x01C)
+#define ARSR1P_IVINC_ES            (0x020)
+#define ARSR1P_MODE_ES               	(0x024)
+#define ARSR1P_FORMAT_ES           (0x028)
+#define ARSR1P_SKIN_THRES_Y_ES       	(0x02C)
+#define ARSR1P_SKIN_THRES_U_ES       	(0x030)
+#define ARSR1P_SKIN_THRES_V_ES       	(0x034)
+#define ARSR1P_SKIN_EXPECTED_ES    (0x038)
+#define ARSR1P_SKIN_CFG_ES           	(0x03C)
+#define ARSR1P_SHOOT_CFG1_ES         	(0x040)
+#define ARSR1P_SHOOT_CFG2_ES         	(0x044)
+#define ARSR1P_SHARP_CFG1_ES         	(0x048)
+#define ARSR1P_SHARP_CFG2_ES         	(0x04C)
+#define ARSR1P_SHARP_CFG3_ES         	(0x050)
+#define ARSR1P_SHARP_CFG4_ES         	(0x054)
+#define ARSR1P_SHARP_CFG5_ES         	(0x058)
+#define ARSR1P_SHARP_CFG6_ES         	(0x05C)
+#define ARSR1P_SHARP_CFG7_ES         	(0x060)
+#define ARSR1P_SHARP_CFG8_ES         	(0x064)
+#define ARSR1P_SHARP_CFG9_ES         	(0x068)
+#define ARSR1P_SHARP_CFG10_ES        	(0x06C)
+#define ARSR1P_SHARP_CFG11_ES        	(0x070)
+#define ARSR1P_DIFF_CTRL_ES          	(0x074)
+#define ARSR1P_LSC_CFG1_ES         (0x078)
+#define ARSR1P_LSC_CFG2_ES         (0x07C)
+#define ARSR1P_LSC_CFG3_ES         (0x080)
+#define ARSR1P_FORCE_CLK_ON_CFG_ES   	(0x084)
+
+
+//ARSR1P
+typedef struct dss_arsr1p {
+	uint32_t ihleft;
+	uint32_t ihright;
+	uint32_t ihleft1;
+	uint32_t ihright1;
+	uint32_t ivtop;
+	uint32_t ivbottom;
+	uint32_t uv_offset;
+	uint32_t ihinc;
+	uint32_t ivinc;
+	uint32_t mode;
+	uint32_t format;
+
+	uint32_t skin_thres_y;
+	uint32_t skin_thres_u;
+	uint32_t skin_thres_v;
+	uint32_t skin_expected;
+	uint32_t skin_cfg;
+	uint32_t shoot_cfg1;
+	uint32_t shoot_cfg2;
+	uint32_t shoot_cfg3;
+	uint32_t sharp_cfg1_h;
+	uint32_t sharp_cfg1_l;
+	uint32_t sharp_cfg2_h;
+	uint32_t sharp_cfg2_l;
+	uint32_t sharp_cfg3;
+	uint32_t sharp_cfg4;
+	uint32_t sharp_cfg5;
+	uint32_t sharp_cfg6;
+	uint32_t sharp_cfg6_cut;
+	uint32_t sharp_cfg7;
+	uint32_t sharp_cfg7_ratio;
+	uint32_t sharp_cfg8;
+	uint32_t sharp_cfg9;
+	uint32_t sharp_cfg10;
+	uint32_t sharp_cfg11;
+	uint32_t diff_ctrl;
+	uint32_t skin_slop_y;
+	uint32_t skin_slop_u;
+	uint32_t skin_slop_v;
+	uint32_t force_clk_on_cfg;
+
+	uint32_t dbuf_frm_size;
+	uint32_t dbuf_frm_hsize;
+	uint32_t dbuf_used;
+
+	uint32_t dpp_img_size_bef_sr;
+	uint32_t dpp_img_size_aft_sr;
+	uint32_t dpp_used;
+
+	//for ES
+	uint32_t sharp_cfg1;
+	uint32_t sharp_cfg2;
+	uint32_t lsc_cfg1;
+	uint32_t lsc_cfg2;
+	uint32_t lsc_cfg3;
+
+} dss_arsr1p_t;
+
+#define ARSR1P_INC_FACTOR (65536)
+
+#define ARSR_POST_IHLEFT (0x000)
+#define ARSR_POST_IHRIGHT (0x004)
+#define ARSR_POST_IHLEFT1 (0x008)
+#define ARSR_POST_IHRIGHT1 (0x00C)
+#define ARSR_POST_IVTOP (0x010)
+#define ARSR_POST_IVBOTTOM (0x014)
+#define ARSR_POST_UV_OFFSET (0x018)
+#define ARSR_POST_IHINC (0x01C)
+#define ARSR_POST_IVINC (0x020)
+#define ARSR_POST_MODE (0x024)
+#define ARSR_POST_FORMAT (0x028)
+#define ARSR_POST_SKIN_THRES_Y (0x02C)
+#define ARSR_POST_SKIN_THRES_U (0x030)
+#define ARSR_POST_SKIN_THRES_V (0x034)
+#define ARSR_POST_SKIN_EXPECTED (0x038)
+#define ARSR_POST_SKIN_CFG (0x03C)
+#define ARSR_POST_SHOOT_CFG1 (0x040)
+#define ARSR_POST_SHOOT_CFG2 (0x044)
+#define ARSR_POST_SHOOT_CFG3 (0x048)
+#define ARSR_POST_SHARP_CFG1_H (0x04C)
+#define ARSR_POST_SHARP_CFG1_L (0x050)
+#define ARSR_POST_SHARP_CFG2_H (0x054)
+#define ARSR_POST_SHARP_CFG2_L (0x058)
+#define ARSR_POST_SHARP_CFG3 (0x05C)
+#define ARSR_POST_SHARP_CFG4 (0x060)
+#define ARSR_POST_SHARP_CFG5 (0x064)
+#define ARSR_POST_SHARP_CFG6 (0x068)
+#define ARSR_POST_SHARP_CFG6_CUT (0x06C)
+#define ARSR_POST_SHARP_CFG7 (0x070)
+#define ARSR_POST_SHARP_CFG7_RATIO (0x074)
+#define ARSR_POST_SHARP_CFG8 (0x078)
+#define ARSR_POST_SHARP_CFG9 (0x07C)
+#define ARSR_POST_SHARP_CFG10 (0x080)
+#define ARSR_POST_SHARP_CFG11 (0x084)
+#define ARSR_POST_DIFF_CTRL (0x088)
+#define ARSR_POST_SKIN_SLOP_Y (0x08C)
+#define ARSR_POST_SKIN_SLOP_U (0x090)
+#define ARSR_POST_SKIN_SLOP_V (0x094)
+#define ARSR_POST_FORCE_CLK_ON_CFG (0x098)
+#define ARSR_POST_DEBUG_RW_0 (0x09C)
+#define ARSR_POST_DEBUG_RW_1 (0x0A0)
+#define ARSR_POST_DEBUG_RW_2 (0x0A4)
+#define ARSR_POST_DEBUG_RO_0 (0x0A8)
+#define ARSR_POST_DEBUG_RO_1 (0x0AC)
+#define ARSR_POST_DEBUG_RO_2 (0x0B0)
+
+
+/*******************************************************************************
+** BIT EXT
+*/
+//#define BIT_EXT0_CTL (0x000)
+
+//GAMA LUT
+#define U_GAMA_R_COEF	(0x000)
+#define U_GAMA_G_COEF	(0x400)
+#define U_GAMA_B_COEF	(0x800)
+#define U_GAMA_R_LAST_COEF (0x200)
+#define U_GAMA_G_LAST_COEF (0x600)
+#define U_GAMA_B_LAST_COEF (0xA00)
+
+//GAMA PRE LUT
+#define U_GAMA_PRE_R_COEF	(0x000)
+#define U_GAMA_PRE_G_COEF	(0x400)
+#define U_GAMA_PRE_B_COEF	(0x800)
+#define U_GAMA_PRE_R_LAST_COEF (0x200)
+#define U_GAMA_PRE_G_LAST_COEF (0x600)
+#define U_GAMA_PRE_B_LAST_COEF (0xA00)
+
+//ACM LUT
+#define ACM_U_H_COEF	(0x000)
+#define ACM_U_SATA_COEF	(0x200)
+#define ACM_U_SATR0_COEF	(0x300)
+#define ACM_U_SATR1_COEF	(0x340)
+#define ACM_U_SATR2_COEF	(0x380)
+#define ACM_U_SATR3_COEF	(0x3C0)
+#define ACM_U_SATR4_COEF	(0x400)
+#define ACM_U_SATR5_COEF	(0x440)
+#define ACM_U_SATR6_COEF	(0x480)
+#define ACM_U_SATR7_COEF	(0x4C0)
+#define ACM_U_ACM_SATR_FACE_COEF (0x500)
+#define ACM_U_ACM_LTA_COEF (0x580)
+#define ACM_U_ACM_LTR0_COEF (0x600)
+#define ACM_U_ACM_LTR1_COEF (0x640)
+#define ACM_U_ACM_LTR2_COEF (0x680)
+#define ACM_U_ACM_LTR3_COEF (0x6C0)
+#define ACM_U_ACM_LTR4_COEF (0x700)
+#define ACM_U_ACM_LTR5_COEF (0x740)
+#define ACM_U_ACM_LTR6_COEF (0x780)
+#define ACM_U_ACM_LTR7_COEF (0x7C0)
+#define ACM_U_ACM_LH0_COFF (0x800)
+#define ACM_U_ACM_LH1_COFF (0x880)
+#define ACM_U_ACM_LH2_COFF (0x900)
+#define ACM_U_ACM_LH3_COFF (0x980)
+#define ACM_U_ACM_LH4_COFF (0xA00)
+#define ACM_U_ACM_LH5_COFF (0xA80)
+#define ACM_U_ACM_LH6_COFF (0xB00)
+#define ACM_U_ACM_LH7_COFF (0xB80)
+#define ACM_U_ACM_CH0_COFF (0xC00)
+#define ACM_U_ACM_CH1_COFF (0xC80)
+#define ACM_U_ACM_CH2_COFF (0xD00)
+#define ACM_U_ACM_CH3_COFF (0xD80)
+#define ACM_U_ACM_CH4_COFF (0xE00)
+#define ACM_U_ACM_CH5_COFF (0xE80)
+#define ACM_U_ACM_CH6_COFF (0xF00)
+#define ACM_U_ACM_CH7_COFF (0xF80)
+
+//LCP LUT
+#define GMP_U_GMP_COEF	(0x0000)
+
+//#define LCP_U_DEGAMA_R_COEF	(0x5000)
+//#define LCP_U_DEGAMA_G_COEF	(0x5400)
+//#define LCP_U_DEGAMA_B_COEF	(0x5800)
+//#define LCP_U_DEGAMA_R_LAST_COEF (0x5200)
+//#define LCP_U_DEGAMA_G_LAST_COEF (0x5600)
+//#define LCP_U_DEGAMA_B_LAST_COEF (0x5A00)
+#define U_DEGAMA_R_COEF	(0x0000)
+#define U_DEGAMA_G_COEF	(0x0400)
+#define U_DEGAMA_B_COEF	(0x0800)
+#define U_DEGAMA_R_LAST_COEF (0x0200)
+#define U_DEGAMA_G_LAST_COEF (0x0600)
+#define U_DEGAMA_B_LAST_COEF (0x0A00)
+
+//ACE LUT
+//#define ACE_HIST0	(0x000)
+//#define ACE_HIST1	(0x400)
+//#define ACE_LUT0	(0x800)
+//#define ACE_LUT1	(0xA00)
+
+//ARSR1P LUT for ES
+#define ARSR1P_LSC_GAIN_ES		(0x084)  //0xB07C+0x4*range27
+#define ARSR1P_COEFF_H_Y0_ES	(0x0F0)  //0xB0E8+0x4*range9
+#define ARSR1P_COEFF_H_Y1_ES	(0x114)  //0xB10C+0x4*range9
+#define ARSR1P_COEFF_V_Y0_ES	(0x138)  //0xB130+0x4*range9
+#define ARSR1P_COEFF_V_Y1_ES	(0x15C)  //0xB154+0x4*range9
+#define ARSR1P_COEFF_H_UV0_ES	(0x180)  //0xB178+0x4*range9
+#define ARSR1P_COEFF_H_UV1_ES	(0x1A4)  //0xB19C+0x4*range9
+#define ARSR1P_COEFF_V_UV0_ES	(0x1C8)  //0xB1C0+0x4*range9
+#define ARSR1P_COEFF_V_UV1_ES	(0x1EC)  //0xB1E4+0x4*range9
+
+//ARSR1P LUT
+#define ARSR_POST_COEFF_H_Y0	(0x0F0)  //0xB0E8+0x4*range9
+#define ARSR_POST_COEFF_H_Y1	(0x114)  //0xB10C+0x4*range9
+#define ARSR_POST_COEFF_V_Y0	(0x138)  //0xB130+0x4*range9
+#define ARSR_POST_COEFF_V_Y1	(0x15C)  //0xB154+0x4*range9
+#define ARSR_POST_COEFF_H_UV0	(0x180)  //0xB178+0x4*range9
+#define ARSR_POST_COEFF_H_UV1	(0x1A4)  //0xB19C+0x4*range9
+#define ARSR_POST_COEFF_V_UV0	(0x1C8)  //0xB1C0+0x4*range9
+#define ARSR_POST_COEFF_V_UV1	(0x1EC)  //0xB1E4+0x4*range9
+
+#define HIACE_INT_STAT (0x0000)
+#define HIACE_INT_UNMASK (0x0004)
+#define HIACE_BYPASS_ACE (0x0008)
+#define HIACE_BYPASS_ACE_STAT (0x000c)
+#define HIACE_UPDATE_LOCAL (0x0010)
+#define HIACE_LOCAL_VALID (0x0014)
+#define HIACE_GAMMA_AB_SHADOW (0x0018)
+#define HIACE_GAMMA_AB_WORK (0x001c)
+#define HIACE_GLOBAL_HIST_AB_SHADOW (0x0020)
+#define HIACE_GLOBAL_HIST_AB_WORK (0x0024)
+#define HIACE_IMAGE_INFO (0x0030)
+#define HIACE_HALF_BLOCK_H_W (0x0034)
+#define HIACE_XYWEIGHT (0x0038)
+#define HIACE_LHIST_SFT (0x003c)
+#define HIACE_HUE (0x0050)
+#define HIACE_SATURATION (0x0054)
+#define HIACE_VALUE (0x0058)
+#define HIACE_SKIN_GAIN (0x005c)
+#define HIACE_UP_LOW_TH (0x0060)
+#define HIACE_UP_CNT (0x0070)
+#define HIACE_LOW_CNT (0x0074)
+#define HIACE_GLOBAL_HIST_LUT_ADDR (0x0080)
+#define HIACE_LHIST_EN (0x0100)
+#define HIACE_LOCAL_HIST_VxHy_2z_2z1 (0x0104)
+#define HIACE_GAMMA_EN (0x0108)
+#define HIACE_GAMMA_VxHy_3z2_3z1_3z_W (0x010c)
+#define HIACE_GAMMA_EN_HV_R (0x0110)
+#define HIACE_GAMMA_VxHy_3z2_3z1_3z_R (0x0114)
+#define HIACE_INIT_GAMMA (0x0120)
+#define HIACE_MANUAL_RELOAD (0x0124)
+#define HIACE_RAMCLK_FUNC (0x0128)
+#define HIACE_CLK_GATE (0x012c)
+#define HIACE_GAMMA_RAM_A_CFG_MEM_CTRL (0x0130)
+#define HIACE_GAMMA_RAM_B_CFG_MEM_CTRL (0x0134)
+#define HIACE_LHIST_RAM_CFG_MEM_CTRL (0x0138)
+#define HIACE_GAMMA_RAM_A_CFG_PM_CTRL (0x0140)
+#define HIACE_GAMMA_RAM_B_CFG_PM_CTRL (0x0144)
+#define HIACE_LHIST_RAM_CFG_PM_CTRL (0x0148)
+//DPE
+#define DPE_INT_STAT (0x0000)
+#define DPE_INT_UNMASK (0x0004)
+#define DPE_BYPASS_ACE (0x0008)
+#define DPE_BYPASS_ACE_STAT (0x000c)
+#define DPE_UPDATE_LOCAL (0x0010)
+#define DPE_LOCAL_VALID (0x0014)
+#define DPE_GAMMA_AB_SHADOW (0x0018)
+#define DPE_GAMMA_AB_WORK (0x001c)
+#define DPE_GLOBAL_HIST_AB_SHADOW (0x0020)
+#define DPE_GLOBAL_HIST_AB_WORK (0x0024)
+#define DPE_IMAGE_INFO (0x0030)
+#define DPE_HALF_BLOCK_INFO (0x0034)
+#define DPE_XYWEIGHT (0x0038)
+#define DPE_LHIST_SFT (0x003c)
+#define DPE_ROI_START_POINT (0x0040)
+#define DPE_ROI_WIDTH_HIGH (0x0044)
+#define DPE_ROI_MODE_CTRL (0x0048)
+#define DPE_ROI_HIST_STAT_MODE (0x004c)
+#define DPE_HUE (0x0050)
+#define DPE_SATURATION (0x0054)
+#define DPE_VALUE (0x0058)
+#define DPE_SKIN_GAIN (0x005c)
+#define DPE_UP_LOW_TH (0x0060)
+#define DPE_RGB_BLEND_WEIGHT (0x0064)
+#define DPE_FNA_STATISTIC (0x0068)
+#define DPE_UP_CNT (0x0070)
+#define DPE_LOW_CNT (0x0074)
+#define DPE_SUM_SATURATION (0x0078)
+#define DPE_GLOBAL_HIST_LUT_ADDR (0x0080)
+#define DPE_LHIST_EN (0x0100)
+#define DPE_LOCAL_HIST_VxHy_2z_2z1 (0x0104)
+#define DPE_GAMMA_EN (0x0108)
+#define DPE_GAMMA_W (0x0108)
+#define DPE_GAMMA_R (0x0110)
+#define DPE_GAMMA_VxHy_3z2_3z1_3z_W (0x010c)
+#define DPE_GAMMA_EN_HV_R (0x0110)
+#define DPE_GAMMA_VxHy_3z2_3z1_3z_R (0x0114)
+#define DPE_INIT_GAMMA (0x0120)
+#define DPE_MANUAL_RELOAD (0x0124)
+#define DPE_RAMCLK_FUNC (0x0128)
+#define DPE_CLK_GATE (0x012c)
+#define DPE_GAMMA_RAM_A_CFG_MEM_CTRL (0x0130)
+#define DPE_GAMMA_RAM_B_CFG_MEM_CTRL (0x0134)
+#define DPE_LHIST_RAM_CFG_MEM_CTRL (0x0138)
+#define DPE_GAMMA_RAM_A_CFG_PM_CTRL (0x0140)
+#define DPE_GAMMA_RAM_B_CFG_PM_CTRL (0x0144)
+#define DPE_LHIST_RAM_CFG_PM_CTRL (0x0148)
+#define DPE_SAT_GLOBAL_HIST_LUT_ADDR (0x0180)
+#define DPE_FNA_EN (0x0200)
+#define DPE_FNA_ADDR (0x0200)
+#define DPE_FNA_DATA (0x0204)
+#define DPE_FNA_VxHy (0x0204)
+#define DPE_UPDATE_FNA (0x0208)
+#define DPE_FNA_VALID (0x0210)
+#define DPE_DB_PIPE_CFG (0x0220)
+#define DPE_DB_PIPE_EXT_WIDTH (0x0224)
+#define DPE_DB_PIPE_FULL_IMG_WIDTH (0x0228)
+#define DPE_ACE_DBG0 (0x0300)
+#define DPE_ACE_DBG1 (0x0304)
+#define DPE_ACE_DBG2 (0x0308)
+#define DPE_BYPASS_NR (0x0400)
+#define DPE_S3_SOME_BRIGHTNESS01 (0x0410)
+#define DPE_S3_SOME_BRIGHTNESS23 (0x0414)
+#define DPE_S3_SOME_BRIGHTNESS4 (0x0418)
+#define DPE_S3_MIN_MAX_SIGMA (0x0420)
+#define DPE_S3_GREEN_SIGMA03 (0x0430)
+#define DPE_S3_GREEN_SIGMA45 (0x0434)
+#define DPE_S3_RED_SIGMA03 (0x0440)
+#define DPE_S3_RED_SIGMA45 (0x0444)
+#define DPE_S3_BLUE_SIGMA03 (0x0450)
+#define DPE_S3_BLUE_SIGMA45 (0x0454)
+#define DPE_S3_WHITE_SIGMA03 (0x0460)
+#define DPE_S3_WHITE_SIGMA45 (0x0464)
+#define DPE_S3_FILTER_LEVEL (0x0470)
+#define DPE_S3_SIMILARITY_COEFF (0x0474)
+#define DPE_S3_V_FILTER_WEIGHT_ADJ (0x0478)
+#define DPE_S3_HUE (0x0480)
+#define DPE_S3_SATURATION (0x0484)
+#define DPE_S3_VALUE (0x0488)
+#define DPE_S3_SKIN_GAIN (0x048c)
+#define DPE_NR_RAMCLK_FUNC (0x0490)
+#define DPE_NR_CLK_GATE (0x0494)
+#define DPE_NR_RAM_A_CFG_MEM_CTRL (0x0498)
+#define DPE_NR_RAM_A_CFG_PM_CTRL (0x049c)
+
+
+/*******************************************************************************
+** IFBC
+*/
+#define IFBC_SIZE	(0x0000)
+#define IFBC_CTRL	(0x0004)
+#define IFBC_HIMAX_CTRL0	(0x0008)
+#define IFBC_HIMAX_CTRL1	(0x000C)
+#define IFBC_HIMAX_CTRL2	(0x0010)
+#define IFBC_HIMAX_CTRL3	(0x0014)
+#define IFBC_EN	(0x0018)
+#define IFBC_MEM_CTRL	(0x001C)
+#define IFBC_INSERT	(0x0020)
+#define IFBC_HIMAX_TEST_MODE	(0x0024)
+#define IFBC_CORE_GT	(0x0028)
+#define IFBC_PM_CTRL	(0x002C)
+#define IFBC_RD_SHADOW	(0x0030)
+#define IFBC_ORISE_CTL	(0x0034)
+#define IFBC_ORSISE_DEBUG0	(0x0038)
+#define IFBC_ORSISE_DEBUG1	(0x003C)
+#define IFBC_RSP_COMP_TEST	(0x0040)
+#define IFBC_CLK_SEL	(0x044)
+#define IFBC_CLK_EN	(0x048)
+#define IFBC_PAD	(0x004C)
+#define IFBC_REG_DEFAULT	(0x0050)
+
+
+/*******************************************************************************
+** DSC
+*/
+#define DSC_VERSION	(0x0000)
+#define DSC_PPS_IDENTIFIER	(0x0004)
+#define DSC_EN	(0x0008)
+#define DSC_CTRL	(0x000C)
+#define DSC_PIC_SIZE	(0x0010)
+#define DSC_SLICE_SIZE	(0x0014)
+#define DSC_CHUNK_SIZE	(0x0018)
+#define DSC_INITIAL_DELAY	(0x001C)
+#define DSC_RC_PARAM0	(0x0020)
+#define DSC_RC_PARAM1	(0x0024)
+#define DSC_RC_PARAM2	(0x0028)
+#define DSC_RC_PARAM3	(0x002C)
+#define DSC_FLATNESS_QP_TH	(0x0030)
+#define DSC_RC_PARAM4	(0x0034)
+#define DSC_RC_PARAM5	(0x0038)
+#define DSC_RC_BUF_THRESH0	(0x003C)
+#define DSC_RC_BUF_THRESH1	(0x0040)
+#define DSC_RC_BUF_THRESH2	(0x0044)
+#define DSC_RC_BUF_THRESH3	(0x0048)
+#define DSC_RC_RANGE_PARAM0	(0x004C)
+#define DSC_RC_RANGE_PARAM1	(0x0050)
+#define DSC_RC_RANGE_PARAM2	(0x0054)
+#define DSC_RC_RANGE_PARAM3	(0x0058)
+#define DSC_RC_RANGE_PARAM4	(0x005C)
+#define DSC_RC_RANGE_PARAM5	(0x0060)
+#define DSC_RC_RANGE_PARAM6	(0x0064)
+#define DSC_RC_RANGE_PARAM7	(0x0068)
+#define DSC_ADJUSTMENT_BITS	(0x006C)
+#define DSC_BITS_PER_GRP	(0x0070)
+#define DSC_MULTI_SLICE_CTL	(0x0074)
+#define DSC_OUT_CTRL	(0x0078)
+#define DSC_CLK_SEL	(0x007C)
+#define DSC_CLK_EN	(0x0080)
+#define DSC_MEM_CTRL	(0x0084)
+#define DSC_ST_DATAIN	(0x0088)
+#define DSC_ST_DATAOUT	(0x008C)
+#define DSC0_ST_SLC_POS	(0x0090)
+#define DSC1_ST_SLC_POS	(0x0094)
+#define DSC0_ST_PIC_POS	(0x0098)
+#define DSC1_ST_PIC_POS	(0x009C)
+#define DSC0_ST_FIFO	(0x00A0)
+#define DSC1_ST_FIFO	(0x00A4)
+#define DSC0_ST_LINEBUF	(0x00A8)
+#define DSC1_ST_LINEBUF	(0x00AC)
+#define DSC_ST_ITFC	(0x00B0)
+#define DSC_RD_SHADOW_SEL	(0x00B4)
+#define DSC_REG_DEFAULT	(0x00B8)
+
+
+/*******************************************************************************
+** LDI
+*/
+#define LDI_DPI0_HRZ_CTRL0	(0x0000)
+#define LDI_DPI0_HRZ_CTRL1	(0x0004)
+#define LDI_DPI0_HRZ_CTRL2	(0x0008)
+#define LDI_VRT_CTRL0	(0x000C)
+#define LDI_VRT_CTRL1	(0x0010)
+#define LDI_VRT_CTRL2	(0x0014)
+#define LDI_PLR_CTRL	(0x0018)
+#define LDI_SH_MASK_INT	(0x001C)
+#define LDI_3D_CTRL	(0x0020)
+#define LDI_CTRL	(0x0024)
+#define LDI_WORK_MODE	(0x0028)
+#define LDI_DE_SPACE_LOW	(0x002C)
+#define LDI_DSI_CMD_MOD_CTRL	(0x0030)
+#define LDI_DSI_TE_CTRL	(0x0034)
+#define LDI_DSI_TE_HS_NUM	(0x0038)
+#define LDI_DSI_TE_HS_WD	(0x003C)
+#define LDI_DSI_TE_VS_WD	(0x0040)
+#define LDI_FRM_MSK	(0x0044)
+#define LDI_FRM_MSK_UP	(0x0048)
+#define LDI_VINACT_MSK_LEN	(0x0050)
+#define LDI_VSTATE	(0x0054)
+#define LDI_DPI0_HSTATE	(0x0058)
+#define LDI_DPI1_HSTATE	(0x005C)
+#define LDI_CMD_EVENT_SEL	(0x0060)
+#define LDI_SRAM_LP_CTRL	(0x0064)
+#define LDI_ITF_RD_SHADOW	(0x006C)
+#define LDI_DP_DSI_SEL 		(0x0080)
+#define LDI_DPI1_HRZ_CTRL0	(0x00F0)
+#define LDI_DPI1_HRZ_CTRL1	(0x00F4)
+#define LDI_DPI1_HRZ_CTRL2	(0x00F8)
+#define LDI_OVERLAP_SIZE	(0x00FC)
+#define LDI_MEM_CTRL	(0x0100)
+#define LDI_PM_CTRL	(0x0104)
+#define LDI_CLK_SEL	(0x0108)
+#define LDI_CLK_EN	(0x010C)
+#define LDI_IF_BYPASS	(0x0110)
+#define LDI_FRM_VALID_DBG (0x0118)
+/* LDI GLB*/
+#define LDI_PXL0_DIV2_GT_EN (0x0210)
+#define LDI_PXL0_DIV4_GT_EN (0x0214)
+#define LDI_PXL0_GT_EN (0x0218)
+#define LDI_PXL0_DSI_GT_EN (0x021C)
+#define LDI_PXL0_DIVXCFG (0x0220)
+#define LDI_DSI1_CLK_SEL (0x0224)
+#define LDI_VESA_CLK_SEL (0x0228)
+/* DSI1 RST*/
+#define LDI_DSI1_RST_SEL (0x0238)
+/* LDI INTERRUPT*/
+#define LDI_MCU_ITF_INTS (0x0240)
+#define LDI_MCU_ITF_INT_MSK (0x0244)
+#define LDI_CPU_ITF_INTS (0x0248)
+#define LDI_CPU_ITF_INT_MSK (0x024C)
+/* LDI MODULE CLOCK GATING*/
+#define LDI_MODULE_CLK_SEL (0x0258)
+#define LDI_MODULE_CLK_EN (0x025C)
+
+
+/*******************************************************************************
+** MIPI DSI
+*/
+#define MIPIDSI_VERSION_OFFSET	(0x0000)
+#define MIPIDSI_PWR_UP_OFFSET	(0x0004)
+#define MIPIDSI_CLKMGR_CFG_OFFSET	(0x0008)
+#define MIPIDSI_DPI_VCID_OFFSET	(0x000c)
+#define MIPIDSI_DPI_COLOR_CODING_OFFSET	(0x0010)
+#define MIPIDSI_DPI_CFG_POL_OFFSET	(0x0014)
+#define MIPIDSI_DPI_LP_CMD_TIM_OFFSET	(0x0018)
+#define MIPIDSI_PCKHDL_CFG_OFFSET	(0x002c)
+#define MIPIDSI_GEN_VCID_OFFSET	(0x0030)
+#define MIPIDSI_MODE_CFG_OFFSET	(0x0034)
+#define MIPIDSI_VID_MODE_CFG_OFFSET	(0x0038)
+#define MIPIDSI_VID_PKT_SIZE_OFFSET	(0x003c)
+#define MIPIDSI_VID_NUM_CHUNKS_OFFSET	(0x0040)
+#define MIPIDSI_VID_NULL_SIZE_OFFSET	(0x0044)
+#define MIPIDSI_VID_HSA_TIME_OFFSET	(0x0048)
+#define MIPIDSI_VID_HBP_TIME_OFFSET	(0x004c)
+#define MIPIDSI_VID_HLINE_TIME_OFFSET	(0x0050)
+#define MIPIDSI_VID_VSA_LINES_OFFSET	(0x0054)
+#define MIPIDSI_VID_VBP_LINES_OFFSET	(0x0058)
+#define MIPIDSI_VID_VFP_LINES_OFFSET	(0x005c)
+#define MIPIDSI_VID_VACTIVE_LINES_OFFSET	(0x0060)
+#define MIPIDSI_EDPI_CMD_SIZE_OFFSET	(0x0064)
+#define MIPIDSI_CMD_MODE_CFG_OFFSET	(0x0068)
+#define MIPIDSI_GEN_HDR_OFFSET	(0x006c)
+#define MIPIDSI_GEN_PLD_DATA_OFFSET	(0x0070)
+#define MIPIDSI_CMD_PKT_STATUS_OFFSET	(0x0074)
+#define MIPIDSI_TO_CNT_CFG_OFFSET	(0x0078)
+#define MIPIDSI_HS_RD_TO_CNT_OFFSET	(0x007C)
+#define MIPIDSI_LP_RD_TO_CNT_OFFSET	(0x0080)
+#define MIPIDSI_HS_WR_TO_CNT_OFFSET	(0x0084)
+#define MIPIDSI_LP_WR_TO_CNT_OFFSET	(0x0088)
+#define MIPIDSI_BTA_TO_CNT_OFFSET	(0x008C)
+#define MIPIDSI_SDF_3D_OFFSET	(0x0090)
+#define MIPIDSI_LPCLK_CTRL_OFFSET	(0x0094)
+#define MIPIDSI_PHY_TMR_LPCLK_CFG_OFFSET	(0x0098)
+#define MIPIDSI_PHY_TMR_CFG_OFFSET	(0x009c)
+#define MIPIDSI_PHY_RSTZ_OFFSET	(0x00a0)
+#define MIPIDSI_PHY_IF_CFG_OFFSET	(0x00a4)
+#define MIPIDSI_PHY_ULPS_CTRL_OFFSET	(0x00a8)
+#define MIPIDSI_PHY_TX_TRIGGERS_OFFSET	(0x00ac)
+#define MIPIDSI_PHY_STATUS_OFFSET	(0x00b0)
+#define MIPIDSI_PHY_TST_CTRL0_OFFSET	(0x00b4)
+#define MIPIDSI_PHY_TST_CTRL1_OFFSET	(0x00b8)
+#define MIPIDSI_PHY_TST_CLK_PRE_DELAY (0x00B0)
+#define MIPIDSI_PHY_TST_CLK_POST_DELAY (0x00B1)
+#define MIPIDSI_PHY_TST_CLK_TLPX (0x00B2)
+#define MIPIDSI_PHY_TST_CLK_PREPARE (0x00B3)
+#define MIPIDSI_PHY_TST_CLK_ZERO (0x00B4)
+#define MIPIDSI_PHY_TST_CLK_TRAIL (0x00B5)
+#define MIPIDSI_PHY_TST_DATA_PRE_DELAY (0x0070)
+#define MIPIDSI_PHY_TST_DATA_POST_DELAY (0x0071)
+#define MIPIDSI_PHY_TST_DATA_TLPX (0x0072)
+#define MIPIDSI_PHY_TST_DATA_PREPARE (0x0073)
+#define MIPIDSI_PHY_TST_DATA_ZERO (0x0074)
+#define MIPIDSI_PHY_TST_DATA_TRAIL (0x0075)
+#define MIPIDSI_PHY_TST_LANE_TRANSMISSION_PROPERTY (0x0077)
+
+#define MIPIDSI_INT_ST0_OFFSET	(0x00bc)
+#define MIPIDSI_INT_ST1_OFFSET	(0x00c0)
+#define MIPIDSI_INT_MSK0_OFFSET	(0x00c4)
+#define MIPIDSI_INT_MSK1_OFFSET	(0x00c8)
+#define INT_FORCE0	(0x00D8)
+#define INT_FORCE1	(0x00DC)
+#define AUTO_ULPS_MODE 	(0x00E0)
+#define AUTO_ULPS_ENTER_DELAY 	(0x00E4)
+#define AUTO_ULPS_WAKEUP_TIME 	(0x00E8)
+#define MIPIDSI_DSC_PARAMETER_OFFSET	(0x00F0)
+#define MIPIDSI_PHY_TMR_RD_CFG_OFFSET	(0x00F4)
+#define AUTO_ULPS_MIN_TIME  (0xF8)
+#define PHY_MODE (0xFC)
+#define VID_SHADOW_CTRL	(0x0100)
+#define DPI_VCID_ACT	(0x010C)
+#define DPI_COLOR_CODING_ACT	(0x0110)
+#define DPI_LP_CMD_TIM_ACT	(0x0118)
+#define VID_MODE_CFG_ACT	(0x0138)
+#define VID_PKT_SIZE_ACT	(0x013C)
+#define VID_NUM_CHUNKS_ACT	(0x0140)
+#define VID_NULL_SIZE_ACT	(0x0144)
+#define VID_HSA_TIME_ACT	(0x0148)
+#define VID_HBP_TIME_ACT	(0x014C)
+#define VID_HLINE_TIME_ACT	(0x0150)
+#define VID_VSA_LINES_ACT	(0x0154)
+#define VID_VBP_LINES_ACT	(0x0158)
+#define VID_VFP_LINES_ACT	(0x015C)
+#define VID_VACTIVE_LINES_ACT	(0x0160)
+#define SDF_3D_ACT	(0x0190)
+#define DSI_MEM_CTRL  (0x0194)
+#define DSI_PM_CTRL  (0x0198)
+#define DSI_DEBUG  (0x019C)
+
+/*******************************************************************************
+** MMBUF
+*/
+#define SMC_LOCK	(0x0000)
+#define SMC_MEM_LP	(0x0004)
+#define SMC_GCLK_CS	(0x000C)
+#define SMC_QOS_BACKDOOR	(0x0010)
+#define SMC_DFX_WCMD_CNT_1ST	(0x0014)
+#define SMC_DFX_WCMD_CNT_2ND	(0x0018)
+#define SMC_DFX_WCMD_CNT_3RD	(0x001C)
+#define SMC_DFX_WCMD_CNT_4TH	(0x0020)
+#define SMC_DFX_RCMD_CNT_1ST	(0x0024)
+#define SMC_DFX_RCMD_CNT_2ND	(0x0028)
+#define SMC_DFX_RCMD_CNT_3RD	(0x002C)
+#define SMC_DFX_RCMD_CNT_4TH	(0x0030)
+#define SMC_CS_IDLE	(0x0034)
+#define SMC_DFX_BFIFO_CNT0	(0x0038)
+#define SMC_DFX_RDFIFO_CNT1	(0x003C)
+#define SMC_SP_SRAM_STATE0	(0x0040)
+#define SMC_SP_SRAM_STATE1	(0x0044)
+
+enum hisi_fb_pixel_format {
+	HISI_FB_PIXEL_FORMAT_RGB_565 = 0,
+	HISI_FB_PIXEL_FORMAT_RGBX_4444,
+	HISI_FB_PIXEL_FORMAT_RGBA_4444,
+	HISI_FB_PIXEL_FORMAT_RGBX_5551,
+	HISI_FB_PIXEL_FORMAT_RGBA_5551,
+	HISI_FB_PIXEL_FORMAT_RGBX_8888,
+	HISI_FB_PIXEL_FORMAT_RGBA_8888,
+
+	HISI_FB_PIXEL_FORMAT_BGR_565,
+	HISI_FB_PIXEL_FORMAT_BGRX_4444,
+	HISI_FB_PIXEL_FORMAT_BGRA_4444,
+	HISI_FB_PIXEL_FORMAT_BGRX_5551,
+	HISI_FB_PIXEL_FORMAT_BGRA_5551,
+	HISI_FB_PIXEL_FORMAT_BGRX_8888,
+	HISI_FB_PIXEL_FORMAT_BGRA_8888,
+
+	HISI_FB_PIXEL_FORMAT_YUV_422_I,
+
+	/* YUV Semi-planar */
+	HISI_FB_PIXEL_FORMAT_YCbCr_422_SP,	/* NV16 */
+	HISI_FB_PIXEL_FORMAT_YCrCb_422_SP,
+	HISI_FB_PIXEL_FORMAT_YCbCr_420_SP,
+	HISI_FB_PIXEL_FORMAT_YCrCb_420_SP,	/* NV21 */
+
+	/* YUV Planar */
+	HISI_FB_PIXEL_FORMAT_YCbCr_422_P,
+	HISI_FB_PIXEL_FORMAT_YCrCb_422_P,
+	HISI_FB_PIXEL_FORMAT_YCbCr_420_P,
+	HISI_FB_PIXEL_FORMAT_YCrCb_420_P,	/* HISI_FB_PIXEL_FORMAT_YV12 */
+
+	/* YUV Package */
+	HISI_FB_PIXEL_FORMAT_YUYV_422_Pkg,
+	HISI_FB_PIXEL_FORMAT_UYVY_422_Pkg,
+	HISI_FB_PIXEL_FORMAT_YVYU_422_Pkg,
+	HISI_FB_PIXEL_FORMAT_VYUY_422_Pkg,
+	HISI_FB_PIXEL_FORMAT_MAX,
+
+	HISI_FB_PIXEL_FORMAT_UNSUPPORT = 800
+};
+
+//MEDIA_CRG
+#define MEDIA_PEREN0	(0x000)
+#define MEDIA_PERDIS0	(0x004)
+#define MEDIA_PERDIS1	(0x014)
+#define MEDIA_PERDIS2	(0x024)
+#define MEDIA_PERRSTEN0	(0x030)
+#define MEDIA_PERRSTDIS0	(0x034)
+#define MEDIA_PERRSTDIS1	(0x040)
+#define MEDIA_CLKDIV8  (0x080)
+#define MEDIA_CLKDIV9  (0x084)
+#define MEDIA_PEREN1	(0x010)
+#define MEDIA_PEREN2	(0x020)
+#define PERRSTEN_GENERAL_SEC (0xA00)
+#define PERRSTDIS_GENERAL_SEC (0xA04)
+
+struct dss_hw_ctx {
+	void __iomem *base;
+	struct regmap *noc_regmap;
+	struct reset_control *reset;
+	u32 g_dss_version_tag;
+
+	void __iomem *noc_dss_base;
+	void __iomem *peri_crg_base;
+	void __iomem *pmc_base;
+	void __iomem *sctrl_base;
+	void __iomem *media_crg_base;
+	void __iomem *pctrl_base;
+	void __iomem *mmbuf_crg_base;
+	void __iomem *pmctrl_base;
+
+	struct clk *dss_axi_clk;
+	struct clk *dss_pclk_dss_clk;
+	struct clk *dss_pri_clk;
+	struct clk *dss_pxl0_clk;
+	struct clk *dss_pxl1_clk;
+	struct clk *dss_mmbuf_clk;
+	struct clk *dss_pclk_mmbuf_clk;
+
+	struct dss_clk_rate *dss_clk;
+
+	struct regulator *dpe_regulator;
+	struct regulator_bulk_data *mmbuf_regulator;
+	struct regulator_bulk_data *media_subsys_regulator;
+
+	bool power_on;
+	int irq;
+
+	wait_queue_head_t vactive0_end_wq;
+	u32 vactive0_end_flag;
+	ktime_t vsync_timestamp;
+	ktime_t vsync_timestamp_prev;
+
+	struct iommu_domain *mmu_domain;
+	struct ion_client *ion_client;
+	struct ion_handle *ion_handle;
+	struct iommu_map_format iommu_format;
+	char __iomem *screen_base;
+	unsigned long smem_start;
+	unsigned long screen_size;
+	struct dss_smmu smmu;
+};
+
+typedef struct dss_clk_rate {
+	uint64_t dss_pri_clk_rate;
+	uint64_t dss_pclk_dss_rate;
+	uint64_t dss_pclk_pctrl_rate;
+	uint64_t dss_mmbuf_rate;
+	uint32_t dss_voltage_value; //0:0.7v, 2:0.8v
+	uint32_t reserved;
+} dss_clk_rate_t;
+
+struct dss_crtc {
+	struct drm_crtc base;
+	struct dss_hw_ctx *ctx;
+	bool enable;
+	u32 out_format;
+	u32 bgr_fmt;
+};
+
+struct dss_plane {
+	struct drm_plane base;
+	/*void *ctx;*/
+	void *acrtc;
+	u8 ch; /* channel */
+};
+
+struct dss_data {
+	struct dss_crtc acrtc;
+	struct dss_plane aplane[DSS_CH_NUM];
+	struct dss_hw_ctx ctx;
+};
+
+/* ade-format info: */
+struct dss_format {
+	u32 pixel_format;
+	enum hisi_fb_pixel_format dss_format;
+};
+
+#define MIPI_DPHY_NUM	(2)
+
+/* IFBC compress mode */
+enum IFBC_TYPE {
+	IFBC_TYPE_NONE = 0,
+	IFBC_TYPE_ORISE2X,
+	IFBC_TYPE_ORISE3X,
+	IFBC_TYPE_HIMAX2X,
+	IFBC_TYPE_RSP2X,
+	IFBC_TYPE_RSP3X,
+	IFBC_TYPE_VESA2X_SINGLE,
+	IFBC_TYPE_VESA3X_SINGLE,
+	IFBC_TYPE_VESA2X_DUAL,
+	IFBC_TYPE_VESA3X_DUAL,
+	IFBC_TYPE_VESA3_75X_DUAL,
+
+	IFBC_TYPE_MAX
+};
+
+/* IFBC compress mode */
+enum IFBC_COMP_MODE {
+	IFBC_COMP_MODE_0 = 0,
+	IFBC_COMP_MODE_1,
+	IFBC_COMP_MODE_2,
+	IFBC_COMP_MODE_3,
+	IFBC_COMP_MODE_4,
+	IFBC_COMP_MODE_5,
+	IFBC_COMP_MODE_6,
+};
+
+/* xres_div */
+enum XRES_DIV {
+	XRES_DIV_1 = 1,
+	XRES_DIV_2,
+	XRES_DIV_3,
+	XRES_DIV_4,
+	XRES_DIV_5,
+	XRES_DIV_6,
+};
+
+/* yres_div */
+enum YRES_DIV {
+	YRES_DIV_1 = 1,
+	YRES_DIV_2,
+	YRES_DIV_3,
+	YRES_DIV_4,
+	YRES_DIV_5,
+	YRES_DIV_6,
+};
+
+/* pxl0_divxcfg */
+enum PXL0_DIVCFG {
+	PXL0_DIVCFG_0 = 0,
+	PXL0_DIVCFG_1,
+	PXL0_DIVCFG_2,
+	PXL0_DIVCFG_3,
+	PXL0_DIVCFG_4,
+	PXL0_DIVCFG_5,
+	PXL0_DIVCFG_6,
+	PXL0_DIVCFG_7,
+};
+
+/* pxl0_div2_gt_en */
+enum PXL0_DIV2_GT_EN {
+	PXL0_DIV2_GT_EN_CLOSE = 0,
+	PXL0_DIV2_GT_EN_OPEN,
+};
+
+/* pxl0_div4_gt_en */
+enum PXL0_DIV4_GT_EN {
+	PXL0_DIV4_GT_EN_CLOSE = 0,
+	PXL0_DIV4_GT_EN_OPEN,
+};
+
+/* pxl0_dsi_gt_en */
+enum PXL0_DSI_GT_EN {
+	PXL0_DSI_GT_EN_0 = 0,
+	PXL0_DSI_GT_EN_1,
+	PXL0_DSI_GT_EN_2,
+	PXL0_DSI_GT_EN_3,
+};
+
+typedef struct mipi_ifbc_division {
+	u32 xres_div;
+	u32 yres_div;
+	u32 comp_mode;
+	u32 pxl0_div2_gt_en;
+	u32 pxl0_div4_gt_en;
+	u32 pxl0_divxcfg;
+	u32 pxl0_dsi_gt_en;
+} mipi_ifbc_division_t;
+
+/*******************************************************************************
+**
+*/
+#define outp32(addr, val) writel(val, addr)
+#define outp16(addr, val) writew(val, addr)
+#define outp8(addr, val) writeb(val, addr)
+#define outp(addr, val) outp32(addr, val)
+
+#define inp32(addr) readl(addr)
+#define inp16(addr) readw(addr)
+#define inp8(addr) readb(addr)
+#define inp(addr) inp32(addr)
+
+#define inpw(port) readw(port)
+#define outpw(port, val) writew(val, port)
+#define inpdw(port) readl(port)
+#define outpdw(port, val) writel(val, port)
+
+#ifndef ALIGN_DOWN
+#define ALIGN_DOWN(val, al)  ((val) & ~((al) - 1))
+#endif
+#ifndef ALIGN_UP
+#define ALIGN_UP(val, al)    (((val) + ((al) - 1)) & ~((al) - 1))
+#endif
+
+#define to_dss_crtc(crtc) \
+	container_of(crtc, struct dss_crtc, base)
+
+#define to_dss_plane(plane) \
+	container_of(plane, struct dss_plane, base)
+
+#endif
diff --git a/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
index adaa71f6dcd5..a5152708abb7 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
@@ -11,6 +11,7 @@
 #ifndef __KIRIN_DPE_REG_H__
 #define __KIRIN_DPE_REG_H__
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/string.h>
 #include <linux/platform_device.h>
@@ -19,10 +20,25 @@
 #include <linux/wait.h>
 #include <linux/bug.h>
 #include <linux/iommu.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
 
 #include <linux/ion.h>
 #include <linux/hisi/hisi_ion.h>
 
+#define FB_ACCEL_HI62xx 	0x1
+#define FB_ACCEL_HI363x 	0x2
+#define FB_ACCEL_HI365x 	0x4
+#define FB_ACCEL_HI625x 	0x8
+#define FB_ACCEL_HI366x 	0x10
+#define FB_ACCEL_KIRIN970_ES  0x20
+#define FB_ACCEL_KIRIN970  0x40
+#define FB_ACCEL_KIRIN660  0x80
+#define FB_ACCEL_KIRIN980_ES  0x100
+#define FB_ACCEL_KIRIN980  0x200
+#define FB_ACCEL_PLATFORM_TYPE_FPGA     0x10000000   //FPGA
+#define FB_ACCEL_PLATFORM_TYPE_ASIC     0x20000000   //ASIC
 /*******************************************************************************
 **
 */
@@ -137,11 +153,6 @@ typedef struct drm_dss_layer {
 #define DEFAULT_MIPI_CLK_RATE	(192 * 100000L)
 #define DEFAULT_PCLK_DSI_RATE	(120 * 1000000L)
 
-#define DEFAULT_DSS_CORE_CLK_08V_RATE	(535000000UL)
-#define DEFAULT_DSS_CORE_CLK_07V_RATE	(400000000UL)
-#define DEFAULT_PCLK_DSS_RATE	(114000000UL)
-#define DEFAULT_PCLK_PCTRL_RATE	(80000000UL)
-#define DSS_MAX_PXL0_CLK_288M (288000000UL)
 #define DSS_MAX_PXL0_CLK_144M (144000000UL)
 
 #define DSS_ADDR  0xE8600000
@@ -150,6 +161,7 @@ typedef struct drm_dss_layer {
 #define PMC_BASE	(0xFFF31000)
 #define PERI_CRG_BASE	(0xFFF35000)
 #define SCTRL_BASE	(0xFFF0A000)
+#define PCTRL_BASE		(0xE8A09000)
 
 #define GPIO_LCD_POWER_1V2  (54)
 #define GPIO_LCD_STANDBY    (67)
@@ -174,6 +186,9 @@ typedef struct drm_dss_layer {
 
 #define DEFAULT_DSS_CORE_CLK_08V_RATE	(535000000UL)
 #define DEFAULT_DSS_CORE_CLK_07V_RATE	(400000000UL)
+#define DEFAULT_DSS_CORE_CLK_RATE_L1	(300000000UL)
+#define DEFAULT_DSS_MMBUF_CLK_RATE_L1	(238000000UL)
+
 #define DEFAULT_PCLK_DSS_RATE	(114000000UL)
 #define DEFAULT_PCLK_PCTRL_RATE	(80000000UL)
 #define DSS_MAX_PXL0_CLK_288M (288000000UL)
@@ -206,6 +221,25 @@ typedef struct drm_dss_layer {
 #define PERF_SAMPSTOP_REG (0x10)
 #define DEVMEM_PERF_SIZE (0x100)
 
+/* dp clock used for hdmi */
+#define DEFAULT_AUXCLK_DPCTRL_RATE	16000000UL
+#define DEFAULT_ACLK_DPCTRL_RATE_ES	288000000UL
+#define DEFAULT_ACLK_DPCTRL_RATE_CS	207000000UL
+#define DEFAULT_MIDIA_PPLL7_CLOCK_FREQ	1782000000UL
+
+#define KIRIN970_VCO_MIN_FREQ_OUPUT         1000000 /*Boston: 1000 * 1000*/
+#define KIRIN970_SYS_19M2   19200 /*Boston: 19.2f * 1000 */
+
+#define MIDIA_PPLL7_CTRL0	0x50c
+#define MIDIA_PPLL7_CTRL1	0x510
+
+#define MIDIA_PPLL7_FREQ_DEVIDER_MASK	GENMASK(25, 2)
+#define MIDIA_PPLL7_FRAC_MODE_MASK	GENMASK(25, 0)
+
+#define ACCESS_REGISTER_FN_MAIN_ID_HDCP           0xc500aa01
+#define ACCESS_REGISTER_FN_SUB_ID_HDCP_CTRL   (0x55bbccf1)
+#define ACCESS_REGISTER_FN_SUB_ID_HDCP_INT   (0x55bbccf2)
+
 /*
  * DSS Registers
 */
@@ -1464,6 +1498,8 @@ typedef struct dss_dfc {
 #define SCF_RD_SHADOW	(0x00F0)
 #define SCF_CLK_SEL	(0x00F8)
 #define SCF_CLK_EN	(0x00FC)
+#define WCH_SCF_COEF_MEM_CTRL (0x0218)
+#define WCH_SCF_LB_MEM_CTRL 	(0x290)
 
 /* MACROS */
 #define SCF_MIN_INPUT	(16)
@@ -1690,6 +1726,21 @@ typedef struct dss_csc {
 #define AFBCD_MONITOR_REG2_OFFSET	(0x94C)
 #define AFBCD_MONITOR_REG3_OFFSET	(0x950)
 #define AFBCD_DEBUG_REG0_OFFSET	(0x954)
+#define AFBCD_CREG_FBCD_CTRL_MODE  	(0x960)
+#define AFBCD_HREG_HDR_PTR_L1 		(0x964)
+#define AFBCD_HREG_PLD_PTR_L1 		(0x968)
+#define AFBCD_HEADER_SRTIDE_1 		(0x96C)
+#define AFBCD_PAYLOAD_SRTIDE_1	 	(0x970)
+#define AFBCD_HREG_HDR_PTR_L1 		(0x964)
+#define AFBCD_HREG_PLD_PTR_L1 		(0x968)
+#define AFBCD_HEADER_SRTIDE_1 		(0x96C)
+#define AFBCD_PAYLOAD_SRTIDE_1 		(0x970)
+#define AFBCD_BLOCK_TYPE				(0x974)
+#define AFBCD_MM_BASE_1				(0x978)
+#define AFBCD_MM_BASE_2				(0x97C)
+#define AFBCD_MM_BASE_3				(0x980)
+#define HFBCD_MEM_CTRL				(0x984)
+#define HFBCD_MEM_CTRL_1				(0x988)
 
 #define AFBCE_HREG_PIC_BLKS	(0x900)
 #define AFBCE_HREG_FORMAT	(0x904)
@@ -1705,6 +1756,13 @@ typedef struct dss_csc {
 #define AFBCE_THRESHOLD	(0x92C)
 #define AFBCE_SCRAMBLE_MODE	(0x930)
 #define AFBCE_HEADER_POINTER_OFFSET	(0x934)
+#define AFBCE_CREG_FBCE_CTRL_MODE  	(0x950)
+#define AFBCE_HREG_HDR_PTR_L1 		(0x954)
+#define AFBCE_HREG_PLD_PTR_L1 		(0x958)
+#define AFBCE_HEADER_SRTIDE_1 			(0x95C)
+#define AFBCE_PAYLOAD_SRTIDE_1 		(0x960)
+#define AFBCE_MEM_CTRL_1 				(0x968)
+#define FBCD_CREG_FBCD_CTRL_GATE		(0x98C)
 
 #define ROT_FIRST_LNS	(0x530)
 #define ROT_STATE	(0x534)
@@ -2255,6 +2313,47 @@ typedef struct dss_mctl_sys {
 #define OVL_6LAYER_NUM		(6)
 #define OVL_2LAYER_NUM		(2)
 
+/*******************************************************************************
+** OVL
+*/
+#define OV_SIZE						(0x000)
+#define OV_BG_COLOR_RGB 			(0x004)
+#define OV_BG_COLOR_A 				(0x008)
+#define OV_DST_STARTPOS 			(0x00C)
+#define OV_DST_ENDPOS 				(0x010)
+#define OV_GCFG 					(0x014)
+#define OV_LAYER0_POS 				(0x030)
+#define OV_LAYER0_SIZE 				(0x034)
+#define OV_LAYER0_SRCLOKEY		(0x038)
+#define OV_LAYER0_SRCHIKEY 		(0x03C)
+#define OV_LAYER0_DSTLOKEY 		(0x040)
+#define OV_LAYER0_DSTHIKEY 		(0x044)
+#define OV_LAYER0_PATTERN_RGB 	(0x048)
+#define OV_LAYER0_PATTERN_A 		(0x04C)
+#define OV_LAYER0_ALPHA_MODE 		(0x050)
+#define OV_LAYER0_ALPHA_A 			(0x054)
+#define OV_LAYER0_CFG 				(0x058)
+#define OV_LAYER0_PSPOS 			(0x05C)
+#define OV_LAYER0_PEPOS 			(0x060)
+#define OV_LAYER0_INFO_ALPHA 		(0x064)
+#define OV_LAYER0_INFO_SRCCOLOR 	(0x068)
+#define OV_LAYER0_DBG_INFO 		(0x06C)
+#define OV8_BASE_DBG_INFO			(0x340)
+#define OV8_RD_SHADOW_SEL			(0x344)
+#define OV8_CLK_SEL					(0x348)
+#define OV8_CLK_EN 					(0x34C)
+#define OV8_BLOCK_SIZE 				(0x350)
+#define OV8_BLOCK_DBG 				(0x354)
+#define OV8_REG_DEFAULT 			(0x358)
+#define OV2_BASE_DBG_INFO			(0x200)
+#define OV2_RD_SHADOW_SEL			(0x204)
+#define OV2_CLK_SEL					(0x208)
+#define OV2_CLK_EN 					(0x20C)
+#define OV2_BLOCK_SIZE 				(0x210)
+#define OV2_BLOCK_DBG 				(0x214)
+#define OV2_REG_DEFAULT 			(0x218)
+
+#define OV_8LAYER_NUM				(8)
 typedef struct dss_ovl_layer {
 	u32 layer_pos;
 	u32 layer_size;
@@ -2331,6 +2430,8 @@ typedef struct dss_ovl_alpha {
 #define DBUF_THD_DFS_OK (0x0068)
 #define DBUF_FLUX_REQ_CTRL (0x006C)
 #define DBUF_REG_DEFAULT  (0x00A4)
+#define DBUF_DFS_RAM_MANAGE  (0x00A8)
+#define DBUF_DFS_DATA_FILL_OUT  (0x00AC)
 
 /*******************************************************************************
  ** DPP
@@ -2840,6 +2941,19 @@ typedef struct dss_arsr1p {
 #define MIPIDSI_PHY_STATUS_OFFSET	(0x00b0)
 #define MIPIDSI_PHY_TST_CTRL0_OFFSET	(0x00b4)
 #define MIPIDSI_PHY_TST_CTRL1_OFFSET	(0x00b8)
+#define MIPIDSI_PHY_TST_CLK_PRE_DELAY (0x00B0)
+#define MIPIDSI_PHY_TST_CLK_POST_DELAY (0x00B1)
+#define MIPIDSI_PHY_TST_CLK_TLPX (0x00B2)
+#define MIPIDSI_PHY_TST_CLK_PREPARE (0x00B3)
+#define MIPIDSI_PHY_TST_CLK_ZERO (0x00B4)
+#define MIPIDSI_PHY_TST_CLK_TRAIL (0x00B5)
+#define MIPIDSI_PHY_TST_DATA_PRE_DELAY (0x0070)
+#define MIPIDSI_PHY_TST_DATA_POST_DELAY (0x0071)
+#define MIPIDSI_PHY_TST_DATA_TLPX (0x0072)
+#define MIPIDSI_PHY_TST_DATA_PREPARE (0x0073)
+#define MIPIDSI_PHY_TST_DATA_ZERO (0x0074)
+#define MIPIDSI_PHY_TST_DATA_TRAIL (0x0075)
+#define MIPIDSI_PHY_TST_LANE_TRANSMISSION_PROPERTY (0x0077)
 #define MIPIDSI_INT_ST0_OFFSET	(0x00bc)
 #define MIPIDSI_INT_ST1_OFFSET	(0x00c0)
 #define MIPIDSI_INT_MSK0_OFFSET	(0x00c4)
@@ -2931,11 +3045,16 @@ struct dss_hw_ctx {
 	void __iomem *base;
 	struct regmap *noc_regmap;
 	struct reset_control *reset;
+	u32 g_dss_version_tag;
 
 	void __iomem *noc_dss_base;
 	void __iomem *peri_crg_base;
 	void __iomem *pmc_base;
 	void __iomem *sctrl_base;
+	void __iomem *media_crg_base;
+	void __iomem *pctrl_base;
+	void __iomem *mmbuf_crg_base;
+	void __iomem *pmctrl_base;
 
 	struct clk *dss_axi_clk;
 	struct clk *dss_pclk_dss_clk;
@@ -2945,6 +3064,12 @@ struct dss_hw_ctx {
 	struct clk *dss_mmbuf_clk;
 	struct clk *dss_pclk_mmbuf_clk;
 
+	struct dss_clk_rate *dss_clk;
+
+	struct regulator *dpe_regulator;
+	struct regulator_bulk_data *mmbuf_regulator;
+	struct regulator_bulk_data *media_subsys_regulator;
+
 	bool power_on;
 	int irq;
 
@@ -2962,6 +3087,15 @@ struct dss_hw_ctx {
 	unsigned long screen_size;
 };
 
+typedef struct dss_clk_rate {
+	uint64_t dss_pri_clk_rate;
+	uint64_t dss_pclk_dss_rate;
+	uint64_t dss_pclk_pctrl_rate;
+	uint64_t dss_mmbuf_rate;
+	uint32_t dss_voltage_value; //0:0.7v, 2:0.8v
+	uint32_t reserved;
+} dss_clk_rate_t;
+
 struct dss_crtc {
 	struct drm_crtc base;
 	struct dss_hw_ctx *ctx;
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
index 2a13bbd772b7..739b3bd82f02 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
@@ -17,6 +17,10 @@
 
 int g_debug_set_reg_val = 0;
 
+DEFINE_SEMAPHORE(hisi_fb_dss_regulator_sem);
+
+static int dss_regulator_refcount;
+
 extern u32 g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX];
 
 mipi_ifbc_division_t g_mipi_ifbc_division[MIPI_DPHY_NUM][IFBC_TYPE_MAX] = {
@@ -104,6 +108,39 @@ void set_reg(char __iomem *addr, uint32_t val, uint8_t bw, uint8_t bs)
 	}
 }
 
+uint32_t set_bits32(uint32_t old_val, uint32_t val, uint8_t bw, uint8_t bs)
+{
+	uint32_t mask = (1UL << bw) - 1UL;
+	uint32_t tmp = 0;
+
+	tmp = old_val;
+	tmp &= ~(mask << bs);
+
+	return (tmp | ((val & mask) << bs));
+}
+
+struct dss_clk_rate *get_dss_clk_rate(struct dss_hw_ctx *ctx)
+{
+	struct dss_clk_rate *pdss_clk_rate = NULL;
+	uint64_t default_dss_pri_clk_rate;
+
+	if (ctx == NULL) {
+		DRM_ERROR("ctx is null.\n");
+		return pdss_clk_rate;
+	}
+
+	pdss_clk_rate = &(ctx->dss_clk);
+	default_dss_pri_clk_rate = DEFAULT_DSS_CORE_CLK_RATE_L1;
+
+	pdss_clk_rate->dss_pri_clk_rate = default_dss_pri_clk_rate;
+	pdss_clk_rate->dss_mmbuf_rate = DEFAULT_DSS_MMBUF_CLK_RATE_L1;
+	pdss_clk_rate->dss_pclk_dss_rate = DEFAULT_PCLK_DSS_RATE;
+	pdss_clk_rate->dss_pclk_pctrl_rate = DEFAULT_PCLK_PCTRL_RATE;
+
+
+	return pdss_clk_rate;
+}
+
 static int mipi_ifbc_get_rect(struct dss_rect *rect)
 {
 	u32 ifbc_type;
@@ -260,7 +297,7 @@ void init_ldi(struct dss_crtc *acrtc)
 	/* for 1Hz LCD and mipi command LCD*/
 	set_reg(ldi_base + LDI_DSI_CMD_MOD_CTRL, 0x1, 1, 1);
 
-	/*ldi_data_gate(hisifd, true);*/
+	/*ldi_data_gate(ctx, true);*/
 
 #ifdef CONFIG_HISI_FB_LDI_COLORBAR_USED
 	/* colorbar width*/
@@ -309,6 +346,7 @@ void init_dbuf(struct dss_crtc *acrtc)
 	int dfs_time = 0;
 	int dfs_time_min = 0;
 	int depth = 0;
+	int dfs_ram = 0;
 
 	ctx = acrtc->ctx;
 	if (!ctx) {
@@ -328,10 +366,13 @@ void init_dbuf(struct dss_crtc *acrtc)
 
 	dbuf_base = ctx->base + DSS_DBUF0_OFFSET;
 
-	if (mode->hdisplay * mode->vdisplay >= RES_4K_PHONE)
+	if (mode->hdisplay * mode->vdisplay >= RES_4K_PHONE) {
 		dfs_time_min = DFS_TIME_MIN_4K;
-	else
+		dfs_ram = 0x0;
+	} else {
 		dfs_time_min = DFS_TIME_MIN;
+		dfs_ram = 0xF00;
+	}
 
 	dfs_time = DFS_TIME;
 	depth = DBUF0_DEPTH;
@@ -341,6 +382,9 @@ void init_dbuf(struct dss_crtc *acrtc)
 		"hsw=%d\n"
 		"hbp=%d\n"
 		"hfp=%d\n"
+		"vfp = %d\n"
+		"vbp = %d\n"
+		"vsw = %d\n"
 		"mode->hdisplay=%d\n"
 		"mode->vdisplay=%d\n",
 		dfs_time,
@@ -348,6 +392,9 @@ void init_dbuf(struct dss_crtc *acrtc)
 		hsw,
 		hbp,
 		hfp,
+		vfp,
+		vbp,
+		vsw,
 		mode->hdisplay,
 		mode->vdisplay);
 
@@ -420,6 +467,9 @@ void init_dbuf(struct dss_crtc *acrtc)
 	outp32(dbuf_base + DBUF_FLUX_REQ_CTRL, (dfs_ok_mask << 1) | thd_flux_req_sw_en);
 
 	outp32(dbuf_base + DBUF_DFS_LP_CTRL, 0x1);
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		outp32(dbuf_base + DBUF_DFS_RAM_MANAGE, dfs_ram);
+	}
 }
 
 void init_dpp(struct dss_crtc *acrtc)
@@ -430,6 +480,7 @@ void init_dpp(struct dss_crtc *acrtc)
 	char __iomem *dpp_base;
 	char __iomem *mctl_sys_base;
 
+	DRM_INFO("+. \n");
 	ctx = acrtc->ctx;
 	if (!ctx) {
 		DRM_ERROR("ctx is NULL!\n");
@@ -448,8 +499,14 @@ void init_dpp(struct dss_crtc *acrtc)
 		(DSS_HEIGHT(mode->vdisplay) << 16) | DSS_WIDTH(mode->hdisplay));
 
 #ifdef CONFIG_HISI_FB_DPP_COLORBAR_USED
+	#if defined (CONFIG_HISI_FB_970)
+	outp32(dpp_base + DPP_CLRBAR_CTRL, (0x30 << 24) | (0 << 1) | 0x1);
+	set_reg(dpp_base + DPP_CLRBAR_1ST_CLR, 0x3FF00000, 30, 0); //Red
+	set_reg(dpp_base + DPP_CLRBAR_2ND_CLR, 0x000FFC00, 30, 0); //Green
+	set_reg(dpp_base + DPP_CLRBAR_3RD_CLR, 0x000003FF, 30, 0); //Blue
+	#else
 	void __iomem *mctl_base;
-	outp32(dpp_base + DPP_CLRBAR_CTRL, (0x30 << 24) |(0 << 1) | 0x1);
+	outp32(dpp_base + DPP_CLRBAR_CTRL, (0x30 << 24) | (0 << 1) | 0x1);
 	set_reg(dpp_base + DPP_CLRBAR_1ST_CLR, 0xFF, 8, 16);
 	set_reg(dpp_base + DPP_CLRBAR_2ND_CLR, 0xFF, 8, 8);
 	set_reg(dpp_base + DPP_CLRBAR_3RD_CLR, 0xFF, 8, 0);
@@ -465,7 +522,10 @@ void init_dpp(struct dss_crtc *acrtc)
 	set_reg(mctl_base + MCTL_CTL_MUTEX_ITF, 0x1, 2, 0);
 	set_reg(mctl_sys_base + MCTL_OV0_FLUSH_EN, 0x8, 4, 0);
 	set_reg(mctl_base + MCTL_CTL_MUTEX, 0x0, 1, 0);
+	#endif
 #endif
+
+	DRM_INFO("-. \n");
 }
 
 void enable_ldi(struct dss_crtc *acrtc)
@@ -550,13 +610,14 @@ void dpe_interrupt_unmask(struct dss_crtc *acrtc)
 	dss_base = ctx->base;
 
 	unmask = ~0;
-	unmask &= ~(BIT_DPP_INTS | BIT_ITF0_INTS | BIT_MMU_IRPT_NS);
+	unmask &= ~(BIT_ITF0_INTS | BIT_MMU_IRPT_NS);
 	outp32(dss_base + GLB_CPU_PDP_INT_MSK, unmask);
 
 	unmask = ~0;
 	unmask &= ~(BIT_VSYNC | BIT_VACTIVE0_END | BIT_LDI_UNFLOW);
 
 	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK, unmask);
+
 }
 
 void dpe_interrupt_mask(struct dss_crtc *acrtc)
@@ -620,12 +681,10 @@ int dpe_init(struct dss_crtc *acrtc)
 	return 0;
 }
 
-void dss_inner_clk_pdp_enable(struct dss_crtc *acrtc)
+void dss_inner_clk_pdp_enable(struct dss_hw_ctx *ctx)
 {
-	struct dss_hw_ctx *ctx;
 	char __iomem *dss_base;
 
-	ctx = acrtc->ctx;
 	if (!ctx) {
 		DRM_ERROR("ctx is NULL!\n");
 		return;
@@ -639,16 +698,74 @@ void dss_inner_clk_pdp_enable(struct dss_crtc *acrtc)
 	outp32(dss_base + DSS_DPP_DITHER_OFFSET + DITHER_MEM_CTRL, 0x00000008);
 }
 
-void dss_inner_clk_common_enable(struct dss_crtc *acrtc)
+static void dss_normal_set_reg(char __iomem *dss_base)
 {
-	struct dss_hw_ctx *ctx;
-	char __iomem *dss_base;
-
-	ctx = acrtc->ctx;
-	if (!ctx) {
-		DRM_ERROR("ctx is NULL!\n");
+	if (NULL == dss_base) {
+		DRM_ERROR("dss_base is null.\n");
 		return;
 	}
+	//core/axi/mmbuf
+	outp32(dss_base + DSS_CMDLIST_OFFSET + CMD_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_RCH_VG0_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);
+	outp32(dss_base + DSS_RCH_VG0_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x00000008);
+
+	outp32(dss_base + DSS_RCH_VG0_ARSR_OFFSET + ARSR2P_LB_MEM_CTRL, 0x00000008);
+
+	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + VPP_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);
+
+	outp32(dss_base + DSS_RCH_VG1_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);
+	outp32(dss_base + DSS_RCH_VG1_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);
+
+	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + HFBCD_MEM_CTRL, 0x88888888);
+	outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + HFBCD_MEM_CTRL_1, 0x00000888);
+	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + HFBCD_MEM_CTRL, 0x88888888);
+	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + HFBCD_MEM_CTRL_1, 0x00000888);
+
+	outp32(dss_base + DSS_RCH_VG2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+
+	outp32(dss_base + DSS_RCH_G0_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);
+	outp32(dss_base + DSS_RCH_G0_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x0000008);
+	outp32(dss_base + DSS_RCH_G0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_RCH_G0_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);
+
+	outp32(dss_base + DSS_RCH_G1_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);
+	outp32(dss_base + DSS_RCH_G1_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x0000008);
+	outp32(dss_base + DSS_RCH_G1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_RCH_G1_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);
+
+	outp32(dss_base + DSS_RCH_D0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_RCH_D0_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);
+	outp32(dss_base + DSS_RCH_D1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_RCH_D2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_RCH_D3_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+
+	outp32(dss_base + DSS_WCH0_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_WCH0_DMA_OFFSET + AFBCE_MEM_CTRL, 0x00000888);
+	outp32(dss_base + DSS_WCH0_DMA_OFFSET + ROT_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_WCH1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+	outp32(dss_base + DSS_WCH1_DMA_OFFSET + AFBCE_MEM_CTRL, 0x88888888);
+	outp32(dss_base + DSS_WCH1_DMA_OFFSET + AFBCE_MEM_CTRL_1, 0x00000088);
+	outp32(dss_base + DSS_WCH1_DMA_OFFSET + ROT_MEM_CTRL, 0x00000008);
+
+	outp32(dss_base + DSS_WCH1_DMA_OFFSET + WCH_SCF_COEF_MEM_CTRL, 0x00000088);
+	outp32(dss_base + DSS_WCH1_DMA_OFFSET + WCH_SCF_LB_MEM_CTRL, 0x00000088);
+	outp32(dss_base + GLB_DSS_MEM_CTRL, 0x02605550);
+
+}
+
+void dss_inner_clk_common_enable(struct dss_hw_ctx *ctx)
+{
+	char __iomem *dss_base;
+
+	if (NULL == ctx) {
+		DRM_ERROR("NULL Pointer!\n");
+		return -EINVAL;
+	}
+
 	dss_base = ctx->base;
 
 	/*core/axi/mmbuf*/
@@ -666,8 +783,16 @@ void dss_inner_clk_common_enable(struct dss_crtc *acrtc)
 	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*rch_v1 ,dma_buf mem*/
 	outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + AFBCD_MEM_CTRL, 0x00008888);/*rch_v1 ,afbcd mem*/
 
-	outp32(dss_base + DSS_RCH_VG2_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);/*rch_v2 ,scf mem*/
-	outp32(dss_base + DSS_RCH_VG2_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x00000008);/*rch_v2 ,scf mem*/
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + HFBCD_MEM_CTRL, 0x88888888);
+		outp32(dss_base + DSS_RCH_VG0_DMA_OFFSET + HFBCD_MEM_CTRL_1, 0x00000888);
+		outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + HFBCD_MEM_CTRL, 0x88888888);
+		outp32(dss_base + DSS_RCH_VG1_DMA_OFFSET + HFBCD_MEM_CTRL_1, 0x00000888);
+	} else {
+		outp32(dss_base + DSS_RCH_VG2_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);/*rch_v2 ,scf mem*/
+		outp32(dss_base + DSS_RCH_VG2_SCL_OFFSET + SCF_LB_MEM_CTRL, 0x00000008);/*rch_v2 ,scf mem*/
+	}
+
 	outp32(dss_base + DSS_RCH_VG2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*rch_v2 ,dma_buf mem*/
 
 	outp32(dss_base + DSS_RCH_G0_SCL_OFFSET + SCF_COEF_MEM_CTRL, 0x00000088);/*rch_g0 ,scf mem*/
@@ -692,9 +817,18 @@ void dss_inner_clk_common_enable(struct dss_crtc *acrtc)
 	outp32(dss_base + DSS_WCH1_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*wch1 DMA/AFBCE mem*/
 	outp32(dss_base + DSS_WCH1_DMA_OFFSET + AFBCE_MEM_CTRL, 0x00000888);/*wch1 DMA/AFBCE mem*/
 	outp32(dss_base + DSS_WCH1_DMA_OFFSET + ROT_MEM_CTRL, 0x00000008);/*wch1 rot mem*/
-	outp32(dss_base + DSS_WCH2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*wch2 DMA/AFBCE mem*/
-	outp32(dss_base + DSS_WCH2_DMA_OFFSET + ROT_MEM_CTRL, 0x00000008);/*wch2 rot mem*/
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		outp32(dss_base + DSS_WCH1_DMA_OFFSET + WCH_SCF_COEF_MEM_CTRL, 0x00000088);
+		outp32(dss_base + DSS_WCH1_DMA_OFFSET + WCH_SCF_LB_MEM_CTRL, 0x00000008);
+		outp32(dss_base + GLB_DSS_MEM_CTRL, 0x02605550);
+	} else {
+		outp32(dss_base + DSS_WCH2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);/*wch2 DMA/AFBCE mem*/
+		outp32(dss_base + DSS_WCH2_DMA_OFFSET + ROT_MEM_CTRL, 0x00000008);/*wch2 rot mem*/
+		//outp32(dss_base + DSS_WCH2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+		//outp32(dss_base + DSS_WCH2_DMA_OFFSET + DMA_BUF_MEM_CTRL, 0x00000008);
+	}
 }
+
 int dpe_irq_enable(struct dss_crtc *acrtc)
 {
 	struct dss_hw_ctx *ctx;
@@ -728,3 +862,199 @@ int dpe_irq_disable(struct dss_crtc *acrtc)
 
 	return 0;
 }
+
+void mds_regulator_enable(struct dss_hw_ctx *ctx)
+{
+	int ret = 0;
+
+	if (NULL == ctx) {
+		DRM_ERROR("NULL ptr.\n");
+		return -EINVAL;
+	}
+
+	ret = regulator_bulk_enable(1, ctx->media_subsys_regulator);
+	if (ret) {
+		DRM_ERROR(" media subsys regulator_enable failed, error=%d!\n", ret);
+	}
+
+	return ret;
+}
+
+int dpe_common_clk_enable(struct dss_hw_ctx *ctx)
+{
+	int ret = 0;
+	struct clk *clk_tmp = NULL;
+
+	if (ctx == NULL) {
+		DRM_ERROR("ctx is NULL point!\n");
+		return -EINVAL;
+	}
+
+	clk_tmp = ctx->dss_mmbuf_clk;
+	if (clk_tmp) {
+		ret = clk_prepare(clk_tmp);
+		if (ret) {
+			DRM_ERROR(" dss_mmbuf_clk clk_prepare failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+
+		ret = clk_enable(clk_tmp);
+		if (ret) {
+			DRM_ERROR(" dss_mmbuf_clk clk_enable failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+	}
+
+	clk_tmp = ctx->dss_axi_clk;
+	if (clk_tmp) {
+		ret = clk_prepare(clk_tmp);
+		if (ret) {
+			DRM_ERROR(" dss_axi_clk clk_prepare failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+
+		ret = clk_enable(clk_tmp);
+		if (ret) {
+			DRM_ERROR(" dss_axi_clk clk_enable failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+	}
+
+	clk_tmp = ctx->dss_pclk_dss_clk;
+	if (clk_tmp) {
+		ret = clk_prepare(clk_tmp);
+		if (ret) {
+			DRM_ERROR(" dss_pclk_dss_clk clk_prepare failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+
+		ret = clk_enable(clk_tmp);
+		if (ret) {
+			DRM_ERROR(" dss_pclk_dss_clk clk_enable failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+int dpe_inner_clk_enable(struct dss_hw_ctx *ctx)
+{
+	int ret = 0;
+	struct clk *clk_tmp = NULL;
+
+	if (ctx == NULL) {
+		DRM_ERROR("ctx is NULL point!\n");
+		return -EINVAL;
+	}
+
+	clk_tmp = ctx->dss_pri_clk;
+	if (clk_tmp) {
+		ret = clk_prepare(clk_tmp);
+		if (ret) {
+			DRM_ERROR(" dss_pri_clk clk_prepare failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+
+		ret = clk_enable(clk_tmp);
+		if (ret) {
+			DRM_ERROR(" dss_pri_clk clk_enable failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+	}
+
+	clk_tmp = ctx->dss_pxl0_clk;
+	if (clk_tmp) {
+		ret = clk_prepare(clk_tmp);
+		if (ret) {
+			DRM_ERROR(" dss_pxl0_clk clk_prepare failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+
+		ret = clk_enable(clk_tmp);
+		if (ret) {
+			DRM_ERROR(" dss_pxl0_clk clk_enable failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+int dpe_regulator_enable(struct dss_hw_ctx *ctx)
+{
+	int ret = 0;
+
+	DRM_INFO("+. \n");
+	if (NULL == ctx) {
+		DRM_ERROR("NULL ptr.\n");
+		return -EINVAL;
+	}
+
+	ret = regulator_enable(ctx->dpe_regulator);
+	if (ret) {
+		DRM_ERROR(" dpe regulator_enable failed, error=%d!\n", ret);
+		return -EINVAL;
+	}
+
+	DRM_INFO("-. \n");
+
+	return ret;
+}
+
+int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
+{
+	struct dss_clk_rate *pdss_clk_rate = NULL;
+	uint64_t dss_pri_clk_rate;
+	uint64_t dss_mmbuf_rate;
+	int ret = 0;
+
+	DRM_INFO("+. \n");
+	if (NULL == ctx) {
+		DRM_ERROR("NULL Pointer!\n");
+		return -EINVAL;
+	}
+
+	pdss_clk_rate = get_dss_clk_rate(ctx);
+	if (NULL == pdss_clk_rate) {
+		DRM_ERROR("NULL Pointer!\n");
+		return -EINVAL;
+	}
+
+	dss_pri_clk_rate = pdss_clk_rate->dss_pri_clk_rate;
+	ret = clk_set_rate(ctx->dss_pri_clk, dss_pri_clk_rate);
+	if (ret < 0) {
+		DRM_ERROR("dss_pri_clk clk_set_rate(%llu) failed, error=%d!\n",
+			dss_pri_clk_rate, ret);
+		return -EINVAL;
+	}
+	DRM_INFO("dss_pri_clk:[%llu]->[%llu].\n",
+		dss_pri_clk_rate, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
+
+#if 0 /* it will be set on dss_ldi_set_mode func */
+	ret = clk_set_rate(ctx->dss_pxl0_clk, pinfo->pxl_clk_rate);
+	if (ret < 0) {
+		DRM_ERROR("fb%d dss_pxl0_clk clk_set_rate(%llu) failed, error=%d!\n",
+			ctx->index, pinfo->pxl_clk_rate, ret);
+		if (g_fpga_flag == 0) {
+			return -EINVAL;
+		}
+	}
+
+	DRM_INFO("dss_pxl0_clk:[%llu]->[%llu].\n",
+			pinfo->pxl_clk_rate, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
+#endif
+
+	dss_mmbuf_rate = pdss_clk_rate->dss_mmbuf_rate;
+	ret = clk_set_rate(ctx->dss_mmbuf_clk, dss_mmbuf_rate);
+	if (ret < 0) {
+		DRM_ERROR("dss_mmbuf clk_set_rate(%llu) failed, error=%d!\n",
+			dss_mmbuf_rate, ret);
+		return -EINVAL;
+	}
+
+	DRM_INFO("dss_mmbuf_clk:[%llu]->[%llu].\n",
+		dss_mmbuf_rate, (uint64_t)clk_get_rate(ctx->dss_mmbuf_clk));
+
+	return ret;
+}
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
index 7ee992273d72..638890615656 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
@@ -14,13 +14,19 @@
 #ifndef KIRIN_DRM_DPE_UTILS_H
 #define KIRIN_DRM_DPE_UTILS_H
 
+#if defined (CONFIG_HISI_FB_970)
+#include "kirin970_dpe_reg.h"
+#else
 #include "kirin_dpe_reg.h"
+#endif
+#include "kirin_drm_drv.h"
 
 /*#define CONFIG_HISI_FB_OV_BASE_USED*/
 /*#define CONFIG_HISI_FB_DPP_COLORBAR_USED*/
 /*#define CONFIG_HISI_FB_LDI_COLORBAR_USED*/
 
 void set_reg(char __iomem *addr, uint32_t val, uint8_t bw, uint8_t bs);
+uint32_t set_bits32(uint32_t old_val, uint32_t val, uint8_t bw, uint8_t bs);
 
 void init_dbuf(struct dss_crtc *acrtc);
 void init_dpp(struct dss_crtc *acrtc);
@@ -31,11 +37,15 @@ void deinit_ldi(struct dss_crtc *acrtc);
 void enable_ldi(struct dss_crtc *acrtc);
 void disable_ldi(struct dss_crtc *acrtc);
 
-void dss_inner_clk_pdp_enable(struct dss_crtc *acrtc);
-void dss_inner_clk_common_enable(struct dss_crtc *acrtc);
+void dss_inner_clk_pdp_enable(struct dss_hw_ctx *ctx);
+void dss_inner_clk_common_enable(struct dss_hw_ctx *ctx);
 void dpe_interrupt_clear(struct dss_crtc *acrtc);
 void dpe_interrupt_unmask(struct dss_crtc *acrtc);
 void dpe_interrupt_mask(struct dss_crtc *acrtc);
+int dpe_common_clk_enable(struct dss_hw_ctx *ctx);
+int dpe_inner_clk_enable(struct dss_hw_ctx *ctx);
+int dpe_regulator_enable(struct dss_hw_ctx *ctx);
+int dpe_set_clk_rate(struct dss_hw_ctx *ctx);
 
 int dpe_irq_enable(struct dss_crtc *acrtc);
 int dpe_irq_disable(struct dss_crtc *acrtc);
@@ -51,7 +61,7 @@ int hisi_dss_mctl_mutex_unlock(struct dss_hw_ctx *ctx);
 int hisi_dss_ovl_base_config(struct dss_hw_ctx *ctx, u32 xres, u32 yres);
 
 void hisi_fb_pan_display(struct drm_plane *plane);
-void hisi_dss_online_play(struct drm_plane *plane, drm_dss_layer_t *layer);
+void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane, drm_dss_layer_t *layer);
 
 u32 dss_get_format(u32 pixel_format);
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
index ffa0cd792bf1..4ae411b29cf4 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
@@ -26,7 +26,6 @@
 
 #include "kirin_drm_drv.h"
 
-
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 static bool fbdev = true;
 MODULE_PARM_DESC(fbdev, "Enable fbdev compat layer");
@@ -61,10 +60,24 @@ static void kirin_fbdev_output_poll_changed(struct drm_device *dev)
 
 	dsi_set_output_client(dev);
 
+#ifdef CMA_BUFFER_USED
+	if (priv->fbdev) {
+		DRM_INFO("hotplug_event!!!!!!\n");
+		drm_fbdev_cma_hotplug_event(priv->fbdev);
+	} else {
+		DRM_INFO("cma_init!!!!!!\n");
+		priv->fbdev = drm_fbdev_cma_init(dev, 32,
+				dev->mode_config.num_crtc,
+				dev->mode_config.num_connector);
+		if (IS_ERR(priv->fbdev))
+			priv->fbdev = NULL;
+	}
+#else
 	if (priv->fbdev)
 		drm_fb_helper_hotplug_event(priv->fbdev);
 	else
 		priv->fbdev = kirin_drm_fbdev_init(dev);
+#endif
 }
 
 static const struct drm_mode_config_funcs kirin_drm_mode_config_funcs = {
@@ -125,14 +138,16 @@ static int kirin_drm_kms_init(struct drm_device *dev)
 	/* reset all the states of crtc/plane/encoder/connector */
 	drm_mode_config_reset(dev);
 
-	//if (fbdev)
-	//	priv->fbdev = kirin_drm_fbdev_init(dev);
+	if (fbdev)
+		priv->fbdev = kirin_drm_fbdev_init(dev);
 
 	/* init kms poll for handling hpd */
 	drm_kms_helper_poll_init(dev);
 
+#if 0
 	/* force detection after connectors init */
 	(void)drm_helper_hpd_irq_event(dev);
+#endif
 
 	return 0;
 
@@ -336,10 +351,13 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	DRM_INFO("the device node is %s\n", np->name);
 	remote = kirin_get_remote_node(np);
 	if (IS_ERR(remote))
 		return PTR_ERR(remote);
 
+	DRM_INFO("the device remote node is %s\n", remote->name);
+
 	component_match_add(dev, &match, compare_of, remote);
 
 	return component_master_add_with_match(dev, &kirin_drm_ops, match);
@@ -358,6 +376,9 @@ static const struct of_device_id kirin_drm_dt_ids[] = {
 	{ .compatible = "hisilicon,hi3660-dpe",
 	  .data = &dss_dc_ops,
 	},
+	{ .compatible = "hisilicon,kirin970-dpe",
+	  .data = &dss_dc_ops,
+	},
 	{ /* end node */ },
 };
 MODULE_DEVICE_TABLE(of, kirin_drm_dt_ids);
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h
index 2f842ad36ae9..3aee36a40749 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h
@@ -22,6 +22,7 @@
 
 #define MAX_CRTC	2
 
+//#define CMA_BUFFER_USED
 #define to_kirin_fbdev(x) container_of(x, struct kirin_fbdev, fb_helper)
 
 /* display controller init/cleanup ops */
@@ -57,5 +58,4 @@ struct drm_framebuffer *kirin_framebuffer_init(struct drm_device *dev,
 struct drm_fb_helper *kirin_drm_fbdev_init(struct drm_device *dev);
 void kirin_drm_fbdev_fini(struct drm_device *dev);
 
-
 #endif /* __KIRIN_DRM_DRV_H__ */
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
index 64d0b1979bf5..fe9d8f7166df 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
@@ -37,10 +37,21 @@
 #include "kirin_drm_drv.h"
 
 #include "kirin_drm_dpe_utils.h"
+#if defined (CONFIG_HISI_FB_970)
+#include "kirin970_dpe_reg.h"
+#else
 #include "kirin_dpe_reg.h"
+#endif
 
+#define DSS_POWER_UP_ON_UEFI
+
+#if defined (CONFIG_HISI_FB_970)
+#define DTS_COMP_DSS_NAME "hisilicon,kirin970-dpe"
+#else
 #define DTS_COMP_DSS_NAME "hisilicon,hi3660-dpe"
+#endif
 
+#define PPLL7_USED_IN_DRV
 #define DSS_DEBUG	0
 
 static const struct dss_format dss_formats[] = {
@@ -90,41 +101,215 @@ u32 dss_get_format(u32 pixel_format)
 	return HISI_FB_PIXEL_FORMAT_UNSUPPORT;
 }
 
+#ifdef PPLL7_USED_IN_DRV
+/*******************************************************************************
+**
+*/
+int hdmi_ceil(uint64_t a, uint64_t b)
+{
+	if (b == 0)
+		return -1;
+
+	if (a%b != 0) {
+		return a/b + 1;
+	} else {
+		return a/b;
+	}
+}
+
+int hdmi_pxl_ppll7_init(struct dss_hw_ctx *ctx, uint64_t pixel_clock)
+{
+	uint64_t refdiv, fbdiv, frac, postdiv1, postdiv2;
+	uint64_t vco_min_freq_output = KIRIN970_VCO_MIN_FREQ_OUPUT;
+	uint64_t sys_clock_fref = KIRIN970_SYS_19M2;
+	uint64_t ppll7_freq_divider;
+	uint64_t vco_freq_output;
+	uint64_t frac_range = 0x1000000;/*2^24*/
+	uint64_t pixel_clock_ori;
+	uint64_t pixel_clock_cur;
+	uint32_t ppll7ctrl0;
+	uint32_t ppll7ctrl1;
+	uint32_t ppll7ctrl0_val;
+	uint32_t ppll7ctrl1_val;
+	int i, ret;
+	int ceil_temp;
+	int freq_divider_list[22] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
+			12, 14, 15, 16, 20, 21, 24,
+			25, 30, 36, 42, 49};
+
+	int postdiv1_list[22] = {1, 2, 3, 4, 5, 6, 7, 4, 3, 5,
+		   4, 7, 5, 4, 5, 7, 6, 5, 6, 6,
+			7, 7};
+
+	int postdiv2_list[22] = {1, 1, 1, 1, 1, 1, 1, 2, 3, 2,
+		3, 2, 3, 4, 4, 3, 4, 5, 5, 6,
+			6, 7};
+	ret = 0;
+	postdiv1 = 0;
+	postdiv2 = 0;
+	if (pixel_clock == 0)
+		return -EINVAL;
+
+	if (ctx == NULL) {
+		DRM_ERROR("NULL Pointer\n");
+		return -EINVAL;
+	}
+
+	pixel_clock_ori = pixel_clock;
+
+	if (pixel_clock_ori <= 255000000)
+		pixel_clock_cur = pixel_clock * 7;
+	else if (pixel_clock_ori <= 415000000)
+		pixel_clock_cur = pixel_clock * 5;
+	else if (pixel_clock_ori <= 594000000)
+		pixel_clock_cur = pixel_clock * 3;
+	else {
+		DRM_ERROR("Clock don't support!!\n");
+		return -EINVAL;
+	}
+
+	pixel_clock_cur = pixel_clock_cur / 1000;
+	ceil_temp = hdmi_ceil(vco_min_freq_output, pixel_clock_cur);
+
+	if (ceil_temp < 0)
+		return -EINVAL;
+
+	ppll7_freq_divider = (uint64_t)ceil_temp;
+
+	for (i = 0; i < 22; i++) {
+		if (freq_divider_list[i] >= ppll7_freq_divider) {
+			ppll7_freq_divider = freq_divider_list[i];
+			postdiv1 = postdiv1_list[i];
+			postdiv2 = postdiv2_list[i];
+			DRM_INFO("postdiv1=0x%llx, POSTDIV2=0x%llx\n", postdiv1, postdiv2);
+			break;
+		}
+	}
+
+	vco_freq_output = ppll7_freq_divider * pixel_clock_cur;
+	if (vco_freq_output == 0)
+		return -EINVAL;
+
+	ceil_temp = hdmi_ceil(400000, vco_freq_output);
+
+	if (ceil_temp < 0)
+		return -EINVAL;
+
+	refdiv = ((vco_freq_output * ceil_temp) >= 494000) ? 1 : 2;
+	DRM_DEBUG("refdiv=0x%llx\n", refdiv);
+
+	fbdiv = (vco_freq_output * ceil_temp) * refdiv / sys_clock_fref;
+	DRM_DEBUG("fbdiv=0x%llx\n", fbdiv);
+
+	frac = (uint64_t)(ceil_temp * vco_freq_output - sys_clock_fref / refdiv * fbdiv) * refdiv * frac_range;
+	frac = (uint64_t)frac / sys_clock_fref;
+	DRM_DEBUG("frac=0x%llx\n", frac);
+
+	ppll7ctrl0 = inp32(ctx->pmctrl_base + MIDIA_PPLL7_CTRL0);
+	ppll7ctrl0 &= ~MIDIA_PPLL7_FREQ_DEVIDER_MASK;
+
+	ppll7ctrl0_val = 0x0;
+	ppll7ctrl0_val |= (uint32_t)(postdiv2 << 23 | postdiv1 << 20 | fbdiv << 8 | refdiv << 2);
+	ppll7ctrl0_val &= MIDIA_PPLL7_FREQ_DEVIDER_MASK;
+	ppll7ctrl0 |= ppll7ctrl0_val;
+
+	outp32(ctx->pmctrl_base + MIDIA_PPLL7_CTRL0, ppll7ctrl0);
+
+	ppll7ctrl1 = inp32(ctx->pmctrl_base + MIDIA_PPLL7_CTRL1);
+	ppll7ctrl1 &= ~MIDIA_PPLL7_FRAC_MODE_MASK;
+
+	ppll7ctrl1_val = 0x0;
+	ppll7ctrl1_val |= (uint32_t)(1 << 25 | 0 << 24 | frac);
+	ppll7ctrl1_val &= MIDIA_PPLL7_FRAC_MODE_MASK;
+	ppll7ctrl1 |= ppll7ctrl1_val;
+
+	outp32(ctx->pmctrl_base + MIDIA_PPLL7_CTRL1, ppll7ctrl1);
+
+#if 1
+	ret = clk_set_rate(ctx->dss_pxl0_clk, 144000000UL);
+#else
+	/*comfirm ldi1 switch ppll7*/
+	if (pixel_clock_ori <= 255000000)
+		ret = clk_set_rate(ctx->dss_pxl0_clk, DEFAULT_MIDIA_PPLL7_CLOCK_FREQ/7);
+	else if (pixel_clock_ori <= 415000000)
+		ret = clk_set_rate(ctx->dss_pxl0_clk, DEFAULT_MIDIA_PPLL7_CLOCK_FREQ/5);
+	else if (pixel_clock_ori <= 594000000)
+		ret = clk_set_rate(ctx->dss_pxl0_clk, DEFAULT_MIDIA_PPLL7_CLOCK_FREQ/3);
+	else {
+		DRM_ERROR("Clock don't support!!\n");
+		return -EINVAL;
+	}
+#endif
+
+	if (ret < 0) {
+		DRM_ERROR("dss_pxl0_clk clk_set_rate(%llu) failed, error=%d!\n",
+			pixel_clock_cur, ret);
+	}
+	return ret;
+}
+#endif
+
 /*******************************************************************************
  **
  */
 static void dss_ldi_set_mode(struct dss_crtc *acrtc)
 {
 	int ret;
-	u32 clk_Hz;
+	uint64_t clk_Hz;
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 	struct drm_display_mode *mode = &acrtc->base.state->mode;
 	struct drm_display_mode *adj_mode = &acrtc->base.state->adjusted_mode;
 
-
 	DRM_INFO("mode->clock(org) = %u\n", mode->clock);
-	if(mode->clock == 148500){
-		clk_Hz = 144000 * 1000UL;
-	} else if(mode->clock == 83496){
-		clk_Hz = 80000 * 1000UL;
-	} else if(mode->clock == 74440){
-		clk_Hz = 72000 * 1000UL;
-	} else if(mode->clock == 74250){
-		clk_Hz = 72000 * 1000UL;
+	if (acrtc->ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		if (mode->clock == 148500)
+			clk_Hz = 144000 * 1000UL;
+		else if (mode->clock == 83496)
+			clk_Hz = 80000 * 1000UL;
+		else if (mode->clock == 74440)
+			clk_Hz = 72000 * 1000UL;
+		else if (mode->clock == 74250)
+			clk_Hz = 72000 * 1000UL;
+		else
+			clk_Hz = mode->clock * 1000UL;
+
+#ifdef PPLL7_USED_IN_DRV
+		hdmi_pxl_ppll7_init(ctx, clk_Hz);
+#else
+		/*
+		 * Success should be guaranteed in mode_valid call back,
+		 * so failure shouldn't happen here
+		 */
+		ret = clk_set_rate(ctx->dss_pxl0_clk, clk_Hz);
+		if (ret) {
+			DRM_ERROR("failed to set pixel clk %dHz (%d)\n", clk_Hz, ret);
+		}
+#endif
+		adj_mode->clock = clk_Hz / 1000;
 	} else {
-		clk_Hz = mode->clock * 1000UL;;
-	}
+		if (mode->clock == 148500)
+			clk_Hz = 144000 * 1000UL;
+		else if (mode->clock == 83496)
+			clk_Hz = 80000 * 1000UL;
+		else if (mode->clock == 74440)
+			clk_Hz = 72000 * 1000UL;
+		else if (mode->clock == 74250)
+			clk_Hz = 72000 * 1000UL;
+		else
+			clk_Hz = mode->clock * 1000UL;
 
-	/*
-	 * Success should be guaranteed in mode_valid call back,
-	 * so failure shouldn't happen here
-	 */
-	ret = clk_set_rate(ctx->dss_pxl0_clk, clk_Hz);
-	if (ret) {
-		DRM_ERROR("failed to set pixel clk %dHz (%d)\n", clk_Hz, ret);
+		/*
+		 * Success should be guaranteed in mode_valid call back,
+		 * so failure shouldn't happen here
+		 */
+		ret = clk_set_rate(ctx->dss_pxl0_clk, clk_Hz);
+		if (ret) {
+			DRM_ERROR("failed to set pixel clk %dHz (%d)\n", clk_Hz, ret);
+		}
+		adj_mode->clock = clk_get_rate(ctx->dss_pxl0_clk) / 1000;
 	}
-	adj_mode->clock = clk_get_rate(ctx->dss_pxl0_clk) / 1000;
-	DRM_INFO("dss_pxl0_clk = %u\n",  adj_mode->clock);
+
+	DRM_INFO("dss_pxl0_clk [%llu]->[%llu] \n", clk_Hz, clk_get_rate(ctx->dss_pxl0_clk));
 
 	dpe_init(acrtc);
 }
@@ -134,6 +319,15 @@ static int dss_power_up(struct dss_crtc *acrtc)
 	int ret;
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 
+#if defined (CONFIG_HISI_FB_970)
+	//mds_regulator_enable(ctx);
+	dpe_common_clk_enable(ctx);
+	dpe_inner_clk_enable(ctx);
+	#ifndef DSS_POWER_UP_ON_UEFI
+	dpe_regulator_enable(ctx);
+	#endif
+	dpe_set_clk_rate(ctx);
+#else
 	ret = clk_prepare_enable(ctx->dss_pxl0_clk);
 	if (ret) {
 		DRM_ERROR("failed to enable dss_pxl0_clk (%d)\n", ret);
@@ -163,8 +357,11 @@ static int dss_power_up(struct dss_crtc *acrtc)
 		DRM_ERROR("failed to enable dss_mmbuf_clk (%d)\n", ret);
 		return ret;
 	}
-	dss_inner_clk_pdp_enable(acrtc);
-	dss_inner_clk_common_enable(acrtc);
+#endif
+
+	dss_inner_clk_common_enable(ctx);
+	dss_inner_clk_pdp_enable(ctx);
+
 	dpe_interrupt_mask(acrtc);
 	dpe_interrupt_clear(acrtc);
 	dpe_irq_enable(acrtc);
@@ -225,17 +422,14 @@ static irqreturn_t dss_irq_handler(int irq, void *data)
 
 	isr_s1 = inp32(dss_base + GLB_CPU_PDP_INTS);
 	isr_s2 = inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS);
-	isr_s2_dpp = inp32(dss_base + DSS_DPP_OFFSET + DPP_INTS);
-	isr_s2_smmu = inp32(dss_base + DSS_SMMU_OFFSET + SMMU_INTSTAT_NS);
+	DRM_INFO_ONCE("isr_s1 = 0x%x!\n", isr_s1);
+	DRM_INFO_ONCE("isr_s2 = 0x%x!\n", isr_s2);
 
-	outp32(dss_base + DSS_SMMU_OFFSET + SMMU_INTCLR_NS, isr_s2_smmu);
-	outp32(dss_base + DSS_DPP_OFFSET + DPP_INTS, isr_s2_dpp);
 	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS, isr_s2);
 	outp32(dss_base + GLB_CPU_PDP_INTS, isr_s1);
 
 	isr_s1 &= ~(inp32(dss_base + GLB_CPU_PDP_INT_MSK));
 	isr_s2 &= ~(inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK));
-	isr_s2_dpp &= ~(inp32(dss_base + DSS_DPP_OFFSET + DPP_INT_MSK));
 
 	if (isr_s2 & BIT_VACTIVE0_END) {
 		ctx->vactive0_end_flag++;
@@ -498,45 +692,81 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = NULL;
+	u32 dss_version_tag;
 	int ret = 0;
 
 	np = of_find_compatible_node(NULL, NULL, DTS_COMP_DSS_NAME);
 	if (!np) {
-			DRM_ERROR("NOT FOUND device node %s!\n",
-				    DTS_COMP_DSS_NAME);
-			return -ENXIO;
+		DRM_ERROR("NOT FOUND device node %s!\n",
+			DTS_COMP_DSS_NAME);
+		return -ENXIO;
 	}
 
+#if defined (CONFIG_HISI_FB_970)
+	ret = of_property_read_u32(np, "dss_version_tag", &dss_version_tag);
+	if (ret) {
+		DRM_ERROR("failed to get dss_version_tag.\n");
+	}
+	ctx->g_dss_version_tag = dss_version_tag;
+	DRM_INFO("dss_version_tag=0x%x.\n", ctx->g_dss_version_tag);
+#else
+	ctx->g_dss_version_tag = FB_ACCEL_HI366x;
+	DRM_INFO("dss_version_tag=0x%x.\n", ctx->g_dss_version_tag);
+#endif
+
 	ctx->base = of_iomap(np, 0);
 	if (!(ctx->base)) {
-			DRM_ERROR ("failed to get ade base resource.\n");
-			return -ENXIO;
+		DRM_ERROR ("failed to get dss base resource.\n");
+		return -ENXIO;
 	}
+	DRM_INFO("dss base =0x%x.\n", ctx->base);
 
 	ctx->peri_crg_base  = of_iomap(np, 1);
 	if (!(ctx->peri_crg_base)) {
-			DRM_ERROR ("failed to get ade peri_crg_base  resource.\n");
-			return -ENXIO;
+		DRM_ERROR ("failed to get dss peri_crg_base resource.\n");
+		return -ENXIO;
 	}
 
 	ctx->sctrl_base  = of_iomap(np, 2);
 	if (!(ctx->sctrl_base)) {
-			DRM_ERROR ("failed to get ade sctrl_base  resource.\n");
-			return -ENXIO;
+		DRM_ERROR ("failed to get dss sctrl_base resource.\n");
+		return -ENXIO;
 	}
 
-	ctx->pmc_base = of_iomap(np, 3);
-	if (!(ctx->pmc_base)) {
-			DRM_ERROR ("failed to get ade pmc_base   resource.\n");
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		ctx->pctrl_base = of_iomap(np, 3);
+		if (!(ctx->pctrl_base)) {
+			DRM_ERROR ("failed to get dss pctrl_base resource.\n");
 			return -ENXIO;
+		}
+	} else {
+		ctx->pmc_base = of_iomap(np, 3);
+		if (!(ctx->pmc_base)) {
+			DRM_ERROR ("failed to get dss pmc_base resource.\n");
+			return -ENXIO;
+		}
 	}
 
 	ctx->noc_dss_base = of_iomap(np, 4);
 	if (!(ctx->noc_dss_base)) {
-			DRM_ERROR ("failed to get noc_dss_base  resource.\n");
-			return -ENXIO;
+		DRM_ERROR ("failed to get noc_dss_base resource.\n");
+		return -ENXIO;
 	}
 
+#if defined (CONFIG_HISI_FB_970)
+	ctx->pmctrl_base = of_iomap(np, 5);
+	if (!(ctx->pmctrl_base)) {
+		DRM_ERROR ("failed to get dss pmctrl_base resource.\n");
+		return -ENXIO;
+	}
+
+	ctx->media_crg_base = of_iomap(np, 6);
+	if (!(ctx->media_crg_base)) {
+		DRM_ERROR ("failed to get dss media_crg_base resource.\n");
+		return -ENXIO;
+	}
+#endif
+
 	/* get irq no */
 	ctx->irq = irq_of_parse_and_map(np, 0);
 	if (ctx->irq <= 0) {
@@ -544,12 +774,22 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 		return -ENXIO;
 	}
 
-	DRM_INFO("dss irq = %d.", ctx->irq);
+	DRM_INFO("dss irq = %d. \n", ctx->irq);
+
+#ifndef DSS_POWER_UP_ON_UEFI
+#if defined (CONFIG_HISI_FB_970)
+	ctx->dpe_regulator = devm_regulator_get(dev, REGULATOR_PDP_NAME);
+	if (!ctx->dpe_regulator) {
+		DRM_ERROR("failed to get regulator resource! ret=%d.\n", ret);
+		return -ENXIO;
+	}
+#endif
+#endif
 
 	ctx->dss_mmbuf_clk = devm_clk_get(dev, "clk_dss_axi_mm");
 	if (!ctx->dss_mmbuf_clk) {
 		DRM_ERROR("failed to parse dss_mmbuf_clk\n");
-	    return -ENODEV;
+		return -ENODEV;
 	}
 
 	ctx->dss_axi_clk = devm_clk_get(dev, "aclk_dss");
@@ -561,7 +801,7 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 	ctx->dss_pclk_dss_clk = devm_clk_get(dev, "pclk_dss");
 	if (!ctx->dss_pclk_dss_clk) {
 		DRM_ERROR("failed to parse dss_pclk_dss_clk\n");
-	    return -ENODEV;
+		return -ENODEV;
 	}
 
 	ctx->dss_pri_clk = devm_clk_get(dev, "clk_edc0");
@@ -570,15 +810,17 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 	    return -ENODEV;
 	}
 
-	ret = clk_set_rate(ctx->dss_pri_clk, DEFAULT_DSS_CORE_CLK_07V_RATE);
-	if (ret < 0) {
-		DRM_ERROR("dss_pri_clk clk_set_rate(%lu) failed, error=%d!\n",
-			DEFAULT_DSS_CORE_CLK_07V_RATE, ret);
-		return -EINVAL;
-	}
+	if (ctx->g_dss_version_tag != FB_ACCEL_KIRIN970) {
+		ret = clk_set_rate(ctx->dss_pri_clk, DEFAULT_DSS_CORE_CLK_07V_RATE);
+		if (ret < 0) {
+			DRM_ERROR("dss_pri_clk clk_set_rate(%lu) failed, error=%d!\n",
+				DEFAULT_DSS_CORE_CLK_07V_RATE, ret);
+			return -EINVAL;
+		}
 
-	DRM_INFO("dss_pri_clk:[%lu]->[%llu].\n",
-		DEFAULT_DSS_CORE_CLK_07V_RATE, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
+		DRM_INFO("dss_pri_clk:[%lu]->[%llu].\n",
+			DEFAULT_DSS_CORE_CLK_07V_RATE, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
+	}
 
 	ctx->dss_pxl0_clk = devm_clk_get(dev, "clk_ldi0");
 	if (!ctx->dss_pxl0_clk) {
@@ -586,18 +828,19 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 		return -ENODEV;
 	}
 
-	ret = clk_set_rate(ctx->dss_pxl0_clk, DSS_MAX_PXL0_CLK_144M);
-	if (ret < 0) {
-		DRM_ERROR("dss_pxl0_clk clk_set_rate(%lu) failed, error=%d!\n",
-			DSS_MAX_PXL0_CLK_144M, ret);
-		return -EINVAL;
-	}
+	if (ctx->g_dss_version_tag != FB_ACCEL_KIRIN970) {
+		ret = clk_set_rate(ctx->dss_pxl0_clk, DSS_MAX_PXL0_CLK_144M);
+		if (ret < 0) {
+			DRM_ERROR("dss_pxl0_clk clk_set_rate(%lu) failed, error=%d!\n",
+				DSS_MAX_PXL0_CLK_144M, ret);
+			return -EINVAL;
+		}
 
-	DRM_INFO("dss_pxl0_clk:[%lu]->[%llu].\n",
-		DSS_MAX_PXL0_CLK_144M, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
+		DRM_INFO("dss_pxl0_clk:[%lu]->[%llu].\n",
+			DSS_MAX_PXL0_CLK_144M, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
+	}
 
 	/* regulator enable */
-
 	dss_enable_iommu(pdev, ctx);
 
 	return 0;
@@ -667,7 +910,7 @@ static int dss_drm_init(struct drm_device *dev)
 	ret = devm_request_irq(dev->dev, ctx->irq, dss_irq_handler,
 			       IRQF_SHARED, dev->driver->name, acrtc);
 	if (ret) {
-	    DRM_ERROR("fail to  devm_request_irq, ret=%d!", ret);
+		DRM_ERROR("fail to  devm_request_irq, ret=%d!", ret);
 		return ret;
 	}
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
index 28778b15512a..3023620342ed 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
@@ -30,15 +30,344 @@
 
 
 #define DSS_CHN_MAX_DEFINE (DSS_COPYBIT_MAX)
+
 static int mid_array[DSS_CHN_MAX_DEFINE] = {0xb, 0xa, 0x9, 0x8, 0x7, 0x6, 0x5, 0x4, 0x2, 0x1, 0x3, 0x0};
 
+#if defined (CONFIG_HISI_FB_970)
+uint32_t g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX] = {
+	// D0
+	{
+	MIF_CH0_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH0_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH0_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH0,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH0_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD0_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_D0_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_D0_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_D0_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// D1
+	{
+	MIF_CH1_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH1_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH1_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH1,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH1_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD1_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_D1_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_D1_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_D1_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// V0
+	{
+	MIF_CH2_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH2_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH2_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH2,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH2_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD2_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_VG0_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_VG0_DFC_OFFSET,  //MODULE_DFC
+	DSS_RCH_VG0_SCL_OFFSET,  //MODULE_SCL
+	DSS_RCH_VG0_SCL_LUT_OFFSET,  //MODULE_SCL_LUT
+	DSS_RCH_VG0_ARSR_OFFSET,  //MODULE_ARSR2P
+	DSS_RCH_VG0_ARSR_LUT_OFFSET,  //MODULE_ARSR2P_LUT
+	DSS_RCH_VG0_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
+	DSS_RCH_VG0_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
+	DSS_RCH_VG0_PCSC_OFFSET,  //MODULE_PCSC
+	DSS_RCH_VG0_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// G0
+	{
+	MIF_CH3_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH3_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH3_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH3,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH3_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD3_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_G0_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_G0_DFC_OFFSET,  //MODULE_DFC
+	DSS_RCH_G0_SCL_OFFSET,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	DSS_RCH_G0_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
+	DSS_RCH_G0_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_G0_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// V1
+	{
+	MIF_CH4_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH4_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH4_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH4,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH4_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD4_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_VG1_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_VG1_DFC_OFFSET,  //MODULE_DFC
+	DSS_RCH_VG1_SCL_OFFSET,  //MODULE_SCL
+	DSS_RCH_VG1_SCL_LUT_OFFSET,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	DSS_RCH_VG1_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
+	DSS_RCH_VG1_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_VG1_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// G1
+	{
+	MIF_CH5_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH5_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH5_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH5,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH5_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD5_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_G1_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_G1_DFC_OFFSET,  //MODULE_DFC
+	DSS_RCH_G1_SCL_OFFSET,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	DSS_RCH_G1_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
+	DSS_RCH_G1_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_G1_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// D2
+	{
+	MIF_CH6_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH6_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH6_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH6,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH6_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD6_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_D2_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_D2_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_D2_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// D3
+	{
+	MIF_CH7_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH7_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH7_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH7,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH7_STARTY,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD7_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_D3_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_D3_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_D3_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// W0
+	{
+	MIF_CH8_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH8_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH8_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_WCH0,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH0_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH0_OV_IEN,  //MODULE_MCTL_CHN_OV_OEN
+	0,  //MODULE_MCTL_CHN_STARTY
+	0,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_WCH0_DMA_OFFSET,  //MODULE_DMA
+	DSS_WCH0_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_WCH0_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// W1
+	{
+	MIF_CH9_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH9_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH9_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_WCH1,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH1_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH1_OV_IEN,  //MODULE_MCTL_CHN_OV_OEN
+	0,  //MODULE_MCTL_CHN_STARTY
+	0,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_WCH1_DMA_OFFSET,  //MODULE_DMA
+	DSS_WCH1_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_WCH1_CSC_OFFSET,  //MODULE_CSC
+	},
+
+	// V2
+	{
+	MIF_CH10_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH11_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH11_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_RCH8,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH8_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	DSS_MCTRL_SYS_OFFSET + MCTL_RCH8_OV_OEN,  //MODULE_MCTL_CHN_OV_OEN
+	0,  //MODULE_MCTL_CHN_STARTY
+	DSS_MCTRL_SYS_OFFSET + MCTL_MOD8_DBG,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_RCH_VG2_DMA_OFFSET,  //MODULE_DMA
+	DSS_RCH_VG2_DFC_OFFSET,  //MODULE_DFC
+	DSS_RCH_VG2_SCL_OFFSET,  //MODULE_SCL
+	DSS_RCH_VG2_SCL_LUT_OFFSET,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	DSS_RCH_VG2_POST_CLIP_OFFSET_ES,  //MODULE_POST_CLIP_ES
+	DSS_RCH_VG2_POST_CLIP_OFFSET,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_RCH_VG2_CSC_OFFSET,  //MODULE_CSC
+	},
+	// W2
+	{
+	MIF_CH11_OFFSET,   //MODULE_MIF_CHN
+	AIF0_CH12_OFFSET,  //MODULE_AIF0_CHN
+	AIF1_CH12_OFFSET,  //MODULE_AIF1_CHN
+	MCTL_CTL_MUTEX_WCH2,  //MODULE_MCTL_CHN_MUTEX
+	DSS_MCTRL_SYS_OFFSET + MCTL_WCH2_FLUSH_EN,  //MODULE_MCTL_CHN_FLUSH_EN
+	0,  //MODULE_MCTL_CHN_OV_OEN
+	0,  //MODULE_MCTL_CHN_STARTY
+	0,  //MODULE_MCTL_CHN_MOD_DBG
+	DSS_WCH2_DMA_OFFSET,  //MODULE_DMA
+	DSS_WCH2_DFC_OFFSET,  //MODULE_DFC
+	0,  //MODULE_SCL
+	0,  //MODULE_SCL_LUT
+	0,  //MODULE_ARSR2P
+	0,  //MODULE_ARSR2P_LUT
+	0, //MODULE_POST_CLIP_ES
+	0,  //MODULE_POST_CLIP
+	0,  //MODULE_PCSC
+	DSS_WCH2_CSC_OFFSET,  //MODULE_CSC
+	},
+};
+
+uint32_t g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX] = {
+	{DSS_OVL0_OFFSET,
+	DSS_MCTRL_CTL0_OFFSET},
+
+	{DSS_OVL1_OFFSET,
+	DSS_MCTRL_CTL1_OFFSET},
+
+	{DSS_OVL2_OFFSET,
+	DSS_MCTRL_CTL2_OFFSET},
+
+	{DSS_OVL3_OFFSET,
+	DSS_MCTRL_CTL3_OFFSET},
+
+	{0,
+	DSS_MCTRL_CTL4_OFFSET},
+
+	{0,
+	DSS_MCTRL_CTL5_OFFSET},
+};
+
+//SCF_LUT_CHN coef_idx
+int g_scf_lut_chn_coef_idx[DSS_CHN_MAX_DEFINE] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
+
+uint32_t g_dss_module_cap[DSS_CHN_MAX_DEFINE][MODULE_CAP_MAX] = {
+	/* D2 */
+	{0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1},
+	/* D3 */
+	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
+	/* V0 */
+	{0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1},
+	/* G0 */
+	{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
+	/* V1 */
+	{0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1},
+	/* G1 */
+	{0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
+	/* D0 */
+	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
+	/* D1 */
+	{0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1},
+
+	/* W0 */
+	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
+	/* W1 */
+	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
+
+	/* V2 */
+	{0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1},
+	/* W2 */
+	{1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1},
+};
+
+/* number of smrx idx for each channel */
+uint32_t g_dss_chn_sid_num[DSS_CHN_MAX_DEFINE] = {
+    4, 1, 4, 4, 4, 4, 1, 1, 3, 4, 3, 3
+};
+
+/* start idx of each channel */
+/* smrx_idx = g_dss_smmu_smrx_idx[chn_idx] + (0 ~ g_dss_chn_sid_num[chn_idx]) */
+uint32_t g_dss_smmu_smrx_idx[DSS_CHN_MAX_DEFINE] = {
+    0, 4, 5, 9, 13, 17, 21, 22, 26, 29, 23, 36
+};
+#else
 /*
 ** dss_chn_idx
 ** DSS_RCHN_D2 = 0,	DSS_RCHN_D3,	DSS_RCHN_V0,	DSS_RCHN_G0,	DSS_RCHN_V1,
 ** DSS_RCHN_G1,	DSS_RCHN_D0,	DSS_RCHN_D1,	DSS_WCHN_W0,	DSS_WCHN_W1,
 ** DSS_RCHN_V2,   DSS_WCHN_W2,
 */
-/*lint -e785*/
 u32 g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX] = {
 	/* D0 */
 	{
@@ -291,7 +620,6 @@ u32 g_dss_module_base[DSS_CHN_MAX_DEFINE][MODULE_CHN_MAX] = {
 	},
 };
 
-/*lint +e785*/
 u32 g_dss_module_ovl_base[DSS_MCTL_IDX_MAX][MODULE_OVL_MAX] = {
 	{DSS_OVL0_OFFSET,
 	DSS_MCTRL_CTL0_OFFSET},
@@ -357,7 +685,7 @@ u32 g_dss_smmu_smrx_idx[DSS_CHN_MAX_DEFINE] = {
 u32 g_dss_mif_sid_map[DSS_CHN_MAX] = {
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 };
-
+#endif
 static int hisi_pixel_format_hal2dma(int format)
 {
 	int ret = 0;
@@ -555,10 +883,12 @@ static int hisi_dss_smmu_config(struct dss_hw_ctx *ctx, int chn_idx, bool mmu_en
 
 	for (i = 0; i < g_dss_chn_sid_num[chn_idx]; i++) {
 		idx = g_dss_smmu_smrx_idx[chn_idx] + i;
-		if (!mmu_enable)
+		if (!mmu_enable) {
 			set_reg(smmu_base + SMMU_SMRx_NS + idx * 0x4, 1, 32, 0);
-		else
-			set_reg(smmu_base + SMMU_SMRx_NS + idx * 0x4, 0x70, 32, 0);
+		} else {
+			//set_reg(smmu_base + SMMU_SMRx_NS + idx * 0x4, 0x70, 32, 0);
+			set_reg(smmu_base + SMMU_SMRx_NS + idx * 0x4, 0x1C, 32, 0);
+		}
 	}
 
 	return 0;
@@ -668,7 +998,11 @@ static int hisi_dss_mctl_sys_config(struct dss_hw_ctx *ctx, int chn_idx)
 	set_reg(mctl_sys_base + mctl_rch_ov_oen_offset,
 		((1 << (layer_idx + 1)) | (0x100 << DSS_OVL0)), 32, 0);
 
-	set_reg(mctl_sys_base + MCTL_RCH_OV0_SEL, 0x8, 4, 0);
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		set_reg(mctl_sys_base + MCTL_RCH_OV0_SEL, 0xe, 4, 0);
+	} else {
+		set_reg(mctl_sys_base + MCTL_RCH_OV0_SEL, 0x8, 4, 0);
+	}
 
 	set_reg(mctl_sys_base + MCTL_RCH_OV0_SEL, chn_idx, 4, (layer_idx + 1) * 4);
 
@@ -805,8 +1139,10 @@ static int hisi_dss_rdma_config(struct dss_hw_ctx *ctx,
 		set_reg(rdma_base + DMA_OFT_Y0, rdma_oft_y0, 16, 0);
 		set_reg(rdma_base + DMA_OFT_X1, rdma_oft_x1, 12, 0);
 		set_reg(rdma_base + DMA_OFT_Y1, rdma_oft_y1, 16, 0);
-		set_reg(rdma_base + DMA_CTRL, rdma_format, 5, 3);
-		set_reg(rdma_base + DMA_CTRL, (mmu_enable ? 0x1 : 0x0), 1, 8);
+		//set_reg(rdma_base + DMA_CTRL, rdma_format, 5, 3);
+		//set_reg(rdma_base + DMA_CTRL, (mmu_enable ? 0x1 : 0x0), 1, 8);
+		set_reg(rdma_base + DMA_CTRL, 0x130, 32, 0);
+		//set_reg(rdma_base + DMA_CTRL, (mmu_enable ? 0x1 : 0x0), 1, 8);
 		set_reg(rdma_base + DMA_STRETCH_SIZE_VRT, stretch_size_vrt, 32, 0);
 		set_reg(rdma_base + DMA_DATA_ADDR0, display_addr, 32, 0);
 		set_reg(rdma_base + DMA_STRIDE0, rdma_stride, 13, 0);
@@ -866,32 +1202,54 @@ int hisi_dss_ovl_base_config(struct dss_hw_ctx *ctx, u32 xres, u32 yres)
 		return -1;
 	}
 
+	DRM_INFO("+. \n");
 	mctl_sys_base = ctx->base + DSS_MCTRL_SYS_OFFSET;
 	mctl_base = ctx->base +
 		g_dss_module_ovl_base[DSS_OVL0][MODULE_MCTL_BASE];
 	ovl0_base = ctx->base +
 		g_dss_module_ovl_base[DSS_OVL0][MODULE_OVL_BASE];
 
-	set_reg(ovl0_base + OVL6_REG_DEFAULT, 0x1, 32, 0);
-	set_reg(ovl0_base + OVL6_REG_DEFAULT, 0x0, 32, 0);
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		set_reg(ovl0_base + OV8_REG_DEFAULT, 0x1, 32, 0);
+		set_reg(ovl0_base + OV8_REG_DEFAULT, 0x0, 32, 0);
+		set_reg(ovl0_base + OVL_SIZE, (xres - 1) |
+			((yres - 1) << 16), 32, 0);
 
-	set_reg(ovl0_base + OVL_SIZE, (xres - 1) | ((yres - 1) << 16), 32, 0);
 #ifdef CONFIG_HISI_FB_OV_BASE_USED
-	set_reg(ovl0_base + OVL_BG_COLOR, 0xFFFF0000, 32, 0);
+		DRM_INFO("CONFIG_HISI_FB_OV_BASE_USED !!. \n");
+		set_reg(ovl0_base + OV_BG_COLOR_RGB, 0x3FF00000, 32, 0);
+		set_reg(ovl0_base + OV_BG_COLOR_A, 0x3FF, 32, 0);
 #else
-	set_reg(ovl0_base + OVL_BG_COLOR, 0xFF000000, 32, 0);
+		set_reg(ovl0_base + OV_BG_COLOR_RGB, 0x00000000, 32, 0);
+		set_reg(ovl0_base + OV_BG_COLOR_A, 0x00000000, 32, 0);
 #endif
-	set_reg(ovl0_base + OVL_DST_STARTPOS, 0x0, 32, 0);
-	set_reg(ovl0_base + OVL_DST_ENDPOS, (xres - 1) | ((yres - 1) << 16), 32, 0);
-	set_reg(ovl0_base + OVL_GCFG, 0x10001, 32, 0);
+		set_reg(ovl0_base + OV_DST_STARTPOS, 0x0, 32, 0);
+		set_reg(ovl0_base + OV_DST_ENDPOS, (xres - 1) |
+			((yres - 1) << 16), 32, 0);
+		set_reg(ovl0_base + OV_GCFG, 0x10001, 32, 0);
+		set_reg(mctl_sys_base + MCTL_RCH_OV0_SEL, 0xE, 4, 0);
+	} else {
+		set_reg(ovl0_base + OVL6_REG_DEFAULT, 0x1, 32, 0);
+		set_reg(ovl0_base + OVL6_REG_DEFAULT, 0x0, 32, 0);
+		set_reg(ovl0_base + OVL_SIZE, (xres - 1) | ((yres - 1) << 16), 32, 0);
+#ifdef CONFIG_HISI_FB_OV_BASE_USED
+		set_reg(ovl0_base + OVL_BG_COLOR, 0xFFFF0000, 32, 0);
+#else
+		set_reg(ovl0_base + OVL_BG_COLOR, 0xFF000000, 32, 0);
+#endif
+		set_reg(ovl0_base + OVL_DST_STARTPOS, 0x0, 32, 0);
+		set_reg(ovl0_base + OVL_DST_ENDPOS, (xres - 1) | ((yres - 1) << 16), 32, 0);
+		set_reg(ovl0_base + OVL_GCFG, 0x10001, 32, 0);
+		set_reg(mctl_sys_base + MCTL_RCH_OV0_SEL, 0x8, 4, 0);
+	}
 
 	set_reg(mctl_base + MCTL_CTL_MUTEX_ITF, 0x1, 32, 0);
 	set_reg(mctl_base + MCTL_CTL_MUTEX_DBUF, 0x1, 2, 0);
 	set_reg(mctl_base + MCTL_CTL_MUTEX_OV, 1 << DSS_OVL0, 4, 0);
-
-	set_reg(mctl_sys_base + MCTL_RCH_OV0_SEL, 0x8, 4, 0);
 	set_reg(mctl_sys_base + MCTL_OV0_FLUSH_EN, 0xd, 4, 0);
 
+	DRM_INFO("-. \n");
+
 	return 0;
 }
 
@@ -908,21 +1266,43 @@ static int hisi_dss_ovl_config(struct dss_hw_ctx *ctx,
 	ovl0_base = ctx->base +
 		g_dss_module_ovl_base[DSS_OVL0][MODULE_OVL_BASE];
 
-	set_reg(ovl0_base + OVL6_REG_DEFAULT, 0x1, 32, 0);
-	set_reg(ovl0_base + OVL6_REG_DEFAULT, 0x0, 32, 0);
-	set_reg(ovl0_base + OVL_SIZE, (xres - 1) |
-		((yres - 1) << 16), 32, 0);
-	set_reg(ovl0_base + OVL_BG_COLOR, 0xFF000000, 32, 0);
-	set_reg(ovl0_base + OVL_DST_STARTPOS, 0x0, 32, 0);
-	set_reg(ovl0_base + OVL_DST_ENDPOS, (xres - 1) |
-		((yres - 1) << 16), 32, 0);
-	set_reg(ovl0_base + OVL_GCFG, 0x10001, 32, 0);
-	set_reg(ovl0_base + OVL_LAYER0_POS, (rect->left) |
-		((rect->top) << 16), 32, 0);
-	set_reg(ovl0_base + OVL_LAYER0_SIZE, (rect->right) |
-		((rect->bottom) << 16), 32, 0);
-	set_reg(ovl0_base + OVL_LAYER0_ALPHA, 0x00ff40ff, 32, 0);
-	set_reg(ovl0_base + OVL_LAYER0_CFG, 0x1, 1, 0);
+	if (ctx->g_dss_version_tag == FB_ACCEL_KIRIN970) {
+		set_reg(ovl0_base + OV8_REG_DEFAULT, 0x1, 32, 0);
+		set_reg(ovl0_base + OV8_REG_DEFAULT, 0x0, 32, 0);
+		set_reg(ovl0_base + OVL_SIZE, (xres - 1) |
+			((yres - 1) << 16), 32, 0);
+		set_reg(ovl0_base + OV_BG_COLOR_RGB, 0x3FF00000, 32, 0);
+		set_reg(ovl0_base + OV_BG_COLOR_A, 0x3ff, 32, 0);
+
+		set_reg(ovl0_base + OV_DST_STARTPOS, 0x0, 32, 0);
+		set_reg(ovl0_base + OV_DST_ENDPOS, (xres - 1) |
+			((yres - 1) << 16), 32, 0);
+		set_reg(ovl0_base + OV_GCFG, 0x10001, 32, 0);
+		set_reg(ovl0_base + OV_LAYER0_POS, (rect->left) |
+			((rect->top) << 16), 32, 0);
+		set_reg(ovl0_base + OV_LAYER0_SIZE, (rect->right) |
+			((rect->bottom) << 16), 32, 0);
+		set_reg(ovl0_base + OV_LAYER0_ALPHA_MODE, 0x1004000, 32, 0);///NEED CHECK??
+		//set_reg(ovl0_base + OV_LAYER0_ALPHA_A, 0x3fc03fc, 32, 0);
+		set_reg(ovl0_base + OV_LAYER0_ALPHA_A, 0x3ff03ff, 32, 0);
+		set_reg(ovl0_base + OV_LAYER0_CFG, 0x1, 1, 0);
+	} else {
+		set_reg(ovl0_base + OVL6_REG_DEFAULT, 0x1, 32, 0);
+		set_reg(ovl0_base + OVL6_REG_DEFAULT, 0x0, 32, 0);
+		set_reg(ovl0_base + OVL_SIZE, (xres - 1) |
+			((yres - 1) << 16), 32, 0);
+		set_reg(ovl0_base + OVL_BG_COLOR, 0xFFFF0000, 32, 0);
+		set_reg(ovl0_base + OVL_DST_STARTPOS, 0x0, 32, 0);
+		set_reg(ovl0_base + OVL_DST_ENDPOS, (xres - 1) |
+			((yres - 1) << 16), 32, 0);
+		set_reg(ovl0_base + OVL_GCFG, 0x10001, 32, 0);
+		set_reg(ovl0_base + OVL_LAYER0_POS, (rect->left) |
+			((rect->top) << 16), 32, 0);
+		set_reg(ovl0_base + OVL_LAYER0_SIZE, (rect->right) |
+			((rect->bottom) << 16), 32, 0);
+		set_reg(ovl0_base + OVL_LAYER0_ALPHA, 0x00ff40ff, 32, 0);
+		set_reg(ovl0_base + OVL_LAYER0_CFG, 0x1, 1, 0);
+	}
 
 	return 0;
 }
@@ -978,13 +1358,18 @@ void hisi_dss_smmu_on(struct dss_hw_ctx *ctx)
 	void __iomem *smmu_base;
 	struct iommu_domain_data *domain_data = NULL;
 	uint32_t phy_pgd_base = 0;
+	uint64_t fama_phy_pgd_base;
+	uint32_t fama_ptw_msb;
 
+	DRM_INFO("+. \n");
 	if (!ctx) {
 		DRM_ERROR("ctx is NULL!\n");
 		return;
 	}
 
+	DRM_INFO("ctx->base = 0x%x \n", ctx->base);
 	smmu_base = ctx->base + DSS_SMMU_OFFSET;
+	DRM_INFO("smmu_base = 0x%x \n", smmu_base);
 
 	set_reg(smmu_base + SMMU_SCR, 0x0, 1, 0);  /*global bypass cancel*/
 	set_reg(smmu_base + SMMU_SCR, 0x1, 8, 20); /*ptw_mid*/
@@ -1009,8 +1394,12 @@ void hisi_dss_smmu_on(struct dss_hw_ctx *ctx)
 
 	/*TTBR0*/
 	domain_data = (struct iommu_domain_data *)(ctx->mmu_domain->priv);
+	fama_phy_pgd_base = domain_data->phy_pgd_base;
 	phy_pgd_base = (uint32_t)(domain_data->phy_pgd_base);
+	DRM_DEBUG("fama_phy_pgd_base = %llu, phy_pgd_base =0x%x \n", fama_phy_pgd_base, phy_pgd_base);
 	set_reg(smmu_base + SMMU_CB_TTBR0, phy_pgd_base, 32, 0);
+
+	DRM_INFO("-. \n");
 }
 
 void hisifb_dss_on(struct dss_hw_ctx *ctx)
@@ -1105,8 +1494,12 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	struct dss_crtc *acrtc = aplane->acrtc;
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 
+#ifndef CMA_BUFFER_USED
 	struct kirin_drm_private *priv = plane->dev->dev_private;
 	struct kirin_fbdev *fbdev = to_kirin_fbdev(priv->fbdev);
+#else
+	struct drm_gem_cma_object *obj = drm_fb_cma_get_gem_obj(state->fb, 0);
+#endif
 
 	bool afbcd = false;
 	bool mmu_enable = true;
@@ -1116,6 +1509,7 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	u32 display_addr = 0;
 	u32 hal_fmt;
 	int chn_idx = DSS_RCHN_D2;
+	char filename[256] = {0};
 
 	int crtc_x = state->crtc_x;
 	int crtc_y = state->crtc_y;
@@ -1134,16 +1528,24 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	bpp = fb->bits_per_pixel / 8;
 	stride = fb->pitches[0];
 
+#if defined(CONFIG_HISI_FB_LDI_COLORBAR_USED) || defined(CONFIG_HISI_FB_DPP_COLORBAR_USED) || defined(CONFIG_HISI_FB_OV_BASE_USED)
+	return;
+#endif
+
+#ifndef CMA_BUFFER_USED
 	if (fbdev)
 		display_addr = (u32)fbdev->smem_start + src_y * stride;
 	else
-		printk("JDB: fbdev is null?\n");
+		DRM_ERROR("fbdev is null? \n");
+#else
+	display_addr = (u32)obj->paddr + src_y * stride;
+#endif
 
 	rect.left = 0;
 	rect.right = src_w - 1;
 	rect.top = 0;
 	rect.bottom = src_h - 1;
-	hal_fmt = dss_get_format(fb->pixel_format);
+	hal_fmt = HISI_FB_PIXEL_FORMAT_BGRA_8888;//dss_get_format(fb->pixel_format);
 
 	DRM_DEBUG("channel%d: src:(%d,%d, %dx%d) crtc:(%d,%d, %dx%d), rect(%d,%d,%d,%d),"
 		"fb:%dx%d, pixel_format=%d, stride=%d, paddr=0x%x, bpp=%d, bits_per_pixel=%d.\n",
@@ -1178,7 +1580,7 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	hisi_dss_wait_for_complete(ctx);
 }
 
-void hisi_dss_online_play(struct drm_plane *plane, drm_dss_layer_t *layer)
+void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane, drm_dss_layer_t *layer)
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_display_mode *mode;
@@ -1207,14 +1609,21 @@ void hisi_dss_online_play(struct drm_plane *plane, drm_dss_layer_t *layer)
 
 	bpp = layer->img.bpp;
 	stride = layer->img.stride;
+
 	display_addr = layer->img.vir_addr;
-	hal_fmt = layer->img.format;
+	hal_fmt = HISI_FB_PIXEL_FORMAT_RGBA_8888;//layer->img.format;
 
 	rect.left = 0;
 	rect.right = src_w - 1;
 	rect.top = 0;
 	rect.bottom = src_h - 1;
 
+	DRM_DEBUG("channel%d: src:(%dx%d) rect(%d,%d,%d,%d),"
+		"pixel_format=%d, stride=%d, paddr=0x%x, bpp=%d.\n",
+		chn_idx, src_w, src_h,
+		rect.left, rect.top, rect.right, rect.bottom,
+		hal_fmt, stride, display_addr, bpp);
+
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
 	hsw = mode->hsync_end - mode->hsync_start;
@@ -1229,7 +1638,7 @@ void hisi_dss_online_play(struct drm_plane *plane, drm_dss_layer_t *layer)
 
 	hisi_dss_rdma_config(ctx, &rect, display_addr, hal_fmt, bpp, chn_idx, afbcd, mmu_enable);
 	hisi_dss_rdfc_config(ctx, &rect, hal_fmt, bpp, chn_idx);
-	hisi_dss_ovl_config(ctx, &rect, mode->hdisplay, mode->vdisplay);
+	hisi_dss_ovl_config(ctx, &rect, src_w, src_h);
 
 	hisi_dss_mctl_ov_config(ctx, chn_idx);
 	hisi_dss_mctl_sys_config(ctx, chn_idx);
diff --git a/drivers/staging/hikey9xx/gpu/kirin_fb.c b/drivers/staging/hikey9xx/gpu/kirin_fb.c
index 834c9a381a4a..1cb84278f507 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_fb.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_fb.c
@@ -83,7 +83,7 @@ struct drm_framebuffer *kirin_framebuffer_init(struct drm_device *dev,
 		goto fail;
 	}
 
-	DRM_DEBUG("create: FB ID: %d (%p)", fb->base.id, fb);
+	DRM_DEBUG("create: FB ID: %d (%p) \n", fb->base.id, fb);
 
 	return fb;
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin_fb_panel.h b/drivers/staging/hikey9xx/gpu/kirin_fb_panel.h
new file mode 100644
index 000000000000..d5be79490b03
--- /dev/null
+++ b/drivers/staging/hikey9xx/gpu/kirin_fb_panel.h
@@ -0,0 +1,197 @@
+/* Copyright (c) 2013-2014, Hisilicon Tech. Co., Ltd. All rights reserved.
+*
+* This program is free software; you can redistribute it and/or modify
+* it under the terms of the GNU General Public License version 2 and
+* only version 2 as published by the Free Software Foundation.
+*
+* This program is distributed in the hope that it will be useful,
+* but WITHOUT ANY WARRANTY; without even the implied warranty of
+* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
+* GNU General Public License for more details.
+*
+*/
+#ifndef KIRIN_FB_PANEL_H
+#define KIRIN_FB_PANEL_H
+
+/* dts initial */
+#define DTS_FB_RESOURCE_INIT_READY	BIT(0)
+#define DTS_PWM_READY	BIT(1)
+/* #define DTS_BLPWM_READY	BIT(2) */
+#define DTS_SPI_READY	BIT(3)
+#define DTS_PANEL_PRIMARY_READY	BIT(4)
+#define DTS_PANEL_EXTERNAL_READY	BIT(5)
+#define DTS_PANEL_OFFLINECOMPOSER_READY	BIT(6)
+#define DTS_PANEL_WRITEBACK_READY	BIT(7)
+#define DTS_PANEL_MEDIACOMMON_READY	 BIT(8)
+
+/* device name */
+#define DEV_NAME_DSS_DPE		"dss_dpe"
+#define DEV_NAME_SPI			"spi_dev0"
+#define DEV_NAME_HDMI			"hdmi"
+#define DEV_NAME_DP				"dp"
+#define DEV_NAME_MIPI2RGB		"mipi2rgb"
+#define DEV_NAME_RGB2MIPI		"rgb2mipi"
+#define DEV_NAME_MIPIDSI		"mipi_dsi"
+#define DEV_NAME_FB				"hisi_fb"
+#define DEV_NAME_PWM			"hisi_pwm"
+#define DEV_NAME_BLPWM			"hisi_blpwm"
+#define DEV_NAME_LCD_BKL		"lcd_backlight0"
+
+/* vcc name */
+#define REGULATOR_PDP_NAME	"regulator_dsssubsys"
+#define REGULATOR_MMBUF	"regulator_mmbuf"
+#define REGULATOR_MEDIA_NAME  "regulator_media_subsys"
+
+
+/* irq name */
+#define IRQ_PDP_NAME	"irq_pdp"
+#define IRQ_SDP_NAME	"irq_sdp"
+#define IRQ_ADP_NAME	"irq_adp"
+#define IRQ_MDC_NAME	"irq_mdc"
+#define IRQ_DSI0_NAME	"irq_dsi0"
+#define IRQ_DSI1_NAME	"irq_dsi1"
+
+/* dts compatible */
+#define DTS_COMP_FB_NAME	"hisilicon,hisifb"
+#define DTS_COMP_PWM_NAME	"hisilicon,hisipwm"
+#define DTS_COMP_BLPWM_NAME	"hisilicon,hisiblpwm"
+#define DTS_PATH_LOGO_BUFFER	"/reserved-memory/logo-buffer"
+
+/* lcd resource name */
+#define LCD_BL_TYPE_NAME	"lcd-bl-type"
+#define FPGA_FLAG_NAME "fpga_flag"
+#define LCD_DISPLAY_TYPE_NAME	"lcd-display-type"
+#define LCD_IFBC_TYPE_NAME	"lcd-ifbc-type"
+
+/* backlight type */
+#define BL_SET_BY_NONE	BIT(0)
+#define BL_SET_BY_PWM	BIT(1)
+#define BL_SET_BY_BLPWM	BIT(2)
+#define BL_SET_BY_MIPI	BIT(3)
+#define BL_SET_BY_SH_BLPWM	BIT(4)
+
+/* supported display effect type */
+#define COMFORM_MODE			BIT(0)
+#define ACM_COLOR_ENHANCE_MODE	BIT(1)
+#define IC_COLOR_ENHANCE_MODE	BIT(2)
+#define CINEMA_MODE				BIT(3)
+#define VR_MODE                     BIT(4)
+#define FPS_30_60_SENCE_MODE   BIT(5)
+#define LED_RG_COLOR_TEMP_MODE	BIT(16)
+#define GAMMA_MAP    BIT(19)
+
+#define LCD_BL_IC_NAME_MAX	(50)
+
+#define DEV_DSS_VOLTAGE_ID (20)
+
+enum MIPI_LP11_MODE {
+	MIPI_NORMAL_LP11 = 0,
+	MIPI_SHORT_LP11 = 1,
+	MIPI_DISABLE_LP11 = 2,
+};
+
+/* resource desc */
+struct resource_desc {
+	uint32_t flag;
+	char *name;
+	uint32_t *value;
+};
+
+/* dtype for vcc */
+enum {
+	DTYPE_VCC_GET,
+	DTYPE_VCC_PUT,
+	DTYPE_VCC_ENABLE,
+	DTYPE_VCC_DISABLE,
+	DTYPE_VCC_SET_VOLTAGE,
+};
+
+/* vcc desc */
+struct vcc_desc {
+	int dtype;
+	char *id;
+	struct regulator **regulator;
+	int min_uV;
+	int max_uV;
+	int waittype;
+	int wait;
+};
+
+/* pinctrl operation */
+enum {
+	DTYPE_PINCTRL_GET,
+	DTYPE_PINCTRL_STATE_GET,
+	DTYPE_PINCTRL_SET,
+	DTYPE_PINCTRL_PUT,
+};
+
+/* pinctrl state */
+enum {
+	DTYPE_PINCTRL_STATE_DEFAULT,
+	DTYPE_PINCTRL_STATE_IDLE,
+};
+
+/* pinctrl data */
+struct pinctrl_data {
+	struct pinctrl *p;
+	struct pinctrl_state *pinctrl_def;
+	struct pinctrl_state *pinctrl_idle;
+};
+struct pinctrl_cmd_desc {
+	int dtype;
+	struct pinctrl_data *pctrl_data;
+	int mode;
+};
+
+/* dtype for gpio */
+enum {
+	DTYPE_GPIO_REQUEST,
+	DTYPE_GPIO_FREE,
+	DTYPE_GPIO_INPUT,
+	DTYPE_GPIO_OUTPUT,
+};
+
+/* gpio desc */
+struct gpio_desc {
+	int dtype;
+	int waittype;
+	int wait;
+	char *label;
+	uint32_t *gpio;
+	int value;
+};
+
+enum bl_control_mode {
+	REG_ONLY_MODE = 1,
+	PWM_ONLY_MODE,
+	MUTI_THEN_RAMP_MODE,
+	RAMP_THEN_MUTI_MODE,
+	I2C_ONLY_MODE = 6,
+	BLPWM_AND_CABC_MODE,
+	COMMON_IC_MODE = 8,
+};
+
+/*******************************************************************************
+** FUNCTIONS PROTOTYPES
+*/
+#define MIPI_DPHY_NUM	(2)
+
+extern uint32_t g_dts_resouce_ready;
+
+int resource_cmds_tx(struct platform_device *pdev,
+	struct resource_desc *cmds, int cnt);
+int vcc_cmds_tx(struct platform_device *pdev, struct vcc_desc *cmds, int cnt);
+int pinctrl_cmds_tx(struct platform_device *pdev, struct pinctrl_cmd_desc *cmds, int cnt);
+int gpio_cmds_tx(struct gpio_desc *cmds, int cnt);
+extern struct spi_device *g_spi_dev;
+int spi_cmds_tx(struct spi_device *spi, struct spi_cmd_desc *cmds, int cnt);
+int hisi_pwm_set_backlight(struct backlight_device *bl, uint32_t bl_level);
+
+int hisi_pwm_off(void);
+int hisi_pwm_on(void);
+
+int hisi_lcd_backlight_on(struct drm_panel *p);
+int hisi_lcd_backlight_off(struct drm_panel *p);
+
+
+#endif /* KIRIN_FB_PANEL_H */
diff --git a/drivers/staging/hikey9xx/gpu/kirin_fbdev.c b/drivers/staging/hikey9xx/gpu/kirin_fbdev.c
index 424a4107db56..496196997f6b 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_fbdev.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_fbdev.c
@@ -22,7 +22,11 @@
 #include <linux/hisi/hisi_ion.h>
 
 #include "kirin_drm_drv.h"
+#if defined (CONFIG_HISI_FB_970)
+#include "kirin970_dpe_reg.h"
+#else
 #include "kirin_dpe_reg.h"
+#endif
 #include "kirin_drm_dpe_utils.h"
 
 #include "drm_crtc.h"
@@ -30,7 +34,7 @@
 
 //#define CONFIG_HISI_FB_HEAP_CARVEOUT_USED
 
-#define FBDEV_BUFFER_NUM 3
+#define FBDEV_BUFFER_NUM 2
 struct fb_dmabuf_export
 {
     __u32 fd;
@@ -110,6 +114,9 @@ unsigned long kirin_alloc_fb_buffer(struct kirin_fbdev *fbdev, int size)
 	fbdev->ion_client = client;
 	fbdev->ion_handle = handle;
 
+	DRM_INFO("fbdev->smem_start = 0x%x, fbdev->screen_base = 0x%x\n",
+		fbdev->smem_start, fbdev->screen_base);
+
 	return buf_addr;
 
 err_ion_get_addr:
@@ -157,11 +164,13 @@ static int kirin_fbdev_mmap(struct fb_info *info, struct vm_area_struct * vma)
 	addr = vma->vm_start;
 	offset = vma->vm_pgoff * PAGE_SIZE;
 	size = vma->vm_end - vma->vm_start;
-
+	DRM_INFO("addr = 0x%x, offset = %d, size = %d!\n", addr, offset, size);
 	if (size > info->fix.smem_len) {
 		DRM_ERROR("size=%lu is out of range(%u)!\n", size, info->fix.smem_len);
 		return -EFAULT;
 	}
+	DRM_INFO("fbdev->smem_start = 0x%x, fbdev->screen_base = 0x%x\n",
+		fbdev->smem_start, fbdev->screen_base);
 
 	for_each_sg(table->sgl, sg, table->nents, i) {
 		page = sg_page(sg);
@@ -184,10 +193,15 @@ static int kirin_fbdev_mmap(struct fb_info *info, struct vm_area_struct * vma)
 		}
 
 		addr += len;
-		if (addr >= vma->vm_end)
+		if (addr >= vma->vm_end) {
+			DRM_ERROR("addr = 0x%x!, vma->vm_end = 0x%x\n", addr, vma->vm_end);
+
 			return 0;
+		}
 	}
 
+	DRM_INFO("kirin_fbdev_mmap addr = 0x%x!\n", addr);
+
 	return 0;
 }
 
@@ -211,6 +225,7 @@ static int kirin_dmabuf_export(struct fb_info *info, void __user *argp)
 		if (dmabuf_export.fd < 0) {
 			DRM_ERROR("failed to ion_share!\n");
 		}
+		DRM_INFO("dmabuf_export.fd = %d.\n", dmabuf_export.fd);
 
 		ret = copy_to_user(argp, &dmabuf_export, sizeof(struct fb_dmabuf_export));
 		if (ret) {
@@ -228,12 +243,15 @@ static int kirin_dss_online_compose(struct fb_info *info, void __user *argp)
 	struct drm_fb_helper *helper;
 	struct kirin_drm_private *priv;
 	struct drm_plane *plane;
+	struct kirin_fbdev *fbdev;
 
 	struct drm_dss_layer layer;
 
 	helper = (struct drm_fb_helper *)info->par;
 	priv = helper->dev->dev_private;
-	plane =priv->crtc[0]->primary;
+	plane = priv->crtc[0]->primary;
+
+	fbdev = to_kirin_fbdev(helper);
 
 	ret = copy_from_user(&layer, argp, sizeof(struct drm_dss_layer));
 	if (ret) {
@@ -241,7 +259,7 @@ static int kirin_dss_online_compose(struct fb_info *info, void __user *argp)
 		return -EINVAL;
 	}
 
-	hisi_dss_online_play(plane, &layer);
+	hisi_dss_online_play(fbdev, plane, &layer);
 
 	return ret;
 }
@@ -324,7 +342,7 @@ static int kirin_fbdev_create(struct drm_fb_helper *helper,
 
 	/* allocate backing bo */
 	size = mode_cmd.pitches[0] * mode_cmd.height;
-	DRM_DEBUG("allocating %d bytes for fb %d", size, dev->primary->index);
+	DRM_DEBUG("allocating %d bytes for fb %d \n", size, dev->primary->index);
 
 	fb = kirin_framebuffer_init(dev, &mode_cmd);
 	if (IS_ERR(fb)) {
@@ -354,7 +372,7 @@ static int kirin_fbdev_create(struct drm_fb_helper *helper,
 		goto fail_unlock;
 	}
 
-	DRM_DEBUG("fbi=%p, dev=%p", fbi, dev);
+	DRM_DEBUG("fbi=%p, dev=%p \n", fbi, dev);
 
 	fbdev->fb = fb;
 	helper->fb = fb;
@@ -374,8 +392,8 @@ static int kirin_fbdev_create(struct drm_fb_helper *helper,
 	fbi->fix.smem_start = fbdev->smem_start;
 	fbi->fix.smem_len = fbdev->screen_size;
 
-	DRM_DEBUG("par=%p, %dx%d", fbi->par, fbi->var.xres, fbi->var.yres);
-	DRM_DEBUG("allocated %dx%d fb", fbdev->fb->width, fbdev->fb->height);
+	DRM_DEBUG("par=%p, %dx%d \n", fbi->par, fbi->var.xres, fbi->var.yres);
+	DRM_DEBUG("allocated %dx%d fb \n", fbdev->fb->width, fbdev->fb->height);
 
 	mutex_unlock(&dev->struct_mutex);
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin_pwm.c b/drivers/staging/hikey9xx/gpu/kirin_pwm.c
new file mode 100644
index 000000000000..3d25c48f0769
--- /dev/null
+++ b/drivers/staging/hikey9xx/gpu/kirin_pwm.c
@@ -0,0 +1,400 @@
+/* Copyright (c) 2013-2014, Hisilicon Tech. Co., Ltd. All rights reserved.
+*
+* This program is free software; you can redistribute it and/or modify
+* it under the terms of the GNU General Public License version 2 and
+* only version 2 as published by the Free Software Foundation.
+*
+* This program is distributed in the hope that it will be useful,
+* but WITHOUT ANY WARRANTY; without even the implied warranty of
+* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
+* GNU General Public License for more details.
+*
+*/
+#include <drm/drmP.h>
+#include <linux/clk.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/of_address.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+
+#include "drm_mipi_dsi.h"
+#include "kirin_drm_dpe_utils.h"
+#include "kirin_fb_panel.h"
+#include "dw_dsi_reg.h"
+
+/* default pwm clk */
+#define DEFAULT_PWM_CLK_RATE	(80 * 1000000L)
+
+static char __iomem *hisifd_pwm_base;
+static char __iomem *hisi_peri_crg_base;
+static struct clk *g_pwm_clk;
+static struct platform_device *g_pwm_pdev;
+static int g_pwm_on;
+
+static struct pinctrl_data pwmpctrl;
+
+static struct pinctrl_cmd_desc pwm_pinctrl_init_cmds[] = {
+	{DTYPE_PINCTRL_GET, &pwmpctrl, 0},
+	{DTYPE_PINCTRL_STATE_GET, &pwmpctrl, DTYPE_PINCTRL_STATE_DEFAULT},
+	{DTYPE_PINCTRL_STATE_GET, &pwmpctrl, DTYPE_PINCTRL_STATE_IDLE},
+};
+
+static struct pinctrl_cmd_desc pwm_pinctrl_normal_cmds[] = {
+	{DTYPE_PINCTRL_SET, &pwmpctrl, DTYPE_PINCTRL_STATE_DEFAULT},
+};
+
+static struct pinctrl_cmd_desc pwm_pinctrl_lowpower_cmds[] = {
+	{DTYPE_PINCTRL_SET, &pwmpctrl, DTYPE_PINCTRL_STATE_IDLE},
+};
+
+static struct pinctrl_cmd_desc pwm_pinctrl_finit_cmds[] = {
+	{DTYPE_PINCTRL_PUT, &pwmpctrl, 0},
+};
+
+#define PWM_LOCK_OFFSET	(0x0000)
+#define PWM_CTL_OFFSET	(0X0004)
+#define PWM_CFG_OFFSET	(0x0008)
+#define PWM_PR0_OFFSET	(0x0100)
+#define PWM_PR1_OFFSET	(0x0104)
+#define PWM_C0_MR_OFFSET	(0x0300)
+#define PWM_C0_MR0_OFFSET	(0x0304)
+
+#define PWM_OUT_PRECISION	(800)
+
+
+int pinctrl_cmds_tx(struct platform_device *pdev, struct pinctrl_cmd_desc *cmds, int cnt)
+{
+	int ret = 0;
+
+	int i = 0;
+	struct pinctrl_cmd_desc *cm = NULL;
+
+	cm = cmds;
+
+	for (i = 0; i < cnt; i++) {
+		if (cm == NULL) {
+			DRM_ERROR("cm is null! index=%d\n", i);
+			continue;
+		}
+
+		if (cm->dtype == DTYPE_PINCTRL_GET) {
+			if (NULL == pdev) {
+				DRM_ERROR("pdev is NULL");
+				return -EINVAL;
+			}
+			cm->pctrl_data->p = devm_pinctrl_get(&pdev->dev);
+			if (IS_ERR(cm->pctrl_data->p)) {
+				ret = -1;
+				DRM_ERROR("failed to get p, index=%d!\n", i);
+				goto err;
+			}
+		} else if (cm->dtype == DTYPE_PINCTRL_STATE_GET) {
+			if (cm->mode == DTYPE_PINCTRL_STATE_DEFAULT) {
+				cm->pctrl_data->pinctrl_def = pinctrl_lookup_state(cm->pctrl_data->p, PINCTRL_STATE_DEFAULT);
+				if (IS_ERR(cm->pctrl_data->pinctrl_def)) {
+					ret = -1;
+					DRM_ERROR("failed to get pinctrl_def, index=%d!\n", i);
+					goto err;
+				}
+			} else if (cm->mode == DTYPE_PINCTRL_STATE_IDLE) {
+				cm->pctrl_data->pinctrl_idle = pinctrl_lookup_state(cm->pctrl_data->p, PINCTRL_STATE_IDLE);
+				if (IS_ERR(cm->pctrl_data->pinctrl_idle)) {
+					ret = -1;
+					DRM_ERROR("failed to get pinctrl_idle, index=%d!\n", i);
+					goto err;
+				}
+			} else {
+				ret = -1;
+				DRM_ERROR("unknown pinctrl type to get!\n");
+				goto err;
+			}
+		} else if (cm->dtype == DTYPE_PINCTRL_SET) {
+			if (cm->mode == DTYPE_PINCTRL_STATE_DEFAULT) {
+				if (cm->pctrl_data->p && cm->pctrl_data->pinctrl_def) {
+					ret = pinctrl_select_state(cm->pctrl_data->p, cm->pctrl_data->pinctrl_def);
+					if (ret) {
+						DRM_ERROR("could not set this pin to default state!\n");
+						ret = -1;
+						goto err;
+					}
+				}
+			} else if (cm->mode == DTYPE_PINCTRL_STATE_IDLE) {
+				if (cm->pctrl_data->p && cm->pctrl_data->pinctrl_idle) {
+					ret = pinctrl_select_state(cm->pctrl_data->p, cm->pctrl_data->pinctrl_idle);
+					if (ret) {
+						DRM_ERROR("could not set this pin to idle state!\n");
+						ret = -1;
+						goto err;
+					}
+				}
+			} else {
+				ret = -1;
+				DRM_ERROR("unknown pinctrl type to set!\n");
+				goto err;
+			}
+		} else if (cm->dtype == DTYPE_PINCTRL_PUT) {
+			if (cm->pctrl_data->p)
+				pinctrl_put(cm->pctrl_data->p);
+		} else {
+			DRM_ERROR("not supported command type!\n");
+			ret = -1;
+			goto err;
+		}
+
+		cm++;
+	}
+
+	return 0;
+
+err:
+	return ret;
+}
+
+int hisi_pwm_set_backlight(struct backlight_device *bl, uint32_t bl_level)
+{
+	char __iomem *pwm_base = NULL;
+	uint32_t bl_max = bl->props.max_brightness;
+
+	pwm_base = hisifd_pwm_base;
+	if (!pwm_base) {
+		DRM_ERROR("pwm_base is null!\n");
+		return -EINVAL;
+	}
+
+	DRM_INFO("bl_level=%d.\n", bl_level);
+
+	if (bl_max < 1) {
+		DRM_ERROR("bl_max(%d) is out of range!!", bl_max);
+		return -EINVAL;
+	}
+
+	if (bl_level > bl_max) {
+		bl_level = bl_max;
+	}
+
+	bl_level = (bl_level * PWM_OUT_PRECISION) / bl_max;
+
+	outp32(pwm_base + PWM_LOCK_OFFSET, 0x1acce551);
+	outp32(pwm_base + PWM_CTL_OFFSET, 0x0);
+	outp32(pwm_base + PWM_CFG_OFFSET, 0x2);
+	outp32(pwm_base + PWM_PR0_OFFSET, 0x1);
+	outp32(pwm_base + PWM_PR1_OFFSET, 0x2);
+	outp32(pwm_base + PWM_CTL_OFFSET, 0x1);
+	outp32(pwm_base + PWM_C0_MR_OFFSET, (PWM_OUT_PRECISION - 1));
+	outp32(pwm_base + PWM_C0_MR0_OFFSET, bl_level);
+
+	return 0;
+}
+
+int hisi_pwm_on(void)
+{
+	struct clk *clk_tmp = NULL;
+	char __iomem *pwm_base = NULL;
+	char __iomem *peri_crg_base = NULL;
+	int ret = 0;
+
+	DRM_INFO(" +.\n");
+
+	peri_crg_base = hisi_peri_crg_base;
+	if (!peri_crg_base) {
+		DRM_ERROR("peri_crg_base is NULL");
+		return -EINVAL;
+	}
+
+	pwm_base = hisifd_pwm_base;
+	if (!pwm_base) {
+		DRM_ERROR("pwm_base is null!\n");
+		return -EINVAL;
+	}
+
+	if (g_pwm_on == 1)
+		return 0;
+
+	// dis-reset pwm
+	outp32(peri_crg_base + PERRSTDIS2, 0x1);
+
+	clk_tmp = g_pwm_clk;
+	if (clk_tmp) {
+		ret = clk_prepare(clk_tmp);
+		if (ret) {
+			DRM_ERROR("dss_pwm_clk clk_prepare failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+
+		ret = clk_enable(clk_tmp);
+		if (ret) {
+			DRM_ERROR("dss_pwm_clk clk_enable failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+
+		DRM_INFO("dss_pwm_clk clk_enable successed, ret=%d!\n", ret);
+	}
+
+	ret = pinctrl_cmds_tx(g_pwm_pdev, pwm_pinctrl_normal_cmds,
+		ARRAY_SIZE(pwm_pinctrl_normal_cmds));
+
+	//if enable PWM, please set IOMG_004 in IOC_AO module
+	//set IOMG_004: select PWM_OUT0
+
+	g_pwm_on = 1;
+
+	return ret;
+}
+
+int hisi_pwm_off(void)
+{
+	struct clk *clk_tmp = NULL;
+	char __iomem *pwm_base = NULL;
+	char __iomem *peri_crg_base = NULL;
+	int ret = 0;
+
+	peri_crg_base = hisi_peri_crg_base;
+	if (!peri_crg_base) {
+		DRM_ERROR("peri_crg_base is NULL");
+		return -EINVAL;
+	}
+
+	pwm_base = hisifd_pwm_base;
+	if (!pwm_base) {
+		DRM_ERROR("pwm_base is null!\n");
+		return -EINVAL;
+	}
+
+	if (g_pwm_on == 0)
+		return 0;
+
+	ret = pinctrl_cmds_tx(g_pwm_pdev, pwm_pinctrl_lowpower_cmds,
+		ARRAY_SIZE(pwm_pinctrl_lowpower_cmds));
+
+	clk_tmp = g_pwm_clk;
+	if (clk_tmp) {
+		clk_disable(clk_tmp);
+		clk_unprepare(clk_tmp);
+	}
+
+	//reset pwm
+	outp32(peri_crg_base + PERRSTEN2, 0x1);
+
+	g_pwm_on = 0;
+
+	return ret;
+}
+
+static int hisi_pwm_probe(struct platform_device *pdev)
+{
+	struct device_node *np = NULL;
+	int ret = 0;
+
+	if (NULL == pdev) {
+		DRM_ERROR("pdev is NULL");
+		return -EINVAL;
+	}
+
+	g_pwm_pdev = pdev;
+
+	np = of_find_compatible_node(NULL, NULL, DTS_COMP_PWM_NAME);
+	if (!np) {
+		DRM_ERROR("NOT FOUND device node %s!\n", DTS_COMP_PWM_NAME);
+		ret = -ENXIO;
+		goto err_return;
+	}
+
+	/* get pwm reg base */
+	hisifd_pwm_base = of_iomap(np, 0);
+	if (!hisifd_pwm_base) {
+		DRM_ERROR("failed to get pwm_base resource.\n");
+		return -ENXIO;
+	}
+
+	/* get peri_crg_base */
+	hisi_peri_crg_base = of_iomap(np, 1);
+	if (!hisi_peri_crg_base) {
+		DRM_ERROR("failed to get peri_crg_base resource.\n");
+		return -ENXIO;
+	}
+
+	/* pwm pinctrl init */
+	ret = pinctrl_cmds_tx(pdev, pwm_pinctrl_init_cmds,
+		ARRAY_SIZE(pwm_pinctrl_init_cmds));
+	if (ret != 0) {
+		DRM_ERROR("Init pwm pinctrl failed! ret=%d.\n", ret);
+		goto err_return;
+	}
+
+	/* get pwm clk resource */
+	g_pwm_clk = of_clk_get(np, 0);
+	if (IS_ERR(g_pwm_clk)) {
+		DRM_ERROR("%s clock not found: %d!\n",
+			np->name, (int)PTR_ERR(g_pwm_clk));
+		ret = -ENXIO;
+		goto err_return;
+	}
+
+	DRM_INFO("dss_pwm_clk:[%lu]->[%lu].\n",
+		DEFAULT_PWM_CLK_RATE, clk_get_rate(g_pwm_clk));
+
+	return 0;
+
+err_return:
+	return ret;
+}
+
+static int hisi_pwm_remove(struct platform_device *pdev)
+{
+	struct clk *clk_tmp = NULL;
+	int ret = 0;
+
+	ret = pinctrl_cmds_tx(pdev, pwm_pinctrl_finit_cmds,
+		ARRAY_SIZE(pwm_pinctrl_finit_cmds));
+
+	clk_tmp = g_pwm_clk;
+	if (clk_tmp) {
+		clk_put(clk_tmp);
+		clk_tmp = NULL;
+	}
+
+	return ret;
+}
+
+static const struct of_device_id hisi_pwm_match_table[] = {
+	{
+		.compatible = "hisilicon,hisipwm",
+		.data = NULL,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, hisi_pwm_match_table);
+
+static struct platform_driver this_driver = {
+	.probe = hisi_pwm_probe,
+	.remove = hisi_pwm_remove,
+	.suspend = NULL,
+	.resume = NULL,
+	.shutdown = NULL,
+	.driver = {
+		.name = DEV_NAME_PWM,
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(hisi_pwm_match_table),
+	},
+};
+
+static int __init hisi_pwm_init(void)
+{
+	int ret = 0;
+
+	ret = platform_driver_register(&this_driver);
+	if (ret) {
+		DRM_ERROR("platform_driver_register failed, error=%d!\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+module_init(hisi_pwm_init);
+
+MODULE_AUTHOR("cailiwei <cailiwei@hisilicon.com>");
+MODULE_AUTHOR("zhangxiubin <zhangxiubin1@huawei.com>");
+MODULE_DESCRIPTION("hisilicon Kirin SoCs' pwm driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
