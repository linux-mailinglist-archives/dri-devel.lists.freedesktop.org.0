Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C47AB82D0
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93BC10E7ED;
	Thu, 15 May 2025 09:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="aau/idRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF65210E7E2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:35:20 +0000 (UTC)
X-UUID: e5fa3732316f11f082f7f7ac98dee637-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Delouw9xeUf2OJGeRxpbVRpzgy9K/EkXLOsmW6ZrQtQ=; 
 b=aau/idRpwMSapbz8gdLUeK46GzTMGHjJU2YCqAs5CwbFMerRpp4PudDDNwkYAm0/qZh0joCKPaJdHSMfgvBkwdVFcADijQsz0uJnbqFahFrf9zKfjYcILQD4EnfisAhuKCHvAOA6zr+g8t9gZuPz+znSU3ffVq2ephhi91W5ZMw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:20c57eeb-6059-4923-a69a-8a87146bbf08, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:ace504c0-eade-4d5b-9f81-31d7b5452436,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e5fa3732316f11f082f7f7ac98dee637-20250515
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 539590568; Thu, 15 May 2025 17:35:11 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:35:07 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:35:07 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
 <sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
 <sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 09/17] soc: mediatek: mutex: add mutex support for MT8196
Date: Thu, 15 May 2025 17:34:21 +0800
Message-ID: <20250515093454.1729720-10-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
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

From: Nancy Lin <nancy.lin@mediatek.com>

Add mutex support for the main and external displays in MT8196:
- Introduce a new DVO0 output component for the new mutex
  settings of MT8196.
- Add a need_sof_mof flag to configure both SOF and MOD settings
  for the output component.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 140 ++++++++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index b2a9992fb232..183f3abcd7dd 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -19,6 +19,7 @@
 #define MT2701_MUTEX0_SOF0			0x30
 #define MT8183_MUTEX0_MOD0			0x30
 #define MT8183_MUTEX0_SOF0			0x2c
+#define MT8196_MUTEX0_MOD0			0x34
 
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
@@ -237,6 +238,47 @@
 #define MT8195_MUTEX_MOD_MDP_WROT2             32
 #define MT8195_MUTEX_MOD_MDP_WROT3             33
 
+/* OVLSYS */
+#define MT8196_MUTEX_MOD0_OVL_EXDMA2		2
+#define MT8196_MUTEX_MOD0_OVL_EXDMA3		3
+#define MT8196_MUTEX_MOD0_OVL_EXDMA4		4
+#define MT8196_MUTEX_MOD0_OVL_EXDMA5		5
+#define MT8196_MUTEX_MOD0_OVL_EXDMA6		6
+#define MT8196_MUTEX_MOD0_OVL_EXDMA7		7
+#define MT8196_MUTEX_MOD0_OVL_EXDMA8		8
+#define MT8196_MUTEX_MOD0_OVL_EXDMA9		9
+#define MT8196_MUTEX_MOD0_OVL_BLENDER1		11
+#define MT8196_MUTEX_MOD0_OVL_BLENDER2		12
+#define MT8196_MUTEX_MOD0_OVL_BLENDER3		13
+#define MT8196_MUTEX_MOD0_OVL_BLENDER4		14
+#define MT8196_MUTEX_MOD0_OVL_BLENDER5		15
+#define MT8196_MUTEX_MOD0_OVL_BLENDER6		16
+#define MT8196_MUTEX_MOD0_OVL_BLENDER7		17
+#define MT8196_MUTEX_MOD0_OVL_BLENDER8		18
+#define MT8196_MUTEX_MOD0_OVL_BLENDER9		19
+#define MT8196_MUTEX_MOD0_OVL_OUTPROC0		20
+#define MT8196_MUTEX_MOD0_OVL_OUTPROC1		21
+#define MT8196_MUTEX_MOD0_OVL_OUTPROC2		22
+#define MT8196_MUTEX_MOD1_OVL_DLO_ASYNC5	(32 + 16)
+#define MT8196_MUTEX_MOD1_OVL_DLO_ASYNC6	(32 + 17)
+
+/* DISP0 */
+#define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC0	16
+#define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC1	17
+#define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC8	24
+#define MT8196_MUTEX_MOD1_DISP_DLO_ASYNC1	(32 + 1)
+#define MT8196_MUTEX_MOD1_DISP_DLO_ASYNC2	(32 + 2)
+#define MT8196_MUTEX_MOD1_DISP_DLO_ASYNC3	(32 + 3)
+
+/* DISP1 */
+#define MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC21	1
+#define MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC22	2
+#define MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC23	3
+#define MT8196_MUTEX_MOD0_DISP1_DP_INTF0	13
+#define MT8196_MUTEX_MOD0_DISP1_DP_INTF1	14
+#define MT8196_MUTEX_MOD0_DISP1_DSI0		23
+#define MT8196_MUTEX_MOD0_DISP1_DVO		29
+
 #define MT8365_MUTEX_MOD_DISP_OVL0		7
 #define MT8365_MUTEX_MOD_DISP_OVL0_2L		8
 #define MT8365_MUTEX_MOD_DISP_RDMA0		9
