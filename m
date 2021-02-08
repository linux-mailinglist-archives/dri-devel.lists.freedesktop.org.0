Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7544A3139C2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 17:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF766E94E;
	Mon,  8 Feb 2021 16:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F286E942
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F1rC5T4ZapwS/nZNabUxiFFNVft1bYY7SlMPjy6IXuo=; b=DS/mhD79INrZwg8e4YrAjaoGrY
 OLcGQqAca31ghk4QNjCMcVtGKSrmtxWS54lbpCoWjGcRQ1vskvtvuYhBZ9R2IYXLiPy8aESnGYKp7
 jGUgU5jOEatKby0SfdgdnAipPvwSMtkThxlYqRaQ9hj1btn26XgDB80U85N+ooNPGNvSIdxfo0rq/
 4/77RjmOgwCRILBPW8GYvhfRb2pk5R/7pdOBx3n4WOe5rS5ZZgnwk7FlYMtPbMy+f83CnmKQEGgKz
 i1Hno+TqAArrtDNvZcGx2/U+egMHWZhuBqAsVM1Wm23dsxQd13DPmmESgHjRXAOAZKWIci75XdM0D
 +p0C+6xg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1l99as-0000Cr-JC; Mon, 08 Feb 2021 18:40:58 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, frowand.list@gmail.com,
 robin.murphy@arm.com
Subject: [RFC PATCH 1/8] of/device: Allow specifying a custom iommu_spec to
 of_dma_configure
Date: Mon,  8 Feb 2021 18:38:41 +0200
Message-Id: <20210208163848.2504291-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208163848.2504291-1-mperttunen@nvidia.com>
References: <20210208163848.2504291-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To allow for more customized device tree bindings that point to IOMMUs,
allow manual specification of iommu_spec to of_dma_configure.

The initial use case for this is with Host1x, where the driver manages
a set of device tree-defined IOMMU contexts that are dynamically
allocated to various users. These contexts don't correspond to
platform devices and are instead attached to dummy devices on a custom
software bus.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/iommu/of_iommu.c  | 12 ++++++++----
 drivers/of/device.c       |  9 +++++----
 include/linux/of_device.h | 34 +++++++++++++++++++++++++++-------
 include/linux/of_iommu.h  |  6 ++++--
 4 files changed, 44 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index e505b9130a1c..3fefa6c63863 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -87,8 +87,7 @@ int of_get_dma_window(struct device_node *dn, const char *prefix, int index,
 }
 EXPORT_SYMBOL_GPL(of_get_dma_window);
 
