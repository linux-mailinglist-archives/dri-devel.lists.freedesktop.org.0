Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD5D534DB3
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 13:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B8310E406;
	Thu, 26 May 2022 11:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23F410E3F6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 11:02:44 +0000 (UTC)
X-UUID: aba0638f907441b08af4b302bc6ad444-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:74a478f1-aebd-4d69-975e-c83d877791e8, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:91c39547-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: aba0638f907441b08af4b302bc6ad444-20220526
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 730653239; Thu, 26 May 2022 19:02:40 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 26 May 2022 19:02:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 26 May 2022 19:02:38 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Subject: [PATCH v22 14/24] drm/mediatek: add display merge advance config API
 for MT8195
Date: Thu, 26 May 2022 19:02:23 +0800
Message-ID: <20220526110233.20080-15-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220526110233.20080-1-nancy.lin@mediatek.com>
References: <20220526110233.20080-1-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add merge new advance config API. The original merge API is
mtk_ddp_comp_funcs function prototype. The API interface parameters
cannot be modified, so add a new config API for extension. This is
the preparation for ovl_adaptor merge control.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  3 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 52 ++++++++++++++++++++---
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 2cd1c660ace3..e847e90f436d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -63,6 +63,9 @@ void mtk_merge_config(struct device *dev, unsigned int width,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_merge_start(struct device *dev);
 void mtk_merge_stop(struct device *dev);
+void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int r_w,
+			      unsigned int h, unsigned int vrefresh, unsigned int bpc,
+			      struct cmdq_pkt *cmdq_pkt);
 
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 45face638153..40da0555416d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -17,6 +17,7 @@
 #define DISP_REG_MERGE_CTRL		0x000
 #define MERGE_EN				1
 #define DISP_REG_MERGE_CFG_0		0x010
+#define DISP_REG_MERGE_CFG_1		0x014
 #define DISP_REG_MERGE_CFG_4		0x020
 #define DISP_REG_MERGE_CFG_10		0x038
 /* no swap */
@@ -25,9 +26,12 @@
 #define DISP_REG_MERGE_CFG_12		0x040
 #define CFG_10_10_1PI_2PO_BUF_MODE		6
 #define CFG_10_10_2PI_2PO_BUF_MODE		8
+#define CFG_11_10_1PI_2PO_MERGE			18
 #define FLD_CFG_MERGE_MODE			GENMASK(4, 0)
 #define DISP_REG_MERGE_CFG_24		0x070
 #define DISP_REG_MERGE_CFG_25		0x074
+#define DISP_REG_MERGE_CFG_26		0x078
+#define DISP_REG_MERGE_CFG_27		0x07c
 #define DISP_REG_MERGE_CFG_36		0x0a0
 #define ULTRA_EN				BIT(0)
 #define PREULTRA_EN				BIT(4)
@@ -98,12 +102,19 @@ static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
 void mtk_merge_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	mtk_merge_advance_config(dev, w, 0, h, vrefresh, bpc, cmdq_pkt);
+}
+
+void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int r_w,
+			      unsigned int h, unsigned int vrefresh, unsigned int bpc,
+			      struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 	unsigned int mode = CFG_10_10_1PI_2PO_BUF_MODE;
 
-	if (!h || !w) {
-		dev_err(dev, "%s: input width(%d) or height(%d) is invalid\n", __func__, w, h);
+	if (!h || !l_w) {
+		dev_err(dev, "%s: input width(%d) or height(%d) is invalid\n", __func__, l_w, h);
 		return;
 	}
 
@@ -112,14 +123,41 @@ void mtk_merge_config(struct device *dev, unsigned int w,
 		mode = CFG_10_10_2PI_2PO_BUF_MODE;
 	}
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+	if (r_w)
+		mode = CFG_11_10_1PI_2PO_MERGE;
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CFG_0);
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+	mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_1);
+	mtk_ddp_write(cmdq_pkt, h << 16 | (l_w + r_w), &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CFG_4);
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+	/*
+	 * DISP_REG_MERGE_CFG_24 is merge SRAM0 w/h
+	 * DISP_REG_MERGE_CFG_25 is merge SRAM1 w/h.
+	 * If r_w > 0, the merge is in merge mode (input0 and input1 merge together),
+	 * the input0 goes to SRAM0, and input1 goes to SRAM1.
+	 * If r_w = 0, the merge is in buffer mode, the input goes through SRAM0 and
+	 * then to SRAM1. Both SRAM0 and SRAM1 are set to the same size.
+	 */
+	mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CFG_24);
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
-		      DISP_REG_MERGE_CFG_25);
+	if (r_w)
+		mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_CFG_25);
+	else
+		mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_CFG_25);
+
+	/*
+	 * DISP_REG_MERGE_CFG_26 and DISP_REG_MERGE_CFG_27 is only used in LR merge.
+	 * Only take effect when the merge is setting to merge mode.
+	 */
+	mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_26);
+	mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_27);
+
 	mtk_ddp_write_mask(cmdq_pkt, SWAP_MODE, &priv->cmdq_reg, priv->regs,
 			   DISP_REG_MERGE_CFG_10, FLD_SWAP_MODE);
 	mtk_ddp_write_mask(cmdq_pkt, mode, &priv->cmdq_reg, priv->regs,
-- 
2.18.0

