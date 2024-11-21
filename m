Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585C9D46A9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 05:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8BC10E866;
	Thu, 21 Nov 2024 04:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="f0fPbLT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FCA10E85B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 04:26:13 +0000 (UTC)
X-UUID: b944a170a7c011efbd192953cf12861f-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=y/HYZkCjMi/ix73of1+xF02BKJkJHJdcSOfEK1SDWV4=; 
 b=f0fPbLT1s9gY3xhUQ7t2E7p8nEVbdkmCjD3sWwt26sl+duv3T9nrgPCqPx+F6YmZhApFRJewIYyC+nI2xEpxEDeOq2thQkRk3d7IpBIhkRLu+zU2bwe8GEX0RmyWCy9xp1f6lnPsBbKydAOjSQOMye7ognDncql470mp8TQl85A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:e1e2530d-a765-43be-8dde-fc6b95361400, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:e41a8fa0-f395-4dfc-8188-ce2682df7fd8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
 :nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b944a170a7c011efbd192953cf12861f-20241121
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2056932415; Thu, 21 Nov 2024 12:26:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 12:26:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 12:26:04 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Moudy
 Ho <moudy.ho@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-media@vger.kernel.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID
 programing flow
Date: Thu, 21 Nov 2024 12:25:58 +0800
Message-ID: <20241121042602.32730-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
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
can be found through the subsys ID.
For unsupported subsys ID hardware, the physical address need to be used
to generate GCE instructions.

Add the pa_base interface to the instruction programming flow for these
unsupported subsys ID hardware.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 90 ++++++++++++++++++++++----
 include/linux/soc/mediatek/mtk-cmdq.h  | 22 ++++---
 2 files changed, 92 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 0a05ee87a0fc..ffdf3cecf6fe 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/mailbox_controller.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
@@ -60,11 +61,18 @@ int cmdq_dev_get_client_reg(struct device *dev,
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
@@ -73,7 +81,10 @@ int cmdq_dev_get_client_reg(struct device *dev,
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
@@ -189,32 +203,65 @@ static int cmdq_pkt_mask(struct cmdq_pkt *pkt, u32 mask)
 	return cmdq_pkt_append_command(pkt, inst);
 }
 
-int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
+int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base, u16 offset, u32 value)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_WRITE,
 		.value = value,
 		.offset = offset,
 		.subsys = subsys
 	};
-	return cmdq_pkt_append_command(pkt, inst);
+	int err;
+
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_subsys_is_valid(cl->chan, subsys)) {
+		err = cmdq_pkt_append_command(pkt, inst);
+	} else {
+		err = cmdq_pkt_assign(pkt, 0, CMDQ_ADDR_HIGH(pa_base));
+		if (err < 0)
+			return err;
+
+		err = cmdq_pkt_write_s_value(pkt, 0, CMDQ_ADDR_LOW(offset), value);
+	}
+
+	return err;
 }
 EXPORT_SYMBOL(cmdq_pkt_write);
 
-int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 			u16 offset, u32 value, u32 mask)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	u16 offset_mask = offset;
 	int err;
 
-	if (mask != GENMASK(31, 0)) {
-		err = cmdq_pkt_mask(pkt, mask);
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_subsys_is_valid(cl->chan, subsys)) {
+		if (mask != GENMASK(31, 0)) {
+			err = cmdq_pkt_mask(pkt, mask);
+			if (err < 0)
+				return err;
+
+			offset_mask |= CMDQ_WRITE_ENABLE_MASK;
+		}
+		err = cmdq_pkt_write(pkt, subsys, pa_base, offset_mask, value);
+	} else {
+		err = cmdq_pkt_assign(pkt, 0, CMDQ_ADDR_HIGH(pa_base));
 		if (err < 0)
 			return err;
 
-		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
+		err = cmdq_pkt_write_s_mask_value(pkt, 0, CMDQ_ADDR_LOW(offset), value, mask);
 	}
