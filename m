Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F0EA7F0BF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 01:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDB410E3F8;
	Mon,  7 Apr 2025 23:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="rbFSv3ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9725810E466
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:31:58 +0000 (UTC)
X-UUID: a61d758a13b411f08eb9c36241bbb6fb-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AuDfMp/qDmrAwPddiTMr+OlxJ6rEr0mHP+6Mb583/mk=; 
 b=rbFSv3exVMMZmBXfT8YjX66xYAs+2AeROA+Pt1Qe8MvPir0/VFRRWb49VZfAsqJez5fh7ixOg8B2kzYJOFsXUNbaMMKmLbZ9caBHzwCJzidfp33RksHxXST/0n/DSxAY6OVm0lX/0a64oBblOvZnYc5EXlhs0dCrtjquriLhXEg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:ba63b8c8-5596-4a9c-9acc-e3a69c059470, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:e998c7a5-c619-47e3-a41b-90eedbf5b947,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a61d758a13b411f08eb9c36241bbb6fb-20250407
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <bincai.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1580013045; Mon, 07 Apr 2025 21:31:45 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 21:31:43 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 21:31:42 +0800
From: Bincai Liu <bincai.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Jitao Shi <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 Bincai Liu <bincai.liu@mediatek.com>
Subject: [PATCH 3/4] drm/mediatek: Add mipi dsi driver for mt8196
Date: Mon, 7 Apr 2025 21:31:24 +0800
Message-ID: <20250407133138.22449-4-bincai.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407133138.22449-1-bincai.liu@mediatek.com>
References: <20250407133138.22449-1-bincai.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 07 Apr 2025 23:15:28 +0000
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

Add dsi and mipi phy driver for mt8196.

Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 248 +++++++++++-------
 drivers/phy/mediatek/Makefile                 |   1 +
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8196.c    | 201 ++++++++++++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c       |   1 +
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h       |   1 +
 6 files changed, 356 insertions(+), 98 deletions(-)
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74158b9d6503..ae859f20fab3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -830,6 +830,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8188-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8196-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d1f407fb7eb1..b1467d6bed06 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -44,12 +44,12 @@
 #define EXT_TE_RDY_INT_FLAG		BIT(4)
 #define DSI_BUSY			BIT(31)
 
-#define DSI_CON_CTRL		0x10
+#define DSI_CON_CTRL(data)		(0x10 + (data)->reg_20_ofs)
 #define DSI_RESET			BIT(0)
 #define DSI_EN				BIT(1)
 #define DPHY_RESET			BIT(2)
 
-#define DSI_MODE_CTRL		0x14
+#define DSI_MODE_CTRL(data)		(0x14 + (data)->reg_20_ofs)
 #define MODE				(3)
 #define CMD_MODE			0
 #define SYNC_PULSE_MODE			1
@@ -58,7 +58,7 @@
 #define FRM_MODE			BIT(16)
 #define MIX_MODE			BIT(17)
 
-#define DSI_TXRX_CTRL		0x18
+#define DSI_TXRX_CTRL(data)		(0x18 + (data)->reg_20_ofs)
 #define VC_NUM				BIT(1)
 #define LANE_NUM			GENMASK(5, 2)
 #define DIS_EOT				BIT(6)
@@ -69,81 +69,87 @@
 #define MAX_RTN_SIZE			GENMASK(15, 12)
 #define HSTX_CKLP_EN			BIT(16)
 
-#define DSI_PSCTRL		0x1c
+#define DSI_PSCTRL(data)		(0x1c + (data)->reg_20_ofs)
 #define DSI_PS_WC			GENMASK(13, 0)
-#define DSI_PS_SEL			GENMASK(17, 16)
+#define DSI_PS_SEL			GENMASK(19, 16)
 #define PACKED_PS_16BIT_RGB565		0
 #define PACKED_PS_18BIT_RGB666		1
 #define LOOSELY_PS_24BIT_RGB666		2
 #define PACKED_PS_24BIT_RGB888		3
 
-#define DSI_VSA_NL		0x20
-#define DSI_VBP_NL		0x24
-#define DSI_VFP_NL		0x28
-#define DSI_VACT_NL		0x2C
+#define DSI_VSA_NL(data)		(0x20 + (data)->reg_40_ofs)
+#define DSI_VBP_NL(data)		(0x24 + (data)->reg_40_ofs)
+#define DSI_VFP_NL(data)		(0x28 + (data)->reg_40_ofs)
+#define DSI_VACT_NL(data)		(0x2c + (data)->reg_40_ofs)
 #define VACT_NL				GENMASK(14, 0)
-#define DSI_SIZE_CON		0x38
+#define DSI_SIZE_CON(data)		((data)->dsi_size_con ? \
+					(data)->dsi_size_con : 0x38)
 #define DSI_HEIGHT				GENMASK(30, 16)
 #define DSI_WIDTH				GENMASK(14, 0)
