Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F234A224AE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808FA10E57E;
	Wed, 29 Jan 2025 19:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuNVQ4G9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4236510E177;
 Wed, 29 Jan 2025 19:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180280; x=1769716280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HbdphFBOs6QEj3+6AUoIm2WzF/q3MDTxDlAk1XFxXDk=;
 b=HuNVQ4G9BU5KGFTdTppYS2gw4lZTkGDD9OrN7jE0LxNm9xjTehLkYZ0B
 4lvZGeIYU+mAgERxFbIpc42MNQxQJgriUkSqieOj4fkTWk9XSDke7m/1D
 sZaUgXe+KKzMmmls5Fu5HMtTgYeu5f5q/o6jTJDU3XzQJzQlWjvFm3vSo
 Tv2HeVXCyM4LRikzQRdTTrHxgs4gC/QJj2MWTaOalckJN5HAy2oDXSmQg
 WYJJnjJi14eatOM1D58qI+mXjmTFmciInvVZzFRCiVhk7giQCxrIgVuSd
 WWCDAt8yk375S/LMUREUftHAASWQQ13rCOKvhEr6F4ZFzo2pauc8Nkk89 w==;
X-CSE-ConnectionGUID: kheLvIDlSLaJDl66/QxvOQ==
X-CSE-MsgGUID: cNn9u1ECRnCPUfWeXtGrtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132717"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132717"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:20 -0800
X-CSE-ConnectionGUID: BklwPYEhQC2eKBmyLfBiog==
X-CSE-MsgGUID: CavaRi/gSmCHd7imTQfiSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392104"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 02/33] mm/migrate: Add migrate_device_pfns
Date: Wed, 29 Jan 2025 11:51:41 -0800
Message-Id: <20250129195212.745731-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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

Add migrate_device_pfns which prepares an array of pre-populated device
pages for migration. This is needed for eviction of known set of
non-contiguous devices pages to cpu pages which is a common case for SVM
in DRM drivers using TTM.

v2:
 - s/migrate_device_vma_range/migrate_device_prepopulated_range
 - Drop extra mmu invalidation (Vetter)
v3:
 - s/migrate_device_prepopulated_range/migrate_device_pfns (Alistar)
 - Use helper to lock device pages (Alistar)
 - Update commit message with why this is required (Alistar)

Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/linux/migrate.h |  1 +
 mm/migrate_device.c     | 52 +++++++++++++++++++++++++++++------------
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 002e49b2ebd9..6254746648cc 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -229,6 +229,7 @@ void migrate_vma_pages(struct migrate_vma *migrate);
 void migrate_vma_finalize(struct migrate_vma *migrate);
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages);
+int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages);
 void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
 			unsigned long npages);
 void migrate_device_finalize(unsigned long *src_pfns,
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 9cf26592ac93..19960743f927 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -876,6 +876,22 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
+static unsigned long migrate_device_pfn_lock(unsigned long pfn)
+{
+	struct folio *folio;
+
+	folio = folio_get_nontail_page(pfn_to_page(pfn));
+	if (!folio)
+		return 0;
+
+	if (!folio_trylock(folio)) {
+		folio_put(folio);
+		return 0;
+	}
+
+	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+}
+
 /**
  * migrate_device_range() - migrate device private pfns to normal memory.
  * @src_pfns: array large enough to hold migrating source device private pfns.
@@ -900,29 +916,35 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 {
 	unsigned long i, pfn;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct folio *folio;
+	for (pfn = start, i = 0; i < npages; pfn++, i++)
+		src_pfns[i] = migrate_device_pfn_lock(pfn);
 
-		folio = folio_get_nontail_page(pfn_to_page(pfn));
-		if (!folio) {
-			src_pfns[i] = 0;
-			continue;
-		}
+	migrate_device_unmap(src_pfns, npages, NULL);
 
-		if (!folio_trylock(folio)) {
-			src_pfns[i] = 0;
-			folio_put(folio);
-			continue;
-		}
+	return 0;
+}
+EXPORT_SYMBOL(migrate_device_range);
 
-		src_pfns[i] = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
-	}
+/**
+ * migrate_device_pfns() - migrate device private pfns to normal memory.
+ * @src_pfns: pre-popluated array of source device private pfns to migrate.
+ * @npages: number of pages to migrate.
+ *
+ * Similar to migrate_device_range() but supports non-contiguous pre-popluated
+ * array of device pages to migrate.
+ */
+int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages; i++)
+		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
 	return 0;
 }
-EXPORT_SYMBOL(migrate_device_range);
+EXPORT_SYMBOL(migrate_device_pfns);
 
 /*
  * Migrate a device coherent folio back to normal memory. The caller should have
-- 
2.34.1

