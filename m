Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6144D2A37DE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 01:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4712C6E5D4;
	Tue,  3 Nov 2020 00:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AE96E5D2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 00:35:00 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DD8B22275;
 Tue,  3 Nov 2020 00:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363700;
 bh=/Ao7zf4Hcpjq2qXkkmGDzloEK4JLhVkJD/xywTY+naw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fHJaoKdvK4wwwRrgyfF5scVxeegaomJ7PD7d4brPzO7/bTJyjJybcSO/VfL1Kj44P
 lcl/MzyiyrtH2x8KDNcZrT5QLD8VKfUg4NpOo8ZVIOwBZ3ShMqWksZDihcgIwYom1q
 J1oRa2R6gODq8c+oIDy3jmVz9QSAOgOeCL/7o3WY=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 09/11] drm/mediatek: Register vblank callback function
Date: Tue,  3 Nov 2020 08:34:20 +0800
Message-Id: <20201103003422.17838-10-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103003422.17838-1-chunkuang.hu@kernel.org>
References: <20201103003422.17838-1-chunkuang.hu@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CK Hu <ck.hu@mediatek.com>

Some ddp component exist in both display path and other path, so
sub driver should not directly call crtc function. crtc register
callback function to sub driver to prevent sub driver directly
call crtc function.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 16 +++--
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 17 +++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 67 +++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 ++-
 5 files changed, 60 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index ab56054b0934..e07611edf5f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -75,30 +75,33 @@ struct mtk_disp_ovl {
 	void __iomem			*regs;
 	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_ovl_data	*data;
+	void				(*vblank_cb)(void *data);
+	void				*vblank_cb_data;
 };
 
 static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_ovl *priv = dev_id;
-	struct mtk_ddp_comp *ovl = &priv->ddp_comp;
 
 	/* Clear frame completion interrupt */
 	writel(0x0, priv->regs + DISP_REG_OVL_INTSTA);
 
-	if (!priv->crtc)
+	if (!priv->vblank_cb)
 		return IRQ_NONE;
 
-	mtk_crtc_ddp_irq(priv->crtc, ovl);
+	priv->vblank_cb(priv->vblank_cb_data);
 
 	return IRQ_HANDLED;
 }
 
 static void mtk_ovl_enable_vblank(struct device *dev,
-				  struct drm_crtc *crtc)
+				  void (*vblank_cb)(void *),
+				  void *vblank_cb_data)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
-	ovl->crtc = crtc;
+	ovl->vblank_cb = vblank_cb;
+	ovl->vblank_cb_data = vblank_cb_data;
 	writel(0x0, ovl->regs + DISP_REG_OVL_INTSTA);
 	writel_relaxed(OVL_FME_CPL_INT, ovl->regs + DISP_REG_OVL_INTEN);
 }
@@ -107,7 +110,8 @@ static void mtk_ovl_disable_vblank(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
-	ovl->crtc = NULL;
+	ovl->vblank_cb = NULL;
+	ovl->vblank_cb_data = NULL;
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 1976769ae4e3..edffe25f14b4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -61,25 +61,25 @@ struct mtk_disp_rdma_data {
  */
 struct mtk_disp_rdma {
 	struct mtk_ddp_comp		ddp_comp;
-	struct drm_crtc			*crtc;
 	struct clk			*clk;
 	void __iomem			*regs;
 	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_rdma_data	*data;
+	void				(*vblank_cb)(void *data);
+	void				*vblank_cb_data;
 };
 
 static irqreturn_t mtk_disp_rdma_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_rdma *priv = dev_id;
-	struct mtk_ddp_comp *rdma = &priv->ddp_comp;
 
 	/* Clear frame completion interrupt */
 	writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
 
-	if (!priv->crtc)
+	if (!priv->vblank_cb)
 		return IRQ_NONE;
 
-	mtk_crtc_ddp_irq(priv->crtc, rdma);
+	priv->vblank_cb(priv->vblank_cb_data);
 
 	return IRQ_HANDLED;
 }
@@ -95,11 +95,13 @@ static void rdma_update_bits(struct device *dev, unsigned int reg,
 }
 
 static void mtk_rdma_enable_vblank(struct device *dev,
-				   struct drm_crtc *crtc)
+				   void (*vblank_cb)(void *),
+				   void *vblank_cb_data)
 {
 	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 
-	rdma->crtc = crtc;
+	rdma->vblank_cb = vblank_cb;
+	rdma->vblank_cb_data = vblank_cb_data;
 	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT,
 			 RDMA_FRAME_END_INT);
 }
