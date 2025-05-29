Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA91AC77C0
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D54910E0B9;
	Thu, 29 May 2025 05:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXgx35mw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541A410E0B9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497305; x=1780033305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W0b07hR404BkCAfz+PJrRZ5URoG6kJoNFO7BJKOwmPU=;
 b=QXgx35mwOm4JuH00k+1JSxzAi84yn6Pc8N2e7qavOS5UqTlqboAPfzF0
 rKj0bUnOy4UgVQZct9B/foMiaWhe5gUVqjm8VSv/TnuGprtPHUr5d3x3l
 HlK+D7nWSw/vgCUjc8jTI32cK5kfVZT7UVCX/HKRWa71l0mZqbdYjuKoI
 Ie0mDDb8uubs5GXQBZvjS6Vx6+S8/O8JaBmmAkFStPmqxwkz0gQFS+D1/
 NZqJl92jfKaCysP6LRMHMNolrj08oFkm+FAUNFP3jWRI74C80AhxPQeKx
 6ZRFh6KXmqj/QdCA9fKwSFYc3Z68T+aVrXhguFfcuI0gcuVHx6Hmx3uWd Q==;
X-CSE-ConnectionGUID: jr5dbq7SQtuQBazAkOsMOA==
X-CSE-MsgGUID: MFva+ePHTPK9/3Jxl6IGkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67962875"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67962875"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:41:44 -0700
X-CSE-ConnectionGUID: W2xU6Q6eQZOMvGEEwweqRw==
X-CSE-MsgGUID: w6p2HlQdT0SvCYJRbHO61w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443223"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:41:37 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: [RFC PATCH 01/30] HACK: dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Date: Thu, 29 May 2025 13:34:44 +0800
Message-Id: <20250529053513.1592088-2-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is just to illustrate the idea that dma-buf provides a new buffer
sharing mode - importer mapping. Exporter provides the target memory
resource description, importer decides what's the best way to map the
memory based on the information of target memory and importing device.

The get_pfn() kAPI is an initial attempt of this idea, obviously it is
not a full description for all kinds of memory types. But it enables
the FD based MMIO mapping in KVM to support private device assignement,
There are other concerns discussed [1] for this implementation, need
further investigation to work out a improved solution.

For now, no change to the previous version. [1]

[1]: https://lore.kernel.org/all/20250107142719.179636-2-yilun.xu@linux.intel.com/

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/dma-buf/dma-buf.c | 87 +++++++++++++++++++++++++++++++--------
 include/linux/dma-buf.h   | 13 ++++++
 2 files changed, 83 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b85515..58752f0bee36 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -630,10 +630,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	size_t alloc_size = sizeof(struct dma_buf);
 	int ret;
 
-	if (WARN_ON(!exp_info->priv || !exp_info->ops
-		    || !exp_info->ops->map_dma_buf
-		    || !exp_info->ops->unmap_dma_buf
-		    || !exp_info->ops->release))
+	if (WARN_ON(!exp_info->priv || !exp_info->ops ||
+		    (!!exp_info->ops->map_dma_buf != !!exp_info->ops->unmap_dma_buf) ||
+		    (!exp_info->ops->map_dma_buf && !exp_info->ops->get_pfn) ||
+		    !exp_info->ops->release))
 		return ERR_PTR(-EINVAL);
 
 	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
@@ -909,7 +909,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	struct dma_buf_attachment *attach;
 	int ret;
 
-	if (WARN_ON(!dmabuf || !dev))
+	if (WARN_ON(!dmabuf))
 		return ERR_PTR(-EINVAL);
 
 	if (WARN_ON(importer_ops && !importer_ops->move_notify))
@@ -941,7 +941,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	 */
 	if (dma_buf_attachment_is_dynamic(attach) !=
 	    dma_buf_is_dynamic(dmabuf)) {
-		struct sg_table *sgt;
+		struct sg_table *sgt = NULL;
 
 		dma_resv_lock(attach->dmabuf->resv, NULL);
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
@@ -950,13 +950,16 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 				goto err_unlock;
 		}
 
-		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
-		if (!sgt)
-			sgt = ERR_PTR(-ENOMEM);
-		if (IS_ERR(sgt)) {
-			ret = PTR_ERR(sgt);
-			goto err_unpin;
+		if (dev && dmabuf->ops->map_dma_buf) {
+			sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
+			if (!sgt)
+				sgt = ERR_PTR(-ENOMEM);
+			if (IS_ERR(sgt)) {
+				ret = PTR_ERR(sgt);
+				goto err_unpin;
+			}
 		}
+
 		dma_resv_unlock(attach->dmabuf->resv);
 		attach->sgt = sgt;
 		attach->dir = DMA_BIDIRECTIONAL;
@@ -1119,7 +1122,8 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf))
+	if (WARN_ON(!attach || !attach->dmabuf || !attach->dev ||
+		    !attach->dmabuf->ops->map_dma_buf))
 		return ERR_PTR(-EINVAL);
 
 	dma_resv_assert_held(attach->dmabuf->resv);
