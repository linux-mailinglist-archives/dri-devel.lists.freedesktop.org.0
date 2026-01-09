Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135C7D08030
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6104010E878;
	Fri,  9 Jan 2026 08:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RtJ9bQm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C49210E862;
 Fri,  9 Jan 2026 08:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767949001; x=1799485001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EKmYFUvSDoXlHcL5Czz/VT9iBoWrBxgTutVuJIcv9Gc=;
 b=RtJ9bQm9CGSrf/kqrQOFtam3gimGQWaRubwyqQAuuxd7kLA+arzq4xeg
 EROW+WRlB1cFbThz2V+uZfHyDwbJv8y8TdqgeXTSProFX6dVrScqy+pOF
 Rf6jYlwdR5gHuz58XERXOvuZTlV9lE9QSZGzvQgwuKfDulJJ+Q7sEvq0J
 EyKrN0u3d+1dli+zPtaSvNfGH08L2Zdr94Kr/8e/GyAdLMYCbNCrxY1it
 fjiPRIF5ZD6V74Q6uMKWnbQDvx5V7o7YTcF/DUtCHKTYQ5kaOrUFFBqo1
 JdZIjEn3dnNDmtmYQeoAmC/fpU0j+VjSPjrEdFVSmBt+mmQMuxKH19Z2m w==;
X-CSE-ConnectionGUID: gVKj0I0aTw2rNRzd1Tcj4A==
X-CSE-MsgGUID: iZvxdsynSCGpJYWEbLVxnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79626003"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="79626003"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:41 -0800
X-CSE-ConnectionGUID: QX8zMeINQOmPVqrwP/xeTA==
X-CSE-MsgGUID: MUqGhosiRHiTXjNa1gPJFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="202538627"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:41 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 4/7] drm/pagemap: Unlock and put folios when possible
Date: Fri,  9 Jan 2026 09:54:24 +0100
Message-ID: <20260109085605.443316-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109085605.443316-1-francois.dugast@intel.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 03ee39a761a4..a686a58508cf 100644
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

