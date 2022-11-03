Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0D6174F0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 04:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BD210E575;
	Thu,  3 Nov 2022 03:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A57D10E56D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 03:25:22 +0000 (UTC)
X-UUID: 2b8192ce3c1c49679320a91183d685c1-20221103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BAbs0IjDVsViVrySB7IBCipZ7l2lYXu6rrJFRwYE9jc=; 
 b=GgFrXGmdGrskoYNaJBrh8V8cn0N7rFg0/wnD4aYJRDlRO3UuyhVq7NEtGaN8hvU5ZzGOwjE/oiqTE6SZ2OxPL143q7wGUvfXwnrIaCJ2b27Qelaw5LuJ/fVB4MXuKVhHlA/N0fJ87fWC1FIYbIUSUQZcQewXgEDYv06pDAtZ21k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:0471f3d9-050b-43aa-8d70-0c6bb9dda8d1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:100
X-CID-INFO: VERSION:1.1.12, REQID:0471f3d9-050b-43aa-8d70-0c6bb9dda8d1, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:100
X-CID-META: VersionHash:62cd327, CLOUDID:7e7946eb-84ac-4628-a416-bc50d5503da6,
 B
 ulkID:22110311251790FM7FG4,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2b8192ce3c1c49679320a91183d685c1-20221103
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1743284829; Thu, 03 Nov 2022 11:25:16 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 3 Nov 2022 11:25:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 3 Nov 2022 11:25:15 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
 <nfraprado@collabora.com>
Subject: [PATCH v27 11/11] soc: mediatek: add mtk-mutex support for mt8195
 vdosys1
Date: Thu, 3 Nov 2022 11:25:12 +0800
Message-ID: <20221103032512.9144-12-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221103032512.9144-1-nancy.lin@mediatek.com>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
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
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 41cba6aa0e83..8d0eb70690e5 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -130,6 +130,24 @@
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
 #define MT8365_MUTEX_MOD_DISP_OVL0		7
 #define MT8365_MUTEX_MOD_DISP_OVL0_2L		8
 #define MT8365_MUTEX_MOD_DISP_RDMA0		9
@@ -372,6 +390,21 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
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
 
 static const unsigned int mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
-- 
2.18.0

