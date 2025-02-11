Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF9BA304F9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 08:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC9E10E431;
	Tue, 11 Feb 2025 07:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="gN6vjS8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020EF10E1FF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 02:53:37 +0000 (UTC)
X-UUID: 614af8d6e82311efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=huymk/dQpvaH56qoB1f+DVpPSCDfCCnhC4pMTyNd65I=; 
 b=gN6vjS8c4gjC3ucBxjsLjokloCGdTedyECr8uzu/q7ZsuQ3fDPwQVrq2Fa2AVyOFeLVRCFIEPcD4/T39IfId4rTnTawu4iC4Brry43Yy7Yrnw5SvqF2N5Z555mdW9fyzr42StsUElUDHhMBQ++xlPT09tLq0ht0V0Nhb2I3/Taw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:a42345fe-7830-4ded-bbe0-24f4f14b685d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:62ca627f-427a-4311-9df4-bfaeeacd8532,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 614af8d6e82311efb8f9918b5fc74e19-20250211
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <sunny.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 441736300; Tue, 11 Feb 2025 10:53:32 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 10:53:31 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 10:53:31 +0800
From: Sunny Shen <sunny.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Fei Shao <fshao@chromium.org>, Pin-yen Lin
 <treapking@chromium.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Paul
 Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Sunny Shen
 <sunny.shen@mediatek.com>
Subject: [PATCH 3/5] soc: mediatek: Add components to support PQ in display
 path for MT8196
Date: Tue, 11 Feb 2025 10:52:52 +0800
Message-ID: <20250211025317.399534-4-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211025317.399534-1-sunny.shen@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 11 Feb 2025 07:56:48 +0000
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

Due to the path mux design of the MT8196, the following components
need to be configured into mutex and mmsys to support
Picture Quality (PQ) in the display path:CCORR0, CCORR1, DITHER0,
GAMMA0, MDP_RSZ0, POSTMASK0, TDSHP0.

Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
---
 drivers/soc/mediatek/mt8196-mmsys.h    | 70 +++++++++++++++++++++++++-
 drivers/soc/mediatek/mtk-mutex.c       | 17 +++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  5 ++
 3 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mt8196-mmsys.h b/drivers/soc/mediatek/mt8196-mmsys.h
index 03d1210d2b80..b686d5029219 100644
--- a/drivers/soc/mediatek/mt8196-mmsys.h
+++ b/drivers/soc/mediatek/mt8196-mmsys.h
@@ -68,6 +68,22 @@
 #define MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY7		BIT(2)
 
 /* DISPSYS0 */
+#define MT8196_DISP_CCORR0_SEL				0xd28
+#define MT8196_DISP_CCORR0_FROM_TDSHP0				BIT(1)
+#define MT8196_DISP_CCORR0_SOUT				0xd2c
+#define MT8196_DISP_CCORR0_TO_CCORR1				BIT(0)
+#define MT8196_DISP_CCORR1_SEL				0xd30
+#define MT8196_DISP_CCORR1_FROM_CCORR0				BIT(0)
+#define MT8196_DISP_CCORR1_SOUT				0xd34
+#define MT8196_DISP_CCORR1_TO_GAMMA0				BIT(0)
+#define MT8196_DISP_GAMMA0_SEL				0xd58
+#define MT8196_DISP_GAMMA0_FROM_CCORR1				BIT(0)
+#define MT8196_DISP_POSTMASK0_SOUT			0xd68
+#define MT8196_DISP_POSTMASK0_TO_DITHER0			0x0
+#define MT8196_DISP_TDSHP0_SOUT				0xd70
+#define MT8196_DISP_TDSHP0_TO_CCORR0				BIT(1)
+#define MT8196_MDP_RSZ0_MOUT_EN				0xd78
+#define MT8196_MDP_RSZ0_TO_TDSHP0				BIT(0)
 #define MT8196_PANEL_COMP_OUT_CB1_MOUT_EN		0xd84
 #define MT8196_DISP_TO_DLO_RELAY1				BIT(1)
 #define MT8196_PANEL_COMP_OUT_CB2_MOUT_EN		0xd88
@@ -75,12 +91,14 @@
 #define MT8196_PANEL_COMP_OUT_CB3_MOUT_EN		0xd8c
 #define MT8196_DISP_TO_DLO_RELAY3				BIT(3)
 #define MT8196_PQ_IN_CB0_MOUT_EN			0xdd0
+#define MT8196_PQ_IN_CB0_TO_PQ_OUT_CB_0				BIT(0)
 #define MT8196_PQ_IN_CB0_TO_PQ_OUT_CB_6				BIT(2)
-
 #define MT8196_PQ_IN_CB1_MOUT_EN			0xdd4
 #define MT8196_PQ_IN_CB1_TO_PQ_OUT_CB_7				BIT(3)
 #define MT8196_PQ_IN_CB8_MOUT_EN			0xdf0
 #define MT8196_PQ_IN_CB8_TO_PQ_OUT_CB_8				BIT(4)
