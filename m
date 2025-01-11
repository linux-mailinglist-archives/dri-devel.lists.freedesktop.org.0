Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16AAA09EF7
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 01:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F3010E539;
	Sat, 11 Jan 2025 00:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="TObvrwp+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54C210F0B4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:38:53 +0000 (UTC)
X-UUID: d67da28acf4f11efbd192953cf12861f-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bGmf/eoFCsMGAiBRwIl0+iNnIZhhh7/Dp69fj/T5UwE=; 
 b=TObvrwp+09b2BXwRAYy+37LEMNmkcB1WfDBFt9fe/70da4EufUtMaWEQa46aOgTFXOhGDTO7KcNgzn/WiIoSnVA4b3FcH6w9uZulmTz0yR0HrrPgZdC/ZI/D/dDXsGoiar7R7sWUM3vuTfqcm21ZN4gr8BJ5bg3y9dl5EZh6/So=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:af3e3956-7a6d-467a-9f18-db4b16cee82d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:60aa074, CLOUDID:183cb20e-078a-483b-8929-714244d25c49,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
 IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
 0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d67da28acf4f11efbd192953cf12861f-20250110
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1271903503; Fri, 10 Jan 2025 20:38:47 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 20:38:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 20:38:46 +0800
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
Subject: [PATCH 07/12] soc: mediatek: mutex: add mutex support for MT8196
Date: Fri, 10 Jan 2025 20:34:03 +0800
Message-ID: <20250110123835.2719824-9-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Sat, 11 Jan 2025 00:10:20 +0000
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

From: "Nancy.Lin" <nancy.lin@mediatek.com>

Add mutex support the main and external display for MT8196.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 233 +++++++++++++++++++++++--
 include/linux/soc/mediatek/mtk-mutex.h |   2 +
 2 files changed, 222 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 5250c1d702eb..c08eb3cc71eb 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -19,6 +19,7 @@
 #define MT2701_MUTEX0_SOF0			0x30
 #define MT8183_MUTEX0_MOD0			0x30
 #define MT8183_MUTEX0_SOF0			0x2c
+#define MT8196_MUTEX0_MOD0			0x34
 
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
@@ -236,6 +237,47 @@
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
@@ -295,6 +337,12 @@
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
@@ -307,6 +355,12 @@
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
@@ -323,6 +377,7 @@ enum mtk_mutex_sof_id {
 	MUTEX_SOF_DSI3,
 	MUTEX_SOF_DP_INTF0,
 	MUTEX_SOF_DP_INTF1,
+	MUTEX_SOF_DVO0,
 	DDP_MUTEX_SOF_MAX,
 };
 
@@ -333,6 +388,7 @@ struct mtk_mutex_data {
 	const u16 mutex_mod_reg;
 	const u16 mutex_sof_reg;
 	const bool no_clk;
+	const bool need_sof_mod;
 };
 
 struct mtk_mutex_ctx {
@@ -621,6 +677,64 @@ static const u8 mt8195_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
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
@@ -704,6 +818,17 @@ static const u16 mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
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
@@ -797,6 +922,14 @@ static const struct mtk_mutex_data mt8195_vpp_mutex_driver_data = {
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
@@ -847,6 +980,53 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_unprepare);
 
+void mtk_mutex_write_comp_sof(struct mtk_mutex *mutex,
+			      enum mtk_ddp_comp_id id)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int sof_id = 0;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	switch (id) {
+	case DDP_COMPONENT_DSI0:
+		sof_id = MUTEX_SOF_DSI0;
+		break;
+	case DDP_COMPONENT_DSI1:
+		sof_id = MUTEX_SOF_DSI0;
+		break;
+	case DDP_COMPONENT_DSI2:
+		sof_id = MUTEX_SOF_DSI2;
+		break;
+	case DDP_COMPONENT_DSI3:
+		sof_id = MUTEX_SOF_DSI3;
+		break;
+	case DDP_COMPONENT_DPI0:
+		sof_id = MUTEX_SOF_DPI0;
+		break;
+	case DDP_COMPONENT_DPI1:
+		sof_id = MUTEX_SOF_DPI1;
+		break;
+	case DDP_COMPONENT_DP_INTF0:
+		sof_id = MUTEX_SOF_DP_INTF0;
+		break;
+	case DDP_COMPONENT_DP_INTF1:
+		sof_id = MUTEX_SOF_DP_INTF1;
+		break;
+	case DDP_COMPONENT_DVO0:
+		sof_id = MUTEX_SOF_DVO0;
+		break;
+	default:
+		break;
+	}
+
+	writel_relaxed(mtx->data->mutex_sof[sof_id],
+		       mtx->regs +
+		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_write_comp_sof);
+
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id)
 {
@@ -883,6 +1063,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DP_INTF1:
 		sof_id = MUTEX_SOF_DP_INTF1;
 		break;
+	case DDP_COMPONENT_DVO0:
+		sof_id = MUTEX_SOF_DVO0;
+		break;
 	default:
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
@@ -891,7 +1074,8 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			reg |= 1 << mtx->data->mutex_mod[id];
 			writel_relaxed(reg, mtx->regs + offset);
 		} else {
-			offset = DISP_REG_MUTEX_MOD2(mutex->id);
+			offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
+						     mutex->id);
 			reg = readl_relaxed(mtx->regs + offset);
 			reg |= 1 << (mtx->data->mutex_mod[id] - 32);
 			writel_relaxed(reg, mtx->regs + offset);
