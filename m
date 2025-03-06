Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FEFA53FD0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAEE10E8A1;
	Thu,  6 Mar 2025 01:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzGHzP3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD0510E889;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8auhSt/Lc/3K9cBNZotaTXSdHtxx+B6TLBdx7NAJ7WU=;
 b=fzGHzP3MI97wbYN8r4WhG2KXrKG6/UKy/2YjebqaR5zIRyfNI05YrvjE
 4L6xcIRRU2LLRohZCZeiqDWnuQdiD4pSt9AUSx5zapOtMUA448SjpCj1J
 2n+zlp5k1xQ+3u02EvL3UsJyg8eegxi3kf+ORxN0ojqfHhkywLFxzmLBE
 qgfOItDs3cMg09I/dlKxAcre3KbRIHCBK8b6I67z12ww5Wq79X1beBRFd
 Cx1wcUN6/Of7D+eaWfE4cpTSfV5vFr9fmW8tVRIsI2XPsuWjJHeouNQ44
 EqLZDD5Zyg+kYLbPuCMk0XRANMJkW4yevNMAVGPoMJmeDjcjWKduWHn9M A==;
X-CSE-ConnectionGUID: Ybt+U91gTUmK8cBDg9MUHw==
X-CSE-MsgGUID: 5A3Qn3DmSLelBJzNqnvAFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427273"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427273"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
X-CSE-ConnectionGUID: Ck93WHY8RfSbmLOCqaO/EA==
X-CSE-MsgGUID: z8qYFjhbRlWuf3R/o7xuBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063245"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 04/32] drm/pagemap: Add DRM pagemap
Date: Wed,  5 Mar 2025 17:26:29 -0800
Message-Id: <20250306012657.3505757-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
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
v5:
 - s/map_dma/device_map (Thomas)
 - s/unmap_dma/device_unmap (Thomas)
v7:
 - Fix kernel doc (CI, Auld)
 - Drop P2P define (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/drm/drm_pagemap.h | 107 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 include/drm/drm_pagemap.h

diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
new file mode 100644
index 000000000000..202c157ff4d7
--- /dev/null
+++ b/include/drm/drm_pagemap.h
@@ -0,0 +1,107 @@
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
+ *
+ * @DRM_INTERCONNECT_SYSTEM: DMA map is system pages
+ * @DRM_INTERCONNECT_DRIVER: DMA map is driver defined
+ */
+enum drm_interconnect_protocol {
+	DRM_INTERCONNECT_SYSTEM,
+	DRM_INTERCONNECT_DRIVER,
+	/* A driver can add private values beyond DRM_INTERCONNECT_DRIVER */
+};
+
+/**
+ * struct drm_pagemap_device_addr - Device address representation.
+ * @addr: The dma address or driver-defined address for driver private interconnects.
+ * @proto: The interconnect protocol.
+ * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
+ * @dir: The DMA direction.
+ *
+ * Note: There is room for improvement here. We should be able to pack into
+ * 64 bits.
+ */
+struct drm_pagemap_device_addr {
+	dma_addr_t addr;
+	u64 proto : 54;
+	u64 order : 8;
+	u64 dir : 2;
+};
+
+/**
+ * drm_pagemap_device_addr_encode() - Encode a dma address with metadata
+ * @addr: The dma address or driver-defined address for driver private interconnects.
+ * @proto: The interconnect protocol.
+ * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
+ * @dir: The DMA direction.
+ *
+ * Return: A struct drm_pagemap_device_addr encoding the above information.
+ */
+static inline struct drm_pagemap_device_addr
+drm_pagemap_device_addr_encode(dma_addr_t addr,
+			       enum drm_interconnect_protocol proto,
+			       unsigned int order,
+			       enum dma_data_direction dir)
+{
+	return (struct drm_pagemap_device_addr) {
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
+	 * @device_map: Map for device access or provide a virtual address suitable for
+	 *
+	 * @dpagemap: The struct drm_pagemap for the page.
+	 * @dev: The device mapper.
+	 * @page: The page to map.
+	 * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
+	 * @dir: The transfer direction.
+	 */
+	struct drm_pagemap_device_addr (*device_map)(struct drm_pagemap *dpagemap,
+						     struct device *dev,
+						     struct page *page,
+						     unsigned int order,
+						     enum dma_data_direction dir);
+
+	/**
+	 * @device_unmap: Unmap a device address previously obtained using @device_map.
+	 *
+	 * @dpagemap: The struct drm_pagemap for the mapping.
+	 * @dev: The device unmapper.
+	 * @addr: The device address obtained when mapping.
+	 */
+	void (*device_unmap)(struct drm_pagemap *dpagemap,
+			     struct device *dev,
+			     struct drm_pagemap_device_addr addr);
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

