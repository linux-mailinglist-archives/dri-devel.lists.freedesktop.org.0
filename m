Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A5A93293
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 08:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE7110E415;
	Fri, 18 Apr 2025 06:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="S00/9365";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1258510E40F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 06:53:31 +0000 (UTC)
X-UUID: d23d4bfc1c2111f08eb9c36241bbb6fb-20250418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hb2ki2Eohwz2X+4gaKY62ZizM+ccBdN4ZlDffGYg7mI=; 
 b=S00/9365VNBRMfgtRESUJbZNEA30e2S/sIHlbzyJfKvutpHk8urkB0tCC8Lw2+lE9dnCvew+S47gw1OS20SbM4ekkciFwT4qTYqnHlwx0e4y1IoQlgjilaE/75y/X2ifHgSbFcq0H99di4BbFZUSO+ZfDPzligdnBOrHfFk9OeY=;
X-CID-CACHE: Type:Local,Time:202504181451+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:5db99941-562b-441a-89ad-5f7f4b2f2854, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:0f823aa6-c619-47e3-a41b-90eedbf5b947,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d23d4bfc1c2111f08eb9c36241bbb6fb-20250418
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <bincai.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 148071058; Fri, 18 Apr 2025 14:53:23 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Apr 2025 14:53:22 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Apr 2025 14:53:21 +0800
From: Bincai Liu <bincai.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Jitao shi <jitao.shi@mediatek.com>, CK Hu
 <ck.hu@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 Bincai Liu <bincai.liu@mediatek.com>
Subject: [PATCH 4/5] drm/mediatek: Add eDP driver for mt8196
Date: Fri, 18 Apr 2025 14:52:31 +0800
Message-ID: <20250418065313.8972-5-bincai.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418065313.8972-1-bincai.liu@mediatek.com>
References: <20250418065313.8972-1-bincai.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add code to support eDP 1.4 driver for mt8196.

Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 484 ++++++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_dp_reg.h | 126 +++++++
 2 files changed, 550 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index b2408abb9d49..159ab5ebb9d2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -35,6 +35,9 @@
 
 #include "mtk_dp_reg.h"
 
+#define EDP_VIDEO_UNMUTE		0x22
+#define EDP_VIDEO_UNMUTE_VAL		0xfefd
+#define MTK_SIP_DP_CONTROL		(0x82000523 | 0x40000000)
 #define MTK_DP_SIP_CONTROL_AARCH32	MTK_SIP_SMC_CMD(0x523)
 #define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
 #define MTK_DP_SIP_ATF_VIDEO_UNMUTE	BIT(5)
@@ -51,6 +54,7 @@
 #define MTK_DP_TRAIN_DOWNSCALE_RETRY 10
 #define MTK_DP_VERSION 0x11
 #define MTK_DP_SDP_AUI 0x4
+#define EDP_REINIT_TIMES 4
 
 enum {
 	MTK_DP_CAL_GLB_BIAS_TRIM = 0,
@@ -102,6 +106,7 @@ struct mtk_dp {
 	bool enabled;
 	bool need_debounce;
 	int irq;
+	int swing_value;
 	u8 max_lanes;
 	u8 max_linkrate;
 	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
@@ -110,6 +115,8 @@ struct mtk_dp {
 	/* irq_thread_lock is used to protect irq_thread_handle */
 	spinlock_t irq_thread_lock;
 
+	struct clk *power_clk;
+
 	struct device *dev;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
@@ -124,6 +131,7 @@ struct mtk_dp {
 	struct platform_device *phy_dev;
 	struct phy *phy;
 	struct regmap *regs;
+	struct regmap *phy_regs;
 	struct timer_list debounce_timer;
 
 	/* For audio */
@@ -134,6 +142,9 @@ struct mtk_dp {
 	struct device *codec_dev;
 	/* protect the plugged_cb as it's used in both bridge ops and audio */
 	struct mutex update_plugged_status_lock;
+	/* For edp power control */
+	void __iomem *pwr_regs;
+	u32 retry_times;
 };
 
 struct mtk_dp_data {
@@ -143,6 +154,7 @@ struct mtk_dp_data {
 	bool audio_supported;
 	bool audio_pkt_in_hblank_area;
 	u16 audio_m_div2_bit;
+	u32 edp_ver;
 };
 
 static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
@@ -402,6 +414,16 @@ static const struct regmap_config mtk_dp_regmap_config = {
 	.name = "mtk-dp-registers",
 };
 
+static const struct regmap_config mtk_edp_phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = SEC_OFFSET + 0x90,
+	.name = "mtk-edp-phy-registers",
+};
+
+static int mtk_dp_poweron(struct mtk_dp *mtk_dp);
+
 static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
 {
 	return container_of(b, struct mtk_dp, bridge);
@@ -459,6 +481,26 @@ static void mtk_dp_bulk_16bit_write(struct mtk_dp *mtk_dp, u32 offset, u8 *buf,
 	}
 }
 
+static void mtk_edp_pm_ctl(struct mtk_dp *mtk_dp, bool enable)
+{
+	/* DISP_EDPTX_PWR_CON udelay 10us to ensure that the power state is stable */
+	udelay(10);
+	if (enable) {
+		/* Enable subsys clock, just set bit4 to 0 */
+		writel(readl(mtk_dp->pwr_regs) & ~DISP_EDPTX_PWR_CLK_DIS, mtk_dp->pwr_regs);
+		udelay(1);
+		/* Subsys power-on reset, firstly set bit0 to 0 and then set bit0 to 1 */
+		writel(readl(mtk_dp->pwr_regs) & ~DISP_EDPTX_PWR_RST_B, mtk_dp->pwr_regs);
+		udelay(1);
+		writel(readl(mtk_dp->pwr_regs) | DISP_EDPTX_PWR_RST_B, mtk_dp->pwr_regs);
+	} else {
+		writel(readl(mtk_dp->pwr_regs) & ~DISP_EDPTX_PWR_RST_B, mtk_dp->pwr_regs);
+		udelay(1);
+		writel(readl(mtk_dp->pwr_regs) | DISP_EDPTX_PWR_CLK_DIS, mtk_dp->pwr_regs);
+	}
+	udelay(10);
+}
+
 static void mtk_dp_msa_bypass_enable(struct mtk_dp *mtk_dp, bool enable)
 {
 	u32 mask = HTOTAL_SEL_DP_ENC0_P0 | VTOTAL_SEL_DP_ENC0_P0 |
@@ -514,9 +556,14 @@ static void mtk_dp_set_msa(struct mtk_dp *mtk_dp)
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_315C,
 			   vm->hsync_len,
 			   PGEN_HSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK);
-	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3160,
-			   vm->hback_porch + vm->hsync_len,
-			   PGEN_HFDE_START_DP_ENC0_P0_MASK);
+	if (mtk_dp->data->edp_ver)
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3160,
+				   vm->hback_porch + vm->hsync_len + vm->hfront_porch,
+				   PGEN_HFDE_START_DP_ENC0_P0_MASK);
+	else
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3160,
+				   vm->hback_porch + vm->hsync_len,
+				   PGEN_HFDE_START_DP_ENC0_P0_MASK);
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3164,
 			   vm->hactive,
 			   PGEN_HFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK);
