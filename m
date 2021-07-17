Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F66C3CC4B7
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 19:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835BA6EA92;
	Sat, 17 Jul 2021 17:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E74B6EA2E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 09:09:35 +0000 (UTC)
X-UUID: cccbe182d9a74462aee7591c3eb8aa7e-20210717
X-UUID: cccbe182d9a74462aee7591c3eb8aa7e-20210717
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1964818681; Sat, 17 Jul 2021 17:04:31 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:24 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v1 05/10] soc: mediatek: add mtk-mutex support for mt8195
 vdosys1
Date: Sat, 17 Jul 2021 17:04:03 +0800
Message-ID: <20210717090408.28283-6-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 17 Jul 2021 17:08:05 +0000
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
The vdosys1 path component contains pseudo_ovl, ethdr, merge5,
and dp_intf1. Pseudo_ovl and ethdr components are both composed
of several sub-elements, so change it to support multi-bit control.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 270 ++++++++++++++++++-------------
 1 file changed, 162 insertions(+), 108 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index cb8bbf7f3fd8..9c40b394f533 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -29,101 +29,130 @@
 
 #define INT_MUTEX				BIT(1)
 
-#define MT8167_MUTEX_MOD_DISP_PWM		1
-#define MT8167_MUTEX_MOD_DISP_OVL0		6
-#define MT8167_MUTEX_MOD_DISP_OVL1		7
-#define MT8167_MUTEX_MOD_DISP_RDMA0		8
-#define MT8167_MUTEX_MOD_DISP_RDMA1		9
-#define MT8167_MUTEX_MOD_DISP_WDMA0		10
-#define MT8167_MUTEX_MOD_DISP_CCORR		11
-#define MT8167_MUTEX_MOD_DISP_COLOR		12
-#define MT8167_MUTEX_MOD_DISP_AAL		13
-#define MT8167_MUTEX_MOD_DISP_GAMMA		14
-#define MT8167_MUTEX_MOD_DISP_DITHER		15
-#define MT8167_MUTEX_MOD_DISP_UFOE		16
-
-#define MT8183_MUTEX_MOD_DISP_RDMA0		0
-#define MT8183_MUTEX_MOD_DISP_RDMA1		1
-#define MT8183_MUTEX_MOD_DISP_OVL0		9
-#define MT8183_MUTEX_MOD_DISP_OVL0_2L		10
-#define MT8183_MUTEX_MOD_DISP_OVL1_2L		11
-#define MT8183_MUTEX_MOD_DISP_WDMA0		12
-#define MT8183_MUTEX_MOD_DISP_COLOR0		13
-#define MT8183_MUTEX_MOD_DISP_CCORR0		14
-#define MT8183_MUTEX_MOD_DISP_AAL0		15
-#define MT8183_MUTEX_MOD_DISP_GAMMA0		16
-#define MT8183_MUTEX_MOD_DISP_DITHER0		17
-
-#define MT8173_MUTEX_MOD_DISP_OVL0		11
-#define MT8173_MUTEX_MOD_DISP_OVL1		12
-#define MT8173_MUTEX_MOD_DISP_RDMA0		13
-#define MT8173_MUTEX_MOD_DISP_RDMA1		14
-#define MT8173_MUTEX_MOD_DISP_RDMA2		15
-#define MT8173_MUTEX_MOD_DISP_WDMA0		16
-#define MT8173_MUTEX_MOD_DISP_WDMA1		17
-#define MT8173_MUTEX_MOD_DISP_COLOR0		18
-#define MT8173_MUTEX_MOD_DISP_COLOR1		19
-#define MT8173_MUTEX_MOD_DISP_AAL		20
-#define MT8173_MUTEX_MOD_DISP_GAMMA		21
-#define MT8173_MUTEX_MOD_DISP_UFOE		22
-#define MT8173_MUTEX_MOD_DISP_PWM0		23
-#define MT8173_MUTEX_MOD_DISP_PWM1		24
-#define MT8173_MUTEX_MOD_DISP_OD		25
-
-#define MT8195_MUTEX_MOD_DISP_OVL0		0
-#define MT8195_MUTEX_MOD_DISP_WDMA0		1
-#define MT8195_MUTEX_MOD_DISP_RDMA0		2
-#define MT8195_MUTEX_MOD_DISP_COLOR0		3
-#define MT8195_MUTEX_MOD_DISP_CCORR0		4
-#define MT8195_MUTEX_MOD_DISP_AAL0		5
-#define MT8195_MUTEX_MOD_DISP_GAMMA0		6
-#define MT8195_MUTEX_MOD_DISP_DITHER0		7
-#define MT8195_MUTEX_MOD_DISP_DSI0		8
-#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	9
-#define MT8195_MUTEX_MOD_DISP_OVL1		10
-#define MT8195_MUTEX_MOD_DISP_WDMA1		11
-#define MT8195_MUTEX_MOD_DISP_RDMA1		12
-#define MT8195_MUTEX_MOD_DISP_COLOR1		13
-#define MT8195_MUTEX_MOD_DISP_CCORR1		14
-#define MT8195_MUTEX_MOD_DISP_AAL1		15
-#define MT8195_MUTEX_MOD_DISP_GAMMA1		16
-#define MT8195_MUTEX_MOD_DISP_DITHER1		17
-#define MT8195_MUTEX_MOD_DISP_DSI1		18
-#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE1	19
-#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
-#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
-#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0	22
-#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1	23
-#define MT8195_MUTEX_MOD_DISP_VDO1_DL_RELAY2	24
-#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY3	25
-#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY4	26
-#define MT8195_MUTEX_MOD_DISP_PWM0		27
-#define MT8195_MUTEX_MOD_DISP_PWM1		28
-
-#define MT2712_MUTEX_MOD_DISP_PWM2		10
-#define MT2712_MUTEX_MOD_DISP_OVL0		11
-#define MT2712_MUTEX_MOD_DISP_OVL1		12
-#define MT2712_MUTEX_MOD_DISP_RDMA0		13
-#define MT2712_MUTEX_MOD_DISP_RDMA1		14
-#define MT2712_MUTEX_MOD_DISP_RDMA2		15
-#define MT2712_MUTEX_MOD_DISP_WDMA0		16
-#define MT2712_MUTEX_MOD_DISP_WDMA1		17
-#define MT2712_MUTEX_MOD_DISP_COLOR0		18
-#define MT2712_MUTEX_MOD_DISP_COLOR1		19
-#define MT2712_MUTEX_MOD_DISP_AAL0		20
-#define MT2712_MUTEX_MOD_DISP_UFOE		22
-#define MT2712_MUTEX_MOD_DISP_PWM0		23
-#define MT2712_MUTEX_MOD_DISP_PWM1		24
-#define MT2712_MUTEX_MOD_DISP_OD0		25
-#define MT2712_MUTEX_MOD2_DISP_AAL1		33
-#define MT2712_MUTEX_MOD2_DISP_OD1		34
-
-#define MT2701_MUTEX_MOD_DISP_OVL		3
-#define MT2701_MUTEX_MOD_DISP_WDMA		6
-#define MT2701_MUTEX_MOD_DISP_COLOR		7
-#define MT2701_MUTEX_MOD_DISP_BLS		9
-#define MT2701_MUTEX_MOD_DISP_RDMA0		10
-#define MT2701_MUTEX_MOD_DISP_RDMA1		12
+#define MT8167_MUTEX_MOD_DISP_PWM		BIT(1)
+#define MT8167_MUTEX_MOD_DISP_OVL0		BIT(6)
+#define MT8167_MUTEX_MOD_DISP_OVL1		BIT(7)
+#define MT8167_MUTEX_MOD_DISP_RDMA0		BIT(8)
+#define MT8167_MUTEX_MOD_DISP_RDMA1		BIT(9)
+#define MT8167_MUTEX_MOD_DISP_WDMA0		BIT(10)
+#define MT8167_MUTEX_MOD_DISP_CCORR		BIT(11)
+#define MT8167_MUTEX_MOD_DISP_COLOR		BIT(12)
+#define MT8167_MUTEX_MOD_DISP_AAL		BIT(13)
+#define MT8167_MUTEX_MOD_DISP_GAMMA		BIT(14)
+#define MT8167_MUTEX_MOD_DISP_DITHER		BIT(15)
+#define MT8167_MUTEX_MOD_DISP_UFOE		BIT(16)
+
+#define MT8183_MUTEX_MOD_DISP_RDMA0		BIT(0)
+#define MT8183_MUTEX_MOD_DISP_RDMA1		BIT(1)
+#define MT8183_MUTEX_MOD_DISP_OVL0		BIT(9)
+#define MT8183_MUTEX_MOD_DISP_OVL0_2L		BIT(10)
+#define MT8183_MUTEX_MOD_DISP_OVL1_2L		BIT(11)
+#define MT8183_MUTEX_MOD_DISP_WDMA0		BIT(12)
+#define MT8183_MUTEX_MOD_DISP_COLOR0		BIT(13)
+#define MT8183_MUTEX_MOD_DISP_CCORR0		BIT(14)
+#define MT8183_MUTEX_MOD_DISP_AAL0		BIT(15)
+#define MT8183_MUTEX_MOD_DISP_GAMMA0		BIT(16)
+#define MT8183_MUTEX_MOD_DISP_DITHER0		BIT(17)
+
+#define MT8173_MUTEX_MOD_DISP_OVL0		BIT(11)
+#define MT8173_MUTEX_MOD_DISP_OVL1		BIT(12)
+#define MT8173_MUTEX_MOD_DISP_RDMA0		BIT(13)
+#define MT8173_MUTEX_MOD_DISP_RDMA1		BIT(14)
+#define MT8173_MUTEX_MOD_DISP_RDMA2		BIT(15)
+#define MT8173_MUTEX_MOD_DISP_WDMA0		BIT(16)
+#define MT8173_MUTEX_MOD_DISP_WDMA1		BIT(17)
+#define MT8173_MUTEX_MOD_DISP_COLOR0		BIT(18)
+#define MT8173_MUTEX_MOD_DISP_COLOR1		BIT(19)
+#define MT8173_MUTEX_MOD_DISP_AAL		BIT(20)
+#define MT8173_MUTEX_MOD_DISP_GAMMA		BIT(21)
+#define MT8173_MUTEX_MOD_DISP_UFOE		BIT(22)
+#define MT8173_MUTEX_MOD_DISP_PWM0		BIT(23)
+#define MT8173_MUTEX_MOD_DISP_PWM1		BIT(24)
+#define MT8173_MUTEX_MOD_DISP_OD		BIT(25)
+
+#define MT8195_MUTEX_MOD_DISP_OVL0		BIT(0)
+#define MT8195_MUTEX_MOD_DISP_WDMA0		BIT(1)
+#define MT8195_MUTEX_MOD_DISP_RDMA0		BIT(2)
+#define MT8195_MUTEX_MOD_DISP_COLOR0		BIT(3)
+#define MT8195_MUTEX_MOD_DISP_CCORR0		BIT(4)
+#define MT8195_MUTEX_MOD_DISP_AAL0		BIT(5)
+#define MT8195_MUTEX_MOD_DISP_GAMMA0		BIT(6)
+#define MT8195_MUTEX_MOD_DISP_DITHER0		BIT(7)
+#define MT8195_MUTEX_MOD_DISP_DSI0		BIT(8)
+#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	BIT(9)
+#define MT8195_MUTEX_MOD_DISP_OVL1		BIT(10)
+#define MT8195_MUTEX_MOD_DISP_WDMA1		BIT(11)
+#define MT8195_MUTEX_MOD_DISP_RDMA1		BIT(12)
+#define MT8195_MUTEX_MOD_DISP_COLOR1		BIT(13)
+#define MT8195_MUTEX_MOD_DISP_CCORR1		BIT(14)
+#define MT8195_MUTEX_MOD_DISP_AAL1		BIT(15)
+#define MT8195_MUTEX_MOD_DISP_GAMMA1		BIT(16)
+#define MT8195_MUTEX_MOD_DISP_DITHER1		BIT(17)
+#define MT8195_MUTEX_MOD_DISP_DSI1		BIT(18)
+#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE1	BIT(19)
+#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		BIT(20)
+#define MT8195_MUTEX_MOD_DISP_DP_INTF0		BIT(21)
+#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0	BIT(22)
+#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1	BIT(23)
+#define MT8195_MUTEX_MOD_DISP_VDO1_DL_RELAY2	BIT(24)
+#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY3	BIT(25)
+#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY4	BIT(26)
+#define MT8195_MUTEX_MOD_DISP_PWM0		BIT(27)
+#define MT8195_MUTEX_MOD_DISP_PWM1		BIT(28)
+
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA0 BIT(0)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA1 BIT(1)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA2 BIT(2)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA3 BIT(3)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA4 BIT(4)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA5 BIT(5)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA6 BIT(6)
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA7 BIT(7)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE0 BIT(8)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE1 BIT(9)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE2 BIT(10)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE3 BIT(11)
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE4 BIT(12)
+#define MT8195_MUTEX_MOD_DISP1_VPP2_DL_RELAY BIT(13)
+#define MT8195_MUTEX_MOD_DISP1_VPP3_DL_RELAY BIT(14)
+#define MT8195_MUTEX_MOD_DISP1_VDO0_DSC_DL_ASYNC BIT(15)
+#define MT8195_MUTEX_MOD_DISP1_VDO0_MERGE_DL_ASYNC BIT(16)
+#define MT8195_MUTEX_MOD_DISP1_VDO1_OUT_DL_RELAY BIT(17)
+#define MT8195_MUTEX_MOD_DISP1_DISP_MIXER BIT(18)
+#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE0 BIT(19)
+#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE1 BIT(20)
+#define MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE0 BIT(21)
+#define MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE1 BIT(22)
+#define MT8195_MUTEX_MOD_DISP1_HDR_VDO_BE0 BIT(23)
+#define MT8195_MUTEX_MOD_DISP1_HDR_MLOAD BIT(24)
+#define MT8195_MUTEX_MOD_DISP1_DPI0 BIT(25)
+#define MT8195_MUTEX_MOD_DISP1_DPI1 BIT(26)
+#define MT8195_MUTEX_MOD_DISP1_DP_INTF0 BIT(27)
+
+#define MT2712_MUTEX_MOD_DISP_PWM2		BIT(10)
+#define MT2712_MUTEX_MOD_DISP_OVL0		BIT(11)
+#define MT2712_MUTEX_MOD_DISP_OVL1		BIT(12)
+#define MT2712_MUTEX_MOD_DISP_RDMA0		BIT(13)
+#define MT2712_MUTEX_MOD_DISP_RDMA1		BIT(14)
+#define MT2712_MUTEX_MOD_DISP_RDMA2		BIT(15)
+#define MT2712_MUTEX_MOD_DISP_WDMA0		BIT(16)
+#define MT2712_MUTEX_MOD_DISP_WDMA1		BIT(17)
+#define MT2712_MUTEX_MOD_DISP_COLOR0		BIT(18)
+#define MT2712_MUTEX_MOD_DISP_COLOR1		BIT(19)
+#define MT2712_MUTEX_MOD_DISP_AAL0		BIT(20)
+#define MT2712_MUTEX_MOD_DISP_UFOE		BIT(22)
+#define MT2712_MUTEX_MOD_DISP_PWM0		BIT(23)
+#define MT2712_MUTEX_MOD_DISP_PWM1		BIT(24)
+#define MT2712_MUTEX_MOD_DISP_OD0		BIT(25)
+#define MT2712_MUTEX_MOD2_DISP_AAL1		BIT(33)
+#define MT2712_MUTEX_MOD2_DISP_OD1		BIT(34)
+
+#define MT2701_MUTEX_MOD_DISP_OVL		BIT(3)
+#define MT2701_MUTEX_MOD_DISP_WDMA		BIT(6)
+#define MT2701_MUTEX_MOD_DISP_COLOR		BIT(7)
+#define MT2701_MUTEX_MOD_DISP_BLS		BIT(9)
+#define MT2701_MUTEX_MOD_DISP_RDMA0		BIT(10)
+#define MT2701_MUTEX_MOD_DISP_RDMA1		BIT(12)
 
 #define MT2712_MUTEX_SOF_SINGLE_MODE		0
 #define MT2712_MUTEX_SOF_DSI0			1
