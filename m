Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAHiEAFdeWnXwgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:49:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A19BBDE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6914010E5F5;
	Wed, 28 Jan 2026 00:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKAt8KHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA87810E5E2;
 Wed, 28 Jan 2026 00:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561331; x=1801097331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0NxnXepYvJnCu+Aw/rJcUr1rkpkNiPtq6GI1Q+r85n4=;
 b=PKAt8KHrSlMg0k8eK/wDCYcuZ4PyuVGoGZbr28pNPHfc/uJRUfuVkcmr
 f/Patgx8fH8uj2Kjp9LrlMNvpKIuuGcBKmWhp2uQCb0rdNjtmKpTBbJDt
 xH+pfmf1Tyx2AFGyt/rYMQII9aT8GHeJhfyMrUSJC6bqueS51nIJRAMKI
 arOW9iROEK1Ey+10YvyfxweNyOLR7jWgx5pi3QSGJYiMRL5Ad64a2SoT6
 aZ24jUaQtFm3M/TGeNdmFue2jCrNCxCq2JIqI+20BhW9z4y0lqSpMypSj
 6hgWnT4Mmi4LZ449IDftzri82Q7+/kXg513n9S72wQ++0/VKOsPP2yXbe g==;
X-CSE-ConnectionGUID: jfgofRd6QiCjdTi9m4qpSg==
X-CSE-MsgGUID: 3GtC/1OfQi+Kr+BtlkLLHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427528"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427528"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
X-CSE-ConnectionGUID: iL+bA0agTZ2YZTfad2mSsg==
X-CSE-MsgGUID: SbGI6e6sQZiAtakYiTi1bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822668"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 08/11] drm/pagemap: Use device-to-device IOVA alloc,
 link, and sync API for DRM pagemap
Date: Tue, 27 Jan 2026 16:48:38 -0800
Message-Id: <20260128004841.2436896-9-matthew.brost@intel.com>
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: B71A19BBDE
X-Rspamd-Action: no action

The device-to-device IOVA alloc, link, and sync APIs perform
significantly better than individual map/unmap operations, as they avoid
costly synchronization. This improvement is especially noticeable when
mapping a 2MB region using 4KB pages. In addition, IOVAs may be required
for future high-speed fabric connections between devices.

Use the IOVA alloc, link, and sync APIs for DRM pagemap, which create DMA
mappings between the devices.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 100 ++++++++++++++++++++++++++++------
 1 file changed, 83 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index a167064ce41a..aa23f7950175 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -213,6 +213,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
  * @npages: Number of system pages or peer pages to map.
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
  * @mdetails: Details governing the migration behaviour.
+ * @cookie: IOVA cookie for mapping.
  *
  * This function maps pages of memory for migration usage in GPU SVM. It
  * iterates over each page frame number provided in @migrate_pfn, maps the
@@ -228,23 +229,31 @@ drm_pagemap_migrate_map_device_pages(struct device *dev,
 				     unsigned long *migrate_pfn,
 				     unsigned long npages,
 				     enum dma_data_direction dir,
-				     const struct drm_pagemap_migrate_details *mdetails)
+				     const struct drm_pagemap_migrate_details *mdetails,
+				     void **cookie)
 {
-	unsigned long num_peer_pages = 0, num_local_pages = 0, i;
+	unsigned long num_peer_pages = 0, num_local_pages = 0, i, j;
+	struct page *dummy_page = NULL;
+	struct drm_pagemap *dpagemap;
+	bool try_alloc = false;
 
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
 		struct drm_pagemap_zdd *zdd;
-		struct drm_pagemap *dpagemap;
 		struct drm_pagemap_addr addr;
-		struct folio *folio;
 		unsigned int order = 0;
 
-		if (!page)
-			goto next;
+		if (!page) {
+			if (!dummy_page)
+				goto next;
 
-		folio = page_folio(page);
-		order = folio_order(folio);
+			page = dummy_page;
+		} else {
+			struct folio *folio;
+
+			folio = page_folio(page);
+			order = folio_order(folio);
+		}
 
 		WARN_ON_ONCE(!is_device_private_page(page));
 
@@ -260,16 +269,57 @@ drm_pagemap_migrate_map_device_pages(struct device *dev,
 			num_peer_pages += NR_PAGES(order);
 		}
 
-		addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
+		if (!try_alloc) {
+			*cookie = dpagemap->ops->device_iova_alloc(dpagemap,
+								   dev, npages *
+								   PAGE_SIZE,
+								   dir);
+			if (IS_ERR(*cookie))
+				return PTR_ERR(*cookie);
+
+			try_alloc = true;
+		}
+
+		if (page && !dummy_page && *cookie) {
+			for (j = 0; j < i; ++j) {
+				addr = dpagemap->ops->device_iova_link(dpagemap, dev,
+								       page,
+								       PAGE_SIZE,
+								       j * PAGE_SIZE,
+								       *cookie, dir);
+				if (dma_mapping_error(dev, addr.addr))
+					return -EFAULT;
+			}
+		}
+
+		if (*cookie)
+			addr = dpagemap->ops->device_iova_link(dpagemap, dev,
+							       page,
+							       PAGE_SHIFT << order,
+							       i * PAGE_SIZE,
+							       *cookie, dir);
+		else
+			addr = dpagemap->ops->device_map(dpagemap, dev, page,
+							 order, dir);
 		if (dma_mapping_error(dev, addr.addr))
 			return -EFAULT;
 
-		pagemap_addr[i] = addr;
+		if (page != dummy_page)
+			pagemap_addr[i] = addr;
+		dummy_page = page;
 
 next:
 		i += NR_PAGES(order);
 	}
 