@@ -1195,7 +1199,8 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
 
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf))
+	if (WARN_ON(!attach || !attach->dmabuf || !attach->dev ||
+		    !attach->dmabuf->ops->map_dma_buf))
 		return ERR_PTR(-EINVAL);
 
 	dma_resv_lock(attach->dmabuf->resv, NULL);
@@ -1222,7 +1227,8 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 {
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
+	if (WARN_ON(!attach || !attach->dmabuf || !attach->dev ||
+		    !attach->dmabuf->ops->unmap_dma_buf || !sg_table))
 		return;
 
 	dma_resv_assert_held(attach->dmabuf->resv);
@@ -1254,7 +1260,8 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
 {
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
+	if (WARN_ON(!attach || !attach->dmabuf || !attach->dev ||
+		    !attach->dmabuf->ops->unmap_dma_buf || !sg_table))
 		return;
 
 	dma_resv_lock(attach->dmabuf->resv, NULL);
@@ -1263,6 +1270,52 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
 
+/**
+ * dma_buf_get_pfn_unlocked -
+ * @attach:	[in]	attachment to get pfn from
+ * @pgoff:	[in]	page offset of the buffer against the start of dma_buf
+ * @pfn:	[out]	returns the pfn of the buffer
+ * @max_order	[out]	returns the max mapping order of the buffer
+ */
+int dma_buf_get_pfn_unlocked(struct dma_buf_attachment *attach,
+			     pgoff_t pgoff, u64 *pfn, int *max_order)
+{
+	struct dma_buf *dmabuf = attach->dmabuf;
+	int ret;
+
+	if (WARN_ON(!attach || !attach->dmabuf ||
+		    !attach->dmabuf->ops->get_pfn))
+		return -EINVAL;
+
+	/*
+	 * Open:
+	 *
+	 * When dma_buf is dynamic but dma_buf move is disabled, the buffer
+	 * should be pinned before use, See dma_buf_map_attachment() for
+	 * reference.
+	 *
+	 * But for now no pin is intended inside dma_buf_get_pfn(), otherwise
+	 * need another API to unpin the dma_buf. So just fail out this case.
+	 */
+	if (dma_buf_is_dynamic(attach->dmabuf) &&
+	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
+		return -ENOENT;
+
+	dma_resv_lock(attach->dmabuf->resv, NULL);
+	ret = dmabuf->ops->get_pfn(attach, pgoff, pfn, max_order);
+	/*
+	 * Open:
+	 *
+	 * Is dma_resv_wait_timeout() needed? I assume no. The DMA buffer
+	 * content synchronization could be done when the buffer is to be
+	 * mapped by importer.
+	 */
+	dma_resv_unlock(attach->dmabuf->resv);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_get_pfn_unlocked, "DMA_BUF");
+
 /**
  * dma_buf_move_notify - notify attachments that DMA-buf is moving
  *
@@ -1662,7 +1715,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 		attach_count = 0;
 
 		list_for_each_entry(attach_obj, &buf_obj->attachments, node) {
-			seq_printf(s, "\t%s\n", dev_name(attach_obj->dev));
+			seq_printf(s, "\t%s\n", attach_obj->dev ? dev_name(attach_obj->dev) : NULL);
 			attach_count++;
 		}
 		dma_resv_unlock(buf_obj->resv);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bd..b16183edfb3a 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -194,6 +194,17 @@ struct dma_buf_ops {
 	 * if the call would block.
 	 */
 
+	/**
+	 * @get_pfn:
+	 *
+	 * This is called by dma_buf_get_pfn(). It is used to get the pfn
+	 * of the buffer positioned by the page offset against the start of
+	 * the dma_buf. It can only be called if @attach has been called
+	 * successfully.
+	 */
+	int (*get_pfn)(struct dma_buf_attachment *attach, pgoff_t pgoff,
+		       u64 *pfn, int *max_order);
+
 	/**
 	 * @release:
 	 *
@@ -629,6 +640,8 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
 void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
 				       struct sg_table *sg_table,
 				       enum dma_data_direction direction);
+int dma_buf_get_pfn_unlocked(struct dma_buf_attachment *attach,
+			     pgoff_t pgoff, u64 *pfn, int *max_order);
 
 int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
-- 
2.25.1

