Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D044B2AC8F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58C710E485;
	Mon, 18 Aug 2025 15:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrDNwxzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442FB10E482;
 Mon, 18 Aug 2025 15:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755530526; x=1787066526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ktjAk4RjZEVCNeaaqlgO31gLWgLkJh50MPNUnjLPmNA=;
 b=TrDNwxzTgpYimybUR8Mdl9TUu0R9w1p5EJP9inYrHrkcainHQDbYDXOZ
 ID/LW/vgqkmqkr8au/AIGaiGG1BRPdJqr0M8MQ8fTKszoGj1UfJ3rjF4S
 bSrrV3rOjwrz4dJzdyBcprPBMkqpmEU3/PouBQ50a4ZTuI1tub4+9GTTu
 6RojdfHMvQL+JJB6qPjCZiZRVgMS1dnCbpVlJyKKVYOj83jIbsB6bIZj9
 d/dqMGIBEtUn8t57DJFUsrQPA3DRtnxWXu4/yswkQ3krn7fNN4hXTQQoY
 ANflZ+0NXJwTMeV3SUwwd1AMcIjZf1pPyBeS0YeY89H9I9Sa9FDO9M0uM g==;
X-CSE-ConnectionGUID: nLzCx976TMWo+X4evspnYQ==
X-CSE-MsgGUID: ipO4CEWnSfiD+8FUonolGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69205833"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="69205833"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:22:06 -0700
X-CSE-ConnectionGUID: 2A8jsZ9lTpyTpAxriwUTXg==
X-CSE-MsgGUID: 4+k0X96CR/CJvtwlPhyBlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171837205"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:22:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 1/8] drm/gpusvm: fix hmm_pfn_to_map_order() usage
Date: Mon, 18 Aug 2025 16:21:54 +0100
Message-ID: <20250818152152.67815-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818152152.67815-10-matthew.auld@intel.com>
References: <20250818152152.67815-10-matthew.auld@intel.com>
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
index 661306da6b2d..50a36e7b71e2 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -708,6 +708,35 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
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
@@ -766,7 +795,7 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
 			err = -EFAULT;
 			goto err_free;
 		}
-		i += 0x1 << hmm_pfn_to_map_order(pfns[i]);
+		i += 0x1 << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 	}
 
 err_free:
@@ -1342,7 +1371,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	for (i = 0, j = 0; i < npages; ++j) {
 		struct page *page = hmm_pfn_to_page(pfns[i]);
 
-		order = hmm_pfn_to_map_order(pfns[i]);
+		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 		if (is_device_private_page(page) ||
 		    is_device_coherent_page(page)) {
 			if (zdd != page->zone_device_data && i > 0) {
-- 
2.50.1

