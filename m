Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6002B99FF5D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1C410E651;
	Wed, 16 Oct 2024 03:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9DKV7lZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A474E10E649;
 Wed, 16 Oct 2024 03:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049098; x=1760585098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eRd+5+tAX4zMxXXCYWmdLl42ThwbYqoNgUGSEaU+eBw=;
 b=g9DKV7lZGSKdSWJlbbLemadDVtmKFtb0rd39lg4fGZNIQwJYUPa87jI9
 4rpLLf2sHv7JJyV4EKWVowNob24Cr5ILz/gvOS4xvcWaQXK6vP45WwC4L
 uGLuLMIbLIxH+XKw1tBFZ93RLSyNNnR5Qhrc9bOI4czgiwMoxpT3SvGoz
 S1ISRyDjXovjPN8R7gEKRdc4FL9YWVHWajFlD5whYJQW7ljk9YPUy+cV5
 tgXuA/+aHpHbvHk/w+Q74Mzsz9l9iiQeXLx+JWWr76nzt1vLTkX58SPsP
 3L3Ow0XseIOOkDXsQprYxwsvPHd1Uns+wIFJ0IwSDvvJIzB8EB60/7qUr Q==;
X-CSE-ConnectionGUID: K7YxcCBOT5Cfs6fWZeBysg==
X-CSE-MsgGUID: Tf5t3odHRhq0hid9hhfJQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056335"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056335"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:57 -0700
X-CSE-ConnectionGUID: A0uaQJEDSAu5moJ+K+YbJw==
X-CSE-MsgGUID: Hhxt9dBCRkC3VTlP2xWx/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930251"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Date: Tue, 15 Oct 2024 20:24:51 -0700
Message-Id: <20241016032518.539495-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
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

Add migrate_device_prepoluated_range which prepares an array of
pre-populated device pages for migration.

v2:
 - s/migrate_device_vma_range/migrate_device_prepopulated_range
 - Drop extra mmu invalidation (Vetter)

Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/linux/migrate.h |  1 +
 mm/migrate_device.c     | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 002e49b2ebd9..9146ed39a2a3 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -229,6 +229,7 @@ void migrate_vma_pages(struct migrate_vma *migrate);
 void migrate_vma_finalize(struct migrate_vma *migrate);
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages);
+int migrate_device_prepopulated_range(unsigned long *src_pfns, unsigned long npages);
 void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
 			unsigned long npages);
 void migrate_device_finalize(unsigned long *src_pfns,
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 9cf26592ac93..f163c2131022 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -924,6 +924,41 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 }
 EXPORT_SYMBOL(migrate_device_range);
 
+/**
+ * migrate_device_prepopulated_range() - migrate device private pfns to normal memory.
+ * @src_pfns: pre-popluated array of source device private pfns to migrate.
+ * @npages: number of pages to migrate.
+ *
+ * Similar to migrate_device_range() but supports non-contiguous pre-popluated
+ * array of device pages to migrate.
+ */
+int migrate_device_prepopulated_range(unsigned long *src_pfns, unsigned long npages)
+{
+	unsigned long i;
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
+
+	return 0;
+}
+EXPORT_SYMBOL(migrate_device_prepopulated_range);
+
 /*
  * Migrate a device coherent folio back to normal memory. The caller should have
  * a reference on folio which will be copied to the new folio if migration is
-- 
2.34.1

