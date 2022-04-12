Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10004FD7C8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 12:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900BD10E556;
	Tue, 12 Apr 2022 10:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3C310E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 10:31:23 +0000 (UTC)
X-UUID: 156a465d80b74a63949196669f7f2e93-20220412
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:6b62b682-7205-419b-95c6-61711279378f, OB:20,
 L
 OB:20,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,
 ACTION:release,TS:100
X-CID-INFO: VERSION:1.1.4, REQID:6b62b682-7205-419b-95c6-61711279378f, OB:20,
 LOB
 :20,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,
 ACTION:quarantine,TS:100
X-CID-META: VersionHash:faefae9, CLOUDID:a089e5a8-d103-4e36-82b9-b0e86991b3df,
 C
 OID:e31c88b20976,Recheck:0,SF:13|15|28|16|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 156a465d80b74a63949196669f7f2e93-20220412
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 375445053; Tue, 12 Apr 2022 18:31:16 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 18:31:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 Apr 2022 18:31:15 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v18 04/10] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
Date: Tue, 12 Apr 2022 18:31:08 +0800
Message-ID: <20220412103114.19922-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
References: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
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
Cc: fshao@chromium.org, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 roy-cw.yeh@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, devicetree@vger.kernel.org,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 moudy.ho@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mtk-mutex support for mt8195 vdosys0.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Fei Shao <fshao@chromium.org>
---
 drivers/soc/mediatek/mtk-mutex.c | 87 ++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index aaf8fc1abb43..729ee88035ed 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -17,6 +17,9 @@
 #define MT8183_MUTEX0_MOD0			0x30
 #define MT8183_MUTEX0_SOF0			0x2c
 
+#define MT8195_DISP_MUTEX0_MOD0			0x30
+#define MT8195_DISP_MUTEX0_SOF			0x2c
+
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
 #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
@@ -96,6 +99,20 @@
 #define MT8173_MUTEX_MOD_DISP_PWM1		24
 #define MT8173_MUTEX_MOD_DISP_OD		25
 
+#define MT8195_MUTEX_MOD_DISP_OVL0		0
+#define MT8195_MUTEX_MOD_DISP_WDMA0		1
+#define MT8195_MUTEX_MOD_DISP_RDMA0		2
+#define MT8195_MUTEX_MOD_DISP_COLOR0		3
+#define MT8195_MUTEX_MOD_DISP_CCORR0		4
+#define MT8195_MUTEX_MOD_DISP_AAL0		5
+#define MT8195_MUTEX_MOD_DISP_GAMMA0		6
+#define MT8195_MUTEX_MOD_DISP_DITHER0		7
+#define MT8195_MUTEX_MOD_DISP_DSI0		8
+#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	9
+#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
+#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
+#define MT8195_MUTEX_MOD_DISP_PWM0		27
+
 #define MT2712_MUTEX_MOD_DISP_PWM2		10
 #define MT2712_MUTEX_MOD_DISP_OVL0		11
 #define MT2712_MUTEX_MOD_DISP_OVL1		12
@@ -132,9 +149,21 @@
 #define MT8167_MUTEX_SOF_DPI1			3
 #define MT8183_MUTEX_SOF_DSI0			1
 #define MT8183_MUTEX_SOF_DPI0			2
+#define MT8195_MUTEX_SOF_DSI0			1
+#define MT8195_MUTEX_SOF_DSI1			2
+#define MT8195_MUTEX_SOF_DP_INTF0		3
+#define MT8195_MUTEX_SOF_DP_INTF1		4
+#define MT8195_MUTEX_SOF_DPI0			6 /* for HDMI_TX */
+#define MT8195_MUTEX_SOF_DPI1			5 /* for digital video out */
 
 #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
 #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
