Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A616FC08FF0
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E347D10E267;
	Sat, 25 Oct 2025 12:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izkyxjmB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6CA10E267;
 Sat, 25 Oct 2025 12:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393915; x=1792929915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+k4YmSMGoCyMFusKAnurSzxXV+DvczvQWlaGQNiIcAs=;
 b=izkyxjmB6W4JMmybpYwqzLGUyRON9FdxHZeQWwnHKMFlEfxswnkS8/qY
 dgZC1H3eKV8/spWmkZClsatR3dweuJkHxwuklZPbgt+caC+2lMakpYQOk
 mTn40OKZUwk3Kqikul0OdeNTob/XBZSAhxYtR/guqGLBFi3eevdBLZ8Vo
 Vubyulpaee5zF6LlYANirBT8WeTVepSjlBd8DZhlztE0/7fWe2ltAbb5e
 +ACroMvBgiAcnc5UlWyA3/XWU+OgcZPdFeA50BK3QlJ9O9VxrN/vB6v7Y
 iA2fBfUggfqYxCG7FPQmWR5GzaoST4ruIcIHA6sYQiF7e3zs2Iqu8rxGO g==;
X-CSE-ConnectionGUID: /ijDW1RRSii2E+f2Yzu0zQ==
X-CSE-MsgGUID: 59u+DMA5T92YalviC5CeMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590393"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590393"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:05:15 -0700
X-CSE-ConnectionGUID: t08MtPvmSViW1fj5mKN7jQ==
X-CSE-MsgGUID: +FQWKdocT9iPjUjp6pY6pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023826"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:05:12 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 13/15] drm/xe: Support pcie p2p dma as a fast interconnect
Date: Sat, 25 Oct 2025 14:04:10 +0200
Message-ID: <20251025120412.12262-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
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

Mimic the dma-buf method using dma_[map|unmap]_resource to map
for pcie-p2p dma.

There's an ongoing area of work upstream to sort out how this best
should be done. One method proposed is to add an additional
pci_p2p_dma_pagemap aliasing the device_private pagemap and use
the corresponding pci_p2p_dma_pagemap page as input for
dma_map_page(). However, that would incur double the amount of
memory and latency to set up the drm_pagemap and given the huge
amount of memory present on modern GPUs, that would really not work.
Hence the simple approach used in this patch.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 44 ++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_svm.h |  1 +
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 9dd96dad2cca..9814f95cb212 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -3,6 +3,8 @@
  * Copyright © 2024 Intel Corporation
  */
 
+#include <linux/pci-p2pdma.h>
+
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap.h>
@@ -442,6 +444,24 @@ static u64 xe_page_to_dpa(struct page *page)
 	return dpa;
 }
 
+static u64 xe_page_to_pcie(struct page *page)
+{
+	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
+	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
+	u64 hpa_base = xpagemap->hpa_base;
+	u64 ioaddr;
+	u64 pfn = page_to_pfn(page);
+	u64 offset;
+
+	xe_assert(vr->xe, is_device_private_page(page));
+	xe_assert(vr->xe, (pfn << PAGE_SHIFT) >= hpa_base);
+
+	offset = (pfn << PAGE_SHIFT) - hpa_base;
+	ioaddr = vr->io_start + offset;
+
+	return ioaddr;
+}
+
 enum xe_svm_copy_dir {
 	XE_SVM_COPY_TO_VRAM,
 	XE_SVM_COPY_TO_SRAM,
@@ -793,7 +813,10 @@ static bool xe_has_interconnect(struct drm_pagemap_peer *peer1,
 	struct device *dev1 = xe_peer_to_dev(peer1);
 	struct device *dev2 = xe_peer_to_dev(peer2);
 
-	return dev1 == dev2;
+	if (dev1 == dev2)
+		return true;
+
+	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true) >= 0;
 }
 
 static DRM_PAGEMAP_OWNER_LIST_DEFINE(xe_owner_list);
@@ -1530,13 +1553,27 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 		addr = xe_page_to_dpa(page);
 		prot = XE_INTERCONNECT_VRAM;
 	} else {
-		addr = DMA_MAPPING_ERROR;
-		prot = 0;
+		addr = dma_map_resource(dev,
+					xe_page_to_pcie(page),
+					PAGE_SIZE << order, dir,
+					DMA_ATTR_SKIP_CPU_SYNC);
+		prot = XE_INTERCONNECT_P2P;
 	}
 
 	return drm_pagemap_addr_encode(addr, prot, order, dir);
 }
 
+static void xe_drm_pagemap_device_unmap(struct drm_pagemap *dpagemap,
+					struct device *dev,
+					struct drm_pagemap_addr addr)
+{
+	if (addr.proto != XE_INTERCONNECT_P2P)
+		return;
+
+	dma_unmap_resource(dev, addr.addr, PAGE_SIZE << addr.order,
+			   addr.dir, DMA_ATTR_SKIP_CPU_SYNC);
+}
+
 static void xe_pagemap_destroy_work(struct work_struct *work)
 {
 	struct xe_pagemap *xpagemap = container_of(work, typeof(*xpagemap), destroy_work);
@@ -1573,6 +1610,7 @@ static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or
 
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
 	.device_map = xe_drm_pagemap_device_map,
+	.device_unmap = xe_drm_pagemap_device_unmap,
 	.populate_mm = xe_drm_pagemap_populate_mm,
 	.destroy = xe_pagemap_destroy,
 };
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 7cd7932f56c8..f5ed48993b6d 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -13,6 +13,7 @@
 #include <drm/drm_pagemap_util.h>
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
+#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
 
 struct drm_device;
 struct drm_file;
-- 
2.51.0

