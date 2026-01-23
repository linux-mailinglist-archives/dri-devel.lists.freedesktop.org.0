Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /w29Mj/sc2mkzgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:46:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FEF7AF6D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEE910EBDE;
	Fri, 23 Jan 2026 21:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQR4HYE/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD38610EBDE;
 Fri, 23 Jan 2026 21:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769204793; x=1800740793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f0DgmiKLm1N1HWuVFxglJkMMbpQz0oPj2WcVIPj1p/Y=;
 b=gQR4HYE/3GnqWp0laeHu2dydTtIQk9H/J1dZbSN6+aQDkCdE4sOat+M+
 ENQah78zR0S/6SucamnGyXj0cO2wlpsJc3tgCe/mEbIrxLOtLvTSc7/Td
 VkCmGc8APPzZmgpm5/aiSWohtWNUKcbZyC0cHgUZOiwEr7KWJvvM1k751
 8yvLGbzpBKy+dPIOrvV3I8cD5kHvmeaB9WjUQJuGryvK5upGxlF4jeVHw
 7k5p92AKcXyhtqiRNk5XDfoWip6qOSErKNIgn2ss9U/C7B2IA6MO2QuRd
 3G2N+56yKBf9InJTJEpbS5MNaAFpuCcrJ05r7oxGxb5Bw5ArGBuli28w6 g==;
X-CSE-ConnectionGUID: xEE+SdpcSpyuQjLKaXPYZw==
X-CSE-MsgGUID: VIcJSNy3RKGvFzUJLsyxcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74323570"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="74323570"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:46:31 -0800
X-CSE-ConnectionGUID: Rc3ltQmRSFC7g0T5kyDhfA==
X-CSE-MsgGUID: u6X8k2gkQMylimXBoz/ZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207169226"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:46:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH 1/2] drm/gpusvm: Use new dma-map IOVA alloc, link,
 and sync API in GPU SVM
Date: Fri, 23 Jan 2026 13:46:24 -0800
Message-Id: <20260123214625.1612365-2-matthew.brost@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
X-Rspamd-Queue-Id: A3FEF7AF6D
X-Rspamd-Action: no action

The dma-map IOVA alloc, link, and sync APIs perform significantly better
than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
This difference is especially noticeable when mapping a 2MB region in
4KB pages.

Use the IOVA alloc, link, and sync APIs for GPU SVM, which create DMA
mappings between the CPU and GPU.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 63 +++++++++++++++++++++++++-----------
 include/drm/drm_gpusvm.h     |  3 ++
 2 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 585d913d3d19..eff764445108 100644
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
 
@@ -1408,6 +1416,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	struct drm_gpusvm_pages_flags flags;
 	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
 							   DMA_BIDIRECTIONAL;
+	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
 	if (time_after(jiffies, timeout))
@@ -1539,13 +1548,29 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
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
+				dma_iova_try_alloc(gpusvm->drm->dev, state, 0,
+						   npages * PAGE_SIZE);
+
+			if (dma_use_iova(state)) {
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

