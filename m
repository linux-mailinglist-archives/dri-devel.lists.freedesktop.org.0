Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91B43CC22E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 11:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870E36EA2D;
	Sat, 17 Jul 2021 09:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4537A6EA1D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 09:04:39 +0000 (UTC)
X-UUID: 81120d513ed24969a358bdf2dddae672-20210717
X-UUID: 81120d513ed24969a358bdf2dddae672-20210717
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1975629189; Sat, 17 Jul 2021 17:04:37 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:30 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v1 08/10] drm/mediatek: add merge vblank support for MT8195
Date: Sat, 17 Jul 2021 17:04:06 +0800
Message-ID: <20210717090408.28283-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 17 Jul 2021 09:35:00 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add merge vblank support.
The vdosys1 go through the following component:
pseudo_ovl -> ethdr -> merge5 -> dp_intf1
The first comp is pseudo_ovl. This comp doesn't
have the whole CRTC timing vblank but only has vblank for each layer.
Merge5 comp gets all the mixed layers after the ETHDR module.
Use merge5 comp as the vblank source.
Change the mtk_drm_crtc_enable_vblank function: iterate over the path
comp from start to the end and find the first comp registered with vblank
function as the vblank source.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 56 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 19 +++++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 14 ++++--
 5 files changed, 86 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index f5d35007b84d..7f99ba525556 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -61,6 +61,10 @@ void mtk_merge_config(struct device *dev, unsigned int width,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_merge_start(struct device *dev);
 void mtk_merge_stop(struct device *dev);
+void mtk_merge_enable_vblank(struct device *dev,
+			     void (*vblank_cb)(void *),
+			     void *vblank_cb_data);
+void mtk_merge_disable_vblank(struct device *dev);
 
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 768c282d2d63..6231087067e2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -76,6 +76,8 @@
 	REG_FLD_VAL(DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW, val)
 #define DISP_MERGE_CFG_41_VAL_PREULTRA_TH_HIGH(val) \
 	REG_FLD_VAL(DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH, val)
+#define DISP_MERGE_CFG2_0	0x160
+#define DISP_MERGE_CFG2_2	0x168
 
 struct mtk_merge_config_struct {
 	unsigned short width_right;
@@ -92,6 +94,9 @@ struct mtk_disp_merge {
 	void __iomem *regs;
 	struct cmdq_client_reg		cmdq_reg;
 	u32				fifo_en;
+	int irq;
+	void (*vblank_cb)(void *data);
+	void *vblank_cb_data;
 };
 
 void mtk_merge_start(struct device *dev)
@@ -272,6 +277,44 @@ void mtk_merge_clk_disable(struct device *dev)
 		clk_disable_unprepare(priv->clk);
 }
 
+void mtk_merge_enable_vblank(struct device *dev,
+			     void (*vblank_cb)(void *),
+			     void *vblank_cb_data)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+	int irq_frame_done_en = BIT(16);
+
+	priv->vblank_cb = vblank_cb;
+	priv->vblank_cb_data = vblank_cb_data;
+
+	writel(irq_frame_done_en, priv->regs + DISP_MERGE_CFG2_0);
+}
+
+void mtk_merge_disable_vblank(struct device *dev)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	priv->vblank_cb = NULL;
+	priv->vblank_cb_data = NULL;
+
+	writel(0x0, priv->regs + DISP_MERGE_CFG2_0);
+}
+
+static irqreturn_t mtk_disp_merge_irq_handler(int irq, void *dev_id)
+{
+	struct mtk_disp_merge *priv = dev_id;
+
+	writel(0x1, priv->regs + DISP_MERGE_CFG2_2);
+	writel(0x0, priv->regs + DISP_MERGE_CFG2_2);
+
+	if (!priv->vblank_cb)
+		return IRQ_NONE;
+
+	priv->vblank_cb(priv->vblank_cb_data);
+
+	return IRQ_HANDLED;
+}
+
 static int mtk_disp_merge_bind(struct device *dev, struct device *master,
 			       void *data)
 {
@@ -337,6 +380,19 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 	priv->fifo_en = of_property_read_bool(dev->of_node,
 		"mediatek,merge-fifo-en");
 
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		priv->irq = 0;
+
+	if (priv->irq) {
+		ret = devm_request_irq(dev, priv->irq, mtk_disp_merge_irq_handler,
+				       IRQF_TRIGGER_NONE, dev_name(dev), priv);
+		if (ret < 0) {
+			dev_err(dev, "Failed to request irq %d: %d\n", priv->irq, ret);
+			return ret;
+		}
+	}
+
 	platform_set_drvdata(pdev, priv);
 
 	ret = component_add(dev, &mtk_disp_merge_component_ops);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 40df2c823187..f3addc200c97 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -501,19 +501,28 @@ static void mtk_crtc_ddp_irq(void *data)
 static int mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-
-	mtk_ddp_comp_enable_vblank(comp, mtk_crtc_ddp_irq, &mtk_crtc->base);
+	struct mtk_ddp_comp *comp;
+	int i;
 
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		comp = mtk_crtc->ddp_comp[i];
+		if (mtk_ddp_comp_enable_vblank(comp, mtk_crtc_ddp_irq, &mtk_crtc->base))
+			break;
+	}
 	return 0;
 }
 
 static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp;
+	int i;
 
-	mtk_ddp_comp_disable_vblank(comp);
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		comp = mtk_crtc->ddp_comp[i];
+		if (mtk_ddp_comp_disable_vblank(comp))
+			break;
+	}
 }
 
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 64cbb9e1cc83..5ecb16c2a8ad 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -347,6 +347,8 @@ static const struct mtk_ddp_comp_funcs ddp_merge = {
 	.start = mtk_merge_start,
 	.stop = mtk_merge_stop,
 	.config = mtk_merge_config,
+	.enable_vblank = mtk_merge_enable_vblank,
+	.disable_vblank = mtk_merge_disable_vblank,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ufoe = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index ec84dc258124..b2f01c93a268 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -114,18 +114,24 @@ static inline void mtk_ddp_comp_stop(struct mtk_ddp_comp *comp)
 		comp->funcs->stop(comp->dev);
 }
 
-static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
+static inline bool mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
 					      void (*vblank_cb)(void *),
 					      void *vblank_cb_data)
 {
-	if (comp->funcs && comp->funcs->enable_vblank)
+	if (comp->funcs && comp->funcs->enable_vblank) {
 		comp->funcs->enable_vblank(comp->dev, vblank_cb, vblank_cb_data);
+		return true;
+	}
+	return false;
 }
 
-static inline void mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp *comp)
+static inline bool mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp *comp)
 {
-	if (comp->funcs && comp->funcs->disable_vblank)
+	if (comp->funcs && comp->funcs->disable_vblank) {
 		comp->funcs->disable_vblank(comp->dev);
+		return true;
+	}
+	return false;
 }
 
 static inline
-- 
2.18.0

