Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F7C1B4F50
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 23:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C1089D84;
	Wed, 22 Apr 2020 21:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815A989D84
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 21:25:41 +0000 (UTC)
IronPort-SDR: V5LxAZXmW7TEcufCfbwqRSBAik4TqHh8qhe+ibalFv3ZkTliuW3e2ZZ7FbS5clABHXZF7O4SIW
 Tn1WzOFmJWjA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 14:25:41 -0700
IronPort-SDR: u5Dl2ByCT9zyATY5+pWmRcFGRZvRAg+Z4vA/qJlyvPagIW/0AVUC/PMoYZLCq5/dCRZ4wTemsD
 cXFfFDKRnKFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="259208522"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 14:25:40 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915/dmabuf: Add LMEM knowledge to dmabuf map handler
Date: Wed, 22 Apr 2020 17:25:17 -0400
Message-Id: <20200422212519.36276-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200422212519.36276-1-michael.j.ruhl@intel.com>
References: <20200422212519.36276-1-michael.j.ruhl@intel.com>
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
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, jianxin.xiong@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LMEM backed buffer objects do not have struct page information.
Instead the dma_address of the struct sg is used to store the
LMEM address information (relative to the device, this is not
the CPU physical address).

The dmabuf map handler requires pages to do a dma_map_xx.

Add new mapping/unmapping functions, based on the LMEM usage
of the dma_address to allow LMEM backed buffer objects to be
mapped.

Before mapping check the peer2peer distance to verify that P2P
dma can occur.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 82 ++++++++++++++++++++--
 1 file changed, 76 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 7ea4abb6a896..402c989cc23d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -7,6 +7,7 @@
 #include <linux/dma-buf.h>
 #include <linux/highmem.h>
 #include <linux/dma-resv.h>
+#include <linux/pci-p2pdma.h>
 #include <linux/scatterlist.h>
 
 #include "i915_drv.h"
@@ -18,6 +19,67 @@ static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
 	return to_intel_bo(buf->priv);
 }
 
+static void dmabuf_unmap_addr(struct device *dev, struct scatterlist *sgl,
+			      int nents, enum dma_data_direction dir)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sg(sgl, sg, nents, i)
+		dma_unmap_resource(dev, sg_dma_address(sg), sg_dma_len(sg),
+				   dir, 0);
+}
+
+/**
+ * dmabuf_map_addr - Update LMEM address to a physical address and map the
+ * resource.
+ * @dev: valid device
+ * @obj: valid i915 GEM object
+ * @sg: scatter list to appy mapping to
+ * @nents: number of entries in the scatter list
+ * @dir: DMA direction
+ *
+ * The dma_address of the scatter list is the LMEM "address".  From this the
+ * actual physical address can be determined.
+ *
+ * Return of 0 means error.
+ *
+ */
+static int dmabuf_map_addr(struct device *dev, struct drm_i915_gem_object *obj,
+			   struct scatterlist *sgl, int nents,
+			   enum dma_data_direction dir)
+{
+	struct scatterlist *sg;
+	phys_addr_t addr;
+	int distance;
+	int i;
+
+	distance = pci_p2pdma_distance_many(obj->base.dev->pdev, &dev, 1,
+					    true);
+	if (distance < 0) {
+		pr_info("%s: from: %s  to: %s  distance: %d\n", __func__,
+			pci_name(obj->base.dev->pdev), dev_name(dev),
+			distance);
+		return 0;
+	}
+
+	for_each_sg(sgl, sg, nents, i) {
+		addr = sg_dma_address(sg) + obj->mm.region->io_start;
+
+		sg->dma_address = dma_map_resource(dev, addr, sg->length, dir,
+						   0);
+		if (dma_mapping_error(dev, sg->dma_address))
+			goto unmap;
+		sg->dma_length = sg->length;
+	}
+
+	return nents;
+
+unmap:
+	dmabuf_unmap_addr(dev, sgl, i, dir);
+	return 0;
+}
+
 static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attach,
 					     enum dma_data_direction dir)
 {
@@ -44,12 +106,17 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attach,
 	dst = sgt->sgl;
 	for_each_sg(obj->mm.pages->sgl, src, obj->mm.pages->nents, i) {
 		sg_set_page(dst, sg_page(src), src->length, 0);
+		sg_dma_address(dst) = sg_dma_address(src);
 		dst = sg_next(dst);
 	}
 
-	if (!dma_map_sg_attrs(attach->dev,
-			      sgt->sgl, sgt->nents, dir,
-			      DMA_ATTR_SKIP_CPU_SYNC)) {
+	if (i915_gem_object_has_struct_page(obj))
+		ret = dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
+				       DMA_ATTR_SKIP_CPU_SYNC);
+	else
+		ret = dmabuf_map_addr(attach->dev, obj, sgt->sgl, sgt->nents,
+				      dir);
+	if (!ret) {
 		ret = -ENOMEM;
 		goto err_free_sg;
 	}
@@ -72,9 +139,12 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(attach->dmabuf);
 
-	dma_unmap_sg_attrs(attach->dev,
-			   sgt->sgl, sgt->nents, dir,
-			   DMA_ATTR_SKIP_CPU_SYNC);
+	if (i915_gem_object_has_struct_page(obj))
+		dma_unmap_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
+				   DMA_ATTR_SKIP_CPU_SYNC);
+	else
+		dmabuf_unmap_addr(attach->dev, sgt->sgl, sgt->nents, dir);
+
 	sg_free_table(sgt);
 	kfree(sgt);
 
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
