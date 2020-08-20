Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E3224C158
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94EE6E961;
	Thu, 20 Aug 2020 15:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC87F6E961
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:09:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 370C8143B;
 Thu, 20 Aug 2020 08:09:28 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 863493F6CF;
 Thu, 20 Aug 2020 08:09:24 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	joro@8bytes.org,
	linux@armlinux.org.uk
Subject: [PATCH 09/18] iommu/mediatek-v1: Add IOMMU_DOMAIN_DMA support
Date: Thu, 20 Aug 2020 16:08:28 +0100
Message-Id: <a259b248ffb14273b56f8473c20b0381e8d74c7a.1597931876.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that arch/arm is wired up for default domains and iommu-dma,
implement the corresponding driver-side support for groups and DMA
domains to replace the shared mapping workaround.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/mtk_iommu.h    |   2 -
 drivers/iommu/mtk_iommu_v1.c | 153 +++++++++++------------------------
 2 files changed, 48 insertions(+), 107 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 122925dbe547..6253e98d810c 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -67,8 +67,6 @@ struct mtk_iommu_data {
 	struct iommu_device		iommu;
 	const struct mtk_iommu_plat_data *plat_data;
 
-	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
-
 	struct list_head		list;
 	struct mtk_smi_larb_iommu	larb_imu[MTK_LARB_NR_MAX];
 };
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 82ddfe9170d4..40c89b8d3ac4 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -28,7 +28,6 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <asm/barrier.h>
-#include <asm/dma-iommu.h>
 #include <linux/init.h>
 #include <dt-bindings/memory/mt2701-larb-port.h>
 #include <soc/mediatek/smi.h>
@@ -240,13 +239,18 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 {
 	struct mtk_iommu_domain *dom;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
 
+	if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&dom->domain)) {
+		kfree(dom);
+		return NULL;
+	}
+
 	return &dom->domain;
 }
 
@@ -257,6 +261,7 @@ static void mtk_iommu_domain_free(struct iommu_domain *domain)
 
 	dma_free_coherent(data->dev, M2701_IOMMU_PGT_SIZE,
 			dom->pgt_va, dom->pgt_pa);
+	iommu_put_dma_cookie(domain);
 	kfree(to_mtk_domain(domain));
 }
 
