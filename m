Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77687BD7D12
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B5410E556;
	Tue, 14 Oct 2025 07:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kntc8TOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E4F10E555;
 Tue, 14 Oct 2025 07:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760426038; x=1791962038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0JM6jl1yiLYCeVf56i0ZB1p+OW7rJRhTnT302NSKmyE=;
 b=kntc8TOI7HigU6yA9K17Sy4xI4vaMb26hdr85y/oxGeytGRi8LsmMRiX
 AnjXhzC1zq6yveD1RdoysBxojT302DOR9OaUzVPLt+quxFQifpvwHcH5l
 1MgWiE4aDB8ZTckDWbwegfb0SlkUmLR0H4aQ5I4qsQOVLdAkT2AsFIhnS
 hMUoGM4juC9+bC6azchoX6Q8LGzvF1qZtZfaxxRH3uuzictBOVSDdJweB
 EFXlmW3w1+1Spt5DRp6aLrqGscq8hAKsBaxE+sY6OF0MsuADxNnaLyEdT
 iGwTJjQAQBrIl2BFsN8NJgeD+ZvKbDJAEGddYapwTUrK8lJvjttdJiWSL A==;
X-CSE-ConnectionGUID: jxOaAIrUQWik3/j2WS0FHQ==
X-CSE-MsgGUID: 0DEK9hymRJ6L80NElQDiKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257124"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73257124"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:57 -0700
X-CSE-ConnectionGUID: q1GUv8nSSxOJVUHiHu0lSw==
X-CSE-MsgGUID: shLuXwAEROSLnHHL74nZTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181369852"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:55 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RFC 1/8] dma-buf: Add support for map/unmap APIs for interconnects
Date: Tue, 14 Oct 2025 00:08:51 -0700
Message-ID: <20251014071243.811884-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014071243.811884-1-vivek.kasireddy@intel.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For the map operation, the dma-buf core will create an xarray but
the exporter is expected to populate it with the interconnect
specific addresses. And, similarly for unmap, the exporter is
expected to cleanup the individual entries of the xarray.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/dma-buf.c            | 68 ++++++++++++++++++++++++++++
 include/linux/dma-buf-interconnect.h | 29 ++++++++++++
 include/linux/dma-buf.h              | 11 +++++
 3 files changed, 108 insertions(+)
 create mode 100644 include/linux/dma-buf-interconnect.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..162642bd53e8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1612,6 +1612,74 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, "DMA_BUF");
 
+struct dma_buf_ranges *
+dma_buf_map_interconnect(struct dma_buf_attachment *attach)
+{
+	const struct dma_buf_interconnect_ops *ic_ops;
+	struct dma_buf *dmabuf = attach->dmabuf;
+	struct dma_buf_ranges *ranges;
+	int ret;
+
+	might_sleep();
+
+	if (WARN_ON(!attach || !attach->dmabuf))
+		return ERR_PTR(-EINVAL);
+
+	if (!dma_buf_attachment_is_dynamic(attach))
+		return ERR_PTR(-EINVAL);
+
+	if (!attach->allow_ic)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	dma_resv_assert_held(attach->dmabuf->resv);
+
+	ic_ops = dmabuf->ops->interconnect_ops;
+	if (!ic_ops || !ic_ops->map_interconnect)
+		return ERR_PTR(-EINVAL);
+
+	ranges = kzalloc(sizeof(*ranges), GFP_KERNEL);
+	if (!ranges)
+		return ERR_PTR(-ENOMEM);
+
+	xa_init(&ranges->ranges);
+	ret = ic_ops->map_interconnect(attach, ranges);
+	if (ret)
+		goto err_free_ranges;
+
+	return ranges;
+
+err_free_ranges:
+	xa_destroy(&ranges->ranges);
+	kfree(ranges);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_map_interconnect, "DMA_BUF");
+
+void dma_buf_unmap_interconnect(struct dma_buf_attachment *attach,
+				struct dma_buf_ranges *ranges)
+{
+	const struct dma_buf_interconnect_ops *ic_ops;
+	struct dma_buf *dmabuf = attach->dmabuf;
+
+	if (WARN_ON(!attach || !attach->dmabuf || !ranges))
+		return;
+
+	if (!attach->allow_ic)
+		return;
+
+	ic_ops = dmabuf->ops->interconnect_ops;
+	if (!ic_ops || !ic_ops->unmap_interconnect)
+		return;
+
+	dma_resv_assert_held(attach->dmabuf->resv);
+
+	ic_ops->unmap_interconnect(attach, ranges);
+
+	xa_destroy(&ranges->ranges);
+	kfree(ranges);
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_interconnect, "DMA_BUF");
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf-interconnect.h b/include/linux/dma-buf-interconnect.h
new file mode 100644
index 000000000000..17504dea9691
--- /dev/null
+++ b/include/linux/dma-buf-interconnect.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __DMA_BUF_INTERCONNECT_H__
+#define __DMA_BUF_INTERCONNECT_H__
+
+#include <linux/xarray.h>
+
+struct dma_buf_attachment;
+
+struct dma_buf_ranges {
+	struct xarray ranges;
+	unsigned int nranges;
+};
+
+enum dma_buf_interconnect_type {
+	DMA_BUF_INTERCONNECT_NONE = 0,
+};
+
+struct dma_buf_interconnect {
+	enum dma_buf_interconnect_type type;
+};
+
+struct dma_buf_interconnect_ops {
+	int (*map_interconnect)(struct dma_buf_attachment *attach,
+				struct dma_buf_ranges *ranges);
+	void (*unmap_interconnect)(struct dma_buf_attachment *attach,
+				   struct dma_buf_ranges *ranges);
+};
+#endif
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index d58e329ac0e7..db91c67c00d6 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -23,6 +23,8 @@
 #include <linux/dma-fence.h>
 #include <linux/wait.h>
 
+#include <linux/dma-buf-interconnect.h>
+
 struct device;
 struct dma_buf;
 struct dma_buf_attachment;
@@ -276,6 +278,8 @@ struct dma_buf_ops {
 
 	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
+
+	const struct dma_buf_interconnect_ops *interconnect_ops;
 };
 
 /**
@@ -502,7 +506,9 @@ struct dma_buf_attachment {
 	struct device *dev;
 	struct list_head node;
 	bool peer2peer;
+	bool allow_ic;
 	const struct dma_buf_attach_ops *importer_ops;
+	struct dma_buf_interconnect interconnect;
 	void *importer_priv;
 	void *priv;
 };
@@ -589,6 +595,11 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
 					enum dma_data_direction);
 void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
 				enum dma_data_direction);
+
+struct dma_buf_ranges *dma_buf_map_interconnect(struct dma_buf_attachment *);
+void dma_buf_unmap_interconnect(struct dma_buf_attachment *,
+				struct dma_buf_ranges *);
+
 void dma_buf_move_notify(struct dma_buf *dma_buf);
 int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 			     enum dma_data_direction dir);
-- 
2.50.1

