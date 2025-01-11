Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B77A09EF4
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 01:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F29810E184;
	Sat, 11 Jan 2025 00:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="rPO4hJMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566E910F09A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:38:54 +0000 (UTC)
X-UUID: d66b24decf4f11efbd192953cf12861f-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iLJHX/vqD0f1QBIpowcXruFUDWNFPll3caZWJrfeB7E=; 
 b=rPO4hJMeWpBK6zz1pwV41RIG1sxFWTnLAvMl8MexyAcafhASK51hIWymvzezG5SZ5lgt5MgKxTjJ3VBpFWLfA7GEe6I85xFBYx54TQOXh2xmhlXyfNJ0QBob3rc4iqD4IiPnqsn9xgzVrKXpifDAD/I+MITOkmQy1Acv9+0XAy4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:b3ccab87-4bdf-4238-b790-5d5cb5228822, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:60aa074, CLOUDID:3533b037-e11c-4c1a-89f7-e7a032832c40,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
 IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
 0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d66b24decf4f11efbd192953cf12861f-20250110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 677113473; Fri, 10 Jan 2025 20:38:47 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [PATCH 06/12] soc: mediatek: add mmsys support for MT8196
Date: Fri, 10 Jan 2025 20:34:02 +0800
Message-ID: <20250110123835.2719824-8-paul-pl.chen@mediatek.com>
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

1. Defining driver data and adding compatible string
for different subsystems
(DISPSYS0, DISPSYS1, OVLSYS0, OVLSYS1, VDISP_AO)
2. Adding functions to control top clocks and ddp clocks.
3. Updating the probe function to initialize clocks and
enable runtime PM if its node has the power-domains property.
4. Adding functions to configure ddp components and
set default configurations.
5. Adding the routing table for each mmsys in MT8196.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
---
 drivers/soc/mediatek/mt8196-mmsys.h    | 447 +++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       | 204 ++++++++++-
 drivers/soc/mediatek/mtk-mmsys.h       |  18 +
 include/linux/soc/mediatek/mtk-mmsys.h |  60 ++++
 4 files changed, 728 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/mt8196-mmsys.h

