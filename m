Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE7394FBC0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 04:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B43410E127;
	Tue, 13 Aug 2024 02:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JsRtZ8RM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B765910E127
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 02:23:26 +0000 (UTC)
X-UUID: 002a3fc2591b11ef9a4e6796c666300c-20240813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NYx9FHNUjfdW5MSmPrzW9lgHzLnEs6Sa+hTWUNOhjL8=; 
 b=JsRtZ8RM5RU2L+hVu029VFEdq+kggNpM5vJCEA10ErIrBFef+e1iFZqkbAsHblfc1VieVI7CFr8yskhMoWWIWDbPJn+bripxKuSm+r+GwSrLYoSoMSOryQRjESE6nsNnUdXB1uWfN9mZVFANAxVYKaPhliJ+5us8I9e/V3gr/KU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:d106ae70-02a5-47ca-9121-f3577916f710, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-30
X-CID-META: VersionHash:6dc6a47, CLOUDID:aef30c3f-6019-4002-9080-12f7f4711092,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
 L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
 1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 002a3fc2591b11ef9a4e6796c666300c-20240813
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 233601480; Tue, 13 Aug 2024 10:23:17 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 13 Aug 2024 10:23:16 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 13 Aug 2024 10:23:16 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
 <shuijing.li@mediatek.com>
Subject: [PATCH v6] drm/mediatek: dsi: Add dsi per-frame lp code for mt8188
Date: Tue, 13 Aug 2024 10:22:51 +0800
Message-ID: <20240813022315.18502-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.069000-8.000000
X-TMASE-MatchedRID: RzvPREWj2HcwKP61E4rxu1VN8laWo90M5TpDO1WKs2mYQOVjVNfbbpOu
 v4LVY2bFO+NwyBVe+HBIT4SOZxkibrGaAH5r9EhkhK8o4aoss8q+1Vx7rDn4r/k3SjZMcZFk9BQ
 FWu9qPYZckfCAECj1GiN8DuhwooinL0W1btd8e57LtNJZxvPj1hG8SlV3e9LV31GU/N5W5BBb53
 SJ0uOmmjFeXjrzLWaDf4eyKeT1hq1nPzp+oCPs8yNHByyOpYYC5TbwqVVpF+PvPjzagmh01OYHE
 PaPco6bUjpSbEFN/xydZVUStkfgGWsV28ESZOe8kPoFsM336M7JV9WzHT2T5WI4wQ1Yq/d0GOmx
 KvkU9Nj3cuxjGnQlwIAy6p60ZV628dnCdmtX28KtIWznhjjBtfoLR4+zsDTtqFhHt/jREakEjL6
 3fz0OrKfIQlX7lQr797qzTR8oUxAiJh4QFUH9xlZca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.069000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7DEBCE6D96BEFE86668EA096D1ACAFA397E01EDBCD3E3B8451EC47FDE7BB8E552000:8
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
 drivers/gpu/drm/mediatek/mtk_dsi.c | 158 +++++++++++++++++++++++++----
 1 file changed, 139 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index b6e3c011a12d..940fc99cc87d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -88,12 +88,15 @@
 #define DSI_HSA_WC		0x50
 #define DSI_HBP_WC		0x54
 #define DSI_HFP_WC		0x58
+#define HFP_HS_VB_PS_WC	GENMASK(30, 16)
+#define HFP_HS_EN		BIT(31)
 
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
@@ -426,7 +430,92 @@ static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
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
+	unsigned int lpx, da_hs_exit, da_hs_prep, da_hs_trail;
+	unsigned int da_hs_zero, ps_wc, hs_vb_ps_wc;
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
+	ps_wc = dsi->vm.hactive * dsi_tmp_buf_bpp;
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
+		horizontal_frontporch_byte) % dsi->lanes;
+	if (v_active_roundup)
+		horizontal_backporch_byte += dsi->lanes - v_active_roundup;
+	hstx_cklp_wc_min = (DIV_ROUND_UP(cklp_wc_min_adjust, dsi->lanes) + da_hs_trail + 1)
+		* dsi->lanes / 6 - 1;
+	hstx_cklp_wc_max = (DIV_ROUND_UP((cklp_wc_max_adjust + horizontal_backporch_byte +
+		ps_wc), dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+
+	hstx_cklp_wc = FIELD_GET(HSTX_CKL_WC, readl(dsi->regs + DSI_HSTX_CKL_WC));
+
+	if (hstx_cklp_wc <= hstx_cklp_wc_min || hstx_cklp_wc >= hstx_cklp_wc_max) {
+		hstx_cklp_wc = ((hstx_cklp_wc_min + hstx_cklp_wc_max) / 2);
+
+		/* Check if the new setting is valid */
+		if (hstx_cklp_wc <= hstx_cklp_wc_min ||	hstx_cklp_wc >= hstx_cklp_wc_max)
+			DRM_WARN("Wrong setting of hstx_ckl_wc\n");
+
+		hstx_cklp_wc = FIELD_PREP(HSTX_CKL_WC, hstx_cklp_wc);
+		writel(hstx_cklp_wc, dsi->regs + DSI_HSTX_CKL_WC);
+	}
+
+	lpx = dsi->phy_timing.lpx;
+	da_hs_exit = dsi->phy_timing.da_hs_exit;
+	da_hs_prep = dsi->phy_timing.da_hs_prepare;
+	da_hs_zero = dsi->phy_timing.da_hs_zero;
+
+	hs_vb_ps_wc = ps_wc -
+		(lpx + da_hs_exit + da_hs_prep + da_hs_zero + 2)
+		* dsi->lanes;
+	horizontal_frontporch_byte = FIELD_PREP(HFP_HS_EN, 1) |
+		FIELD_PREP(HFP_HS_VB_PS_WC, hs_vb_ps_wc) |
+		horizontal_frontporch_byte;
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
@@ -436,7 +525,6 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	u32 dsi_tmp_buf_bpp, data_phy_cycles;
 	u32 delta;
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
-
 	struct videomode *vm = &dsi->vm;
 
 	if (dsi->format == MIPI_DSI_FMT_RGB565)
@@ -444,16 +532,6 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
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
@@ -499,6 +577,26 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
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
@@ -1197,6 +1295,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
 	.cmdq_long_packet_ctl = true,
+	.support_per_frame_lp = true,
 };
 
 static const struct of_device_id mtk_dsi_of_match[] = {
-- 
2.45.2

