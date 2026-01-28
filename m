Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNIJNP5ceWnXwgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:49:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839DC9BBC9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4814D10E5ED;
	Wed, 28 Jan 2026 00:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3aBqhkl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7C410E5DB;
 Wed, 28 Jan 2026 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561329; x=1801097329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wR5eJaE3er7aH+UrHNNk29s7/Z2nV9gpmyRYENcx3w0=;
 b=S3aBqhklMFXdedBDNFoW3DKtuET5p4PcCWUKTODdgg2yBatigHbt7JAj
 5FU78776crqMFQgn7BrcqUHMORlzv1t3uhUCH5FtzlCiENdrrXzMJMCdU
 bbFcfmT2mqfUQp1hGQhHp5n87CELx+CEG0N3L0nHjZiTWfll4/cPoDZqU
 ozq0v73tAxwxNYFrnujM2kOLHmyh7LQ0Mtplgo/wfEq05sxlxjoz+MJw5
 492JcWLRWP/tAkKhL9fsiE19XkgzbwXxP3XINLFIJOcC1VHyWwdjBOn3j
 edD3DZgBDmmeuyR3o1m5Oh2hGS/d88mH4pXyr/m0HJ3vQUbj9SNo3GU4c g==;
X-CSE-ConnectionGUID: kWTETeBHTT6A/WLgmFmGNg==
X-CSE-MsgGUID: +zHDm7VkSEaWzY5tS25BPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427506"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427506"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
X-CSE-ConnectionGUID: ozqqd8c8SXGVmbr/GdvFsQ==
X-CSE-MsgGUID: SkWOAK5fTkuNt93I+LpkzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822642"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 02/11] drm/gpusvm: Use dma-map IOVA alloc, link,
 and sync API in GPU SVM
Date: Tue, 27 Jan 2026 16:48:32 -0800
Message-Id: <20260128004841.2436896-3-matthew.brost@intel.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
X-Rspamd-Queue-Id: 839DC9BBC9
X-Rspamd-Action: no action

The dma-map IOVA alloc, link, and sync APIs perform significantly better
than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
This difference is especially noticeable when mapping a 2MB region in
4KB pages.

Use the IOVA alloc, link, and sync APIs for GPU SVM, which create DMA
mappings between the CPU and GPU.

v3:
 - Always link IOVA in mixed mappings
 - Sync IOVA

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 87 ++++++++++++++++++++++++++++--------
 include/drm/drm_gpusvm.h     |  3 ++
 2 files changed, 71 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 585d913d3d19..084e78fa0f32 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1139,19 +1139,26 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 		struct drm_gpusvm_pages_flags flags = {
 			.__flags = svm_pages->flags.__flags,
 		};
+		struct dma_iova_state __state = {};
 
-		for (i = 0, j = 0; i < npages; j++) {
-			struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
-
-			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
-				dma_unmap_page(dev,
-					       addr->addr,
-					       PAGE_SIZE << addr->order,
-					       addr->dir);
-			else if (dpagemap && dpagemap->ops->device_unmap)
-				dpagemap->ops->device_unmap(dpagemap,
-							    dev, *addr);
-			i += 1 << addr->order;
+		if (dma_use_iova(&svm_pages->state)) {
+			dma_iova_destroy(dev, &svm_pages->state,
+					 npages * PAGE_SIZE,
+					 svm_pages->dma_addr[0].dir, 0);
+		} else {
+			for (i = 0, j = 0; i < npages; j++) {
+				struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
+
+				if (addr->proto == DRM_INTERCONNECT_SYSTEM)
+					dma_unmap_page(dev,
+						       addr->addr,
+						       PAGE_SIZE << addr->order,
+						       addr->dir);
+				else if (dpagemap && dpagemap->ops->device_unmap)
+					dpagemap->ops->device_unmap(dpagemap,
+								    dev, *addr);
+				i += 1 << addr->order;
+			}
 		}
 
 		/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
@@ -1161,6 +1168,7 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 
 		drm_pagemap_put(svm_pages->dpagemap);
 		svm_pages->dpagemap = NULL;
+		svm_pages->state = __state;
 	}
 }
 