diff --git a/drivers/soc/mediatek/mt8196-mmsys.h b/drivers/soc/mediatek/mt8196-mmsys.h
new file mode 100644
index 000000000000..03d1210d2b80
--- /dev/null
+++ b/drivers/soc/mediatek/mt8196-mmsys.h
@@ -0,0 +1,447 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: Nancy Lin <nancy.lin@mediatek.com>
+ */
+
+#ifndef __SOC_MEDIATEK_MT8196_MMSYS_H
+#define __SOC_MEDIATEK_MT8196_MMSYS_H
+
+/* DISPSYS1 */
+#define MT8196_COMP_OUT_CB6_MOUT_EN			0xd30
+#define MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB0		BIT(0)
+#define MT8196_COMP_OUT_CB7_MOUT_EN			0xd38
+#define MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB1		BIT(1)
+#define MT8196_COMP_OUT_CB8_MOUT_EN			0xd40
+#define MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB2		BIT(2)
+#define MT8196_MERGE_OUT_CB0_MOUT_EN			0xdcc
+#define MT8196_DISP_COMP_OUT_CB_TO_DVO0				BIT(9)
+#define MT8196_MERGE_OUT_CB1_MOUT_EN			0xdd4
+#define MT8196_MERGE_OUT_CB2_MOUT_EN			0xddc
+#define MT8196_DISP_COMP_OUT_CB_TO_DSI0				BIT(0)
+#define MT8196_DISP_COMP_OUT_CB_TO_DP_INTF0			BIT(10)
+#define MT8196_DISP_COMP_OUT_CB_TO_DP_INTF1			BIT(11)
+#define MT8196_SPLITTER_IN_CB1_MOUT_EN			0xeac
+#define MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB9		BIT(5)
+#define MT8196_SPLITTER_IN_CB2_MOUT_EN			0xeb4
+#define MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB10		BIT(6)
+#define MT8196_SPLITTER_IN_CB3_MOUT_EN			0xebc
+#define MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB11		BIT(7)
+#define MT8196_SPLITTER_OUT_CB9_MOUT_EN			0xf64
+#define MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB6		BIT(10)
+#define MT8196_SPLITTER_OUT_CB10_MOUT_EN		0xf6c
+#define MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB7		BIT(11)
+#define MT8196_SPLITTER_OUT_CB11_MOUT_EN		0xf74
+#define MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB8		BIT(12)
+#define MT8196_OVL_RSZ_IN_CB2_MOUT_EN			0xf70
+#define MT8196_DISP_OVL_EXDMA2_1_TO_OVL_EXDMA_OUT_CB3		BIT(1)
+
+/* OVLSYS */
+#define MT8196_OVL_BLENDER_OUT_CB4_MOUT_EN		0xe10
+#define MT8196_OVL_BLENDER_OUT_CB8_MOUT_EN		0xe20
+#define MT8196_DISP_OUT_BLENDER_CB_TO_OVL_OUTPROC0		BIT(0)
+#define MT8196_DISP_OUT_BLENDER_CB_TO_OVL_OUTPROC1		BIT(1)
+#define MT8196_DISP_OUT_BLENDER_CB_TO_OVL_OUTPROC2		BIT(2)
+#define MT8196_OVL_EXDMA_OUT_CB2_MOUT_EN		0xe60
+#define MT8196_OVL_EXDMA_OUT_CB3_MOUT_EN		0xe68
+#define MT8196_OVL_EXDMA_OUT_CB4_MOUT_EN		0xe70
+#define MT8196_OVL_EXDMA_OUT_CB5_MOUT_EN		0xe78
+#define MT8196_OVL_EXDMA_OUT_CB6_MOUT_EN		0xe80
+#define MT8196_OVL_EXDMA_OUT_CB7_MOUT_EN		0xe88
+#define MT8196_OVL_EXDMA_OUT_CB8_MOUT_EN		0xe90
+#define MT8196_OVL_EXDMA_OUT_CB9_MOUT_EN		0xe98
+#define MT8196_OVL_EXDMA_OUT_CB10_MOUT_EN		0xea0
+#define MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER1		BIT(2)
+#define MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER2		BIT(3)
+#define MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER3		BIT(4)
+#define MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER4		BIT(5)
+#define MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER5		BIT(6)
+#define MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER6		BIT(7)
+#define MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER7		BIT(8)
+#define MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER8		BIT(9)
+#define MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER9		BIT(10)
+#define MT8196_OVL_OUTPROC_OUT_CB0_MOUT_EN		0xf10
+#define MT8196_OVL_OUTPROC_OUT_CB1_MOUT_EN		0xf14
+#define MT8196_OVL_OUTPROC_OUT_CB2_MOUT_EN		0xf18
+#define MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY5		BIT(0)
+#define MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY6		BIT(1)
+#define MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY7		BIT(2)
+
+/* DISPSYS0 */
+#define MT8196_PANEL_COMP_OUT_CB1_MOUT_EN		0xd84
+#define MT8196_DISP_TO_DLO_RELAY1				BIT(1)
+#define MT8196_PANEL_COMP_OUT_CB2_MOUT_EN		0xd88
+#define MT8196_DISP_TO_DLO_RELAY2				BIT(2)
+#define MT8196_PANEL_COMP_OUT_CB3_MOUT_EN		0xd8c
+#define MT8196_DISP_TO_DLO_RELAY3				BIT(3)
+#define MT8196_PQ_IN_CB0_MOUT_EN			0xdd0
+#define MT8196_PQ_IN_CB0_TO_PQ_OUT_CB_6				BIT(2)
+
+#define MT8196_PQ_IN_CB1_MOUT_EN			0xdd4
+#define MT8196_PQ_IN_CB1_TO_PQ_OUT_CB_7				BIT(3)
+#define MT8196_PQ_IN_CB8_MOUT_EN			0xdf0
+#define MT8196_PQ_IN_CB8_TO_PQ_OUT_CB_8				BIT(4)
+#define MT8196_PQ_OUT_CB6_MOUT_EN			0xe54
+#define MT8196_PQ_OUT_CB6_TO_PANEL0_COMP_OUT_CB1		BIT(1)
+#define MT8196_PQ_OUT_CB7_MOUT_EN			0xe58
+#define MT8196_PQ_OUT_CB7_TO_PANEL0_COMP_OUT_CB2		BIT(2)
+#define MT8196_PQ_OUT_CB8_MOUT_EN			0xe5c
+#define MT8196_PQ_OUT_CB8_TO_PANEL0_COMP_OUT_CB3		BIT(3)
+
+/* OVLSYS config */
+#define MT8196_OVL_INT_MERGE				0x008
+#define MT8196_OVL_DL_OUT_RELAY5_SIZE			0x29c
+#define MT8196_OVL_DL_OUT_RELAY6_SIZE			0x2a0
+#define MT8196_OVLSYS_GCE_EVENT_SEL			0x408
+#define MT8196_OVLSYS_BYPASS_MUX_SHADOW			0xca0
+#define MT8196_OVLSYS_CB_CON				0xcac
+#define CB_BYPASS_MUX_SHADOW					(0xff << 16)
+#define MT8196_EVENT_GCE_EN					(BIT(0) | BIT(1))
+
+/* DISPSYS config */
+#define MT8196_DISP0_DLI_RELAY0				0x200
+#define MT8196_DISP0_DLI_RELAY1				0x204
+#define MT8196_DISP0_DLI_RELAY8				0x220
+#define MT8196_DISP0_DLO_RELAY1				0x268
+#define MT8196_DISP0_DLO_RELAY2				0x26c
+#define MT8196_DISP0_DLO_RELAY3				0x270
+#define DISP_DLI_RELAY_1T2P					BIT(30)
+#define MT8196_DISP0_BYPASS_MUX_SHADOW			0xc30
+#define BYPASS_MUX_SHADOW					BIT(0)
+#define OVLSYS_CB_BYPASS_MUX_SHADOW				(0xff << 16)
+
+/* DISPSYS1 config */
+#define MT8196_DISP1_INT_MERGE				0x008
+#define MT8196_DISP1_DLI_RELAY21			0x204
+#define MT8196_DISP1_DLI_RELAY22			0x208
+#define MT8196_DISP1_DLI_RELAY23			0x20c
+#define MT8196_DISP1_GCE_FRAME_DONE_SEL0		0xa10
+#define MT8196_DISP1_GCE_FRAME_DONE_SEL1		0xa14
+#define MT8196_FRAME_DONE_DVO					25
+#define MT8196_FRAME_DONE_DP_INTF0				41
+#define MT8196_DISP1_BYPASS_MUX_SHADOW			0xcf8
+
+/* VDISP_AO config */
+#define MT8196_VDISP_AO_REG_INTEN			0x000
+#define CPU_INTEN						BIT(0)
+#define CPU_INT_MERGE						BIT(4)
+#define MT8196_VDISP_AO_REG_INT_SEL_G0			0x020
+#define MT8196_VDISP_AO_REG_INT_SEL_G1			0x024
+#define MT8196_VDISP_AO_REG_INT_SEL_G2			0x028
+#define MT8196_VDISP_AO_REG_INT_SEL_G3			0x02c
+#define MT8196_VDISP_AO_REG_INT_SEL_G4			0x030
+#define MT8196_VDISP_AO_REG_INT_SEL_G5			0x034
+#define MT8196_VDISP_AO_REG_INT_SEL_G6			0x038
+#define MT8196_IRQ_TABLE_OVL0_OUTPROC0				(0xa6) /* GIC 450 */
+#define MT8196_IRQ_TABLE_OVL0_OUTPROC1				(0xa7) /* GIC 451 */
+#define MT8196_IRQ_TABLE_OVL1_OUTPROC0				(0xd6) /* GIC 452 */
+#define MT8196_IRQ_TABLE_DSI0					(0x35) /* GIC 453 */
+
+static const struct mtk_mmsys_async_info mmsys_mt8196_ovl0_async_comp_table[] = {
+	{DDP_COMPONENT_OVL0_DLO_ASYNC5, 0, MT8196_OVL_DL_OUT_RELAY5_SIZE, GENMASK(29, 0)},
+	{DDP_COMPONENT_OVL0_DLO_ASYNC6, 1, MT8196_OVL_DL_OUT_RELAY6_SIZE, GENMASK(29, 0)},
+};
+
+static const struct mtk_mmsys_async_info mmsys_mt8196_ovl1_async_comp_table[] = {
+	{DDP_COMPONENT_OVL1_DLO_ASYNC5, 0, MT8196_OVL_DL_OUT_RELAY5_SIZE, GENMASK(29, 0)},
+	{DDP_COMPONENT_OVL1_DLO_ASYNC6, 1, MT8196_OVL_DL_OUT_RELAY6_SIZE, GENMASK(29, 0)},
+};
+
+static const struct mtk_mmsys_async_info mmsys_mt8196_disp0_async_comp_table[] = {
+	{DDP_COMPONENT_DLI_ASYNC0, 0, MT8196_DISP0_DLI_RELAY0, GENMASK(29, 0)},
+	{DDP_COMPONENT_DLI_ASYNC1, 1, MT8196_DISP0_DLI_RELAY1, GENMASK(29, 0)},
+	{DDP_COMPONENT_DLI_ASYNC8, 2, MT8196_DISP0_DLI_RELAY8, GENMASK(29, 0)},
+	{DDP_COMPONENT_DLO_ASYNC1, 3, MT8196_DISP0_DLO_RELAY1, GENMASK(29, 0)},
+	{DDP_COMPONENT_DLO_ASYNC2, 4, MT8196_DISP0_DLO_RELAY2, GENMASK(29, 0)},
+	{DDP_COMPONENT_DLO_ASYNC3, 5, MT8196_DISP0_DLO_RELAY3, GENMASK(29, 0)},
+};
+
+static const struct mtk_mmsys_async_info mmsys_mt8196_disp1_async_comp_table[] = {
+	{DDP_COMPONENT_DLI_ASYNC21, 0, MT8196_DISP1_DLI_RELAY21, GENMASK(29, 0)},
+	{DDP_COMPONENT_DLI_ASYNC22, 1, MT8196_DISP1_DLI_RELAY22, GENMASK(29, 0)},
+	{DDP_COMPONENT_DLI_ASYNC23, 2, MT8196_DISP1_DLI_RELAY23, GENMASK(29, 0)},
+};
+
+static const struct mtk_mmsys_default mmsys_mt8196_vdisp_ao_default_table[] = {
+	{MT8196_VDISP_AO_REG_INTEN, CPU_INTEN, CPU_INT_MERGE | CPU_INTEN},
+	{MT8196_VDISP_AO_REG_INT_SEL_G0, MT8196_IRQ_TABLE_OVL0_OUTPROC0, GENMASK(7, 0)},
+	{MT8196_VDISP_AO_REG_INT_SEL_G0, MT8196_IRQ_TABLE_OVL0_OUTPROC1 << 8, GENMASK(15, 8)},
+	{MT8196_VDISP_AO_REG_INT_SEL_G0, MT8196_IRQ_TABLE_OVL1_OUTPROC0 << 16, GENMASK(23, 16)},
+	{MT8196_VDISP_AO_REG_INT_SEL_G0, MT8196_IRQ_TABLE_DSI0 << 24, GENMASK(31, 24)}
+};
+
+static const struct mtk_mmsys_default mmsys_mt8196_ovl0_default_table[] = {
+	{MT8196_OVLSYS_GCE_EVENT_SEL, MT8196_EVENT_GCE_EN, GENMASK(1, 0)},
+	{MT8196_OVL_INT_MERGE, 0, BIT(0)},
+	{MT8196_OVLSYS_BYPASS_MUX_SHADOW, BYPASS_MUX_SHADOW, BYPASS_MUX_SHADOW},
+	{MT8196_OVLSYS_CB_CON, OVLSYS_CB_BYPASS_MUX_SHADOW, OVLSYS_CB_BYPASS_MUX_SHADOW},
+};
+
+static const struct mtk_mmsys_default mmsys_mt8196_disp0_default_table[] = {
+	{MT8196_OVLSYS_GCE_EVENT_SEL, MT8196_EVENT_GCE_EN, GENMASK(1, 0)},
+	{MT8196_DISP0_BYPASS_MUX_SHADOW, CB_BYPASS_MUX_SHADOW | BYPASS_MUX_SHADOW,
+	 CB_BYPASS_MUX_SHADOW | BYPASS_MUX_SHADOW},
+	{MT8196_DISP0_DLI_RELAY0, DISP_DLI_RELAY_1T2P, GENMASK(31, 30)},
+	{MT8196_DISP0_DLI_RELAY1, DISP_DLI_RELAY_1T2P, GENMASK(31, 30)},
+	{MT8196_DISP0_DLI_RELAY8, DISP_DLI_RELAY_1T2P, GENMASK(31, 30)},
+	{MT8196_DISP0_DLO_RELAY1, DISP_DLI_RELAY_1T2P, GENMASK(31, 30)},
+	{MT8196_DISP0_DLO_RELAY2, DISP_DLI_RELAY_1T2P, GENMASK(31, 30)},
+	{MT8196_DISP0_DLO_RELAY3, DISP_DLI_RELAY_1T2P, GENMASK(31, 30)},
+};
+
+static const struct mtk_mmsys_default mmsys_mt8196_disp1_default_table[] = {
+	{MT8196_OVLSYS_GCE_EVENT_SEL, MT8196_EVENT_GCE_EN, GENMASK(1, 0)},
+	{MT8196_DISP1_INT_MERGE, 0, BIT(0)},
+	{MT8196_DISP1_BYPASS_MUX_SHADOW, CB_BYPASS_MUX_SHADOW | BYPASS_MUX_SHADOW,
+	 CB_BYPASS_MUX_SHADOW | BYPASS_MUX_SHADOW},
+	{MT8196_DISP1_DLI_RELAY21, DISP_DLI_RELAY_1T2P, GENMASK(31, 30)},
+	{MT8196_DISP1_DLI_RELAY22, DISP_DLI_RELAY_1T2P, GENMASK(31, 30)},
+	{MT8196_DISP1_DLI_RELAY23, DISP_DLI_RELAY_1T2P, GENMASK(31, 30)},
+	{MT8196_DISP1_GCE_FRAME_DONE_SEL0, MT8196_FRAME_DONE_DVO, GENMASK(5, 0)},
+	{MT8196_DISP1_GCE_FRAME_DONE_SEL1, MT8196_FRAME_DONE_DP_INTF0, GENMASK(5, 0)},
+};
+
+static const struct mtk_mmsys_routes mmsys_mt8196_ovl0_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0_EXDMA2, DDP_COMPONENT_OVL0_BLENDER1,
+		MT8196_OVL_RSZ_IN_CB2_MOUT_EN, MT8196_DISP_OVL_EXDMA2_1_TO_OVL_EXDMA_OUT_CB3,
+		MT8196_DISP_OVL_EXDMA2_1_TO_OVL_EXDMA_OUT_CB3
+	}, {
+		DDP_COMPONENT_OVL0_EXDMA2, DDP_COMPONENT_OVL0_BLENDER1,
+		MT8196_OVL_EXDMA_OUT_CB3_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER1,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER1
+	}, {
+		DDP_COMPONENT_OVL0_EXDMA3, DDP_COMPONENT_OVL0_BLENDER2,
+		MT8196_OVL_EXDMA_OUT_CB4_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER2,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER2
+	}, {
+		DDP_COMPONENT_OVL0_EXDMA4, DDP_COMPONENT_OVL0_BLENDER3,
+		MT8196_OVL_EXDMA_OUT_CB5_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER3,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER3
+	}, {
+		DDP_COMPONENT_OVL0_EXDMA5, DDP_COMPONENT_OVL0_BLENDER4,
+		MT8196_OVL_EXDMA_OUT_CB6_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER4,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER4
+	}, {
+		DDP_COMPONENT_OVL0_EXDMA6, DDP_COMPONENT_OVL0_BLENDER5,
+		MT8196_OVL_EXDMA_OUT_CB7_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER5,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER5
+	}, {
+		DDP_COMPONENT_OVL0_EXDMA7, DDP_COMPONENT_OVL0_BLENDER6,
+		MT8196_OVL_EXDMA_OUT_CB8_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER6,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER6
+	}, {
+		DDP_COMPONENT_OVL0_EXDMA8, DDP_COMPONENT_OVL0_BLENDER7,
+		MT8196_OVL_EXDMA_OUT_CB9_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER7,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER7
+	}, {
+		DDP_COMPONENT_OVL0_EXDMA9, DDP_COMPONENT_OVL0_BLENDER8,
+		MT8196_OVL_EXDMA_OUT_CB10_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER8,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER8
+	}, {
+		DDP_COMPONENT_OVL0_BLENDER4, DDP_COMPONENT_OVL0_OUTPROC0,
+		MT8196_OVL_BLENDER_OUT_CB4_MOUT_EN, MT8196_DISP_OUT_BLENDER_CB_TO_OVL_OUTPROC0,
+		MT8196_DISP_OUT_BLENDER_CB_TO_OVL_OUTPROC0
+	}, {
+		DDP_COMPONENT_OVL0_BLENDER8, DDP_COMPONENT_OVL0_OUTPROC1,
+		MT8196_OVL_BLENDER_OUT_CB8_MOUT_EN, MT8196_DISP_OUT_BLENDER_CB_TO_OVL_OUTPROC1,
+		MT8196_DISP_OUT_BLENDER_CB_TO_OVL_OUTPROC1
+	}, {
+		DDP_COMPONENT_OVL0_OUTPROC0, DDP_COMPONENT_OVL0_DLO_ASYNC5,
+		MT8196_OVL_OUTPROC_OUT_CB0_MOUT_EN, MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY5,
+		MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY5
+	}, {
+		DDP_COMPONENT_OVL0_OUTPROC1, DDP_COMPONENT_OVL0_DLO_ASYNC6,
+		MT8196_OVL_OUTPROC_OUT_CB1_MOUT_EN, MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY6,
+		MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY6
+	}
+};
+
+static const struct mtk_mmsys_routes mmsys_mt8196_ovl1_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL1_EXDMA2, DDP_COMPONENT_OVL1_BLENDER1,
+		MT8196_OVL_RSZ_IN_CB2_MOUT_EN, MT8196_DISP_OVL_EXDMA2_1_TO_OVL_EXDMA_OUT_CB3,
+		MT8196_DISP_OVL_EXDMA2_1_TO_OVL_EXDMA_OUT_CB3
+	}, {
+		DDP_COMPONENT_OVL1_EXDMA2, DDP_COMPONENT_OVL1_BLENDER1,
+		MT8196_OVL_EXDMA_OUT_CB3_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER1,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER1
+	}, {
+		DDP_COMPONENT_OVL1_EXDMA3, DDP_COMPONENT_OVL1_BLENDER2,
+		MT8196_OVL_EXDMA_OUT_CB4_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER2,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER2
+	}, {
+		DDP_COMPONENT_OVL1_EXDMA4, DDP_COMPONENT_OVL1_BLENDER3,
+		MT8196_OVL_EXDMA_OUT_CB5_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER3,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER3
+	}, {
+		DDP_COMPONENT_OVL1_EXDMA5, DDP_COMPONENT_OVL1_BLENDER4,
+		MT8196_OVL_EXDMA_OUT_CB6_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER4,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER4
+	}, {
+		DDP_COMPONENT_OVL1_EXDMA6, DDP_COMPONENT_OVL1_BLENDER5,
+		MT8196_OVL_EXDMA_OUT_CB7_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER5,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER5
+	}, {
+		DDP_COMPONENT_OVL1_EXDMA7, DDP_COMPONENT_OVL1_BLENDER6,
+		MT8196_OVL_EXDMA_OUT_CB8_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER6,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER6
+	}, {
+		DDP_COMPONENT_OVL1_EXDMA8, DDP_COMPONENT_OVL1_BLENDER7,
+		MT8196_OVL_EXDMA_OUT_CB9_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER7,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER7
+	}, {
+		DDP_COMPONENT_OVL1_EXDMA9, DDP_COMPONENT_OVL1_BLENDER8,
+		MT8196_OVL_EXDMA_OUT_CB10_MOUT_EN, MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER8,
+		MT8196_DISP_OVL_EXDMA_OUT_CB_TO_OVL_BLENDER8
+	}, {
+		DDP_COMPONENT_OVL1_BLENDER4, DDP_COMPONENT_OVL1_OUTPROC0,
+		MT8196_OVL_BLENDER_OUT_CB4_MOUT_EN, MT8196_DISP_OUT_BLENDER_CB_TO_OVL_OUTPROC0,
+		MT8196_DISP_OUT_BLENDER_CB_TO_OVL_OUTPROC0
+	}, {
+		DDP_COMPONENT_OVL1_BLENDER8, DDP_COMPONENT_OVL1_OUTPROC1,
+		MT8196_OVL_BLENDER_OUT_CB8_MOUT_EN, MT8196_DISP_OUT_BLENDER_CB_TO_OVL_OUTPROC1,
+		MT8196_DISP_OUT_BLENDER_CB_TO_OVL_OUTPROC1
+	}, {
+		DDP_COMPONENT_OVL1_OUTPROC0, DDP_COMPONENT_OVL1_DLO_ASYNC5,
+		MT8196_OVL_OUTPROC_OUT_CB0_MOUT_EN, MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY5,
+		MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY5
+	}, {
+		DDP_COMPONENT_OVL1_OUTPROC1, DDP_COMPONENT_OVL1_DLO_ASYNC6,
+		MT8196_OVL_OUTPROC_OUT_CB1_MOUT_EN, MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY6,
+		MT8196_DISP_OVL_OUT_PROC_CB_TO_OVL_DLO_RELAY6
+	}
+};
+
+/*
+ * main: DLI_ASYNC0-> PQ_IN_CB0 -> PQ_OUT_CB6 -> PANEL_COMP_OUT_CB1 -> DLO_ASYNC1
+ * ext:  DLI_ASYNC1-> PQ_IN_CB1 -> PQ_OUT_CB7 -> PANEL_COMP_OUT_CB2 -> DLO_ASYNC2
+ */
+static const struct mtk_mmsys_routes mmsys_mt8196_disp0_routing_table[] = {
+	{
+		DDP_COMPONENT_DLI_ASYNC0, DDP_COMPONENT_DLO_ASYNC1,
+		MT8196_PQ_IN_CB0_MOUT_EN, MT8196_PQ_IN_CB0_TO_PQ_OUT_CB_6,
+		MT8196_PQ_IN_CB0_TO_PQ_OUT_CB_6
+	}, {
+		DDP_COMPONENT_DLI_ASYNC0, DDP_COMPONENT_DLO_ASYNC1,
+		MT8196_PQ_OUT_CB6_MOUT_EN, MT8196_PQ_OUT_CB6_TO_PANEL0_COMP_OUT_CB1,
+		MT8196_PQ_OUT_CB6_TO_PANEL0_COMP_OUT_CB1
+	}, {
+		DDP_COMPONENT_DLI_ASYNC0, DDP_COMPONENT_DLO_ASYNC1,
+		MT8196_PANEL_COMP_OUT_CB1_MOUT_EN, MT8196_DISP_TO_DLO_RELAY1,
+		MT8196_DISP_TO_DLO_RELAY1
+	}, {
+		DDP_COMPONENT_DLI_ASYNC1, DDP_COMPONENT_DLO_ASYNC2,
+		MT8196_PQ_IN_CB1_MOUT_EN, MT8196_PQ_IN_CB1_TO_PQ_OUT_CB_7,
+		MT8196_PQ_IN_CB1_TO_PQ_OUT_CB_7
+	}, {
+		DDP_COMPONENT_DLI_ASYNC1, DDP_COMPONENT_DLO_ASYNC2,
+		MT8196_PQ_OUT_CB7_MOUT_EN, MT8196_PQ_OUT_CB7_TO_PANEL0_COMP_OUT_CB2,
+		MT8196_PQ_OUT_CB7_TO_PANEL0_COMP_OUT_CB2
+	}, {
+		DDP_COMPONENT_DLI_ASYNC1, DDP_COMPONENT_DLO_ASYNC2,
+		MT8196_PANEL_COMP_OUT_CB2_MOUT_EN, MT8196_DISP_TO_DLO_RELAY2,
+		MT8196_DISP_TO_DLO_RELAY2
+	}, {
+		DDP_COMPONENT_DLI_ASYNC8, DDP_COMPONENT_DLO_ASYNC3,
+		MT8196_PQ_IN_CB8_MOUT_EN, MT8196_PQ_IN_CB8_TO_PQ_OUT_CB_8,
+		MT8196_PQ_IN_CB8_TO_PQ_OUT_CB_8
+	}, {
+		DDP_COMPONENT_DLI_ASYNC8, DDP_COMPONENT_DLO_ASYNC3,
+		MT8196_PQ_OUT_CB8_MOUT_EN, MT8196_PQ_OUT_CB8_TO_PANEL0_COMP_OUT_CB3,
+		MT8196_PQ_OUT_CB8_TO_PANEL0_COMP_OUT_CB3
+	}, {
+		DDP_COMPONENT_DLI_ASYNC8, DDP_COMPONENT_DLO_ASYNC3,
+		MT8196_PANEL_COMP_OUT_CB3_MOUT_EN, MT8196_DISP_TO_DLO_RELAY3,
+		MT8196_DISP_TO_DLO_RELAY3
+	}
+};
+
+/*
+ * main: DLI_ASYNC21-> SPLITTER_IN_CB1-> SPLITTER_OUT_CB9-> COMP_OUT_CB6-> MERGE_OUT_CB0 -> DVO
+ * ext: DLI_ASYNC22-> SPLITTER_IN_CB2-> SPLITTER_OUT_CB10-> COMP_OUT_CB7-> MERGE_OUT_CB1 -> DP_INTF0
+ */
+static const struct mtk_mmsys_routes mmsys_mt8196_disp1_routing_table[] = {
+	{
+		DDP_COMPONENT_DLI_ASYNC21, DDP_COMPONENT_DVO0,
+		MT8196_SPLITTER_IN_CB1_MOUT_EN, MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB9,
+		MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB9
+	}, {
+		DDP_COMPONENT_DLI_ASYNC21, DDP_COMPONENT_DVO0,
+		MT8196_SPLITTER_OUT_CB9_MOUT_EN, MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB6,
+		MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB6
+	}, {
+		DDP_COMPONENT_DLI_ASYNC21, DDP_COMPONENT_DVO0,
+		MT8196_COMP_OUT_CB6_MOUT_EN, MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB0,
+		MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB0
+	}, {
+		DDP_COMPONENT_DLI_ASYNC21, DDP_COMPONENT_DVO0,
+		MT8196_MERGE_OUT_CB0_MOUT_EN, MT8196_DISP_COMP_OUT_CB_TO_DVO0,
+		MT8196_DISP_COMP_OUT_CB_TO_DVO0
+	}, {
+		DDP_COMPONENT_DLI_ASYNC22, DDP_COMPONENT_DP_INTF0,
+		MT8196_SPLITTER_IN_CB2_MOUT_EN, MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB10,
+		MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB10
+	}, {
+		DDP_COMPONENT_DLI_ASYNC22, DDP_COMPONENT_DP_INTF0,
+		MT8196_SPLITTER_OUT_CB10_MOUT_EN, MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB7,
+		MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB7
+	}, {
+		DDP_COMPONENT_DLI_ASYNC22, DDP_COMPONENT_DP_INTF0,
+		MT8196_COMP_OUT_CB7_MOUT_EN, MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB1,
+		MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB1
+	}, {
+		DDP_COMPONENT_DLI_ASYNC22, DDP_COMPONENT_DP_INTF0,
+		MT8196_MERGE_OUT_CB1_MOUT_EN, MT8196_DISP_COMP_OUT_CB_TO_DP_INTF0,
+		MT8196_DISP_COMP_OUT_CB_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DVO0,
+		MT8196_SPLITTER_IN_CB3_MOUT_EN, MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB11,
+		MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB11
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DVO0,
+		MT8196_SPLITTER_OUT_CB11_MOUT_EN, MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB8,
+		MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB8
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DVO0,
+		MT8196_COMP_OUT_CB8_MOUT_EN, MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB2,
+		MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB2
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DVO0,
+		MT8196_MERGE_OUT_CB2_MOUT_EN, MT8196_DISP_COMP_OUT_CB_TO_DVO0,
+		MT8196_DISP_COMP_OUT_CB_TO_DVO0
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DP_INTF1,
+		MT8196_SPLITTER_IN_CB3_MOUT_EN, MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB11,
+		MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB11
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DP_INTF1,
+		MT8196_SPLITTER_OUT_CB11_MOUT_EN, MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB8,
+		MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB8
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DP_INTF1,
+		MT8196_COMP_OUT_CB8_MOUT_EN, MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB2,
+		MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB2
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DP_INTF1,
+		MT8196_MERGE_OUT_CB2_MOUT_EN, MT8196_DISP_COMP_OUT_CB_TO_DP_INTF1,
+		MT8196_DISP_COMP_OUT_CB_TO_DP_INTF1
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DSI0,
+		MT8196_SPLITTER_IN_CB3_MOUT_EN, MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB11,
+		MT8196_DISP_DLI_RELAY_TO_SPLITTER_OUT_CB11
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DSI0,
+		MT8196_SPLITTER_OUT_CB11_MOUT_EN, MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB8,
+		MT8196_DISP_SPLITTER_IN_CB_TO_COMP_OUT_CB8
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DSI0,
+		MT8196_COMP_OUT_CB8_MOUT_EN, MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB2,
+		MT8196_DISP_SPLITTER_OUT_CB_TO_MERGE_OUT_CB2
+	}, {
+		DDP_COMPONENT_DLI_ASYNC23, DDP_COMPONENT_DSI0,
+		MT8196_MERGE_OUT_CB2_MOUT_EN, MT8196_DISP_COMP_OUT_CB_TO_DSI0,
+		MT8196_DISP_COMP_OUT_CB_TO_DSI0
+	}
+};
+#endif /* __SOC_MEDIATEK_MT8196_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index bb4639ca0b8c..9916b23691a5 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -4,12 +4,14 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
@@ -21,6 +23,7 @@
 #include "mt8188-mmsys.h"
 #include "mt8192-mmsys.h"
 #include "mt8195-mmsys.h"
