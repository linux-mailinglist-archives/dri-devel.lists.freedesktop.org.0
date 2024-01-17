Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52869830EF8
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 23:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487D010E89D;
	Wed, 17 Jan 2024 22:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAE910E008;
 Wed, 17 Jan 2024 22:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528907; x=1737064907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DvvH7NtHW9nUlBiiyDf7YOEY8dGNxdPjcParxe0AZoM=;
 b=Buy+4oVFgUq67SBNM93kkqmo7o77DGNkdTIPP8hUJacatwLxrfRTv8JE
 lcf7x46w9z3Ejy/VRgSRjJvykLoYYe9bznY63JMHiHNZ41SJdrwAoEhie
 ngqykuTg84OWoRVJPBYUNscS6R2mvNOntv5DVAV4Ot4+HO3FQJCg5NZcH
 oy4THu+eBxjNaogk+JAs7fBjw8YtOvGhv6TP3Rel7aFM7qh13hw9M52wk
 20ZjaLKctn7LuzjeAF6nUKDKy35dpZB55g7Cw6Dq0r1N/fEJ1+yG4DxoG
 MeV+MVpG6ypAyDDiutbStu/P21ljCrEvvVOzpoFVcp28Sp8EoXB8qqBdV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7657621"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7657621"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734089240"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734089240"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:45 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 08/23] drm/xe/svm: Add helper to invalidate svm range from GPU
Date: Wed, 17 Jan 2024 17:12:08 -0500
Message-Id: <20240117221223.18540-9-oak.zeng@intel.com>
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

A svm subsystem friendly function is added for svm range invalidation
purpose. svm subsystem doesn't maintain xe_vma, so a temporary xe_vma
is used to call function xe_vma_invalidate_vma

Not sure whether this works or not. Will have to test. if a temporary
vma doesn't work, we will have to call the zap_pte/tlb_inv functions
directly.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pt.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f1e479fa3001..7ae8954be041 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1757,3 +1757,36 @@ int xe_bind_svm_range(struct xe_vm *vm, struct xe_tile *tile,
 	dma_fence_put(fence);
 	return ret;
 }
+
+/**
+ * xe_invalidate_svm_range() - a helper to invalidate a svm address range
+ *
+ * @vm: The vm that the address range belongs to
+ * @start: start of the virtual address range
+ * @size: size of the virtual address range
+ *
+ * This is a helper function supposed to be used by svm subsystem.
+ * svm subsystem doesn't maintain xe_vma, so we create a temporary
+ * xe_vma structure so we can reuse xe_vm_invalidate_vma().
+ */
+void xe_invalidate_svm_range(struct xe_vm *vm, u64 start, u64 size)
+{
+	struct xe_vma vma = {
+		.gpuva = {
+			.va = {
+				.addr = start,
+				.range = size,
+			},
+			.vm = &vm->gpuvm,
+		},
+		/** invalidate from all tiles
+		 *  FIXME: We used temporary vma in xe_bind_svm_range, so
+		 *  we lost track of which tile we are bound to. Does
+		 *  setting tile_present to all tiles cause a problem
+		 *  in xe_vm_invalidate_vma()?
+		 */
+		.tile_present = BIT(vm->xe->info.tile_count) - 1,
+	};
+
+	xe_vm_invalidate_vma(&vma);
+}
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 775d08707466..42d495997635 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -49,4 +49,5 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 
 int xe_bind_svm_range(struct xe_vm *vm, struct xe_tile *tile,
 			struct hmm_range *range, u64 flags);
+void xe_invalidate_svm_range(struct xe_vm *vm, u64 start, u64 size);
 #endif
-- 
2.26.3

