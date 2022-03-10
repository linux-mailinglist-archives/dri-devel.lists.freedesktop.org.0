Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4D4D3FFC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 04:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5ED10E680;
	Thu, 10 Mar 2022 03:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F046D10E541
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 03:55:25 +0000 (UTC)
X-UUID: cf25149c340a4c008d41b531dc41e502-20220310
X-UUID: cf25149c340a4c008d41b531dc41e502-20220310
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1865213009; Thu, 10 Mar 2022 11:55:18 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 11:55:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Mar 2022 11:55:17 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Subject: [PATCH v14 08/22] soc: mediatek: change the mutex defines and the
 mutex_mod type
Date: Thu, 10 Mar 2022 11:55:01 +0800
Message-ID: <20220310035515.16881-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220310035515.16881-1-nancy.lin@mediatek.com>
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a preparation for adding support for mt8195 vdosys1 mutex.
The vdosys1 path component contains ovl_adaptor, merge5,
and dp_intf1. Ovl_adaptor is composed of several sub-elements,
so change it to support multi-bit control.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 264 +++++++++++++++----------------
 1 file changed, 132 insertions(+), 132 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 1c7ffcdadcea..cb791671d751 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -29,16 +29,16 @@
 
 #define INT_MUTEX				BIT(1)
 
-#define MT8186_MUTEX_MOD_DISP_OVL0		0
-#define MT8186_MUTEX_MOD_DISP_OVL0_2L		1
-#define MT8186_MUTEX_MOD_DISP_RDMA0		2
-#define MT8186_MUTEX_MOD_DISP_COLOR0		4
-#define MT8186_MUTEX_MOD_DISP_CCORR0		5
-#define MT8186_MUTEX_MOD_DISP_AAL0		7
-#define MT8186_MUTEX_MOD_DISP_GAMMA0		8
-#define MT8186_MUTEX_MOD_DISP_POSTMASK0		9
-#define MT8186_MUTEX_MOD_DISP_DITHER0		10
-#define MT8186_MUTEX_MOD_DISP_RDMA1		17
+#define MT8186_MUTEX_MOD_DISP_OVL0		BIT(0)
+#define MT8186_MUTEX_MOD_DISP_OVL0_2L		BIT(1)
+#define MT8186_MUTEX_MOD_DISP_RDMA0		BIT(2)
+#define MT8186_MUTEX_MOD_DISP_COLOR0		BIT(4)
+#define MT8186_MUTEX_MOD_DISP_CCORR0		BIT(5)
+#define MT8186_MUTEX_MOD_DISP_AAL0		BIT(7)
+#define MT8186_MUTEX_MOD_DISP_GAMMA0		BIT(8)
+#define MT8186_MUTEX_MOD_DISP_POSTMASK0		BIT(9)
+#define MT8186_MUTEX_MOD_DISP_DITHER0		BIT(10)
+#define MT8186_MUTEX_MOD_DISP_RDMA1		BIT(17)
 
 #define MT8186_MUTEX_SOF_SINGLE_MODE		0
 #define MT8186_MUTEX_SOF_DSI0			1
