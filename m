Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9C79E971D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D690E10E762;
	Mon,  9 Dec 2024 13:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PshWHiwQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C4E10E75F;
 Mon,  9 Dec 2024 13:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751230; x=1765287230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RWlBI74UgxTE9VEQ4zxDfmkZ82fFFokHx6rswykANsg=;
 b=PshWHiwQ9HFaB3By2VqcivgxWhEnGl3TYf3iDOpWZPPy43lCctgSUSCr
 p6rFeqyyaFD9om31eDugzDAT1NiaEc9wXwv8jF7jIuaoAYGwHCIFG3tKl
 9Gi1wgIrjZe98zFat9xsDvij6vwa70D4pM4fwxSNI7A5ClNUPHhayEDs8
 BhbG3539EWUzfGX805KbRsQnj8xY4FmWPW/acjG8UEaJH2slN81DcOKkn
 7cp7Tz58DR/ZeigfSWbp73+fy8FYPawm0eeaapy3UWafiCjIrzqMzI64H
 btWDz+zE6oeLUcZeX0j9fkobOwYBLGRdl4k31yorqpYx7oGkZ15qrHUsi w==;
X-CSE-ConnectionGUID: BUs0LGE7SqmLz+aueFzWyA==
X-CSE-MsgGUID: FJ3B7mCvTquT0Dsg5chDlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192221"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192221"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:49 -0800
X-CSE-ConnectionGUID: lvKuYSf7ShW9DBObARJhNg==
X-CSE-MsgGUID: O76YidI9S+uG4OCtP0lHNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531398"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:48 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 26/26] drm/xe/eudebug: Enable EU pagefault handling
Date: Mon,  9 Dec 2024 15:33:17 +0200
Message-ID: <20241209133318.1806472-27-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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

From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
access will halt the corresponding EUs. To solve this problem, enable
EU pagefault handling functionality, which allows to unhalt pagefaulted
eu threads and to EU debugger to get inform about the eu attentions state
of EU threads during execution.

If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event to
the client connected to the xe_eudebug after handling the pagefault.

The pagefault handling is a mechanism that allows a stalled EU thread to
enter SIP mode by installing a temporal null page to the page table entry
where the pagefault happened.

A brief description of the page fault handling mechanism flow between KMD
and the eu thread is as follows

(1) eu thread accesses unallocated address
(2) pagefault happens and eu thread stalls
(3) XE kmd set an force eu thread exception to allow the running eu thread
    to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
    TD_CTL register)
    Not stalled (none-pagefaulted) eu threads enter SIP mode
(4) XE kmd installs temporal null page to the pagetable entry of the
    address where pagefault happened.
(5) XE kmd replies pagefault successful message to GUC
(6) stalled eu thread resumes as per pagefault condition has resolved
(7) resumed eu thread enters SIP mode due to force exception set by (3)

As designed this feature to only work when eudbug is enabled, it should
have no impact to regular recoverable pagefault code path.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 83 +++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 5558342b8e07..4e2883e19018 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -13,6 +13,7 @@
 
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
+#include "xe_eudebug.h"
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
@@ -199,12 +200,16 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
 	return vm;
 }
 
