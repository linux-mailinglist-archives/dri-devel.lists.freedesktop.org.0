Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F944D302E6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 12:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4897310E88D;
	Fri, 16 Jan 2026 11:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7zaK5/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B9110E88D;
 Fri, 16 Jan 2026 11:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768562052; x=1800098052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ocrp/eylFW5UQLpU9JLpH8QHEGjvevQsJMehADaKSBQ=;
 b=D7zaK5/ncafpzBRa6ESgeXPwbweI8njTMdvCjMJFfakzjwIzaJ10uYIC
 Gopw2RCsGVLcIq9pwzng2A+0R9nS+mKqQhQxDbHePxPMFrz1sa/4K2A+z
 bx4wa1Dd1fd2K2B8YI+NtQJrNWvKJJFe1GE3omD7KKWIP61VDYHcP/J4c
 cB4BntUVXzmjwvZgN1cr1jdbABts+iG4ah6n5bdL0QI6qkRjb+7EpDh8d
 FY8FFXUcMCmYaeYD59qOCfzHg4497IoX2rLwoPmjva+yfGikw1vE3tMPb
 HlB7GxUKmUodKoNsTySfjFUYNmLOlRNJ5VigYLZvThrBsx4bxbJF/aZof A==;
X-CSE-ConnectionGUID: 2s5ILrAmS6+o/OiCZBLI8Q==
X-CSE-MsgGUID: RhzJUpsmTnC9bWIlBt1/2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69930666"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="69930666"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 03:14:12 -0800
X-CSE-ConnectionGUID: BW0V33PURSeOncgvxmVpDw==
X-CSE-MsgGUID: DpQ/PilxQ/aDw4Nqd70PrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="209713445"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.100])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 03:14:08 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 2/5] drm/pagemap: Unlock and put folios when possible
Date: Fri, 16 Jan 2026 12:10:17 +0100
Message-ID: <20260116111325.1736137-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116111325.1736137-1-francois.dugast@intel.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
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

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Balbir Singh <balbirs@nvidia.com>
---
 drivers/gpu/drm/drm_pagemap.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 38eca94f01a1..8e24a2c24729 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -154,15 +154,15 @@ static void drm_pagemap_zdd_put(struct drm_pagemap_zdd *zdd)
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
@@ -177,15 +177,23 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
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