@@ -531,9 +578,14 @@ static void mtk_dp_set_msa(struct mtk_dp *mtk_dp)
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3170,
 			   vm->vsync_len,
 			   PGEN_VSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK);
-	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3174,
-			   vm->vback_porch + vm->vsync_len,
-			   PGEN_VFDE_START_DP_ENC0_P0_MASK);
+	if (mtk_dp->data->edp_ver)
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3174,
+				   vm->vback_porch + vm->vsync_len +  vm->vfront_porch,
+				   PGEN_VFDE_START_DP_ENC0_P0_MASK);
+	else
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3174,
+				   vm->vback_porch + vm->vsync_len,
+				   PGEN_VFDE_START_DP_ENC0_P0_MASK);
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3178,
 			   vm->vactive,
 			   PGEN_VFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK);
@@ -543,7 +595,7 @@ static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
 				   enum dp_pixelformat color_format)
 {
 	u32 val;
-	u32 misc0_color;
+	u32 misc0_color = 0;
 
 	switch (color_format) {
 	case DP_PIXELFORMAT_YUV422:
@@ -554,6 +606,9 @@ static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
 		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
 		misc0_color = DP_COLOR_FORMAT_RGB;
 		break;
+	case DP_PIXELFORMAT_YUV420:
+		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420;
+		break;
 	default:
 		drm_warn(mtk_dp->drm_dev, "Unsupported color format: %d\n",
 			 color_format);
@@ -612,7 +667,8 @@ static void mtk_dp_setup_encoder(struct mtk_dp *mtk_dp)
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3364,
 			   FIFO_READ_START_POINT_DP_ENC1_P0_VAL << 12,
 			   FIFO_READ_START_POINT_DP_ENC1_P0_MASK);
-	mtk_dp_write(mtk_dp, MTK_DP_ENC1_P0_3368, DP_ENC1_P0_3368_VAL);
+	if (!mtk_dp->data->edp_ver)
+		mtk_dp_write(mtk_dp, MTK_DP_ENC1_P0_3368, DP_ENC1_P0_3368_VAL);
 }
 
 static void mtk_dp_pg_enable(struct mtk_dp *mtk_dp, bool enable)
@@ -972,8 +1028,8 @@ static void mtk_dp_set_swing_pre_emphasis(struct mtk_dp *mtk_dp, int lane_num,
 	u32 lane_shift = lane_num * DP_TX1_VOLT_SWING_SHIFT;
 
 	dev_dbg(mtk_dp->dev,
-		"link training: swing_val = 0x%x, pre-emphasis = 0x%x\n",
-		swing_val, preemphasis);
+		"link training: swing_val = 0x%x, pre-emphasis = 0x%x lane_num = %d\n",
+		swing_val, preemphasis, lane_num);
 
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP,
 			   swing_val << (DP_TX0_VOLT_SWING_SHIFT + lane_shift),
@@ -981,6 +1037,28 @@ static void mtk_dp_set_swing_pre_emphasis(struct mtk_dp *mtk_dp, int lane_num,
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP,
 			   preemphasis << (DP_TX0_PRE_EMPH_SHIFT + lane_shift),
 			   DP_TX0_PRE_EMPH_MASK << lane_shift);
+	if (mtk_dp->data->edp_ver && mtk_dp->phy_regs) {
+		/* set swing and pre */
+		switch (lane_num) {
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+			regmap_update_bits(mtk_dp->phy_regs,
+					   PHYD_DIG_DRV_FORCE_LANE(lane_num),
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   swing_val << 1 |
+					   preemphasis << 3);
+			break;
+		default:
+			break;
+		}
+		if (preemphasis != 0)
+			mtk_dp_update_bits(mtk_dp, RG_DSI_DEM_EN,
+					   DSI_DE_EMPHASIS_ENABLE,
+					   DSI_DE_EMPHASIS_ENABLE);
+	}
 }
 
 static void mtk_dp_reset_swing_pre_emphasis(struct mtk_dp *mtk_dp)
@@ -1039,6 +1117,44 @@ static void mtk_dp_hwirq_enable(struct mtk_dp *mtk_dp, bool enable)
 
 static void mtk_dp_initialize_settings(struct mtk_dp *mtk_dp)
 {
+	if (mtk_dp->data->edp_ver) {
+		mtk_dp_update_bits(mtk_dp, REG_3F04_DP_ENC_P0_3, 0,
+				   FRAME_START_MARKER_0_DP_ENC_P0_3_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_3F08_DP_ENC_P0_3,
+				   FRAME_START_MARKER_1_DP_ENC_P0_3,
+				   FRAME_START_MARKER_1_DP_ENC_P0_3_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_3F0C_DP_ENC_P0_3,
+				   FRAME_END_MARKER_0_DP_ENC_P0_3,
+				   FRAME_END_MARKER_0_DP_ENC_P0_3_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_3F10_DP_ENC_P0_3,
+				   FRAME_END_MARKER_1_DP_ENC_P0_3,
+				   FRAME_END_MARKER_1_DP_ENC_P0_3_MASK);
+
+		mtk_dp_update_bits(mtk_dp, REG_33C0_DP_ENCODER1_P0, 0,
+				   SDP_TESTBUS_SEL_DP_ENC_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_33C0_DP_ENCODER1_P0,
+				   SDP_TESTBUS_SEL_BIT4_DP_ENC,
+				   SDP_TESTBUS_SEL_BIT4_DP_ENC_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_33C4_DP_ENCODER1_P0,
+				   DP_TX_ENCODER_TESTBUS_SEL_DP_ENC,
+				   DP_TX_ENCODER_TESTBUS_SEL_DP_ENC_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_3F28_DP_ENC_P0_3,
+				   DP_TX_SDP_PSR_AS_TESTBUS,
+				   DP_TX_SDP_PSR_AS_TESTBUS_MASK);
+		mtk_dp_update_bits(mtk_dp, DP_TX_TOP_RESET_AND_PROBE,
+				   RG_SW_RST,
+				   RG_SW_RST_MASK);
+		mtk_dp_update_bits(mtk_dp, DP_TX_TOP_RESET_AND_PROBE,
+				   RG_PROBE_LOW_SEL,
+				   RG_PROBE_LOW_SEL_MASK);
+		mtk_dp_update_bits(mtk_dp, DP_TX_TOP_RESET_AND_PROBE,
+				   RG_PROBE_LOW_HIGH_SWAP,
+				   RG_PROBE_LOW_HIGH_SWAP_MASK);
+
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_IRQ_MASK,
+				   ENCODER_IRQ_MSK | TRANS_IRQ_MSK,
+				   ENCODER_IRQ_MSK | TRANS_IRQ_MSK);
+	}
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_342C,
 			   XTAL_FREQ_DP_TRANS_P0_DEFAULT,
 			   XTAL_FREQ_DP_TRANS_P0_MASK);
