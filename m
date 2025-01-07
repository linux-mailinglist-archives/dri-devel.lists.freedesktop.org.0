Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CF2A0509F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 03:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57BF10E147;
	Wed,  8 Jan 2025 02:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrmxA1Uu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC2010E147
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 02:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736303311; x=1767839311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Syt/4zTwsFXntNmBILomrRDPU928v/NSlBbptzf8p88=;
 b=QrmxA1UuA5jgan7NCl4GLBnm8UpvcJFQ+/F2g3Fnr6KJSf09egQSn+fc
 rMZQRaAzVJUM5dIgop5+NnIwyU5hxKWQhOdgrtJOj0AfJ/zdd1KxrySFG
 j6mmU2UZyASiG7Yq8Fjo7mX450v0hFUR7tkFWxtF68qgunS5jgsx7Mtiv
 nTFgiVrVcsLgylJhYVL7VvSJC8mwg6dYCO0ZgnUd4xx8OGyeU80yztovX
 v/Bx8ROJivN8X5A7qmmRb03o+S6KbW3JXyLqbkhQKcKYCgSIXjxLxgmMX
 PP+w8rP158Uh0G8GmuK6Um3G2VDuv2rdUZayzFidPCcyUUqwuVSvhtH4h g==;
X-CSE-ConnectionGUID: LJMWnzsFSICowI4KiZ+hBw==
X-CSE-MsgGUID: VMCZrPRBS+C8V6YkYKJX7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47010443"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="47010443"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 18:28:30 -0800
X-CSE-ConnectionGUID: gC/yh04aS/6ZUCyo43V61w==
X-CSE-MsgGUID: E/pvK/93RQ2PEmna2N7JOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103793547"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 18:28:25 -0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, jgg@nvidia.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com
Cc: yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI
Date: Tue,  7 Jan 2025 22:27:08 +0800
Message-Id: <20250107142719.179636-2-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107142719.179636-1-yilun.xu@linux.intel.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
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

Introduce a new API for dma-buf importer, also add a dma_buf_ops
callback for dma-buf exporter. This API is for subsystem importers who
map the dma-buf to some user defined address space, e.g. for IOMMUFD to
map the dma-buf to userspace IOVA via IOMMU page table, or for KVM to
map the dma-buf to GPA via KVM MMU (e.g. EPT).

Currently dma-buf is only used to get DMA address for device's default
domain by using kernel DMA APIs. But for these new use-cases, importers
only need the pfn of the dma-buf resource to build their own mapping
tables. So the map_dma_buf() callback is not mandatory for exporters
anymore. Also the importers could choose not to provide
struct device *dev on dma_buf_attach() if they don't call
dma_buf_map_attachment().

Like dma_buf_map_attachment(), the importer should firstly call
dma_buf_attach/dynamic_attach() then call dma_buf_get_pfn_unlocked().
If the importer choose to do dynamic attach, it also should handle the
dma-buf move notification.

Only the unlocked version of dma_buf_get_pfn is implemented for now,
just because no locked version is used for now.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>

---
IIUC, Only get_pfn() is needed but no put_pfn(). The whole dma-buf is
de/referenced at dma-buf attach/detach time.

Specifically, for static attachment, the exporter should always make
memory resource available/pinned on first dma_buf_attach(), and
release/unpin memory resource on last dma_buf_detach(). For dynamic
attachment, the exporter could populate & invalidate the memory
resource at any time, it's OK as long as the importers follow dma-buf
move notification. So no pinning is needed for get_pfn() and no
put_pfn() is needed.
---
 drivers/dma-buf/dma-buf.c | 90 +++++++++++++++++++++++++++++++--------
 include/linux/dma-buf.h   | 13 ++++++
 2 files changed, 86 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 7eeee3a38202..83d1448b6dcc 100644
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
@@ -909,7 +909,10 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	struct dma_buf_attachment *attach;
 	int ret;
 
-	if (WARN_ON(!dmabuf || !dev))
+	if (WARN_ON(!dmabuf))
+		return ERR_PTR(-EINVAL);
+
+	if (WARN_ON(dmabuf->ops->map_dma_buf && !dev))
 		return ERR_PTR(-EINVAL);
 
 	if (WARN_ON(importer_ops && !importer_ops->move_notify))
@@ -941,7 +944,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	 */
 	if (dma_buf_attachment_is_dynamic(attach) !=
 	    dma_buf_is_dynamic(dmabuf)) {
-		struct sg_table *sgt;
+		struct sg_table *sgt = NULL;
 
 		dma_resv_lock(attach->dmabuf->resv, NULL);
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
@@ -950,13 +953,16 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 				goto err_unlock;
 		}
 
-		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
-		if (!sgt)
-			sgt = ERR_PTR(-ENOMEM);
-		if (IS_ERR(sgt)) {
-			ret = PTR_ERR(sgt);
-			goto err_unpin;
+		if (dmabuf->ops->map_dma_buf) {
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
@@ -1119,7 +1125,8 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf))
+	if (WARN_ON(!attach || !attach->dmabuf ||
+		    !attach->dmabuf->ops->map_dma_buf))
 		return ERR_PTR(-EINVAL);
 
 	dma_resv_assert_held(attach->dmabuf->resv);
@@ -1195,7 +1202,8 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
 
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf))
+	if (WARN_ON(!attach || !attach->dmabuf ||
+		    !attach->dmabuf->ops->map_dma_buf))
 		return ERR_PTR(-EINVAL);
 
 	dma_resv_lock(attach->dmabuf->resv, NULL);
@@ -1222,7 +1230,8 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 {
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
+	if (WARN_ON(!attach || !attach->dmabuf ||
+		    !attach->dmabuf->ops->unmap_dma_buf || !sg_table))
 		return;
 
 	dma_resv_assert_held(attach->dmabuf->resv);
@@ -1254,7 +1263,8 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
 {
 	might_sleep();
 
-	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
+	if (WARN_ON(!attach || !attach->dmabuf ||
+		    !attach->dmabuf->ops->unmap_dma_buf || !sg_table))
 		return;
 
 	dma_resv_lock(attach->dmabuf->resv, NULL);
@@ -1263,6 +1273,52 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
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
@@ -1662,7 +1718,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
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