-#define DSI_HSA_WC		0x50
-#define DSI_HBP_WC		0x54
-#define DSI_HFP_WC		0x58
+#define DSI_HSA_WC(data)		(0x50 + (data)->reg_30_ofs)
+#define DSI_HBP_WC(data)		(0x54 + (data)->reg_30_ofs)
+#define DSI_HFP_WC(data)		(0x58 + (data)->reg_30_ofs)
 #define HFP_HS_VB_PS_WC		GENMASK(30, 16)
 #define HFP_HS_EN			BIT(31)
 
-#define DSI_CMDQ_SIZE		0x60
+#define DSI_CMDQ_SIZE(data)		((data)->dsi_cmdq_con ? \
+					(data)->dsi_cmdq_con : 0x60)
 #define CMDQ_SIZE			0x3f
 #define CMDQ_SIZE_SEL		BIT(15)
 
-#define DSI_HSTX_CKL_WC		0x64
+#define DSI_HSTX_CKL_WC(data)		((data)->dsi_hstx_ckl_wc ? \
+					(data)->dsi_hstx_ckl_wc : 0x64)
 #define HSTX_CKL_WC			GENMASK(15, 2)
 
-#define DSI_RX_DATA0		0x74
-#define DSI_RX_DATA1		0x78
-#define DSI_RX_DATA2		0x7c
-#define DSI_RX_DATA3		0x80
+#define DSI_RX_DATA0(data)		(0x74 + (data)->reg_30_ofs)
+#define DSI_RX_DATA1(data)		(0x78 + (data)->reg_30_ofs)
+#define DSI_RX_DATA2(data)		(0x7c + (data)->reg_30_ofs)
+#define DSI_RX_DATA3(data)		(0x80 + (data)->reg_30_ofs)
 
-#define DSI_RACK		0x84
+#define DSI_RACK(data)			(0x84 + (data)->reg_30_ofs)
 #define RACK				BIT(0)
 
-#define DSI_PHY_LCCON		0x104
+#define DSI_PHY_LCCON(data)		((data)->reg_phy_base ? 0x1d0 : 0x104)
 #define LC_HS_TX_EN			BIT(0)
 #define LC_ULPM_EN			BIT(1)
 #define LC_WAKEUP_EN			BIT(2)
 
-#define DSI_PHY_LD0CON		0x108
+#define DSI_PHY_LD0CON(data)		((data)->reg_phy_base ? 0x1d4 : 0x108)
 #define LD0_HS_TX_EN			BIT(0)
 #define LD0_ULPM_EN			BIT(1)
 #define LD0_WAKEUP_EN			BIT(2)
 
-#define DSI_PHY_TIMECON0	0x110
-#define LPX				GENMASK(7, 0)
-#define HS_PREP				GENMASK(15, 8)
-#define HS_ZERO				GENMASK(23, 16)
-#define HS_TRAIL			GENMASK(31, 24)
-
-#define DSI_PHY_TIMECON1	0x114
-#define TA_GO				GENMASK(7, 0)
-#define TA_SURE				GENMASK(15, 8)
-#define TA_GET				GENMASK(23, 16)
-#define DA_HS_EXIT			GENMASK(31, 24)
-
-#define DSI_PHY_TIMECON2	0x118
-#define CONT_DET			GENMASK(7, 0)
-#define DA_HS_SYNC			GENMASK(15, 8)
-#define CLK_ZERO			GENMASK(23, 16)
-#define CLK_TRAIL			GENMASK(31, 24)
-
-#define DSI_PHY_TIMECON3	0x11c
-#define CLK_HS_PREP			GENMASK(7, 0)
-#define CLK_HS_POST			GENMASK(15, 8)
-#define CLK_HS_EXIT			GENMASK(23, 16)
+#define DSI_PHY_TIMECON0(data)		((data)->reg_phy_base ? \
+					(data)->reg_phy_base : 0x110)
+#define LPX				(0xff << 0)
+#define HS_PREP				(0xff << 8)
+#define HS_ZERO				(0xff << 16)
+#define HS_TRAIL			(0xff << 24)
+
+#define DSI_PHY_TIMECON1(data)		(DSI_PHY_TIMECON0(data) + 0x4)
+#define TA_GO				(0xff << 0)
+#define TA_SURE				(0xff << 8)
+#define TA_GET				(0xff << 16)
+#define DA_HS_EXIT			(0xff << 24)
+
+#define DSI_PHY_TIMECON2(data)		(DSI_PHY_TIMECON0(data) + 0x8)
+#define CONT_DET			(0xff << 0)
+#define DA_HS_SYNC			(0xff << 8)
+#define CLK_ZERO			(0xff << 16)
+#define CLK_TRAIL			(0xff << 24)
+
+#define DSI_PHY_TIMECON3(data)		(DSI_PHY_TIMECON0(data) + 0xc)
+#define CLK_HS_PREP			(0xff << 0)
+#define CLK_HS_POST			(0xff << 8)
+#define CLK_HS_EXIT			(0xff << 16)
 
 /* DSI_VM_CMD_CON */
 #define VM_CMD_EN			BIT(0)
 #define TS_VFP_EN			BIT(5)
 
 /* DSI_SHADOW_DEBUG */
