Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F4A93295
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 08:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2F310E418;
	Fri, 18 Apr 2025 06:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="RI29SC/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632B210E40C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 06:53:30 +0000 (UTC)
X-UUID: d2ab9e541c2111f0aae1fd9735fae912-20250418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cxjQDLdx0UG7gRjGuFA0+lUdD8dcgO/jR8OOL1qmwZk=; 
 b=RI29SC/NHo58iR/64b2d8HqYZudnXkTinpMrNfri0k8p9uMUmuA5itqSQJ/T75EWSl0QanjhClN1MyFzP5b+JSgGk2NMuvaqO/5qAyrsvnMnffoj3MoBVMg/Hfh1Ag8t/GApAvravmjwsHgjszL02qgx6razUEuyyl19XBIRdZ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:dcdfe057-a988-44f0-b48a-71aeabe2647f, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:8d44668b-0afe-4897-949e-8174746b1932,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d2ab9e541c2111f0aae1fd9735fae912-20250418
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <bincai.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1054836075; Fri, 18 Apr 2025 14:53:24 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Apr 2025 14:53:23 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Apr 2025 14:53:22 +0800
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
Subject: [PATCH 5/5] drm/mediatek: Add eDP phy driver for mt8196
Date: Fri, 18 Apr 2025 14:52:32 +0800
Message-ID: <20250418065313.8972-6-bincai.liu@mediatek.com>
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

Add code to support eDP phy for mt8196.

Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
---
 drivers/phy/mediatek/Makefile      |   1 +
 drivers/phy/mediatek/phy-mtk-edp.c | 262 +++++++++++++++++++++++++++++
 2 files changed, 263 insertions(+)
 create mode 100644 drivers/phy/mediatek/phy-mtk-edp.c

diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index 1b8088df71e8..49d9ea42497a 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-dp.o
+obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-edp.o
 obj-$(CONFIG_PHY_MTK_PCIE)		+= phy-mtk-pcie.o
 obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
 obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
