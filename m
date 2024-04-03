Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF40896580
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB7A1125A8;
	Wed,  3 Apr 2024 07:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="lpY8OyTg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803101123CB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 04:04:34 +0000 (UTC)
X-UUID: 43b7000ef16f11ee935d6952f98a51a9-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yYxp0aFWjJkoN+/b1M2v5KOdqMIidnWV+rOPGvVUSa4=; 
 b=lpY8OyTgKwCO+kg0P8iyURu/yQg4/QHOuKh9g00tGCf5S18AZcnR+5xAkKo6jN/LbFIie+FwSr3i+TLDDBTL5CmfEMTWtdSquSKo1TtNsyAs6vMmWerK7QUFZcnRcnmTunagnS4dexCYJBVw4++iqprAPhVkOJZYk2FaCUjjdjo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:03f50a22-cdcd-47c5-8ea3-ce024bae1ce8, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6f543d0, CLOUDID:510fa600-c26b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 43b7000ef16f11ee935d6952f98a51a9-20240403
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 399939316; Wed, 03 Apr 2024 12:04:27 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 12:04:26 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 12:04:25 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>,
 <chunfeng.yun@mediatek.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <jitao.shi@mediatek.com>, <mac.shen@mediatek.com>,
 <liankun.yang@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/1] drm/mediatek/dp: The register is written with the
 parsed DTS SSC value.
Date: Wed, 3 Apr 2024 12:05:09 +0800
Message-ID: <20240403040517.3279-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Wed, 03 Apr 2024 07:10:39 +0000
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

[Description]
Severe screen flickering has been observed on the external display
when the DP projection function is used with the market expansion dock.

[Root cause]
It has been discovered through analysis that severe screen flickering
will occur when using the current default settings of
SC (Spread Spectrum Clocking) after it is opened.

[Solution]
Reducing SSC capability on the test platform can
resolve the screen flickering issue.

By configuring SSC parameters in DTS, locating the DP SSC node
in phy-mtk-dp, parsing the current value of SSC, and writing this value
into PHY to configure SSC can solve the screen flickering problem.

[Test]
The SSC configuration values are read from DTS, parsed in the driver,
and then written to the hardware. The test results indicate that
there is no screen flickering.

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 61 +++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index d7024a144335..13e5d3c33784 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -25,6 +25,10 @@
 #define BIT_RATE_HBR2			2
 #define BIT_RATE_HBR3			3
 
+#define MTK_DP_PHY_DIG_GLB_DA_REG_14	(PHY_OFFSET + 0xD8)
+#define XTP_GLB_TXPLL_SSC_DELTA_RBR_DEFAULT	GENMASK(15, 0)
+#define XTP_GLB_TXPLL_SSC_DELTA_HBR_DEFAULT	GENMASK(31, 16)
+
 #define MTK_DP_PHY_DIG_SW_RST		(PHY_OFFSET + 0x38)
 #define DP_GLB_SW_RST_PHYD		BIT(0)
 
@@ -78,10 +82,57 @@
 #define DRIVING_PARAM_8_DEFAULT	(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
 				 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
 
+#define SSC_SETTING	"dp-ssc-setting"
+#define RG_XTP_GLB_TXPLL_SSC_DELTA_RBR	"ssc-delta-rbr"
+#define RG_XTP_GLB_TXPLL_SSC_DELTA_HBR	"ssc-delta-hbr"
+
 struct mtk_dp_phy {
 	struct regmap *regs;
+	struct device *dev;
 };
 
+static int mtk_dp_set_ssc_config(struct phy *phy, struct mtk_dp_phy *dp_phy,
+		struct device_node *ssc_node, const char *mode_name, u32 ssc_reg_offset)
+{
+	int ret;
+	u32 read_value = 0;
+
+	ret = of_property_read_u32(ssc_node, mode_name, &read_value);
+	if (ret) {
+		dev_err(&phy->dev, "Read fail,DPTX is not %s\n", mode_name);
+		return -EINVAL;
+	}
+
+	if (!read_value) {
+		dev_err(&phy->dev, "Read value is NULL\n");
+		return -ENOMEM;
+	}
+
+	if (!strcmp(mode_name, RG_XTP_GLB_TXPLL_SSC_DELTA_RBR)) {
+		regmap_update_bits(dp_phy->regs, ssc_reg_offset,
+			   XTP_GLB_TXPLL_SSC_DELTA_RBR_DEFAULT, read_value);
+	} else if (!strcmp(mode_name, RG_XTP_GLB_TXPLL_SSC_DELTA_HBR)) {
+		read_value = read_value << 16 | 0x0000;
+		regmap_update_bits(dp_phy->regs, ssc_reg_offset,
+			   XTP_GLB_TXPLL_SSC_DELTA_HBR_DEFAULT, read_value);
+	}
+
+	return 0;
+}
+
+static struct device_node *mtk_dp_get_ssc_node(struct phy *phy, struct mtk_dp_phy *dp_phy)
+{
+	struct device_node *mode_node = NULL;
+
+	mode_node = of_find_node_by_name(dp_phy->dev->of_node, SSC_SETTING);
+	if (!mode_node) {
+		dev_err(&phy->dev, "SSC node is NULL\n");
+		return NULL;
+	}
+
+	return mode_node;
+}
+
 static int mtk_dp_phy_init(struct phy *phy)
 {
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
@@ -109,6 +160,7 @@ static int mtk_dp_phy_init(struct phy *phy)
 static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 {
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+	struct device_node *ssc_node = NULL;
 	u32 val;
 
 	if (opts->dp.set_rate) {
@@ -137,6 +189,14 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
 			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
 
+	ssc_node = mtk_dp_get_ssc_node(phy, dp_phy);
+	if (ssc_node) {
+		mtk_dp_set_ssc_config(phy, dp_phy, ssc_node, RG_XTP_GLB_TXPLL_SSC_DELTA_RBR,
+			MTK_DP_PHY_DIG_GLB_DA_REG_14);
+		mtk_dp_set_ssc_config(phy, dp_phy, ssc_node, RG_XTP_GLB_TXPLL_SSC_DELTA_HBR,
+			MTK_DP_PHY_DIG_GLB_DA_REG_14);
+	}
+
 	return 0;
 }
 
@@ -186,6 +246,7 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
 	if (!dev->of_node)
 		phy_create_lookup(phy, "dp", dev_name(dev));
 
+	dp_phy->dev = dev;
 	return 0;
 }
 
-- 
2.43.0

