Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TboDFV1ul2lSygIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:11:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19A71623E8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA7E10E745;
	Thu, 19 Feb 2026 20:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YisfUkOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A0E10E747;
 Thu, 19 Feb 2026 20:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771531865; x=1803067865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vLS+3/69tyy/CCNJKLuC2osopajyvbMbHbdxgE+IpJ0=;
 b=YisfUkOxyV502OFUM4SNYpIjehlUROU7dcOAyixSEOnj3o4qxWx02ORm
 CV5i6PHqXI/fU7RmUlMPHAxRp1YligEf7faWAIetxj6Qt0e8xJa30qcix
 U4ZIXrNpKu9baHWQrI97jq8z7/zDvyxpyIKMQX7ICgmJBcUnqKOsf/En/
 NUSMHWbbchxhTkpYuXSeLwnJAZxkwg3zfyLdtgi6QTFIDLdubqMqjdvmL
 3vhQHoTSv7TfSrWn1s/ri0JWNIRKZELiTMgKyvxjvH4uIFNfYnjlO9med
 oVivWec4wbDN0wiFij6Q21DymLttsJMXG/QfvFCgiH+AaPg5nwv/JKsGi g==;
X-CSE-ConnectionGUID: IZxS8ZZWSIOgM8vpu4Id/Q==
X-CSE-MsgGUID: YLhDXtscQQWAJJbT+VrYIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71654301"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="71654301"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:11:04 -0800
X-CSE-ConnectionGUID: VZZciT3iTbeQbVLzhVNQBA==
X-CSE-MsgGUID: dO7l8GbkQKKmYWfxHnTM0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="214663974"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:11:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, jgg@ziepe.ca, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v5 5/5] drm/pagemap: Use dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Date: Thu, 19 Feb 2026 12:10:57 -0800
Message-Id: <20260219201057.1010391-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219201057.1010391-1-matthew.brost@intel.com>
References: <20260219201057.1010391-1-matthew.brost@intel.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A19A71623E8
X-Rspamd-Action: no action

The dma-map IOVA alloc, link, and sync APIs perform significantly better
than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
This difference is especially noticeable when mapping a 2MB region in
4KB pages.

Use the IOVA alloc, link, and sync APIs for DRM pagemap, which create DMA
mappings between the CPU and GPU for copying data.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v5:
 - Remove extra newline (Thomas)
 - Adjust alignemnt calculation (Thomas)
---
 drivers/gpu/drm/drm_pagemap.c | 83 +++++++++++++++++++++++++++++------
 1 file changed, 69 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index ef8b9c69d1d4..d9fceffce347 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -281,6 +281,19 @@ drm_pagemap_migrate_map_device_private_pages(struct device *dev,
 	return 0;
 }
 