diff --git a/drivers/phy/mediatek/phy-mtk-edp.c b/drivers/phy/mediatek/phy-mtk-edp.c
new file mode 100644
index 000000000000..fadcbda55b70
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-edp.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2022 MediaTek Inc.
+ * Copyright (c) 2022 BayLibre
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define PHYD_OFFSET			0x0000
+#define PHYD_DIG_LAN0_OFFSET		0x1000
+#define PHYD_DIG_LAN1_OFFSET		0x1100
+#define PHYD_DIG_LAN2_OFFSET		0x1200
+#define PHYD_DIG_LAN3_OFFSET		0x1300
+#define PHYD_DIG_GLB_OFFSET		0x1400
+
+#define DP_PHY_DIG_PLL_CTL_0		(PHYD_DIG_GLB_OFFSET + 0x10)
+#define FORCE_PWORE_STATE_FLDMASK		GENMASK(2, 0)
+#define FORCE_PWORE_STATE_VALUE			0x7
+
+#define IPMUX_CONTROL			(PHYD_DIG_GLB_OFFSET + 0x98)
+#define EDPTX_DSI_PHYD_SEL_FLDMASK		0x1
+#define EDPTX_DSI_PHYD_SEL_FLDMASK_POS		0
+
+#define DP_PHY_DIG_TX_CTL_0		(PHYD_DIG_GLB_OFFSET + 0x74)
+#define TX_LN_EN_FLDMASK			0xf
+
+#define mtk_edp_PHY_DIG_PLL_CTL_1	(PHYD_DIG_GLB_OFFSET + 0x14)
+#define TPLL_SSC_EN				BIT(8)
+
+#define mtk_edp_PHY_DIG_BIT_RATE		(PHYD_DIG_GLB_OFFSET + 0x3C)
+#define BIT_RATE_RBR				0x1
+#define BIT_RATE_HBR				0x4
+#define BIT_RATE_HBR2				0x7
+#define BIT_RATE_HBR3				0x9
+
+#define mtk_edp_PHY_DIG_SW_RST		(PHYD_DIG_GLB_OFFSET + 0x38)
+#define DP_GLB_SW_RST_PHYD			BIT(0)
+#define DP_GLB_SW_RST_PHYD_MASK			BIT(0)
+
+#define DRIVING_FORCE			0x30
+#define EDP_TX_LN_VOLT_SWING_VAL_FLDMASK	0x6
+#define EDP_TX_LN_VOLT_SWING_VAL_FLDMASK_POS	1
+#define EDP_TX_LN_PRE_EMPH_VAL_FLDMASK		0x18
+#define EDP_TX_LN_PRE_EMPH_VAL_FLDMASK_POS	3
+
+struct mtk_edp_phy {
+	struct regmap *regs;
+};
+
+enum DPTX_LANE_NUM {
+	DPTX_LANE0 = 0x0,
+	DPTX_LANE1 = 0x1,
+	DPTX_LANE2 = 0x2,
+	DPTX_LANE3 = 0x3,
+	DPTX_LANE_MAX,
+};
+
+enum DPTX_LANE_COUNT {
+	DPTX_LANE_COUNT1 = 0x1,
+	DPTX_LANE_COUNT2 = 0x2,
+	DPTX_LANE_COUNT4 = 0x4,
+};
+
+static void mtk_edptx_phyd_reset_swing_pre(struct mtk_edp_phy *edp_phy)
+{
+	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN0_OFFSET + DRIVING_FORCE,
+			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
+	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN1_OFFSET + DRIVING_FORCE,
+			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
+	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN2_OFFSET + DRIVING_FORCE,
+			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
+	regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN3_OFFSET + DRIVING_FORCE,
+			   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+			   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK, 0x0);
+}
+
+static int mtk_edp_phy_init(struct phy *phy)
+{
+	struct mtk_edp_phy *edp_phy = phy_get_drvdata(phy);
+
+	regmap_update_bits(edp_phy->regs, IPMUX_CONTROL, 0,
+			   EDPTX_DSI_PHYD_SEL_FLDMASK);
+
+	regmap_update_bits(edp_phy->regs, DP_PHY_DIG_PLL_CTL_0,
+			   FORCE_PWORE_STATE_VALUE,
+			   FORCE_PWORE_STATE_FLDMASK);
+
+	return 0;
+}
+
+static int mtk_edp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mtk_edp_phy *edp_phy = phy_get_drvdata(phy);
+	u32 val;
+
+	if (opts->dp.set_rate) {
+		switch (opts->dp.link_rate) {
+		case 1620:
+			val = BIT_RATE_RBR;
+			break;
+		case 2700:
+			val = BIT_RATE_HBR;
+			break;
+		case 5400:
+			val = BIT_RATE_HBR2;
+			break;
+		case 8100:
+			val = BIT_RATE_HBR3;
+			break;
+		default:
+			dev_err(&phy->dev,
+				"Implementation error, unknown linkrate %x\n",
+				opts->dp.link_rate);
+			return -EINVAL;
+		}
+		regmap_write(edp_phy->regs, mtk_edp_PHY_DIG_BIT_RATE, val);
+	}
+
+	if (opts->dp.set_lanes) {
+		for (val = 0; val < 4; val++) {
+			regmap_update_bits(edp_phy->regs, DP_PHY_DIG_TX_CTL_0,
+					   ((1 << (val + 1)) - 1),
+					   TX_LN_EN_FLDMASK);
+		}
+	}
+
+	if (opts->dp.set_voltages) {
+		switch (opts->dp.lanes) {
+		case DPTX_LANE_COUNT1:
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN0_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE0] << 1 |
+					   opts->dp.pre[DPTX_LANE0] << 3);
+		break;
+		case DPTX_LANE_COUNT2:
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN0_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE0] << 1 |
+					   opts->dp.pre[DPTX_LANE0] << 3);
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN1_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE1] << 1 |
+					   opts->dp.pre[DPTX_LANE1] << 3);
+		break;
+		case DPTX_LANE_COUNT4:
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN0_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE0] << 1 |
+					   opts->dp.pre[DPTX_LANE0] << 3);
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN1_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE1] << 1 |
+					   opts->dp.pre[DPTX_LANE1] << 3);
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN2_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE2] << 1 |
+					   opts->dp.pre[DPTX_LANE2] << 3);
+			regmap_update_bits(edp_phy->regs, PHYD_DIG_LAN3_OFFSET +
+					   DRIVING_FORCE,
+					   EDP_TX_LN_VOLT_SWING_VAL_FLDMASK |
+					   EDP_TX_LN_PRE_EMPH_VAL_FLDMASK,
+					   opts->dp.voltage[DPTX_LANE3] << 1 |
+					   opts->dp.pre[DPTX_LANE3] << 3);
+		break;
+		default:
+			dev_err(&phy->dev, "Wrong lanes config: %x\n",
+				opts->dp.lanes);
+			return -EINVAL;
+		}
+	}
+
+	regmap_update_bits(edp_phy->regs, mtk_edp_PHY_DIG_PLL_CTL_1,
+			   TPLL_SSC_EN, opts->dp.ssc ? 0 : TPLL_SSC_EN);
+
+	return 0;
+}
+
+static int mtk_edp_phy_reset(struct phy *phy)
+{
+	struct mtk_edp_phy *edp_phy = phy_get_drvdata(phy);
+
+	regmap_update_bits(edp_phy->regs, mtk_edp_PHY_DIG_SW_RST,
+			   0, DP_GLB_SW_RST_PHYD_MASK);
+	usleep_range(50, 200);
+	regmap_update_bits(edp_phy->regs, mtk_edp_PHY_DIG_SW_RST,
+			   DP_GLB_SW_RST_PHYD, DP_GLB_SW_RST_PHYD_MASK);
+	regmap_update_bits(edp_phy->regs, DP_PHY_DIG_TX_CTL_0,
+			   0x0, TX_LN_EN_FLDMASK);
+	mtk_edptx_phyd_reset_swing_pre(edp_phy);
+
+	return 0;
+}
+
+static const struct phy_ops mtk_edp_phy_dev_ops = {
+	.init = mtk_edp_phy_init,
+	.configure = mtk_edp_phy_configure,
+	.reset = mtk_edp_phy_reset,
+	.owner = THIS_MODULE,
+};
+
+static int mtk_edp_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_edp_phy *edp_phy;
+	struct phy *phy;
+	struct regmap *regs;
+
+	regs = *(struct regmap **)dev->platform_data;
+	if (!regs)
+		return dev_err_probe(dev, -EINVAL,
+				     "No data passed, requires struct regmap**\n");
+
+	edp_phy = devm_kzalloc(dev, sizeof(*edp_phy), GFP_KERNEL);
+	if (!edp_phy)
+		return -ENOMEM;
+
+	edp_phy->regs = regs;
+	phy = devm_phy_create(dev, NULL, &mtk_edp_phy_dev_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "Failed to create DP PHY\n");
+
+	phy_set_drvdata(phy, edp_phy);
+	if (!dev->of_node)
+		phy_create_lookup(phy, "edp", dev_name(dev));
+
+	return 0;
+}
+
+struct platform_driver mtk_edp_phy_driver = {
+	.probe = mtk_edp_phy_probe,
+	.driver = {
+		.name = "mediatek-edp-phy",
+	},
+};
+
+module_platform_driver(mtk_edp_phy_driver);
+
+MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
+MODULE_DESCRIPTION("MediaTek DP PHY Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2

