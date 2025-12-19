Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D5CCF9BC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5319810EF44;
	Fri, 19 Dec 2025 11:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8uk2TdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6DC10EF46;
 Fri, 19 Dec 2025 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766144128; x=1797680128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rbv5vWWKyehcBXRuIzDxp2nrERsAzG4TgwtHixdUzf0=;
 b=l8uk2TdCxHiBHaIyvGT+Q4l1hTDbZCnamlvWNvHT9sVmKwljN3yoLsUh
 suPo0TeYTsPP9bOYcc8h5vPbnfjRfAHaY1jE6v6VPto4KURMp2fo7N75b
 kUvMPxbJwetPzIQAsduDFW9b2MDv/4TkmZHAMnd1eH5aGZdAElwb91D0o
 uCPqtqv79CudKf09maoZLXNzCFjLIO8S6VVuP/Ny8k+nvi0+Womlo4mT1
 QCSGjmB0ao66jKwfMzksas1VPOMjYVt3hZ/QAcvzdHhIXmELWP9vR3dkg
 kF2OfYASVa5uULbwqoZk/tTIDoCLjdzOKlp3hagfAMSeXHsCjZU+53Lhn g==;
X-CSE-ConnectionGUID: bRcXZ5P8TGKGT6KJl9Rnvg==
X-CSE-MsgGUID: Sr7gvZC5SdadN+wEhA/sow==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79224632"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79224632"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:35:28 -0800
X-CSE-ConnectionGUID: uAFT4NrsSgemCfQvL1BiQA==
X-CSE-MsgGUID: Ms6C0HTGQYiia2oM80akyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203005848"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:35:24 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 23/24] drm/pagemap: Support source migration over
 interconnect
Date: Fri, 19 Dec 2025 12:33:19 +0100
Message-ID: <20251219113320.183860-24-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
References: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
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

Support source interconnect migration by using the copy_to_ram() op
of the source device private pages.

Source interconnect migration is required to flush the L2 cache of
the source device, which among other things is a requirement for
correct global atomic operation. It also enables the source GPU to
potentially decompress any compressed content which is not
understood by peers, and finally for the PCIe case, it's expected
that writes over PCIe will be faster than reads.

The implementation can probably be improved by coalescing subregions
with the same source.

v5:
- Update waiting for the pre_migrate_fence and comments around that,
  previously in another patch. (Himal).