+#define DSI_SHADOW_DEBUG(data)		((data)->dsi_shadow_dbg ? \
+					(data)->dsi_shadow_dbg : 0x190)
 #define FORCE_COMMIT			BIT(0)
 #define BYPASS_SHADOW			BIT(1)
 
@@ -193,6 +199,24 @@ struct mtk_dsi_driver_data {
 	bool has_size_ctl;
 	bool cmdq_long_packet_ctl;
 	bool support_per_frame_lp;
+	const u32 reg_phy_base;
+	const u32 reg_20_ofs;
+	const u32 reg_30_ofs;
+	const u32 reg_40_ofs;
+	const u32 reg_100_ofs;
+	const u32 dsi_size_con;
+	const u32 dsi_vfp_early_stop;
+	const u32 dsi_lfr_con;
+	const u32 dsi_cmdq_con;
+	const u32 dsi_type1_hs;
+	const u32 dsi_hstx_ckl_wc;
+	const u32 dsi_mem_conti;
+	const u32 dsi_time_con;
+	const u32 dsi_reserved;
+	const u32 dsi_state_dbg6;
+	const u32 dsi_dbg_sel;
+	const u32 dsi_shadow_dbg;
+	const u32 dsi_vm_cmd_con;
 };
 
 struct mtk_dsi {
@@ -283,71 +307,71 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 		  FIELD_PREP(CLK_HS_POST, timing->clk_hs_post) |
 		  FIELD_PREP(CLK_HS_EXIT, timing->clk_hs_exit);
 
-	writel(timcon0, dsi->regs + DSI_PHY_TIMECON0);
-	writel(timcon1, dsi->regs + DSI_PHY_TIMECON1);
-	writel(timcon2, dsi->regs + DSI_PHY_TIMECON2);
-	writel(timcon3, dsi->regs + DSI_PHY_TIMECON3);
+	writel(timcon0, dsi->regs + DSI_PHY_TIMECON0(dsi->driver_data));
+	writel(timcon1, dsi->regs + DSI_PHY_TIMECON1(dsi->driver_data));
+	writel(timcon2, dsi->regs + DSI_PHY_TIMECON2(dsi->driver_data));
+	writel(timcon3, dsi->regs + DSI_PHY_TIMECON3(dsi->driver_data));
 }
 
 static void mtk_dsi_enable(struct mtk_dsi *dsi)
 {
-	mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_EN, DSI_EN);
+	mtk_dsi_mask(dsi, DSI_CON_CTRL(dsi->driver_data), DSI_EN, DSI_EN);
 }
 
 static void mtk_dsi_disable(struct mtk_dsi *dsi)
 {
-	mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_EN, 0);
+	mtk_dsi_mask(dsi, DSI_CON_CTRL(dsi->driver_data), DSI_EN, 0);
 }
 
 static void mtk_dsi_reset_engine(struct mtk_dsi *dsi)
 {
-	mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_RESET, DSI_RESET);
-	mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_RESET, 0);
+	mtk_dsi_mask(dsi, DSI_CON_CTRL(dsi->driver_data), DSI_RESET, DSI_RESET);
+	mtk_dsi_mask(dsi, DSI_CON_CTRL(dsi->driver_data), DSI_RESET, 0);
 }
 
 static void mtk_dsi_reset_dphy(struct mtk_dsi *dsi)
 {
-	mtk_dsi_mask(dsi, DSI_CON_CTRL, DPHY_RESET, DPHY_RESET);
-	mtk_dsi_mask(dsi, DSI_CON_CTRL, DPHY_RESET, 0);
+	mtk_dsi_mask(dsi, DSI_CON_CTRL(dsi->driver_data), DPHY_RESET, DPHY_RESET);
+	mtk_dsi_mask(dsi, DSI_CON_CTRL(dsi->driver_data), DPHY_RESET, 0);
 }
 
 static void mtk_dsi_clk_ulp_mode_enter(struct mtk_dsi *dsi)
 {
-	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_HS_TX_EN, 0);
-	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_ULPM_EN, 0);
+	mtk_dsi_mask(dsi, DSI_PHY_LCCON(dsi->driver_data), LC_HS_TX_EN, 0);
+	mtk_dsi_mask(dsi, DSI_PHY_LCCON(dsi->driver_data), LC_ULPM_EN, 0);
 }
 
 static void mtk_dsi_clk_ulp_mode_leave(struct mtk_dsi *dsi)
 {
-	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_ULPM_EN, 0);
-	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_WAKEUP_EN, LC_WAKEUP_EN);
-	mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_WAKEUP_EN, 0);
+	mtk_dsi_mask(dsi, DSI_PHY_LCCON(dsi->driver_data), LC_ULPM_EN, 0);
+	mtk_dsi_mask(dsi, DSI_PHY_LCCON(dsi->driver_data), LC_WAKEUP_EN, LC_WAKEUP_EN);
+	mtk_dsi_mask(dsi, DSI_PHY_LCCON(dsi->driver_data), LC_WAKEUP_EN, 0);
 }
 
 static void mtk_dsi_lane0_ulp_mode_enter(struct mtk_dsi *dsi)
 {
-	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_HS_TX_EN, 0);
-	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_ULPM_EN, 0);
+	mtk_dsi_mask(dsi, DSI_PHY_LD0CON(dsi->driver_data), LD0_HS_TX_EN, 0);
+	mtk_dsi_mask(dsi, DSI_PHY_LD0CON(dsi->driver_data), LD0_ULPM_EN, 0);
 }
 
 static void mtk_dsi_lane0_ulp_mode_leave(struct mtk_dsi *dsi)
 {
-	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_ULPM_EN, 0);
-	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_WAKEUP_EN, LD0_WAKEUP_EN);
-	mtk_dsi_mask(dsi, DSI_PHY_LD0CON, LD0_WAKEUP_EN, 0);
+	mtk_dsi_mask(dsi, DSI_PHY_LD0CON(dsi->driver_data), LD0_ULPM_EN, 0);
+	mtk_dsi_mask(dsi, DSI_PHY_LD0CON(dsi->driver_data), LD0_WAKEUP_EN, LD0_WAKEUP_EN);
+	mtk_dsi_mask(dsi, DSI_PHY_LD0CON(dsi->driver_data), LD0_WAKEUP_EN, 0);
 }
 
 static bool mtk_dsi_clk_hs_state(struct mtk_dsi *dsi)
 {
-	return readl(dsi->regs + DSI_PHY_LCCON) & LC_HS_TX_EN;
+	return readl(dsi->regs + DSI_PHY_LCCON(dsi->driver_data)) & LC_HS_TX_EN;
 }
 
 static void mtk_dsi_clk_hs_mode(struct mtk_dsi *dsi, bool enter)
 {
 	if (enter && !mtk_dsi_clk_hs_state(dsi))
-		mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_HS_TX_EN, LC_HS_TX_EN);
+		mtk_dsi_mask(dsi, DSI_PHY_LCCON(dsi->driver_data), LC_HS_TX_EN, LC_HS_TX_EN);
 	else if (!enter && mtk_dsi_clk_hs_state(dsi))
