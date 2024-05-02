Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E38B9900
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 12:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CA310F2BE;
	Thu,  2 May 2024 10:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JdCp+rZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDA310EA34
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 10:39:03 +0000 (UTC)
X-UUID: 2f73c04c087011ef8065b7b53f7091ad-20240502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dSpJSOC9OoMfwaxFo9XXw230ZGEEADTBxXaORyFZ0gU=; 
 b=JdCp+rZEkkMLPcObeww1i9mqGQ6mzfuZQiP9/2nhn5qJ1xYAxb4rDjZg7PbCqM56H9t1h0ElRaddTTSbc8BuCZo6KDzOTBN3bkggxauz6PKKrMV/hqOMA2/Fo8Gr5SH/9PObTtyW3UTKZnVLsiUKDLpOqeNzsRY8QC26OOjP2ds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:27b6ebd0-02f9-4e9d-9258-c354b0e47292, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:82c5f88, CLOUDID:ccaede86-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2f73c04c087011ef8065b7b53f7091ad-20240502
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 11151424; Thu, 02 May 2024 18:38:59 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 2 May 2024 18:38:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 2 May 2024 18:38:58 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, "Nancy .
 Lin" <nancy.lin@mediatek.com>, Fei Shao <fshao@chromium.org>, Sean Paul
 <sean@poorly.run>, Jason Chen
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Hsiao
 Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v7 18/18] drm/mediatek: Support CRC in OVL adaptor
Date: Thu, 2 May 2024 18:38:48 +0800
Message-ID: <20240502103848.5845-19-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240502103848.5845-1-shawn.sung@mediatek.com>
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
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

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

We choose Mixer as CRC generator in OVL adaptor since
its frame done event will trigger vblanks, we can know
when is safe to retrieve CRC of the frame.

In OVL adaptor, there's no image procession after Mixer,
unlike the OVL in VDOSYS0, Mixer's CRC will include all
the effects that are applied to the frame.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  3 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  3 +
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 21 +++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 61 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  5 ++
 5 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index cb71effda9c2a..8aab373ce67c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -406,6 +406,9 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.clk_enable = mtk_ovl_adaptor_clk_enable,
 	.clk_disable = mtk_ovl_adaptor_clk_disable,
 	.config = mtk_ovl_adaptor_config,
+	.crc_cnt = mtk_ovl_adaptor_crc_cnt,
+	.crc_entry = mtk_ovl_adaptor_crc_entry,
+	.crc_read = mtk_ovl_adaptor_crc_read,
 	.start = mtk_ovl_adaptor_start,
 	.stop = mtk_ovl_adaptor_stop,
 	.layer_nr = mtk_ovl_adaptor_layer_nr,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index c476056a5cbb5..24af08b1c86d6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -138,6 +138,9 @@ const u32 *mtk_ovl_adaptor_get_formats(struct device *dev);
 size_t mtk_ovl_adaptor_get_num_formats(struct device *dev);
 enum drm_mode_status mtk_ovl_adaptor_mode_valid(struct device *dev,
 						const struct drm_display_mode *mode);
+size_t mtk_ovl_adaptor_crc_cnt(struct device *dev);
+u32 *mtk_ovl_adaptor_crc_entry(struct device *dev);
+void mtk_ovl_adaptor_crc_read(struct device *dev);
 
 void mtk_rdma_bypass_shadow(struct device *dev);
 int mtk_rdma_clk_enable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 2b62d64759181..4995a359e6406 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -207,6 +207,27 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 	mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
 }
 
