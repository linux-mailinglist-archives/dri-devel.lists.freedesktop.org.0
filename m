Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE17961C42
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1690610E446;
	Wed, 28 Aug 2024 02:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbfrk9R1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A5010E440;
 Wed, 28 Aug 2024 02:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813288; x=1756349288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fp+nlxf77E8ObSScKrGPzO5OLjkgp3O8UmyRwhsVGlI=;
 b=nbfrk9R1vaMYXSqelVocMUD7wTZo6buyGA7YHC7VCr6nYfpcjVv0Tuwv
 QIuWkZSDWlEjOt1XsujLNMRWCBxwUGxclvr8gSer/nJLARa3+aiPcGAAv
 Dff0HlSS4KoR7QdHk0KfCnLQAg9x/cGfvs8fgUTgbsAMnK+fIENCeyllk
 n12RWVkfSvuQflICWzEV2cKicK9gOW3gauM8HFn6XSi68JqitJnuT7QEf
 1kymW/mkMF2QxOS0cTJHnp/o7Vg8bqua8H57uTtUujn4FFsFdi1HKpFdj
 FP+xGVms4kH1i6xfXrly5hLVK7iqZDEO67uDtVG0juaSNhx4oPGCGHB/G g==;
X-CSE-ConnectionGUID: 0F99W7N4RxWkYzUqXGjZow==
X-CSE-MsgGUID: Q5jNhwF+RJevdTuOyTWFig==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251861"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:07 -0700
X-CSE-ConnectionGUID: +EMLZZrWTKGENg8O4+lX3w==
X-CSE-MsgGUID: E/sDT5oqTsan1eAWte+KLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224595"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 04/28] mm/migrate: Add migrate_device_vma_range
Date: Tue, 27 Aug 2024 19:48:37 -0700
Message-Id: <20240828024901.2582335-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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

Add migrate_device_vma_range which prepares an array of pre-populated
device pages for migration and issues a MMU invalidation.

Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/linux/migrate.h |  3 +++
 mm/migrate_device.c     | 53 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 644be30b69c8..e8cce05bf9c2 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -226,6 +226,9 @@ void migrate_vma_pages(struct migrate_vma *migrate);
 void migrate_vma_finalize(struct migrate_vma *migrate);
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages);
+int migrate_device_vma_range(struct mm_struct *mm, void *pgmap_owner,
+			     unsigned long *src_pfns, unsigned long npages,
+			     unsigned long start);
 void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
 			unsigned long npages);
 void migrate_device_finalize(unsigned long *src_pfns,
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 6d66dc1c6ffa..e25f12a132e8 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -920,6 +920,59 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 }
 EXPORT_SYMBOL(migrate_device_range);
 
+/**
+ * migrate_device_vma_range() - migrate device private pfns to normal memory and
+ * trigger MMU invalidation.
+ * @mm: struct mm of device pages.
+ * @src_pfns: pre-popluated array of source device private pfns to migrate.
+ * @pgmap_owner: page group map owner of device pages.
+ * @npages: number of pages to migrate.
+ * @start: VMA start of device pages.
+ *
+ * Similar to migrate_device_range() but supports non-contiguous pre-popluated
+ * array of device pages to migrate. Also triggers MMU invalidation. Useful in
+ * device memory eviction paths where lock is held protecting the device pages
+ * but where the mmap lock cannot be taken to due to a locking inversion (e.g.
+ * DRM drivers). Since the mmap lock is not required to be held, the MMU
+ * invalidation can race with with VMA start being repurposed, worst case this
+ * would result in an unecessary invalidation.
+ */
+int migrate_device_vma_range(struct mm_struct *mm, void *pgmap_owner,
+			     unsigned long *src_pfns, unsigned long npages,
+			     unsigned long start)
+{
+	struct mmu_notifier_range range;
+	unsigned long i;
+
+	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
+				      mm, start, start + npages * PAGE_SIZE,
+				      pgmap_owner);
+	mmu_notifier_invalidate_range_start(&range);
+
+	for (i = 0; i < npages; i++) {
+		struct page *page = pfn_to_page(src_pfns[i]);
+
+		if (!get_page_unless_zero(page)) {
+			src_pfns[i] = 0;
+			continue;
+		}
+
+		if (!trylock_page(page)) {
+			src_pfns[i] = 0;
+			put_page(page);
+			continue;
+		}
+
+		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
+	}
+
+	migrate_device_unmap(src_pfns, npages, NULL);
+	mmu_notifier_invalidate_range_end(&range);
+
+	return 0;
+}
+EXPORT_SYMBOL(migrate_device_vma_range);
+
 /*
  * Migrate a device coherent page back to normal memory. The caller should have
  * a reference on page which will be copied to the new page if migration is
-- 
2.34.1