-		mtk_dsi_mask(dsi, DSI_PHY_LCCON, LC_HS_TX_EN, 0);
+		mtk_dsi_mask(dsi, DSI_PHY_LCCON(dsi->driver_data), LC_HS_TX_EN, 0);
 }
 
 static void mtk_dsi_set_mode(struct mtk_dsi *dsi)
@@ -363,13 +387,13 @@ static void mtk_dsi_set_mode(struct mtk_dsi *dsi)
 			vid_mode = SYNC_EVENT_MODE;
 	}
 
-	writel(vid_mode, dsi->regs + DSI_MODE_CTRL);
+	writel(vid_mode, dsi->regs + DSI_MODE_CTRL(dsi->driver_data));
 }
 
 static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
 {
-	mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, VM_CMD_EN, VM_CMD_EN);
-	mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, TS_VFP_EN, TS_VFP_EN);
+	mtk_dsi_mask(dsi, dsi->driver_data->dsi_vm_cmd_con, VM_CMD_EN, VM_CMD_EN);
+	mtk_dsi_mask(dsi, dsi->driver_data->dsi_vm_cmd_con, TS_VFP_EN, TS_VFP_EN);
 }
 
 static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
@@ -389,7 +413,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		regval |= DIS_EOT;
 
-	writel(regval, dsi->regs + DSI_TXRX_CTRL);
+	writel(regval, dsi->regs + DSI_TXRX_CTRL(dsi->driver_data));
 }
 
 static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
@@ -425,10 +449,10 @@ static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
 
 	if (config_vact) {
 		vact_nl = FIELD_PREP(VACT_NL, dsi->vm.vactive);
-		writel(vact_nl, dsi->regs + DSI_VACT_NL);
-		writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
+		writel(vact_nl, dsi->regs + DSI_VACT_NL(dsi->driver_data));
+		writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC(dsi->driver_data));
 	}
-	writel(ps_val, dsi->regs + DSI_PSCTRL);
+	writel(ps_val, dsi->regs + DSI_PSCTRL(dsi->driver_data));
 }
 
 static void mtk_dsi_config_vdo_timing_per_frame_lp(struct mtk_dsi *dsi)
@@ -487,16 +511,16 @@ static void mtk_dsi_config_vdo_timing_per_frame_lp(struct mtk_dsi *dsi)
 			   ps_wc), dsi->lanes) + da_hs_trail + 1) * dsi->lanes / 6 - 1;
 
 	hstx_cklp_wc = FIELD_PREP(HSTX_CKL_WC, (hstx_cklp_wc_min + hstx_cklp_wc_max) / 2);
