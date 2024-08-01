Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED15C94463D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 10:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C940310E010;
	Thu,  1 Aug 2024 08:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Qbc65LpR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35E010E010
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 08:11:55 +0000 (UTC)
X-UUID: b3914dcc4fdd11ef9a4e6796c666300c-20240801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fy5DunPAyYU4WYv5r8MiBywBLFV+74bLINMeHVNNHLQ=; 
 b=Qbc65LpR+6Df6d1jHUk4an7g4QeaYu7ECbeECCdRGixXo1mbGkmORVWBeUr+i3tFEO3Va3BKAaVZ0l6xGRkd9C3FQN7uw1AjUw8UgEd+1eZpdCNYpPe8xAiPme02UYLxxt/qjuSsHCvw58P2UmDL7J3lqc80sT0eVEozeMO6+Ts=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:0e4726e6-7e94-40ef-928c-76d950129539, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-30
X-CID-META: VersionHash:6dc6a47, CLOUDID:541c230e-46b0-425a-97d3-4623fe284021,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
 L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
 1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b3914dcc4fdd11ef9a4e6796c666300c-20240801
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 907801158; Thu, 01 Aug 2024 16:11:49 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Aug 2024 16:11:47 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Aug 2024 16:11:46 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
 <shuijing.li@mediatek.com>
Subject: [PATCH v4] drm/mediatek: dsi: Add dsi per-frame lp code for mt8188
Date: Thu, 1 Aug 2024 16:11:34 +0800
Message-ID: <20240801081144.22372-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.622400-8.000000
X-TMASE-MatchedRID: cgCwsOOlPfAwKP61E4rxu1VN8laWo90M5TpDO1WKs2mYQOVjVNfbbpOu
 v4LVY2bFTkkjufoIff4jfA7ocKKIpzZQQocM3TDMGVyS87Wb4lzSv+oK79xjnUYvSDWdWaRhlqx
 8Dxj9EIVfw77qsJLx4U9h13WKYt0lAM0/G7XUdeMMH4SsGvRsA0qAhuLHn5fE+3n3Z6rbGhPejM
 lFftvg2ZIEvcwNcKRi3zYWBJaf/JyuYDHQSk88ce7KTDtx8Cggm6ZTMj/Sfrm5ZjHyzYrpGjTdq
 51OxL847hUCZUBVS2iyrZirIDlyAmrGB8JmGq18jtK7dC6UBnm5+1figft3Lpsoi2XrUn/JUTdY
 /mdfTXtJKW4mDlJsMcK21zBg2KlfJLIWFE2XGROPBqcM9Qj5Vcrv+woMCO8y7deJLzvhwSpNzvA
 9bEifz1Zca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.622400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 704981C5E754EF9CA17F46B6E4ADA1076DB9C6882607B60B0C214675FF94046A2000:8
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
 drivers/gpu/drm/mediatek/mtk_dsi.c | 210 ++++++++++++++++++++++-------
 1 file changed, 163 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index b6e3c011a12d..4bda8fa17c3d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -88,12 +88,16 @@
 #define DSI_HSA_WC		0x50
 #define DSI_HBP_WC		0x54
 #define DSI_HFP_WC		0x58
+#define HFP_HS_EN		31
+#define HFP_HS_VB_PS_WC_SHIFT 16
 
 #define DSI_CMDQ_SIZE		0x60
 #define CMDQ_SIZE			0x3f
 #define CMDQ_SIZE_SEL		BIT(15)
 
 #define DSI_HSTX_CKL_WC		0x64
+#define HSTX_CKL_WC				GENMASK(15, 2)
+#define HSTX_CKL_WC_SHIFT	2
 
 #define DSI_RX_DATA0		0x74
 #define DSI_RX_DATA1		0x78
@@ -187,6 +191,7 @@ struct mtk_dsi_driver_data {
 	bool has_shadow_ctl;
 	bool has_size_ctl;
 	bool cmdq_long_packet_ctl;
+	bool support_per_frame_lp;
 };
 
 struct mtk_dsi {
@@ -426,6 +431,112 @@ static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
 	writel(ps_val, dsi->regs + DSI_PSCTRL);
 }
 
