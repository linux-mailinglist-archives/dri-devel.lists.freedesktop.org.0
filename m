Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBGgN0Dsc2mkzgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:46:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5DB7AF74
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2824510EBE5;
	Fri, 23 Jan 2026 21:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FObD2Njb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FE610EBE4;
 Fri, 23 Jan 2026 21:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769204794; x=1800740794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+IGhIbQ3XwhwFiIro5ZWEpoc+YGXOnsYvbQoKnwjlbQ=;
 b=FObD2NjbQS0ngpbAKQ8diGjJXXFjOq87jgT8YOO9Ex9cMXEv/vKr0ion
 wnraL7RvFGqdR+wlpfqwJyPxNpBalDT27E3r1jpqEMY+SVZ1rKfvd67BX
 iEW+YP6aacpXYrPrQxCM3snBm97w0N902KqARrHteHaALiWmEhP+bLHuO
 BsE9WH0e6BUm9F+FXUgHIYAgJpSsLbQN1Ye7YoufkqgEFSrppIDXkHMPb
 madT7tkhv+IWHS32haDOu1Uo+Oh6zGnsH0ZC9v1EwVCawjvCQbiTwHjKq
 690bXJMLDir5ErlNXtKbeFu9RVkoYa+BVr+SRRa4oVbc5K/ZMFNZUbrPV A==;
X-CSE-ConnectionGUID: Sm8hEbUoQiSpJo0lnWT9Ew==
X-CSE-MsgGUID: v2yUV3XaTp67BENTtoUalw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74323573"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="74323573"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:46:32 -0800
X-CSE-ConnectionGUID: 4LYV7ahaSoWCvPibrdVBbQ==
X-CSE-MsgGUID: T7KETMQjQiyMQNtStkm8nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207169229"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:46:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH 2/2] drm/pagemap: Use new dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Date: Fri, 23 Jan 2026 13:46:25 -0800
Message-Id: <20260123214625.1612365-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123214625.1612365-1-matthew.brost@intel.com>
References: <20260123214625.1612365-1-matthew.brost@intel.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 8C5DB7AF74
X-Rspamd-Action: no action

The dma-map IOVA alloc, link, and sync APIs perform significantly better
than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
This difference is especially noticeable when mapping a 2MB region in
4KB pages.

Use the IOVA alloc, link, and sync APIs for DRM pagemap, which create DMA
mappings between the CPU and GPU for copying data.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 135 ++++++++++++++++++++++++++--------
 1 file changed, 105 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index e2aecd519f14..ee0a8a1b09fd 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -224,6 +224,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
  * @npages: Number of system pages or peer pages to map.
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
  * @mdetails: Details governing the migration behaviour.
+ * @state: DMA IOVA state for mapping.
  *
  * This function maps pages of memory for migration usage in GPU SVM. It
  * iterates over each page frame number provided in @migrate_pfn, maps the
@@ -238,27 +239,46 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 					 unsigned long *migrate_pfn,
 					 unsigned long npages,
 					 enum dma_data_direction dir,