-	writel(hstx_cklp_wc, dsi->regs + DSI_HSTX_CKL_WC);
+	writel(hstx_cklp_wc, dsi->regs + DSI_HSTX_CKL_WC(dsi->driver_data));
 
 	hs_vb_ps_wc = ps_wc - (dsi->phy_timing.lpx + dsi->phy_timing.da_hs_exit +
 		      dsi->phy_timing.da_hs_prepare + dsi->phy_timing.da_hs_zero + 2) * dsi->lanes;
 	horizontal_frontporch_byte |= FIELD_PREP(HFP_HS_EN, 1) |
 				      FIELD_PREP(HFP_HS_VB_PS_WC, hs_vb_ps_wc);
 
-	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
-	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
-	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
+	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC(dsi->driver_data));
+	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC(dsi->driver_data));
+	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC(dsi->driver_data));
 }
 
 static void mtk_dsi_config_vdo_timing_per_line_lp(struct mtk_dsi *dsi)
@@ -558,24 +582,24 @@ static void mtk_dsi_config_vdo_timing_per_line_lp(struct mtk_dsi *dsi)
 			(vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
 	}
 
-	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
-	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
-	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
+	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC(dsi->driver_data));
+	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC(dsi->driver_data));
+	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC(dsi->driver_data));
 }
 
 static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 {
 	struct videomode *vm = &dsi->vm;
 
-	writel(vm->vsync_len, dsi->regs + DSI_VSA_NL);
-	writel(vm->vback_porch, dsi->regs + DSI_VBP_NL);
-	writel(vm->vfront_porch, dsi->regs + DSI_VFP_NL);
-	writel(vm->vactive, dsi->regs + DSI_VACT_NL);
+	writel(vm->vsync_len, dsi->regs + DSI_VSA_NL(dsi->driver_data));
+	writel(vm->vback_porch, dsi->regs + DSI_VBP_NL(dsi->driver_data));
+	writel(vm->vfront_porch, dsi->regs + DSI_VFP_NL(dsi->driver_data));
+	writel(vm->vactive, dsi->regs + DSI_VACT_NL(dsi->driver_data));
 
 	if (dsi->driver_data->has_size_ctl)
 		writel(FIELD_PREP(DSI_HEIGHT, vm->vactive) |
 			FIELD_PREP(DSI_WIDTH, vm->hactive),
-			dsi->regs + DSI_SIZE_CON);
+			dsi->regs + DSI_SIZE_CON(dsi->driver_data));
 
 	if (dsi->driver_data->support_per_frame_lp)
 		mtk_dsi_config_vdo_timing_per_frame_lp(dsi);
@@ -598,7 +622,7 @@ static void mtk_dsi_stop(struct mtk_dsi *dsi)
 
 static void mtk_dsi_set_cmd_mode(struct mtk_dsi *dsi)
 {
-	writel(CMD_MODE, dsi->regs + DSI_MODE_CTRL);
+	writel(CMD_MODE, dsi->regs + DSI_MODE_CTRL(dsi->driver_data));
 }
 
 static void mtk_dsi_set_interrupt_enable(struct mtk_dsi *dsi)
@@ -647,7 +671,7 @@ static irqreturn_t mtk_dsi_irq(int irq, void *dev_id)
 
 	if (status) {
 		do {
-			mtk_dsi_mask(dsi, DSI_RACK, RACK, RACK);
+			mtk_dsi_mask(dsi, DSI_RACK(dsi->driver_data), RACK, RACK);
 			tmp = readl(dsi->regs + DSI_INTSTA);
 		} while (tmp & DSI_BUSY);
 
@@ -715,7 +739,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 
 	if (dsi->driver_data->has_shadow_ctl)
 		writel(FORCE_COMMIT | BYPASS_SHADOW,
-		       dsi->regs + dsi->driver_data->reg_shadow_dbg_off);
+		       dsi->regs + DSI_SHADOW_DEBUG(dsi->driver_data));
 
 	mtk_dsi_reset_engine(dsi);
 	mtk_dsi_phy_timconfig(dsi);
@@ -757,7 +781,7 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	mtk_dsi_lane0_ulp_mode_enter(dsi);
 	mtk_dsi_clk_ulp_mode_enter(dsi);
 	/* set the lane number as 0 to pull down mipi */
-	writel(0, dsi->regs + DSI_TXRX_CTRL);
+	writel(0, dsi->regs + DSI_TXRX_CTRL(dsi->driver_data));
 
 	mtk_dsi_disable(dsi);
 
@@ -1091,10 +1115,10 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
 			     tx_buf[i] << (((i + cmdq_off) & 3U) * 8U));
 
 	mtk_dsi_mask(dsi, reg_cmdq_off, cmdq_mask, reg_val);
-	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE, cmdq_size);
+	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE(dsi->driver_data), CMDQ_SIZE, cmdq_size);
 	if (dsi->driver_data->cmdq_long_packet_ctl) {
 		/* Disable setting cmdq_size automatically for long packets */
-		mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL);
+		mtk_dsi_mask(dsi, DSI_CMDQ_SIZE(dsi->driver_data), CMDQ_SIZE_SEL, CMDQ_SIZE_SEL);
 	}
 }
 