-static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
+static int handle_pagefault_start(struct xe_gt *gt, struct pagefault *pf,
+				  struct xe_vm **pf_vm,
+				  struct xe_eudebug_pagefault **eudebug_pf_out)
 {
-	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_eudebug_pagefault *eudebug_pf;
 	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_vm *vm;
+	struct xe_device *xe = gt_to_xe(gt);
+	bool  destroy_eudebug_pf = false;
 	struct xe_vma *vma = NULL;
+	struct xe_vm *vm;
 	int err;
 
 	/* SW isn't expected to handle TRTT faults */
@@ -215,6 +220,10 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
+	eudebug_pf = xe_eudebug_pagefault_create(gt, vm, pf->page_addr,
+						 pf->fault_type, pf->fault_level,
+						 pf->access_type);
+
 	/*
 	 * TODO: Change to read lock? Using write lock for simplicity.
 	 */
@@ -227,8 +236,27 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	vma = xe_gt_pagefault_lookup_vma(vm, pf->page_addr);
 	if (!vma) {
-		err = -EINVAL;
-		goto unlock_vm;
+		if (eudebug_pf)
+			vma = xe_vm_create_null_vma(vm, pf->page_addr);
+
+		if (IS_ERR_OR_NULL(vma)) {
+			err = -EINVAL;
+			if (eudebug_pf)
+				destroy_eudebug_pf = true;
+
+			goto unlock_vm;
+		}
+	} else {
+		/*
+		 * When creating an instance of eudebug_pagefault, there was
+		 * no vma containing the ppgtt address where the pagefault occurred,
+		 * but when reacquiring vm->lock, there is.
+		 * During not aquiring the vm->lock from this context,
+		 * but vma corresponding to the address where the pagefault occurred
+		 * in another context has allocated.
+		 */
+		if (eudebug_pf)
+			destroy_eudebug_pf = true;
 	}
 
 	err = handle_vma_pagefault(tile, pf, vma);
@@ -237,11 +265,43 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (!err)
 		vm->usm.last_fault_vma = vma;
 	up_write(&vm->lock);
-	xe_vm_put(vm);
+
+	if (destroy_eudebug_pf) {
+		xe_eudebug_pagefault_destroy(gt, vm, eudebug_pf, false);
+		*eudebug_pf_out = NULL;
+	} else {
+		*eudebug_pf_out = eudebug_pf;
+	}
+
+	/* while the lifetime of the eudebug pagefault instance, keep the VM instance.*/
+	if (!*eudebug_pf_out) {
+		xe_vm_put(vm);
+		*pf_vm = NULL;
+	} else {
+		*pf_vm = vm;
+	}
 
 	return err;
 }
 
+static void handle_pagefault_end(struct xe_gt *gt, struct xe_vm *vm,
+				 struct xe_eudebug_pagefault *eudebug_pf)
+{
+	/* if there no eudebug_pagefault then return */
+	if (!eudebug_pf)
+		return;
+
+	xe_eudebug_pagefault_process(gt, eudebug_pf);
+
+	/*
+	 * TODO: Remove VMA added to handle eudebug pagefault
+	 */
+
+	xe_eudebug_pagefault_destroy(gt, vm, eudebug_pf, true);
+
+	xe_vm_put(vm);
+}
+
 static int send_pagefault_reply(struct xe_guc *guc,
 				struct xe_guc_pagefault_reply *reply)
 {
@@ -367,7 +427,10 @@ static void pf_queue_work_func(struct work_struct *w)
 	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
 
 	while (get_pagefault(pf_queue, &pf)) {
-		ret = handle_pagefault(gt, &pf);
+		struct xe_eudebug_pagefault *eudebug_pf = NULL;
+		struct xe_vm *vm = NULL;
+
+		ret = handle_pagefault_start(gt, &pf, &vm, &eudebug_pf);
 		if (unlikely(ret)) {
 			print_pagefault(xe, &pf);
 			pf.fault_unsuccessful = 1;
@@ -385,7 +448,11 @@ static void pf_queue_work_func(struct work_struct *w)
 			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
 			FIELD_PREP(PFR_PDATA, pf.pdata);
 
-		send_pagefault_reply(&gt->uc.guc, &reply);
+		ret = send_pagefault_reply(&gt->uc.guc, &reply);
+		if (unlikely(ret))
+			drm_dbg(&xe->drm, "GuC Pagefault reply failed: %d\n", ret);
+
+		handle_pagefault_end(gt, vm, eudebug_pf);
 
 		if (time_after(jiffies, threshold) &&
 		    pf_queue->tail != pf_queue->head) {
-- 
2.43.0

