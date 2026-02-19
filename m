Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNhaOWJul2lSygIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:11:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79692162404
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795CC10E755;
	Thu, 19 Feb 2026 20:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXoSZ7WK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C5310E747;
 Thu, 19 Feb 2026 20:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771531865; x=1803067865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ix5dIBktGNCcAltxmPRegj/scP6xsvtjh/oUXWdL3Kk=;
 b=kXoSZ7WK1F/0Jb/vpI3mkz2g38Ntfb1SXLPpttpvqXCTv+3NglXAwQs/
 arh8HbyOXyTzYdoatczJrpNOttwjP9PcMxDmTuVfWNslF9JzDyXvO1hR6
 J008o4L/ywRYWvKKLHo/ShITjvYgmgE7A1izZQgksa44Cc+6ZWFRkXpWo
 LkqHuYI2Y1ojx6N4EpEfefT6Ns9xxufxuteXfxUmoxjwK9/AmU4LGkg7C
 3SW9xl8n/bDqce9Xtm0hT7eiyySE5+nLhdX/YEvHQlSboUa5tpLx4F1ja
 O9ZmKbANbpS/Y3q6XIkZcJoIDCD6dRsoZTHD2H0Uhm7ngqU0UO14koQ4p A==;
X-CSE-ConnectionGUID: wZgGtFS3QTmXan+OgOaYcw==
X-CSE-MsgGUID: pxdvjmKdRYOW2J0WuYBbyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71654288"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="71654288"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:11:04 -0800
X-CSE-ConnectionGUID: vtnJ/Jd4RMGupm29xzxToA==
X-CSE-MsgGUID: OcblteSNT3+12vvmrmLXwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="214663963"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:11:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, jgg@ziepe.ca, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v5 2/5] drm/gpusvm: Use dma-map IOVA alloc, link,
 and sync API in GPU SVM
Date: Thu, 19 Feb 2026 12:10:54 -0800
Message-Id: <20260219201057.1010391-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219201057.1010391-1-matthew.brost@intel.com>
References: <20260219201057.1010391-1-matthew.brost@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 79692162404
X-Rspamd-Action: no action

The dma-map IOVA alloc, link, and sync APIs perform significantly better
than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
This difference is especially noticeable when mapping a 2MB region in
4KB pages.

Use the IOVA alloc, link, and sync APIs for GPU SVM, which create DMA
mappings between the CPU and GPU.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 55 ++++++++++++++++++++++++++++++------
 include/drm/drm_gpusvm.h     |  5 ++++
 2 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 1490d1929b1a..e406ceb8d000 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1139,11 +1139,19 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 		struct drm_gpusvm_pages_flags flags = {
 			.__flags = svm_pages->flags.__flags,
 		};
+		bool use_iova = dma_use_iova(&svm_pages->state);
+
+		if (use_iova) {
+			dma_iova_unlink(dev, &svm_pages->state, 0,
+					svm_pages->state_offset,
+					svm_pages->dma_addr[0].dir, 0);
+			dma_iova_free(dev, &svm_pages->state);
+		}
 
 		for (i = 0, j = 0; i < npages; j++) {
 			struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
 
-			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
+			if (!use_iova && addr->proto == DRM_INTERCONNECT_SYSTEM)
 				dma_unmap_page(dev,
 					       addr->addr,
 					       PAGE_SIZE << addr->order,
@@ -1408,6 +1416,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	struct drm_gpusvm_pages_flags flags;
 	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
 							   DMA_BIDIRECTIONAL;
+	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
 	if (time_after(jiffies, timeout))
@@ -1446,6 +1455,9 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	if (err)
 		goto err_free;
 
+	*state = (struct dma_iova_state){};
+	svm_pages->state_offset = 0;
+
 map_pages:
 	/*
 	 * Perform all dma mappings under the notifier lock to not
@@ -1539,13 +1551,33 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
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
+				err = dma_iova_link(gpusvm->drm->dev, state,
+						    hmm_pfn_to_phys(pfns[i]),
+						    svm_pages->state_offset,
+						    PAGE_SIZE << order,
+						    dma_dir, 0);
+				if (err)
+					goto err_unmap;
+
+				addr = state->addr + svm_pages->state_offset;
+				svm_pages->state_offset += PAGE_SIZE << order;
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
@@ -1557,6 +1589,13 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		flags.has_dma_mapping = true;
 	}
 
+	if (dma_use_iova(state)) {
+		err = dma_iova_sync(gpusvm->drm->dev, state, 0,
+				    svm_pages->state_offset);
+		if (err)
+			goto err_unmap;
+	}
+
 	if (pagemap) {
 		flags.has_devmem_pages = true;
 		drm_pagemap_get(dpagemap);
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 2578ac92a8d4..cd94bb2ee6ee 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -6,6 +6,7 @@
 #ifndef __DRM_GPUSVM_H__
 #define __DRM_GPUSVM_H__
 
+#include <linux/dma-mapping.h>
 #include <linux/kref.h>
 #include <linux/interval_tree.h>
 #include <linux/mmu_notifier.h>
@@ -136,6 +137,8 @@ struct drm_gpusvm_pages_flags {
  * @dma_addr: Device address array
  * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
  *            Note this is assuming only one drm_pagemap per range is allowed.
+ * @state: DMA IOVA state for mapping.
+ * @state_offset: DMA IOVA offset for mapping.
  * @notifier_seq: Notifier sequence number of the range's pages
  * @flags: Flags for range
  * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
@@ -147,6 +150,8 @@ struct drm_gpusvm_pages_flags {
 struct drm_gpusvm_pages {
 	struct drm_pagemap_addr *dma_addr;
 	struct drm_pagemap *dpagemap;
+	struct dma_iova_state state;
+	unsigned long state_offset;
 	unsigned long notifier_seq;
 	struct drm_gpusvm_pages_flags flags;
 };
-- 
2.34.1