@@ -174,7 +203,7 @@ enum mtk_mutex_sof_id {
 };
 
 struct mtk_mutex_data {
-	const unsigned int *mutex_mod;
+	const unsigned long *mutex_mod;
 	const unsigned int *mutex_sof;
 	const unsigned int mutex_mod_reg;
 	const unsigned int mutex_sof_reg;
@@ -189,7 +218,7 @@ struct mtk_mutex_ctx {
 	const struct mtk_mutex_data	*data;
 };
 
-static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_BLS] = MT2701_MUTEX_MOD_DISP_BLS,
 	[DDP_COMPONENT_COLOR0] = MT2701_MUTEX_MOD_DISP_COLOR,
 	[DDP_COMPONENT_OVL0] = MT2701_MUTEX_MOD_DISP_OVL,
@@ -198,7 +227,7 @@ static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT2701_MUTEX_MOD_DISP_WDMA,
 };
 
-static const unsigned int mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT2712_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_AAL1] = MT2712_MUTEX_MOD2_DISP_AAL1,
 	[DDP_COMPONENT_COLOR0] = MT2712_MUTEX_MOD_DISP_COLOR0,
@@ -218,7 +247,7 @@ static const unsigned int mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1] = MT2712_MUTEX_MOD_DISP_WDMA1,
 };
 