@@ -46,113 +46,113 @@
 #define MT8186_MUTEX_EOF_DSI0			(MT8186_MUTEX_SOF_DSI0 << 6)
 #define MT8186_MUTEX_EOF_DPI0			(MT8186_MUTEX_SOF_DPI0 << 6)
 
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
-#define MT8192_MUTEX_MOD_DISP_OVL0		0
-#define MT8192_MUTEX_MOD_DISP_OVL0_2L		1
-#define MT8192_MUTEX_MOD_DISP_RDMA0		2
-#define MT8192_MUTEX_MOD_DISP_COLOR0		4
-#define MT8192_MUTEX_MOD_DISP_CCORR0		5
-#define MT8192_MUTEX_MOD_DISP_AAL0		6
-#define MT8192_MUTEX_MOD_DISP_GAMMA0		7
-#define MT8192_MUTEX_MOD_DISP_POSTMASK0		8
-#define MT8192_MUTEX_MOD_DISP_DITHER0		9
-#define MT8192_MUTEX_MOD_DISP_OVL2_2L		16
-#define MT8192_MUTEX_MOD_DISP_RDMA4		17
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
+#define MT8192_MUTEX_MOD_DISP_OVL0		BIT(0)
+#define MT8192_MUTEX_MOD_DISP_OVL0_2L		BIT(1)
+#define MT8192_MUTEX_MOD_DISP_RDMA0		BIT(2)
+#define MT8192_MUTEX_MOD_DISP_COLOR0		BIT(4)
+#define MT8192_MUTEX_MOD_DISP_CCORR0		BIT(5)
+#define MT8192_MUTEX_MOD_DISP_AAL0		BIT(6)
+#define MT8192_MUTEX_MOD_DISP_GAMMA0		BIT(7)
+#define MT8192_MUTEX_MOD_DISP_POSTMASK0		BIT(8)
+#define MT8192_MUTEX_MOD_DISP_DITHER0		BIT(9)
+#define MT8192_MUTEX_MOD_DISP_OVL2_2L		BIT(16)
+#define MT8192_MUTEX_MOD_DISP_RDMA4		BIT(17)
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
+#define MT2712_MUTEX_MOD2_DISP_AAL1		BIT_ULL(33)
+#define MT2712_MUTEX_MOD2_DISP_OD1		BIT_ULL(34)
+
+#define MT2701_MUTEX_MOD_DISP_OVL		BIT(3)
+#define MT2701_MUTEX_MOD_DISP_WDMA		BIT(6)
+#define MT2701_MUTEX_MOD_DISP_COLOR		BIT(7)
+#define MT2701_MUTEX_MOD_DISP_BLS		BIT(9)
+#define MT2701_MUTEX_MOD_DISP_RDMA0		BIT(10)
+#define MT2701_MUTEX_MOD_DISP_RDMA1		BIT(12)
 
 #define MT2712_MUTEX_SOF_SINGLE_MODE		0
 #define MT2712_MUTEX_SOF_DSI0			1
@@ -200,7 +200,7 @@ enum mtk_mutex_sof_id {
 };
 
 struct mtk_mutex_data {
-	const unsigned int *mutex_mod;
+	const u64 *mutex_mod;
 	const unsigned int *mutex_sof;
 	const unsigned int mutex_mod_reg;
 	const unsigned int mutex_sof_reg;
@@ -215,7 +215,7 @@ struct mtk_mutex_ctx {
 	const struct mtk_mutex_data	*data;
 };
 
-static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const u64 mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_BLS] = MT2701_MUTEX_MOD_DISP_BLS,
 	[DDP_COMPONENT_COLOR0] = MT2701_MUTEX_MOD_DISP_COLOR,
 	[DDP_COMPONENT_OVL0] = MT2701_MUTEX_MOD_DISP_OVL,
@@ -224,7 +224,7 @@ static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT2701_MUTEX_MOD_DISP_WDMA,
 };
 
-static const unsigned int mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const u64 mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT2712_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_AAL1] = MT2712_MUTEX_MOD2_DISP_AAL1,
 	[DDP_COMPONENT_COLOR0] = MT2712_MUTEX_MOD_DISP_COLOR0,
@@ -244,7 +244,7 @@ static const unsigned int mt2712_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1] = MT2712_MUTEX_MOD_DISP_WDMA1,
 };
 
-static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const u64 mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8167_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_CCORR] = MT8167_MUTEX_MOD_DISP_CCORR,
 	[DDP_COMPONENT_COLOR0] = MT8167_MUTEX_MOD_DISP_COLOR,
@@ -259,7 +259,7 @@ static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8167_MUTEX_MOD_DISP_WDMA0,
 };
 
-static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const u64 mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8173_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_COLOR0] = MT8173_MUTEX_MOD_DISP_COLOR0,
 	[DDP_COMPONENT_COLOR1] = MT8173_MUTEX_MOD_DISP_COLOR1,
@@ -277,7 +277,7 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
 };
 
-static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const u64 mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
@@ -291,7 +291,7 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
 };
 
-static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const u64 mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8186_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8186_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8186_MUTEX_MOD_DISP_COLOR0,
@@ -304,7 +304,7 @@ static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA1] = MT8186_MUTEX_MOD_DISP_RDMA1,
 };
 
-static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const u64 mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
@@ -318,7 +318,7 @@ static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
 };
 
-static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+static const u64 mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_OVL0] = MT8195_MUTEX_MOD_DISP_OVL0,
 	[DDP_COMPONENT_WDMA0] = MT8195_MUTEX_MOD_DISP_WDMA0,
 	[DDP_COMPONENT_RDMA0] = MT8195_MUTEX_MOD_DISP_RDMA0,
@@ -518,16 +518,16 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 		sof_id = MUTEX_SOF_DP_INTF0;
 		break;
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
@@ -563,16 +563,16 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
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