+#include "mt8196-mmsys.h"
 #include "mt8365-mmsys.h"
 
 #define MMSYS_SW_RESET_PER_REG 32
@@ -144,6 +147,54 @@ static const struct mtk_mmsys_driver_data mt8195_vppsys1_driver_data = {
 	.is_vppsys = true,
 };
 
+static const struct mtk_mmsys_driver_data mt8196_dispsys0_driver_data = {
+	.clk_driver = "clk-mt8196-disp0",
+	.routes = mmsys_mt8196_disp0_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8196_disp0_routing_table),
+	.async_info = mmsys_mt8196_disp0_async_comp_table,
+	.num_async_info = ARRAY_SIZE(mmsys_mt8196_disp0_async_comp_table),
+	.def_config = mmsys_mt8196_disp0_default_table,
+	.num_def_config = ARRAY_SIZE(mmsys_mt8196_disp0_default_table),
+	.num_top_clk = 1,
+};
+
+static const struct mtk_mmsys_driver_data mt8196_dispsys1_driver_data = {
+	.clk_driver = "clk-mt8196-disp1",
+	.routes = mmsys_mt8196_disp1_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8196_disp1_routing_table),
+	.async_info = mmsys_mt8196_disp1_async_comp_table,
+	.num_async_info = ARRAY_SIZE(mmsys_mt8196_disp1_async_comp_table),
+	.def_config = mmsys_mt8196_disp1_default_table,
+	.num_def_config = ARRAY_SIZE(mmsys_mt8196_disp1_default_table),
+	.num_top_clk = 1,
+};
+
+static const struct mtk_mmsys_driver_data mt8196_ovlsys0_driver_data = {
+	.clk_driver = "clk-mt8196-ovl0",
+	.routes = mmsys_mt8196_ovl0_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8196_ovl0_routing_table),
+	.async_info = mmsys_mt8196_ovl0_async_comp_table,
+	.num_async_info = ARRAY_SIZE(mmsys_mt8196_ovl0_async_comp_table),
+	.def_config = mmsys_mt8196_ovl0_default_table,
+	.num_def_config = ARRAY_SIZE(mmsys_mt8196_ovl0_default_table),
+};
+
+static const struct mtk_mmsys_driver_data mt8196_ovlsys1_driver_data = {
+	.clk_driver = "clk-mt8196-ovl1",
+	.routes = mmsys_mt8196_ovl1_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8196_ovl1_routing_table),
+	.async_info = mmsys_mt8196_ovl1_async_comp_table,
+	.num_async_info = ARRAY_SIZE(mmsys_mt8196_ovl1_async_comp_table),
+	.def_config = mmsys_mt8196_ovl0_default_table,
+	.num_def_config = ARRAY_SIZE(mmsys_mt8196_ovl0_default_table),
+};
+
+static const struct mtk_mmsys_driver_data mt8196_vdisp_ao_driver_data = {
+	.clk_driver = "clk-mt8196-vdisp_ao",
+	.def_config = mmsys_mt8196_vdisp_ao_default_table,
+	.num_def_config = ARRAY_SIZE(mmsys_mt8196_vdisp_ao_default_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
 	.clk_driver = "clk-mt8365-mm",
 	.routes = mt8365_mmsys_routing_table,
@@ -158,6 +209,9 @@ struct mtk_mmsys {
 	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
 	struct reset_controller_dev rcdev;
 	struct cmdq_client_reg cmdq_base;
+	struct clk **async_clk;
+	int num_async_clk;
+	struct clk **top_clk;
 };
 
 static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
@@ -180,6 +234,99 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
 	writel_relaxed(tmp, mmsys->regs + offset);
 }
 
+int mtk_mmsys_top_clk_enable(struct device *dev)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	int ret, i;
+
+	if (!mmsys->data->num_top_clk)
+		return 0;
+
+	for (i = 0; i < mmsys->data->num_top_clk; i++)
+		ret = clk_prepare_enable(mmsys->top_clk[i]);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_top_clk_enable);
+
+void mtk_mmsys_top_clk_disable(struct device *dev)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < mmsys->data->num_top_clk; i++)
+		clk_disable_unprepare(mmsys->top_clk[i]);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_top_clk_disable);
+
+int mtk_mmsys_ddp_clk_enable(struct device *dev, enum mtk_ddp_comp_id comp_id)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const struct mtk_mmsys_async_info *async = mmsys->data->async_info;
+
+	int i;
+
+	if (!mmsys->data->num_async_info)
+		return 0;
+
+	for (i = 0; i < mmsys->data->num_async_info; i++)
+		if (comp_id == async[i].comp_id)
+			return clk_prepare_enable(mmsys->async_clk[async[i].index]);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_clk_enable);
+
+void mtk_mmsys_ddp_clk_disable(struct device *dev, enum mtk_ddp_comp_id comp_id)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const struct mtk_mmsys_async_info *async = mmsys->data->async_info;
+	int i;
+
+	if (!mmsys->data->num_async_info)
+		return;
+
+	for (i = 0; i < mmsys->data->num_async_info; i++)
+		if (comp_id == async[i].comp_id)
+			clk_disable_unprepare(mmsys->async_clk[async[i].index]);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_clk_disable);
+
+void mtk_mmsys_ddp_config(struct device *dev, enum mtk_ddp_comp_id comp_id,
+			  int width, int height, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const struct mtk_mmsys_async_info *async = mmsys->data->async_info;
+	int i;
+
+	if (!mmsys->data->num_async_info)
+		return;
+
+	for (i = 0; i < mmsys->data->num_async_info; i++)
+		if (comp_id == async[i].comp_id)
+			break;
+
+	if (i == mmsys->data->num_async_info)
+		return;
+
+	mtk_mmsys_update_bits(mmsys, async[i].offset, async[i].mask,
+			      height << 16 | width, cmdq_pkt);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
+
+void mtk_mmsys_default_config(struct device *dev)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const struct mtk_mmsys_default *def_config = mmsys->data->def_config;
+	int i;
+
+	if (!mmsys->data->num_def_config)
+		return;
+
+	for (i = 0; i < mmsys->data->num_def_config; i++)
+		mtk_mmsys_update_bits(mmsys, def_config[i].offset, def_config[i].mask,
+				      def_config[i].val, NULL);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_default_config);
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
@@ -390,7 +537,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	struct platform_device *clks;
 	struct platform_device *drm;
 	struct mtk_mmsys *mmsys;