@@ -1057,27 +1173,34 @@ static void mtk_dp_initialize_settings(struct mtk_dp *mtk_dp)
 static void mtk_dp_initialize_hpd_detect_settings(struct mtk_dp *mtk_dp)
 {
 	u32 val;
-	/* Debounce threshold */
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
-			   8, HPD_DEB_THD_DP_TRANS_P0_MASK);
 
-	val = (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
-	       HPD_INT_THD_DP_TRANS_P0_UPPER_1100US) << 4;
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
-			   val, HPD_INT_THD_DP_TRANS_P0_MASK);
+	if (mtk_dp->data->edp_ver) {
+		mtk_dp_update_bits(mtk_dp, REG_364C_AUX_TX_P0,
+				   HPD_INT_THD_FLDMASK_VAL << 4,
+				   HPD_INT_THD_FLDMASK);
+	} else {
+		/* Debounce threshold */
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+				   8, HPD_DEB_THD_DP_TRANS_P0_MASK);
 
-	/*
-	 * Connect threshold 1.5ms + 5 x 0.1ms = 2ms
-	 * Disconnect threshold 1.5ms + 5 x 0.1ms = 2ms
-	 */
-	val = (5 << 8) | (5 << 12);
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
-			   val,
-			   HPD_DISC_THD_DP_TRANS_P0_MASK |
-			   HPD_CONN_THD_DP_TRANS_P0_MASK);
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3430,
-			   HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT,
-			   HPD_INT_THD_ECO_DP_TRANS_P0_MASK);
+		val = (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
+		       HPD_INT_THD_DP_TRANS_P0_UPPER_1100US) << 4;
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+				   val, HPD_INT_THD_DP_TRANS_P0_MASK);
+
+		/*
+		 * Connect threshold 1.5ms + 5 x 0.1ms = 2ms
+		 * Disconnect threshold 1.5ms + 5 x 0.1ms = 2ms
+		 */
+		val = (5 << 8) | (5 << 12);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
+				   val,
+				   HPD_DISC_THD_DP_TRANS_P0_MASK |
+				   HPD_CONN_THD_DP_TRANS_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3430,
+				   HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT,
+				   HPD_INT_THD_ECO_DP_TRANS_P0_MASK);
+	}
 }
 
 static void mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
@@ -1088,6 +1211,10 @@ static void mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
 			   AUX_TIMEOUT_THR_AUX_TX_P0_MASK);
 	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3658,
 			   0, AUX_TX_OV_EN_AUX_TX_P0_MASK);
+	if (mtk_dp->data->edp_ver)
+		mtk_dp_update_bits(mtk_dp, REG_36A0_AUX_TX_P0,
+				   DP_TX_INIT_MASK_15_TO_2,
+				   DP_TX_INIT_MASK_15_TO_2_MASK);
 	/* 25 for 26M */
 	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3634,
 			   AUX_TX_OVER_SAMPLE_RATE_FOR_26M << 8,
@@ -1104,6 +1231,46 @@ static void mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
 	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3690,
 			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0,
 			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0);
+
+	if (mtk_dp->data->edp_ver) {
+		/*Con Thd = 1.5ms+Vx0.1ms*/
+		mtk_dp_update_bits(mtk_dp, REG_367C_AUX_TX_P0,
+				   HPD_CONN_THD_AUX_TX_P0_FLDMASK_POS << 6,
+				   HPD_CONN_THD_AUX_TX_P0_FLDMASK);
+		/*DisCon Thd = 1.5ms+Vx0.1ms*/
+		mtk_dp_update_bits(mtk_dp, REG_37A0_AUX_TX_P0,
+				   HPD_DISC_THD_AUX_TX_P0_FLDMASK_POS << 4,
+				   HPD_DISC_THD_AUX_TX_P0_FLDMASK);
+		mtk_dp_update_bits(mtk_dp, REG_3FF8_DP_ENC_P0_3,
+				   XTAL_FREQ_FOR_PSR_DP_ENC_P0_3_VALUE << 9,
+				   XTAL_FREQ_FOR_PSR_DP_ENC_P0_3_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_366C_AUX_TX_P0,
+				   XTAL_FREQ_DP_TX_AUX_366C_VALUE << 8,
+				   XTAL_FREQ_DP_TX_AUX_366C_MASK);
+	}
+}
+
+static void mtk_edp_phyd_wait_aux_ldo_ready(struct mtk_dp *mtk_dp,
+					    unsigned long wait_us)
+{
+	int ret = 0;
+	u32 val = 0x0;
+	u32 mask = RGS_BG_CORE_EN_READY | RGS_AUX_LDO_EN_READY;
+
+	if (mtk_dp->phy_regs) {
+		ret = regmap_read_poll_timeout(mtk_dp->phy_regs,
+					       DP_PHY_DIG_GLB_STATUS_0,
+					       val, !!(val & mask),
+					       wait_us / 100, wait_us);
+	} else {
+		ret = regmap_read_poll_timeout(mtk_dp->regs,
+					       DP_PHY_DIG_GLB_STATUS_0,
+					       val, !!(val & mask),
+					       wait_us / 100, wait_us);
+	}
+
+	if (ret)
+		dev_err(mtk_dp->dev, "%s AUX not ready\n", __func__);
 }
 
 static void mtk_dp_initialize_digital_settings(struct mtk_dp *mtk_dp)
@@ -1115,15 +1282,63 @@ static void mtk_dp_initialize_digital_settings(struct mtk_dp *mtk_dp)
 			   BS2BS_MODE_DP_ENC1_P0_VAL << 12,
 			   BS2BS_MODE_DP_ENC1_P0_MASK);
 
