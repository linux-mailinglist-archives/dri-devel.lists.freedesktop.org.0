Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7CF15CBE5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 21:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E846F649;
	Thu, 13 Feb 2020 20:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7D16F649
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 20:20:23 +0000 (UTC)
Received: from ziggy.cz (unknown [37.223.145.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E8CE246A8;
 Thu, 13 Feb 2020 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581625223;
 bh=hxRcJYoy8SGbzWSvYwP+lrF+K6o+1MahUvwuVRaYRqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a4trjl1Gky0Ho9pYcEyMwDgUhAyP3F3t8E3mQ10yWETa5J02xvVkyYgqLEQd4dFl5
 3mCt93P8GAbBRvvs4rrENEJ0VfouAWNSpAoD5tuA9NEwZ0UcI2hJrEG75q75IqB2Cq
 UaJHShPe+jwBpOT2nxIDuFDRnPLrV3SopY2ie73k=
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v7 04/13] drm/mediatek: Use regmap for register access
Date: Thu, 13 Feb 2020 21:19:44 +0100
Message-Id: <20200213201953.15268-5-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213201953.15268-1-matthias.bgg@kernel.org>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 rdunlap@infradead.org, matthias.bgg@kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthias Brugger <mbrugger@suse.com>

The mmsys memory space is shared between the drm and the
clk driver. Use regmap to access it.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: CK Hu <ck.hu@mediatek.com>

---

Changes in v7:
- add R-by from CK

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 50 +++++++++++--------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 13 ++-----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  2 +-
 5 files changed, 30 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0dfcd1787e65..ea003a225604 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -28,7 +28,7 @@
  * @enabled: records whether crtc_enable succeeded
  * @planes: array of 4 drm_plane structures, one for each overlay plane
  * @pending_planes: whether any plane has pending changes to be applied
- * @config_regs: memory mapped mmsys configuration register space
+ * @config_regs: regmap mapped mmsys configuration register space
  * @mutex: handle to one of the ten disp_mutex streams
  * @ddp_comp_nr: number of components in ddp_comp
  * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
@@ -50,7 +50,7 @@ struct mtk_drm_crtc {
 	u32				cmdq_event;
 #endif
 
-	void __iomem			*config_regs;
+	struct regmap			*config_regs;
 	struct mtk_disp_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 13035c906035..302753744cc6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -383,61 +383,53 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
 	return value;
 }
 
-static void mtk_ddp_sout_sel(void __iomem *config_regs,
+static void mtk_ddp_sout_sel(struct regmap *config_regs,
 			     enum mtk_ddp_comp_id cur,
 			     enum mtk_ddp_comp_id next)
 {
 	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
-		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
+		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
+				BLS_TO_DSI_RDMA1_TO_DPI1);
 	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
-		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
-		writel_relaxed(DSI_SEL_IN_RDMA,
-			       config_regs + DISP_REG_CONFIG_DSI_SEL);
-		writel_relaxed(DPI_SEL_IN_BLS,
-			       config_regs + DISP_REG_CONFIG_DPI_SEL);
+		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
+				BLS_TO_DPI_RDMA1_TO_DSI);
+		regmap_write(config_regs, DISP_REG_CONFIG_DSI_SEL,
+				DSI_SEL_IN_RDMA);
+		regmap_write(config_regs, DISP_REG_CONFIG_DPI_SEL,
+				DPI_SEL_IN_BLS);
 	}
 }
 
-void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
+void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next)
 {
-	unsigned int addr, value, reg;
+	unsigned int addr, value;
 
 	value = mtk_ddp_mout_en(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) | value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, value);
 
 	mtk_ddp_sout_sel(config_regs, cur, next);
 
 	value = mtk_ddp_sel_in(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) | value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, value);
 }
 
-void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
+void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
 				   enum mtk_ddp_comp_id cur,
 				   enum mtk_ddp_comp_id next)
 {
-	unsigned int addr, value, reg;
+	unsigned int addr, value;
 
 	value = mtk_ddp_mout_en(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) & ~value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, 0);
 
 	value = mtk_ddp_sel_in(cur, next, &addr);
-	if (value) {
-		reg = readl_relaxed(config_regs + addr) & ~value;
-		writel_relaxed(reg, config_regs + addr);
-	}
+	if (value)
+		regmap_update_bits(config_regs, addr, value, 0);
 }
 
 struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
index 827be424a148..01ff8b68881f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
@@ -12,10 +12,10 @@ struct regmap;
 struct device;
 struct mtk_disp_mutex;
 
-void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
+void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next);
-void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
+void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
 				   enum mtk_ddp_comp_id cur,
 				   enum mtk_ddp_comp_id next);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0563c6813333..b68837ea02b3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -6,6 +6,7 @@
 
 #include <linux/component.h>
 #include <linux/iommu.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -425,7 +426,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_drm_private *private;
-	struct resource *mem;
 	struct device_node *node;
 	struct component_match *match = NULL;
 	int ret;
@@ -437,14 +437,9 @@ static int mtk_drm_probe(struct platform_device *pdev)
 
 	private->data = of_device_get_match_data(dev);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	private->config_regs = devm_ioremap_resource(dev, mem);
-	if (IS_ERR(private->config_regs)) {
-		ret = PTR_ERR(private->config_regs);
-		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
-			ret);
-		return ret;
-	}
+	private->config_regs = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(private->config_regs))
+		return PTR_ERR(private->config_regs);
 
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(dev->of_node->parent, node) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 17bc99b9f5d4..03201080688d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -39,7 +39,7 @@ struct mtk_drm_private {
 
 	struct device_node *mutex_node;
 	struct device *mutex_dev;
-	void __iomem *config_regs;
+	struct regmap *config_regs;
 	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
 	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
 	const struct mtk_mmsys_driver_data *data;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
