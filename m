Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E13D0802A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12B310E85C;
	Fri,  9 Jan 2026 08:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhEGhpu0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E2C10E857;
 Fri,  9 Jan 2026 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948997; x=1799484997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C/wgMdLsD2tb2QyXAAXoSur5L4DO3Kxja0XkyIF7z5I=;
 b=RhEGhpu0/tNXdH4WoGn7UDGNiomBAzHe9d7zWSkcFPBJDHk0wOLm+14h
 Ck94q7zGSY172ua35xedmZKFhmP6Z7YK0hSrnV0ZacCIWk/j4a4jeD0bf
 PPugfTkL+ZdnwHJbZAU/PLW+/34V+BLrG9Q7KpWDV81mDjat3vqOnBn8M
 Bg/unrsN8v7rimkZ6AcnBogK2LwhX4uaZv2zhswRruhQMzGMKRoRalWUU
 9T9j7mO5XnkIgXbb3I/s6sG3UefGDX7U4D/+lJkHBHmCDJyivk0OhcZNY
 758WNT++qUUIxDwCcTXRDMhq/B6+3aLzf4HqM3E0aA7Qeb3mrOGE6aubH Q==;
X-CSE-ConnectionGUID: A6axRB2uT/OGep6K9BOXPQ==
X-CSE-MsgGUID: rVZgYVEaQQ+usXHFT3/qDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79625983"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="79625983"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:37 -0800
X-CSE-ConnectionGUID: 8PUErSNTSXWuxfOhJ4T+jw==
X-CSE-MsgGUID: Y+RkkjyNTbKjIVGeE7szXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="202538604"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:34 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alistair Popple <apopple@nvidia.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 2/7] fs/dax: Use folio_split_unref helper
Date: Fri,  9 Jan 2026 09:54:22 +0100
Message-ID: <20260109085605.443316-3-francois.dugast@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Use folio_split_unref helper to split a folio into individual upon final
put of a fsdax page.

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Suggested-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 fs/dax.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 289e6254aa30..90ec68785f40 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -381,7 +381,6 @@ static void dax_folio_make_shared(struct folio *folio)
 static inline unsigned long dax_folio_put(struct folio *folio)
 {
 	unsigned long ref;
-	int order, i;
 
 	if (!dax_folio_is_shared(folio))
 		ref = 0;
@@ -391,29 +390,7 @@ static inline unsigned long dax_folio_put(struct folio *folio)
 	if (ref)
 		return ref;
 
-	folio->mapping = NULL;
-	order = folio_order(folio);
-	if (!order)
-		return 0;
-	folio_reset_order(folio);
-
-	for (i = 0; i < (1UL << order); i++) {
-		struct dev_pagemap *pgmap = page_pgmap(&folio->page);
-		struct page *page = folio_page(folio, i);
-		struct folio *new_folio = (struct folio *)page;
-
-		ClearPageHead(page);
-		clear_compound_head(page);
-
-		new_folio->mapping = NULL;
-		/*
-		 * Reset pgmap which was over-written by
-		 * prep_compound_page().
-		 */
-		new_folio->pgmap = pgmap;
-		new_folio->share = 0;
-		WARN_ON_ONCE(folio_ref_count(new_folio));
-	}
+	folio_split_unref(folio);
 
 	return ref;
 }
-- 
2.43.0