- Actually select device private pages to migrate when
  source_peer_migrates is true.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 204 +++++++++++++++++++++++++++-------
 1 file changed, 166 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 09356d50b8d1..ba099aa7c52f 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -206,11 +206,11 @@ static void drm_pagemap_get_devmem_page(struct page *page,
 
 /**
  * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
- * @dev: The device for which the pages are being mapped
- * @local_dpagemap: The drm_pagemap pointer of the local drm_pagemap.
- * @pagemap_addr: Array to store DMA information corresponding to mapped pages
- * @migrate_pfn: Array of migrate page frame numbers to map
- * @npages: Number of pages to map
+ * @dev: The device performing the migration.
+ * @local_dpagemap: The drm_pagemap local to the migrating device.
+ * @pagemap_addr: Array to store DMA information corresponding to mapped pages.
+ * @migrate_pfn: Array of page frame numbers of system pages or peer pages to map.
+ * @npages: Number of system pages or peer pages to map.
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
  * @mdetails: Details governing the migration behaviour.
  *
@@ -229,8 +229,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 					 enum dma_data_direction dir,
 					 const struct drm_pagemap_migrate_details *mdetails)
 {
-	unsigned long i;
-	unsigned long num_peer_pages = 0;
+	unsigned long num_peer_pages = 0, num_local_pages = 0, i;
 
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
@@ -249,10 +248,15 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 			struct drm_pagemap *dpagemap = zdd->dpagemap;
 			struct drm_pagemap_addr addr;
 
-			if (dpagemap == local_dpagemap && !mdetails->can_migrate_same_pagemap)
-				goto next;
+			if (dpagemap == local_dpagemap) {
+				if (!mdetails->can_migrate_same_pagemap)
+					goto next;
+
+				num_local_pages += NR_PAGES(order);
+			} else {
+				num_peer_pages += NR_PAGES(order);
+			}
 
-			num_peer_pages += NR_PAGES(order);
 			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
 			if (dma_mapping_error(dev, addr.addr))
 				return -EFAULT;
@@ -276,6 +280,9 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 	if (num_peer_pages)
 		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
 			num_peer_pages);
+	if (num_local_pages)
+		drm_dbg(local_dpagemap->drm, "Migrating %lu local pages over interconnect.\n",
+			num_local_pages);
 
 	return 0;
 }
@@ -328,6 +335,115 @@ npages_in_range(unsigned long start, unsigned long end)
 	return (end - start) >> PAGE_SHIFT;
 }
 
+static int
+drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
+				    struct device *remote_device,
+				    struct drm_pagemap *remote_dpagemap,
+				    unsigned long local_pfns[],
+				    struct page *remote_pages[],
+				    struct drm_pagemap_addr pagemap_addr[],
+				    unsigned long npages,
+				    const struct drm_pagemap_devmem_ops *ops,
+				    const struct drm_pagemap_migrate_details *mdetails)
+
+{
+	int err = drm_pagemap_migrate_map_pages(remote_device, remote_dpagemap,
+						pagemap_addr, local_pfns,
+						npages, DMA_FROM_DEVICE, mdetails);
+
+	if (err)
+		goto out;
+
+	err = ops->copy_to_ram(remote_pages, pagemap_addr, npages,
+			       devmem->pre_migrate_fence);
+out:
+	drm_pagemap_migrate_unmap_pages(remote_device, pagemap_addr, local_pfns,
+					npages, DMA_FROM_DEVICE);
+	return err;
+}
+
+static int
+drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
+			       unsigned long sys_pfns[],
+			       struct page *local_pages[],
+			       struct drm_pagemap_addr pagemap_addr[],
+			       unsigned long npages,
+			       const struct drm_pagemap_devmem_ops *ops,
+			       const struct drm_pagemap_migrate_details *mdetails)
+{
+	int err = drm_pagemap_migrate_map_pages(devmem->dev, devmem->dpagemap,
+						pagemap_addr, sys_pfns, npages,
+						DMA_TO_DEVICE, mdetails);
+
+	if (err)
+		goto out;
+
+	err = ops->copy_to_devmem(local_pages, pagemap_addr, npages,
+				  devmem->pre_migrate_fence);
+out:
+	drm_pagemap_migrate_unmap_pages(devmem->dev, pagemap_addr, sys_pfns, npages,
+					DMA_TO_DEVICE);
+	return err;
+}
+
+/**
+ * struct migrate_range_loc - Cursor into the loop over migrate_pfns for migrating to
+ * device.
+ * @start: The current loop index.
+ * @device: migrating device.
+ * @dpagemap: Pointer to struct drm_pagemap used by the migrating device.
+ * @ops: The copy ops to be used for the migrating device.
+ */
+struct migrate_range_loc {
+	unsigned long start;
+	struct device *device;
+	struct drm_pagemap *dpagemap;
+	const struct drm_pagemap_devmem_ops *ops;
+};
+
+static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
+				     unsigned long src_pfns[],
+				     unsigned long dst_pfns[],
+				     struct page *pages[],
+				     struct drm_pagemap_addr pagemap_addr[],
+				     struct migrate_range_loc *last,
+				     const struct migrate_range_loc *cur,
+				     const struct drm_pagemap_migrate_details *mdetails)
+{
+	int ret = 0;
+
+	if (cur->start == 0)
+		goto out;
+
+	if (cur->start <= last->start)
+		return 0;
+
+	if (cur->dpagemap == last->dpagemap && cur->ops == last->ops)
+		return 0;
+
+	if (last->dpagemap)
+		ret = drm_pagemap_migrate_remote_to_local(devmem,
+							  last->device,
+							  last->dpagemap,
+							  &dst_pfns[last->start],
+							  &pages[last->start],
+							  &pagemap_addr[last->start],
+							  cur->start - last->start,
+							  last->ops, mdetails);
+
+	else
+		ret = drm_pagemap_migrate_sys_to_dev(devmem,
+						     &src_pfns[last->start],
+						     &pages[last->start],
+						     &pagemap_addr[last->start],
+						     cur->start - last->start,
+						     last->ops, mdetails);
+
+out:
+	*last = *cur;
+	return ret;
+}
+
 /**
  * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
  * @devmem_allocation: The device memory allocation to migrate to.
@@ -365,10 +481,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		.end		= end,
 		.pgmap_owner	= pagemap->owner,
 		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
-		(mdetails->source_peer_migrates ? 0 : MIGRATE_VMA_SELECT_DEVICE_PRIVATE),
+		MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
 	};
 	unsigned long i, npages = npages_in_range(start, end);
 	unsigned long own_pages = 0, migrated_pages = 0;
+	struct migrate_range_loc cur, last = {.device = dpagemap->drm->dev, .ops = ops};
 	struct vm_area_struct *vas;
 	struct drm_pagemap_zdd *zdd = NULL;
 	struct page **pages;
@@ -467,44 +584,55 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	if (err)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
-					    devmem_allocation->dpagemap, pagemap_addr,
-					    migrate.src, npages, DMA_TO_DEVICE,
-					    mdetails);
-
-	if (err) {
-		drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
-						migrate.src, npages, DMA_TO_DEVICE);
-
-		goto err_finalize;
-	}
-
 	own_pages = 0;
+
 	for (i = 0; i < npages; ++i) {
 		struct page *page = pfn_to_page(migrate.dst[i]);
 		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
-
-		if (unlikely(src_page && is_zone_device_page(src_page) &&
-			     page_pgmap(src_page) == pagemap &&
-			     !mdetails->can_migrate_same_pagemap)) {
-			migrate.dst[i] = 0;
-			pages[i] = NULL;
-			own_pages++;
-			continue;
+		cur.start = i;
+
+		pages[i] = NULL;
+		if (src_page && is_device_private_page(src_page)) {
+			struct drm_pagemap_zdd *src_zdd = src_page->zone_device_data;
+
+			if (page_pgmap(src_page) == pagemap &&
+			    !mdetails->can_migrate_same_pagemap) {
+				migrate.dst[i] = 0;
+				own_pages++;
+				continue;
+			}
+			if (mdetails->source_peer_migrates) {
+				cur.dpagemap = src_zdd->dpagemap;
+				cur.ops = src_zdd->devmem_allocation->ops;
+				cur.device = cur.dpagemap->drm->dev;
+				pages[i] = src_page;
+			}
+		}
+		if (!pages[i]) {
+			cur.dpagemap = NULL;
+			cur.ops = ops;
+			cur.device = dpagemap->drm->dev;
+			pages[i] = page;
 		}
-		pages[i] = page;
 		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
 		drm_pagemap_get_devmem_page(page, zdd);
-	}
-	drm_WARN_ON(dpagemap->drm, !!own_pages);
 
-	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
-				  devmem_allocation->pre_migrate_fence);
-	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
-					migrate.src, npages, DMA_TO_DEVICE);
+		/* If we switched the migrating drm_pagemap, migrate previous pages now */
+		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
+						pages, pagemap_addr, &last, &cur,
+						mdetails);
+		if (err)
+			goto err_finalize;
+	}
+	cur.start = npages;
+	cur.ops = NULL; /* Force migration */
+	err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
+					pages, pagemap_addr, &last, &cur, mdetails);
 	if (err)
 		goto err_finalize;
 
+	drm_WARN_ON(dpagemap->drm, !!own_pages);
+
 	dma_fence_put(devmem_allocation->pre_migrate_fence);
 	devmem_allocation->pre_migrate_fence = NULL;
 
-- 
2.51.1

