Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12450830EF7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 23:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126E910E898;
	Wed, 17 Jan 2024 22:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C2210E88C;
 Wed, 17 Jan 2024 22:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528906; x=1737064906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2kCKEQM0zRAF0jTpWpSPfvvYcsEoKW6S90DuXGUCuuo=;
 b=Z6EEhKIpjQwgRzYB94Y7tZvvJJoUKoMfrUmro68e6gVZU8FiolCD6vdS
 CsgVhWILlG3AGWFnKlkao+hDlTMwu9Ubbm1Kt4aFQ90QqOmHz+8M7iRob
 mTDc7lclwqQu30vfVS+akGtN/FcFUwi/ko/8GTRRYliadiejpXNsy7H5c
 2YF+pKOvQw7z5an3YfFU9Ub6n+uOWyEmnxyy3Mr8jMU6uGqeWN2a6hnbR
 DBPh1/LZ7SJzOdCVtpptNVrRhN7WYnSVJoEatpSjSLV0Gh0bVIk8LvxoT
 KbBLPk/96MHQS0pK8xNNRADNyK4xtY+V82cHdmp0FzXsMcX48OhfKe6ct Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7657619"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7657619"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734089233"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734089233"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:45 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table from
 hmm range
Date: Wed, 17 Jan 2024 17:12:06 -0500
Message-Id: <20240117221223.18540-7-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240117221223.18540-1-oak.zeng@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com,
 krishnaiah.bommu@intel.com, niranjana.vishwanathapura@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce xe_svm_build_sg helper function to build a scatter
gather table from a hmm_range struct. This is prepare work
for binding hmm range to gpu.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 52 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  3 +++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 559188471949..ab3cc2121869 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -6,6 +6,8 @@
 #include <linux/mutex.h>
 #include <linux/mm_types.h>
 #include "xe_svm.h"
+#include <linux/hmm.h>
+#include <linux/scatterlist.h>
 
 DEFINE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
 
@@ -61,3 +63,53 @@ struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm)
 
 	return NULL;
 }
+
+/**
+ * xe_svm_build_sg() - build a scatter gather table for all the physical pages/pfn
+ * in a hmm_range.
+ *
+ * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
+ * has the pfn numbers of pages that back up this hmm address range.
+ * @st: pointer to the sg table.
+ *
+ * All the contiguous pfns will be collapsed into one entry in
+ * the scatter gather table. This is for the convenience of
+ * later on operations to bind address range to GPU page table.
+ *
+ * This function allocates the storage of the sg table. It is
+ * caller's responsibility to free it calling sg_free_table.
+ *
+ * Returns 0 if successful; -ENOMEM if fails to allocate memory
+ */
+int xe_svm_build_sg(struct hmm_range *range,
+			     struct sg_table *st)
+{
+	struct scatterlist *sg;
+	u64 i, npages;
+
+	sg = NULL;
+	st->nents = 0;
+	npages = ((range->end - 1) >> PAGE_SHIFT) - (range->start >> PAGE_SHIFT) + 1;
+
+	if (unlikely(sg_alloc_table(st, npages, GFP_KERNEL)))
+		return -ENOMEM;
+
+	for (i = 0; i < npages; i++) {
+		unsigned long addr = range->hmm_pfns[i];
+
+		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
+			sg->length += PAGE_SIZE;
+			sg_dma_len(sg) += PAGE_SIZE;
+			continue;
+		}
+
+		sg =  sg ? sg_next(sg) : st->sgl;
+		sg_dma_address(sg) = addr;
+		sg_dma_len(sg) = PAGE_SIZE;
+		sg->length = PAGE_SIZE;
+		st->nents++;
+	}
+
+	sg_mark_end(sg);
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 3ed106ecc02b..191bce6425db 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -13,6 +13,8 @@
 #include <linux/interval_tree.h>
 #include <linux/hashtable.h>
 #include <linux/types.h>
+#include <linux/hmm.h>
+#include "xe_device_types.h"
 
 struct xe_vm;
 struct mm_struct;
@@ -69,4 +71,5 @@ struct xe_svm *xe_create_svm(struct xe_vm *vm);
 struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
 struct xe_svm_range *xe_svm_range_from_addr(struct xe_svm *svm,
 								unsigned long addr);
+int xe_svm_build_sg(struct hmm_range *range, struct sg_table *st);
 #endif
-- 
2.26.3