@@ -265,14 +270,8 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 {
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
-	struct dma_iommu_mapping *mtk_mapping;
 	int ret;
 
-	/* Only allow the domain created internally. */
-	mtk_mapping = data->mapping;
-	if (mtk_mapping->domain != domain)
-		return 0;
-
 	if (!data->m4u_dom) {
 		data->m4u_dom = dom;
 		ret = mtk_iommu_domain_finalise(data);
@@ -358,18 +357,39 @@ static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
 
 static const struct iommu_ops mtk_iommu_ops;
 
-/*
- * MTK generation one iommu HW only support one iommu domain, and all the client
- * sharing the same iova address space.
- */
-static int mtk_iommu_create_mapping(struct device *dev,
-				    struct of_phandle_args *args)
+static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct mtk_iommu_data *data;
+
+	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
+		return ERR_PTR(-ENODEV); /* Not a iommu client device */
+
+	data = dev_iommu_priv_get(dev);
+
+	return &data->iommu;
+}
+
+static void mtk_iommu_release_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
+		return;
+
+	iommu_fwspec_free(dev);
+}
+
+static struct iommu_group *mtk_iommu_device_group(struct device *dev)
+{
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
+
+	return iommu_group_ref_get(data->m4u_group);
+}
+
+static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
+{
 	struct platform_device *m4updev;
-	struct dma_iommu_mapping *mtk_mapping;
-	int ret;
 
 	if (args->args_count != 1) {
 		dev_err(dev, "invalid #iommu-cells(%d) property for IOMMU\n",
@@ -377,15 +397,6 @@ static int mtk_iommu_create_mapping(struct device *dev,
 		return -EINVAL;
 	}
 
-	if (!fwspec) {
-		ret = iommu_fwspec_init(dev, &args->np->fwnode, &mtk_iommu_ops);
-		if (ret)
-			return ret;
-		fwspec = dev_iommu_fwspec_get(dev);
-	} else if (dev_iommu_fwspec_get(dev)->ops != &mtk_iommu_ops) {
-		return -EINVAL;
-	}
-
 	if (!dev_iommu_priv_get(dev)) {
 		/* Get the m4u device */
 		m4updev = of_find_device_by_node(args->np);
@@ -395,83 +406,7 @@ static int mtk_iommu_create_mapping(struct device *dev,
 		dev_iommu_priv_set(dev, platform_get_drvdata(m4updev));
 	}
 
-	ret = iommu_fwspec_add_ids(dev, args->args, 1);
-	if (ret)
-		return ret;
-
-	data = dev_iommu_priv_get(dev);
-	mtk_mapping = data->mapping;
-	if (!mtk_mapping) {
-		/* MTK iommu support 4GB iova address space. */
-		mtk_mapping = arm_iommu_create_mapping(&platform_bus_type,
-						0, 1ULL << 32);
-		if (IS_ERR(mtk_mapping))
-			return PTR_ERR(mtk_mapping);
-
-		data->mapping = mtk_mapping;
-	}
-
-	return 0;
-}
-
-static int mtk_iommu_def_domain_type(struct device *dev)
-{
-	return IOMMU_DOMAIN_UNMANAGED;
-}
-
-static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
-{
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct of_phandle_args iommu_spec;
-	struct of_phandle_iterator it;
-	struct mtk_iommu_data *data;
-	int err;
-
-	of_for_each_phandle(&it, err, dev->of_node, "iommus",
-			"#iommu-cells", -1) {
-		int count = of_phandle_iterator_args(&it, iommu_spec.args,
-					MAX_PHANDLE_ARGS);
-		iommu_spec.np = of_node_get(it.node);
-		iommu_spec.args_count = count;
-
-		mtk_iommu_create_mapping(dev, &iommu_spec);
-
-		/* dev->iommu_fwspec might have changed */
-		fwspec = dev_iommu_fwspec_get(dev);
-
-		of_node_put(iommu_spec.np);
-	}
-
-	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
-		return ERR_PTR(-ENODEV); /* Not a iommu client device */
-
-	data = dev_iommu_priv_get(dev);
-
-	return &data->iommu;
-}
-
-static void mtk_iommu_probe_finalize(struct device *dev)
-{
-	struct dma_iommu_mapping *mtk_mapping;
-	struct mtk_iommu_data *data;
-	int err;
-
-	data        = dev_iommu_priv_get(dev);
-	mtk_mapping = data->mapping;
-
-	err = arm_iommu_attach_device(dev, mtk_mapping);
-	if (err)
-		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
-}
-
-static void mtk_iommu_release_device(struct device *dev)
-{
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-
-	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
-		return;
-
-	iommu_fwspec_free(dev);
+	return iommu_fwspec_add_ids(dev, args->args, 1);
 }
 
 static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
@@ -524,10 +459,9 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.unmap		= mtk_iommu_unmap,
 	.iova_to_phys	= mtk_iommu_iova_to_phys,
 	.probe_device	= mtk_iommu_probe_device,
-	.probe_finalize = mtk_iommu_probe_finalize,
 	.release_device	= mtk_iommu_release_device,
-	.def_domain_type = mtk_iommu_def_domain_type,
-	.device_group	= generic_device_group,
+	.device_group	= mtk_iommu_device_group,
+	.of_xlate	= mtk_iommu_of_xlate,
 	.pgsize_bitmap	= ~0UL << MT2701_IOMMU_PAGE_SHIFT,
 };
 
@@ -626,6 +560,14 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/*
+	 * MTK generation one iommu HW only support one iommu domain,
+	 * and all the client sharing the same iova address space.
+	 */
+	data->m4u_group = iommu_group_alloc();
+	if (IS_ERR(data->m4u_group))
+		return PTR_ERR(data->m4u_group);
+
 	if (!iommu_present(&platform_bus_type))
 		bus_set_iommu(&platform_bus_type,  &mtk_iommu_ops);
 
@@ -636,6 +578,7 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 {
 	struct mtk_iommu_data *data = platform_get_drvdata(pdev);
 
+	iommu_group_put(data->m4u_group);
 	iommu_device_sysfs_remove(&data->iommu);
 	iommu_device_unregister(&data->iommu);
 
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