+#define MT8196_PQ_OUT_CB0_MOUT_EN			0xe3c
+#define MT8196_PQ_OUT_CB0_TO_PANEL0_COMP_OUT_CB1		BIT(1)
 #define MT8196_PQ_OUT_CB6_MOUT_EN			0xe54
 #define MT8196_PQ_OUT_CB6_TO_PANEL0_COMP_OUT_CB1		BIT(1)
 #define MT8196_PQ_OUT_CB7_MOUT_EN			0xe58
@@ -314,11 +332,13 @@ static const struct mtk_mmsys_routes mmsys_mt8196_ovl1_routing_table[] = {
 };
 
 /*
- * main: DLI_ASYNC0-> PQ_IN_CB0 -> PQ_OUT_CB6 -> PANEL_COMP_OUT_CB1 -> DLO_ASYNC1
+ * main: DLI_ASYNC0-> PQ_IN_CB0 -> PQ (MDP_RSZ0/TDSHP0/CCORR0/CCORR1/GAMMA0/POSTMASK0/DITHER0)
+ *       -> PQ_OUT_CB0 -> PANEL_COMP_OUT_CB1 -> DLO_ASYNC1
  * ext:  DLI_ASYNC1-> PQ_IN_CB1 -> PQ_OUT_CB7 -> PANEL_COMP_OUT_CB2 -> DLO_ASYNC2
  */
 static const struct mtk_mmsys_routes mmsys_mt8196_disp0_routing_table[] = {
 	{
+	/* main: PQ bypass */
 		DDP_COMPONENT_DLI_ASYNC0, DDP_COMPONENT_DLO_ASYNC1,
 		MT8196_PQ_IN_CB0_MOUT_EN, MT8196_PQ_IN_CB0_TO_PQ_OUT_CB_6,
 		MT8196_PQ_IN_CB0_TO_PQ_OUT_CB_6
@@ -331,6 +351,52 @@ static const struct mtk_mmsys_routes mmsys_mt8196_disp0_routing_table[] = {
 		MT8196_PANEL_COMP_OUT_CB1_MOUT_EN, MT8196_DISP_TO_DLO_RELAY1,
 		MT8196_DISP_TO_DLO_RELAY1
 	}, {
+	/* main: PQ path */
+		DDP_COMPONENT_DLI_ASYNC0, DDP_COMPONENT_MDP_RSZ0,
+		MT8196_PQ_IN_CB0_MOUT_EN, MT8196_PQ_IN_CB0_TO_PQ_OUT_CB_0,
+		MT8196_PQ_IN_CB0_TO_PQ_OUT_CB_0
+	}, {
+		DDP_COMPONENT_MDP_RSZ0, DDP_COMPONENT_TDSHP0,
+		MT8196_MDP_RSZ0_MOUT_EN, MT8196_MDP_RSZ0_TO_TDSHP0,
+		MT8196_MDP_RSZ0_TO_TDSHP0
+	}, {
+		DDP_COMPONENT_TDSHP0, DDP_COMPONENT_CCORR0,
+		MT8196_DISP_TDSHP0_SOUT, MT8196_DISP_TDSHP0_TO_CCORR0,
+		MT8196_DISP_TDSHP0_TO_CCORR0
+	}, {
+		DDP_COMPONENT_TDSHP0, DDP_COMPONENT_CCORR0,
+		MT8196_DISP_CCORR0_SEL, MT8196_DISP_CCORR0_FROM_TDSHP0,
+		MT8196_DISP_CCORR0_FROM_TDSHP0
+	}, {
+		DDP_COMPONENT_CCORR0, DDP_COMPONENT_CCORR1,
+		MT8196_DISP_CCORR0_SOUT, MT8196_DISP_CCORR0_TO_CCORR1,
+		MT8196_DISP_CCORR0_TO_CCORR1
+	}, {
+		DDP_COMPONENT_CCORR0, DDP_COMPONENT_CCORR1,
+		MT8196_DISP_CCORR1_SEL, MT8196_DISP_CCORR1_FROM_CCORR0,
+		MT8196_DISP_CCORR1_FROM_CCORR0
+	}, {
+		DDP_COMPONENT_CCORR1, DDP_COMPONENT_GAMMA0,
+		MT8196_DISP_CCORR1_SOUT, MT8196_DISP_CCORR1_TO_GAMMA0,
+		MT8196_DISP_CCORR1_TO_GAMMA0
+	}, {
+		DDP_COMPONENT_CCORR1, DDP_COMPONENT_GAMMA0,
+		MT8196_DISP_GAMMA0_SEL, MT8196_DISP_GAMMA0_FROM_CCORR1,
+		MT8196_DISP_GAMMA0_FROM_CCORR1
+	}, {
+		DDP_COMPONENT_POSTMASK0, DDP_COMPONENT_DITHER0,
+		MT8196_DISP_POSTMASK0_SOUT, MT8196_DISP_POSTMASK0_TO_DITHER0,
+		MT8196_DISP_POSTMASK0_TO_DITHER0
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DLO_ASYNC1,
+		MT8196_PQ_OUT_CB0_MOUT_EN, MT8196_PQ_OUT_CB0_TO_PANEL0_COMP_OUT_CB1,
+		MT8196_PQ_OUT_CB0_TO_PANEL0_COMP_OUT_CB1
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DLO_ASYNC1,
+		MT8196_PANEL_COMP_OUT_CB1_MOUT_EN, MT8196_DISP_TO_DLO_RELAY1,
+		MT8196_DISP_TO_DLO_RELAY1
+	}, {
+	/* ext */
 		DDP_COMPONENT_DLI_ASYNC1, DDP_COMPONENT_DLO_ASYNC2,
 		MT8196_PQ_IN_CB1_MOUT_EN, MT8196_PQ_IN_CB1_TO_PQ_OUT_CB_7,
 		MT8196_PQ_IN_CB1_TO_PQ_OUT_CB_7
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 51db6f2a05ae..9c895566dfb2 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -262,6 +262,11 @@
 #define MT8196_MUTEX_MOD1_OVL_DLO_ASYNC6	(32 + 17)
 
 /* DISP0 */
+
+#define MT8196_MUTEX_MOD0_DISP_CCORR0		6
+#define MT8196_MUTEX_MOD0_DISP_CCORR1		7
+#define MT8196_MUTEX_MOD0_DISP_DITHER0		14
+
 #define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC0	16
 #define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC1	17
 #define MT8196_MUTEX_MOD0_DISP_DLI_ASYNC8	24
@@ -269,6 +274,11 @@
 #define MT8196_MUTEX_MOD1_DISP_DLO_ASYNC2	(32 + 2)
 #define MT8196_MUTEX_MOD1_DISP_DLO_ASYNC3	(32 + 3)
 
+#define MT8196_MUTEX_MOD1_DISP_GAMMA0		(32 + 9)
+#define MT8196_MUTEX_MOD1_DISP_POSTMASK0	(32 + 14)
+#define MT8196_MUTEX_MOD1_DISP_MDP_RSZ0		(32 + 18)
+#define MT8196_MUTEX_MOD1_DISP_TDSHP0		(32 + 21)
+
 /* DISP1 */
 #define MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC21	1
 #define MT8196_MUTEX_MOD0_DISP1_DLI_ASYNC22	2
@@ -678,6 +688,13 @@ static const u8 mt8195_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
 };
 
 static const u8 mt8196_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_CCORR0] = MT8196_MUTEX_MOD0_DISP_CCORR0,
+	[DDP_COMPONENT_CCORR1] = MT8196_MUTEX_MOD0_DISP_CCORR1,
+	[DDP_COMPONENT_DITHER0] = MT8196_MUTEX_MOD0_DISP_DITHER0,
+	[DDP_COMPONENT_GAMMA0] = MT8196_MUTEX_MOD1_DISP_GAMMA0,
+	[DDP_COMPONENT_MDP_RSZ0] = MT8196_MUTEX_MOD1_DISP_MDP_RSZ0,
+	[DDP_COMPONENT_POSTMASK0] = MT8196_MUTEX_MOD1_DISP_POSTMASK0,
+	[DDP_COMPONENT_TDSHP0] = MT8196_MUTEX_MOD1_DISP_TDSHP0,
 	[DDP_COMPONENT_OVL0_EXDMA2] = MT8196_MUTEX_MOD0_OVL_EXDMA2,
 	[DDP_COMPONENT_OVL0_EXDMA3] = MT8196_MUTEX_MOD0_OVL_EXDMA3,
 	[DDP_COMPONENT_OVL0_EXDMA4] = MT8196_MUTEX_MOD0_OVL_EXDMA4,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 4a0b10567581..250054ca5523 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -25,6 +25,8 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_AAL1,
 	DDP_COMPONENT_BLS,
 	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_CCORR0 = DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_CCORR1,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_DITHER0,
@@ -51,6 +53,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_DVO0,
 	DDP_COMPONENT_ETHDR_MIXER,
 	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_GAMMA0 = DDP_COMPONENT_GAMMA,
 	DDP_COMPONENT_MDP_RDMA0,
 	DDP_COMPONENT_MDP_RDMA1,
 	DDP_COMPONENT_MDP_RDMA2,
@@ -59,6 +62,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_MDP_RDMA5,
 	DDP_COMPONENT_MDP_RDMA6,
 	DDP_COMPONENT_MDP_RDMA7,
+	DDP_COMPONENT_MDP_RSZ0,
 	DDP_COMPONENT_MERGE0,
 	DDP_COMPONENT_MERGE1,
 	DDP_COMPONENT_MERGE2,
@@ -130,6 +134,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_RDMA1,
 	DDP_COMPONENT_RDMA2,
 	DDP_COMPONENT_RDMA4,
+	DDP_COMPONENT_TDSHP0,
 	DDP_COMPONENT_UFOE,
 	DDP_COMPONENT_WDMA0,
 	DDP_COMPONENT_WDMA1,
-- 
2.34.1

