Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22E95E844
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 08:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8090810E0FC;
	Mon, 26 Aug 2024 06:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qBvrLMhf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8F910E0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 06:07:09 +0000 (UTC)
X-UUID: 6731d2ba637111ef8593d301e5c8a9c0-20240826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Jywz5mOWgU6WNvfbwYrlvZc1NoCCk1aB4yuwINTE8rg=; 
 b=qBvrLMhfJLkRPoTodiafp31kNegr5FORlTC2MH+pDL3/gp1nLShr+Ud3hPKJSZ1MjVTYeJ1tlDK/j9tl1XCH1XQxRXlDaSmJqbKEdTMnYJHNwWmBVb27XU0rOrtMst8HyFtTSnUbHEOWoI7U0CwllY+KApK8geWtOcWoWzwTcTU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:e2372296-6fd6-4d7d-bf88-edb89511b9a2, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6dc6a47, CLOUDID:04a0ca14-737d-40b3-9394-11d4ad6e91a1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6731d2ba637111ef8593d301e5c8a9c0-20240826
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1950966389; Mon, 26 Aug 2024 14:06:58 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 26 Aug 2024 14:06:59 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 26 Aug 2024 14:06:59 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
 <shuijing.li@mediatek.com>
Subject: [PATCH v8] drm/mediatek: dsi: Add dsi per-frame lp code for mt8188
Date: Mon, 26 Aug 2024 14:06:20 +0800
Message-ID: <20240826060654.24038-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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

Adding the per-frame lp function of mt8188, which can keep HFP in HS and
reduce the time required for each line to enter and exit low power.
Per Frame LP:
  |<----------One Active Frame-------->|
--______________________________________----___________________
  ^HSA+HBP^^RGB^^HFP^^HSA+HBP^^RGB^^HFP^    ^HSA+HBP^^RGB^^HFP^

Per Line LP:
  |<---------------One Active Frame----------->|
--______________--______________--______________----______________
  ^HSA+HBP^^RGB^  ^HSA+HBP^^RGB^  ^HSA+HBP^^RGB^    ^HSA+HBP^^RGB^

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
Changes in v8:
Directly write value into DSI_HSTX_CKL_WC without check per suggestion from previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240819061333.26069-1-shuijing.li@mediatek.com/
Changes in v7:
Fix code style and simplify the code per suggestion from previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240813022315.18502-1-shuijing.li@mediatek.com/
Changes in v6:
Simplify the code per suggestion from previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240812070341.26053-1-shuijing.li@mediatek.com/
Changes in v5:
Fix code style issue and add per-line-lp function to be symmetrical with per-frame-lp.
per suggestion from previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240801081144.22372-1-shuijing.li@mediatek.com/
Changes in v4:
Drop the code related to bllp_en and bllp_wc, adjust ps_wc to dsi->vm.hactive *
dsi_buf_bpp.
Changes in v3:
Use function in bitfield.h and get value from phy timing, per suggestion
from previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240424091639.22759-1-shuijing.li@mediatek.com/
Changes in v2:
Use bitfield macros and add new function for per prame lp and improve
the format, per suggestion from previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240314094238.3315-1-shuijing.li@mediatek.com/
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 106 +++++++++++++++++++++++++----
 1 file changed, 94 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index b6e3c011a12d..eeec641cab60 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -88,12 +88,15 @@
 #define DSI_HSA_WC		0x50
 #define DSI_HBP_WC		0x54
 #define DSI_HFP_WC		0x58
+#define HFP_HS_VB_PS_WC		GENMASK(30, 16)
+#define HFP_HS_EN			BIT(31)
 
 #define DSI_CMDQ_SIZE		0x60
 #define CMDQ_SIZE			0x3f
 #define CMDQ_SIZE_SEL		BIT(15)
 
 #define DSI_HSTX_CKL_WC		0x64
+#define HSTX_CKL_WC			GENMASK(15, 2)
 
 #define DSI_RX_DATA0		0x74
 #define DSI_RX_DATA1		0x78
@@ -187,6 +190,7 @@ struct mtk_dsi_driver_data {
 	bool has_shadow_ctl;
 	bool has_size_ctl;
 	bool cmdq_long_packet_ctl;
+	bool support_per_frame_lp;
 };
 
 struct mtk_dsi {
@@ -426,7 +430,75 @@ static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
 	writel(ps_val, dsi->regs + DSI_PSCTRL);
 }
 
