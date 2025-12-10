Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6C5CB2C85
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 12:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C208710E703;
	Wed, 10 Dec 2025 11:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LD2rmF53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB37110E703;
 Wed, 10 Dec 2025 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765364960; x=1796900960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t1e427mxQ02Crxgyu8iFLaWioL/xhXcRFnmU1+AwXlc=;
 b=LD2rmF53jZSVH6gTEzIg/BJ7Y8ZC1+mW7lDTzCIVve+CIDTILqyo3Imi
 ZlzdpxdMvX5jK3j1UUBL++n2UTeOYtSK+kRYEyV0e4mtaXd4+qGP7S4CM
 xsySOpisAJd3yE8AVPGfdZOc+TDaIRoG3C2ynqhytBJNU2FKiMBxbJuPg
 97dukH4WpQ72GOKcqBl12LLPhTkNdwNgP2ldKavc1LJZwrUcWgbgJXWX7
 h9dnrN68+ltycapUK7LPqvO5JURFMHu8qloK8m/wRDBYSKZvZzXJcDdxE
 jjmw/UBmfgLZvgTjlbOF0EUKshS2zUoWfYCHvom5DsqxDUzwR7qChdnMN w==;
X-CSE-ConnectionGUID: b53D1dDpRSq98PzZyD+DAw==
X-CSE-MsgGUID: thtLwSgeTsOUGDV845Jr0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67221892"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67221892"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:09:20 -0800
X-CSE-ConnectionGUID: 77AI6Rg5TmOFQ6uYEYggug==
X-CSE-MsgGUID: jOhEH3ltTyWlYInj6Khzyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196487244"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.44])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:09:18 -0800
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
Subject: [PATCH v3 19/22] drm/gpusvm: Introduce a function to scan the current
 migration state
Date: Wed, 10 Dec 2025 12:07:39 +0100
Message-ID: <20251210110742.107575-20-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
References: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
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

With multi-device we are much more likely to have multiple
drm-gpusvm ranges pointing to the same struct mm range.

To avoid calling into drm_pagemap_populate_mm(), which is always
very costly, introduce a much less costly drm_gpusvm function,
drm_gpusvm_scan_mm() to scan the current migration state.
The device fault-handler and prefetcher can use this function to
determine whether migration is really necessary.

There are a couple of performance improvements that can be done
for this function if it turns out to be too costly. Those are
documented in the code.

v3:
- New patch.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 121 +++++++++++++++++++++++++++++++++++
 include/drm/drm_gpusvm.h     |  29 +++++++++
 2 files changed, 150 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 4c7474a331bc..aa9a0b60e727 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -743,6 +743,127 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
 	return err ? false : true;
 }
 
