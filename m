Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E7FA7502D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A2210EA79;
	Fri, 28 Mar 2025 18:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIgbYpCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F5210EA77;
 Fri, 28 Mar 2025 18:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185460; x=1774721460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l4qOLa4RFgjHuGD6O1k+7wNXQy7X1UR8Z0qLndxUhr8=;
 b=bIgbYpCT9VFaKqf31EGums4LJ2Ky0mKXT4XTF0qDqJ16Sbj3A7nooWbo
 /epnnOuaSECsmjV21IprigpsLxEBuqRmrKIV8GBW0Gg/J75EQAu6902sO
 NxkBRMHUf3Nm8gou1vYEpSIXQHU/39CIABN82Jgi+2LfiEgR9Euq1EgNG
 N/SKyhEmGULrzV3hs7AzD9j2MoXNbemiC9fZ9o8qr3lWsJfckCUV2vcfT
 wkTZ2oL+YDKIWsCc3JEQVsUBm6chNVrE2fVE36mrsNt9m8doS4NALPZaO
 u5sRa3kEfPejTVCn+6xIBIuKtYaUVJOFKaiX6pFhs/B0vwWd1Du0Wqy+6 A==;
X-CSE-ConnectionGUID: TzuprrV3R2SFjAe8UqwALg==
X-CSE-MsgGUID: G2eqdyDpTn2T5wh5Ny7s/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55926113"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55926113"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:11:00 -0700
X-CSE-ConnectionGUID: mXyhupw+RwOUVVcq93Lr7g==
X-CSE-MsgGUID: KO3eaPIsQsGPOdFDgsAjqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="156435992"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.28])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:10:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/7] drm/gpusvm: fix hmm_pfn_to_map_order() usage
Date: Fri, 28 Mar 2025 18:10:30 +0000
Message-ID: <20250328181028.288312-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328181028.288312-9-matthew.auld@intel.com>
References: <20250328181028.288312-9-matthew.auld@intel.com>
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
index 2451c816edd5..07dda042624c 100644
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
@@ -1408,7 +1437,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	for (i = 0, j = 0; i < npages; ++j) {
 		struct page *page = hmm_pfn_to_page(pfns[i]);
 
-		order = hmm_pfn_to_map_order(pfns[i]);
+		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 		if (is_device_private_page(page) ||
 		    is_device_coherent_page(page)) {
 			if (zdd != page->zone_device_data && i > 0) {
-- 
2.48.1

