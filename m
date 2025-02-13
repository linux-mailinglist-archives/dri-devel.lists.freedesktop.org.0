Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638F9A33533
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8F410E9C4;
	Thu, 13 Feb 2025 02:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCACSFzA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0F610E1C0;
 Thu, 13 Feb 2025 02:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412616; x=1770948616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=//pFGnW2JbfOO11PNPfQmDjWtuU252mXc8ZD/fg41QM=;
 b=UCACSFzAqIO8bGhhKSGAfZiPsMv2U3XVulbt/npuAeHz3ymGIs2Xvqtt
 Bdrl2CWFE29Q5oUspip5SnczyIhg67SSCHjsja2AoSRfSYkAFoIE6GK8w
 L5MMISwaEDsfS+OKVs+hZzWPA3UyS6Swz/BrGFJ8t1Oyk+hXlQUcILR5P
 ZqHAJFjxwMVUOMCI/PVi3wxEPemgQX/CIRam7R5OPZY8TUnx2UNDkr5ks
 nbfXPa/kdfzI/8/CxouE5WoIVtzlMMX3N4d1W7nTcQw0ojqJD3udPofl/
 baocCLCnuh/Vm2gfz+tz33tRA6Pwag+OuPl7cM5j9NhqEdtC5i6HKjJ1z g==;
X-CSE-ConnectionGUID: Sl0AJaPJQF2EoL7co+yx3Q==
X-CSE-MsgGUID: aP7NEOfhQXS+tOHeK0uceg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65455915"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65455915"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
X-CSE-ConnectionGUID: e2hqOi+RSM6zq5NfmmJKJA==
X-CSE-MsgGUID: 4xzAI+A8TQO/eIMhZEZWHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945045"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 04/32] drm/pagemap: Add DRM pagemap
Date: Wed, 12 Feb 2025 18:10:44 -0800
Message-Id: <20250213021112.1228481-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/drm_pagemap.h | 105 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 include/drm/drm_pagemap.h

diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
new file mode 100644
index 000000000000..2634abb1e8bf
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

