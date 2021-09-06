Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07824016D7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 09:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EB0899EA;
	Mon,  6 Sep 2021 07:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEBD899BB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 07:15:53 +0000 (UTC)
X-UUID: 02f30f97eda1441f9b32dffdf977c63d-20210906
X-UUID: 02f30f97eda1441f9b32dffdf977c63d-20210906
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1451313652; Mon, 06 Sep 2021 15:15:48 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 15:15:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Sep 2021 15:15:41 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v5 06/16] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
Date: Mon, 6 Sep 2021 15:15:29 +0800
Message-ID: <20210906071539.12953-7-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210906071539.12953-1-nancy.lin@mediatek.com>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
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

Add mt8195 vdosys1 clock driver name and routing table to
the driver data of mtk-mmsys.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h    | 136 +++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       |  10 ++
 include/linux/soc/mediatek/mtk-mmsys.h |   2 +
 3 files changed, 148 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 0c97a5f016c1..f19ec72c1243 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -59,6 +59,70 @@
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
 
+#define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
+#define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0		(1 << 0)
+
+#define MT8195_VDO1_VPP_MERGE0_P1_SEL_IN			0xf08
+#define MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1		(1 << 0)
+
+#define MT8195_VDO1_DISP_DPI1_SEL_IN				0xf10
+#define MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT		(0 << 0)
+
+#define MT8195_VDO1_DISP_DP_INTF0_SEL_IN			0xf14
+#define MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT	(0 << 0)
+
+#define MT8195_VDO1_MERGE4_SOUT_SEL				0xf18
+#define MT8195_MERGE4_SOUT_TO_DPI1_SEL				(2 << 0)
+#define MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL			(3 << 0)
+
+#define MT8195_VDO1_MIXER_IN1_SEL_IN				0xf24
+#define MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT		(1 << 0)
+
+#define MT8195_VDO1_MIXER_IN2_SEL_IN				0xf28
+#define MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT		(1 << 0)
+
+#define MT8195_VDO1_MIXER_IN3_SEL_IN				0xf2c
+#define MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT		(1 << 0)
+
+#define MT8195_VDO1_MIXER_IN4_SEL_IN				0xf30
+#define MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT		(1 << 0)
+
+#define MT8195_VDO1_MIXER_OUT_SOUT_SEL				0xf34
+#define MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL			(1 << 0)
+
+#define MT8195_VDO1_VPP_MERGE1_P0_SEL_IN			0xf3c
+#define MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2		(1 << 0)
+
+#define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
+#define MT8195_SOUT_TO_MIXER_IN1_SEL				(1 << 0)
+
+#define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
+#define MT8195_SOUT_TO_MIXER_IN2_SEL				(1 << 0)
+
+#define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
+#define MT8195_SOUT_TO_MIXER_IN3_SEL				(1 << 0)
+
+#define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
+#define MT8195_SOUT_TO_MIXER_IN4_SEL				(1 << 0)
+
+#define MT8195_VDO1_MERGE4_ASYNC_SEL_IN				0xf50
+#define MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT		(1 << 0)
+
+#define MT8195_VDO1_MIXER_IN1_SOUT_SEL				0xf58
+#define MT8195_MIXER_IN1_SOUT_TO_DISP_MIXER			(0 << 0)
+
+#define MT8195_VDO1_MIXER_IN2_SOUT_SEL				0xf5c
+#define MT8195_MIXER_IN2_SOUT_TO_DISP_MIXER			(0 << 0)
+
+#define MT8195_VDO1_MIXER_IN3_SOUT_SEL				0xf60
+#define MT8195_MIXER_IN3_SOUT_TO_DISP_MIXER			(0 << 0)
+
+#define MT8195_VDO1_MIXER_IN4_SOUT_SEL				0xf64
+#define MT8195_MIXER_IN4_SOUT_TO_DISP_MIXER			(0 << 0)
+
+#define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
+#define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER		(0 << 0)
+
 static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
@@ -108,6 +172,78 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
 		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_DP_INTF0,
 		MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN1_SEL
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN2_SEL
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN3_SEL
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN4_SEL
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_OUT_SOUT_SEL, GENMASK(0, 0),
+		MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN1_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN2_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN3_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN4_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_SOUT_SEL_IN, GENMASK(2, 0),
+		MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE4_ASYNC_SEL_IN, GENMASK(2, 0),
+		MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8195_VDO1_DISP_DPI1_SEL_IN, GENMASK(1, 0),
+		MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
+		MT8195_MERGE4_SOUT_TO_DPI1_SEL
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO1_DISP_DP_INTF0_SEL_IN, GENMASK(1, 0),
+		MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
+		MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL
 	}
 };
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 1c60650c7adb..5ad2cc796f5b 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -68,6 +68,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
+	.clk_driver = "clk-mt8195-vdo1",
+	.routes = mmsys_mt8195_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
+};
+
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
@@ -251,6 +257,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8195-vdosys0",
 		.data = &mt8195_vdosys0_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-vdosys1",
+		.data = &mt8195_vdosys1_driver_data,
+	},
 	{ }
 };
 
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 6d6ece48b61e..619392221a52 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -18,6 +18,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_DITHER,
 	DDP_COMPONENT_DP_INTF0,
+	DDP_COMPONENT_DP_INTF1,
 	DDP_COMPONENT_DPI0,
 	DDP_COMPONENT_DPI1,
 	DDP_COMPONENT_DSC0,
@@ -38,6 +39,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_OVL_2L0,
 	DDP_COMPONENT_OVL_2L1,
+	DDP_COMPONENT_OVL_ADAPTOR,
 	DDP_COMPONENT_OVL1,
 	DDP_COMPONENT_PWM0,
 	DDP_COMPONENT_PWM1,
-- 
2.18.0