-	int ret;
+	int ret, i;
 
 	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
 	if (!mmsys)
@@ -432,6 +579,49 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return PTR_ERR(clks);
 	mmsys->clks_pdev = clks;
 
+	if (mmsys->data->num_top_clk) {
+		struct device_node *node;
+
+		node = of_get_child_by_name(dev->of_node, "top");
+		if (!node) {
+			dev_err(&pdev->dev, "Couldn't find top node\n");
+			return -EINVAL;
+		}
+
+		mmsys->top_clk = devm_kmalloc_array(dev, mmsys->data->num_top_clk,
+						    sizeof(*mmsys->top_clk), GFP_KERNEL);
+		if (!mmsys->top_clk)
+			return -ENOMEM;
+
+		for (i = 0; i < mmsys->data->num_top_clk; i++) {
+			mmsys->top_clk[i] = of_clk_get(node, i);
+			if (IS_ERR(mmsys->top_clk[i]))
+				return PTR_ERR(mmsys->top_clk[i]);
+		}
+	}
+
+	if (mmsys->data->num_async_info) {
+		struct device_node *node;
+
+		node = of_get_child_by_name(dev->of_node, "async");
+		if (!node) {
+			dev_err(&pdev->dev, "Couldn't find async node\n");
+			return -EINVAL;
+		}
+
+		mmsys->async_clk = devm_kmalloc_array(dev, mmsys->data->num_async_info,
+						      sizeof(*mmsys->async_clk), GFP_KERNEL);
+		if (!mmsys->async_clk)
+			return -ENOMEM;
+		mmsys->num_async_clk = mmsys->data->num_async_info;
+
+		for (i = 0; i < mmsys->num_async_clk; i++) {
+			mmsys->async_clk[i] = of_clk_get(node, i);
+			if (IS_ERR(mmsys->async_clk[i]))
+				return PTR_ERR(mmsys->async_clk[i]);
+		}
+	}
+
 	if (mmsys->data->is_vppsys)
 		goto out_probe_done;
 