@@ -297,6 +339,12 @@
 #define MT8195_MUTEX_SOF_DP_INTF1		4
 #define MT8195_MUTEX_SOF_DPI0			6 /* for HDMI_TX */
 #define MT8195_MUTEX_SOF_DPI1			5 /* for digital video out */
+#define MT8196_MUTEX_SOF_DSI0			1
+#define MT8196_MUTEX_SOF_DSI1			2
+#define MT8196_MUTEX_SOF_DSI2			4
+#define MT8196_MUTEX_SOF_DPI0			5
+#define MT8196_MUTEX_SOF_DPI1			6
+#define MT8196_MUTEX_SOF_DVO0			7
 
 #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
 #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
@@ -310,6 +358,12 @@
 #define MT8195_MUTEX_EOF_DP_INTF1		(MT8195_MUTEX_SOF_DP_INTF1 << 7)
 #define MT8195_MUTEX_EOF_DPI0			(MT8195_MUTEX_SOF_DPI0 << 7)
 #define MT8195_MUTEX_EOF_DPI1			(MT8195_MUTEX_SOF_DPI1 << 7)
+#define MT8196_MUTEX_EOF_DSI0			(MT8196_MUTEX_SOF_DSI0 << 7)
+#define MT8196_MUTEX_EOF_DSI1			(MT8196_MUTEX_SOF_DSI1 << 7)
+#define MT8196_MUTEX_EOF_DSI2			(MT8196_MUTEX_SOF_DSI2 << 7)
+#define MT8196_MUTEX_EOF_DPI0			(MT8196_MUTEX_SOF_DPI0 << 7)
+#define MT8196_MUTEX_EOF_DPI1			(MT8196_MUTEX_SOF_DPI1 << 7)
+#define MT8196_MUTEX_EOF_DVO0			(MT8196_MUTEX_SOF_DVO0 << 7)
 
 struct mtk_mutex {
 	u8 id;
@@ -326,6 +380,7 @@ enum mtk_mutex_sof_id {
 	MUTEX_SOF_DSI3,
 	MUTEX_SOF_DP_INTF0,
 	MUTEX_SOF_DP_INTF1,
+	MUTEX_SOF_DVO0,
 	DDP_MUTEX_SOF_MAX,
 };
 
@@ -336,6 +391,7 @@ struct mtk_mutex_data {
 	const u16 mutex_mod_reg;
 	const u16 mutex_sof_reg;
 	const bool no_clk;
+	const bool need_sof_mod;
 };
 
 struct mtk_mutex_ctx {
@@ -625,6 +681,64 @@ static const u8 mt8195_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
 	[MUTEX_MOD_IDX_MDP_WROT3] = MT8195_MUTEX_MOD_MDP_WROT3,
 };
 
+static const u8 mt8196_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_OVL0_EXDMA2] = MT8196_MUTEX_MOD0_OVL_EXDMA2,
+	[DDP_COMPONENT_OVL0_EXDMA3] = MT8196_MUTEX_MOD0_OVL_EXDMA3,
+	[DDP_COMPONENT_OVL0_EXDMA4] = MT8196_MUTEX_MOD0_OVL_EXDMA4,
+	[DDP_COMPONENT_OVL0_EXDMA5] = MT8196_MUTEX_MOD0_OVL_EXDMA5,
+	[DDP_COMPONENT_OVL0_EXDMA6] = MT8196_MUTEX_MOD0_OVL_EXDMA6,
+	[DDP_COMPONENT_OVL0_EXDMA7] = MT8196_MUTEX_MOD0_OVL_EXDMA7,
+	[DDP_COMPONENT_OVL0_EXDMA8] = MT8196_MUTEX_MOD0_OVL_EXDMA8,
+	[DDP_COMPONENT_OVL0_EXDMA9] = MT8196_MUTEX_MOD0_OVL_EXDMA9,
+	[DDP_COMPONENT_OVL0_BLENDER1] = MT8196_MUTEX_MOD0_OVL_BLENDER1,
+	[DDP_COMPONENT_OVL0_BLENDER2] = MT8196_MUTEX_MOD0_OVL_BLENDER2,
+	[DDP_COMPONENT_OVL0_BLENDER3] = MT8196_MUTEX_MOD0_OVL_BLENDER3,
+	[DDP_COMPONENT_OVL0_BLENDER4] = MT8196_MUTEX_MOD0_OVL_BLENDER4,
+	[DDP_COMPONENT_OVL0_BLENDER5] = MT8196_MUTEX_MOD0_OVL_BLENDER5,
+	[DDP_COMPONENT_OVL0_BLENDER6] = MT8196_MUTEX_MOD0_OVL_BLENDER6,
+	[DDP_COMPONENT_OVL0_BLENDER7] = MT8196_MUTEX_MOD0_OVL_BLENDER7,
+	[DDP_COMPONENT_OVL0_BLENDER8] = MT8196_MUTEX_MOD0_OVL_BLENDER8,
+	[DDP_COMPONENT_OVL0_BLENDER9] = MT8196_MUTEX_MOD0_OVL_BLENDER9,
+	[DDP_COMPONENT_OVL0_OUTPROC0] = MT8196_MUTEX_MOD0_OVL_OUTPROC0,
+	[DDP_COMPONENT_OVL0_OUTPROC1] = MT8196_MUTEX_MOD0_OVL_OUTPROC1,
+	[DDP_COMPONENT_OVL0_DLO_ASYNC5] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC5,
+	[DDP_COMPONENT_OVL0_DLO_ASYNC6] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC6,
+	[DDP_COMPONENT_OVL1_EXDMA2] = MT8196_MUTEX_MOD0_OVL_EXDMA2,
+	[DDP_COMPONENT_OVL1_EXDMA3] = MT8196_MUTEX_MOD0_OVL_EXDMA3,
+	[DDP_COMPONENT_OVL1_EXDMA4] = MT8196_MUTEX_MOD0_OVL_EXDMA4,
+	[DDP_COMPONENT_OVL1_EXDMA5] = MT8196_MUTEX_MOD0_OVL_EXDMA5,
+	[DDP_COMPONENT_OVL1_EXDMA6] = MT8196_MUTEX_MOD0_OVL_EXDMA6,
+	[DDP_COMPONENT_OVL1_EXDMA7] = MT8196_MUTEX_MOD0_OVL_EXDMA7,
+	[DDP_COMPONENT_OVL1_EXDMA8] = MT8196_MUTEX_MOD0_OVL_EXDMA8,
+	[DDP_COMPONENT_OVL1_EXDMA9] = MT8196_MUTEX_MOD0_OVL_EXDMA9,
+	[DDP_COMPONENT_OVL1_BLENDER1] = MT8196_MUTEX_MOD0_OVL_BLENDER1,
+	[DDP_COMPONENT_OVL1_BLENDER2] = MT8196_MUTEX_MOD0_OVL_BLENDER2,
+	[DDP_COMPONENT_OVL1_BLENDER3] = MT8196_MUTEX_MOD0_OVL_BLENDER3,
+	[DDP_COMPONENT_OVL1_BLENDER4] = MT8196_MUTEX_MOD0_OVL_BLENDER4,
+	[DDP_COMPONENT_OVL1_BLENDER5] = MT8196_MUTEX_MOD0_OVL_BLENDER5,
+	[DDP_COMPONENT_OVL1_BLENDER6] = MT8196_MUTEX_MOD0_OVL_BLENDER6,
+	[DDP_COMPONENT_OVL1_BLENDER7] = MT8196_MUTEX_MOD0_OVL_BLENDER7,
+	[DDP_COMPONENT_OVL1_BLENDER8] = MT8196_MUTEX_MOD0_OVL_BLENDER8,
+	[DDP_COMPONENT_OVL1_BLENDER9] = MT8196_MUTEX_MOD0_OVL_BLENDER9,
+	[DDP_COMPONENT_OVL1_OUTPROC0] = MT8196_MUTEX_MOD0_OVL_OUTPROC0,
+	[DDP_COMPONENT_OVL1_OUTPROC1] = MT8196_MUTEX_MOD0_OVL_OUTPROC1,
+	[DDP_COMPONENT_OVL1_DLO_ASYNC5] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC5,
+	[DDP_COMPONENT_OVL1_DLO_ASYNC6] = MT8196_MUTEX_MOD1_OVL_DLO_ASYNC6,
+	[DDP_COMPONENT_DLI_ASYNC0] = MT8196_MUTEX_MOD0_DISP_DLI_ASYNC0,
+	[DDP_COMPONENT_DLI_ASYNC1] = MT8196_MUTEX_MOD0_DISP_DLI_ASYNC1,
+	[DDP_COMPONENT_DLI_ASYNC8] = MT8196_MUTEX_MOD0_DISP_DLI_ASYNC8,
+	[DDP_COMPONENT_DLO_ASYNC1] = MT8196_MUTEX_MOD1_DISP_DLO_ASYNC1,
+	[DDP_COMPONENT_DLO_ASYNC2] = MT8196_MUTEX_MOD1_DISP_DLO_ASYNC2,
+	[DDP_COMPONENT_DLO_ASYNC3] = MT8196_MUTEX_MOD1_DISP_DLO_ASYNC3,
+	[DDP_COMPONENT_DLI_ASYNC21] = MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC21,
+	[DDP_COMPONENT_DLI_ASYNC22] = MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC22,
+	[DDP_COMPONENT_DLI_ASYNC23] = MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC23,
+	[DDP_COMPONENT_DVO0] = MT8196_MUTEX_MOD0_DISP1_DVO,
+	[DDP_COMPONENT_DP_INTF0] = MT8196_MUTEX_MOD0_DISP1_DP_INTF0,
+	[DDP_COMPONENT_DP_INTF1] = MT8196_MUTEX_MOD0_DISP1_DP_INTF1,
+	[DDP_COMPONENT_DSI0] = MT8196_MUTEX_MOD0_DISP1_DSI0,
+};
+
 static const u8 mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