+/**
+ * struct drm_pagemap_iova_state - DRM pagemap IOVA state
+ * @dma_state: DMA IOVA state.
+ * @offset: Current offset in IOVA.
+ *
+ * This structure acts as an iterator for packing all IOVA addresses within a
+ * contiguous range.
+ */
+struct drm_pagemap_iova_state {
+	struct dma_iova_state dma_state;
+	unsigned long offset;
+};
+
 /**
  * drm_pagemap_migrate_map_system_pages() - Map system or device coherent
  * migration pages for GPU SVM migration
@@ -289,6 +302,7 @@ drm_pagemap_migrate_map_device_private_pages(struct device *dev,
  * @migrate_pfn: Array of page frame numbers of system pages or peer pages to map.
  * @npages: Number of system or device coherent pages to map.
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ * @state: DMA IOVA state for mapping.
  *
  * This function maps pages of memory for migration usage in GPU SVM. It
  * iterates over each page frame number provided in @migrate_pfn, maps the
@@ -302,9 +316,11 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
 				     struct drm_pagemap_addr *pagemap_addr,
 				     unsigned long *migrate_pfn,
 				     unsigned long npages,
-				     enum dma_data_direction dir)
+				     enum dma_data_direction dir,
+				     struct drm_pagemap_iova_state *state)
 {
 	unsigned long i;
+	bool try_alloc = false;
 
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
@@ -319,9 +335,31 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
 		folio = page_folio(page);
 		order = folio_order(folio);
 
-		dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
-		if (dma_mapping_error(dev, dma_addr))
-			return -EFAULT;
+		if (!try_alloc) {
+			dma_iova_try_alloc(dev, &state->dma_state,
+					   (npages - i) * PAGE_SIZE >=
+					   HPAGE_PMD_SIZE ?
+					   HPAGE_PMD_SIZE : 0,
+					   npages * PAGE_SIZE);
+			try_alloc = true;
+		}
+
+		if (dma_use_iova(&state->dma_state)) {
+			int err = dma_iova_link(dev, &state->dma_state,
+						page_to_phys(page),
+						state->offset, page_size(page),
+						dir, 0);
+			if (err)
+				return err;
+
+			dma_addr = state->dma_state.addr + state->offset;
+			state->offset += page_size(page);
+		} else {
+			dma_addr = dma_map_page(dev, page, 0, page_size(page),
+						dir);
+			if (dma_mapping_error(dev, dma_addr))
+				return -EFAULT;
+		}
 
 		pagemap_addr[i] =
 			drm_pagemap_addr_encode(dma_addr,
@@ -332,6 +370,9 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
 		i += NR_PAGES(order);
 	}
 
+	if (dma_use_iova(&state->dma_state))
+		return dma_iova_sync(dev, &state->dma_state, 0, state->offset);
+
 	return 0;
 }
 
@@ -343,6 +384,7 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
  * @pagemap_addr: Array of DMA information corresponding to mapped pages
  * @npages: Number of pages to unmap
  * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
+ * @state: DMA IOVA state for mapping.
  *
  * This function unmaps previously mapped pages of memory for GPU Shared Virtual
  * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
@@ -352,10 +394,17 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 					    struct drm_pagemap_addr *pagemap_addr,
 					    unsigned long *migrate_pfn,
 					    unsigned long npages,
-					    enum dma_data_direction dir)
+					    enum dma_data_direction dir,
+					    struct drm_pagemap_iova_state *state)
 {
 	unsigned long i;
 
+	if (state && dma_use_iova(&state->dma_state)) {
+		dma_iova_unlink(dev, &state->dma_state, 0, state->offset, dir, 0);
+		dma_iova_free(dev, &state->dma_state);
+		return;
+	}
+
 	for (i = 0; i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
 
@@ -410,7 +459,7 @@ drm_pagemap_migrate_remote_to_local(struct drm_pagemap_devmem *devmem,
 			       devmem->pre_migrate_fence);
 out:
 	drm_pagemap_migrate_unmap_pages(remote_device, pagemap_addr, local_pfns,
-					npages, DMA_FROM_DEVICE);
+					npages, DMA_FROM_DEVICE, NULL);
 	return err;
 }
 
@@ -420,11 +469,13 @@ drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
 			       struct page *local_pages[],
 			       struct drm_pagemap_addr pagemap_addr[],
 			       unsigned long npages,
-			       const struct drm_pagemap_devmem_ops *ops)
+			       const struct drm_pagemap_devmem_ops *ops,
+			       struct drm_pagemap_iova_state *state)
 {
 	int err = drm_pagemap_migrate_map_system_pages(devmem->dev,
 						       pagemap_addr, sys_pfns,
-						       npages, DMA_TO_DEVICE);
+						       npages, DMA_TO_DEVICE,
+						       state);
 
 	if (err)
 		goto out;
@@ -433,7 +484,7 @@ drm_pagemap_migrate_sys_to_dev(struct drm_pagemap_devmem *devmem,
 				  devmem->pre_migrate_fence);
 out:
 	drm_pagemap_migrate_unmap_pages(devmem->dev, pagemap_addr, sys_pfns, npages,
-					DMA_TO_DEVICE);
+					DMA_TO_DEVICE, state);
 	return err;
 }
 
@@ -461,6 +512,7 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 				     const struct migrate_range_loc *cur,
 				     const struct drm_pagemap_migrate_details *mdetails)
 {
+	struct drm_pagemap_iova_state state = {};
 	int ret = 0;
 
 	if (cur->start == 0)
@@ -488,7 +540,7 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 						     &pages[last->start],
 						     &pagemap_addr[last->start],
 						     cur->start - last->start,
-						     last->ops);
+						     last->ops, &state);
 
 out:
 	*last = *cur;
@@ -993,6 +1045,7 @@ EXPORT_SYMBOL(drm_pagemap_put);
 int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 {
 	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
+	struct drm_pagemap_iova_state state = {};
 	unsigned long npages, mpages = 0;
 	struct page **pages;
 	unsigned long *src, *dst;
@@ -1034,7 +1087,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	err = drm_pagemap_migrate_map_system_pages(devmem_allocation->dev,
 						   pagemap_addr,
 						   dst, npages,
-						   DMA_FROM_DEVICE);
+						   DMA_FROM_DEVICE, &state);
 	if (err)
 		goto err_finalize;
 
@@ -1051,7 +1104,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	migrate_device_pages(src, dst, npages);
 	migrate_device_finalize(src, dst, npages);
 	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, dst, npages,
-					DMA_FROM_DEVICE);
+					DMA_FROM_DEVICE, &state);
 
 err_free:
 	kvfree(buf);
@@ -1095,6 +1148,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
 		.fault_page	= page,
 	};
+	struct drm_pagemap_iova_state state = {};
 	struct drm_pagemap_zdd *zdd;
 	const struct drm_pagemap_devmem_ops *ops;
 	struct device *dev = NULL;
@@ -1154,7 +1208,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 
 	err = drm_pagemap_migrate_map_system_pages(dev, pagemap_addr,
 						   migrate.dst, npages,
-						   DMA_FROM_DEVICE);
+						   DMA_FROM_DEVICE, &state);
 	if (err)
 		goto err_finalize;
 
@@ -1172,7 +1226,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
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