-static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8167_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_CCORR] = MT8167_MUTEX_MOD_DISP_CCORR,
 	[DDP_COMPONENT_COLOR0] = MT8167_MUTEX_MOD_DISP_COLOR,
@@ -233,7 +262,7 @@ static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8167_MUTEX_MOD_DISP_WDMA0,
 };
 
-static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8173_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_COLOR0] = MT8173_MUTEX_MOD_DISP_COLOR0,
 	[DDP_COMPONENT_COLOR1] = MT8173_MUTEX_MOD_DISP_COLOR1,
@@ -251,7 +280,7 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
 };
 
-static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
@@ -265,7 +294,7 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
 };
 
-static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const unsigned long mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_OVL0] = MT8195_MUTEX_MOD_DISP_OVL0,
 	[DDP_COMPONENT_WDMA0] = MT8195_MUTEX_MOD_DISP_WDMA0,
 	[DDP_COMPONENT_RDMA0] = MT8195_MUTEX_MOD_DISP_RDMA0,
@@ -278,6 +307,27 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DSC0] = MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
 	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
 	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
+	[DDP_COMPONENT_PSEUDO_OVL] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA0 |
+				     MT8195_MUTEX_MOD_DISP1_MDP_RDMA1 |
+				     MT8195_MUTEX_MOD_DISP1_MDP_RDMA2 |
+				     MT8195_MUTEX_MOD_DISP1_MDP_RDMA3 |
+				     MT8195_MUTEX_MOD_DISP1_MDP_RDMA4 |
+				     MT8195_MUTEX_MOD_DISP1_MDP_RDMA5 |
+				     MT8195_MUTEX_MOD_DISP1_MDP_RDMA6 |
+				     MT8195_MUTEX_MOD_DISP1_MDP_RDMA7 |
+				     MT8195_MUTEX_MOD_DISP1_VPP_MERGE0 |
+				     MT8195_MUTEX_MOD_DISP1_VPP_MERGE1 |
+				     MT8195_MUTEX_MOD_DISP1_VPP_MERGE2 |
+				     MT8195_MUTEX_MOD_DISP1_VPP_MERGE3,
+	[DDP_COMPONENT_ETHDR] = MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE0 |
+				MT8195_MUTEX_MOD_DISP1_HDR_VDO_FE1 |
+				MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE0 |
+				MT8195_MUTEX_MOD_DISP1_HDR_GFX_FE1 |
+				MT8195_MUTEX_MOD_DISP1_HDR_VDO_BE0 |
+				MT8195_MUTEX_MOD_DISP1_HDR_MLOAD |
+				MT8195_MUTEX_MOD_DISP1_DISP_MIXER,
+	[DDP_COMPONENT_MERGE5] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE4,
+	[DDP_COMPONENT_DP_INTF1] = MT8195_MUTEX_MOD_DISP1_DP_INTF0,
 };
 
 static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