@@ -710,6 +824,17 @@ static const u16 mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 		MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
 };
 
+static const u16 mt8196_mutex_sof[DDP_MUTEX_SOF_MAX] = {
+	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[MUTEX_SOF_DSI0] = MT8196_MUTEX_SOF_DSI0 | MT8196_MUTEX_EOF_DSI0,
+	[MUTEX_SOF_DSI1] = MT8196_MUTEX_SOF_DSI1 | MT8196_MUTEX_EOF_DSI1,
+	[MUTEX_SOF_DP_INTF0] =
+		MT8196_MUTEX_SOF_DPI0 | MT8196_MUTEX_EOF_DPI0,
+	[MUTEX_SOF_DP_INTF1] =
+		MT8196_MUTEX_SOF_DPI1 | MT8196_MUTEX_EOF_DPI1,
+	[MUTEX_SOF_DVO0] = MT8196_MUTEX_SOF_DVO0 | MT8196_MUTEX_EOF_DVO0,
+};
+
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -803,6 +928,14 @@ static const struct mtk_mutex_data mt8195_vpp_mutex_driver_data = {
 	.mutex_table_mod = mt8195_mutex_table_mod,
 };
 
+static const struct mtk_mutex_data mt8196_mutex_driver_data = {
+	.mutex_mod = mt8196_mutex_mod,
+	.mutex_sof = mt8196_mutex_sof,
+	.mutex_mod_reg = MT8196_MUTEX0_MOD0,
+	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
+	.need_sof_mod = true,
+};
+
 static const struct mtk_mutex_data mt8365_mutex_driver_data = {
 	.mutex_mod = mt8365_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
@@ -872,6 +1005,8 @@ static int mtk_mutex_get_output_comp_sof(enum mtk_ddp_comp_id id)
 		return MUTEX_SOF_DP_INTF0;
 	case DDP_COMPONENT_DP_INTF1:
 		return MUTEX_SOF_DP_INTF1;
+	case DDP_COMPONENT_DVO0:
+		return MUTEX_SOF_DVO0;
 	default:
 		break;
 	}
@@ -929,7 +1064,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	if (!is_output_comp) {
+	if (!is_output_comp || mtx->data->need_sof_mod) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -960,7 +1095,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	if (!is_output_comp) {
+	if (!is_output_comp || mtx->data->need_sof_mod) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -1169,6 +1304,7 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt8192-disp-mutex", .data = &mt8192_mutex_driver_data },
 	{ .compatible = "mediatek,mt8195-disp-mutex", .data = &mt8195_mutex_driver_data },
 	{ .compatible = "mediatek,mt8195-vpp-mutex",  .data = &mt8195_vpp_mutex_driver_data },
+	{ .compatible = "mediatek,mt8196-disp-mutex", .data = &mt8196_mutex_driver_data },
 	{ .compatible = "mediatek,mt8365-disp-mutex", .data = &mt8365_mutex_driver_data },
 	{ /* sentinel */ },
 };
-- 
2.45.2

