Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA0AB/pceWnXwgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:48:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC7B9BBA4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F19E10E5E8;
	Wed, 28 Jan 2026 00:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UyMhrquf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F6310E5DA;
 Wed, 28 Jan 2026 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561329; x=1801097329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b+jHHdOBhrceZOpNeeTOLdednh5mcVxImSV62dD83/g=;
 b=UyMhrqufABUcy4jbDKhf5y8M0hebtOku36AxtKsujourBR4x9Lq4gkuT
 I87YM4lfzJmijO0MNNZnLtvpD5O0o1Hh3f+rBik4slyPv/KzIl4U/JjJ0
 JVeYyrE3zCLqpo6nKD/9P3ywvS14fENOc5pNL8jowGnZV9sdeL8PdTiyk
 EzwNgwR1lO+PCqHmm8BN3PrS7H1mmsY043I+2CWGItOzatOQctJOnAFtC
 Bqs4MUsHnx0UDQ6lytq5PekLHu0RnuPdHI28wyCq4Z8DMhazpVJdpX/64
 NyoZIfCNPq+jZU1tkWOKqeO5UobJx9c5I0L5QwlYs12WOjbulK4Ikg4FQ w==;
X-CSE-ConnectionGUID: nyfqVPFrTJutWoFwfZv2Pw==
X-CSE-MsgGUID: kDvZ8mu1SsmcTYf3iW+wIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427512"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427512"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
X-CSE-ConnectionGUID: aESowW52SXmxaL4x2mdY4A==
X-CSE-MsgGUID: PT2bfAxnRYW4yodjaO7XeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822646"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 03/11] drm/pagemap: Split drm_pagemap_migrate_map_pages
 into device / system
Date: Tue, 27 Jan 2026 16:48:33 -0800
Message-Id: <20260128004841.2436896-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128004841.2436896-1-matthew.brost@intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: BDC7B9BBA4
X-Rspamd-Action: no action

Split drm_pagemap_migrate_map_pages into device / system helpers clearly
seperating these operations. Will help with upcoming changes to split
IOVA allocation steps.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 146 ++++++++++++++++++++++------------
 1 file changed, 96 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 2c67aabd8d65..4b79d4019453 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -205,7 +205,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
 }
 
 /**
- * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
+ * drm_pagemap_migrate_map_device_pages() - Map device migration pages for GPU SVM migration
  * @dev: The device performing the migration.
  * @local_dpagemap: The drm_pagemap local to the migrating device.
  * @pagemap_addr: Array to store DMA information corresponding to mapped pages.
@@ -221,19 +221,22 @@ static void drm_pagemap_get_devmem_page(struct page *page,
  *
  * Returns: 0 on success, -EFAULT if an error occurs during mapping.
  */
-static int drm_pagemap_migrate_map_pages(struct device *dev,
-					 struct drm_pagemap *local_dpagemap,
-					 struct drm_pagemap_addr *pagemap_addr,
-					 unsigned long *migrate_pfn,
-					 unsigned long npages,
-					 enum dma_data_direction dir,
-					 const struct drm_pagemap_migrate_details *mdetails)
+static int
+drm_pagemap_migrate_map_device_pages(struct device *dev,
+				     struct drm_pagemap *local_dpagemap,
+				     struct drm_pagemap_addr *pagemap_addr,
+				     unsigned long *migrate_pfn,
+				     unsigned long npages,
+				     enum dma_data_direction dir,
+				     const struct drm_pagemap_migrate_details *mdetails)
 {
 	unsigned long num_peer_pages = 0, num_local_pages = 0, i;
 
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
-		dma_addr_t dma_addr;
+		struct drm_pagemap_zdd *zdd;
+		struct drm_pagemap *dpagemap;
+		struct drm_pagemap_addr addr;
 		struct folio *folio;
 		unsigned int order = 0;
 
@@ -243,36 +246,26 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 		folio = page_folio(page);
 		order = folio_order(folio);
 
-		if (is_device_private_page(page)) {
-			struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
-			struct drm_pagemap *dpagemap = zdd->dpagemap;
-			struct drm_pagemap_addr addr;
-
-			if (dpagemap == local_dpagemap) {
-				if (!mdetails->can_migrate_same_pagemap)
-					goto next;
+		WARN_ON_ONCE(!is_device_private_page(page));
 
-				num_local_pages += NR_PAGES(order);
-			} else {
-				num_peer_pages += NR_PAGES(order);
-			}
+		zdd = drm_pagemap_page_zone_device_data(page);
+		dpagemap = zdd->dpagemap;
 
-			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
-			if (dma_mapping_error(dev, addr.addr))
-				return -EFAULT;
+		if (dpagemap == local_dpagemap) {
+			if (!mdetails->can_migrate_same_pagemap)
+				goto next;
 
-			pagemap_addr[i] = addr;
+			num_local_pages += NR_PAGES(order);
 		} else {
-			dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
-			if (dma_mapping_error(dev, dma_addr))
-				return -EFAULT;
-
-			pagemap_addr[i] =
-				drm_pagemap_addr_encode(dma_addr,
-							DRM_INTERCONNECT_SYSTEM,
-							order, dir);
+			num_peer_pages += NR_PAGES(order);
 		}
 
+		addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
+		if (dma_mapping_error(dev, addr.addr))
+			return -EFAULT;
+
+		pagemap_addr[i] = addr;
+
 next:
 		i += NR_PAGES(order);
 	}
@@ -287,6 +280,59 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 	return 0;
 }
 
