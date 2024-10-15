Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291B699E54E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 13:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDF610E028;
	Tue, 15 Oct 2024 11:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2kcnMoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B5510E028;
 Tue, 15 Oct 2024 11:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728990850; x=1760526850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kFWXuUejgX7TsesV5BIyhjvVFVuTGp7EAJnDBugnccs=;
 b=g2kcnMoCSa29vNU+rIceNHMv9v+zS+0aGxBAnWScJiK0AGV+3sDezBp7
 LF8t+NelfmQTbX9w6plw4oQ1NSLHvPM+Z/qgz+PtVm1nUeF28ZhvdRaC2
 84OOHfg1N6VOxInfoShtK+RGKxWXFaYoY5GGrN2b+rqmhVIv/B7q1dxg8
 o/TsT1yOMl7BV0GByCPlpWIvR0GurjxFthr+FSvURPY1jW8CC6tOnQfBJ
 AQxAI5KRuSoKFcb+xdkkq6YB8HUMujSL49PK9uKvXo/wlm07AD4jSJ3dk
 m6FlZPT5P82lcjgZl0Pzda3miwmQ7Yp4YIB22QPPevcEU9a2eUoAwIMxB A==;
X-CSE-ConnectionGUID: v2N6KIaTTfyaQHMxnABN+g==
X-CSE-MsgGUID: j3yjPYsXQkeI+45Mz5kzTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27823415"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="27823415"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 04:14:10 -0700
X-CSE-ConnectionGUID: 6rh/y1YTTTGJQYJDzX7OCA==
X-CSE-MsgGUID: JEFQCYmhToiybWHZDFjOEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="81840388"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.43])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 04:14:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 DRI-devel <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] mm/hmm,
 mm/migrate_device: Allow p2p access and p2p migration
Date: Tue, 15 Oct 2024 13:13:22 +0200
Message-ID: <20241015111322.97514-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

Introduce a way for hmm_range_fault() and migrate_vma_setup() to identify
foreign devices with fast interconnect and thereby allow
both direct access over the interconnect and p2p migration.

The need for a callback arises because without it, the p2p ability would
need to be static and determined at dev_pagemap creation time. With
a callback it can be determined dynamically, and in the migrate case
the callback could separate out local device pages.

The hmm_range_fault() change has been tested internally, the
migrate_vma_setup() change hasn't yet.

Seeking early feedback. Any suggestions appreciated.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: DRI-devel <dri-devel@lists.freedesktop.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>
Cc: LKML <linux-kernel@vger.kernel.org>

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/hmm.h     |  2 ++
 include/linux/migrate.h | 29 +++++++++++++++++++++++++++++
 mm/hmm.c                | 13 +++++++++++--
 mm/migrate_device.c     | 12 ++++++++++++
 4 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 126a36571667..4de909a1e10a 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -12,6 +12,7 @@
 #include <linux/mm.h>
 
 struct mmu_interval_notifier;
+struct p2p_allow;
 
 /*
  * On output:
@@ -97,6 +98,7 @@ struct hmm_range {
 	unsigned long		default_flags;
 	unsigned long		pfn_flags_mask;
 	void			*dev_private_owner;
+	struct p2p_allow        *p2p;
 };
 
 /*
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 002e49b2ebd9..0ff085b633e3 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -183,10 +183,37 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
+struct p2p_allow;
+
+/**
+ * struct p2p_allow_ops - Functions for detailed cross-device access.
+ */
+struct p2p_allow_ops {
+	/**
+	 * @p2p_allow: Whether to allow cross-device access to device_private pages.
+	 * @allow: Pointer to a struct p2p_allow. Typically subclassed by the caller
+	 * to provide needed information.
+	 * @page: The page being queried.
+	 */
+	bool (*p2p_allow)(struct p2p_allow *allow, struct page *page);
+};
+
+/**
+ * struct p2p_allow - Information needed to allow cross-device access.
+ * @ops: Pointer to a struct p2p_allow_ops.
+ *
+ * This struct is intended to be embedded / subclassed to provide additional
+ * information needed by the @ops p2p_allow() callback.
+ */
+struct p2p_allow {
+	const struct p2p_allow_ops *ops;
+};
+
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
 	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
+	MIGRATE_VMA_SELECT_DEVICE_P2P = 1 << 3,
 };
 
 struct migrate_vma {
@@ -222,6 +249,8 @@ struct migrate_vma {
 	 * a migrate_to_ram() callback.
 	 */
 	struct page		*fault_page;
+	/* Optional identification of devices for p2p migration */
+	struct p2p_allow        *p2p;
 };
 
 int migrate_vma_setup(struct migrate_vma *args);
diff --git a/mm/hmm.c b/mm/hmm.c
index 7e0229ae4a5a..8c28f9b22ed2 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -19,6 +19,7 @@
 #include <linux/pagemap.h>
 #include <linux/swapops.h>
 #include <linux/hugetlb.h>
+#include <linux/migrate.h>
 #include <linux/memremap.h>
 #include <linux/sched/mm.h>
 #include <linux/jump_label.h>
@@ -220,6 +221,15 @@ static inline unsigned long pte_to_hmm_pfn_flags(struct hmm_range *range,
 	return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;
 }
 
+static bool hmm_allow_devmem(struct hmm_range *range, struct page *page)
+{
+	if (likely(page->pgmap->owner == range->dev_private_owner))
+		return true;
+	if (likely(!range->p2p))
+		return false;
+	return range->p2p->ops->p2p_allow(range->p2p, page);
+}
+
 static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			      unsigned long end, pmd_t *pmdp, pte_t *ptep,
 			      unsigned long *hmm_pfn)
@@ -248,8 +258,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		 * just report the PFN.
 		 */
 		if (is_device_private_entry(entry) &&
-		    pfn_swap_entry_to_page(entry)->pgmap->owner ==
-		    range->dev_private_owner) {
+		    hmm_allow_devmem(range, pfn_swap_entry_to_page(entry))) {
 			cpu_flags = HMM_PFN_VALID;
 			if (is_writable_device_private_entry(entry))
 				cpu_flags |= HMM_PFN_WRITE;
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 9cf26592ac93..8e643a3872c9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -54,6 +54,13 @@ static int migrate_vma_collect_hole(unsigned long start,
 	return 0;
 }
 
+static bool migrate_vma_allow_p2p(struct migrate_vma *migrate, struct page *page)
+{
+	if (likely(!migrate->p2p))
+		return false;
+	return migrate->p2p->ops->p2p_allow(migrate->p2p, page);
+}
+
 static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				   unsigned long start,
 				   unsigned long end,
@@ -138,6 +145,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			    page->pgmap->owner != migrate->pgmap_owner)
 				goto next;
 
+			if (!(migrate->flags &
+			      MIGRATE_VMA_SELECT_DEVICE_P2P) ||
+			    !migrate_vma_allow_p2p(migrate, page))
+				goto next;
+
 			mpfn = migrate_pfn(page_to_pfn(page)) |
 					MIGRATE_PFN_MIGRATE;
 			if (is_writable_device_private_entry(entry))
-- 
2.46.0

