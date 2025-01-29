Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704AAA224C6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9309010E8BF;
	Wed, 29 Jan 2025 19:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AvQznGdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF39010E177;
 Wed, 29 Jan 2025 19:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180281; x=1769716281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Af8jV6LhXM6CVAMb9jzazzOIWcnQNmb5LzjKpPTQYgg=;
 b=AvQznGdCbQdBoA25HYiOBhdq2uNubAXRiMPmo5+4UFy2DKFxexoJwpOO
 T0kMx8pu34sI1JVeCSwi2HxxeBe3Nn+KbrEvjz+VHzCDd+WSIR7TBD57C
 RCL/F7QKRhC+Xu3WHn7z6P8zTjbkfDRCv/BC/0DacqqNEfgPRYq+dUmho
 h+d0NDrHV5nKHuOBS8D9tUAe0gBvjghFZIskDvnHkiYGYBeghx5ayZg0w
 uCEDMvMcvlvU6M1c+FbtqTKbPUqToZjyqLLm5fXFwvdL6R/B7ZKsY9sTh
 xUy2rHJVkNF441+EdhfWFtbVHL0XUx1BXDKPU5C3czAXNaqoG+/0wlxjr w==;
X-CSE-ConnectionGUID: WMMAKoH4TkGlmQUrgMaOHQ==
X-CSE-MsgGUID: TFts46RxTYS2OofZ71HyXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132729"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132729"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:21 -0800
X-CSE-ConnectionGUID: e/5wpPWkR6ao1tdmlNWxZA==
X-CSE-MsgGUID: FIUQ9Ga4QSOazwpVd70tCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392112"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 04/33] drm/pagemap: Add DRM pagemap
Date: Wed, 29 Jan 2025 11:51:43 -0800
Message-Id: <20250129195212.745731-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Introduce drm_pagemap ops to map and unmap dma to VRAM resources. In the
local memory case it's a matter of merely providing an offset into the
device's physical address. For future p2p the map and unmap functions may
encode as needed.

Similar to how dma-buf works, let the memory provider (drm_pagemap) provide
the mapping functionality.

v3:
 - Move to drm level include
v4:
 - Fix kernel doc (G.G.)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/drm/drm_pagemap.h | 105 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 include/drm/drm_pagemap.h

diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
new file mode 100644
index 000000000000..2b610ccf7e30
--- /dev/null
+++ b/include/drm/drm_pagemap.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef _DRM_PAGEMAP_H_
+#define _DRM_PAGEMAP_H_
+
+#include <linux/dma-direction.h>
+#include <linux/hmm.h>
+#include <linux/types.h>
+
+struct drm_pagemap;
+struct device;
+
+/**
+ * enum drm_interconnect_protocol - Used to identify an interconnect protocol.
+ */
+enum drm_interconnect_protocol {
+	DRM_INTERCONNECT_SYSTEM,    /* DMA map is system pages. */
+	DRM_INTERCONNECT_PCIE_P2P,  /* DMA map is PCIE P2P */
+	DRM_INTERCONNECT_DRIVER,    /* DMA map is driver defined */
+	/* A driver can add private values beyond DRM_INTERCONNECT_DRIVER */
+};
+
+/**
+ * struct drm_pagemap_dma_addr - DMA address representation.
+ * @addr: The dma address or driver-defined address for driver private interconnects.
+ * @proto: The interconnect protocol.
+ * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
+ * @dir: The DMA direction.
+ *
+ * Note: There is room for improvement here. We should be able to pack into
+ * 64 bits.
+ */
+struct drm_pagemap_dma_addr {
+	dma_addr_t addr;
+	u64 proto : 54;
+	u64 order : 8;
+	u64 dir : 2;
+};
+
+/**
+ * drm_pagemap_dma_addr_encode() - Encode a dma address with metadata
+ * @addr: The dma address or driver-defined address for driver private interconnects.
+ * @proto: The interconnect protocol.
+ * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
+ * @dir: The DMA direction.
+ *
+ * Return: A struct drm_pagemap_dma_addr encoding the above information.
+ */
+static inline struct drm_pagemap_dma_addr
+drm_pagemap_dma_addr_encode(dma_addr_t addr,
+			    enum drm_interconnect_protocol proto,
+			    unsigned int order,
+			    enum dma_data_direction dir)
+{
+	return (struct drm_pagemap_dma_addr) {
+		.addr = addr,
+		.proto = proto,
+		.order = order,
+		.dir = dir,
+	};
+}
+
+/**
+ * struct drm_pagemap_ops: Ops for a drm-pagemap.
+ */
+struct drm_pagemap_ops {
+	/**
+	 * @map_dma: Map for dma access or provide a virtual address suitable for
+	 *
+	 * @dpagemap: The struct drm_pagemap for the page.
+	 * @dev: The dma mapper.
+	 * @page: The page to map.
+	 * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
+	 * @dir: The transfer direction.
+	 */
+	struct drm_pagemap_dma_addr (*map_dma)(struct drm_pagemap *dpagemap,
+					       struct device *dev,
+					       struct page *page,
+					       unsigned int order,
+					       enum dma_data_direction dir);
+
+	/**
+	 * @unmap_dma: Unmap a dma address previously obtained using @map_dma.
+	 *
+	 * @dpagemap: The struct drm_pagemap for the mapping.
+	 * @dev: The dma unmapper.
+	 * @addr: The dma address obtained when mapping.
+	 */
+	void (*unmap_dma)(struct drm_pagemap *dpagemap,
+			  struct device *dev,
+			  struct drm_pagemap_dma_addr addr);
+
+};
+
+/**
+ * struct drm_pagemap: Additional information for a struct dev_pagemap
+ * used for device p2p handshaking.
+ * @ops: The struct drm_pagemap_ops.
+ * @dev: The struct drevice owning the device-private memory.
+ */
+struct drm_pagemap {
+	const struct drm_pagemap_ops *ops;
+	struct device *dev;
+};
+
+#endif
-- 
2.34.1