+/**
+ * drm_pagemap_migrate_map_system_pages() - Map system migration pages for GPU SVM migration
+ * @dev: The device performing the migration.
+ * @pagemap_addr: Array to store DMA information corresponding to mapped pages.
+ * @migrate_pfn: Array of page frame numbers of system pages or peer pages to map.
+ * @npages: Number of system pages or peer pages to map.
+ * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ *
+ * This function maps pages of memory for migration usage in GPU SVM. It
+ * iterates over each page frame number provided in @migrate_pfn, maps the
+ * corresponding page, and stores the DMA address in the provided @dma_addr
+ * array.
+ *
+ * Returns: 0 on success, -EFAULT if an error occurs during mapping.
+ */
+static int
+drm_pagemap_migrate_map_system_pages(struct device *dev,
+				     struct drm_pagemap_addr *pagemap_addr,
+				     unsigned long *migrate_pfn,
+				     unsigned long npages,
+				     enum dma_data_direction dir)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages;) {
+		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
+		dma_addr_t dma_addr;
+		struct folio *folio;
+		unsigned int order = 0;
+
+		if (!page)
+			goto next;
+
+		WARN_ON_ONCE(is_device_private_page(page));
+		folio = page_folio(page);
+		order = folio_order(folio);
+
+		dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
+		if (dma_mapping_error(dev, dma_addr))
+			return -EFAULT;
+
+		pagemap_addr[i] =
+			drm_pagemap_addr_encode(dma_addr,
+						DRM_INTERCONNECT_SYSTEM,
+						order, dir);
+
+next:
+		i += NR_PAGES(order);
+	}
+
+	return 0;
+}
+
 /**
  * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
  * @dev: The device for which the pages were mapped
@@ -347,9 +393,11 @@ drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
 				    const struct drm_pagemap_migrate_details *mdetails)
 
 {
-	int err = drm_pagemap_migrate_map_pages(remote_device, remote_dpagemap,
-						pagemap_addr, local_pfns,
-						npages, DMA_FROM_DEVICE, mdetails);
+	int err = drm_pagemap_migrate_map_device_pages(remote_device,
+						       remote_dpagemap,
+						       pagemap_addr, local_pfns,
+						       npages, DMA_FROM_DEVICE,
+						       mdetails);
 
 	if (err)
 		goto out;
@@ -368,12 +416,11 @@ drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
 			       struct page *local_pages[],
 			       struct drm_pagemap_addr pagemap_addr[],
 			       unsigned long npages,
-			       const struct drm_pagemap_devmem_ops *ops,
-			       const struct drm_pagemap_migrate_details *mdetails)
+			       const struct drm_pagemap_devmem_ops *ops)
 {
-	int err = drm_pagemap_migrate_map_pages(devmem->dev, devmem->dpagemap,
-						pagemap_addr, sys_pfns, npages,
-						DMA_TO_DEVICE, mdetails);
+	int err = drm_pagemap_migrate_map_system_pages(devmem->dev,
+						       pagemap_addr, sys_pfns,
+						       npages, DMA_TO_DEVICE);
 
 	if (err)
 		goto out;
@@ -437,7 +484,7 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 						     &pages[last->start],
 						     &pagemap_addr[last->start],
 						     cur->start - last->start,
-						     last->ops, mdetails);
+						     last->ops);
 
 out:
 	*last = *cur;
@@ -954,7 +1001,6 @@ EXPORT_SYMBOL(drm_pagemap_put);
 int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 {
 	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
-	struct drm_pagemap_migrate_details mdetails = {};
 	unsigned long npages, mpages = 0;
 	struct page **pages;
 	unsigned long *src, *dst;
@@ -993,10 +1039,10 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	if (err || !mpages)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
-					    devmem_allocation->dpagemap, pagemap_addr,
-					    dst, npages, DMA_FROM_DEVICE,
-					    &mdetails);
+	err = drm_pagemap_migrate_map_system_pages(devmem_allocation->dev,
+						   pagemap_addr,
+						   dst, npages,
+						   DMA_FROM_DEVICE);
 	if (err)
 		goto err_finalize;
 
@@ -1057,7 +1103,6 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
 		.fault_page	= page,
 	};
-	struct drm_pagemap_migrate_details mdetails = {};
 	struct drm_pagemap_zdd *zdd;
 	const struct drm_pagemap_devmem_ops *ops;
 	struct device *dev = NULL;
@@ -1115,8 +1160,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	if (err)
 		goto err_finalize;
 
-	err = drm_pagemap_migrate_map_pages(dev, zdd->dpagemap, pagemap_addr, migrate.dst, npages,
-					    DMA_FROM_DEVICE, &mdetails);
+	err = drm_pagemap_migrate_map_system_pages(dev, pagemap_addr,
+						   migrate.dst, npages,
+						   DMA_FROM_DEVICE);
 	if (err)
 		goto err_finalize;
 
-- 
2.34.1

