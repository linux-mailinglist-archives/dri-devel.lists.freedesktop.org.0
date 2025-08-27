Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FA7B38159
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1483710E7D8;
	Wed, 27 Aug 2025 11:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="YtFMn20t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130C710E7C0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 11:40:16 +0000 (UTC)
X-UUID: 97394882833a11f0b33aeb1e7f16c2b6-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yO7IGbtx7IsAXKW1K4xuelNcYtjWkb3TvYhd+LDoO3c=; 
 b=YtFMn20t6tj+db17CNxU3gOOzsY0l8h9+whCMNzcD5+pLGF5I2zde7uoTsiAfrmOMHCVUESlhTgMKIxYiAaYzJDlZlGeqMH5RDCZ945lWQlI2eImqivY6Em7/UZPG3SEcwxwzDkqCL9dEYJOUCoV2Oz03QqORXXGYIIXjpxD+pk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:feaaf52f-46ba-4573-924c-d5d16c420a21, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:172fab6d-c2f4-47a6-876f-59a53e9ecc6e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97394882833a11f0b33aeb1e7f16c2b6-20250827
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 103294444; Wed, 27 Aug 2025 19:40:11 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 19:40:10 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 19:40:09 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v7 16/20] soc: mediatek: mtk-cmdq: Remove shift_pa parameter
 from cmdq_pkt_jump()
Date: Wed, 27 Aug 2025 19:37:48 +0800
Message-ID: <20250827114006.3310175-17-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
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

Since shift_pa will be stored in the cmdq_mbox_priv structure within
cmdq_pkt, all shift_pa parameters in CMDQ helper APIs can be removed.

Remove the shift_pa parameters from cmdq_pkt_jump(), cmdq_pkt_jump_abs(),
and cmdq_pkt_jump_rel().

Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c |  8 ++++----
 include/linux/soc/mediatek/mtk-cmdq.h  | 18 +++++++-----------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index ced798e8d6b4..749c40a1bac8 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -548,7 +548,7 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_assign);
 
-int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
@@ -559,11 +559,11 @@ int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 }
 EXPORT_SYMBOL(cmdq_pkt_jump_abs);
 
-int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset)
 {
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
-		.value = (u32)offset >> shift_pa
+		.value = (u32)offset >> pkt->priv.shift_pa
 	};
 	return cmdq_pkt_append_command(pkt, inst);
 }
@@ -571,7 +571,7 @@ EXPORT_SYMBOL(cmdq_pkt_jump_rel);
 
 int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
 {
-	return cmdq_pkt_jump_rel(pkt, offset, shift_pa);
+	return cmdq_pkt_jump_rel(pkt, offset);
 }
 EXPORT_SYMBOL(cmdq_pkt_jump_rel_temp);
 
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 2055f194c6e9..bcbb99999c3e 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -407,17 +407,15 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mas
  *			 contains more instruction.
  * @pkt:        the CMDQ packet
  * @addr:       absolute physical address of target instruction buffer
- * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
- *		is got by cmdq_get_shift_pa().
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa);
+int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr);
 
 /* This wrapper has to be removed after all users migrated to jump_abs */
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
-	return cmdq_pkt_jump_abs(pkt, addr, shift_pa);
+	return cmdq_pkt_jump_abs(pkt, addr);
 }
 
 /**
@@ -427,12 +425,10 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_
  *			 target address should contains more instruction.
  * @pkt:	the CMDQ packet
  * @offset:	relative offset of target instruction buffer from current PC.
- * @shift_pa:	shift bits of physical address in CMDQ instruction. This value
- *		is got by cmdq_get_shift_pa().
  *
  * Return: 0 for success; else the error code is returned
  */
-int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
+int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset);
 
 /* This wrapper has to be removed after all users migrated to jump_rel */
 int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
@@ -576,17 +572,17 @@ static inline int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+static inline int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
+static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
 {
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset)
 {
 	return -EINVAL;
 }
-- 
2.43.0

