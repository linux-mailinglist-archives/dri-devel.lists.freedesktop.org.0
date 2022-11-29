Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BEA63C2B8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 15:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A837310E0B1;
	Tue, 29 Nov 2022 14:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4ACE10E01F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:35:25 +0000 (UTC)
X-UUID: 28bef48adae342a9891873079e9fdbbe-20221129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=e7aSO5Px71PSkn6UcQE0XK2Ia41A54VIe8lQeQ3JPaY=; 
 b=qqDJOrzXR5WCl8iRvmJCvLEmoGJxQ8Fyzm64f1Mb/CoMAM805eB0GOI7KDU82ztFVmRPYgVAkpuo6plDywT09vrx9tudF74i4JVRE6C3S/CA0M8O7SGdbRmdZ65o8Xi56q0ETm/TlySZJ0280/XRn/ZDjqVsvVg2va3bZN7bl4o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:8ac7683a-e541-4f13-ac33-e15e912c584d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.14, REQID:8ac7683a-e541-4f13-ac33-e15e912c584d, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:dcaaed0, CLOUDID:46852730-2938-482e-aafd-98d66723b8a9,
 B
 ulkID:221129223520YIKXLDA4,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 28bef48adae342a9891873079e9fdbbe-20221129
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1958177767; Tue, 29 Nov 2022 22:35:18 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 29 Nov 2022 22:35:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 29 Nov 2022 22:35:17 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v3 5/6] soc: mediatek: add mtk-mutex support for mt8188 vdosys0
Date: Tue, 29 Nov 2022 22:35:02 +0800
Message-ID: <20221129143503.16638-6-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221129143503.16638-1-nathan.lu@mediatek.com>
References: <20221129143503.16638-1-nathan.lu@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, devicetree@vger.kernel.org,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 amy zhang <Amy.Zhang@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Lu <nathan.lu@mediatek.com>

add mtk-mutex support for mt8188 vdosys0.

Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 53 ++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index c1a33d52038e..77d1c084cbb1 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -116,6 +116,21 @@
 #define MT8173_MUTEX_MOD_DISP_PWM1		24
 #define MT8173_MUTEX_MOD_DISP_OD		25
 
+#define MT8188_MUTEX_MOD_DISP_OVL0		0
+#define MT8188_MUTEX_MOD_DISP_WDMA0		1
+#define MT8188_MUTEX_MOD_DISP_RDMA0		2
+#define MT8188_MUTEX_MOD_DISP_COLOR0		3
+#define MT8188_MUTEX_MOD_DISP_CCORR0		4
+#define MT8188_MUTEX_MOD_DISP_AAL0		5
+#define MT8188_MUTEX_MOD_DISP_GAMMA0		6
+#define MT8188_MUTEX_MOD_DISP_DITHER0		7
+#define MT8188_MUTEX_MOD_DISP_DSI0		8
+#define MT8188_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	9
+#define MT8188_MUTEX_MOD_DISP_VPP_MERGE		20
+#define MT8188_MUTEX_MOD_DISP_DP_INTF0		21
+#define MT8188_MUTEX_MOD_DISP_POSTMASK0		24
+#define MT8188_MUTEX_MOD2_DISP_PWM0		33
+
 #define MT8195_MUTEX_MOD_DISP_OVL0		0
 #define MT8195_MUTEX_MOD_DISP_WDMA0		1
 #define MT8195_MUTEX_MOD_DISP_RDMA0		2
@@ -180,6 +195,8 @@
 #define MT8167_MUTEX_SOF_DPI1			3
 #define MT8183_MUTEX_SOF_DSI0			1
 #define MT8183_MUTEX_SOF_DPI0			2
+#define MT8188_MUTEX_SOF_DSI0			1
+#define MT8188_MUTEX_SOF_DP_INTF0		3
 #define MT8195_MUTEX_SOF_DSI0			1
 #define MT8195_MUTEX_SOF_DSI1			2
 #define MT8195_MUTEX_SOF_DP_INTF0		3
