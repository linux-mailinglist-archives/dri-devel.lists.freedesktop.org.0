Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D448CF225
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 01:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE2D10E664;
	Sat, 25 May 2024 23:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="FBqDSKQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE9710E664
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 23:29:39 +0000 (UTC)
X-UUID: a39b35fa1aee11efbfff99f2466cf0b4-20240526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dLzIMiXjUsZV9PSNPeZ0kbP79lmdw9z9EWXzOS2nUKg=; 
 b=FBqDSKQsaOchysu0FxmxngC4zquuxQe3gKubXLar2knG65150kVxZD/4TiM5vnlTf82tEZDZSu2QFew3ZRSMWtrEcdac94OzrEJZDPj4Yr/3WFFVF93DOAw1E8e+QAWOrlUziKy7JPhGU4mppoBWGZaKunEuTfpPrMrZGh4CAUQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:c79dd11f-2451-48f2-8ddc-52bc1df055ae, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:68d53693-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a39b35fa1aee11efbfff99f2466cf0b4-20240526
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1894434324; Sun, 26 May 2024 07:29:32 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:29:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:29:30 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Maxime Ripard <mripard@kernel.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, Jason-ch
 Chen <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
 <jkardatzke@google.com>
Subject: [PATCH v6 5/7] drm/mediatek: Add mtk_ddp_sec_write() to config secure
 buffer info
Date: Sun, 26 May 2024 07:29:26 +0800
Message-ID: <20240525232928.5524-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
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

Add mtk_ddp_sec_write() to configure secure buffer information to
cmdq secure packet data and send to the secure world.

OVL and OVL_ADAPTOR need to use mtk_ddp_sec_write() instead of original
mtk_ddp_write() because the address in plane is secure handle not the real
buffer address.

The secure buffer information will be used to translate the secure handle
to the curresponding secure buffer address and then the secure handle in
instruction generated by OVL or OVL_ADPATOR will be replaced to the real
address in secure world.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c         | 14 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h         |  5 +++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         |  9 +++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |  1 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         |  8 ++++++--
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h         |  1 +
 6 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 17b036411292..dc2b36a8bdd6 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -111,6 +111,20 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 #endif
 }
 
+void mtk_ddp_sec_write(struct cmdq_pkt *cmdq_pkt,
+		       enum cmdq_iwc_addr_metadata_type type,
+		       unsigned int base, unsigned int base_offset,
+		       struct cmdq_client_reg *cmdq_reg, unsigned int offset)
+{
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (!cmdq_pkt)
+		return;
+
+	cmdq_sec_pkt_write(cmdq_pkt, cmdq_reg->subsys, cmdq_reg->offset + offset,
+			   type, base, base_offset);
+#endif
+}
+
 static int mtk_ddp_clk_enable(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 26236691ce4c..792fd1b004ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -7,6 +7,7 @@
 #define MTK_DDP_COMP_H
 
 #include <linux/io.h>
+#include <linux/mailbox/mtk-cmdq-sec-mailbox.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
@@ -339,4 +340,8 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 			struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			unsigned int offset, unsigned int mask);
+void mtk_ddp_sec_write(struct cmdq_pkt *cmdq_pkt,
+		       enum cmdq_iwc_addr_metadata_type type,
+		       unsigned int base, unsigned int base_offset,
+		       struct cmdq_client_reg *cmdq_reg, unsigned int offset);
 #endif /* MTK_DDP_COMP_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index b552a02d7eae..5f518c9c63dc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -449,8 +449,13 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 			      DISP_REG_OVL_SRC_SIZE(idx));
 	mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_OFFSET(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
-			      DISP_REG_OVL_ADDR(ovl, idx));
+
+	if (pending->is_secure)
+		mtk_ddp_sec_write(cmdq_pkt, CMDQ_IWC_H_2_MVA, pending->addr, 0,
+				  &ovl->cmdq_reg, DISP_REG_OVL_ADDR(ovl, idx));
+	else
+		mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
+				      DISP_REG_OVL_ADDR(ovl, idx));
 
 	if (is_afbc) {
 		mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg, ovl->regs,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 02dd7dcdfedb..5db8711f21c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -188,6 +188,7 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 	rdma_config.pitch = pending->pitch;
 	rdma_config.fmt = pending->format;
 	rdma_config.color_encoding = pending->color_encoding;
+	rdma_config.is_secure = state->pending.is_secure;
 	mtk_mdp_rdma_config(rdma_l, &rdma_config, cmdq_pkt);
 
 	if (use_dual_pipe) {
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index 925cbb7471ec..961189e16aab 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -199,8 +199,12 @@ void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
 		mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
 				   MDP_RDMA_SRC_CON, FLD_OUTPUT_ARGB);
 
-	mtk_ddp_write_mask(cmdq_pkt, cfg->addr0, &priv->cmdq_reg, priv->regs,
-			   MDP_RDMA_SRC_BASE_0, FLD_SRC_BASE_0);
+	if (cfg->is_secure)
+		mtk_ddp_sec_write(cmdq_pkt, CMDQ_IWC_H_2_MVA, cfg->addr0, 0,
+				  &priv->cmdq_reg, MDP_RDMA_SRC_BASE_0);
+	else
+		mtk_ddp_write_mask(cmdq_pkt, cfg->addr0, &priv->cmdq_reg, priv->regs,
+				   MDP_RDMA_SRC_BASE_0, FLD_SRC_BASE_0);
 
 	mtk_ddp_write_mask(cmdq_pkt, src_pitch_y, &priv->cmdq_reg, priv->regs,
 			   MDP_RDMA_MF_BKGD_SIZE_IN_BYTE, FLD_MF_BKGD_WB);
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
index 9943ee3aac31..fcd9b3a934d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
@@ -15,6 +15,7 @@ struct mtk_mdp_rdma_cfg {
 	unsigned int	y_top;
 	int		fmt;
 	int		color_encoding;
+	bool		is_secure;
 };
 
 #endif // __MTK_MDP_RDMA_H__
-- 
2.18.0