-static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
+static void mtk_dsi_config_vdo_timing_per_frame_lp(struct mtk_dsi *dsi)
+{
+	u32 horizontal_sync_active_byte;
+	u32 horizontal_backporch_byte;
+	u32 horizontal_frontporch_byte;
+	u32 hfp_byte_adjust, v_active_adjust;
+	u32 cklp_wc_min_adjust, cklp_wc_max_adjust;
+	u32 dsi_tmp_buf_bpp;
+	unsigned int da_hs_trail;
+	unsigned int ps_wc, hs_vb_ps_wc;
+	u32 v_active_roundup, hstx_cklp_wc;
+	u32 hstx_cklp_wc_max, hstx_cklp_wc_min;
+	struct videomode *vm = &dsi->vm;
+
+	if (dsi->format == MIPI_DSI_FMT_RGB565)
+		dsi_tmp_buf_bpp = 2;
+	else
+		dsi_tmp_buf_bpp = 3;
+
+	da_hs_trail = dsi->phy_timing.da_hs_trail;
+	ps_wc = vm->hactive * dsi_tmp_buf_bpp;
+
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+		horizontal_sync_active_byte =
+			vm->hsync_len * dsi_tmp_buf_bpp - 10;
+		horizontal_backporch_byte =
+			vm->hback_porch * dsi_tmp_buf_bpp - 10;
+		hfp_byte_adjust = 12;
+		v_active_adjust = 32 + horizontal_sync_active_byte;
+		cklp_wc_min_adjust = 12 + 2 + 4 + horizontal_sync_active_byte;
+		cklp_wc_max_adjust = 20 + 6 + 4 + horizontal_sync_active_byte;
+	} else {
+		horizontal_sync_active_byte = vm->hsync_len * dsi_tmp_buf_bpp - 4;
+		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
+			dsi_tmp_buf_bpp - 10;
+		cklp_wc_min_adjust = 4;
+		cklp_wc_max_adjust = 12 + 4 + 4;
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
+			hfp_byte_adjust = 18;
+			v_active_adjust = 28;
+		} else {
+			hfp_byte_adjust = 12;
+			v_active_adjust = 22;
+		}
+	}
+	horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp - hfp_byte_adjust;
+	v_active_roundup = (v_active_adjust + horizontal_backporch_byte + ps_wc +
+			   horizontal_frontporch_byte) % dsi->lanes;
+	if (v_active_roundup)
+		horizontal_backporch_byte += dsi->lanes - v_active_roundup;
+	hstx_cklp_wc_min = (DIV_ROUND_UP(cklp_wc_min_adjust, dsi->lanes) + da_hs_trail + 1)
+			   * dsi->lanes / 6 - 1;
+	hstx_cklp_wc_max = (DIV_ROUND_UP((cklp_wc_max_adjust + horizontal_backporch_byte +
+			   ps_wc), dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+
+	hstx_cklp_wc = FIELD_PREP(HSTX_CKL_WC, (hstx_cklp_wc_min + hstx_cklp_wc_max) / 2);
+	writel(hstx_cklp_wc, dsi->regs + DSI_HSTX_CKL_WC);
+
+	hs_vb_ps_wc = ps_wc - (dsi->phy_timing.lpx + dsi->phy_timing.da_hs_exit +
+		      dsi->phy_timing.da_hs_prepare + dsi->phy_timing.da_hs_zero + 2) * dsi->lanes;
+	horizontal_frontporch_byte |= FIELD_PREP(HFP_HS_EN, 1) |
+				      FIELD_PREP(HFP_HS_VB_PS_WC, hs_vb_ps_wc);
+
+	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
+	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
+	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
+}
+
+static void mtk_dsi_config_vdo_timing_per_line_lp(struct mtk_dsi *dsi)
 {
 	u32 horizontal_sync_active_byte;
 	u32 horizontal_backporch_byte;
@@ -436,7 +508,6 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	u32 dsi_tmp_buf_bpp, data_phy_cycles;
 	u32 delta;
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
-
 	struct videomode *vm = &dsi->vm;
 
 	if (dsi->format == MIPI_DSI_FMT_RGB565)
@@ -444,16 +515,6 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	else
 		dsi_tmp_buf_bpp = 3;
 
-	writel(vm->vsync_len, dsi->regs + DSI_VSA_NL);
-	writel(vm->vback_porch, dsi->regs + DSI_VBP_NL);
-	writel(vm->vfront_porch, dsi->regs + DSI_VFP_NL);
-	writel(vm->vactive, dsi->regs + DSI_VACT_NL);
-
-	if (dsi->driver_data->has_size_ctl)
-		writel(FIELD_PREP(DSI_HEIGHT, vm->vactive) |
-		       FIELD_PREP(DSI_WIDTH, vm->hactive),
-		       dsi->regs + DSI_SIZE_CON);
-
 	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
@@ -499,6 +560,26 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
 	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
 	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
+}
+
+static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
+{
+	struct videomode *vm = &dsi->vm;
+
+	writel(vm->vsync_len, dsi->regs + DSI_VSA_NL);
+	writel(vm->vback_porch, dsi->regs + DSI_VBP_NL);
+	writel(vm->vfront_porch, dsi->regs + DSI_VFP_NL);
+	writel(vm->vactive, dsi->regs + DSI_VACT_NL);
+
+	if (dsi->driver_data->has_size_ctl)
+		writel(FIELD_PREP(DSI_HEIGHT, vm->vactive) |
+			FIELD_PREP(DSI_WIDTH, vm->hactive),
+			dsi->regs + DSI_SIZE_CON);
+
+	if (dsi->driver_data->support_per_frame_lp)
+		mtk_dsi_config_vdo_timing_per_frame_lp(dsi);
+	else
+		mtk_dsi_config_vdo_timing_per_line_lp(dsi);
 
 	mtk_dsi_ps_control(dsi, false);
 }
@@ -1197,6 +1278,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
 	.cmdq_long_packet_ctl = true,
+	.support_per_frame_lp = true,
 };
 
 static const struct of_device_id mtk_dsi_of_match[] = {
-- 
2.45.2

