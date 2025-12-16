Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C1CC5124
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 21:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092EB10E878;
	Tue, 16 Dec 2025 20:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRs4MAre";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBAF10E876;
 Tue, 16 Dec 2025 20:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765915966; x=1797451966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4+n/Y2NbrVhqXHq//IkYMDIx4DVJnYRaZyJhSqEXy20=;
 b=WRs4MArePJAyOU/3x2wJWKKX77lPD8/EfeO2VSi7M95IIJb5Hmmv7/St
 thznQmKbs8g9hoRFCIaTKKzPGhjs7nJkDMS6jvDxR9OGYOCNvTgth4863
 c9DtsGTOzO8NvTZeqxVF+qiZQNZaZcYfOHCIbEPUi68DLEXd4aO35post
 Czub4o3uvAAvD0gwzGcW6IjIB5ezMUd+3/z9Ijrl0iHz78vakq1bh1p4K
 HmbRO0eYHad90YvTwXFdJXPhde80W8owcZzGcNWFUg+wI2wE3HuEdR4Ny
 2SsIphqMQWwYvOjcM8fOA4zL7Xo3Y3ezvNWw3hGB1uPaM4W3VhtMZW8Uf g==;
X-CSE-ConnectionGUID: HcEHeKTOS/C8wl6HWt+32g==
X-CSE-MsgGUID: pFUyyzg4SJGS9hJq+fHU4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="68000586"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="68000586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 12:12:46 -0800
X-CSE-ConnectionGUID: HQ9Yk2SrTXunPtcz2R/7CQ==
X-CSE-MsgGUID: w4XvMpJQQ4CoMMkT3nhiYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="202612438"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.214])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 12:12:45 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/4] drm/pagemap: Unlock and put folios when possible
Date: Tue, 16 Dec 2025 21:10:12 +0100
Message-ID: <20251216201206.1660899-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216201206.1660899-1-francois.dugast@intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
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

If the page is part of a folio, unlock and put the whole folio at once
instead of individual pages one after the other. This will reduce the
amount of operations once device THP are in use.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 37d7cfbbb3e8..491de9275add 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -149,15 +149,15 @@ static void drm_pagemap_zdd_put(struct drm_pagemap_zdd *zdd)
 }
 
 /**
- * drm_pagemap_migration_unlock_put_page() - Put a migration page
- * @page: Pointer to the page to put
+ * drm_pagemap_migration_unlock_put_folio() - Put a migration folio
+ * @folio: Pointer to the folio to put
  *
- * This function unlocks and puts a page.
+ * This function unlocks and puts a folio.
  */
-static void drm_pagemap_migration_unlock_put_page(struct page *page)
+static void drm_pagemap_migration_unlock_put_folio(struct folio *folio)
 {
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 }
 
 /**
@@ -172,15 +172,23 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
 {
 	unsigned long i;
 
-	for (i = 0; i < npages; ++i) {
+	for (i = 0; i < npages;) {
 		struct page *page;
+		struct folio *folio;
+		unsigned int order = 0;
 
 		if (!migrate_pfn[i])
-			continue;
+			goto next;
 
 		page = migrate_pfn_to_page(migrate_pfn[i]);
-		drm_pagemap_migration_unlock_put_page(page);
+		folio = page_folio(page);
+		order = folio_order(folio);
+
+		drm_pagemap_migration_unlock_put_folio(folio);
 		migrate_pfn[i] = 0;
+
+next:
+		i += NR_PAGES(order);
 	}
 }
 
-- 
2.43.0

