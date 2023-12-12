Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654B80EB77
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 13:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DDE10E5E9;
	Tue, 12 Dec 2023 12:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4756A10E5DC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 12:20:09 +0000 (UTC)
X-UUID: c735aa1498e811eea5db2bebc7c28f94-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KIx5/HI4HAsZhhvbPfbiM+jroIK7c4B0KZSaWT0axyw=; 
 b=q5lLvcQj5Gh7gcLeGON+THEQyHQXSRoVEeH/EcXp2w5BPVDDI4SzsMZ8vbSrIuy2kDRehZ1o3Xb2pHxtKhpyfuxs+Bx5+a82UxIW0S9WDsuEmT/NU1VeuJ6wsYvXMgEa0ePV1uWfJHCJiYYwuhLKtO8cfJ/fi+KpDOdNHZhSeQc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:ad5c7b7a-a89b-4749-9144-6e08d0b0246d, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5d391d7, CLOUDID:8da8b373-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: c735aa1498e811eea5db2bebc7c28f94-20231212
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 349522150; Tue, 12 Dec 2023 20:20:03 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 20:20:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 20:20:02 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v4 14/17] drm/mediatek: Support CRC in OVL adaptor
Date: Tue, 12 Dec 2023 20:19:54 +0800
Message-ID: <20231212121957.19231-15-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231212121957.19231-1-shawn.sung@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Fei Shao <fshao@chromium.org>,
 Sean Paul <sean@poorly.run>, Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We choose Mixer as CRC generator in OVL adaptor since
its frame done event will trigger vblanks, we can know
when is safe to retrieve CRC of the frame.

In OVL adaptor, there's no image procession after Mixer,
unlike the OVL in VDOSYS0, Mixer's CRC will include all
the effects that are applied to the frame.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  3 +
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 21 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  3 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 62 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  5 ++
 5 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 08cc2d2fef9f..4d6e8b667bc3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -133,6 +133,9 @@ unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
 struct device *mtk_ovl_adaptor_dma_dev_get(struct device *dev);
 const u32 *mtk_ovl_adaptor_get_formats(struct device *dev);
 size_t mtk_ovl_adaptor_get_num_formats(struct device *dev);
+size_t mtk_ovl_adaptor_crc_cnt(struct device *dev);
+u32 *mtk_ovl_adaptor_crc_entry(struct device *dev);
+void mtk_ovl_adaptor_crc_read(struct device *dev);
 
 void mtk_rdma_bypass_shadow(struct device *dev);
 int mtk_rdma_clk_enable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 8789442c039f..4398db9a6276 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -205,6 +205,27 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
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
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 1118efcde98a..ffa4868b1222 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -404,6 +404,9 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.clk_enable = mtk_ovl_adaptor_clk_enable,
 	.clk_disable = mtk_ovl_adaptor_clk_disable,
 	.config = mtk_ovl_adaptor_config,
+	.crc_cnt = mtk_ovl_adaptor_crc_cnt,
+	.crc_entry = mtk_ovl_adaptor_crc_entry,
+	.crc_read = mtk_ovl_adaptor_crc_read,
 	.start = mtk_ovl_adaptor_start,
 	.stop = mtk_ovl_adaptor_stop,
 	.layer_nr = mtk_ovl_adaptor_layer_nr,
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index e95331c06815..30eb2c3d95c0 100644
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
+	struct mtk_drm_crc	crc;
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
+	mtk_drm_crc_read(&priv->crc, priv->ethdr_comp[ETHDR_MIXER].regs);
+}
+
 void mtk_ethdr_register_vblank_cb(struct device *dev,
 				  void (*vblank_cb)(void *),
 				  void *vblank_cb_data)
@@ -256,6 +291,13 @@ void mtk_ethdr_start(struct device *dev)
 	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
 
 	writel(1, mixer->regs + MIX_EN);
+
+	if (priv->crc.cnt) {
+		writel(MIX_TRIG_CRC_EN, mixer->regs + MIX_TRIG);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+		mtk_drm_crc_cmdq_start(&priv->crc);
+#endif
+	}
 }
 
 void mtk_ethdr_stop(struct device *dev)
@@ -263,6 +305,9 @@ void mtk_ethdr_stop(struct device *dev)
 	struct mtk_ethdr *priv = dev_get_drvdata(dev);
 	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_drm_crc_cmdq_stop(&priv->crc);
+#endif
 	writel(0, mixer->regs + MIX_EN);
 	writel(1, mixer->regs + MIX_RST);
 	reset_control_reset(priv->reset_ctl);
@@ -317,6 +362,10 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	mtk_drm_crc_init(&priv->crc,
+			 ethdr_crc_ofs, ARRAY_SIZE(ethdr_crc_ofs),
+			 MIX_TRIG, MIX_TRIG_CRC_RST);
+
 	for (i = 0; i < ETHDR_ID_MAX; i++) {
 		priv->ethdr_comp[i].dev = dev;
 		priv->ethdr_comp[i].regs = of_iomap(dev->of_node, i);
@@ -325,6 +374,16 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
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
+			mtk_drm_crc_cmdq_create(dev, &priv->crc);
+		}
 #endif
 		dev_dbg(dev, "[DRM]regs:0x%p, node:%d\n", priv->ethdr_comp[i].regs, i);
 	}
@@ -365,6 +424,9 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 
 static int mtk_ethdr_remove(struct platform_device *pdev)
 {
+	struct mtk_ethdr *priv = dev_get_drvdata(&pdev->dev);
+
+	mtk_drm_crc_destroy(&priv->crc);
 	component_del(&pdev->dev, &mtk_ethdr_component_ops);
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.h b/drivers/gpu/drm/mediatek/mtk_ethdr.h
index 81af9edea3f7..d17d7256bd12 100644
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