-static int of_iommu_xlate(struct device *dev,
-			  struct of_phandle_args *iommu_spec)
+int of_iommu_xlate(struct device *dev, struct of_phandle_args *iommu_spec)
 {
 	const struct iommu_ops *ops;
 	struct fwnode_handle *fwnode = &iommu_spec->np->fwnode;
@@ -117,6 +116,7 @@ static int of_iommu_xlate(struct device *dev,
 	module_put(ops->owner);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(of_iommu_xlate);
 
 static int of_iommu_configure_dev_id(struct device_node *master_np,
 				     struct device *dev,
@@ -177,7 +177,8 @@ static int of_iommu_configure_device(struct device_node *master_np,
 
 const struct iommu_ops *of_iommu_configure(struct device *dev,
 					   struct device_node *master_np,
-					   const u32 *id)
+					   const u32 *id,
+					   struct of_phandle_args *iommu_spec)
 {
 	const struct iommu_ops *ops = NULL;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -209,7 +210,10 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 		err = pci_for_each_dma_alias(to_pci_dev(dev),
 					     of_pci_iommu_init, &info);
 	} else {
-		err = of_iommu_configure_device(master_np, dev, id);
+		if (iommu_spec)
+			err = of_iommu_xlate(dev, iommu_spec);
+		else
+			err = of_iommu_configure_device(master_np, dev, id);
 
 		fwspec = dev_iommu_fwspec_get(dev);
 		if (!err && fwspec)
diff --git a/drivers/of/device.c b/drivers/of/device.c
index aedfaaafd3e7..84ada2110c5b 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -88,8 +88,9 @@ int of_device_add(struct platform_device *ofdev)
  * can use a platform bus notifier and handle BUS_NOTIFY_ADD_DEVICE events
  * to fix up DMA configuration.
  */
-int of_dma_configure_id(struct device *dev, struct device_node *np,
-			bool force_dma, const u32 *id)
+int __of_dma_configure(struct device *dev, struct device_node *np,
+			bool force_dma, const u32 *id,
+			struct of_phandle_args *iommu_spec)
 {
 	const struct iommu_ops *iommu;
 	const struct bus_dma_region *map = NULL;
@@ -170,7 +171,7 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 	dev_dbg(dev, "device is%sdma coherent\n",
 		coherent ? " " : " not ");
 
-	iommu = of_iommu_configure(dev, np, id);
+	iommu = of_iommu_configure(dev, np, id, iommu_spec);
 	if (PTR_ERR(iommu) == -EPROBE_DEFER) {
 		kfree(map);
 		return -EPROBE_DEFER;
@@ -184,7 +185,7 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 	dev->dma_range_map = map;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(of_dma_configure_id);
+EXPORT_SYMBOL_GPL(__of_dma_configure);
 
 int of_device_register(struct platform_device *pdev)
 {
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 07ca187fc5e4..40cc3e788cb9 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -55,14 +55,27 @@ static inline struct device_node *of_cpu_device_node_get(int cpu)
 	return of_node_get(cpu_dev->of_node);
 }
 
-int of_dma_configure_id(struct device *dev,
+int __of_dma_configure(struct device *dev,
 		     struct device_node *np,
-		     bool force_dma, const u32 *id);
+		     bool force_dma, const u32 *id,
+		     struct of_phandle_args *iommu_spec);
 static inline int of_dma_configure(struct device *dev,
 				   struct device_node *np,
 				   bool force_dma)
 {
-	return of_dma_configure_id(dev, np, force_dma, NULL);
+	return __of_dma_configure(dev, np, force_dma, NULL, NULL);
+}
+static inline int of_dma_configure_id(struct device *dev,
+				      struct device_node *np,
+				      bool force_dma, const u32 *id)
+{
+	return __of_dma_configure(dev, np, force_dma, id, NULL);
+}
+static inline int
+of_dma_configure_iommu_spec(struct device *dev, struct device_node *np,
+			    bool force_dma, struct of_phandle_args *iommu_spec)
+{
+	return __of_dma_configure(dev, np, force_dma, NULL, iommu_spec);
 }
 #else /* CONFIG_OF */
 
@@ -112,18 +125,25 @@ static inline struct device_node *of_cpu_device_node_get(int cpu)
 	return NULL;
 }
 
-static inline int of_dma_configure_id(struct device *dev,
+static inline int of_dma_configure(struct device *dev,
 				   struct device_node *np,
 				   bool force_dma)
 {
 	return 0;
 }
-static inline int of_dma_configure(struct device *dev,
-				   struct device_node *np,
-				   bool force_dma)
+
+static inline int of_dma_configure_id(struct device *dev,
+				      struct device_node *np,
+				      bool force_dma, const u32 *id)
 {
 	return 0;
 }
+
+static inline int
+of_dma_configure_iommu_spec(struct device *dev, struct device_node *np,
+			    bool force_dma, struct of_phandle_args *iommu_spec)
+{	return 0;
+}
 #endif /* CONFIG_OF */
 
 #endif /* _LINUX_OF_DEVICE_H */
diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
index 16f4b3e87f20..e8d1e6d32d77 100644
--- a/include/linux/of_iommu.h
+++ b/include/linux/of_iommu.h
@@ -14,7 +14,8 @@ extern int of_get_dma_window(struct device_node *dn, const char *prefix,
 
 extern const struct iommu_ops *of_iommu_configure(struct device *dev,
 					struct device_node *master_np,
-					const u32 *id);
+					const u32 *id,
+					struct of_phandle_args *iommu_spec);
 
 #else
 
@@ -27,7 +28,8 @@ static inline int of_get_dma_window(struct device_node *dn, const char *prefix,
 
 static inline const struct iommu_ops *of_iommu_configure(struct device *dev,
 					 struct device_node *master_np,
-					 const u32 *id)
+					 const u32 *id,
+					 struct of_phandle_args *iommu_spec);
 {
 	return NULL;
 }
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
