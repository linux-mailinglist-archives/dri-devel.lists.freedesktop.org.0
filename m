Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDBBD0FDCD
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 21:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4112510E289;
	Sun, 11 Jan 2026 20:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7xsbdJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911E010E264;
 Sun, 11 Jan 2026 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768165171; x=1799701171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dkxdN34VvfdBFndpQ0gAnBJpqBFw5MZRAtUXsBQrZmU=;
 b=Q7xsbdJOrJX+d6GIzJJWuaJgvqZwMqNc1YQ7ZHrOls0ex7zJrN+QVzff
 SKR/EKqqKERdZvqw2rwqCPayCMKvdBLEeCC+JOa2sI3BCH19dvsWdUgBY
 hqvAaQZj5tlNm8h0NfOHp83QtOSduVUrN3tvGqOmnNasl5NoJBslHDRRf
 5Wc3EiGB+/mTSeNJLaaEBBwcRgxChhtncNgE6bGUwC3BxXipbMEWU7R2A
 DkJXXA91x+DzNylhwGQAJtVJcpCVHvJdwvCuPVHR1MkLu6FCJa/la2AgJ
 R+NsbuFpnMoWG2XM5pm+g7TeROezUNwnW+Pn/nRAVZcvxW0ucPvBYFMRQ A==;
X-CSE-ConnectionGUID: B9N/5BBgQX6tPFI5M/TpsQ==
X-CSE-MsgGUID: q1/o8X2nT1y3ntCUFBTmzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80904746"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="80904746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 12:59:31 -0800
X-CSE-ConnectionGUID: yguL52m2SWK5qQ9OZYrOnQ==
X-CSE-MsgGUID: RB8LwdxQR0qMHbiwr7DZwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208420030"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.11])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 12:59:27 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 6/7] drm/pagemap: Correct cpages calculation for
 migrate_vma_setup
Date: Sun, 11 Jan 2026 21:55:45 +0100
Message-ID: <20260111205820.830410-7-francois.dugast@intel.com>
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

cpages returned from migrate_vma_setup represents the total number of
individual pages found, not the number of 4K pages. The math in
drm_pagemap_migrate_to_devmem for npages is based on the number of 4K
pages, so cpages != npages can fail even if the entire memory range is
found in migrate_vma_setup (e.g., when a single 2M page is found).
Add drm_pagemap_cpages, which converts cpages to the number of 4K pages
found.

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
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 38 ++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 308c14291eba..af2c8f4da00e 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -452,6 +452,41 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
 	return ret;
 }
 
+/**
+ * drm_pagemap_cpages() - Count collected pages
+ * @migrate_pfn: Array of migrate_pfn entries to account
+ * @npages: Number of entries in @migrate_pfn
+ *
+ * Compute the total number of minimum-sized pages represented by the
+ * collected entries in @migrate_pfn. The total is derived from the
+ * order encoded in each entry.
+ *
+ * Return: Total number of minimum-sized pages.
+ */
+static int drm_pagemap_cpages(unsigned long *migrate_pfn, unsigned long npages)
+{
+	unsigned long i, cpages = 0;
+
+	for (i = 0; i < npages;) {
+		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
+		struct folio *folio;
+		unsigned int order = 0;
+
+		if (page) {
+			folio = page_folio(page);
+			order = folio_order(folio);
+			cpages += NR_PAGES(order);
+		} else if (migrate_pfn[i] & MIGRATE_PFN_COMPOUND) {
+			order = HPAGE_PMD_ORDER;
+			cpages += NR_PAGES(order);
+		}
+
+		i += NR_PAGES(order);
+	}
+
+	return cpages;
+}
+
 /**
  * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
  * @devmem_allocation: The device memory allocation to migrate to.
@@ -564,7 +599,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_free;
 	}
 
-	if (migrate.cpages != npages) {
+	if (migrate.cpages != npages &&
+	    drm_pagemap_cpages(migrate.src, npages) != npages) {
 		/*
 		 * Some pages to migrate. But we want to migrate all or
 		 * nothing. Raced or unknown device pages.
-- 
2.43.0

