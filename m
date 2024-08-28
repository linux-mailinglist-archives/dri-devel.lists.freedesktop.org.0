Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77342961C55
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F6E10E472;
	Wed, 28 Aug 2024 02:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hS5SSAER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8A410E456;
 Wed, 28 Aug 2024 02:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813292; x=1756349292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oDvqa61JpMnQYg9Ts2SQo7j70AwY6QthuLbaa4R1yJA=;
 b=hS5SSAERhY+dEasXZWXLMqw6zEqqYPp9hcKU+zp/j/Ye7jrdU4RONqQj
 LDeyZFfpq91vA+hRbFyhOcUKSraOxbdZ2lXUVIQ+XkDQLI/OfY5D/cvlA
 aTFf/8QeinIMa9qErZXF1JhsqIu3vIYz/XFoFjKXqodVh+3bxKqq4buIG
 fgxgJex+BRlmbXKz+cvs9/9yIfardegVe3y1rwqdrPB4AOFmrJfVjYVwM
 /7MdG6AM5ZnhHyiY5/LUEvq6b+nhpssV2WOIokdHWG8A3f0CJ3QeEnVfk
 AMINqycrlyj6ruudsuH6RY7SmsylOhqP507ZHVHPunp8CLwwa5v7A+SEy A==;
X-CSE-ConnectionGUID: QjlQWw35S0W4cSk1ZVpbNg==
X-CSE-MsgGUID: 3TpFzGnSTDmd77bxTRM6EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251963"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251963"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:12 -0700
X-CSE-ConnectionGUID: BT1Yt9icTDST+Q6BS0qKRQ==
X-CSE-MsgGUID: tP1BpzN9TM+Tn9Gt27335g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224680"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 28/28] drm/gpusvm: Ensure all pages migrated upon eviction
Date: Tue, 27 Aug 2024 19:49:01 -0700
Message-Id: <20240828024901.2582335-29-matthew.brost@intel.com>
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

Let's make sure we know what we are doing and check to ensure all pages
are migrated upon eviction.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/drm_gpusvm.c | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/drm_gpusvm.c b/drivers/gpu/drm/xe/drm_gpusvm.c
index fc1e44e6ae72..6df3580cf4ca 100644
--- a/drivers/gpu/drm/xe/drm_gpusvm.c
+++ b/drivers/gpu/drm/xe/drm_gpusvm.c
@@ -1830,6 +1830,40 @@ static int drm_gpusvm_migrate_populate_sram_pfn(struct vm_area_struct *vas,
 	return 0;
 }
 
+#define DRM_GPUSVM_DEBUG	/* TODO: Connect to Kconfig */
+
+#ifdef DRM_GPUSVM_DEBUG
+/**
+ * drm_gpusvm_pages_migrated - count the number of pages migrated
+ * @src_pfns: source migration pfns
+ * @npages the total number of pages in src_pfns
+ *
+ * Examine the MIGRATE_PFN_MIGRATE bit of each sfn_pfn to get a count of the
+ * number of pages migrated.
+ *
+ * Returns:
+ * Number of pages migrated
+ */
+static unsigned long
+drm_gpusvm_pages_migrated(unsigned long *src_pfns, unsigned long npages)
+{
+	int pages_migrated = 0;
+	unsigned long i;
+
+	for (i = 0; i < npages; ++i)
+		if (src_pfns[i] && src_pfns[i] & MIGRATE_PFN_MIGRATE)
+			++pages_migrated;
+
+	return pages_migrated;
+}
+#else
+static unsigned long
+drm_gpusvm_pages_migrated(unsigned long *src_pfns, unsigned long npages)
+{
+	return npages;
+}
+#endif
+
 /**
  * drm_gpusvm_evict_to_sram - Evict GPU SVM range to SRAM
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1896,6 +1930,8 @@ static int drm_gpusvm_evict_to_sram(struct drm_gpusvm *gpusvm,
 	if (err)
 		drm_gpusvm_migration_put_pages(npages, dst);
 	migrate_device_pages(src, dst, npages);
+	if (!err)
+		WARN_ON(npages > drm_gpusvm_pages_migrated(src, npages));
 	migrate_device_finalize(src, dst, npages);
 	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
 				       DMA_BIDIRECTIONAL);
@@ -1994,6 +2030,9 @@ static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
 	if (err)
 		drm_gpusvm_migration_put_pages(npages, migrate.dst);
 	migrate_vma_pages(&migrate);
+	if (!err && !page)	/* Only check on eviction */
+		WARN_ON(migrate.cpages >
+			drm_gpusvm_pages_migrated(migrate.src, npages));
 	migrate_vma_finalize(&migrate);
 	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
 				       DMA_BIDIRECTIONAL);
-- 
2.34.1

