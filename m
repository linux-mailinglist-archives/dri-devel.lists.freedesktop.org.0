Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B830C43F836
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 09:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520E76EA14;
	Fri, 29 Oct 2021 07:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003EB6EA01
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 07:52:11 +0000 (UTC)
X-UUID: 0eabe89d0e914ba49666f8fff4bd8d47-20211029
X-UUID: 0eabe89d0e914ba49666f8fff4bd8d47-20211029
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 516414778; Fri, 29 Oct 2021 15:52:08 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 29 Oct 2021 15:52:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Oct 2021 15:52:06 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v7 13/20] drm/mediatek: add display merge advance config API
 for MT8195
Date: Fri, 29 Oct 2021 15:51:56 +0800
Message-ID: <20211029075203.17093-14-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211029075203.17093-1-nancy.lin@mediatek.com>
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
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

Add merge new advance config API. The original merge API is
mtk_ddp_comp_funcs function prototype. The API interface parameters
cannot be modified, so add a new config API for extension. This is
the preparation for ovl_adaptor merge control.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  3 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 52 ++++++++++++++++++++---
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index b3a372cab0bd..c2de53a5892e 100644
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
index 470ebc4b5296..558e0cb2a297 100644
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