+size_t mtk_ovl_adaptor_crc_cnt(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	return mtk_ethdr_crc_cnt(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
+u32 *mtk_ovl_adaptor_crc_entry(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	return mtk_ethdr_crc_entry(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
+void mtk_ovl_adaptor_crc_read(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	mtk_ethdr_crc_read(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+}
+
 void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 			    unsigned int h, unsigned int vrefresh,
 			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 91ebeee6c8b1d..512c08ce2bbe7 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -24,6 +24,9 @@
 #define MIX_FME_CPL_INTEN			BIT(1)
 #define MIX_INTSTA			0x8
 #define MIX_EN				0xc
+#define MIX_TRIG			0x10
+#define MIX_TRIG_CRC_EN				BIT(8)
+#define MIX_TRIG_CRC_RST			BIT(9)
 #define MIX_RST				0x14
 #define MIX_ROI_SIZE			0x18
 #define MIX_DATAPATH_CON		0x1c
@@ -39,6 +42,11 @@
 #define PREMULTI_SOURCE				(3 << 12)
 #define MIX_L_SRC_SIZE(n)		(0x30 + 0x18 * (n))
 #define MIX_L_SRC_OFFSET(n)		(0x34 + 0x18 * (n))
+
+/* CRC register offsets for odd and even lines */
+#define MIX_CRC_ODD			0x110
+#define MIX_CRC_EVEN			0x114
+
 #define MIX_FUNC_DCM0			0x120
 #define MIX_FUNC_DCM1			0x124
 #define MIX_FUNC_DCM_ENABLE			0xffffffff
@@ -82,6 +90,7 @@ struct mtk_ethdr {
 	void			*vblank_cb_data;
 	int			irq;
 	struct reset_control	*reset_ctl;
+	struct mtk_crtc_crc	crc;
 };
 
 static const char * const ethdr_clk_str[] = {
@@ -100,6 +109,32 @@ static const char * const ethdr_clk_str[] = {
 	"vdo_be_async",
 };
 
+static const u32 ethdr_crc_ofs[] = {
+	MIX_CRC_ODD,
+	MIX_CRC_EVEN,
+};
+
+size_t mtk_ethdr_crc_cnt(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	return priv->crc.cnt;
+}
+
+u32 *mtk_ethdr_crc_entry(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	return priv->crc.va;
+}
+
+void mtk_ethdr_crc_read(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	mtk_crtc_read_crc(&priv->crc, priv->ethdr_comp[ETHDR_MIXER].regs);
+}
+
 void mtk_ethdr_register_vblank_cb(struct device *dev,
 				  void (*vblank_cb)(void *),
 				  void *vblank_cb_data)
@@ -258,6 +293,13 @@ void mtk_ethdr_start(struct device *dev)
 	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
 
 	writel(1, mixer->regs + MIX_EN);
+
+	if (priv->crc.cnt) {
+		writel(MIX_TRIG_CRC_EN, mixer->regs + MIX_TRIG);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+		mtk_crtc_start_crc_cmdq(&priv->crc);
+#endif
+	}
 }
 
 void mtk_ethdr_stop(struct device *dev)
@@ -265,6 +307,9 @@ void mtk_ethdr_stop(struct device *dev)
 	struct mtk_ethdr *priv = dev_get_drvdata(dev);
 	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_crtc_stop_crc_cmdq(&priv->crc);
+#endif
 	writel(0, mixer->regs + MIX_EN);
 	writel(1, mixer->regs + MIX_RST);
 	reset_control_reset(priv->reset_ctl);
@@ -319,6 +364,9 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	mtk_crtc_init_crc(&priv->crc, ethdr_crc_ofs, ARRAY_SIZE(ethdr_crc_ofs),
+			  MIX_TRIG, MIX_TRIG_CRC_RST);
+
 	for (i = 0; i < ETHDR_ID_MAX; i++) {
 		priv->ethdr_comp[i].dev = dev;
 		priv->ethdr_comp[i].regs = of_iomap(dev->of_node, i);
@@ -327,6 +375,16 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 					      &priv->ethdr_comp[i].cmdq_base, i);
 		if (ret)
 			dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+
+		if (i == ETHDR_MIXER) {
+			if (of_property_read_u32_index(dev->of_node,
+						       "mediatek,gce-events", i,
+						       &priv->crc.cmdq_event)) {
+				dev_warn(dev, "failed to get gce-events for crc\n");
+			}
+			priv->crc.cmdq_reg = &priv->ethdr_comp[i].cmdq_base;
+			mtk_crtc_create_crc_cmdq(dev, &priv->crc);
+		}
 #endif
 		dev_dbg(dev, "[DRM]regs:0x%p, node:%d\n", priv->ethdr_comp[i].regs, i);
 	}
@@ -367,6 +425,9 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 
 static void mtk_ethdr_remove(struct platform_device *pdev)
 {
+	struct mtk_ethdr *priv = dev_get_drvdata(&pdev->dev);
+
+	mtk_crtc_destroy_crc(&priv->crc);
 	component_del(&pdev->dev, &mtk_ethdr_component_ops);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.h b/drivers/gpu/drm/mediatek/mtk_ethdr.h
index 81af9edea3f74..d17d7256bd120 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.h
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.h
@@ -22,4 +22,9 @@ void mtk_ethdr_register_vblank_cb(struct device *dev,
 void mtk_ethdr_unregister_vblank_cb(struct device *dev);
 void mtk_ethdr_enable_vblank(struct device *dev);
 void mtk_ethdr_disable_vblank(struct device *dev);
+
+size_t mtk_ethdr_crc_cnt(struct device *dev);
+u32 *mtk_ethdr_crc_entry(struct device *dev);
+void mtk_ethdr_crc_read(struct device *dev);
+
 #endif
-- 
2.18.0