@@ -108,7 +110,8 @@ static void mtk_rdma_disable_vblank(struct device *dev)
 {
 	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
 
-	rdma->crtc = NULL;
+	rdma->vblank_cb = NULL;
+	rdma->vblank_cb_data = NULL;
 	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT, 0);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index f1dd5943ba0c..01c35786be49 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -166,24 +166,6 @@ static void mtk_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	state->pending_config = true;
 }
 
-static int mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
-{
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-
-	mtk_ddp_comp_enable_vblank(comp, &mtk_crtc->base);
-
-	return 0;
-}
-
-static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
-{
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-
-	mtk_ddp_comp_disable_vblank(comp);
-}
-
 static int mtk_crtc_ddp_clk_enable(struct mtk_drm_crtc *mtk_crtc)
 {
 	int ret;
@@ -490,6 +472,40 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
 	mutex_unlock(&mtk_crtc->hw_lock);
 }
 
+static void mtk_crtc_ddp_irq(void *data)
+{
+	struct drm_crtc *crtc = data;
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_drm_private *priv = crtc->dev->dev_private;
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
+#else
+	if (!priv->data->shadow_register)
+#endif
+		mtk_crtc_ddp_config(crtc, NULL);
+
+	mtk_drm_finish_page_flip(mtk_crtc);
+}
+
+static int mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+
+	mtk_ddp_comp_enable_vblank(comp, mtk_crtc_ddp_irq, &mtk_crtc->base);
+
+	return 0;
+}
+
+static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+
+	mtk_ddp_comp_disable_vblank(comp);
+}
+
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state)
 {
@@ -657,21 +673,6 @@ static int mtk_drm_crtc_init(struct drm_device *drm,
 	return ret;
 }
 
-void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
-{
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_drm_private *priv = crtc->dev->dev_private;
-
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
-#else
-	if (!priv->data->shadow_register)
-#endif
-		mtk_crtc_ddp_config(crtc, NULL);
-
-	mtk_drm_finish_page_flip(mtk_crtc);
-}
-
 static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
 					int comp_idx)
 {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index a2b4677a451c..45cfd0a032de 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -15,7 +15,6 @@
 #define MTK_MIN_BPC	3
 
 void mtk_drm_crtc_commit(struct drm_crtc *crtc);
-void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const enum mtk_ddp_comp_id *path,
 			unsigned int path_len);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index ce598122bb78..56fbd5d2f650 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -79,7 +79,9 @@ struct mtk_ddp_comp_funcs {
 		       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 	void (*start)(struct device *dev);
 	void (*stop)(struct device *dev);
-	void (*enable_vblank)(struct device *dev, struct drm_crtc *crtc);
+	void (*enable_vblank)(struct device *dev,
+			      void (*vblank_cb)(void *),
+			      void *vblank_cb_data);
 	void (*disable_vblank)(struct device *dev);
 	unsigned int (*supported_rotations)(struct device *dev);
 	unsigned int (*layer_nr)(struct device *dev);
@@ -141,10 +143,11 @@ static inline void mtk_ddp_comp_stop(struct mtk_ddp_comp *comp)
 }
 
 static inline void mtk_ddp_comp_enable_vblank(struct mtk_ddp_comp *comp,
-					      struct drm_crtc *crtc)
+					      void (*vblank_cb)(void *),
+					      void *vblank_cb_data)
 {
 	if (comp->funcs && comp->funcs->enable_vblank)
-		comp->funcs->enable_vblank(comp->dev, crtc);
+		comp->funcs->enable_vblank(comp->dev, vblank_cb, vblank_cb_data);
 }
 
 static inline void mtk_ddp_comp_disable_vblank(struct mtk_ddp_comp *comp)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
