Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289E7249C48
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF6C6E22B;
	Wed, 19 Aug 2020 11:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868AD89C19
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6F43208DB;
 Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837581;
 bh=27YoqCzmydSp3olHMeOrDUwXFIPAGPfc/YzDgqMVKcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZR0vqHwSatPDbmsultS+4AMQG13FkHDGbAJ4B0IKKNzKTW2AMYZT6TPEhBErPajF+
 hqAx06gxT6fGMrrsa0HT9BrFRm5dyCcTICuhRAXxHAGNoBElaXw90oUKz4YC4Q+VUT
 Gl6G7kjglDW1Q98z/8Z1b360HcUuhYasx+bIPNMM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXr-00EuaH-LM; Wed, 19 Aug 2020 13:46:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 08/49] staging: hikey9xx/gpu: Support MIPI DSI 3 lanes for
 hikey970.
Date: Wed, 19 Aug 2020 13:45:36 +0200
Message-Id: <11d875c4d945febe2dceb7f7ca991003551b57b1.1597833138.git.mchehab+huawei@kernel.org>
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
 Liwei Cai <cailiwei@hisilicon.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linuxarm@huawei.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Liuyao An <anliuyao@huawei.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mauro.chehab@huawei.com,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, linux-kernel@vger.kernel.org,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiubin Zhang <zhangxiubin1@huawei.com>

Modfiy mipi dsi lanes to improve HDMI compatibility.

Signed-off-by: Xiubin Zhang <zhangxiubin1@huawei.com>
Signed-off-by: Liuyao An <anliuyao@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/dw_drm_dsi.c     | 24 ++++++++++++-------
 drivers/staging/hikey9xx/gpu/hdmi/adv7535.c   |  4 ----
 .../staging/hikey9xx/gpu/kirin970_dpe_reg.h   |  1 +
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
index e87363ab7373..2ba94fa15d0f 100644
--- a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
@@ -359,7 +359,10 @@ static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 	if (bpp < 0)
 		return;
 
-	dsi->client[id].lanes = 4;
+	if (mode->clock > 80000)
+	    dsi->client[id].lanes = 4;
+	else
+	    dsi->client[id].lanes = 3;
 
 	if (dsi->client[id].phy_clock)
 		dphy_req_kHz = dsi->client[id].phy_clock;
@@ -935,8 +938,7 @@ static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi, char __iomem
 	u32 lanes;
 
 	lanes =  dsi->client[dsi->cur_client].lanes - 1;
-
-	for (i = 0; i <= (lanes+1); i++) {
+	for (i = 0; i <= (lanes + 1); i++) {
 		//Lane Transmission Property
 		addr = MIPIDSI_PHY_TST_LANE_TRANSMISSION_PROPERTY + (i << 5);
 		dsi_phy_tst_set(mipi_dsi_base, addr, 0x43);
@@ -960,10 +962,12 @@ static void mipi_config_dphy_spec1v2_parameter(struct dw_dsi *dsi, char __iomem
 	//clock lane timing ctrl - t_hs_trial
 	dsi_phy_tst_set(mipi_dsi_base, MIPIDSI_PHY_TST_CLK_TRAIL, DSS_REDUCE(dsi->phy.clk_t_hs_trial));
 
-	for (i = 0; i <= (lanes + 1); i++) {
-		if (i == 2) {
+	for (i = 0; i <= 4; i++) {
+		if (lanes == 2 && i == 1) /*init mipi dsi 3 lanes shoud skip lane3*/
+			i++;
+
+		if (i == 2) /* skip clock lane*/
 			i++;  //addr: lane0:0x60; lane1:0x80; lane2:0xC0; lane3:0xE0
-		}
 
 		//data lane pre_delay
 		addr = MIPIDSI_PHY_TST_DATA_PRE_DELAY + (i << 5);
@@ -1019,6 +1023,9 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	dss_rect_t rect;
 	u32 cmp_stopstate_val = 0;
 	u32 lanes;
+#if !defined (CONFIG_HISI_FB_970)
+	int i = 0;
+#endif
 
 	WARN_ON(!dsi);
 	WARN_ON(!mipi_dsi_base);
@@ -1132,7 +1139,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	/* clock lane timing ctrl - t_hs_trial*/
 	dsi_phy_tst_set(mipi_dsi_base, 0x25, dsi->phy.clk_t_hs_trial);
 
-	for (int i = 0; i <= lanes; i++) {
+	for (i = 0; i <= lanes; i++) {
 		/* data lane pre_delay*/
 		tmp = 0x30 + (i << 4);
 		dsi_phy_tst_set(mipi_dsi_base, tmp, DSS_REDUCE(dsi->phy.data_pre_delay));
@@ -1361,10 +1368,9 @@ static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 
 static int mipi_dsi_on_sub2(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 {
+	u64 pctrl_dphytx_stopcnt = 0;
 	WARN_ON(!mipi_dsi_base);
-	u64 pctrl_dphytx_stopcnt;
 
-	pctrl_dphytx_stopcnt = 0;
 	/* switch to video mode */
 	set_reg(mipi_dsi_base + MIPIDSI_MODE_CFG_OFFSET, 0x0, 1, 0);
 
diff --git a/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
index 0343b2cd4c45..a21a8f8b917e 100644
--- a/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
+++ b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
@@ -939,14 +939,10 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 		struct mipi_dsi_device *dsi = adv7511->dsi;
 		int lanes, ret;
 
-#if defined(CONFIG_HISI_FB_970)
-		lanes = 4;
-#else
 		if (adj_mode->clock > 80000)
 			lanes = 4;
 		else
 			lanes = 3;
-#endif
 
 		if (lanes != dsi->lanes) {
 			mipi_dsi_detach(dsi);
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
index 867266073bc0..5c2ddcf01b26 100644
--- a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -449,6 +449,7 @@ enum dss_chn_module {
 	MODULE_SCL_LUT,
 	MODULE_ARSR2P,
 	MODULE_ARSR2P_LUT,
+	MODULE_POST_CLIP_ES,
 	MODULE_POST_CLIP,
 	MODULE_PCSC,
 	MODULE_CSC,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
