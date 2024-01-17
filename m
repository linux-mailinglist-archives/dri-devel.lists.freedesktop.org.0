Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5CD830F02
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 23:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320E410E8C2;
	Wed, 17 Jan 2024 22:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E5C10E008;
 Wed, 17 Jan 2024 22:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528907; x=1737064907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a0vZtfrN9UpAC/iAia0pPxlZcWsaf9Idjir8E7djVZM=;
 b=APzoAeWw86GTJjdNEcidaYi1m5KLB8pvszZVhhudAGTcf162grzINS0/
 3L16C9bC4gFajpGIkRXBw9SVH/OWaUBjKNzfBMKnw4QmMZApSsbO8jrnY
 DiiyY7L3ELLh7K8z9EWCfKcvS9oJhGpSCPyVTXGZG8nkYLeFMhaROSdqi
 lvgl0UqkFPYbiAamrbgdbJru8GbMmUMlit692ow9o2q0lufRO5vfbnQ8l
 5Hhk9uz5NbjY+4IeRWCuMP2ymc64b4gByObLQ1PaesASrS4weIdI5HmXm
 eqTbs+QSF/zGpb7RgMwcwucsAGIS29OPf7vUM3KlOgZRh0Y/U4sRX9TOB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7657633"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7657633"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734089275"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734089275"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:45 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 20/23] drm/xe/svm: Populate svm range
Date: Wed, 17 Jan 2024 17:12:20 -0500
Message-Id: <20240117221223.18540-21-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240117221223.18540-1-oak.zeng@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com,
 krishnaiah.bommu@intel.com, niranjana.vishwanathapura@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper function svm_populate_range to populate
a svm range. This functions calls hmm_range_fault
to read CPU page tables and populate all pfns of this
virtual address range into an array, saved in hmm_range::
hmm_pfns. This is prepare work to bind a svm range to
GPU. The hmm_pfns array will be used for the GPU binding.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 44d4f4216a93..0c13690a19f5 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -145,3 +145,64 @@ int xe_svm_build_sg(struct hmm_range *range,
 	sg_mark_end(sg);
 	return 0;
 }
+
+/** Populate physical pages of a virtual address range
+ * This function also read mmu notifier sequence # (
+ * mmu_interval_read_begin), for the purpose of later
+ * comparison (through mmu_interval_read_retry).
+ * This must be called with mmap read or write lock held.
+ *
+ * This function alloates hmm_range->hmm_pfns, it is caller's
+ * responsibility to free it.
+ *
+ * @svm_range: The svm range to populate
+ * @hmm_range: pointer to hmm_range struct. hmm_rang->hmm_pfns
+ * will hold the populated pfns.
+ * @write: populate pages with write permission
+ *
+ * returns: 0 for succuss; negative error no on failure
+ */
+static int svm_populate_range(struct xe_svm_range *svm_range,
+			    struct hmm_range *hmm_range, bool write)
+{
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
+	u64 npages;
+	int ret;
+
+	mmap_assert_locked(svm_range->svm->mm);
+
+	npages = ((svm_range->end - 1) >> PAGE_SHIFT) -
+						(svm_range->start >> PAGE_SHIFT) + 1;
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (unlikely(!pfns))
+		return -ENOMEM;
+
+	if (write)
+		flags |= HMM_PFN_REQ_WRITE;
+
+	memset64((u64 *)pfns, (u64)flags, npages);
+	hmm_range->hmm_pfns = pfns;
+	hmm_range->notifier_seq = mmu_interval_read_begin(&svm_range->notifier);
+	hmm_range->notifier = &svm_range->notifier;
+	hmm_range->start = svm_range->start;
+	hmm_range->end = svm_range->end;
+	hmm_range->pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE;
+	hmm_range->dev_private_owner = svm_range->svm->vm->xe->drm.dev;
+
+	while (true) {
+		ret = hmm_range_fault(hmm_range);
+		if (time_after(jiffies, timeout))
+			goto free_pfns;
+
+		if (ret == -EBUSY)
+			continue;
+		break;
+	}
+
+free_pfns:
+	if (ret)
+		kvfree(pfns);
+	return ret;
+}
-- 
2.26.3