@@ -443,6 +633,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	}
 	mmsys->drm_pdev = drm;
 
+	if (of_property_read_bool(dev->of_node, "power-domains"))
+		pm_runtime_enable(dev);
+
 out_probe_done:
 	return 0;
 }
@@ -453,6 +646,10 @@ static void mtk_mmsys_remove(struct platform_device *pdev)
 
 	platform_device_unregister(mmsys->drm_pdev);
 	platform_device_unregister(mmsys->clks_pdev);
+
+	if (of_property_read_bool(pdev->dev.of_node, "power-domains"))
+		pm_runtime_disable(&pdev->dev);
+
 }
 
 static const struct of_device_id of_match_mtk_mmsys[] = {
@@ -476,6 +673,11 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 	{ .compatible = "mediatek,mt8195-vdosys1", .data = &mt8195_vdosys1_driver_data },
 	{ .compatible = "mediatek,mt8195-vppsys0", .data = &mt8195_vppsys0_driver_data },
 	{ .compatible = "mediatek,mt8195-vppsys1", .data = &mt8195_vppsys1_driver_data },
+	{ .compatible = "mediatek,mt8196-dispsys0", .data = &mt8196_dispsys0_driver_data },
+	{ .compatible = "mediatek,mt8196-dispsys1", .data = &mt8196_dispsys1_driver_data },
+	{ .compatible = "mediatek,mt8196-ovlsys0", .data = &mt8196_ovlsys0_driver_data },
+	{ .compatible = "mediatek,mt8196-ovlsys1", .data = &mt8196_ovlsys1_driver_data },
+	{ .compatible = "mediatek,mt8196-vdisp-ao", .data = &mt8196_vdisp_ao_driver_data },
 	{ .compatible = "mediatek,mt8365-mmsys", .data = &mt8365_mmsys_driver_data },
 	{ /* sentinel */ }
 };
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index d370192737ca..56f510af4f36 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -88,6 +88,19 @@ struct mtk_mmsys_routes {
 	u32 val;
 };
 