+	if (mtk_dp->data->edp_ver) {
+		/* dp I-mode enable */
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000,
+				   DP_I_MODE_ENABLE, DP_I_MODE_ENABLE);
+		/*symbol_cnt_reset */
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000,
+				   REG_BS_SYMBOL_CNT_RESET,
+				   REG_BS_SYMBOL_CNT_RESET);
+		mtk_dp_update_bits(mtk_dp, REG_3368_DP_ENCODER1_P0,
+				   VIDEO_SRAM_FIFO_CNT_RESET_SEL_VALUE,
+				   VIDEO_SRAM_FIFO_CNT_RESET_SEL_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_3368_DP_ENCODER1_P0,
+				   BS_FOLLOW_SEL_DP_ENC0_P0,
+				   BS_FOLLOW_SEL_DP_ENC0_P0);
+		/*[5:0]video sram start address*/
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
+				   SRAM_START_READ_THRD_DP_ENC0_P0_VALUE,
+				   SRAM_START_READ_THRD_DP_ENC0_P0_MASK);
+		/* reg_psr_patgen_avt_en disable psr pattern */
+		mtk_dp_update_bits(mtk_dp, REG_3F80_DP_ENC_P0_3,
+				   0, PSR_PATGEN_AVT_EN_FLDMASK);
+		/* phy D enable */
+		mtk_dp_update_bits(mtk_dp, REG_3F44_DP_ENC_P0_3,
+				   PHY_PWR_STATE_OW_EN_DP_ENC_P0_3,
+				   PHY_PWR_STATE_OW_EN_DP_ENC_P0_3_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_3F44_DP_ENC_P0_3,
+				   ALL_POWER_ON,
+				   PHY_PWR_STATE_OW_VALUE_DP_ENC_P0_3_MASK);
+		mtk_edp_phyd_wait_aux_ldo_ready(mtk_dp, 100000);
+		mtk_dp_update_bits(mtk_dp, REG_3F44_DP_ENC_P0_3,
+				   0, PHY_PWR_STATE_OW_EN_DP_ENC_P0_3_MASK);
+
+		mtk_dp_update_bits(mtk_dp, REG_3FF8_DP_ENC_P0_3,
+				   PHY_STATE_W_1_DP_ENC_P0_3,
+				   PHY_STATE_W_1_DP_ENC_P0_3_MASK);
+		/* reg_dvo_on_ow_en */
+		mtk_dp_update_bits(mtk_dp, REG_3FF8_DP_ENC_P0_3,
+				   DVO_ON_W_1_FLDMASK,
+				   DVO_ON_W_1_FLDMASK);
+	}
 	/* dp tx encoder reset all sw */
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
 			   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0,
 			   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0);
+	if (mtk_dp->data->edp_ver) {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
+				   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0);
+		mtk_dp_update_bits(mtk_dp, REG_3FF8_DP_ENC_P0_3,
+				   PHY_STATE_RESET_ALL_VALUE,
+				   PHY_STATE_RESET_ALL_MASK);
+	}
 
 	/* Wait for sw reset to complete */
 	usleep_range(1000, 5000);
-	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
-			   0, DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0);
+	if (!mtk_dp->data->edp_ver)
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
+				   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0);
 }
 
 static void mtk_dp_digital_sw_reset(struct mtk_dp *mtk_dp)
@@ -1152,6 +1367,19 @@ static void mtk_dp_sdp_path_reset(struct mtk_dp *mtk_dp)
 
 static void mtk_dp_set_lanes(struct mtk_dp *mtk_dp, int lanes)
 {
+	if (mtk_dp->data->edp_ver) {
+		mtk_dp_update_bits(mtk_dp, REG_3F44_DP_ENC_P0_3,
+				   PHY_PWR_STATE_OW_EN_DP_ENC_P0_3,
+				   PHY_PWR_STATE_OW_EN_DP_ENC_P0_3_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_3F44_DP_ENC_P0_3,
+				   BIAS_POWER_ON,
+				   PHY_PWR_STATE_OW_VALUE_DP_ENC_P0_3_MASK);
+
+		mtk_edp_phyd_wait_aux_ldo_ready(mtk_dp, 100000);
+
+		mtk_dp_update_bits(mtk_dp, REG_3F44_DP_ENC_P0_3,
+				   0, PHY_PWR_STATE_OW_EN_DP_ENC_P0_3_MASK);
+	}
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35F0,
 			   lanes == 0 ? 0 : DP_TRANS_DUMMY_RW_0,
 			   DP_TRANS_DUMMY_RW_0_MASK);
@@ -1266,15 +1494,20 @@ static int mtk_dp_phy_configure(struct mtk_dp *mtk_dp,
 			.ssc = mtk_dp->train_info.sink_ssc,
 		}
 	};
-
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
-			   DP_PWR_STATE_MASK);
+	if (!mtk_dp->data->edp_ver)
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+				   DP_PWR_STATE_BANDGAP, DP_PWR_STATE_MASK);
 
 	ret = phy_configure(mtk_dp->phy, &phy_opts);
 	if (ret)
 		return ret;
 
 	mtk_dp_set_calibration_data(mtk_dp);
+	/* Turn on phy power after phy configure */
+	if (mtk_dp->data->edp_ver)
+		mtk_dp_update_bits(mtk_dp, REG_3FF8_DP_ENC_P0_3,
+				   PHY_STATE_W_1_DP_ENC_P0_3,
+				   PHY_STATE_W_1_DP_ENC_P0_3_MASK);
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
 			   DP_PWR_STATE_BANDGAP_TPLL_LANE, DP_PWR_STATE_MASK);
 
@@ -1326,16 +1559,20 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 	struct arm_smccc_res res;
 	u32 val = VIDEO_MUTE_SEL_DP_ENC0_P0 |
 		  (enable ? VIDEO_MUTE_SW_DP_ENC0_P0 : 0);
+	u32 smmc_para;
 
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000,
 			   val,
 			   VIDEO_MUTE_SEL_DP_ENC0_P0 |
 			   VIDEO_MUTE_SW_DP_ENC0_P0);
-
-	arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32,
-		      mtk_dp->data->smc_cmd, enable,
-		      0, 0, 0, 0, 0, &res);
-
+	if (mtk_dp->data->edp_ver) {
+		smmc_para = (EDP_VIDEO_UNMUTE << 16) | enable;
+		arm_smccc_smc(MTK_SIP_DP_CONTROL, EDP_VIDEO_UNMUTE, enable,
+			      smmc_para, EDP_VIDEO_UNMUTE_VAL, 0, 0, 0, &res);
+	} else {
+		arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32,
+			      mtk_dp->data->smc_cmd, enable, 0, 0, 0, 0, 0, &res);
+	}
 	dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: %s, ret: 0x%lx-0x%lx\n",
 		mtk_dp->data->smc_cmd, enable ? "enable" : "disable", res.a0, res.a1);
 }
