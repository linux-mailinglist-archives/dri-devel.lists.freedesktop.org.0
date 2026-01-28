Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK0eAv5ceWnXwgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:49:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89419BBC2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095E410E5EB;
	Wed, 28 Jan 2026 00:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVcI9Rmn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1413710E5E3;
 Wed, 28 Jan 2026 00:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561331; x=1801097331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KV8Hu/P+hL8vLy5UAg2+wcV5+Lto4RMQxyZNRVWdD2I=;
 b=MVcI9RmnE/4RZKETs3zsKJbKCISQ4nrbUP0BsTZarrTgEPH42Nh2ErGm
 3+918OwTmLRSJRG98qMKAxR+6OfrjKF+NSldYSomVS7b0ujWjFseu2okF
 hi0SNWgZp03f26mOCBBKODoRs/PIAoyAXOfmDaV0ADwMnpWY8BFHDq0lA
 f4Oi5AVYsi6osbTvzW2T0+UGNG55o/EuZ3CQhAyeCjaXxy+ee7ke8zkQq
 72Iw0G9kU6NB6IwI5nG867L2J5FQqjglHofqm838ugun9ThbAg1Dq0B13
 aQcfA3efzjdshhrxMm2B8apIy9yjxdjffrTPX9XrvJEmQm1llbLqzg5rO w==;
X-CSE-ConnectionGUID: 5Qd0rWT1Q2axs+TcvOU++g==
X-CSE-MsgGUID: Da8hWxVvSFOfgXKVQK709Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427536"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427536"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
X-CSE-ConnectionGUID: puJiv9ftSQ2OhXq1mTceew==
X-CSE-MsgGUID: 2DQgme4nTzumdgVUIX1irA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822679"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 11/11] drm/gpusvm: Use device-to-device IOVA alloc, link,
 and sync API in GPU SVM
Date: Tue, 27 Jan 2026 16:48:41 -0800
Message-Id: <20260128004841.2436896-12-matthew.brost@intel.com>
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
X-Rspamd-Queue-Id: A89419BBC2
X-Rspamd-Action: no action

The device-to-device IOVA alloc, link, and sync APIs perform
significantly better than individual map/unmap operations, as they
avoid costly synchronization. This improvement is especially noticeable
when mapping a 2MB region using 4KB pages. In addition, IOVAs may be
required for future high-speed fabric connections between devices.

Use the IOVA alloc, link, and sync APIs for GPU SVM, which create DMA
mappings between the devices.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 100 ++++++++++++++++++++++++++++++++---
 include/drm/drm_gpusvm.h     |   2 +
 2 files changed, 95 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 084e78fa0f32..59de50d030b3 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1142,9 +1142,19 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 		struct dma_iova_state __state = {};
 
 		if (dma_use_iova(&svm_pages->state)) {
+			drm_WARN_ON(gpusvm->drm, svm_pages->iova_cookie);
+
 			dma_iova_destroy(dev, &svm_pages->state,
 					 npages * PAGE_SIZE,
 					 svm_pages->dma_addr[0].dir, 0);
+		} else if (svm_pages->iova_cookie) {
+			struct drm_pagemap_addr *addr = &svm_pages->dma_addr[0];
+
+			dpagemap->ops->device_iova_unlink(dpagemap, dev,
+							  npages *
+							  PAGE_SIZE,
+							  svm_pages->iova_cookie,
+							  addr->dir);
 		} else {
 			for (i = 0, j = 0; i < npages; j++) {
 				struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
@@ -1166,8 +1176,10 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 		flags.has_dma_mapping = false;
 		WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
 
-		drm_pagemap_put(svm_pages->dpagemap);
-		svm_pages->dpagemap = NULL;
+		if (!svm_pages->iova_cookie) {
+			drm_pagemap_put(svm_pages->dpagemap);
+			svm_pages->dpagemap = NULL;
+		}
 		svm_pages->state = __state;
 	}
 }
@@ -1190,6 +1202,28 @@ static void __drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
 	}
 }
 
