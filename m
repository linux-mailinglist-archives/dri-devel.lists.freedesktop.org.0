Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF7B9146CF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C9310E3E2;
	Mon, 24 Jun 2024 09:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JytlDlBL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D051B10E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:57:30 +0000 (UTC)
X-UUID: 2a409eaa321011ef8da6557f11777fc4-20240624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0iNOqC4ExHJI9vE+qU5diPKgNqr+3Qv/k5yPv1/9KZw=; 
 b=JytlDlBLXKeRQXA6lpSpyKVqHCyEiRfrTy0/rZ/LjsohoxxeehLBrpgoE1DGiZOLP/HTZafzRvi5vzSMKRdqyNI8W3NLhOq0RuW7nqO+mtZpgtWg5anCRpcowMHwbPMYOXYCTUCtsA2ZaLbFLVzqFv+hQZ55k8YeR7Ym+QjfZ1E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:eb58e965-3a89-456a-9d6c-a666997e4f86, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:393d96e, CLOUDID:4e59f688-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 2a409eaa321011ef8da6557f11777fc4-20240624
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1024759110; Mon, 24 Jun 2024 17:57:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 24 Jun 2024 17:57:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 24 Jun 2024 17:57:26 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>
Subject: [PATCH] drm/mediatek: Fix bit depth overwritten for mtk_ovl_set
 bit_depth()
Date: Mon, 24 Jun 2024 17:57:26 +0800
Message-ID: <20240624095726.18818-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
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

Refine the value and mask define of bit depth for mtk_ovl_set bit_depth().
Use cmdq_pkt_write_mask() instead of cmdq_pkt_write() to avoid bit depth
settings being overwritten.

Fixes: fb36c5020c9c ("drm/mediatek: Add support for AR30 and BA30 overlays")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
Based on: https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 4b370bc0746d..d35f5b4b22c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -42,7 +42,11 @@
 #define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701		0x0040
-#define DISP_REG_OVL_CLRFMT_EXT			0x02D0
+#define DISP_REG_OVL_CLRFMT_EXT			0x02d0
+#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(n)		(GENMASK(1, 0) << (4 * (n)))
+#define OVL_CON_CLRFMT_BIT_DEPTH(depth, n)		((depth) << (4 * (n)))
+#define OVL_CON_CLRFMT_8_BIT				(0)
+#define OVL_CON_CLRFMT_10_BIT				(1)
 #define DISP_REG_OVL_ADDR_MT8173		0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
 #define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
@@ -65,10 +69,6 @@
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					OVL_CON_CLRFMT_RGB : 0)
-#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)	(0xFF << 4 * (ovl))
-#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)	(depth << 4 * (ovl))
-#define OVL_CON_CLRFMT_8_BIT			0x00
-#define OVL_CON_CLRFMT_10_BIT			0x01
 #define	OVL_CON_AEN		BIT(8)
 #define	OVL_CON_ALPHA		0xff
 #define	OVL_CON_VIRT_FLIP	BIT(9)
@@ -273,22 +273,17 @@ static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
 				  struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
-	unsigned int reg;
 	unsigned int bit_depth = OVL_CON_CLRFMT_8_BIT;
 
 	if (!ovl->data->supports_clrfmt_ext)
 		return;
 
-	reg = readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
-	reg &= ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
-
 	if (is_10bit_rgb(format))
 		bit_depth = OVL_CON_CLRFMT_10_BIT;
 
-	reg |= OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
-
-	mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg,
-		      ovl->regs, DISP_REG_OVL_CLRFMT_EXT);
+	mtk_ddp_write_mask(cmdq_pkt, OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx),
+			   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_CLRFMT_EXT,
+			   OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx));
 }
 
 void mtk_ovl_config(struct device *dev, unsigned int w,
-- 
2.18.0