+struct mtk_mmsys_async_info {
+	u32 comp_id;
+	u32 index;
+	u32 offset;
+	u32 mask;
+};
+
+struct mtk_mmsys_default {
+	u32 offset;
+	u32 val;
+	u32 mask;
+};
+
 /**
  * struct mtk_mmsys_driver_data - Settings of the mmsys
  * @clk_driver: Clock driver name that the mmsys is using
@@ -125,6 +138,11 @@ struct mtk_mmsys_driver_data {
 	const u32 num_resets;
 	const bool is_vppsys;
 	const u8 vsync_len;
+	const struct mtk_mmsys_async_info *async_info;
+	const unsigned int num_async_info;
+	const struct mtk_mmsys_default *def_config;
+	const unsigned int num_def_config;
+	const unsigned int num_top_clk;
 };
 
 /*
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 4885b065b849..4a0b10567581 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -29,6 +29,15 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_DITHER0,
 	DDP_COMPONENT_DITHER1,
+	DDP_COMPONENT_DLI_ASYNC0,
+	DDP_COMPONENT_DLI_ASYNC1,
+	DDP_COMPONENT_DLI_ASYNC8,
+	DDP_COMPONENT_DLI_ASYNC21,
+	DDP_COMPONENT_DLI_ASYNC22,
+	DDP_COMPONENT_DLI_ASYNC23,
+	DDP_COMPONENT_DLO_ASYNC1,
+	DDP_COMPONENT_DLO_ASYNC2,
+	DDP_COMPONENT_DLO_ASYNC3,
 	DDP_COMPONENT_DP_INTF0,
 	DDP_COMPONENT_DP_INTF1,
 	DDP_COMPONENT_DPI0,
@@ -39,6 +48,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_DSI1,
 	DDP_COMPONENT_DSI2,
 	DDP_COMPONENT_DSI3,
+	DDP_COMPONENT_DVO0,
 	DDP_COMPONENT_ETHDR_MIXER,
 	DDP_COMPONENT_GAMMA,
 	DDP_COMPONENT_MDP_RDMA0,
@@ -58,10 +68,52 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_OD0,
 	DDP_COMPONENT_OD1,
 	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_OVL0_BLENDER1,
+	DDP_COMPONENT_OVL0_BLENDER2,
+	DDP_COMPONENT_OVL0_BLENDER3,
+	DDP_COMPONENT_OVL0_BLENDER4,
+	DDP_COMPONENT_OVL0_BLENDER5,
+	DDP_COMPONENT_OVL0_BLENDER6,
+	DDP_COMPONENT_OVL0_BLENDER7,
+	DDP_COMPONENT_OVL0_BLENDER8,
+	DDP_COMPONENT_OVL0_BLENDER9,
+	DDP_COMPONENT_OVL0_DLO_ASYNC5,
+	DDP_COMPONENT_OVL0_DLO_ASYNC6,
+	DDP_COMPONENT_OVL0_EXDMA2,
+	DDP_COMPONENT_OVL0_EXDMA3,
+	DDP_COMPONENT_OVL0_EXDMA4,
+	DDP_COMPONENT_OVL0_EXDMA5,
+	DDP_COMPONENT_OVL0_EXDMA6,
+	DDP_COMPONENT_OVL0_EXDMA7,
+	DDP_COMPONENT_OVL0_EXDMA8,
+	DDP_COMPONENT_OVL0_EXDMA9,
+	DDP_COMPONENT_OVL0_OUTPROC0,
+	DDP_COMPONENT_OVL0_OUTPROC1,
 	DDP_COMPONENT_OVL_2L0,
 	DDP_COMPONENT_OVL_2L1,
 	DDP_COMPONENT_OVL_2L2,
 	DDP_COMPONENT_OVL1,
+	DDP_COMPONENT_OVL1_BLENDER1,
+	DDP_COMPONENT_OVL1_BLENDER2,
+	DDP_COMPONENT_OVL1_BLENDER3,
+	DDP_COMPONENT_OVL1_BLENDER4,
+	DDP_COMPONENT_OVL1_BLENDER5,
+	DDP_COMPONENT_OVL1_BLENDER6,
+	DDP_COMPONENT_OVL1_BLENDER7,
+	DDP_COMPONENT_OVL1_BLENDER8,
+	DDP_COMPONENT_OVL1_BLENDER9,
+	DDP_COMPONENT_OVL1_DLO_ASYNC5,
+	DDP_COMPONENT_OVL1_DLO_ASYNC6,
+	DDP_COMPONENT_OVL1_EXDMA2,
+	DDP_COMPONENT_OVL1_EXDMA3,
+	DDP_COMPONENT_OVL1_EXDMA4,
+	DDP_COMPONENT_OVL1_EXDMA5,
+	DDP_COMPONENT_OVL1_EXDMA6,
+	DDP_COMPONENT_OVL1_EXDMA7,
+	DDP_COMPONENT_OVL1_EXDMA8,
+	DDP_COMPONENT_OVL1_EXDMA9,
+	DDP_COMPONENT_OVL1_OUTPROC0,
+	DDP_COMPONENT_OVL1_OUTPROC1,
 	DDP_COMPONENT_PADDING0,
 	DDP_COMPONENT_PADDING1,
 	DDP_COMPONENT_PADDING2,
@@ -84,6 +136,14 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_ID_MAX,
 };
 
+int mtk_mmsys_top_clk_enable(struct device *dev);
+void mtk_mmsys_top_clk_disable(struct device *dev);
+int mtk_mmsys_ddp_clk_enable(struct device *dev, enum mtk_ddp_comp_id comp_id);
+void mtk_mmsys_ddp_clk_disable(struct device *dev, enum mtk_ddp_comp_id comp_id);
+void mtk_mmsys_ddp_config(struct device *dev, enum mtk_ddp_comp_id comp_id,
+			  int width, int height, struct cmdq_pkt *cmdq_pkt);
+void mtk_mmsys_default_config(struct device *dev);
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next);
-- 
2.34.1