@@ -1123,7 +1147,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	u32 dsi_mode;
 	int ret, i;
 
-	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
+	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL(dsi->driver_data));
 	if (dsi_mode & MODE) {
 		mtk_dsi_stop(dsi);
 		ret = mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
@@ -1152,7 +1176,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	}
 
 	for (i = 0; i < 16; i++)
-		*(read_data + i) = readb(dsi->regs + DSI_RX_DATA0 + i);
+		*(read_data + i) = readb(dsi->regs + DSI_RX_DATA0(dsi->driver_data) + i);
 
 	recv_cnt = mtk_dsi_recv_cnt(read_data[0], read_data);
 
@@ -1262,14 +1286,12 @@ static void mtk_dsi_remove(struct platform_device *pdev)
 
 static const struct mtk_dsi_driver_data mt8173_dsi_driver_data = {
 	.reg_cmdq_off = 0x200,
-	.reg_vm_cmd_off = 0x130,
-	.reg_shadow_dbg_off = 0x190
+	.dsi_vm_cmd_con = 0x130,
 };
 
 static const struct mtk_dsi_driver_data mt2701_dsi_driver_data = {
 	.reg_cmdq_off = 0x180,
-	.reg_vm_cmd_off = 0x130,
-	.reg_shadow_dbg_off = 0x190
+	.dsi_vm_cmd_con = 0x130,
 };
 
 static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
@@ -1278,6 +1300,7 @@ static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
 	.reg_shadow_dbg_off = 0x190,
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
+	.dsi_vm_cmd_con = 0x130,
 };
 
 static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
@@ -1286,6 +1309,7 @@ static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
 	.reg_shadow_dbg_off = 0xc00,
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
+	.dsi_vm_cmd_con = 0x130,
 };
 
 static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
@@ -1296,6 +1320,33 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 	.has_size_ctl = true,
 	.cmdq_long_packet_ctl = true,
 	.support_per_frame_lp = true,
