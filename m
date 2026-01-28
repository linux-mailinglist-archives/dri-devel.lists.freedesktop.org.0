Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GfPEP1ceWnXwgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:49:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B6D9BBBB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB9910E5EC;
	Wed, 28 Jan 2026 00:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCgpLBQN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A157110E5DB;
 Wed, 28 Jan 2026 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561329; x=1801097329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y4PpO7PHRFsC0eit5/lCeAiSY6wF9F7ARuMYCrh88Oc=;
 b=QCgpLBQNHXO6w6pzTawMQsPppF72m74mRhGBwGG/0ugS1TotSnyYg5O8
 RHlMniRolSIzd5Cjem/L3JiQzKUQIrc5+Z1OvUpOM1/akxYuSpx4kc+e4
 mjM0XHOne3jlgFY/v3IMti4EG+Dayp+wjq64UrTqS17M+fN85Zno7AkHO
 85xRUt0RoRmPn/k7WhUOv1BjU+nJ5hxm+PSomjURyAsmsFV8MIGBwk1wu
 840ZkAd0E44QmVBZ62HlnLERlJnbOHh58axLIGOWZFFyZRiMMAUqglNDd
 rWNpyXUL2PGHKXSlRJpN35sbfWEoJie0YsF2k0DHkAr+OAqI9ak87qLaD A==;
X-CSE-ConnectionGUID: pNDEMKEzRgO5rQ/5qsBT7A==
X-CSE-MsgGUID: ZDNbC9/XQHmp6LqVJeoFHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427515"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427515"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
X-CSE-ConnectionGUID: cQeVMp7DQEyfjxI0QMQ7gw==
X-CSE-MsgGUID: E3fS75akRSqxunlbROQdQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822652"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 04/11] drm/pagemap: Use dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Date: Tue, 27 Jan 2026 16:48:34 -0800
Message-Id: <20260128004841.2436896-5-matthew.brost@intel.com>
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
X-Rspamd-Queue-Id: E5B6D9BBBB
X-Rspamd-Action: no action

The dma-map IOVA alloc, link, and sync APIs perform significantly better
than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
This difference is especially noticeable when mapping a 2MB region in
4KB pages.

Use the IOVA alloc, link, and sync APIs for DRM pagemap, which create DMA
mappings between the CPU and GPU for copying data.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 121 +++++++++++++++++++++++++++-------
 1 file changed, 96 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 4b79d4019453..b928c89f4bd1 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -287,6 +287,7 @@ drm_pagemap_migrate_map_device_pages(struct device *dev,
  * @migrate_pfn: Array of page frame numbers of system pages or peer pages to map.
  * @npages: Number of system pages or peer pages to map.
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ * @state: DMA IOVA state for mapping.
  *
  * This function maps pages of memory for migration usage in GPU SVM. It
  * iterates over each page frame number provided in @migrate_pfn, maps the
@@ -300,26 +301,79 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
 				     struct drm_pagemap_addr *pagemap_addr,
 				     unsigned long *migrate_pfn,
 				     unsigned long npages,
-				     enum dma_data_direction dir)
+				     enum dma_data_direction dir,
+				     struct dma_iova_state *state)
 {
-	unsigned long i;
+	struct page *dummy_page = NULL;
+	unsigned long i, psize;
+	bool try_alloc = false;
 
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
-		dma_addr_t dma_addr;
-		struct folio *folio;
+		dma_addr_t dma_addr = -1;
 		unsigned int order = 0;
 
-		if (!page)
-			goto next;
+		if (!page) {
+			if (!dummy_page)
+				goto next;
 
-		WARN_ON_ONCE(is_device_private_page(page));
-		folio = page_folio(page);
-		order = folio_order(folio);
+			page = dummy_page;
+			psize = PAGE_SIZE;
+		} else {
+			struct folio *folio;
 
-		dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
-		if (dma_mapping_error(dev, dma_addr))
-			return -EFAULT;
+			WARN_ON_ONCE(is_device_private_page(page));
+			folio = page_folio(page);
+			order = folio_order(folio);
+			psize = page_size(page);
+		}
+
+		if (!try_alloc) {
+			dma_iova_try_alloc(dev, state,
+					   npages * PAGE_SIZE >=
+					   HPAGE_PMD_SIZE ?
+					   HPAGE_PMD_SIZE : 0,
+					   npages * PAGE_SIZE);
+			try_alloc = true;
+		}
+
+		if (dma_use_iova(state)) {
+			bool found_dummy = page && !dummy_page;
+			int err;
+
+			if (found_dummy) {
+				unsigned long j;
+
+				for (j = 0; j < i; ++j) {
+					err = dma_iova_link(dev, state,
+							    page_to_phys(page),
+							    j * PAGE_SIZE,
+							    PAGE_SIZE, dir, 0);
+					if (err)
+						return err;
+				}
+			}
+
+			err = dma_iova_link(dev, state, page_to_phys(page),
+					    i * PAGE_SIZE, psize,
+					    dir, 0);
+			if (err)
+				return err;
+
+			if (page != dummy_page)
+				dma_addr = state->addr + i * PAGE_SIZE;
+
+			if (found_dummy)
+				dummy_page = page;
+		} else {
+			dma_addr = dma_map_page(dev, page, 0, page_size(page),
+						dir);
+			if (dma_mapping_error(dev, dma_addr))
+				return -EFAULT;
+		}
+
+		if (dma_addr == -1)
+			goto next;
 
 		pagemap_addr[i] =
 			drm_pagemap_addr_encode(dma_addr,
@@ -330,6 +384,9 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
 		i += NR_PAGES(order);
 	}
 
+	if (dma_use_iova(state))
+		return dma_iova_sync(dev, state, 0, npages * PAGE_SIZE);
+
 	return 0;
 }
 