+/**
+ * drm_gpusvm_scan_mm() - Check the migration state of a drm_gpusvm_range
+ * @range: Pointer to the struct drm_gpusvm_range to check.
+ * @dev_private_owner: The struct dev_private_owner to use to determine
+ * compatible device-private pages.
+ * @pagemap: The struct dev_pagemap pointer to use for pagemap-specific
+ * checks.
+ *
+ * Scan the CPU address space corresponding to @range and return the
+ * current migration state. Note that the result may be invalid as
+ * soon as the function returns. It's an advisory check.
+ *
+ * TODO: Bail early and call hmm_range_fault() for subranges.
+ *
+ * Return: See &enum drm_gpusvm_scan_result.
+ */
+enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
+					       void *dev_private_owner,
+					       const struct dev_pagemap *pagemap)
+{
+	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
+	unsigned long start = drm_gpusvm_range_start(range);
+	unsigned long end = drm_gpusvm_range_end(range);
+	struct hmm_range hmm_range = {
+		.default_flags = 0,
+		.notifier = notifier,
+		.start = start,
+		.end = end,
+		.dev_private_owner = dev_private_owner,
+	};
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
+	unsigned long *pfns;
+	unsigned long npages = npages_in_range(start, end);
+	const struct dev_pagemap *other = NULL;
+	int err, i;
+
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (!pfns)
+		return DRM_GPUSVM_SCAN_UNPOPULATED;
+
+	hmm_range.hmm_pfns = pfns;
+
+retry:
+	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
+	mmap_read_lock(range->gpusvm->mm);
+
+	while (true) {
+		err = hmm_range_fault(&hmm_range);
+		if (err == -EBUSY) {
+			if (time_after(jiffies, timeout))
+				break;
+
+			hmm_range.notifier_seq =
+				mmu_interval_read_begin(notifier);
+			continue;
+		}
+		break;
+	}
+	mmap_read_unlock(range->gpusvm->mm);
+	if (err)
+		goto err_free;
+
+	drm_gpusvm_notifier_lock(range->gpusvm);
+	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
+		drm_gpusvm_notifier_unlock(range->gpusvm);
+		goto retry;
+	}
+
+	for (i = 0; i < npages;) {
+		struct page *page;
+		const struct dev_pagemap *cur = NULL;
+
+		if (!(pfns[i] & HMM_PFN_VALID)) {
+			state = DRM_GPUSVM_SCAN_UNPOPULATED;
+			goto err_free;
+		}
+
+		page = hmm_pfn_to_page(pfns[i]);
+		if (is_device_private_page(page) ||
+		    is_device_coherent_page(page))
+			cur = page_pgmap(page);
+
+		if (cur == pagemap) {
+			new_state = DRM_GPUSVM_SCAN_EQUAL;
+		} else if (cur && (cur == other || !other)) {
+			new_state = DRM_GPUSVM_SCAN_OTHER;
+			other = cur;
+		} else if (cur) {
+			new_state = DRM_GPUSVM_SCAN_MIXED_DEVICE;
+		} else {
+			new_state = DRM_GPUSVM_SCAN_SYSTEM;
+		}
+
+		/*
+		 * TODO: Could use an array for state
+		 * transitions, and caller might want it
+		 * to bail early for some results.
+		 */
+		if (state == DRM_GPUSVM_SCAN_UNPOPULATED) {
+			state = new_state;
+		} else if (state != new_state) {
+			if (new_state == DRM_GPUSVM_SCAN_SYSTEM ||
+			    state == DRM_GPUSVM_SCAN_SYSTEM)
+				state = DRM_GPUSVM_SCAN_MIXED;
+			else if (state != DRM_GPUSVM_SCAN_MIXED)
+				state = DRM_GPUSVM_SCAN_MIXED_DEVICE;
+		}
+
+		i += 1ul << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
+	}
+
+err_free:
+	drm_gpusvm_notifier_unlock(range->gpusvm);
+
+	kvfree(pfns);
+	return state;
+}
+EXPORT_SYMBOL(drm_gpusvm_scan_mm);
+
 /**
  * drm_gpusvm_range_chunk_size() - Determine chunk size for GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 632e100e6efb..2578ac92a8d4 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -328,6 +328,35 @@ void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
 			   struct drm_gpusvm_pages *svm_pages,
 			   unsigned long npages);
 
+/**
+ * enum drm_gpusvm_scan_result - Scan result from the drm_gpusvm_scan_mm() function.
+ * @DRM_GPUSVM_SCAN_UNPOPULATED: At least one page was not present or inaccessible.
+ * @DRM_GPUSVM_SCAN_EQUAL: All pages belong to the struct dev_pagemap indicated as
+ * the @pagemap argument to the drm_gpusvm_scan_mm() function.
+ * @DRM_GPUSVM_SCAN_OTHER: All pages belong to exactly one dev_pagemap, which is
+ * *NOT* the @pagemap argument to the drm_gpusvm_scan_mm(). All pages belong to
+ * the same device private owner.
+ * @DRM_GPUSVM_SCAN_SYSTEM: All pages are present and system pages.
+ * @DRM_GPUSVM_SCAN_MIXED_DEVICE: All pages are device pages and belong to at least
+ * two different struct dev_pagemaps. All pages belong to the same device private
+ * owner.
+ * @DRM_GPUSVM_SCAN_MIXED: Pages are present and are a mix of system pages
+ * and device-private pages. All device-private pages belong to the same device
+ * private owner.
+ */
+enum drm_gpusvm_scan_result {
+	DRM_GPUSVM_SCAN_UNPOPULATED,
+	DRM_GPUSVM_SCAN_EQUAL,
+	DRM_GPUSVM_SCAN_OTHER,
+	DRM_GPUSVM_SCAN_SYSTEM,
+	DRM_GPUSVM_SCAN_MIXED_DEVICE,
+	DRM_GPUSVM_SCAN_MIXED,
+};
+
+enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
+					       void *dev_private_owner,
+					       const struct dev_pagemap *pagemap);
+
 #ifdef CONFIG_LOCKDEP
 /**
  * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
-- 
2.51.1

