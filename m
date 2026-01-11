Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ABFD0FDBE
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 21:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE2C10E110;
	Sun, 11 Jan 2026 20:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7BeWLen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABDB10E110;
 Sun, 11 Jan 2026 20:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768165161; x=1799701161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x0o46IltvZIziPvuDUlJFM12hoQwAZmCbZJupxvwuok=;
 b=b7BeWLenzY6xP2gNh8Xx2lDkh3NUJyo7z9OfkgUU0eW7297nJwhgwwdx
 RsK+abogvCGJVHzHS7huEMhdnaOgZ/f2t+2GdqDtSBl9jyvT7VBZLMRcX
 9rbniTfnEadFbQRG9jghH6UQ8frgfFMQLs2xKvEUJ6Gh0ZMgHDVmebyL9
 /S+NQawnPS4PLTK6vxjnRxflipk4kliQzIYu56iXuxnTpw5zrP0IiQffC
 3qSRsrwagR3j90U7nwup7I1AtktL9btQ+LL8jy3PVdVglcDp0naHx5X5Y
 o3RBSPcyTFWey1Z3kdMmcQuuGxYWwnzNQDnjcf0subrklsra3Ie2WL2NZ w==;
X-CSE-ConnectionGUID: r8/JutUMRTGt4r+Ux7jJ9Q==
X-CSE-MsgGUID: d5i7jnRfS+e6+dN63+iReA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80904705"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="80904705"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 12:59:21 -0800
X-CSE-ConnectionGUID: UlIOxdrHSwKszggz7EuscQ==
X-CSE-MsgGUID: /wOnx8gTQ2iwNjeNht87pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208419980"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.11])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 12:59:15 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 3/7] fs/dax: Use free_zone_device_folio_prepare() helper
Date: Sun, 11 Jan 2026 21:55:42 +0100
Message-ID: <20260111205820.830410-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260111205820.830410-1-francois.dugast@intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
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

Use free_zone_device_folio_prepare() to restore fsdax ZONE_DEVICE folios
to a sane initial state upon the final put.

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
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
Cc: linux-fsdevel@vger.kernel.org
Cc: nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Suggested-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 fs/dax.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 289e6254aa30..d998f7615abb 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -391,29 +391,7 @@ static inline unsigned long dax_folio_put(struct folio *folio)
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
+	free_zone_device_folio_prepare(folio);
 
 	return ref;
 }
-- 
2.43.0

