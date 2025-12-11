Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C532CB699F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 18:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6516710E87F;
	Thu, 11 Dec 2025 17:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IllVrPgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AF110E87E;
 Thu, 11 Dec 2025 17:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765472432; x=1797008432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N2MaQjkEztmdrXl/Rdxx/feCJ4JnAnKxi8q8zCMl72A=;
 b=IllVrPgElcpwwzmjc3MDqgJoW2x7IHnmEASUvdx0hxznEJ1tqiN7ikSd
 EpEm/yMW6spaCkc3yBc8xVwkjLoKKsLV5zsn//u/qdamFgzL+Ia+BQ5VK
 YhB6JvwqEO4d6SpFUCoqS54uRqK+643eetcKdGEQiEgRHniCW2/T+IsPJ
 yRipdpogfcE0p6938lhqbAGviMOlibsl/021F/Y4jDvBl/ejBQQZSrvPZ
 lBcdjeWdk6D9vK5DXiRHyPLNqMtZhMQaJ6FYytTNRQp6roLxiQBi9jzWK
 LfwU1rhtKZgPKn1nej06IPMF0geAFOSuEu4lD0zPnMK29XyLEtHesBNyQ g==;
X-CSE-ConnectionGUID: MRwQm5lWS2qjclTnFN+mvw==
X-CSE-MsgGUID: fBnl37SdQcKLz9j/5hso4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71083295"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71083295"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:32 -0800
X-CSE-ConnectionGUID: l8GnhL/kQS2G8Y95dSDrwQ==
X-CSE-MsgGUID: QSyHj2EVRga3g+pIqI+lAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196849694"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:29 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v4 15/22] drm/xe: Support pcie p2p dma as a fast interconnect
Date: Thu, 11 Dec 2025 17:59:02 +0100
Message-ID: <20251211165909.219710-16-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Simplify xe_page_to_pcie(). (Matt Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 34 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_svm.h |  1 +
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 54eb04467163..6ebc1b43d0ca 100644
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
@@ -452,6 +454,14 @@ static u64 xe_page_to_dpa(struct page *page)
 	return dpa;
 }
 
+static u64 xe_page_to_pcie(struct page *page)
+{
+	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
+	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
+
+	return xe_page_to_dpa(page) - vr->dpa_base + vr->io_start;
+}
+
 enum xe_svm_copy_dir {
 	XE_SVM_COPY_TO_VRAM,
 	XE_SVM_COPY_TO_SRAM,
@@ -839,7 +849,10 @@ static bool xe_has_interconnect(struct drm_pagemap_peer *peer1,
 	struct device *dev1 = xe_peer_to_dev(peer1);
 	struct device *dev2 = xe_peer_to_dev(peer2);
 
-	return dev1 == dev2;
+	if (dev1 == dev2)
+		return true;
+
+	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true) >= 0;
 }
 
 static DRM_PAGEMAP_OWNER_LIST_DEFINE(xe_owner_list);
@@ -1612,13 +1625,27 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
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
@@ -1655,6 +1682,7 @@ static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or
 
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
 	.device_map = xe_drm_pagemap_device_map,
+	.device_unmap = xe_drm_pagemap_device_unmap,
 	.populate_mm = xe_drm_pagemap_populate_mm,
 	.destroy = xe_pagemap_destroy,
 };
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index ec7c6751cc86..50e80bc892b6 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -13,6 +13,7 @@
 #include <drm/drm_pagemap_util.h>
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
+#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
 
 struct drm_device;
 struct drm_file;
-- 
2.51.1