@@ -1410,6 +1647,16 @@ static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
 static void mtk_dp_power_disable(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
+	if (mtk_dp->data->edp_ver) {
+		mtk_dp_update_bits(mtk_dp, REG_3F44_DP_ENC_P0_3,
+				   PHY_PWR_STATE_OW_EN_DP_ENC_P0_3,
+				   PHY_PWR_STATE_OW_EN_DP_ENC_P0_3_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_3F44_DP_ENC_P0_3,
+				   ALL_POWER_OFF,
+				   PHY_PWR_STATE_OW_VALUE_DP_ENC_P0_3_MASK);
+		mtk_dp_update_bits(mtk_dp, REG_3F44_DP_ENC_P0_3,
+				   0, PHY_PWR_STATE_OW_EN_DP_ENC_P0_3_MASK);
+	}
 
 	mtk_dp_update_bits(mtk_dp, MTK_DP_0034,
 			   DA_CKM_CKTX0_EN_FORCE_EN, DA_CKM_CKTX0_EN_FORCE_EN);
@@ -1424,9 +1671,13 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 {
 	bool plugged_in = (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP);
 
-	mtk_dp->train_info.link_rate = DP_LINK_BW_5_4;
+	if (mtk_dp->data->edp_ver)
+		mtk_dp->train_info.link_rate = DP_LINK_BW_8_1;
+	else
+		mtk_dp->train_info.link_rate = DP_LINK_BW_5_4;
 	mtk_dp->train_info.lane_count = mtk_dp->max_lanes;
 	mtk_dp->train_info.cable_plugged_in = plugged_in;
+	mtk_dp->train_info.sink_ssc = false;
 
 	mtk_dp->info.format = DP_PIXELFORMAT_RGB;
 	memset(&mtk_dp->info.vm, 0, sizeof(struct videomode));
@@ -1545,11 +1796,15 @@ static void mtk_dp_train_update_swing_pre(struct mtk_dp *mtk_dp, int lanes,
 		int index = lane / 2;
 		int shift = lane % 2 ? DP_ADJUST_VOLTAGE_SWING_LANE1_SHIFT : 0;
 
-		swing = (dpcd_adjust_req[index] >> shift) &
-			DP_ADJUST_VOLTAGE_SWING_LANE0_MASK;
+		if (mtk_dp->swing_value != 0) {
+			swing = mtk_dp->swing_value;
+		} else {
+			swing = (dpcd_adjust_req[index] >> shift) &
+				DP_ADJUST_VOLTAGE_SWING_LANE0_MASK;
+		}
 		preemphasis = ((dpcd_adjust_req[index] >> shift) &
-			       DP_ADJUST_PRE_EMPHASIS_LANE0_MASK) >>
-			      DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT;
+				DP_ADJUST_PRE_EMPHASIS_LANE0_MASK) >>
+				DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT;
 		val = swing << DP_TRAIN_VOLTAGE_SWING_SHIFT |
 		      preemphasis << DP_TRAIN_PRE_EMPHASIS_SHIFT;
 
@@ -1969,6 +2224,11 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
 	mtk_dp_initialize_hpd_detect_settings(mtk_dp);
 
 	mtk_dp_digital_sw_reset(mtk_dp);
+
+	if (mtk_dp->data->edp_ver)
+		mtk_dp_update_bits(mtk_dp, EDP_TX_TOP_CLKGEN_0,
+				   EDP_TX_TOP_CLKGEN_REST_VALUE,
+				   EDP_TX_TOP_CLKGEN_REST_MASK);
 }
 
 static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
@@ -2047,9 +2307,15 @@ static int mtk_dp_wait_hpd_asserted(struct drm_dp_aux *mtk_aux, unsigned long wa
 	u32 val;
 	int ret;
 
-	ret = regmap_read_poll_timeout(mtk_dp->regs, MTK_DP_TRANS_P0_3414,
-				       val, !!(val & HPD_DB_DP_TRANS_P0_MASK),
-				       wait_us / 100, wait_us);
+	if (mtk_dp->data->edp_ver)
+		ret = regmap_read_poll_timeout(mtk_dp->regs, REG_364C_AUX_TX_P0,
+					       val, !!(val & HPD_STATUS_DP_AUX_TX_P0_MASK),
+					       wait_us / 100, wait_us);
+	else
+		ret = regmap_read_poll_timeout(mtk_dp->regs, MTK_DP_TRANS_P0_3414,
+					       val, !!(val & HPD_DB_DP_TRANS_P0_MASK),
+					       wait_us / 100, wait_us);
+
 	if (ret) {
 		mtk_dp->train_info.cable_plugged_in = false;
 		return ret;
@@ -2072,7 +2338,10 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	struct device_node *endpoint;
 	struct device *dev = &pdev->dev;
 	int ret;
+	int level;
+	struct resource *regs;
 	void __iomem *base;
+	void __iomem *phy_base;
 	u32 linkrate;
 	int len;
 
@@ -2084,6 +2353,22 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	if (IS_ERR(mtk_dp->regs))
 		return PTR_ERR(mtk_dp->regs);
 
+	phy_base = devm_platform_ioremap_resource(pdev, 1);
+	if (!IS_ERR_OR_NULL(phy_base)) {
+		mtk_dp->phy_regs = devm_regmap_init_mmio(dev, phy_base,
+					&mtk_edp_phy_regmap_config);
+		if (IS_ERR(mtk_dp->phy_regs))
+			mtk_dp->phy_regs = NULL;
+	}
+
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 2);
+	if (!IS_ERR_OR_NULL(regs)) {
+		mtk_dp->pwr_regs = devm_ioremap(&pdev->dev, regs->start, 0x4);
+		if (IS_ERR(mtk_dp->pwr_regs))
+			dev_err(dev, "Failed to get pwr_regs: %ld\n",
+				PTR_ERR(mtk_dp->pwr_regs));
+	}
+
 	endpoint = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 1, -1);
 	len = of_property_count_elems_of_size(endpoint,
 					      "data-lanes", sizeof(u32));
@@ -2102,6 +2387,11 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 
 	mtk_dp->max_linkrate = drm_dp_link_rate_to_bw_code(linkrate * 100);
 
+	if (of_get_property(dev->of_node, "swing-level", &level)) {
+		of_property_read_u32(dev->of_node,
+				     "swing-level", &mtk_dp->swing_value);
+	}
+
 	return 0;
 }
 
@@ -2672,17 +2962,28 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
 {
 	struct device *dev = mtk_dp->dev;
 
-	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
-							PLATFORM_DEVID_AUTO,
-							&mtk_dp->regs,
-							sizeof(struct regmap *));
+	if (mtk_dp->phy_regs)
+		mtk_dp->phy_dev = platform_device_register_data(dev,
+					"mediatek-edp-phy",
+					PLATFORM_DEVID_AUTO,
+					&mtk_dp->phy_regs,
+					sizeof(struct regmap *));
+	else
+		mtk_dp->phy_dev = platform_device_register_data(dev,
+					"mediatek-dp-phy",
+					PLATFORM_DEVID_AUTO,
+					&mtk_dp->regs,
+					sizeof(struct regmap *));
 	if (IS_ERR(mtk_dp->phy_dev))
 		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
 				     "Failed to create device mediatek-dp-phy\n");
 
 	mtk_dp_get_calibration_data(mtk_dp);
 
-	mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
+	if (mtk_dp->data->edp_ver)
+		mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "edp");
+	else
+		mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
 	if (IS_ERR(mtk_dp->phy)) {
 		platform_device_unregister(mtk_dp->phy_dev);
 		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy), "Failed to get phy\n");
@@ -2770,6 +3071,20 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->aux.wait_hpd_asserted = mtk_dp_wait_hpd_asserted;
 	drm_dp_aux_init(&mtk_dp->aux);
 
