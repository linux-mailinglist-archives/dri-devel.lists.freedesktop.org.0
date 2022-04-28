Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052FE5131A9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 12:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB2710E9E3;
	Thu, 28 Apr 2022 10:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4616B10E771
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 10:54:18 +0000 (UTC)
X-UUID: 9120c72babb44bb98082a22918b57175-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4e006998-b699-4d2c-8ffa-104954ae2f20, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-3
X-CID-INFO: VERSION:1.1.4, REQID:4e006998-b699-4d2c-8ffa-104954ae2f20, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:-3
X-CID-META: VersionHash:faefae9, CLOUDID:c7ed0a2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:28|100|17|19|48|101|20,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 9120c72babb44bb98082a22918b57175-20220428
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1072845293; Thu, 28 Apr 2022 18:54:14 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 28 Apr 2022 18:54:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Apr 2022 18:54:12 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Subject: [PATCH v18 08/21] soc: mediatek: add mtk-mutex support for mt8195
 vdosys1
Date: Thu, 28 Apr 2022 18:53:55 +0800
Message-ID: <20220428105408.11189-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220428105408.11189-1-nancy.lin@mediatek.com>
References: <20220428105408.11189-1-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mtk-mutex support for mt8195 vdosys1.
The vdosys1 path component contains ovl_adaptor, merge5,
and dp_intf1. Ovl_adaptor is composed of several sub-elements
which include MDP_RDMA0~7, MERGE0~3, and ETHDR.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 981d56967e7a..78197ebf5595 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -110,6 +110,24 @@
 #define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
 #define MT8195_MUTEX_MOD_DISP_PWM0		27
 
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA0	0
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA1	1
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA2	2
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA3	3
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA4	4
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA5	5
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA6	6
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA7	7
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE0	8
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE1	9
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE2	10
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE3	11
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE4	12
+#define MT8195_MUTEX_MOD_DISP1_DISP_MIXER	18
+#define MT8195_MUTEX_MOD_DISP1_DPI0		25
+#define MT8195_MUTEX_MOD_DISP1_DPI1		26
+#define MT8195_MUTEX_MOD_DISP1_DP_INTF0		27
+
 #define MT2712_MUTEX_MOD_DISP_PWM2		10
 #define MT2712_MUTEX_MOD_DISP_OVL0		11
 #define MT2712_MUTEX_MOD_DISP_OVL1		12
@@ -313,6 +331,21 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
 	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
 	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
+	[DDP_COMPONENT_MDP_RDMA0] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA0,
+	[DDP_COMPONENT_MDP_RDMA1] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA1,
+	[DDP_COMPONENT_MDP_RDMA2] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA2,
+	[DDP_COMPONENT_MDP_RDMA3] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA3,
+	[DDP_COMPONENT_MDP_RDMA4] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA4,
+	[DDP_COMPONENT_MDP_RDMA5] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA5,
+	[DDP_COMPONENT_MDP_RDMA6] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA6,
+	[DDP_COMPONENT_MDP_RDMA7] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA7,
+	[DDP_COMPONENT_MERGE1] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE0,
+	[DDP_COMPONENT_MERGE2] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE1,
+	[DDP_COMPONENT_MERGE3] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE2,
+	[DDP_COMPONENT_MERGE4] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE3,
+	[DDP_COMPONENT_ETHDR_MIXER] = MT8195_MUTEX_MOD_DISP1_DISP_MIXER,
+	[DDP_COMPONENT_MERGE5] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE4,
+	[DDP_COMPONENT_DP_INTF1] = MT8195_MUTEX_MOD_DISP1_DP_INTF0,
 };
 
 static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
@@ -498,6 +531,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DP_INTF0:
 		sof_id = MUTEX_SOF_DP_INTF0;
 		break;
+	case DDP_COMPONENT_DP_INTF1:
+		sof_id = MUTEX_SOF_DP_INTF1;
+		break;
 	default:
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
@@ -538,6 +574,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DPI0:
 	case DDP_COMPONENT_DPI1:
 	case DDP_COMPONENT_DP_INTF0:
+	case DDP_COMPONENT_DP_INTF1:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       mtx->regs +
 			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
-- 
2.18.0