+	.dsi_vm_cmd_con = 0x130,
+};
+
+static const struct mtk_dsi_driver_data mt8196_dsi_driver_data = {
+	.reg_cmdq_off = 0x400,
+	.has_shadow_ctl = true,
+	.has_size_ctl = true,
+	.cmdq_long_packet_ctl = true,
+	.support_per_frame_lp = true,
+	.reg_phy_base = 0x600,
+	.reg_20_ofs = 0x020,
+	.reg_30_ofs = 0x030,
+	.reg_40_ofs = 0x040,
+	.reg_100_ofs = 0x100,
+	.dsi_size_con = 0x02c,
+	.dsi_vfp_early_stop = 0x170,
+	.dsi_lfr_con = 0x1a0,
+	.dsi_cmdq_con = 0x44,
+	.dsi_type1_hs = 0x50,
+	.dsi_hstx_ckl_wc = 0x100,
+	.dsi_mem_conti = 0x048,
+	.dsi_time_con = 0x200,
+	.dsi_reserved = 0x3f8,
+	.dsi_state_dbg6 = 0x274,
+	.dsi_dbg_sel = 0x274,
+	.dsi_shadow_dbg = 0x0d0,
+	.dsi_vm_cmd_con = 0x110,
 };
 
 static const struct of_device_id mtk_dsi_of_match[] = {
@@ -1304,6 +1355,7 @@ static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
 	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
 	{ .compatible = "mediatek,mt8188-dsi", .data = &mt8188_dsi_driver_data },
+	{ .compatible = "mediatek,mt8196-dsi", .data = &mt8196_dsi_driver_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index 1b8088df71e8..ed0da708759b 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -21,4 +21,5 @@ obj-$(CONFIG_PHY_MTK_MIPI_CSI_0_5)	+= phy-mtk-mipi-csi-0-5.o
 phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8173.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8183.o
+phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8196.o
 obj-$(CONFIG_PHY_MTK_MIPI_DSI)		+= phy-mtk-mipi-dsi-drv.o
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c
new file mode 100644
index 000000000000..09c7159748d7
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: jitao.shi <jitao.shi@mediatek.com>
+ */
+
+#include "phy-mtk-io.h"
+#include "phy-mtk-mipi-dsi.h"
+
+#define MIPITX_LANE_CON		0x0004
+#define RG_DSI_CPHY_T1DRV_EN		BIT(0)
+#define RG_DSI_ANA_CK_SEL		BIT(1)
+#define RG_DSI_PHY_CK_SEL		BIT(2)
+#define RG_DSI_CPHY_EN			BIT(3)
+#define RG_DSI_PHYCK_INV_EN		BIT(4)
+#define RG_DSI_PWR04_EN			BIT(5)
+#define RG_DSI_BG_LPF_EN		BIT(6)
+#define RG_DSI_BG_CORE_EN		BIT(7)
+#define RG_DSI_PAD_TIEL_SEL		BIT(8)
+
+#define MIPITX_VOLTAGE_SEL	0x0008
+#define RG_DSI_HSTX_LDO_REF_SEL		GENMASK(9, 6)
+#define RG_DSI_PRD_REF_SEL		GENMASK(5, 0)
+#define RG_DSI_PRD_REF_MINI		0
+#define RG_DSI_PRD_REF_DEF		4
+#define RG_DSI_PRD_REF_MAX		7
+
+#define MIPITX_PRESERVED	0x000c
+
+#define MIPITX_PLL_PWR		0x0028
+#define MIPITX_PLL_CON0		0x002c
+#define MIPITX_PLL_CON1		0x0030
+#define MIPITX_PLL_CON2		0x0034
+#define MIPITX_PLL_CON3		0x0038
+#define MIPITX_PLL_CON4		0x003c
+#define RG_DSI_PLL_IBIAS		GENMASK(11, 10)
+
+#define MIPITX_PHY_SEL0		0x0040
+
+#define MIPITX_D2P_RTCODE	0x0100
+
+#define MIPITX_D2_SW_CTL_EN	0x015c
+#define MIPITX_D0_SW_CTL_EN	0x025c
+#define DSI_CK_CKMODE_EN		BIT(0)
+#define MIPITX_CK_SW_CTL_EN	0x035c
+#define MIPITX_D1_SW_CTL_EN	0x045c
+#define MIPITX_D3_SW_CTL_EN	0x055c
+#define DSI_SW_CTL_EN			BIT(0)
+#define AD_DSI_PLL_SDM_PWR_ON		BIT(0)
+#define AD_DSI_PLL_SDM_ISO_EN		BIT(1)
+
+#define MIPITX_D2_CKMODE_EN	0x0120
+#define DSI_D2_CKMODE_EN		BIT(0)
+#define MIPITX_D0_CKMODE_EN	0x0220
+#define DSI_D0_CKMODE_EN		BIT(0)
+#define MIPITX_CK_CKMODE_EN	0x0320
+#define MIPITX_D1_CKMODE_EN	0x0420
+#define DSI_D1_CKMODE_EN		BIT(0)
+#define MIPITX_D3_CKMODE_EN	0x0520
+#define DSI_D3_CKMODE_EN		BIT(0)
+
+#define RG_DSI_PLL_EN			BIT(0)
+#define RG_DSI_PLL_POSDIV		GENMASK(10, 8)
+#define RG_DSI_PLL_DIV3_EN		BIT(28)
+#define RG_DSI_PLL_FBSEL		BIT(13)
+
+#define DSI_PHY_LANE_SWAP	0x0618
+#define LANE_D0_SEL			0
+#define LANE_D1_SEL			4
+#define LANE_D2_SEL			8
+#define LANE_D3_SEL			12
+#define LANE_C0_SEL			16
+#define LANE_C1_SEL			20
+
+static int mtk_mipi_tx_pll_enable(struct clk_hw *hw)
+{
+	struct mtk_mipi_tx *mipi_tx = mtk_mipi_tx_from_clk_hw(hw);
+	void __iomem *base = mipi_tx->regs;
+	unsigned int txdiv, txdiv0;
+	u32 pcw = 0;
+
+	/* Select different voltage when different data rate */
+	if (mipi_tx->data_rate < 2500000000) {
+		mtk_phy_update_field(base + MIPITX_VOLTAGE_SEL,
+				     RG_DSI_PRD_REF_SEL, RG_DSI_PRD_REF_MINI);
+		writel(0xffff00f0, base +  MIPITX_PRESERVED);
+	} else {
+		mtk_phy_update_field(base + MIPITX_VOLTAGE_SEL,
+				     RG_DSI_PRD_REF_SEL, RG_DSI_PRD_REF_DEF);
+		writel(0xffff0030, base +  MIPITX_PRESERVED);
+	}
+
+	dev_dbg(mipi_tx->dev, "enable: %u bps\n", mipi_tx->data_rate);
+
+	if (mipi_tx->data_rate >= 2000000000) {
+		txdiv = 1;
+		txdiv0 = 0;
+	} else if (mipi_tx->data_rate >= 1000000000) {
+		txdiv = 2;
+		txdiv0 = 1;
+	} else if (mipi_tx->data_rate >= 500000000) {
+		txdiv = 4;
+		txdiv0 = 2;
+	} else if (mipi_tx->data_rate > 250000000) {
+		txdiv = 8;
+		txdiv0 = 3;
+	} else if (mipi_tx->data_rate >= 125000000) {
+		txdiv = 16;
+		txdiv0 = 4;
+	} else {
+		return -EINVAL;
+	}
+
+	mtk_phy_set_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
+	mtk_phy_clear_bits(base + MIPITX_PLL_CON1, RG_DSI_PLL_EN);
+	udelay(40);
+	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_ISO_EN);
+	pcw = div_u64(((u64)(mipi_tx->data_rate / 2) * txdiv) << 24, 26000000);
+	writel(pcw, base + MIPITX_PLL_CON0);
+	mtk_phy_update_field(base + MIPITX_PLL_CON1, RG_DSI_PLL_POSDIV, txdiv0);
+	udelay(40);
+	mtk_phy_set_bits(base + MIPITX_PLL_CON1, RG_DSI_PLL_EN);
+	udelay(40);
+
+	return 0;
+}
+
+static void mtk_mipi_tx_pll_disable(struct clk_hw *hw)
+{
+	struct mtk_mipi_tx *mipi_tx = mtk_mipi_tx_from_clk_hw(hw);
+	void __iomem *base = mipi_tx->regs;
+
+	mtk_phy_clear_bits(base + MIPITX_PLL_CON1, RG_DSI_PLL_EN);
+
+	mtk_phy_set_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_ISO_EN);
+	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
+}
+
+static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long *prate)
+{
+	return clamp_val(rate, 125000000, 1600000000);
+}
+
+static const struct clk_ops mtk_mipi_tx_pll_ops = {
+	.enable = mtk_mipi_tx_pll_enable,
+	.disable = mtk_mipi_tx_pll_disable,
+	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.set_rate = mtk_mipi_tx_pll_set_rate,
+	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
+};
+
+static void mtk_mipi_tx_power_on_signal(struct phy *phy)
+{
+	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
+	void __iomem *base = mipi_tx->regs;
+
+	/* BG_LPF_EN / BG_CORE_EN */
+	writel(RG_DSI_PAD_TIEL_SEL | RG_DSI_BG_CORE_EN, base + MIPITX_LANE_CON);
+	/* delay for mipi core enable */
+	usleep_range(30, 100);
+	writel(RG_DSI_BG_CORE_EN | RG_DSI_BG_LPF_EN, base + MIPITX_LANE_CON);
+
+	/* Switch OFF each Lane */
+	mtk_phy_clear_bits(base + MIPITX_D0_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_clear_bits(base + MIPITX_D1_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_clear_bits(base + MIPITX_D2_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_clear_bits(base + MIPITX_D3_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_clear_bits(base + MIPITX_CK_SW_CTL_EN, DSI_SW_CTL_EN);
+
+	/* The mipitx_drive is start from 3000 microamp and the range is
+	 * 3000 ~ 6000 microamp. RG_DSI_HSTX_LDO_REF_SEL is the offset from
+	 * 3000 microamp, so -3000.
+	 */
+	mtk_phy_update_field(base + MIPITX_VOLTAGE_SEL, RG_DSI_HSTX_LDO_REF_SEL,
+			     (mipi_tx->mipitx_drive - 3000) / 200);
+
+	mtk_phy_set_bits(base + MIPITX_CK_CKMODE_EN, DSI_CK_CKMODE_EN);
+}
+
+static void mtk_mipi_tx_power_off_signal(struct phy *phy)
+{
+	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
+	void __iomem *base = mipi_tx->regs;
+
+	/* Switch ON each Lane */
+	mtk_phy_set_bits(base + MIPITX_D0_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_set_bits(base + MIPITX_D1_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_set_bits(base + MIPITX_D2_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_set_bits(base + MIPITX_D3_SW_CTL_EN, DSI_SW_CTL_EN);
+	mtk_phy_set_bits(base + MIPITX_CK_SW_CTL_EN, DSI_SW_CTL_EN);
+
+	writel(RG_DSI_PAD_TIEL_SEL | RG_DSI_BG_CORE_EN, base + MIPITX_LANE_CON);
+	writel(RG_DSI_PAD_TIEL_SEL, base + MIPITX_LANE_CON);
+}
+
+const struct mtk_mipitx_data mt8196_mipitx_data = {
+	.mipi_tx_clk_ops = &mtk_mipi_tx_pll_ops,
+	.mipi_tx_enable_signal = mtk_mipi_tx_power_on_signal,
+	.mipi_tx_disable_signal = mtk_mipi_tx_power_off_signal,
+};
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 065ea626093a..46f0cb3ac096 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -183,6 +183,7 @@ static const struct of_device_id mtk_mipi_tx_match[] = {
 	{ .compatible = "mediatek,mt2701-mipi-tx", .data = &mt2701_mipitx_data },
 	{ .compatible = "mediatek,mt8173-mipi-tx", .data = &mt8173_mipitx_data },
 	{ .compatible = "mediatek,mt8183-mipi-tx", .data = &mt8183_mipitx_data },
+	{ .compatible = "mediatek,mt8196-mipi-tx", .data = &mt8196_mipitx_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_mipi_tx_match);
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
index 5d4876f1dc95..38f64e1c75aa 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
@@ -42,5 +42,6 @@ unsigned long mtk_mipi_tx_pll_recalc_rate(struct clk_hw *hw,
 extern const struct mtk_mipitx_data mt2701_mipitx_data;
 extern const struct mtk_mipitx_data mt8173_mipitx_data;
 extern const struct mtk_mipitx_data mt8183_mipitx_data;
+extern const struct mtk_mipitx_data mt8196_mipitx_data;
 
 #endif
-- 
2.45.2

