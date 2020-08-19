Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA8249C17
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356C06E225;
	Wed, 19 Aug 2020 11:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D966E231
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5333722CAE;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=rcRxeiZB6ID7SoRVN/Gwq+PJ1x5pFNlMdS23+MInkuw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1ASwfiiqzwj7YQBOKYs+mHTJX9LtqjnFKR4ZKySgYLT6gmrEqC7AcLosA7gDhsMpM
 jZrdaSc6aRNLlvnEb0MZ9eut9Au3deURrl0kgLa/6aTaRcD93+fCzHF15QNdn/JMIr
 tzzQBMCkWgZBKwgUDjzMnBq2FadquJnAaZkyG8BU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00Euaz-BX; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 24/49] staging: hikey9xx/gpu: fix the DRM setting logic
Date: Wed, 19 Aug 2020 13:45:52 +0200
Message-Id: <32904d9c4a90d7c5153d936fc6bebc4190620587.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The logich which sets the MIPI parameters is currently wrong:
it is using a value stored at cur_client, with actually points
to the active location, and not to the one that it is about
to be initialized.

The entire logic sounds buggy, but for now let's just keep
following it, by adding an extra var that will tell what was
the latest attached encoder.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../hikey9xx/gpu/kirin9xx_dw_drm_dsi.c        | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
index ffc8b8e61062..39ec39a6a69b 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
@@ -241,7 +241,7 @@ struct dw_dsi {
 	unsigned long mode_flags;
 	struct gpio_desc *gpio_mux;
 	struct dw_dsi_client client[OUT_MAX];
-	enum dsi_output_client cur_client;
+	enum dsi_output_client cur_client, attached_client;
 	bool enable;
 };
 
@@ -330,13 +330,12 @@ EXPORT_SYMBOL(dsi_set_output_client);
 
 #if defined (CONFIG_DRM_HISI_KIRIN970)
 static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
-							struct mipi_phy_params *phy_ctrl)
+			      struct mipi_phy_params *phy_ctrl, u32 id)
 {
 	struct mipi_panel_info *mipi = NULL;
 	struct drm_display_mode *mode = NULL;
 	u32 dphy_req_kHz;
 	int bpp;
-	u32 id = 0;
 	u32 ui = 0;
 	u32 m_pll = 0;
 	u32 n_pll = 0;
@@ -364,7 +363,6 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 	WARN_ON(!phy_ctrl);
 	WARN_ON(!dsi);
 
-	id = dsi->cur_client;
 	mode = &dsi->cur_mode;
 	mipi = &dsi->mipi;
 
@@ -562,13 +560,12 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 }
 #else
 static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
-							struct mipi_phy_params *phy_ctrl)
+			     struct mipi_phy_params *phy_ctrl, u32 id)
 {
 	struct mipi_panel_info *mipi = NULL;
 	struct drm_display_mode *mode = NULL;
 	u32 dphy_req_kHz;
 	int bpp;
-	u32 id = 0;
 	u32 ui = 0;
 	u32 m_pll = 0;
 	u32 n_pll = 0;
@@ -602,7 +599,6 @@ static void get_dsi_phy_ctrl(struct dw_dsi *dsi,
 	WARN_ON(!phy_ctrl);
 	WARN_ON(!dsi);
 
-	id = dsi->cur_client;
 	mode = &dsi->cur_mode;
 	mipi = &dsi->mipi;
 
@@ -949,13 +945,15 @@ static void dsi_phy_tst_set(void __iomem *base, u32 reg, u32 val)
 	writel(0x00, base + MIPIDSI_PHY_TST_CTRL0_OFFSET);
 }
 
-static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
+static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi,
+					       char __iomem *mipi_dsi_base,
+					       u32 id)
 {
 	uint32_t i;
 	uint32_t addr = 0;
 	u32 lanes;
 
-	lanes =  dsi->client[dsi->cur_client].lanes - 1;
+	lanes =  dsi->client[id].lanes - 1;
 	for (i = 0; i <= (lanes + 1); i++) {
 		//Lane Transmission Property
 		addr = MIPIDSI_PHY_TST_LANE_TRANSMISSION_PROPERTY + (i << 5);
@@ -1027,13 +1025,13 @@ static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi, char __iomem
 	}
 }
 
-static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
+static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
+			  u32 id)
 {
 	u32 hline_time = 0;
 	u32 hsa_time = 0;
 	u32 hbp_time = 0;
 	u64 pixel_clk = 0;
-	u32 id = 0;
 	unsigned long dw_jiffies = 0;
 	u32 tmp = 0;
 	bool is_ready = false;
@@ -1048,8 +1046,6 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	WARN_ON(!dsi);
 	WARN_ON(!mipi_dsi_base);
 
-	id = dsi->cur_client;
-
 	DRM_INFO("dsi_mipi_init, id=%d\n", id);
 
 
@@ -1063,9 +1059,9 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	memset(&dsi->phy, 0, sizeof(struct mipi_phy_params));
 
 #if defined (CONFIG_DRM_HISI_KIRIN970)
-	get_dsi_dphy_ctrl(dsi, &dsi->phy);
+	get_dsi_dphy_ctrl(dsi, &dsi->phy, id);
 #else
-	get_dsi_phy_ctrl(dsi, &dsi->phy);
+	get_dsi_phy_ctrl(dsi, &dsi->phy, id);
 #endif
 
 	rect.x = 0;
@@ -1113,7 +1109,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	dsi_phy_tst_set(mipi_dsi_base, 0x004B, 0x1);
 
 	//set dphy spec parameter
-	mipi_config_dphy_spec1v2_parameter(dsi, mipi_dsi_base);
+	mipi_config_dphy_spec1v2_parameter(dsi, mipi_dsi_base, id);
 #else
 	/* physical configuration PLL I*/
 	dsi_phy_tst_set(mipi_dsi_base, 0x14,
@@ -1363,12 +1359,13 @@ static void dsi_encoder_disable(struct drm_encoder *encoder)
 	dsi->enable = false;
 }
 
-static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
+static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base,
+			    u32 id)
 {
 	WARN_ON(!mipi_dsi_base);
 
 	/* mipi init */
-	dsi_mipi_init(dsi, mipi_dsi_base);
+	dsi_mipi_init(dsi, mipi_dsi_base, id);
 
 	/* dsi memory init */
 #if defined (CONFIG_DRM_HISI_KIRIN970)
@@ -1443,7 +1440,7 @@ static void dsi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
-	mipi_dsi_on_sub1(dsi, ctx->base);
+	mipi_dsi_on_sub1(dsi, ctx->base, dsi->attached_client);
 
 	mipi_dsi_on_sub2(dsi, ctx->base);
 
@@ -1550,6 +1547,8 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->client[id].mode_flags = mdsi->mode_flags;
 	dsi->client[id].phy_clock = 0;
 
+	dsi->attached_client = id;
+
 	DRM_INFO("host attach, client name=[%s], id=%d\n", mdsi->name, id);
 
 	return 0;
@@ -1959,6 +1958,7 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 
 	/* set dsi default output to panel */
 	dsi->cur_client = OUT_PANEL;
+	dsi->attached_client = dsi->cur_client;
 
 	DRM_INFO("dsi  cur_client is %d  <0->hdmi;1->panel> \n", dsi->cur_client);
 	/*dis-reset*/
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