+	mtk_dp->power_clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(mtk_dp->power_clk)) {
+		dev_info(dev, "Failed to get optional clock power_clk\n");
+		mtk_dp->power_clk = NULL;
+	}
+
+	if (mtk_dp->power_clk)
+		clk_prepare_enable(mtk_dp->power_clk);
+
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+	if (mtk_dp->pwr_regs)
+		mtk_edp_pm_ctl(mtk_dp, true);
+
 	platform_set_drvdata(pdev, mtk_dp);
 
 	if (mtk_dp->data->audio_supported) {
@@ -2795,10 +3110,13 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		 * properly close the eDP port to avoid stalls and then
 		 * reinitialize, reset and power on the AUX block.
 		 */
-		mtk_dp_set_idle_pattern(mtk_dp, true);
-		mtk_dp_initialize_aux_settings(mtk_dp);
-		mtk_dp_power_enable(mtk_dp);
-
+		if (mtk_dp->data->edp_ver) {
+			mtk_dp_poweron(mtk_dp);
+		} else {
+			mtk_dp_set_idle_pattern(mtk_dp, true);
+			mtk_dp_initialize_aux_settings(mtk_dp);
+			mtk_dp_power_enable(mtk_dp);
+		}
 		/* Disable HW interrupts: we don't need any for eDP */
 		mtk_dp_hwirq_enable(mtk_dp, false);
 
@@ -2835,8 +3153,8 @@ static int mtk_dp_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "Failed to add bridge\n");
 	}
 
-	pm_runtime_enable(dev);
-	pm_runtime_get_sync(dev);
+	dev_dbg(dev, "%s power.usage_count %d\n",
+		__func__, atomic_read(&dev->power.usage_count));
 
 	return 0;
 }
@@ -2847,6 +3165,7 @@ static void mtk_dp_remove(struct platform_device *pdev)
 
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+
 	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP)
 		timer_delete_sync(&mtk_dp->debounce_timer);
 	platform_device_unregister(mtk_dp->phy_dev);
@@ -2859,10 +3178,23 @@ static int mtk_dp_suspend(struct device *dev)
 {
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
 
+	dev_dbg(mtk_dp->dev, "%s usage_count %d\n",
+		__func__, atomic_read(&dev->power.usage_count));
+
 	mtk_dp_power_disable(mtk_dp);
 	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
 		mtk_dp_hwirq_enable(mtk_dp, false);
-	pm_runtime_put_sync(dev);
+
+	if (mtk_dp->power_clk)
+		clk_disable_unprepare(mtk_dp->power_clk);
+
+	if (mtk_dp->pwr_regs)
+		mtk_edp_pm_ctl(mtk_dp, false);
+
+	pm_runtime_force_suspend(dev);
+
+	dev_dbg(mtk_dp->dev, "%s usage_count %d\n", __func__,
+		atomic_read(&dev->power.usage_count));
 
 	return 0;
 }
@@ -2870,13 +3202,32 @@ static int mtk_dp_suspend(struct device *dev)
 static int mtk_dp_resume(struct device *dev)
 {
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+	int ret;
 
-	pm_runtime_get_sync(dev);
+	dev_dbg(mtk_dp->dev, "%s usage_count %d\n", __func__,
+		atomic_read(&dev->power.usage_count));
+
+	pm_runtime_force_resume(dev);
+
+	if (mtk_dp->power_clk)
+		clk_prepare_enable(mtk_dp->power_clk);
+	if (mtk_dp->pwr_regs)
+		mtk_edp_pm_ctl(mtk_dp, true);
+
+	ret = phy_init(mtk_dp->phy);
+	if (ret) {
+		dev_err(mtk_dp->dev, "Failed to initialize phy: %d\n", ret);
+		return ret;
+	}
+	mtk_dp->retry_times = 0;
 	mtk_dp_init_port(mtk_dp);
 	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
 		mtk_dp_hwirq_enable(mtk_dp, true);
 	mtk_dp_power_enable(mtk_dp);
 
+	dev_dbg(mtk_dp->dev, "%s usage_count %d\n", __func__,
+		atomic_read(&dev->power.usage_count));
+
 	return 0;
 }
 #endif
@@ -2908,6 +3259,15 @@ static const struct mtk_dp_data mt8195_dp_data = {
 	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
 };
 