+static void mtk_dsi_config_vdo_timing_per_frame_lp(struct mtk_dsi *dsi)
+{
+	u32 horizontal_sync_active_byte;
+	u32 horizontal_backporch_byte;
+	u32 horizontal_frontporch_byte;
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
+		horizontal_frontporch_byte =
+			vm->hfront_porch * dsi_tmp_buf_bpp - 12;
+
+		v_active_roundup = (32 + horizontal_sync_active_byte +
+			horizontal_backporch_byte + ps_wc +
+			horizontal_frontporch_byte) % dsi->lanes;
+		if (v_active_roundup)
+			horizontal_backporch_byte = horizontal_backporch_byte +
+				dsi->lanes - v_active_roundup;
+		hstx_cklp_wc_min = (DIV_ROUND_UP((12 + 2 + 4 +
+			horizontal_sync_active_byte), dsi->lanes) + da_hs_trail + 1)
+			* dsi->lanes / 6 - 1;
+		hstx_cklp_wc_max = (DIV_ROUND_UP((20 + 6 + 4 +
+			horizontal_sync_active_byte + horizontal_backporch_byte +
+			ps_wc), dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+	} else {
+		horizontal_sync_active_byte = vm->hsync_len * dsi_tmp_buf_bpp - 4;
+
+		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
+			dsi_tmp_buf_bpp - 10;
+		hstx_cklp_wc_min = (DIV_ROUND_UP(4, dsi->lanes) + da_hs_trail + 1)
+			* dsi->lanes / 6 - 1;
+
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
+			horizontal_frontporch_byte = (vm->hfront_porch *
+				dsi_tmp_buf_bpp - 18);
+
+			v_active_roundup = (28 + horizontal_backporch_byte + ps_wc +
+				horizontal_frontporch_byte) % dsi->lanes;
+			if (v_active_roundup)
+				horizontal_backporch_byte = horizontal_backporch_byte +
+				dsi->lanes - v_active_roundup;
+
+			hstx_cklp_wc_max = (DIV_ROUND_UP((12 + 4 + 4 +
+				horizontal_backporch_byte + ps_wc),
+				dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+		} else {
+			horizontal_frontporch_byte = (vm->hfront_porch *
+				dsi_tmp_buf_bpp - 12);
+
+			v_active_roundup = (22 + horizontal_backporch_byte + ps_wc +
+				horizontal_frontporch_byte) % dsi->lanes;
+			if (v_active_roundup)
+				horizontal_backporch_byte = horizontal_backporch_byte +
+				dsi->lanes - v_active_roundup;
+
+			hstx_cklp_wc_max = (DIV_ROUND_UP((12 + 4 + 4 +
+				horizontal_backporch_byte + ps_wc),
+				dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
+		}
+	}
+	hstx_cklp_wc = FIELD_GET(HSTX_CKL_WC, readl(dsi->regs + DSI_HSTX_CKL_WC));
+
+	if (hstx_cklp_wc <= hstx_cklp_wc_min ||
+		hstx_cklp_wc >= hstx_cklp_wc_max) {
+		hstx_cklp_wc = ((hstx_cklp_wc_min + hstx_cklp_wc_max) / 2) << HSTX_CKL_WC_SHIFT;
+		writel(hstx_cklp_wc, dsi->regs + DSI_HSTX_CKL_WC);
+	}
+	hstx_cklp_wc = hstx_cklp_wc >> HSTX_CKL_WC_SHIFT;
+	if (hstx_cklp_wc <= hstx_cklp_wc_min ||
+		hstx_cklp_wc >= hstx_cklp_wc_max) {
+		DRM_WARN("Wrong setting of hstx_ckl_wc\n");
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
+	horizontal_frontporch_byte = (1 << HFP_HS_EN)
+		| (hs_vb_ps_wc << HFP_HS_VB_PS_WC_SHIFT)
+		| (horizontal_frontporch_byte);
+
+	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
+	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
+	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
+}
+
 static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 {
 	u32 horizontal_sync_active_byte;
@@ -449,57 +560,61 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	writel(vm->vfront_porch, dsi->regs + DSI_VFP_NL);
 	writel(vm->vactive, dsi->regs + DSI_VACT_NL);
 
-	if (dsi->driver_data->has_size_ctl)
-		writel(FIELD_PREP(DSI_HEIGHT, vm->vactive) |
-		       FIELD_PREP(DSI_WIDTH, vm->hactive),
-		       dsi->regs + DSI_SIZE_CON);
-
-	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
-
-	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp - 10;
-	else
-		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
-					    dsi_tmp_buf_bpp - 10;
-
-	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
-			  timing->da_hs_zero + timing->da_hs_exit + 3;
-
-	delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
-	delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
+	if (dsi->driver_data->support_per_frame_lp)
+		mtk_dsi_config_vdo_timing_per_frame_lp(dsi);
+	else {
+		if (dsi->driver_data->has_size_ctl)
+			writel(FIELD_PREP(DSI_HEIGHT, vm->vactive) |
+				FIELD_PREP(DSI_WIDTH, vm->hactive),
+				dsi->regs + DSI_SIZE_CON);
 
-	horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
-	horizontal_front_back_byte = horizontal_frontporch_byte + horizontal_backporch_byte;
-	data_phy_cycles_byte = data_phy_cycles * dsi->lanes + delta;
+		horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
 
-	if (horizontal_front_back_byte > data_phy_cycles_byte) {
-		horizontal_frontporch_byte -= data_phy_cycles_byte *
-					      horizontal_frontporch_byte /
-					      horizontal_front_back_byte;
-
-		horizontal_backporch_byte -= data_phy_cycles_byte *
-					     horizontal_backporch_byte /
-					     horizontal_front_back_byte;
-	} else {
-		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
-	}
-
-	if ((dsi->mode_flags & MIPI_DSI_HS_PKT_END_ALIGNED) &&
-	    (dsi->lanes == 4)) {
-		horizontal_sync_active_byte =
-			roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
-		horizontal_frontporch_byte =
-			roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
-		horizontal_backporch_byte =
-			roundup(horizontal_backporch_byte, dsi->lanes) - 2;
-		horizontal_backporch_byte -=
-			(vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+			horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp - 10;
+		else
+			horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
+							dsi_tmp_buf_bpp - 10;
+
+		data_phy_cycles = timing->lpx + timing->da_hs_prepare +
+				timing->da_hs_zero + timing->da_hs_exit + 3;
+
+		delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
+		delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
+
+		horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
+		horizontal_front_back_byte = horizontal_frontporch_byte + horizontal_backporch_byte;
+		data_phy_cycles_byte = data_phy_cycles * dsi->lanes + delta;
+
+		if (horizontal_front_back_byte > data_phy_cycles_byte) {
+			horizontal_frontporch_byte -= data_phy_cycles_byte *
+							horizontal_frontporch_byte /
+							horizontal_front_back_byte;
+
+			horizontal_backporch_byte -= data_phy_cycles_byte *
+							horizontal_backporch_byte /
+							horizontal_front_back_byte;
+		} else {
+			DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
+		}
+
+		if ((dsi->mode_flags & MIPI_DSI_HS_PKT_END_ALIGNED) &&
+			(dsi->lanes == 4)) {
+			horizontal_sync_active_byte =
+				roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
+			horizontal_frontporch_byte =
+				roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
+			horizontal_backporch_byte =
+				roundup(horizontal_backporch_byte, dsi->lanes) - 2;
+			horizontal_backporch_byte -=
+				(vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
+		}
+
+		writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
+		writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
+		writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
 	}
 
-	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
-	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
-	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
-
 	mtk_dsi_ps_control(dsi, false);
 }
 
@@ -1197,6 +1312,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
 	.cmdq_long_packet_ctl = true,
+	.support_per_frame_lp = true,
 };
 
 static const struct of_device_id mtk_dsi_of_match[] = {
-- 
2.43.0

