Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F679CB69B4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 18:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E30310E8A6;
	Thu, 11 Dec 2025 17:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mx+kmFsf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7723F10E89C;
 Thu, 11 Dec 2025 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765472457; x=1797008457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+lp6RHBtCGoomIMQ43CkyXu4KEOnYunF0/zrlXWOnH4=;
 b=mx+kmFsfYH0H6rJkWZ6+ur+NQJAWiLUVpM8LEpTgFqh6s+PloEz8yyeC
 YmGBhMo8jWD0I06QmQUc8rhmxkrI5PlNlGuKcAh/ThJ9WrqM+fMxcE8zG
 vVbYD0YNcj4gt3bFOXqCxmXT/Y+1rLbFc/zsbvBayYZ/rahBundqWzJVo
 +ndKUMXEMzgxUUyAtPi5NEu4SYkXsTK4mpzgO5RdE5S7vBN2uwGNO5kDP
 gEbLACQEtvPr9zjxeIu9frpdUc/xjuNK5kN9m8ohKyBYmFCSfEkC6Ip59
 u4UIZZv6YYPXmMtiphsAVsUSeL1U678gnPEKlHU4aivB6ywW6/syL9teX A==;
X-CSE-ConnectionGUID: nSED+Th0TbCwhb3s0RZ+Zw==
X-CSE-MsgGUID: +9PXgYWTRKiXro9JYh6i1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71083455"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71083455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:57 -0800
X-CSE-ConnectionGUID: 9vMmRQGiR86mZqI1e0wHJw==
X-CSE-MsgGUID: PKbTInDpRE6PPdLWLw9fOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196849863"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:54 -0800
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
Subject: [PATCH v4 22/22] drm/pagemap: Support source migration over
 interconnect
Date: Thu, 11 Dec 2025 17:59:09 +0100
Message-ID: <20251211165909.219710-23-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 200 ++++++++++++++++++++++++++++------
 1 file changed, 164 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 56bedb622264..fd4b96a21d94 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -205,11 +205,11 @@ static void drm_pagemap_get_devmem_page(struct page *page,
 
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
@@ -228,8 +228,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 					 enum dma_data_direction dir,
 					 const struct drm_pagemap_migrate_details *mdetails)
 {
-	unsigned long i;
-	unsigned long num_peer_pages = 0;
+	unsigned long num_peer_pages = 0, num_local_pages = 0, i;
 
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
@@ -248,10 +247,15 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
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
@@ -275,6 +279,9 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 	if (num_peer_pages)
 		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
 			num_peer_pages);
+	if (num_local_pages)
+		drm_dbg(local_dpagemap->drm, "Migrating %lu local pages over interconnect.\n",
+			num_local_pages);
 
 	return 0;
 }
@@ -327,6 +334,115 @@ npages_in_range(unsigned long start, unsigned long end)
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
@@ -368,6 +484,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 	};
 	unsigned long i, npages = npages_in_range(start, end);
 	unsigned long own_pages = 0, migrated_pages = 0;
+	struct migrate_range_loc cur, last = {.device = dpagemap->drm->dev, .ops = ops};
 	struct vm_area_struct *vas;
 	struct drm_pagemap_zdd *zdd = NULL;
 	struct page **pages;
@@ -463,44 +580,55 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
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
+		cur.start = i;
 
-		if (unlikely(src_page && is_zone_device_page(src_page) &&
-			     page_pgmap(src_page) == pagemap &&
-			     !mdetails->can_migrate_same_pagemap)) {
-			migrate.dst[i] = 0;
-			pages[i] = NULL;
-			own_pages++;
-			continue;
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
 	/* Upon success bind devmem allocation to range and zdd */
 	devmem_allocation->timeslice_expiration = get_jiffies_64() +
 		msecs_to_jiffies(mdetails->timeslice_ms);
-- 
2.51.1

