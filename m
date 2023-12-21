Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B39C81AE06
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E1810E654;
	Thu, 21 Dec 2023 04:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8FD10E654;
 Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132903; x=1734668903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8g4drANwyulLrmFls9iiZYQ/UPta8PRTj4VT7Sr2nDg=;
 b=MVi0rwGOeeWB37XolY2qk6jcqd/O+ash4ifYiE2slvvOirBHMu8ZN/Uu
 qgP30B9wO9fBdxsIR3SPbWJp7lD68pAKzi3LRfa3ym8bw2tdhS2QqrMs7
 GM/DwjE43yrZQkVj0ZXv7HbnrmKIakSXfIDgChPr1ZkMHhyEhTePhx11u
 t0ZX9i/AXlFEPIHYJjiheGFe8p7CV5q3yncJw17j94EFzgW208Zuu+oBO
 f05Lw4bqMWkVIL+w5SHgvPpsDhl0NHImCfu35nhKhLIEOk6nYtyuLhVha
 Ny2QHjjwUa6sMCAqIj4YXme979Wxy0/vMcPC9YbQRpJGC9w5J0JStVYuY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069776"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069776"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481385"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481385"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 16/22] drm/xe/svm: Implement the mmu notifier range invalidate
 callback
Date: Wed, 20 Dec 2023 23:38:06 -0500
Message-Id: <20231221043812.3783313-17-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231221043812.3783313-1-oak.zeng@intel.com>
References: <20231221043812.3783313-1-oak.zeng@intel.com>
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
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To mirror the CPU page table from GPU side, we register a mmu interval
notifier (in the coming patch of this series). Core mm call back to
GPU driver whenever there is a change to certain virtual address range,
i.e., range is released or unmapped by user etc.

This patch implemented the GPU driver callback function for such mmu
interval notifier. In the callback function we unbind the address
range from GPU if it is unmapped from CPU side, thus we mirror the
CPU page table change.

We also unregister the mmu interval notifier from core mm in the case
of munmap event. But we can't unregister mmu notifier directly from the
mmu notifier range invalidation callback function. The reason is, during
a munmap (see kernel function vm_munmap), a mmap_write_lock is held, but
unregister mmu notifier (calling mmu_interval_notifier_remove) also requires
a mmap_write_lock of the current process.

Thus, we start a kernel worker to unregister mmu interval notifier on a
MMU_NOTIFY_UNMAP event.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c       |  1 +
 drivers/gpu/drm/xe/xe_svm.h       |  1 -
 drivers/gpu/drm/xe/xe_svm_range.c | 37 ++++++++++++++++++++++++++++++-
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index ab3cc2121869..6393251c0051 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -8,6 +8,7 @@
 #include "xe_svm.h"
 #include <linux/hmm.h>
 #include <linux/scatterlist.h>
+#include "xe_pt.h"
 
 DEFINE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 90e665f2bfc6..0038f98c0cc7 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -54,7 +54,6 @@ struct xe_svm {
 struct xe_svm_range {
 	/** @svm: pointer of the xe_svm that this range belongs to */
 	struct xe_svm *svm;
-
 	/** @notifier: The mmu interval notifer used to keep track of CPU
 	 * side address range change. Driver will get a callback with this
 	 * notifier if anything changed from CPU side, such as range is
diff --git a/drivers/gpu/drm/xe/xe_svm_range.c b/drivers/gpu/drm/xe/xe_svm_range.c
index 286d5f7d6ecd..53dd3be7ab9f 100644
--- a/drivers/gpu/drm/xe/xe_svm_range.c
+++ b/drivers/gpu/drm/xe/xe_svm_range.c
@@ -10,6 +10,7 @@
 #include <linux/mutex.h>
 #include <linux/mm.h>
 #include "xe_svm.h"
+#include "xe_pt.h"
 
 /**
  * xe_svm_range_from_addr() - retrieve svm_range contains a virtual address
@@ -59,8 +60,42 @@ bool xe_svm_range_belongs_to_vma(struct mm_struct *mm,
 	return (vma1 == vma) && (vma2 == vma);
 }
 
+static bool xe_svm_range_invalidate(struct mmu_interval_notifier *mni,
+				      const struct mmu_notifier_range *range,
+				      unsigned long cur_seq)
+{
+	struct xe_svm_range *svm_range =
+		container_of(mni, struct xe_svm_range, notifier);
+	struct xe_svm *svm = svm_range->svm;
+	unsigned long length = range->end - range->start;
+
+	/*
+	 * MMU_NOTIFY_RELEASE is called upon process exit to notify driver
+	 * to release any process resources, such as zap GPU page table
+	 * mapping or unregister mmu notifier etc. We already clear GPU
+	 * page table  and unregister mmu notifier in in xe_destroy_svm,
+	 * upon process exit. So just simply return here.
+	 */
+	if (range->event == MMU_NOTIFY_RELEASE)
+		return true;
+
+	if (mmu_notifier_range_blockable(range))
+		mutex_lock(&svm->mutex);
+	else if (!mutex_trylock(&svm->mutex))
+		return false;
+
+	mmu_interval_set_seq(mni, cur_seq);
+	xe_invalidate_svm_range(svm->vm, range->start, length);
+	mutex_unlock(&svm->mutex);
+
+	if (range->event == MMU_NOTIFY_UNMAP)
+		queue_work(system_unbound_wq, &svm_range->unregister_notifier_work);
+
+	return true;
+}
+
 static const struct mmu_interval_notifier_ops xe_svm_mni_ops = {
-	.invalidate = NULL,
+	.invalidate = xe_svm_range_invalidate,
 };
 
 /**
-- 
2.26.3

