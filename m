Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3E549CE13
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC3E10E970;
	Wed, 26 Jan 2022 15:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DF210E942;
 Wed, 26 Jan 2022 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210549; x=1674746549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CRgb7rJJ/ShL2opOzT8EOROznzqgOCliFBO44qDp6VM=;
 b=mOdP/axKaz02foIY41aw0atJvXX9QO9ttxQzKcxbmcjFqnFPeMS6YMdC
 JKkne6jk8J6H369Y6kD5Xokel6fJlJ+gIAuNbrua989llYHvQJ0Ylj4jk
 PcscsXRFCjWdAzCwH22GTdz85YO3mwbfEczJnu2PoCvEiGJxN00/Kl+xY
 5YLB7MnJLpmhD2gDe3oezrfqZOp97UUZk0Y/nbMQ2dtfw1QkL6DxzHaF8
 uGPBfQRgibBBHcbaadw8qsRjJ1EQZmL5pEnZwwDeX5Xfkxxlx5/5LTXJh
 c1xkzz5tVTk3l4foRCkXessb1Hv6Ymgti6ZM9OmO+aRRcudhYcXBuSU/b g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885296"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885296"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386326"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:27 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 19/20] drm/i915/lmem: don't treat small BAR as an error
Date: Wed, 26 Jan 2022 15:21:54 +0000
Message-Id: <20220126152155.3070602-20-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just pass along the probed io_size. The backend should be able to
utilize the entire range here, even if some of it is non-mappable.

It does leave open with what to do with stolen local-memory.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 2c7ec7ff79fd..b788fc2b3df8 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -200,6 +200,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	struct intel_memory_region *mem;
 	resource_size_t min_page_size;
 	resource_size_t io_start;
+	resource_size_t io_size;
 	resource_size_t lmem_size;
 	int err;
 
@@ -210,7 +211,8 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
 
 	io_start = pci_resource_start(pdev, 2);
-	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
+	io_size = min(pci_resource_len(pdev, 2), lmem_size);
+	if (!io_size)
 		return ERR_PTR(-ENODEV);
 
 	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
@@ -220,7 +222,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 					 lmem_size,
 					 min_page_size,
 					 io_start,
-					 lmem_size,
+					 io_size,
 					 INTEL_MEMORY_LOCAL,
 					 0,
 					 &intel_region_lmem_ops);
-- 
2.34.1

