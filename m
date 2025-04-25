Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BC2A9C390
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89FB10E8E7;
	Fri, 25 Apr 2025 09:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="O6z25tYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3396710E325
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:32:45 +0000 (UTC)
X-UUID: 3c2aa0aa21b811f0980a8d1746092496-20250425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=i9MWMC+hxix5AGtsxkl6l2IO/73jngjxqO3lnBBHAtA=; 
 b=O6z25tYl/LVvsVORwrqoSkjTQHAoxMYE/URMQadW5O7KfF2c14pYRf3Ct4jzsowCrbaA4oNuaiKBpAi5pb6fItuCeOfCf7Od0Ig/Oi1j81UlVx1J6+9qCRa07TAF3dQVWVCkGS/grzn0vLCxmKto85iIwYTaQRxbtStl/B2CQyk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:7f5a3bab-4363-472e-b52b-4b6621b22a37, IP:0,
 UR
 L:0,TC:0,Content:41,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:41
X-CID-META: VersionHash:0ef645f, CLOUDID:78c7dd6f-e08c-41ab-89e8-3ba0a33da853,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:4|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3c2aa0aa21b811f0980a8d1746092496-20250425
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1867053971; Fri, 25 Apr 2025 17:32:41 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 25 Apr 2025 17:32:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 25 Apr 2025 17:32:39 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Paul-PL Chen <pual-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
 <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
 <wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v5 14/19] soc: mediatek: mtk-cmdq: Add new APIs to replace
 cmdq_pkt_write() and cmdq_pkt_write_mask()
Date: Fri, 25 Apr 2025 17:28:46 +0800
Message-ID: <20250425093237.1543918-15-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250425093237.1543918-1-jason-jh.lin@mediatek.com>
References: <20250425093237.1543918-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

To support generating GCE write instructions using both pa_base and
subsys, the original cmdq_pkt_write() and cmdq_pkt_write_mask() have
been expanded into four new APIs:
- Replaced cmdq_pkt_write() to cmdq_pkt_write_pa() and
  cmdq_pkt_write_subsys().
- Replaced cmdq_pkt_write_mask() to cmdq_pkt_write_mask_pa() and
  cmdq_pkt_write_mask_subsys().

The original cmdq_pkt_write() and cmdq_pkt_write_mask() will be removed
after all CMDQ users have migrated to the new APIs.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 41 +++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 79 ++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index bae6753bd4a7..fd978fbd684b 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -213,6 +213,26 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_write);
 
+int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/, u32 pa_base,
+		      u16 offset, u32 value)
+{
+	int err;
+
+	err = cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_HIGH(pa_base));
+	if (err < 0)
+		return err;
+
+	return cmdq_pkt_write_s_value(pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_LOW(offset), value);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_pa);
+
+int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base /*unused*/,
+			  u16 offset, u32 value)
+{
+	return cmdq_pkt_write(pkt, subsys, offset, value);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_subsys);
+
 int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 			u16 offset, u32 value, u32 mask)
 {
@@ -230,6 +250,27 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask);
 
+int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/, u32 pa_base,
+			   u16 offset, u32 value, u32 mask)
+{
+	int err;
+
+	err = cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_HIGH(pa_base));
+	if (err < 0)
+		return err;
+
+	return cmdq_pkt_write_s_mask_value(pkt, CMDQ_THR_SPR_IDX0,
+					   CMDQ_ADDR_LOW(offset), value, mask);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_mask_pa);
+
+int cmdq_pkt_write_mask_subsys(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base /*unused*/,
+			       u16 offset, u32 value, u32 mask)
+{
+	return cmdq_pkt_write_mask(pkt, subsys, offset, value, mask);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_mask_subsys);
+
 int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
 		    u16 reg_idx)
 {
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index f9a48262cb95..4a2acceb8581 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -124,6 +124,32 @@ void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
  */
 int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
 
+/**
+ * cmdq_pkt_write_pa() - append write command to the CMDQ packet with pa_base
+ * @pkt:	the CMDQ packet
+ * @subsys:	unused parameter
+ * @pa_base:	the physical address base of the hardware register
+ * @offset:	register offset from CMDQ sub system
+ * @value:	the specified target register value
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
+		      u32 pa_base, u16 offset, u32 value);
+
+/**
+ * cmdq_pkt_write_subsys() - append write command to the CMDQ packet with subsys
+ * @pkt:	the CMDQ packet
+ * @subsys:	the CMDQ sub system code
+ * @pa_base:	unused parameter
+ * @offset:	register offset from CMDQ sub system
+ * @value:	the specified target register value
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys,
+			  u32 pa_base /*unused*/, u16 offset, u32 value);
+
 /**
  * cmdq_pkt_write_mask() - append write command with mask to the CMDQ packet
  * @pkt:	the CMDQ packet
@@ -137,6 +163,34 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
 int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 			u16 offset, u32 value, u32 mask);
 
+/**
+ * cmdq_pkt_write_mask_pa() - append write command with mask to the CMDQ packet with pa
+ * @pkt:	the CMDQ packet
+ * @subsys:	unused parameter
+ * @pa_base:	the physical address base of the hardware register
+ * @offset:	register offset from CMDQ sub system
+ * @value:	the specified target register value
+ * @mask:	the specified target register mask
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
+			   u32 pa_base, u16 offset, u32 value, u32 mask);
+
+/**
+ * cmdq_pkt_write_mask_subsys() - append write command with mask to the CMDQ packet with subsys
+ * @pkt:	the CMDQ packet
+ * @subsys:	the CMDQ sub system code
+ * @pa_base:	unused parameter
+ * @offset:	register offset from CMDQ sub system
+ * @value:	the specified target register value
+ * @mask:	the specified target register mask
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_write_mask_subsys(struct cmdq_pkt *pkt, u8 subsys,
+			       u32 pa_base /*unused*/, u16 offset, u32 value, u32 mask);
+
 /*
  * cmdq_pkt_read_s() - append read_s command to the CMDQ packet
  * @pkt:	the CMDQ packet
@@ -411,12 +465,37 @@ static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u3
 	return -ENOENT;
 }
 
+static inline int cmdq_pkt_write_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
+				    u32 pa_base, u16 offset, u32 value)
+{
+	return -ENOENT;
+}
+
+static inline int cmdq_pkt_write_subsys(struct cmdq_pkt *pkt, u8 subsys,
+					u32 pa_base /*unused*/, u16 offset, u32 value)
+{
+	return -ENOENT;
+}
+
 static inline int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 				      u16 offset, u32 value, u32 mask)
 {
 	return -ENOENT;
 }
 
+static inline int cmdq_pkt_write_mask_pa(struct cmdq_pkt *pkt, u8 subsys /*unused*/,
+					 u32 pa_base, u16 offset, u32 value, u32 mask)
+{
+	return -ENOENT;
+}
+
+static inline int cmdq_pkt_write_mask_subsys(struct cmdq_pkt *pkt, u8 subsys,
+					     u32 pa_base /*unused*/, u16 offset,
+					     u32 value, u32 mask)
+{
+	return -ENOENT;
+}
+
 static inline int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
 				  u16 addr_low, u16 reg_idx)
 {
-- 
2.43.0

