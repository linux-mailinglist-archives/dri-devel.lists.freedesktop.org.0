Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB3899FF62
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8740810E663;
	Wed, 16 Oct 2024 03:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fl/i1/8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4AA10E649;
 Wed, 16 Oct 2024 03:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049098; x=1760585098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+gR/suRP+Y4jEabpDl9XtLdajDyFKlpkAVmT/X78dTg=;
 b=fl/i1/8PURVAj/D36kDZc2LbvtCbKLRUgq+bhkF820XkMjjHWg3ZuC/u
 AfBWkh+lMmgUtJdpFjkfJuhoM934lJTps085eMSDg7lld+5G5KqmncBZv
 LYsjDg3nmTaPbvsLxZtHuHa2SBvJuDn4mwyaQ/7utwWapaYturlKNdWBk
 H5cAK4JoZ/tkbBmIvzNyfurOAtVcT4StvgsKBqPTHc+o4wAcqYmieMebm
 Bfj7uGCQCiONA3jKaRTVQPw+n+ZdI699RsB96KFVfrCrCn0Ccr1BRvKWs
 htOCynIOr+9Or0hLjhRwNA3N54q/cgzNzBEHQgly/3npHX2p2wFzw2H9F w==;
X-CSE-ConnectionGUID: JFC7IkPqRW259c9nyGY70w==
X-CSE-MsgGUID: YdrTsgxiTKCfTHcNmIgcag==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056358"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056358"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:57 -0700
X-CSE-ConnectionGUID: tnMH+2f1TcCNZYv/d5WxGQ==
X-CSE-MsgGUID: 8GiVcoPLQZKWb351T9snPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930253"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 04/29] drm/pagemap: Add DRM pagemap
Date: Tue, 15 Oct 2024 20:24:53 -0700
Message-Id: <20241016032518.539495-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/drm_pagemap.h | 103 +++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/drm_pagemap.h

diff --git a/drivers/gpu/drm/xe/drm_pagemap.h b/drivers/gpu/drm/xe/drm_pagemap.h
new file mode 100644
index 000000000000..b6b387b81479
--- /dev/null
+++ b/drivers/gpu/drm/xe/drm_pagemap.h
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

