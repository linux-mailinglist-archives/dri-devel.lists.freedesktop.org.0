Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83A2896568
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB34B1125A1;
	Wed,  3 Apr 2024 07:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="DyBzs/CN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A31112581
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 07:07:41 +0000 (UTC)
X-UUID: d934965af18811ee935d6952f98a51a9-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GmGZAW8mpfexN64ehNWIW0/mmu8YZ8RFchKd47zeVTI=; 
 b=DyBzs/CNwIR7wGc4HPRrR+2zrVxtRKb36PNpEC/q4EPdJ9oAx5xSGLyC+tBnnDBXJyub1jIalayJoBK83aI0bh45J0Yl4XR5ZrzXrhh3WiFE10PgmoISdPwtE9eZSbhcZmqrW/ZpSVmxYssgHKeZfDG61EddvVmAV8N21ZgsvG0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:ba42ada6-1284-41cc-ad28-8b6f4f4418ea, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:a33a2a91-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d934965af18811ee935d6952f98a51a9-20240403
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1233226653; Wed, 03 Apr 2024 15:07:35 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 15:07:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 15:07:34 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Jason-JH.Lin <jason-jh.lin@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v4 6/9] drm/mediatek: Add secure layer config support for
 ovl_adaptor
Date: Wed, 3 Apr 2024 15:07:29 +0800
Message-ID: <20240403070732.22085-7-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403070732.22085-1-shawn.sung@mediatek.com>
References: <20240403070732.22085-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.834500-8.000000
X-TMASE-MatchedRID: DpePiNkRMPoXSulpnju2H23NvezwBrVm3zhylsE9dsyOUV82NDH4AnB4
 4IkzjfYyThbvLLI8RvMG5c7m0h1VRbvaJG+XDhc27spMO3HwKCB51GakW92m5n5h6y4KCSJcuhl
 6WurGX2r9RAbT7UVIFpszRCLl5Qsxi9Om4SO4imSNzYJBKgDdEVg3VqSTJ7So+Cckfm+bb6Dv6l
 FsG12On0EkMRBsoO4JtHv1o/Ln88+BkjWfpo1TNp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gK
 q42LRYkDs65JOs30n7UOBg1Tk/3dlBCXvoDkHND7p6xRsjIubd+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.834500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B186393543F08BCE398BC1D711E465D599CCD6446D9385CB3EC5DF72F617BDC82000:8
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Add secure layer config support for ovl_adaptor and sub driver mdp_rdma.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c         |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h         |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 15 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         | 11 ++++++++---
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h         |  2 ++
 5 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 0ee9e42cdf0a0..cda0da4848029 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -439,6 +439,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.get_formats = mtk_ovl_adaptor_get_formats,
 	.get_num_formats = mtk_ovl_adaptor_get_num_formats,
 	.mode_valid = mtk_ovl_adaptor_mode_valid,
+	.get_sec_port = mtk_ovl_adaptor_get_sec_port,
 };
 
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 24af08b1c86d6..d2c8fac468798 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -122,6 +122,7 @@ void mtk_ovl_adaptor_clk_disable(struct device *dev);
 void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 			    unsigned int h, unsigned int vrefresh,
 			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+u64 mtk_ovl_adaptor_get_sec_port(struct mtk_ddp_comp *comp, unsigned int idx);
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 				  struct mtk_plane_state *state,
 				  struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index bf6d7429561fe..7b42ea6b8c221 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -130,6 +130,18 @@ static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
 	[OVL_ADAPTOR_PADDING7] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING7, 7, &padding },
 };
 
+static const u64 ovl_adaptor_sec_port[] = {
+	BIT_ULL(CMDQ_SEC_VDO1_DISP_RDMA_L0),
+	BIT_ULL(CMDQ_SEC_VDO1_DISP_RDMA_L1),
+	BIT_ULL(CMDQ_SEC_VDO1_DISP_RDMA_L2),
+	BIT_ULL(CMDQ_SEC_VDO1_DISP_RDMA_L3),
+};
+
+u64 mtk_ovl_adaptor_get_sec_port(struct mtk_ddp_comp *comp, unsigned int idx)
+{
+	return ovl_adaptor_sec_port[idx];
+}
+
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 				  struct mtk_plane_state *state,
 				  struct cmdq_pkt *cmdq_pkt)
@@ -188,6 +200,9 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 	rdma_config.pitch = pending->pitch;
 	rdma_config.fmt = pending->format;
 	rdma_config.color_encoding = pending->color_encoding;
+	rdma_config.source_size = (pending->height - 1) * pending->pitch +
+				  pending->width * fmt_info->cpp[0];
+	rdma_config.is_secure = state->pending.is_secure;
 	mtk_mdp_rdma_config(rdma_l, &rdma_config, cmdq_pkt);
 
 	if (use_dual_pipe) {
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index ee9ce9b6d0786..1ecbefdd161f9 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -94,6 +94,7 @@ struct mtk_mdp_rdma {
 	void __iomem		*regs;
 	struct clk		*clk;
 	struct cmdq_client_reg	cmdq_reg;
+	resource_size_t		regs_pa;
 };
 
 static unsigned int rdma_fmt_convert(unsigned int fmt)
@@ -198,9 +199,12 @@ void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
 	else
 		mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
 				   MDP_RDMA_SRC_CON, FLD_OUTPUT_ARGB);
-
-	mtk_ddp_write_mask(cmdq_pkt, cfg->addr0, &priv->cmdq_reg, priv->regs,
-			   MDP_RDMA_SRC_BASE_0, FLD_SRC_BASE_0);
+	if (cfg->is_secure)
+		mtk_ddp_sec_write(cmdq_pkt, priv->regs_pa + MDP_RDMA_SRC_BASE_0,
+				  cfg->addr0, CMDQ_IWC_H_2_MVA, 0, cfg->source_size, 0);
+	else
+		mtk_ddp_write_mask(cmdq_pkt, cfg->addr0, &priv->cmdq_reg, priv->regs,
+				   MDP_RDMA_SRC_BASE_0, FLD_SRC_BASE_0);
 
 	mtk_ddp_write_mask(cmdq_pkt, src_pitch_y, &priv->cmdq_reg, priv->regs,
 			   MDP_RDMA_MF_BKGD_SIZE_IN_BYTE, FLD_MF_BKGD_WB);
@@ -300,6 +304,7 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs_pa = res->start;
 	priv->regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap rdma\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
index 9943ee3aac31e..cd48404114111 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
@@ -15,6 +15,8 @@ struct mtk_mdp_rdma_cfg {
 	unsigned int	y_top;
 	int		fmt;
 	int		color_encoding;
+	unsigned int	source_size;
+	unsigned int	is_secure;
 };
 
 #endif // __MTK_MDP_RDMA_H__
-- 
2.18.0

