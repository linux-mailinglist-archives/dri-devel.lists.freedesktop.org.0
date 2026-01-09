Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5D4D08027
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA80310E856;
	Fri,  9 Jan 2026 08:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2iLsBGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FAB10E855;
 Fri,  9 Jan 2026 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948994; x=1799484994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ei3iOPS+myBqtT5xuA9JKyEL9TietkXXYAr7sL9XrQ0=;
 b=M2iLsBGH8ZDC+bbMgjJipzj06JIli3H0fM1k0H18XGH9VGk6ZXHudNFb
 ssMArR/h8t+GJgUyqhsyKa7egiuBVtkPbuG/EI4VNfCSA35xYHqe+a3/U
 EGoy+VhWwhdHwg7hXDIHxJSM0mYBUuLsVzmu5s2WQk/6TG+owRdVhDMG/
 2uZs18pSnBgjmgiSMUmuIDevg54VR8D6x0muGHHlomfX02yf8snpAV1Gv
 RM8ie2KxT8vgA6BEL4Bmi2x+V6QOve0GeHSq8T+jxG4IZAh4H+psayZ6a
 4mpf02534X6uz3uEj+6kxGKV+xoU4al1q2SVTvMONsLA+GqDX5ouYgTJy g==;
X-CSE-ConnectionGUID: HHhYApQAQfCqSB/4f3UiAQ==
X-CSE-MsgGUID: 0rxAeUFzRYih4UXGZsbZ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79625967"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="79625967"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:34 -0800
X-CSE-ConnectionGUID: LgJ4gWLiSTGmrZf/2pruUQ==
X-CSE-MsgGUID: CFcs2tEXQX2urP2N69BAeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="202538591"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:56:30 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Alistair Popple <apopple@nvidia.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 1/7] mm: Add folio_split_unref helper
Date: Fri,  9 Jan 2026 09:54:21 +0100
Message-ID: <20260109085605.443316-2-francois.dugast@intel.com>
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

Add folio_split_unref helper which splits an unreferenced folio
(refcount == 0) into individual pages. Intended to be called on special
pages (e.g., device-private, DAX, etc.) when returning the folio to the
free page pool.

Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Suggested-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/linux/huge_mm.h |  1 +
 mm/huge_memory.c        | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index a4d9f964dfde..18cb9728d8f1 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -369,6 +369,7 @@ enum split_type {
 	SPLIT_TYPE_NON_UNIFORM,
 };
 
+void folio_split_unref(struct folio *folio);
 int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
 		unsigned int new_order);
 int folio_split_unmapped(struct folio *folio, unsigned int new_order);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 40cf59301c21..0eb9e6ad8639 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3580,6 +3580,45 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 		ClearPageCompound(&folio->page);
 }
 
+/**
+ * folio_split_unref() - split an unreferenced folio (refcount == 0)
+ * @folio: the to-be-split folio
+ *
+ * Split an unreferenced folio (refcount == 0) into individual pages.
+ * Intended to be called on special pages (e.g., device-private, DAX, etc.)
+ * when returning the folio to the free page pool.
+ */
+void folio_split_unref(struct folio *folio)
+{
+	struct dev_pagemap *pgmap = page_pgmap(&folio->page);
+	int order, i;
+
+	folio->mapping = NULL;
+	order = folio_order(folio);
+	if (!order)
+		return;
+
+	folio_reset_order(folio);
+
+	for (i = 0; i < (1UL << order); i++) {
+		struct page *page = folio_page(folio, i);
+		struct folio *new_folio = (struct folio *)page;
+
+		ClearPageHead(page);
+		clear_compound_head(page);
+
+		new_folio->mapping = NULL;
+		/*
+		 * Reset pgmap which was over-written by
+		 * prep_compound_page().
+		 */
+		new_folio->pgmap = pgmap;
+		new_folio->share = 0;	/* fsdax only, unused for device private */
+		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
+	}
+}
+EXPORT_SYMBOL_GPL(folio_split_unref);
+
 /**
  * __split_unmapped_folio() - splits an unmapped @folio to lower order folios in
  * two ways: uniform split or non-uniform split.
-- 
2.43.0