@@ -899,6 +1083,22 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 		return;
 	}
 
+	if (mtx->data->need_sof_mod) {
+		if (mtx->data->mutex_mod[id] < 32) {
+			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+						    mutex->id);
+			reg = readl_relaxed(mtx->regs + offset);
+			reg |= 1 << mtx->data->mutex_mod[id];
+			writel_relaxed(reg, mtx->regs + offset);
+		} else {
+			offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
+						     mutex->id);
+			reg = readl_relaxed(mtx->regs + offset);
+			reg |= 1 << (mtx->data->mutex_mod[id] - 32);
+			writel_relaxed(reg, mtx->regs + offset);
+		}
+	}
+
 	writel_relaxed(mtx->data->mutex_sof[sof_id],
 		       mtx->regs +
 		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
@@ -924,26 +1124,32 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DPI1:
 	case DDP_COMPONENT_DP_INTF0:
 	case DDP_COMPONENT_DP_INTF1:
+	case DDP_COMPONENT_DVO0:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       mtx->regs +
 			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
 						  mutex->id));
 		break;
 	default:
-		if (mtx->data->mutex_mod[id] < 32) {
-			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
-						    mutex->id);
-			reg = readl_relaxed(mtx->regs + offset);
-			reg &= ~(1 << mtx->data->mutex_mod[id]);
-			writel_relaxed(reg, mtx->regs + offset);
-		} else {
-			offset = DISP_REG_MUTEX_MOD2(mutex->id);
-			reg = readl_relaxed(mtx->regs + offset);
-			reg &= ~(1 << (mtx->data->mutex_mod[id] - 32));
-			writel_relaxed(reg, mtx->regs + offset);
-		}
 		break;
 	}
+
+	if (!mtx->data->need_sof_mod)
+		return;
+
+	if (mtx->data->mutex_mod[id] < 32) {
+		offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+					    mutex->id);
+		reg = readl_relaxed(mtx->regs + offset);
+		reg &= ~(1 << mtx->data->mutex_mod[id]);
+		writel_relaxed(reg, mtx->regs + offset);
+	} else {
+		offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
+					     mutex->id);
+		reg = readl_relaxed(mtx->regs + offset);
+		reg &= ~(1 << (mtx->data->mutex_mod[id] - 32));
+		writel_relaxed(reg, mtx->regs + offset);
+	}
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
 
@@ -1134,6 +1340,7 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt8192-disp-mutex", .data = &mt8192_mutex_driver_data },
 	{ .compatible = "mediatek,mt8195-disp-mutex", .data = &mt8195_mutex_driver_data },
 	{ .compatible = "mediatek,mt8195-vpp-mutex",  .data = &mt8195_vpp_mutex_driver_data },
+	{ .compatible = "mediatek,mt8196-disp-mutex", .data = &mt8196_mutex_driver_data },
 	{ .compatible = "mediatek,mt8365-disp-mutex", .data = &mt8365_mutex_driver_data },
 	{ /* sentinel */ },
 };
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index 635218e3ac68..c15b48f0e4bf 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -69,6 +69,8 @@ enum mtk_mutex_sof_index {
 
 struct mtk_mutex *mtk_mutex_get(struct device *dev);
 int mtk_mutex_prepare(struct mtk_mutex *mutex);
+void mtk_mutex_write_comp_sof(struct mtk_mutex *mutex,
+			      enum mtk_ddp_comp_id id);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
 void mtk_mutex_enable(struct mtk_mutex *mutex);
-- 
2.34.1