@@ -1402,12 +1410,14 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	unsigned long num_dma_mapped;
 	unsigned int order = 0;
 	unsigned long *pfns;
+	phys_addr_t last_phys;
 	int err = 0;
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
 	struct drm_gpusvm_pages_flags flags;
 	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
 							   DMA_BIDIRECTIONAL;
+	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
 	if (time_after(jiffies, timeout))
@@ -1496,6 +1506,17 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 				err = -EOPNOTSUPP;
 				goto err_unmap;
 			}
+
+			if (dma_use_iova(state)) {
+				err = dma_iova_link(gpusvm->drm->dev, state,
+						    last_phys,
+						    i * PAGE_SIZE,
+						    PAGE_SIZE << order,
+						    dma_dir, 0);
+				if (err)
+					goto err_unmap;
+			}
+
 			zdd = __zdd;
 			if (pagemap != page_pgmap(page)) {
 				if (i > 0) {
@@ -1539,13 +1560,34 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 				goto err_unmap;
 			}
 
-			addr = dma_map_page(gpusvm->drm->dev,
-					    page, 0,
-					    PAGE_SIZE << order,
-					    dma_dir);
-			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
-				err = -EFAULT;
-				goto err_unmap;
+			if (!i)
+				dma_iova_try_alloc(gpusvm->drm->dev, state,
+						   npages * PAGE_SIZE >=
+						   HPAGE_PMD_SIZE ?
+						   HPAGE_PMD_SIZE : 0,
+						   npages * PAGE_SIZE);
+
+			if (dma_use_iova(state)) {
+				last_phys = page_to_phys(page);
+
+				err = dma_iova_link(gpusvm->drm->dev, state,
+						    page_to_phys(page),
+						    i * PAGE_SIZE,
+						    PAGE_SIZE << order,
+						    dma_dir, 0);
+				if (err)
+					goto err_unmap;
+
+				addr = state->addr + i * PAGE_SIZE;
+			} else {
+				addr = dma_map_page(gpusvm->drm->dev,
+						    page, 0,
+						    PAGE_SIZE << order,
+						    dma_dir);
+				if (dma_mapping_error(gpusvm->drm->dev, addr)) {
+					err = -EFAULT;
+					goto err_unmap;
+				}
 			}
 
 			svm_pages->dma_addr[j] = drm_pagemap_addr_encode
@@ -1557,6 +1599,13 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		flags.has_dma_mapping = true;
 	}
 
+	if (dma_use_iova(state)) {
+		err = dma_iova_sync(gpusvm->drm->dev, state, 0,
+				    npages * PAGE_SIZE);
+		if (err)
+			goto err_unmap;
+	}
+
 	if (pagemap) {
 		flags.has_devmem_pages = true;
 		drm_pagemap_get(dpagemap);
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 2578ac92a8d4..6772d8a92788 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -6,6 +6,7 @@
 #ifndef __DRM_GPUSVM_H__
 #define __DRM_GPUSVM_H__
 
+#include <linux/dma-mapping.h>
 #include <linux/kref.h>
 #include <linux/interval_tree.h>
 #include <linux/mmu_notifier.h>
@@ -136,6 +137,7 @@ struct drm_gpusvm_pages_flags {
  * @dma_addr: Device address array
  * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
  *            Note this is assuming only one drm_pagemap per range is allowed.
+ * @state: DMA IOVA state for mapping.
  * @notifier_seq: Notifier sequence number of the range's pages
  * @flags: Flags for range
  * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
@@ -147,6 +149,7 @@ struct drm_gpusvm_pages_flags {
 struct drm_gpusvm_pages {
 	struct drm_pagemap_addr *dma_addr;
 	struct drm_pagemap *dpagemap;
+	struct dma_iova_state state;
 	unsigned long notifier_seq;
 	struct drm_gpusvm_pages_flags flags;
 };
-- 
2.34.1

