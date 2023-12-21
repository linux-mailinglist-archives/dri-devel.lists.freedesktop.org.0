Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B1C81ADFA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1D010E668;
	Thu, 21 Dec 2023 04:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDAD10E654;
 Thu, 21 Dec 2023 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132902; x=1734668902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7zJ3ty+jyk7jcCM7EPJoXwr0WaTeOVcPcRQczuvpS8=;
 b=fa3V+uzy7GznfyLPs8ycB38RW4v0QunsZOWF+Leq3YM5W49nlviSMU7B
 Qch2cWRYY4AwLXQeBxcSPQVFeFX5LNEzKar3uJ+6hPET4JrzxMlV5df3h
 DNqixG05d3RrUd88hk0c8dDrJhJx1WaYOM8X6GYOp4C1JtMmePcyi3PsU
 7hFBiDR9afFyuD0VXlhuhTrWkHI+PqOJV5l+p08ETZL+UxdvOXo1fFrRZ
 CTBWw7Md8AV4/jTpgpXzY+GO0k2M1qkcrIyPGn8rX3C5PwRPwokEu4WtW
 grC80Cn9CPNNfPwUD+ukVv02pGmWUzwLvlhTtlz9Lc8yXIZL4Kur2cle2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069768"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069768"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481363"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481363"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 09/22] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Date: Wed, 20 Dec 2023 23:37:59 -0500
Message-Id: <20231221043812.3783313-10-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231221043812.3783313-1-oak.zeng@intel.com>
References: <20231221043812.3783313-1-oak.zeng@intel.com>
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Memory remap GPU vram using devm_memremap_pages, so each GPU vram
page is backed by a struct page.

Those struct pages are created to allow hmm migrate buffer b/t
GPU vram and CPU system memory using existing Linux migration
mechanism (i.e., migrating b/t CPU system memory and hard disk).

This is prepare work to enable svm (shared virtual memory) through
Linux kernel hmm framework. The memory remap's page map type is set
to MEMORY_DEVICE_PRIVATE for now. This means even though each GPU
vram page get a struct page and can be mapped in CPU page table,
but such pages are treated as GPU's private resource, so CPU can't
access them. If CPU access such page, a page fault is triggered
and page will be migrate to system memory.

For GPU device which supports coherent memory protocol b/t CPU and
GPU (such as CXL and CAPI protocol), we can remap device memory as
MEMORY_DEVICE_COHERENT. This is TBD.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  8 +++
 drivers/gpu/drm/xe/xe_mmio.c         |  7 +++
 drivers/gpu/drm/xe/xe_svm.h          |  2 +
 drivers/gpu/drm/xe/xe_svm_devmem.c   | 87 ++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 71f23ac365e6..c67c28f04d2f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -99,6 +99,14 @@ struct xe_mem_region {
 	resource_size_t actual_physical_size;
 	/** @mapping: pointer to VRAM mappable space */
 	void *__iomem mapping;
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f660cfb79f50..cfe25a3c7059 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -21,6 +21,7 @@
 #include "xe_macros.h"
 #include "xe_module.h"
 #include "xe_tile.h"
+#include "xe_svm.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -285,6 +286,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
+		xe_svm_devm_add(tile, &tile->mem.vram);
 	}
 
 	xe->mem.vram.actual_physical_size = total_size;
@@ -353,10 +355,15 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 static void mmio_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	u8 id;
 
 	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
 	if (xe->mem.vram.mapping)
 		iounmap(xe->mem.vram.mapping);
+	for_each_tile(tile, xe, id) {
+		xe_svm_devm_remove(xe, &tile->mem.vram);
+	}
 }
 
 static int xe_verify_lmem_ready(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 191bce6425db..b54f7714a1fc 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -72,4 +72,6 @@ struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
 struct xe_svm_range *xe_svm_range_from_addr(struct xe_svm *svm,
 								unsigned long addr);
 int xe_svm_build_sg(struct hmm_range *range, struct sg_table *st);
+int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
+void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region *mem);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
new file mode 100644
index 000000000000..cf7882830247
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/mm_types.h>
+#include <linux/sched/mm.h>
+
+#include "xe_device_types.h"
+#include "xe_trace.h"
+
+
+static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
+{
+	return 0;
+}
+
+static void xe_devm_page_free(struct page *page)
+{
+}
+
+static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
+	.page_free = xe_devm_page_free,
+	.migrate_to_ram = xe_devm_migrate_to_ram,
+};
+
+/**
+ * xe_svm_devm_add: Remap and provide memmap backing for device memory
+ * @tile: tile that the memory region blongs to
+ * @mr: memory region to remap
+ *
+ * This remap device memory to host physical address space and create
+ * struct page to back device memory
+ *
+ * Return: 0 on success standard error code otherwise
+ */
+int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
+{
+	struct device *dev = &to_pci_dev(tile->xe->drm.dev)->dev;
+	struct resource *res;
+	void *addr;
+	int ret;
+
+	res = devm_request_free_mem_region(dev, &iomem_resource,
+					   mr->usable_size);
+	if (IS_ERR(res)) {
+		ret = PTR_ERR(res);
+		return ret;
+	}
+
+	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
+	mr->pagemap.range.start = res->start;
+	mr->pagemap.range.end = res->end;
+	mr->pagemap.nr_range = 1;
+	mr->pagemap.ops = &xe_devm_pagemap_ops;
+	mr->pagemap.owner = tile->xe->drm.dev;
+	addr = devm_memremap_pages(dev, &mr->pagemap);
+	if (IS_ERR(addr)) {
+		devm_release_mem_region(dev, res->start, resource_size(res));
+		ret = PTR_ERR(addr);
+		drm_err(&tile->xe->drm, "Failed to remap tile %d memory, errno %d\n",
+				tile->id, ret);
+		return ret;
+	}
+	mr->hpa_base = res->start;
+
+	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
+			tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
+	return 0;
+}
+
+/**
+ * xe_svm_devm_remove: Unmap device memory and free resources
+ * @xe: xe device
+ * @mr: memory region to remove
+ */
+void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region *mr)
+{
+	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
+
+	if (mr->hpa_base) {
+		devm_memunmap_pages(dev, &mr->pagemap);
+		devm_release_mem_region(dev, mr->pagemap.range.start,
+			mr->pagemap.range.end - mr->pagemap.range.start +1);
+	}
+}
+
-- 
2.26.3