@@ -341,6 +398,7 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
  * @pagemap_addr: Array of DMA information corresponding to mapped pages
  * @npages: Number of pages to unmap
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ * @state: DMA IOVA state for mapping.
  *
  * This function unmaps previously mapped pages of memory for GPU Shared Virtual
  * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
@@ -350,10 +408,16 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
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
 
@@ -390,7 +454,8 @@ drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
 				    struct drm_pagemap_addr pagemap_addr[],
 				    unsigned long npages,
 				    const struct drm_pagemap_devmem_ops *ops,
-				    const struct drm_pagemap_migrate_details *mdetails)
+				    const struct drm_pagemap_migrate_details *mdetails,
+				    struct dma_iova_state *state)
 
 {
 	int err = drm_pagemap_migrate_map_device_pages(remote_device,
@@ -398,7 +463,6 @@ drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
 						       pagemap_addr, local_pfns,
 						       npages, DMA_FROM_DEVICE,
 						       mdetails);
-
 	if (err)
 		goto out;
 
@@ -406,7 +470,7 @@ drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
 			       devmem->pre_migrate_fence);
 out:
 	drm_pagemap_migrate_unmap_pages(remote_device, pagemap_addr, local_pfns,
-					npages, DMA_FROM_DEVICE);
+					npages, DMA_FROM_DEVICE, state);
 	return err;
 }
 
@@ -416,11 +480,13 @@ drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
 			       struct page *local_pages[],
 			       struct drm_pagemap_addr pagemap_addr[],
 			       unsigned long npages,
-			       const struct drm_pagemap_devmem_ops *ops)
+			       const struct drm_pagemap_devmem_ops *ops,
+			       struct dma_iova_state *state)
 {
 	int err = drm_pagemap_migrate_map_system_pages(devmem->dev,
 						       pagemap_addr, sys_pfns,
-						       npages, DMA_TO_DEVICE);
+						       npages, DMA_TO_DEVICE,
+						       state);
 
 	if (err)
 		goto out;
@@ -429,7 +495,7 @@ drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
 				  devmem->pre_migrate_fence);
 out:
 	drm_pagemap_migrate_unmap_pages(devmem->dev, pagemap_addr, sys_pfns, npages,
-					DMA_TO_DEVICE);
+					DMA_TO_DEVICE, state);
 	return err;
 }
 
@@ -457,6 +523,7 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 				     const struct migrate_range_loc *cur,
 				     const struct drm_pagemap_migrate_details *mdetails)
 {
+	struct dma_iova_state state = {};
 	int ret = 0;
 
 	if (cur->start == 0)
@@ -476,7 +543,8 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 							  &pages[last->start],
 							  &pagemap_addr[last->start],
 							  cur->start - last->start,
-							  last->ops, mdetails);
+							  last->ops, mdetails,
+							  &state);
 
 	else
 		ret = drm_pagemap_migrate_sys_to_dev(devmem,
@@ -484,7 +552,7 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 						     &pages[last->start],
 						     &pagemap_addr[last->start],
 						     cur->start - last->start,
-						     last->ops);
+						     last->ops, &state);
 
 out:
 	*last = *cur;
@@ -1001,6 +1069,7 @@ EXPORT_SYMBOL(drm_pagemap_put);
 int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 {
 	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
+	struct dma_iova_state state = {};
 	unsigned long npages, mpages = 0;
 	struct page **pages;
 	unsigned long *src, *dst;
@@ -1042,7 +1111,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	err = drm_pagemap_migrate_map_system_pages(devmem_allocation->dev,
 						   pagemap_addr,
 						   dst, npages,
-						   DMA_FROM_DEVICE);
+						   DMA_FROM_DEVICE, &state);
 	if (err)
 		goto err_finalize;
 
@@ -1059,7 +1128,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	migrate_device_pages(src, dst, npages);
 	migrate_device_finalize(src, dst, npages);
 	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, dst, npages,
-					DMA_FROM_DEVICE);
+					DMA_FROM_DEVICE, &state);
 
 err_free:
 	kvfree(buf);
@@ -1103,6 +1172,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
 		.fault_page	= page,
 	};
+	struct dma_iova_state state = {};
 	struct drm_pagemap_zdd *zdd;
 	const struct drm_pagemap_devmem_ops *ops;
 	struct device *dev = NULL;
@@ -1162,7 +1232,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 
 	err = drm_pagemap_migrate_map_system_pages(dev, pagemap_addr,
 						   migrate.dst, npages,
-						   DMA_FROM_DEVICE);
+						   DMA_FROM_DEVICE, &state);
 	if (err)
 		goto err_finalize;
 
@@ -1180,7 +1250,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
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