-					 const struct drm_pagemap_migrate_details *mdetails)
+					 const struct drm_pagemap_migrate_details *mdetails,
+					 struct dma_iova_state *state)
 {
-	unsigned long num_peer_pages = 0, num_local_pages = 0, i;
+	unsigned long num_peer_pages = 0, num_local_pages = 0, psize, i;
+	struct page *dummy_page = NULL;
+	bool try_alloc = false, device_private = false;
+	int err = 0;
 
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
-		dma_addr_t dma_addr;
-		struct folio *folio;
+		dma_addr_t dma_addr = -1;
 		unsigned int order = 0;
 
-		if (!page)
+		/*
+		 * This loop is a bit goofy, but if IOVA linking is used, the
+		 * entire IOVA range must be populated with physical addresses.
+		 * The first page we find, dummy_page, is therefore used to
+		 * ensure every address in the IOVA range is populated.
+		 */
+
+		if (!page && (device_private || !dummy_page))
 			goto next;
 
-		folio = page_folio(page);
-		order = folio_order(folio);
+		if (!page) {
+			page = dummy_page;
+			psize = PAGE_SIZE;
+		} else {
+			struct folio *folio;
+
+			folio = page_folio(page);
+			order = folio_order(folio);
+			psize = page_size(page);
+		}
 
 		if (is_device_private_page(page)) {
 			struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
 			struct drm_pagemap *dpagemap = zdd->dpagemap;
 			struct drm_pagemap_addr addr;
 
+			device_private = true;
 			if (dpagemap == local_dpagemap) {
 				if (!mdetails->can_migrate_same_pagemap)
 					goto next;
@@ -274,28 +294,68 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 
 			pagemap_addr[i] = addr;
 		} else {
-			dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
-			if (dma_mapping_error(dev, dma_addr))
-				return -EFAULT;
+			if (!try_alloc) {
+				dma_iova_try_alloc(dev, state, 0,
+						   npages * PAGE_SIZE);
+				try_alloc = true;
+			}
 
-			pagemap_addr[i] =
-				drm_pagemap_addr_encode(dma_addr,
-							DRM_INTERCONNECT_SYSTEM,
-							order, dir);
+			if (dma_use_iova(state)) {
+				bool found_dummy = page && !dummy_page;
+
+				if (found_dummy) {
+					unsigned long j;
+
+					for (j = 0; j < i; ++j) {
+						err = dma_iova_link(dev, state,
+								    page_to_phys(page),
+								    j * PAGE_SIZE,
+								    PAGE_SIZE,
+								    dir, 0);
+						if (err)
+							return err;
+					}
+				}
+
+				err = dma_iova_link(dev, state, page_to_phys(page),
+						    i * PAGE_SIZE, psize,
+						    dir, 0);
+				if (err)
+					return err;
+
+				if (page != dummy_page)
+					dma_addr = state->addr + i * PAGE_SIZE;
+
+				if (found_dummy)
+					dummy_page = page;
+
+			} else {
+				dma_addr = dma_map_page(dev, page, 0, psize, dir);
+				if (dma_mapping_error(dev, dma_addr))
+					return -EFAULT;
+			}
+
+			if (dma_addr != -1)
+				pagemap_addr[i] =
+					drm_pagemap_addr_encode(dma_addr,
+								DRM_INTERCONNECT_SYSTEM,
+								order, dir);
 		}
 
 next:
 		i += NR_PAGES(order);
 	}
 
-	if (num_peer_pages)
+	if (dma_use_iova(state))
+		err = dma_iova_sync(dev, state, 0, npages * PAGE_SIZE);
+	if (!err && num_peer_pages)
 		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
 			num_peer_pages);
-	if (num_local_pages)
+	if (!err && num_local_pages)
 		drm_dbg(local_dpagemap->drm, "Migrating %lu local pages over interconnect.\n",
 			num_local_pages);
 