+/**
+ * drm_gpusvm_pages_iova_free() - Free IOVA associated with GPU SVM pages
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
+ * @size: Size of IOVA to free
+ *
+ * This function frees the IOVA associated with a GPU SVM range.
+ */
+static void drm_gpusvm_pages_iova_free(struct drm_gpusvm *gpusvm,
+				       struct drm_gpusvm_pages *svm_pages,
+				       size_t size)
+{
+	if (svm_pages->iova_cookie) {
+		struct drm_pagemap *dpagemap = svm_pages->dpagemap;
+
+		dpagemap->ops->device_iova_free(dpagemap, gpusvm->drm->dev,
+						size, svm_pages->iova_cookie);
+		drm_pagemap_put(dpagemap);
+		svm_pages->dpagemap = NULL;
+	}
+}
+
 /**
  * drm_gpusvm_free_pages() - Free dma-mapping associated with GPU SVM pages
  * struct
@@ -1208,6 +1242,8 @@ void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
 	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
 	__drm_gpusvm_free_pages(gpusvm, svm_pages);
 	drm_gpusvm_notifier_unlock(gpusvm);
+
+	drm_gpusvm_pages_iova_free(gpusvm, svm_pages, npages * PAGE_SIZE);
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_free_pages);
 
@@ -1241,6 +1277,8 @@ void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
 	__drm_gpusvm_range_remove(notifier, range);
 	drm_gpusvm_notifier_unlock(gpusvm);
 
+	drm_gpusvm_pages_iova_free(gpusvm, &range->pages,
+				   drm_gpusvm_range_size(range));
 	drm_gpusvm_range_put(range);
 
 	if (RB_EMPTY_ROOT(&notifier->root.rb_root)) {
@@ -1418,6 +1456,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
 							   DMA_BIDIRECTIONAL;
 	struct dma_iova_state *state = &svm_pages->state;
+	bool try_alloc;
 
 retry:
 	if (time_after(jiffies, timeout))
@@ -1427,6 +1466,9 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
 
+	drm_gpusvm_pages_iova_free(gpusvm, svm_pages, npages * PAGE_SIZE);
+	try_alloc = false;
+
 	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
 	if (!pfns)
 		return -ENOMEM;
@@ -1535,12 +1577,47 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 					err = -EAGAIN;
 					goto err_unmap;
 				}
+
+				if (!try_alloc) {
+					void *iova_cookie;
+
+					/* Unlock and restart mapping to allocate IOVA. */
+					drm_gpusvm_notifier_unlock(gpusvm);
+
+					drm_WARN_ON(gpusvm->drm,
+						    svm_pages->iova_cookie);
+
+					iova_cookie =
+						dpagemap->ops->device_iova_alloc(dpagemap,
+										 gpusvm->drm->dev,
+										 npages * PAGE_SIZE,
+										 dma_dir);
+					if (IS_ERR(iova_cookie)) {
+						err = PTR_ERR(iova_cookie);
+						goto err_unmap;
+					}
+
+					svm_pages->iova_cookie = iova_cookie;
+					try_alloc = true;
+					goto map_pages;
+				}
 			}
-			svm_pages->dma_addr[j] =
-				dpagemap->ops->device_map(dpagemap,
-							  gpusvm->drm->dev,
-							  page, order,
-							  dma_dir);
+
+			if (svm_pages->iova_cookie)
+				svm_pages->dma_addr[j] =
+					dpagemap->ops->device_iova_link(dpagemap,
+									gpusvm->drm->dev,
+									page,
+									PAGE_SHIFT << order,
+									j * PAGE_SIZE,
+									svm_pages->iova_cookie,
+									dma_dir);
+			else
+				svm_pages->dma_addr[j] =
+					dpagemap->ops->device_map(dpagemap,
+								  gpusvm->drm->dev,
+								  page, order,
+								  dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev,
 					      svm_pages->dma_addr[j].addr)) {
 				err = -EFAULT;
@@ -1600,10 +1677,19 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	}
 
 	if (dma_use_iova(state)) {
+		drm_WARN_ON(gpusvm->drm, svm_pages->iova_cookie);
+
 		err = dma_iova_sync(gpusvm->drm->dev, state, 0,
 				    npages * PAGE_SIZE);
 		if (err)
 			goto err_unmap;
+	} else if (svm_pages->iova_cookie) {
+		err = dpagemap->ops->device_iova_sync(dpagemap,
+						      gpusvm->drm->dev,
+						      npages * PAGE_SIZE,
+						      svm_pages->iova_cookie);
+		if (err)
+			goto err_unmap;
 	}
 
 	if (pagemap) {
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 6772d8a92788..8c7640625cb1 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -138,6 +138,7 @@ struct drm_gpusvm_pages_flags {
  * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
  *            Note this is assuming only one drm_pagemap per range is allowed.
  * @state: DMA IOVA state for mapping.
+ * @iova_cookie: IOVA cookie for mapping.
  * @notifier_seq: Notifier sequence number of the range's pages
  * @flags: Flags for range
  * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
@@ -150,6 +151,7 @@ struct drm_gpusvm_pages {
 	struct drm_pagemap_addr *dma_addr;
 	struct drm_pagemap *dpagemap;
 	struct dma_iova_state state;
+	void *iova_cookie;
 	unsigned long notifier_seq;
 	struct drm_gpusvm_pages_flags flags;
 };
-- 
2.34.1

