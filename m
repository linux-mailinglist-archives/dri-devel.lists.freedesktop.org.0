Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D619EC323
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 04:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C3210EA4A;
	Wed, 11 Dec 2024 03:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="jFCK7S34";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26A510EA46
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 03:23:07 +0000 (UTC)
X-UUID: 39df223eb76f11efbd192953cf12861f-20241211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=T4U1k9XsfEGnGGquUv29OTEOhnDqH/IOUcFAOC5VTd4=; 
 b=jFCK7S34RuUvVjncNCZEhwxUelsrsWqsfHEBu3kSjEIoUcaXBUKRMC43PmAy590fdIJ6NukHXZqMwgf7fp3PZ1WR+BOCbxhXKTCi+ckpNzumkKM2FYQf3VIYjPGR6drbUrEOUeXgD2VX7x+NWNxEL6mTBeZCvppVsJlQ0p6o4MI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:67157db2-320e-47d9-a329-fe529da79c4b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:2267c53b-e809-4df3-83cd-88f012b9e9ba,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
 :nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 39df223eb76f11efbd192953cf12861f-20241211
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1124864045; Wed, 11 Dec 2024 11:23:01 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 11:22:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 11:22:59 +0800
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
Subject: [PATCH v2 5/8] soc: mediatek: mtk-cmdq: Add mminfra_offset
 compatibility for DRAM address
Date: Wed, 11 Dec 2024 11:22:53 +0800
Message-ID: <20241211032256.28494-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.185700-8.000000
X-TMASE-MatchedRID: DCodz87H3pGAaBshbPhdTBes/RxhysDb7JU5VR9SYzectWHPLT5Fffm0
 YT+bdWqugML9UOgCBPc0Hb0yXykDnwFuUZy6kMeHA9lly13c/gGXYX34rFl3x0UNHQAoZf5c8tM
 WbtVzWkhQRF/YWVwiHyItTFGzkWdF5UcZtwNsCroURSScn+QSXt0H8LFZNFG7CKFCmhdu5cWeVQ
 JCOVCzcKwprm+vRmmGCmE2/uKUWiWFzI9t6v+l/uRhla2fBb2CgudlomqT4OzUOysKObTyDtflf
 nlnLGPtOvRb/Ij74vkXRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9WgDXVPCp6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.185700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 13C680120697E02D6B588F5B336C1BFDD78F4F353F9A8447A2C5D70A815F4FED2000:8
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

Since GCE has been moved to mminfra in MT8196, all transactions from
mminfra to DRAM will have their addresses adjusted by subtracting a
mminfra offset.
This information should be handled inside the CMDQ driver, allowing
CMDQ users to call CMDQ APIs as usual.

Therefore, CMDQ driver needs to use the mbox API to get the
mminfra_offset value of the SoC, and then add it to the DRAM address
when generating instructions to ensure GCE accesses the correct DRAM
address.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 35 ++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 87734639c37c..623f89cd7448 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -314,10 +314,22 @@ EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
 
 int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_addr)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	const u16 high_addr_reg_idx  = CMDQ_THR_SPR_IDX0;
 	const u16 value_reg_idx = CMDQ_THR_SPR_IDX1;
 	int ret;
 
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_addr_need_offset(cl->chan, src_addr))
+		src_addr += cmdq_get_offset_pa(cl->chan);
+
+	if (cmdq_addr_need_offset(cl->chan, dst_addr))
+		dst_addr += cmdq_get_offset_pa(cl->chan);
+
 	/* read the value of src_addr into high_addr_reg_idx */
 	ret = cmdq_pkt_assign(pkt, high_addr_reg_idx, CMDQ_ADDR_HIGH(src_addr));
 	if (ret < 0)
@@ -428,10 +440,19 @@ EXPORT_SYMBOL(cmdq_pkt_poll_mask);
 
 int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mask)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	struct cmdq_instruction inst = { {0} };
 	u8 use_mask = 0;
 	int ret;
 
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_addr_need_offset(cl->chan, addr))
+		addr += cmdq_get_offset_pa(cl->chan);
+
 	/*
 	 * Append an MASK instruction to set the mask for following POLL instruction
 	 * which enables use_mask bit.
@@ -509,11 +530,21 @@ EXPORT_SYMBOL(cmdq_pkt_assign);
 
 int cmdq_pkt_jump_abs(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
 {
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_JUMP,
-		.offset = CMDQ_JUMP_ABSOLUTE,
-		.value = addr >> shift_pa
+		.offset = CMDQ_JUMP_ABSOLUTE
 	};
+
+	if (!cl) {
+		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	if (cmdq_addr_need_offset(cl->chan, addr))
+		addr += cmdq_get_offset_pa(cl->chan);
+
+	inst.value = addr >> shift_pa;
 	return cmdq_pkt_append_command(pkt, inst);
 }
 EXPORT_SYMBOL(cmdq_pkt_jump_abs);
-- 
2.43.0

