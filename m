Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A69F5A61
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA67610E67C;
	Tue, 17 Dec 2024 23:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxKzvgpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33ABC10E307;
 Tue, 17 Dec 2024 23:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478389; x=1766014389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aw6TsYuWW1eZWxgagRgFixS4YXBGrv7twl6YqF9Us4A=;
 b=bxKzvgpbdkWmjBOykuBbYXn+o+7ijUaJf3T34sOX7ZVjUDtsdFer9FRw
 LaLItf88tObRc5t/Y0RsWkHJ327Y0PaRfYztI4PhZPpBzkr4vw/1qzJDf
 W1aOrguitYGbwoeOTIh9Sj6hifkU0/cAsdqzob8czFZcHPzuvqyES07LY
 mP5IrXl4bV1BJxWt33yMDwpXOMUb7Y4YVbwA8kxxnPrdGHxdw5KOQJCtN
 JQZLVOi6bl87A8mBivazueNcfFvnVxHSmoE/kA1Ib6jc/AFfwQEwB41+U
 r1FwP+EGXJI3Y2PC9zVg03Boza94C9wEG2cRpIRSt7p9zN+lDZrm0Bk7n A==;
X-CSE-ConnectionGUID: W5d1ky1QSQ+gcQiCiUK72Q==
X-CSE-MsgGUID: cv7IW/8DTkuCYnAAH7Xu7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517346"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:08 -0800
X-CSE-ConnectionGUID: EUgOeFzcSW6bC21rifPVyw==
X-CSE-MsgGUID: 8ZBeak8kQsqvt84BfunhZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273425"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 04/30] drm/pagemap: Add DRM pagemap
Date: Tue, 17 Dec 2024 15:33:22 -0800
Message-Id: <20241217233348.3519726-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/drm/drm_pagemap.h | 103 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 include/drm/drm_pagemap.h

diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
new file mode 100644
index 000000000000..b6b387b81479
--- /dev/null
+++ b/include/drm/drm_pagemap.h
@@ -0,0 +1,103 @@
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
+	 * @dev.
+	 * @dpagemap: The struct drm_pagemap for the page.
+	 * @dev: The dma mapper.
+	 * @page: The page to map.
+	 * @dir: The transfer direction.
+	 * @protocol: The protocol to use.
+	 */
+	struct drm_pagemap_dma_addr (*map_dma)(struct drm_pagemap *dpagemap,
+					       struct device *dev,
+					       struct page *page,
+					       unsigned int order,
+					       enum dma_data_direction dir);
+
+	/**
+	 * @unmap_dma: Unmap a dma address previously obtained using  @map_dma.
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