@@ -189,6 +206,8 @@
 
 #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
 #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
+#define MT8188_MUTEX_EOF_DSI0			(MT8188_MUTEX_SOF_DSI0 << 7)
+#define MT8188_MUTEX_EOF_DP_INTF0		(MT8188_MUTEX_SOF_DP_INTF0 << 7)
 #define MT8195_MUTEX_EOF_DSI0			(MT8195_MUTEX_SOF_DSI0 << 7)
 #define MT8195_MUTEX_EOF_DSI1			(MT8195_MUTEX_SOF_DSI1 << 7)
 #define MT8195_MUTEX_EOF_DP_INTF0		(MT8195_MUTEX_SOF_DP_INTF0 << 7)
@@ -344,6 +363,23 @@ static const unsigned int mt8186_mdp_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
 	[MUTEX_MOD_IDX_MDP_COLOR0] = MT8186_MUTEX_MOD_MDP_COLOR0,
 };
 
+static const unsigned int mt8188_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_OVL0] = MT8188_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_WDMA0] = MT8188_MUTEX_MOD_DISP_WDMA0,
+	[DDP_COMPONENT_RDMA0] = MT8188_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_COLOR0] = MT8188_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_CCORR] = MT8188_MUTEX_MOD_DISP_CCORR0,
+	[DDP_COMPONENT_AAL0] = MT8188_MUTEX_MOD_DISP_AAL0,
+	[DDP_COMPONENT_GAMMA] = MT8188_MUTEX_MOD_DISP_GAMMA0,
+	[DDP_COMPONENT_POSTMASK0] = MT8188_MUTEX_MOD_DISP_POSTMASK0,
+	[DDP_COMPONENT_DITHER0] = MT8188_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_MERGE0] = MT8188_MUTEX_MOD_DISP_VPP_MERGE,
+	[DDP_COMPONENT_DSC0] = MT8188_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
+	[DDP_COMPONENT_DSI0] = MT8188_MUTEX_MOD_DISP_DSI0,
+	[DDP_COMPONENT_PWM0] = MT8188_MUTEX_MOD2_DISP_PWM0,
+	[DDP_COMPONENT_DP_INTF0] = MT8188_MUTEX_MOD_DISP_DP_INTF0,
+};
+
 static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
@@ -435,6 +471,14 @@ static const unsigned int mt8186_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
  * but also detect the error at end of frame(EAEOF) when EOF signal
  * arrives.
  */
+static const unsigned int mt8188_mutex_sof[DDP_MUTEX_SOF_MAX] = {
+	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[MUTEX_SOF_DSI0] =
+		MT8188_MUTEX_SOF_DSI0 | MT8188_MUTEX_EOF_DSI0,
+	[MUTEX_SOF_DP_INTF0] =
+		MT8188_MUTEX_SOF_DP_INTF0 | MT8188_MUTEX_EOF_DP_INTF0,
+};
+
 static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MT8195_MUTEX_SOF_DSI0 | MT8195_MUTEX_EOF_DSI0,
@@ -505,6 +549,13 @@ static const struct mtk_mutex_data mt8186_mutex_driver_data = {
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
+static const struct mtk_mutex_data mt8188_mutex_driver_data = {
+	.mutex_mod = mt8188_mutex_mod,
+	.mutex_sof = mt8188_mutex_sof,
+	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
+};
+
 static const struct mtk_mutex_data mt8192_mutex_driver_data = {
 	.mutex_mod = mt8192_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
@@ -854,6 +905,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8186_mutex_driver_data},
 	{ .compatible = "mediatek,mt8186-mdp3-mutex",
 	  .data = &mt8186_mdp_mutex_driver_data},
+	{ .compatible = "mediatek,mt8188-disp-mutex",
+	  .data = &mt8188_mutex_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = &mt8192_mutex_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-mutex",
-- 
2.18.0