+static const struct mtk_dp_data mt8196_edp_data = {
+	.bridge_type = DRM_MODE_CONNECTOR_eDP,
+	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
+	.efuse_fmt = mt8195_edp_efuse_fmt,
+	.audio_supported = false,
+	.audio_m_div2_bit = MT8195_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+	.edp_ver = 1,
+};
+
 static const struct of_device_id mtk_dp_of_match[] = {
 	{
 		.compatible = "mediatek,mt8188-edp-tx",
@@ -2925,6 +3285,10 @@ static const struct of_device_id mtk_dp_of_match[] = {
 		.compatible = "mediatek,mt8195-dp-tx",
 		.data = &mt8195_dp_data,
 	},
+	{
+		.compatible = "mediatek,mt8196-edp-tx",
+		.data = &mt8196_edp_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 8ad7a9cc259e..bacf2d239eac 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -12,11 +12,22 @@
 #define MTK_DP_HPD_CONNECT		BIT(2)
 #define MTK_DP_HPD_INTERRUPT		BIT(3)
 
+#define MTK_EDP_HPD_DISCONNECT		BIT(10)
+#define MTK_EDP_HPD_CONNECT		BIT(0)
+#define MTK_EDP_HPD_INTERRUPT		BIT(2)
+
 /* offset: 0x0 */
 #define DP_PHY_GLB_BIAS_GEN_00		0x0
 #define RG_XTP_GLB_BIAS_INTR_CTRL		GENMASK(20, 16)
 #define DP_PHY_GLB_DPAUX_TX		0x8
 #define RG_CKM_PT0_CKTX_IMPSEL			GENMASK(23, 20)
+#define DP_TX_TOP_RESET_AND_PROBE	0x2020
+#define RG_SW_RST_MASK				GENMASK(7, 0)
+#define RG_SW_RST				0xff
+#define RG_PROBE_LOW_SEL_MASK			GENMASK(18, 16)
+#define RG_PROBE_LOW_SEL			BIT(16)
+#define RG_PROBE_LOW_HIGH_SWAP_MASK		BIT(23)
+#define RG_PROBE_LOW_HIGH_SWAP			BIT(23)
 #define MTK_DP_0034			0x34
 #define DA_XTP_GLB_CKDET_EN_FORCE_VAL		BIT(15)
 #define DA_XTP_GLB_CKDET_EN_FORCE_EN		BIT(14)
@@ -51,6 +62,15 @@
 #define RG_XTP_GLB_CKDET_EN			BIT(1)
 #define RG_DPAUX_RX_EN				BIT(0)
 
+/* offset: PHY_OFFSET */
+#define DP_PHY_DIG_GLB_STATUS_0		0x146c
+#define RGS_BG_CORE_EN_READY			BIT(0)
+#define RGS_AUX_LDO_EN_READY			BIT(1)
+
+#define MTK_EDP_PWR_DOMAIN		0x0074
+#define EDP_PWR_RST				BIT(0)
+#define EDP_PWR_CLK_DIS				BIT(4)
+
 /* offset: TOP_OFFSET (0x2000) */
 #define MTK_DP_TOP_PWR_STATE		0x2000
 #define DP_PWR_STATE_MASK			GENMASK(1, 0)
@@ -71,22 +91,33 @@
 #define DP_TX3_PRE_EMPH_MASK			GENMASK(27, 26)
 #define MTK_DP_TOP_RESET_AND_PROBE	0x2020
 #define SW_RST_B_PHYD				BIT(4)
+#define DP_TX_TOP_SOFT_PROBE		0x2024
 #define MTK_DP_TOP_IRQ_MASK		0x202c
+#define ENCODER_IRQ_MSK				BIT(0)
+#define TRANS_IRQ_MSK				BIT(1)
 #define IRQ_MASK_AUX_TOP_IRQ			BIT(2)
+#define IRQ_OUT_HIGH_ACTIVE_FLDMASK		0x100
 #define MTK_DP_TOP_MEM_PD		0x2038
 #define MEM_ISO_EN				BIT(0)
 #define FUSE_SEL				BIT(2)
 
+#define EDP_TX_TOP_CLKGEN_0		0x2074
+#define EDP_TX_TOP_CLKGEN_REST_MASK		0xf
+#define EDP_TX_TOP_CLKGEN_REST_VALUE		0xf
+
 /* offset: ENC0_OFFSET (0x3000) */
 #define MTK_DP_ENC0_P0_3000			0x3000
 #define LANE_NUM_DP_ENC0_P0_MASK			GENMASK(1, 0)
 #define VIDEO_MUTE_SW_DP_ENC0_P0			BIT(2)
 #define VIDEO_MUTE_SEL_DP_ENC0_P0			BIT(3)
 #define ENHANCED_FRAME_EN_DP_ENC0_P0			BIT(4)
+#define DP_I_MODE_ENABLE				BIT(6)
+#define REG_BS_SYMBOL_CNT_RESET				BIT(7)
 #define MTK_DP_ENC0_P0_3004			0x3004
 #define VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK		BIT(8)
 #define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0		BIT(9)
 #define SDP_RESET_SW_DP_ENC0_P0				BIT(13)
+#define DP_TX_MUX_DP_ENC0_P0				BIT(14)
 #define MTK_DP_ENC0_P0_3010			0x3010
 #define HTOTAL_SW_DP_ENC0_P0_MASK			GENMASK(15, 0)
 #define MTK_DP_ENC0_P0_3014			0x3014
@@ -119,10 +150,13 @@
 #define VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0		BIT(11)
 #define VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0		BIT(12)
 #define MTK_DP_ENC0_P0_3034			0x3034
+#define VIDEO_COLOR_FORMAT_DP_ENC0_P0_MASK		BIT(3)
+#define VIDEO_COLOR_FORMAT_DP_ENC0_P0_VALUE		BIT(3)
 #define MTK_DP_ENC0_P0_3038			0x3038
 #define VIDEO_SOURCE_SEL_DP_ENC0_P0_MASK		BIT(11)
 #define MTK_DP_ENC0_P0_303C			0x303c
 #define SRAM_START_READ_THRD_DP_ENC0_P0_MASK		GENMASK(5, 0)
+#define SRAM_START_READ_THRD_DP_ENC0_P0_VALUE		0x8
 #define VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK		GENMASK(10, 8)
 #define VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT		(0 << 8)
 #define VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT		(1 << 8)
@@ -139,9 +173,14 @@
 #define SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK		GENMASK(11, 0)
 #define MTK_DP_ENC0_P0_304C			0x304c
 #define VBID_VIDEO_MUTE_DP_ENC0_P0_MASK			BIT(2)
+#define VBID_VIDEO_MUTE_IDLE_PATTERN_DP_ENC0_P0_MASK	BIT(3)
 #define SDP_VSYNC_RISING_MASK_DP_ENC0_P0_MASK		BIT(8)
 #define MTK_DP_ENC0_P0_3064			0x3064
 #define HDE_NUM_LAST_DP_ENC0_P0_MASK			GENMASK(15, 0)
+#define REG_3368_DP_ENCODER1_P0			0x3368
+#define VIDEO_SRAM_FIFO_CNT_RESET_SEL_MASK		GENMASK(1, 0)
+#define VIDEO_SRAM_FIFO_CNT_RESET_SEL_VALUE		BIT(0)
+#define BS_FOLLOW_SEL_DP_ENC0_P0			BIT(15)
 #define MTK_DP_ENC0_P0_3088			0x3088
 #define AU_EN_DP_ENC0_P0				BIT(6)
 #define AUDIO_8CH_EN_DP_ENC0_P0_MASK			BIT(7)
@@ -240,6 +279,14 @@
 #define SDP_ASP_INSERT_IN_HBLANK_DP_ENC1_P0_MASK	BIT(12)
 #define SDP_DOWN_ASP_CNT_INIT_DP_ENC1_P0_MASK		GENMASK(11, 0)
 
+#define REG_33C0_DP_ENCODER1_P0			0x33c0
+#define SDP_TESTBUS_SEL_DP_ENC_MASK			0xf000
+#define SDP_TESTBUS_SEL_BIT4_DP_ENC_MASK		0x80
+#define SDP_TESTBUS_SEL_BIT4_DP_ENC			0x80
+#define REG_33C4_DP_ENCODER1_P0			0x33c4
+#define DP_TX_ENCODER_TESTBUS_SEL_DP_ENC_MASK		GENMASK(6, 5)
+#define DP_TX_ENCODER_TESTBUS_SEL_DP_ENC		BIT(5)
+
 #define MTK_DP_ENC1_P0_33F4			0x33f4
 #define DP_ENC_DUMMY_RW_1_AUDIO_RST_EN			BIT(0)
 #define DP_ENC_DUMMY_RW_1				BIT(9)
@@ -296,9 +343,14 @@
 #define DP_TRANS_DUMMY_RW_0_MASK				GENMASK(3, 2)
 
 /* offset: AUX_OFFSET (0x3600) */
+#define REG_3608_AUX_TX_P0			0x3608
+#define HPD_CONNECT_EVENT				BIT(0)
+#define HPD_INTERRUPT_EVENT				BIT(2)
+#define HPD_DISCONNECT_EVENT				BIT(10)
 #define MTK_DP_AUX_P0_360C			0x360c
 #define AUX_TIMEOUT_THR_AUX_TX_P0_MASK			GENMASK(12, 0)
 #define AUX_TIMEOUT_THR_AUX_TX_P0_VAL			0x1595
+#define AUX_TIMEOUT_THR_AUX_TX_P0_VAL_1			0x1d0c
 #define MTK_DP_AUX_P0_3614			0x3614
 #define AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK		GENMASK(6, 0)
 #define AUX_RX_UI_CNT_THR_AUX_FOR_26M			13
@@ -344,19 +396,93 @@
 #define MCU_REQUEST_ADDRESS_LSB_AUX_TX_P0_MASK		GENMASK(15, 0)
 #define MTK_DP_AUX_P0_364C			0x364c
 #define MCU_REQUEST_ADDRESS_MSB_AUX_TX_P0_MASK		GENMASK(3, 0)
+#define REG_364C_AUX_TX_P0			0x364c
+#define HPD_INT_THD_FLDMASK_VAL				0x32
+#define HPD_INT_THD_FLDMASK				0x3f0
+#define HPD_STATUS_DP_AUX_TX_P0_MASK			BIT(15)
 #define MTK_DP_AUX_P0_3650			0x3650
 #define MCU_REQ_DATA_NUM_AUX_TX_P0_MASK			GENMASK(15, 12)
 #define PHY_FIFO_RST_AUX_TX_P0_MASK			BIT(9)
 #define MCU_ACK_TRAN_COMPLETE_AUX_TX_P0			BIT(8)
 #define MTK_DP_AUX_P0_3658			0x3658
 #define AUX_TX_OV_EN_AUX_TX_P0_MASK			BIT(0)
+
+#define REG_3660_AUX_TX_P0			0x3660
+#define AUX_DP_TX_INT_3660_VALUE		0xffff
+#define AUX_DP_TX_INT_3660_MASK			0xffff
+
+#define REG_3668_AUX_TX_P0			0x3668
+
+#define REG_366C_AUX_TX_P0			0x366c
+#define XTAL_FREQ_DP_TX_AUX_366C_VALUE			0x68
+#define XTAL_FREQ_DP_TX_AUX_366C_MASK			0xff00
+
+#define REG_367C_AUX_TX_P0			0x367c
+#define HPD_CONN_THD_AUX_TX_P0_FLDMASK_POS		5
+#define HPD_CONN_THD_AUX_TX_P0_FLDMASK			0x3c0
 #define MTK_DP_AUX_P0_3690			0x3690
 #define RX_REPLY_COMPLETE_MODE_AUX_TX_P0		BIT(8)
+
+#define REG_36A0_AUX_TX_P0			0x36a0
+#define DP_TX_INIT_MASK_15_TO_2_MASK			0xfffc
+#define DP_TX_INIT_MASK_15_TO_2				0xfffc
 #define MTK_DP_AUX_P0_3704			0x3704
 #define AUX_TX_FIFO_WDATA_NEW_MODE_T_AUX_TX_P0_MASK	BIT(1)
 #define AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0		BIT(2)
 #define MTK_DP_AUX_P0_3708			0x3708
+
+#define REG_37A0_AUX_TX_P0			0x37a0
+#define HPD_DISC_THD_AUX_TX_P0_FLDMASK_POS		5
+#define HPD_DISC_THD_AUX_TX_P0_FLDMASK			0xf0
+
 #define MTK_DP_AUX_P0_37C8			0x37c8
 #define MTK_ATOP_EN_AUX_TX_P0				BIT(0)
 
+/* offset info queue */
+#define REG_3F04_DP_ENC_P0_3			0x3f04
+#define FRAME_START_MARKER_0_DP_ENC_P0_3_MASK		0xffff
+#define REG_3F08_DP_ENC_P0_3			0x3f08
+#define FRAME_START_MARKER_1_DP_ENC_P0_3_MASK		BIT(3)
+#define FRAME_START_MARKER_1_DP_ENC_P0_3		BIT(3)
+#define REG_3F0C_DP_ENC_P0_3			0x3f0C
+#define FRAME_END_MARKER_0_DP_ENC_P0_3_MASK		BIT(1)
+#define FRAME_END_MARKER_0_DP_ENC_P0_3			BIT(1)
+#define REG_3F10_DP_ENC_P0_3			0x3f10
+#define FRAME_END_MARKER_1_DP_ENC_P0_3_MASK		BIT(3)
+#define FRAME_END_MARKER_1_DP_ENC_P0_3			BIT(3)
+#define REG_3F28_DP_ENC_P0_3			0x3f28
+#define DP_TX_SDP_PSR_AS_TESTBUS_MASK			GENMASK(5, 2)
+#define DP_TX_SDP_PSR_AS_TESTBUS			(0xa << 2)
+#define REG_3F44_DP_ENC_P0_3			0x3f44
+#define PHY_PWR_STATE_OW_EN_DP_ENC_P0_3			BIT(2)
+#define PHY_PWR_STATE_OW_EN_DP_ENC_P0_3_MASK		BIT(2)
+#define ALL_POWER_OFF					(0x0 << 3)
+#define BIAS_POWER_ON					(0x1 << 3)
+#define BIAS_AND_PLL_POWER_ON				(0x2 << 3)
+#define ALL_POWER_ON					(0x3 << 3)
+#define PHY_PWR_STATE_OW_VALUE_DP_ENC_P0_3_MASK		GENMASK(4, 3)
+
+#define REG_3F80_DP_ENC_P0_3			0x3f80
+#define PSR_PATGEN_AVT_EN_FLDMASK			0x20
+#define REG_3FF8_DP_ENC_P0_3			0x3ff8
+#define PHY_STATE_RESET_ALL_MASK			0xff
+#define PHY_STATE_RESET_ALL_VALUE			0xff
+#define PHY_STATE_W_1_DP_ENC_P0_3			BIT(6)
+#define PHY_STATE_W_1_DP_ENC_P0_3_MASK			BIT(6)
+
+#define DVO_ON_W_1_FLDMASK				0x20
+#define XTAL_FREQ_FOR_PSR_DP_ENC_P0_3_VALUE		25
+#define XTAL_FREQ_FOR_PSR_DP_ENC_P0_3_MASK		0x3e00
+
+#define DISP_EDPTX_PWR_RST_B				(1 << 0)
+#define DISP_EDPTX_PWR_CLK_DIS				(1 << 4)
+
+/* offset: PHYD_OFFSET (0x1000) */
+#define PHYD_DIG_DRV_FORCE_LANE(lane)		(0x1030 + 0x100 * (lane))
+#define EDP_TX_LN_VOLT_SWING_VAL_FLDMASK	0x6
+#define EDP_TX_LN_PRE_EMPH_VAL_FLDMASK		0x18
+
+#define RG_DSI_DEM_EN			0x500
+#define DSI_DE_EMPHASIS_ENABLE	BIT(1)
+
 #endif /*_MTK_DP_REG_H_*/
-- 
2.45.2

