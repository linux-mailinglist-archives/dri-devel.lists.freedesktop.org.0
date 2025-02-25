Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AB3A43438
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE6210E537;
	Tue, 25 Feb 2025 04:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7FMsKAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54D010E108;
 Tue, 25 Feb 2025 04:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458530; x=1771994530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mUbCfq0J5d1w8HRPg46x7XKt+yhTJw3jm7cG+0ELz7Q=;
 b=Y7FMsKAK3upPBikQxoJ/23Hap6TJEhYc0n+V2kzVjziJxRBLojX4VBRy
 uffCiBk+kCumHoceUNtYf2xkrl7XpUOMuwxTTEtEvcG0lEQGbHIYKgTUA
 TibFJTaes0zeqJ0/BsJRcj6exUrpEGejVi787Snbb5nsfW+M5r+gHIVEQ
 Hyj+L1PywbKrQyI4/Ib8dQ16JZUl9XkTyABELiOB8xrT/i4YD5voe6TdS
 FMy3vwXCFbs2DbPtHbAE2S5PMauknQxGRy93gTn4xm9H7XhyxWoS1OTtp
 INQpBJMqgVIcgJPDodnCgyubwrMMM+wgDVn3J0/+dJtrFjC4b8FqvZaXJ A==;
X-CSE-ConnectionGUID: UHK/k4KdRCyS7OVZwEx6QQ==
X-CSE-MsgGUID: 3jxUAg0CRnmvTpFCP0Um+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51884910"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51884910"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:09 -0800
X-CSE-ConnectionGUID: IYAZ9kj/QRO90B4w2IJnZA==
X-CSE-MsgGUID: kFc6C6zXQ/Goa46cMpsCLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290250"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 02/32] mm/migrate: Add migrate_device_pfns
Date: Mon, 24 Feb 2025 20:42:41 -0800
Message-Id: <20250225044311.3178695-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/linux/migrate.h |  1 +
 mm/migrate_device.c     | 52 +++++++++++++++++++++++++++++------------
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 29919faea2f1..80891120cca9 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -227,6 +227,7 @@ void migrate_vma_pages(struct migrate_vma *migrate);
 void migrate_vma_finalize(struct migrate_vma *migrate);
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages);
+int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages);
 void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
 			unsigned long npages);
 void migrate_device_finalize(unsigned long *src_pfns,
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 5bd888223cc8..e85ed4ab6df2 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -871,6 +871,22 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
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
@@ -895,29 +911,35 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
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

