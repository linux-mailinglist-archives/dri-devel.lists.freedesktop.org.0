Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C494D1019
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 07:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69C510E7D0;
	Tue,  8 Mar 2022 06:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F50D10E77A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 06:20:24 +0000 (UTC)
X-UUID: 7c76b1cd717a425abb3d6454fcf15195-20220308
X-UUID: 7c76b1cd717a425abb3d6454fcf15195-20220308
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1238701833; Tue, 08 Mar 2022 14:20:17 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 8 Mar 2022 14:20:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Mar 2022 14:20:16 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v13 09/22] soc: mediatek: add mtk-mutex support for mt8195
 vdosys1
Date: Tue, 8 Mar 2022 14:19:59 +0800
Message-ID: <20220308062012.21838-10-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220308062012.21838-1-nancy.lin@mediatek.com>
References: <20220308062012.21838-1-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mtk-mutex support for mt8195 vdosys1.
The vdosys1 path component contains ovl_adaptor, merge5,
and dp_intf1. Ovl_adaptor is composed of several sub-elements.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 54 ++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index f15f7e56fc1a..2fec2d02b738 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -129,6 +129,35 @@
 #define MT8195_MUTEX_MOD_DISP_PWM0		BIT(27)
 #define MT8195_MUTEX_MOD_DISP_PWM1		BIT(28)
 
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA0	BIT(0)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA1	BIT(1)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA2	BIT(2)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA3	BIT(3)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA4	BIT(4)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA5	BIT(5)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA6	BIT(6)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA7	BIT(7)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE0	BIT(8)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE1	BIT(9)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE2	BIT(10)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE3	BIT(11)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE4	BIT(12)
+#define MT8195_MUTEX_MOD_DISP1_VPP2_DL_RELAY	BIT(13)
+#define MT8195_MUTEX_MOD_DISP1_VPP3_DL_RELAY	BIT(14)
+#define MT8195_MUTEX_MOD_DISP1_VDO0_DSC_DL_ASYNC	BIT(15)
+#define MT8195_MUTEX_MOD_DISP1_VDO0_MERGE_DL_ASYNC	BIT(16)
+#define MT8195_MUTEX_MOD_DISP1_VDO1_OUT_DL_RELAY	BIT(17)
+#define MT8195_MUTEX_MOD_DISP1_DISP_MIXER	BIT(18)
+#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE0	BIT(19)
+#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE1	BIT(20)
+#define MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE0	BIT(21)
+#define MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE1	BIT(22)
+#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_BE0	BIT(23)
+#define MT8195_MUTEX_MOD_DISP1_HDR_MLOAD	BIT(24)
+#define MT8195_MUTEX_MOD_DISP1_DPI0		BIT(25)
+#define MT8195_MUTEX_MOD_DISP1_DPI1		BIT(26)
+#define MT8195_MUTEX_MOD_DISP1_DP_INTF0		BIT(27)
+
 #define MT2712_MUTEX_MOD_DISP_PWM2		BIT(10)
 #define MT2712_MUTEX_MOD_DISP_OVL0		BIT(11)
 #define MT2712_MUTEX_MOD_DISP_OVL1		BIT(12)
@@ -332,6 +361,27 @@ static const unsigned long mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
 	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
 	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
+	[DDP_COMPONENT_OVL_ADAPTOR] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA0 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA1 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA2 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA3 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA4 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA5 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA6 |
+				      MT8195_MUTEX_MOD_DISP1_MDP_RDMA7 |
+				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE0 |
+				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE1 |
+				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE2 |
+				      MT8195_MUTEX_MOD_DISP1_VPP_MERGE3 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE0 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE1 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE0 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE1 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_VDO_BE0 |
+				      MT8195_MUTEX_MOD_DISP1_HDR_MLOAD |
+				      MT8195_MUTEX_MOD_DISP1_DISP_MIXER,
+	[DDP_COMPONENT_MERGE5] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE4,
+	[DDP_COMPONENT_DP_INTF1] = MT8195_MUTEX_MOD_DISP1_DP_INTF0,
 };
 
 static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
@@ -517,6 +567,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DP_INTF0:
 		sof_id = MUTEX_SOF_DP_INTF0;
 		break;
+	case DDP_COMPONENT_DP_INTF1:
+		sof_id = MUTEX_SOF_DP_INTF1;
+		break;
 	default:
 		if (mtx->data->mutex_mod[id] <= BIT(31)) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
@@ -557,6 +610,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DPI0:
 	case DDP_COMPONENT_DPI1:
 	case DDP_COMPONENT_DP_INTF0:
+	case DDP_COMPONENT_DP_INTF1:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       mtx->regs +
 			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
-- 
2.18.0