+#define MT8195_MUTEX_EOF_DSI0			(MT8195_MUTEX_SOF_DSI0 << 7)
+#define MT8195_MUTEX_EOF_DSI1			(MT8195_MUTEX_SOF_DSI1 << 7)
+#define MT8195_MUTEX_EOF_DP_INTF0		(MT8195_MUTEX_SOF_DP_INTF0 << 7)
+#define MT8195_MUTEX_EOF_DP_INTF1		(MT8195_MUTEX_SOF_DP_INTF1 << 7)
+#define MT8195_MUTEX_EOF_DPI0			(MT8195_MUTEX_SOF_DPI0 << 7)
+#define MT8195_MUTEX_EOF_DPI1			(MT8195_MUTEX_SOF_DPI1 << 7)
 
 struct mtk_mutex {
 	int id;
@@ -149,6 +178,9 @@ enum mtk_mutex_sof_id {
 	MUTEX_SOF_DPI1,
 	MUTEX_SOF_DSI2,
 	MUTEX_SOF_DSI3,
+	MUTEX_SOF_DP_INTF0,
+	MUTEX_SOF_DP_INTF1,
+	DDP_MUTEX_SOF_MAX,
 };
 
 struct mtk_mutex_data {
@@ -270,7 +302,23 @@ static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
 };
 
-static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
+static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_OVL0] = MT8195_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_WDMA0] = MT8195_MUTEX_MOD_DISP_WDMA0,
+	[DDP_COMPONENT_RDMA0] = MT8195_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_COLOR0] = MT8195_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_CCORR] = MT8195_MUTEX_MOD_DISP_CCORR0,
+	[DDP_COMPONENT_AAL0] = MT8195_MUTEX_MOD_DISP_AAL0,
+	[DDP_COMPONENT_GAMMA] = MT8195_MUTEX_MOD_DISP_GAMMA0,
+	[DDP_COMPONENT_DITHER] = MT8195_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_MERGE0] = MT8195_MUTEX_MOD_DISP_VPP_MERGE,
+	[DDP_COMPONENT_DSC0] = MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
+	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
+	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
+	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
+};
+
+static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
 	[MUTEX_SOF_DSI1] = MUTEX_SOF_DSI1,
@@ -280,7 +328,7 @@ static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
 };
 
-static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
+static const unsigned int mt8167_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
 	[MUTEX_SOF_DPI0] = MT8167_MUTEX_SOF_DPI0,
@@ -288,7 +336,7 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 };
 
 /* Add EOF setting so overlay hardware can receive frame done irq */
-static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
+static const unsigned int mt8183_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
 	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
@@ -300,6 +348,26 @@ static const unsigned int mt8186_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_DPI0] = MT8186_MUTEX_SOF_DPI0 | MT8186_MUTEX_EOF_DPI0,
 };
 
+/*
+ * To support refresh mode(video mode), DISP_REG_MUTEX_SOF should
+ * select the EOF source and configure the EOF plus timing from the
+ * module that provides the timing signal.
+ * So that MUTEX can not only send a STREAM_DONE event to GCE
+ * but also detect the error at end of frame(EAEOF) when EOF signal
+ * arrives.
+ */
+static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
+	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[MUTEX_SOF_DSI0] = MT8195_MUTEX_SOF_DSI0 | MT8195_MUTEX_EOF_DSI0,
+	[MUTEX_SOF_DSI1] = MT8195_MUTEX_SOF_DSI1 | MT8195_MUTEX_EOF_DSI1,
+	[MUTEX_SOF_DPI0] = MT8195_MUTEX_SOF_DPI0 | MT8195_MUTEX_EOF_DPI0,
+	[MUTEX_SOF_DPI1] = MT8195_MUTEX_SOF_DPI1 | MT8195_MUTEX_EOF_DPI1,
+	[MUTEX_SOF_DP_INTF0] =
+		MT8195_MUTEX_SOF_DP_INTF0 | MT8195_MUTEX_EOF_DP_INTF0,
+	[MUTEX_SOF_DP_INTF1] =
+		MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
+};
+
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -351,6 +419,13 @@ static const struct mtk_mutex_data mt8192_mutex_driver_data = {
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
+static const struct mtk_mutex_data mt8195_mutex_driver_data = {
+	.mutex_mod = mt8195_mutex_mod,
+	.mutex_sof = mt8195_mutex_sof,
+	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev)
 {
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
@@ -423,6 +498,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DPI1:
 		sof_id = MUTEX_SOF_DPI1;
 		break;
+	case DDP_COMPONENT_DP_INTF0:
+		sof_id = MUTEX_SOF_DP_INTF0;
+		break;
 	default:
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
@@ -462,6 +540,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DSI3:
 	case DDP_COMPONENT_DPI0:
 	case DDP_COMPONENT_DPI1:
+	case DDP_COMPONENT_DP_INTF0:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       mtx->regs +
 			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
@@ -587,6 +666,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8186_mutex_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = &mt8192_mutex_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-mutex",
+	  .data = &mt8195_mutex_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
-- 
2.18.0

