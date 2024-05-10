Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58678C22B8
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 13:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E904410E8F6;
	Fri, 10 May 2024 11:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="SwirdxV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BB910E8F3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 11:05:37 +0000 (UTC)
X-UUID: 37a82f700ebd11ef8065b7b53f7091ad-20240510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tGYdTrBFfpb9eyzoW0iXytY9VmA09b1t9jreY07jxjA=; 
 b=SwirdxV2yb/ioStg0g2/gkoG5tfI425yf9jydDL8YcYMrxxVfrU+CcTA+ygdIcmsQDCkGd1JC+lHjG7fSf2yBHmsPxKMDavQ6RNDrCeRzlJcwuSHulEnCL0csVfZAShd+EpOpbECI3bI9ZUmSkAUDO2xms6koMASD/nP+oiraio=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:72aa8e58-bad5-464f-ba0c-ed3ee568eb83, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:-50
X-CID-META: VersionHash:82c5f88, CLOUDID:3113effb-ed05-4274-9204-014369d201e8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
 L:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
 PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 37a82f700ebd11ef8065b7b53f7091ad-20240510
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 617051973; Fri, 10 May 2024 19:05:31 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 May 2024 04:05:30 -0700
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 May 2024 19:05:30 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <chunfeng.yun@mediatek.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <jitao.shi@mediatek.com>, <mac.shen@mediatek.com>,
 <liankun.yang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>
Subject: [PATCH v2 1/2] Add write DP phyd register from parse dts
Date: Fri, 10 May 2024 19:04:14 +0800
Message-ID: <20240510110523.12524-2-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240510110523.12524-1-liankun.yang@mediatek.com>
References: <20240510110523.12524-1-liankun.yang@mediatek.com>
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

During the testing phase, screen flickering is observed when
using displayport for screen casting. Relevant SSC register parameters
are set in dts to address the screen flickering issue effectively and
improve compatibility with different devices by adjusting the SSC gear.

Obtaining the DPTX node, parsing the dts to obtain PHY register address
and value can adapt to settings of different manufacturers projects.

Changeds in v2:
- Optimized method of writing to DP PHY register
https://patchwork.kernel.org/project/linux-mediatek/patch/
20240403040517.3279-1-liankun.yang@mediatek.com/

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index d7024a144335..ce78112d5938 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -28,6 +28,10 @@
 #define MTK_DP_PHY_DIG_SW_RST		(PHY_OFFSET + 0x38)
 #define DP_GLB_SW_RST_PHYD		BIT(0)
 
+#define MTK_DP_PHY_DIG_GLB_DA_REG_14	(PHY_OFFSET + 0xD8)
+#define XTP_GLB_TXPLL_SSC_DELTA_RBR_DEFAULT	GENMASK(15, 0)
+#define XTP_GLB_TXPLL_SSC_DELTA_HBR_DEFAULT	GENMASK(31, 16)
+
 #define MTK_DP_LANE0_DRIVING_PARAM_3		(PHY_OFFSET + 0x138)
 #define MTK_DP_LANE1_DRIVING_PARAM_3		(PHY_OFFSET + 0x238)
 #define MTK_DP_LANE2_DRIVING_PARAM_3		(PHY_OFFSET + 0x338)
@@ -78,10 +82,39 @@
 #define DRIVING_PARAM_8_DEFAULT	(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
 				 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
 
+#define SSC_SETTING	"dp-ssc-setting"
+#define RG_XTP_GLB_TXPLL_SSC_DELTA_HBR	"ssc-delta-hbr"
+
 struct mtk_dp_phy {
 	struct regmap *regs;
+	struct device *dev;
 };
 
+static int mtk_dp_set_ssc_config(struct phy *phy, struct mtk_dp_phy *dp_phy)
+{
+	int ret;
+	u32 read_value = 0, reg_mask = 0;
+	struct device_node *ssc_node = NULL;
+
+	ssc_node = of_find_node_by_name(dp_phy->dev->of_node, SSC_SETTING);
+	if (!ssc_node) {
+		dev_err(&phy->dev, "SSC node is NULL\n");
+		return -ENODEV;
+	}
+
+	ret = of_property_read_u32(ssc_node, RG_XTP_GLB_TXPLL_SSC_DELTA_HBR, &read_value);
+	if (ret < 0 || !read_value) {
+		dev_err(&phy->dev, "Read SSC vlaue fail!\n");
+		return -EINVAL;
+	}
+	read_value |= read_value << 16;
+	reg_mask |= XTP_GLB_TXPLL_SSC_DELTA_HBR_DEFAULT;
+
+	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_GLB_DA_REG_14, reg_mask, read_value);
+
+	return 0;
+}
+
 static int mtk_dp_phy_init(struct phy *phy)
 {
 	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
@@ -137,6 +170,8 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
 			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
 
+	mtk_dp_set_ssc_config(phy, dp_phy);
+
 	return 0;
 }
 
@@ -186,6 +221,8 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
 	if (!dev->of_node)
 		phy_create_lookup(phy, "dp", dev_name(dev));
 
+	dp_phy->dev = dev;
+
 	return 0;
 }
 
-- 
2.18.0

