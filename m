Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7448B1E8BB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 14:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3065810E926;
	Fri,  8 Aug 2025 12:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="WDDv0CS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF76710E4E3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 12:57:26 +0000 (UTC)
X-UUID: 37320d80745711f0b33aeb1e7f16c2b6-20250808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=F7/5iPlMS2Eikv0pSJnmqFU+Hn3Pmxuqd3z8Jpy57g0=; 
 b=WDDv0CS8dx/LXnWRh3lSzkR3sK7Jex9b9biqzx7cBDVmtJHnaa+2X4ZxGQAGbJ4oQZB5eKm5xua+ueEquLINf/8Cm9H8jT6xLFyEH+u/iCU/SpUl6H03lF2GiwqZeQLAyLu0yS+xUb2ZNAMC8h736JMaXGLVTrEUCbjOLy06GT8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:2aa67724-7a77-4554-bb78-17b3f65fd855, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:acb1be9d-7ad4-4169-ab95-78e9164f00fe,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 37320d80745711f0b33aeb1e7f16c2b6-20250808
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jay.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1419771957; Fri, 08 Aug 2025 20:57:18 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 8 Aug 2025 20:57:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 8 Aug 2025 20:57:14 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Jay Liu <jay.liu@mediatek.com>, CK Hu
 <ck.hu@mediatek.com>
Subject: [PATCH v3 6/6] drm/mediatek: Add TDSHP component support for MT8196
Date: Fri, 8 Aug 2025 20:54:01 +0800
Message-ID: <20250808125512.9788-7-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250808125512.9788-1-jay.liu@mediatek.com>
References: <20250808125512.9788-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add TDSHP component support for MT8196.
TDSHP is a hardware module designed to enhance the sharpness and
clarity of displayed images by analyzing and improving edges and
fine details in frames.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Jay Liu <jay.liu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 49 +++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 +
 3 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 850e3b18da61..c63a12c41215 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -57,6 +57,14 @@
 #define POSTMASK_RELAY_MODE				BIT(0)
 #define DISP_REG_POSTMASK_SIZE			0x0030
 
+#define DISP_REG_TDSHP_CTRL			0x0100
+#define DISP_TDSHP_CTRL_EN			BIT(0)
+#define DISP_REG_TDSHP_CFG			0x0110
+#define DISP_TDSHP_RELAY_MODE			BIT(0)
+#define DISP_REG_TDSHP_INPUT_SIZE		0x0120
+#define DISP_REG_TDSHP_OUTPUT_OFFSET		0x0124
+#define DISP_REG_TDSHP_OUTPUT_SIZE		0x0128
+
 #define DISP_REG_UFO_START			0x0000
 #define UFO_BYPASS				BIT(2)
 
@@ -261,6 +269,37 @@ static void mtk_postmask_stop(struct device *dev)
 	writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
 }
 
+static void mtk_disp_tdshp_config(struct device *dev, unsigned int w,
+				  unsigned int h, unsigned int vrefresh,
+				  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_TDSHP_INPUT_SIZE);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_TDSHP_OUTPUT_SIZE);
+	mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_TDSHP_OUTPUT_OFFSET);
+
+	mtk_ddp_write(cmdq_pkt, DISP_TDSHP_RELAY_MODE, &priv->cmdq_reg,
+		      priv->regs, DISP_REG_TDSHP_CFG);
+}
+
+static void mtk_disp_tdshp_start(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(DISP_TDSHP_CTRL_EN, priv->regs + DISP_REG_TDSHP_CTRL);
+}
+
+static void mtk_disp_tdshp_stop(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(0, priv->regs + DISP_REG_TDSHP_CTRL);
+}
+
 static void mtk_ufoe_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
@@ -268,6 +307,14 @@ static void mtk_ufoe_start(struct device *dev)
 	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
+static const struct mtk_ddp_comp_funcs ddp_tdshp = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
+	.config = mtk_disp_tdshp_config,
+	.start = mtk_disp_tdshp_start,
+	.stop = mtk_disp_tdshp_stop,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_aal = {
 	.clk_enable = mtk_aal_clk_enable,
 	.clk_disable = mtk_aal_clk_disable,
@@ -441,6 +488,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_POSTMASK] = "postmask",
 	[MTK_DISP_PWM] = "pwm",
 	[MTK_DISP_RDMA] = "rdma",
+	[MTK_DISP_TDSHP] = "tdshp",
 	[MTK_DISP_UFOE] = "ufoe",
 	[MTK_DISP_WDMA] = "wdma",
 	[MTK_DP_INTF] = "dp-intf",
@@ -496,6 +544,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,		1, &ddp_rdma },
 	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,		2, &ddp_rdma },
 	[DDP_COMPONENT_RDMA4]		= { MTK_DISP_RDMA,		4, &ddp_rdma },
+	[DDP_COMPONENT_TDSHP0]		= { MTK_DISP_TDSHP,		0, &ddp_tdshp },
 	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,		0, &ddp_ufoe },
 	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,		0, NULL },
 	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,		1, NULL },
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 98a701ac4cde..a03fa3385d2f 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -38,6 +38,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_RDMA,
+	MTK_DISP_TDSHP,
 	MTK_DISP_UFOE,
 	MTK_DISP_WDMA,
 	MTK_DPI,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d5e6bab36414..042cf03c7a54 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -812,6 +812,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8195-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8196-disp-tdshp",
+	  .data = (void *)MTK_DISP_TDSHP },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
-- 
2.46.0

