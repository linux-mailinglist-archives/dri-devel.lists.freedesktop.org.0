Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617BBA46ED3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 23:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0F810E9F2;
	Wed, 26 Feb 2025 22:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8IQzrOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF69810E00E;
 Wed, 26 Feb 2025 22:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740610559; x=1772146559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rqIUUaaHokHlIA6TyPc04TRi5RIbo1YwT3LOaOjKLxI=;
 b=d8IQzrOtCA1ljbxKK+v8dVaTCtqvRW8C6EaRYMsm/quxpmiHXnDQcfm1
 wjFMbWM6yKPocpm3BGXLSy3/1bHEmHdrav+rrPWnmkinsShYcAoPIwZMP
 iHumy28sDAiRZ/0SJTPaFfW/SN/74ZkyYmjTdGS/gHgpuiGLhl8dhclWE
 lxdAhcfcH1BfCzCQIFKhZNl4OWeGqMUiPOr7V0bE1tkqmfdvLup+CO+hb
 0JbIJ27Ie3pizY0AXSydCftBV30otsthPTuo48hBatzGUwceaWJgR9QRV
 5nRvEGM1v2SCGxDLuNE6KW9IcV5Ca/rZCH+0cVwsXonGbWZIdgQEjQl4J g==;
X-CSE-ConnectionGUID: ZH2T6+a3S5CN8WtEYynU+Q==
X-CSE-MsgGUID: IuNZoayXQsqGhXK4FWMCLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44308773"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="44308773"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:58 -0800
X-CSE-ConnectionGUID: IxZETY0YRSitPteeZCAZEQ==
X-CSE-MsgGUID: +8F20MFxS12V1mlR9N2lmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="117326768"
Received: from dut4025lnl.fm.intel.com ([10.105.10.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/xe/xe_gt_pagefault: Migrate lookup_vma to xe_vm.h
Date: Wed, 26 Feb 2025 22:55:51 +0000
Message-ID: <20250226225557.133076-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226225557.133076-1-jonathan.cavitt@intel.com>
References: <20250226225557.133076-1-jonathan.cavitt@intel.com>
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

Make lookup_vma a static inline header function for xe_vm.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 25 +------------------------
 drivers/gpu/drm/xe/xe_vm.h           | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 17d69039b866..4a4cf0c4b68d 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -71,29 +71,6 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 		!(BIT(tile->id) & vma->tile_invalidated);
 }
 
-static bool vma_matches(struct xe_vma *vma, u64 page_addr)
-{
-	if (page_addr > xe_vma_end(vma) - 1 ||
-	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
-		return false;
-
-	return true;
-}
-
-static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
-{
-	struct xe_vma *vma = NULL;
-
-	if (vm->usm.last_fault_vma) {   /* Fast lookup */
-		if (vma_matches(vm->usm.last_fault_vma, page_addr))
-			vma = vm->usm.last_fault_vma;
-	}
-	if (!vma)
-		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
-
-	return vma;
-}
-
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 		       bool atomic, unsigned int id)
 {
@@ -229,7 +206,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
-	vma = lookup_vma(vm, pf->page_addr);
+	vma = xe_vm_lookup_vma(vm, pf->page_addr);
 	if (!vma) {
 		err = -EINVAL;
 		goto unlock_vm;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index f66075f8a6fe..fb3f15ee89ec 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -248,6 +248,30 @@ bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
+static bool vma_matches(struct xe_vma *vma, u64 page_addr)
+{
+	if (page_addr > xe_vma_end(vma) - 1 ||
+	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
+		return false;
+
+	return true;
+}
+
+static inline struct xe_vma *xe_vm_lookup_vma(struct xe_vm *vm, u64 page_addr)
+{
+	struct xe_vma *vma = NULL;
+
+	if (vm->usm.last_fault_vma) {   /* Fast lookup */
+		if (vma_matches(vm->usm.last_fault_vma, page_addr))
+			vma = vm->usm.last_fault_vma;
+	}
+	if (!vma)
+		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
+
+	return vma;
+}
+
+
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
 			  unsigned int num_fences);
 
-- 
2.43.0