-	return cmdq_pkt_write(pkt, subsys, offset_mask, value);
+	return err;
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask);
 
@@ -385,20 +432,39 @@ int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
 }
 EXPORT_SYMBOL(cmdq_pkt_set_event);
 
-int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 		  u16 offset, u32 value)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_POLL,
 		.value = value,
 		.offset = offset,
 		.subsys = subsys
 	};
-	return cmdq_pkt_append_command(pkt, inst);
+	int err;
+
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (!cmdq_subsys_is_valid(cl->chan, subsys)) {
+		err = cmdq_pkt_assign(pkt, CMDQ_POLL_ADDR_GPR, pa_base);
+		if (err < 0)
+			return err;
+
+		inst.offset = CMDQ_ADDR_LOW(offset);
+		inst.subsys = CMDQ_POLL_ADDR_GPR;
+	}
+
+	err = cmdq_pkt_append_command(pkt, inst);
+
+	return err;
 }
 EXPORT_SYMBOL(cmdq_pkt_poll);
 
-int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 		       u16 offset, u32 value, u32 mask)
 {
 	int err;
@@ -408,7 +474,7 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 		return err;
 
 	offset = offset | CMDQ_POLL_ENABLE_MASK;
-	return cmdq_pkt_poll(pkt, subsys, offset, value);
+	return cmdq_pkt_poll(pkt, subsys, pa_base, offset, value);
 }
 EXPORT_SYMBOL(cmdq_pkt_poll_mask);
 
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 5bee6f7fc400..0edc51ff4296 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -52,6 +52,7 @@ struct cmdq_operand {
 
 struct cmdq_client_reg {
 	u8 subsys;
+	u32 pa_base;
 	u16 offset;
 	u16 size;
 };
@@ -114,24 +115,26 @@ void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
  * cmdq_pkt_write() - append write command to the CMDQ packet
  * @pkt:	the CMDQ packet
  * @subsys:	the CMDQ sub system code
+ * @pa_base:	register pa base address, use this when subsys is invalid
  * @offset:	register offset from CMDQ sub system
  * @value:	the specified target register value
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
+int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base, u16 offset, u32 value);
 
 /**
  * cmdq_pkt_write_mask() - append write command with mask to the CMDQ packet
  * @pkt:	the CMDQ packet
  * @subsys:	the CMDQ sub system code
+ * @pa_base:	register pa base address, use this when subsys is invalid
  * @offset:	register offset from CMDQ sub system
  * @value:	the specified target register value
  * @mask:	the specified target register mask
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 			u16 offset, u32 value, u32 mask);
 
 /*
@@ -272,12 +275,13 @@ int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event);
  *		     instruction.
  * @pkt:	the CMDQ packet
  * @subsys:	the CMDQ sub system code
+ * @pa_base:	register pa base address, use this when subsys is invalid
  * @offset:	register offset from CMDQ sub system
  * @value:	the specified target register value
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 		  u16 offset, u32 value);
 
 /**
@@ -288,13 +292,14 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
  *		          instruction.
  * @pkt:	the CMDQ packet
  * @subsys:	the CMDQ sub system code
+ * @pa_base:	register pa base address, use this when subsys is invalid
  * @offset:	register offset from CMDQ sub system
  * @value:	the specified target register value
  * @mask:	the specified target register mask
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
+int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 		       u16 offset, u32 value, u32 mask);
 
 /**
@@ -421,12 +426,13 @@ static inline int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *p
 
 static inline void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt) { }
 
-static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
+static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
+				 u16 offset, u32 value)
 {
 	return -ENOENT;
 }
 
-static inline int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
+static inline int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 				      u16 offset, u32 value, u32 mask)
 {
 	return -ENOENT;
@@ -477,13 +483,13 @@ static inline int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
+static inline int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 				u16 offset, u32 value)
 {
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
+static inline int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
 				     u16 offset, u32 value, u32 mask)
 {
 	return -EINVAL;
-- 
2.43.0