+	if (*cookie) {
+		int err = dpagemap->ops->device_iova_sync(dpagemap, dev,
+							  npages * PAGE_SIZE,
+							  *cookie);
+		if (err)
+			return err;
+	}
+
 	if (num_peer_pages)
 		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
 			num_peer_pages);
@@ -424,6 +474,7 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
  * @npages: Number of pages to unmap
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
  * @state: DMA IOVA state for mapping.
+ * @cookie: IOVA cookie for mapping.
  *
  * This function unmaps previously mapped pages of memory for GPU Shared Virtual
  * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
@@ -434,7 +485,8 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 					    unsigned long *migrate_pfn,
 					    unsigned long npages,
 					    enum dma_data_direction dir,
-					    struct dma_iova_state *state)
+					    struct dma_iova_state *state,
+					    void *cookie)
 {
 	unsigned long i;
 
@@ -453,7 +505,20 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 			struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
 			struct drm_pagemap *dpagemap = zdd->dpagemap;
 
-			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
+			if (cookie) {
+				dpagemap->ops->device_iova_unlink(dpagemap, dev,
+								  npages *
+								  PAGE_SIZE,
+								  cookie, dir);
+				dpagemap->ops->device_iova_free(dpagemap, dev,
+								npages *
+								PAGE_SIZE,
+								cookie);
+				return;
+			} else {
+				dpagemap->ops->device_unmap(dpagemap, dev,
+							    pagemap_addr[i]);
+			}
 		} else {
 			dma_unmap_page(dev, pagemap_addr[i].addr,
 				       PAGE_SIZE << pagemap_addr[i].order, dir);
@@ -483,11 +548,12 @@ drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
 				    struct dma_iova_state *state)
 
 {
+	void *cookie = NULL;
 	int err = drm_pagemap_migrate_map_device_pages(remote_device,
 						       remote_dpagemap,
 						       pagemap_addr, local_pfns,
 						       npages, DMA_FROM_DEVICE,
-						       mdetails);
+						       mdetails, &cookie);
 	if (err)
 		goto out;
 
@@ -495,7 +561,7 @@ drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
 			       devmem->pre_migrate_fence);
 out:
 	drm_pagemap_migrate_unmap_pages(remote_device, pagemap_addr, local_pfns,
-					npages, DMA_FROM_DEVICE, state);
+					npages, DMA_FROM_DEVICE, state, cookie);
 	return err;
 }
 
@@ -520,7 +586,7 @@ drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
 				  devmem->pre_migrate_fence);
 out:
 	drm_pagemap_migrate_unmap_pages(devmem->dev, pagemap_addr, sys_pfns, npages,
-					DMA_TO_DEVICE, state);
+					DMA_TO_DEVICE, state, NULL);
 	return err;
 }
 
@@ -1153,7 +1219,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	migrate_device_pages(src, dst, npages);
 	migrate_device_finalize(src, dst, npages);
 	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, dst, npages,
-					DMA_FROM_DEVICE, &state);
+					DMA_FROM_DEVICE, &state, NULL);
 
 err_free:
 	kvfree(buf);
@@ -1276,7 +1342,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	if (dev)
 		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, migrate.dst,
 						npages, DMA_FROM_DEVICE,
-						&state);
+						&state, NULL);
 err_free:
 	kvfree(buf);
 err_out:
-- 
2.34.1

