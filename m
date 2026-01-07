Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1DECFF711
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E69510E648;
	Wed,  7 Jan 2026 18:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RVtYyl0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BB710E24E;
 Wed,  7 Jan 2026 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767810441; x=1799346441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SyIvnDK0KVSQalA6Xma57StVt6mnjA6JbNjLD+JIz+Q=;
 b=RVtYyl0+uzT5M3ZzfqKtB3terudRyihhr7Qy9tMeZ8s8Eigvm5ML17V6
 1Y+1jIgVLSIB8holCgL807bSdB+XGZlP5HaSRiNv6HUtLkVfKpgKyKnyd
 dvr2yp9LozGEG9TV43W/I0oX3zWenzYbmnAPgfMCWr7OXXirBkdVMn2vu
 uXl8dzZ8WOgHrAi0oNEYQReOvhv1ecGbI1ie9rhw8JlQ/Hf93C3UBbCpk
 Lj3PEt1reLegHA9zbPetTS8OLPWqwDWWAysfWu9tpsoaa5oJAhdNmhhbq
 fAuydG2n8cntUYOr4A37OZcMs50hY7AiDwwz4vASgNjUohPxrEBx3dJxf w==;
X-CSE-ConnectionGUID: NsO0yIhFSc6j1HJ5cPO8fg==
X-CSE-MsgGUID: VOxrt+z2QJO6Mt2/HNp1LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56747386"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="56747386"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:27:21 -0800
X-CSE-ConnectionGUID: FLgeGJ8TRIKN0Pf0Bp1mqw==
X-CSE-MsgGUID: Zl4OsMh3Tyy40vBNnSC3Fw==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:27:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/2] drm/pagemap Fix error paths in
 drm_pagemap_migrate_to_devmem
Date: Wed,  7 Jan 2026 10:27:15 -0800
Message-Id: <20260107182716.2236607-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107182716.2236607-1-matthew.brost@intel.com>
References: <20260107182716.2236607-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Avoid unlocking and putting device pages unless they were successfully
locked, and do not calculate migrated_pages on error paths.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 75af93b3f5d0 ("drm/pagemap, drm/xe: Support destination migration over interconnect")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index ba099aa7c52f..aa43a8475100 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -582,7 +582,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
 	if (err)
-		goto err_finalize;
+		goto err_aborted_migration;
 
 	own_pages = 0;
 
@@ -621,8 +621,10 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
 						pages, pagemap_addr, &last, &cur,
 						mdetails);
-		if (err)
+		if (err) {
+			npages = i + 1;
 			goto err_finalize;
+		}
 	}
 	cur.start = npages;
 	cur.ops = NULL; /* Force migration */
@@ -646,7 +648,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 err_aborted_migration:
 	migrate_vma_pages(&migrate);
 
-	for (i = 0; i < npages;) {
+	for (i = 0; !err && i < npages;) {
 		struct page *page = migrate_pfn_to_page(migrate.src[i]);
 		unsigned long nr_pages = page ? NR_PAGES(folio_order(page_folio(page))) : 1;
 
-- 
2.34.1

