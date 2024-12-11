Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAC39EC32B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 04:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E7D10EA53;
	Wed, 11 Dec 2024 03:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="M97ZjAGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09A810EA46
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 03:23:05 +0000 (UTC)
X-UUID: 38e9b308b76f11efbd192953cf12861f-20241211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AewIw7iiAczZIdGvxah8jnWCWAkHtIDK6C0ls/hjIp8=; 
 b=M97ZjAGAfVKxSapsFJLL8Ctlr7e9Ktmy54Mei59I/AQroxj9NXEFP9d44wtHumIe9prAc7Hm99s0Nsi01k11HQbl8U0YmeTRDwziiDjeMUTKBsDU5y3mClXoYl2hJnC9/35uwgVQX7Vta0Jsip2eKoh46mgyQ1TtRHc5h2c5TOk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:d2492053-b470-4326-8777-03dc5aa3f437, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:27532dc1-1c82-4420-82d9-d6eb228f5c4a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
 :nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 38e9b308b76f11efbd192953cf12861f-20241211
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 275636038; Wed, 11 Dec 2024 11:22:59 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 11:22:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 11:22:58 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho
 <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 4/8] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 unsupported subsys ID hardware
Date: Wed, 11 Dec 2024 11:22:52 +0800
Message-ID: <20241211032256.28494-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When GCE executes instructions, the corresponding hardware register
can be found through the subsys ID. For hardware that does not support
subsys IDs, the physical address needs to be used to generate GCE
instructions.

This commit adds a pa_base parsing flow to the cmdq_client_reg structure
for these unsupported subsys ID hardware.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 18 ++++++++++++++++--
 include/linux/soc/mediatek/mtk-cmdq.h  |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 0a05ee87a0fc..87734639c37c 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/mailbox_controller.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
@@ -60,20 +61,30 @@ int cmdq_dev_get_client_reg(struct device *dev,
 			    struct cmdq_client_reg *client_reg, int idx)
 {
 	struct of_phandle_args spec;
+	struct resource res;
 	int err;
 
 	if (!client_reg)
 		return -ENOENT;
 
+	if (of_address_to_resource(dev->of_node, 0, &res) != 0) {
+		dev_err(dev, "Missing reg in %s node\n", dev->of_node->full_name);
+		return -EINVAL;
+	}
+	client_reg->pa_base = res.start;
+
 	err = of_parse_phandle_with_fixed_args(dev->of_node,
 					       "mediatek,gce-client-reg",
 					       3, idx, &spec);
 	if (err < 0) {
-		dev_warn(dev,
+		dev_dbg(dev,
 			"error %d can't parse gce-client-reg property (%d)",
 			err, idx);
 
-		return err;
+		/* make subsys invalid */
+		client_reg->subsys = U8_MAX;
+
+		return 0;
 	}
 
 	client_reg->subsys = (u8)spec.args[0];
@@ -130,6 +141,9 @@ int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt, size_t siz
 
 	pkt->buf_size = size;
 
+	/* need to use pkt->cl->chan later to call mbox APIs when generating instruction */
+	pkt->cl = (void *)client;
+
 	dev = client->chan->mbox->dev;
 	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
 				  DMA_TO_DEVICE);
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 5bee6f7fc400..d925f9dc7987 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -52,6 +52,7 @@ struct cmdq_operand {
 
 struct cmdq_client_reg {
 	u8 subsys;
+	u32 pa_base;
 	u16 offset;
 	u16 size;
 };
-- 
2.43.0

