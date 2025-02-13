Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB542A3352F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F0810E363;
	Thu, 13 Feb 2025 02:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BRZg8GGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6735010E1C0;
 Thu, 13 Feb 2025 02:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412616; x=1770948616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iO7fR+O+8rcsPtr6EdFv+0zb212YchnzRWv0EqtD/U4=;
 b=BRZg8GGP0A9olygX5bYGIempdcrcOdISW786orgHf65CRd3DUmx7lZvo
 12MJsrMwwvbmRPAPFOPNBHNyZ1+fzQbbiSb+EFDATB0bqw5o89tQqkkv8
 jrGrkzP7BdD3SO6tPtjgqCtfMrik4vpa5uzklxayv/I5/AIsERga6Zhiz
 69PKDZP5z74FTvMDM01AlCagYvOL+bnaqtUR70gIBglHhmnuq1CHRb8n2
 IVvuqOUPox9t6djCgFbYr5DRDefb3xOoOYOGdBehqE3BWu18Oq2zhYPXT
 H0o71Hx9Sw4kXcOkDo2x4WWz6/yBlkmV+LoJH5DMp/u4TWDFrPSbRTSNA Q==;
X-CSE-ConnectionGUID: dniOKfiSQkqzKto1VGsNEg==
X-CSE-MsgGUID: Sg2liigoT3C0RkwJB0NpBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65455900"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65455900"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
X-CSE-ConnectionGUID: DDz7YO6HQEqaDv9m3YoLpQ==
X-CSE-MsgGUID: GE8HeOJeQcqmCVo6SE6pMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945038"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 02/32] mm/migrate: Add migrate_device_pfns
Date: Wed, 12 Feb 2025 18:10:42 -0800
Message-Id: <20250213021112.1228481-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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