@@ -432,17 +482,20 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DPI1:
 		sof_id = MUTEX_SOF_DPI1;
 		break;
+	case DDP_COMPONENT_DP_INTF1:
+		sof_id = MUTEX_SOF_DP_INTF1;
+		break;
 	default:
-		if (mtx->data->mutex_mod[id] < 32) {
+		if (mtx->data->mutex_mod[id] <= BIT(31)) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
 			reg = readl_relaxed(mtx->regs + offset);
-			reg |= 1 << mtx->data->mutex_mod[id];
+			reg |= mtx->data->mutex_mod[id];
 			writel_relaxed(reg, mtx->regs + offset);
 		} else {
 			offset = DISP_REG_MUTEX_MOD2(mutex->id);
 			reg = readl_relaxed(mtx->regs + offset);
-			reg |= 1 << (mtx->data->mutex_mod[id] - 32);
+			reg |= (mtx->data->mutex_mod[id] >> 32);
 			writel_relaxed(reg, mtx->regs + offset);
 		}
 		return;
@@ -471,22 +524,23 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DSI3:
 	case DDP_COMPONENT_DPI0:
 	case DDP_COMPONENT_DPI1:
+	case DDP_COMPONENT_DP_INTF1:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       mtx->regs +
 			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
 						  mutex->id));
 		break;
 	default:
-		if (mtx->data->mutex_mod[id] < 32) {
+		if (mtx->data->mutex_mod[id] <= BIT(31)) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
 			reg = readl_relaxed(mtx->regs + offset);
-			reg &= ~(1 << mtx->data->mutex_mod[id]);
+			reg &= ~(mtx->data->mutex_mod[id]);
 			writel_relaxed(reg, mtx->regs + offset);
 		} else {
 			offset = DISP_REG_MUTEX_MOD2(mutex->id);
 			reg = readl_relaxed(mtx->regs + offset);
-			reg &= ~(1 << (mtx->data->mutex_mod[id] - 32));
+			reg &= ~(mtx->data->mutex_mod[id] >> 32);
 			writel_relaxed(reg, mtx->regs + offset);
 		}
 		break;
-- 
2.18.0

