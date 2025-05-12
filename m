Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19707AB3B9B
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 17:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073F510E438;
	Mon, 12 May 2025 15:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vjtc5GzL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBC610E432;
 Mon, 12 May 2025 15:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747062415; x=1778598415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1AiEEm+dE+Xz7UMuaUkuxqfVmDFtkNvsIem0EnYAyHk=;
 b=Vjtc5GzLEF/DdBwGEbS0ycHf9mBtu6/XKIDUCc7ao46gAGuCvSR72+SC
 H2wa4rjWqbcNvrEIfEGUEueFtjzLxl3id/Z1nrsVXKJk66zkO+ngwXC8K
 LoJLEoZeB64+DvwF+/76oQ8pBJbU3abNquG/3K7xSnh8nsysLF1sgQo1X
 mamYr4cpRC0KUlVOT0NOakZIzSBRDJTYzSOSEFhCt8Z2klDbzSdXBEvTF
 DMw9cmGF77l8P1VcP+5tThfBr6yyXYKBU4Sg0uwWfi/8YGwHwJ4Idm8TD
 7661VZfT8wMk+R7Rkrxdhc3ffdul5I4dmU5nE8ViOdM3RbzuRaU5hnkqo g==;
X-CSE-ConnectionGUID: J/Pl9tlHRGWwK13kq+m8sA==
X-CSE-MsgGUID: xEqtEV/LRHiYdWgTUpx+/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="71377047"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="71377047"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 08:06:55 -0700
X-CSE-ConnectionGUID: A1fDYtFFSZOpfOTJzYt+nA==
X-CSE-MsgGUID: TXfZoQnATvm7JuWqSzggpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137916543"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.222])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 08:06:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 1/8] drm/gpusvm: fix hmm_pfn_to_map_order() usage
Date: Mon, 12 May 2025 16:06:39 +0100
Message-ID: <20250512150637.61462-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512150637.61462-10-matthew.auld@intel.com>
References: <20250512150637.61462-10-matthew.auld@intel.com>
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

Handle the case where the hmm range partially covers a huge page (like
2M), otherwise we can potentially end up doing something nasty like
mapping memory which is outside the range, and maybe not even mapped by
the mm. Fix is based on the xe userptr code, which in a future patch
will directly use gpusvm, so needs alignment here.

v2:
  - Add kernel-doc (Matt B)
  - s/fls/ilog2/ (Thomas)

Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index f3ac2c78e3b2..abb78e06e810 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -817,6 +817,35 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
 	return range;
 }
 
+/**
+ * drm_gpusvm_hmm_pfn_to_order() - Get the largest CPU mapping order.
+ * @hmm_pfn: The current hmm_pfn.
+ * @hmm_pfn_index: Index of the @hmm_pfn within the pfn array.
+ * @npages: Number of pages within the pfn array i.e the hmm range size.
+ *
+ * To allow skipping PFNs with the same flags (like when they belong to
+ * the same huge PTE) when looping over the pfn array, take a given a hmm_pfn,
+ * and return the largest order that will fit inside the CPU PTE, but also
+ * crucially accounting for the original hmm range boundaries.
+ *
+ * Return: The largest order that will safely fit within the size of the hmm_pfn
+ * CPU PTE.
+ */
+static unsigned int drm_gpusvm_hmm_pfn_to_order(unsigned long hmm_pfn,
+						unsigned long hmm_pfn_index,
+						unsigned long npages)
+{
+	unsigned long size;
+
+	size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
+	size -= (hmm_pfn & ~HMM_PFN_FLAGS) & (size - 1);
+	hmm_pfn_index += size;
+	if (hmm_pfn_index > npages)
+		size -= (hmm_pfn_index - npages);
+
+	return ilog2(size);
+}
+
 /**
  * drm_gpusvm_check_pages() - Check pages
  * @gpusvm: Pointer to the GPU SVM structure
@@ -875,7 +904,7 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
 			err = -EFAULT;
 			goto err_free;
 		}
-		i += 0x1 << hmm_pfn_to_map_order(pfns[i]);
+		i += 0x1 << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 	}
 
 err_free:
@@ -1406,7 +1435,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	for (i = 0, j = 0; i < npages; ++j) {
 		struct page *page = hmm_pfn_to_page(pfns[i]);
 
-		order = hmm_pfn_to_map_order(pfns[i]);
+		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 		if (is_device_private_page(page) ||
 		    is_device_coherent_page(page)) {
 			if (zdd != page->zone_device_data && i > 0) {
-- 
2.49.0