-	return 0;
+	return err;
 }
 
 /**
@@ -306,6 +366,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
  * @pagemap_addr: Array of DMA information corresponding to mapped pages
  * @npages: Number of pages to unmap
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ * @state: DMA IOVA state for mapping.
  *
  * This function unmaps previously mapped pages of memory for GPU Shared Virtual
  * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
@@ -315,10 +376,16 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 					    struct drm_pagemap_addr *pagemap_addr,
 					    unsigned long *migrate_pfn,
 					    unsigned long npages,
-					    enum dma_data_direction dir)
+					    enum dma_data_direction dir,
+					    struct dma_iova_state *state)
 {
 	unsigned long i;
 
+	if (dma_use_iova(state)) {
+		dma_iova_destroy(dev, state, npages * PAGE_SIZE, dir, 0);
+		return;
+	}
+
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
 
@@ -355,12 +422,14 @@ drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
 				    struct drm_pagemap_addr pagemap_addr[],
 				    unsigned long npages,
 				    const struct drm_pagemap_devmem_ops *ops,
-				    const struct drm_pagemap_migrate_details *mdetails)
+				    const struct drm_pagemap_migrate_details *mdetails,
+				    struct dma_iova_state *state)
 
 {
 	int err = drm_pagemap_migrate_map_pages(remote_device, remote_dpagemap,
 						pagemap_addr, local_pfns,
-						npages, DMA_FROM_DEVICE, mdetails);
+						npages, DMA_FROM_DEVICE,
+						mdetails, state);
 
 	if (err)
 		goto out;
@@ -369,7 +438,7 @@ drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
 			       devmem->pre_migrate_fence);
 out:
 	drm_pagemap_migrate_unmap_pages(remote_device, pagemap_addr, local_pfns,
-					npages, DMA_FROM_DEVICE);
+					npages, DMA_FROM_DEVICE, state);
 	return err;
 }
 
@@ -380,11 +449,12 @@ drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
 			       struct drm_pagemap_addr pagemap_addr[],
 			       unsigned long npages,
 			       const struct drm_pagemap_devmem_ops *ops,
-			       const struct drm_pagemap_migrate_details *mdetails)
+			       const struct drm_pagemap_migrate_details *mdetails,
+			       struct dma_iova_state *state)
 {
 	int err = drm_pagemap_migrate_map_pages(devmem->dev, devmem->dpagemap,
 						pagemap_addr, sys_pfns, npages,
-						DMA_TO_DEVICE, mdetails);
+						DMA_TO_DEVICE, mdetails, state);
 
 	if (err)
 		goto out;
@@ -393,7 +463,7 @@ drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
 				  devmem->pre_migrate_fence);
 out:
 	drm_pagemap_migrate_unmap_pages(devmem->dev, pagemap_addr, sys_pfns, npages,
-					DMA_TO_DEVICE);
+					DMA_TO_DEVICE, state);
 	return err;
 }
 
@@ -421,6 +491,7 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 				     const struct migrate_range_loc *cur,
 				     const struct drm_pagemap_migrate_details *mdetails)
 {
+	struct dma_iova_state state = {};
 	int ret = 0;
 
 	if (cur->start == 0)
@@ -440,7 +511,8 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 							  &pages[last->start],
 							  &pagemap_addr[last->start],
 							  cur->start - last->start,
-							  last->ops, mdetails);
+							  last->ops, mdetails,
+							  &state);
 
 	else
 		ret = drm_pagemap_migrate_sys_to_dev(devmem,
@@ -448,7 +520,7 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 						     &pages[last->start],
 						     &pagemap_addr[last->start],
 						     cur->start - last->start,
-						     last->ops, mdetails);
+						     last->ops, mdetails, &state);
 
 out:
 	*last = *cur;
@@ -1024,6 +1096,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 {
 	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
 	struct drm_pagemap_migrate_details mdetails = {};
+	struct dma_iova_state state = {};
 	unsigned long npages, mpages = 0;
 	struct page **pages;
 	unsigned long *src, *dst;
@@ -1065,7 +1138,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
 					    devmem_allocation->dpagemap, pagemap_addr,
 					    dst, npages, DMA_FROM_DEVICE,
-					    &mdetails);
+					    &mdetails, &state);
 	if (err)
 		goto err_finalize;
 
@@ -1089,7 +1162,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	migrate_device_pages(src, dst, npages);
 	migrate_device_finalize(src, dst, npages);
 	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, dst, npages,
-					DMA_FROM_DEVICE);
+					DMA_FROM_DEVICE, &state);
 
 err_free:
 	kvfree(buf);
@@ -1135,6 +1208,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 		.fault_page	= page,
 	};
 	struct drm_pagemap_migrate_details mdetails = {};
+	struct dma_iova_state state = {};
 	struct drm_pagemap_zdd *zdd;
 	const struct drm_pagemap_devmem_ops *ops;
 	struct device *dev = NULL;
@@ -1193,7 +1267,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 		goto err_finalize;
 
 	err = drm_pagemap_migrate_map_pages(dev, zdd->dpagemap, pagemap_addr, migrate.dst, npages,
-					    DMA_FROM_DEVICE, &mdetails);
+					    DMA_FROM_DEVICE, &mdetails, &state);
 	if (err)
 		goto err_finalize;
 
@@ -1218,7 +1292,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	migrate_vma_finalize(&migrate);
 	if (dev)
 		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, migrate.dst,
-						npages, DMA_FROM_DEVICE);
+						npages, DMA_FROM_DEVICE,
+						&state);
 err_free:
 	kvfree(buf);
 err_out:
-- 
2.34.1

