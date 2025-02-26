Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6937DA46ED5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 23:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0853B10E0A0;
	Wed, 26 Feb 2025 22:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2b5kmbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6239910E0A0;
 Wed, 26 Feb 2025 22:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740610559; x=1772146559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fp8OpIP1ZSNFu4GkJIRvnhQjWAr6y2TnupYGBm8bZrI=;
 b=Z2b5kmbT6YSHUHOc5wSjJK0U90pxp8Slc2mpCyvcpAj+mu0+wg+iuh8A
 zBmQ/QepuU8h3mdFkrYAufLzddlJjz5x7XexXi37zOAWQNPcxgcm3dGur
 ymb2Y1r4Cis2c66Za68kQbM4j+enYDFceMNcF8ACv56kGC/VTeGJHl42x
 DwP9l9fdDLrR8ZoVhYj7RVH6Tc2D5FDadvlbZeEt6tuA+sGlw/2IUdvjz
 F5Gva5EVqkpPCM0+czLr2onHCC6U58XNdxNIc1VBEH+lgFvlUwDiL9RuD
 RMHMGHn7EY/+Isr/9/FCNHoQT0higI80ezOG51J/iebOePwVHw4PssQiM A==;
X-CSE-ConnectionGUID: eKAM5O97Ti+N9NyjtF4xkA==
X-CSE-MsgGUID: uD8u7K1uRDCx63qsyeurYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44308775"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="44308775"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:58 -0800
X-CSE-ConnectionGUID: l7NcPnF8T7u3NSL2MvzK/w==
X-CSE-MsgGUID: lejbgj8KSE6FN4Uad+VjaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="117326773"
Received: from dut4025lnl.fm.intel.com ([10.105.10.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
Date: Wed, 26 Feb 2025 22:55:53 +0000
Message-ID: <20250226225557.133076-4-jonathan.cavitt@intel.com>
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

Migrate the pagefault struct from xe_gt_pagefault.c to the
xe_gt_pagefault.h header file, along with the associated enum values.

v2: Normalize names for common header (Matt Brost)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 41 +++++-----------------------
 drivers/gpu/drm/xe/xe_gt_pagefault.h | 28 +++++++++++++++++++
 2 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 4a4cf0c4b68d..76d7feecf98e 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -22,33 +22,6 @@
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
 
-struct pagefault {
-	u64 page_addr;
-	u32 asid;
-	u16 pdata;
-	u8 vfid;
-	u8 access_type;
-	u8 fault_type;
-	u8 fault_level;
-	u8 engine_class;
-	u8 engine_instance;
-	u8 fault_unsuccessful;
-	bool trva_fault;
-};
-
-enum access_type {
-	ACCESS_TYPE_READ = 0,
-	ACCESS_TYPE_WRITE = 1,
-	ACCESS_TYPE_ATOMIC = 2,
-	ACCESS_TYPE_RESERVED = 3,
-};
-
-enum fault_type {
-	NOT_PRESENT = 0,
-	WRITE_ACCESS_VIOLATION = 1,
-	ATOMIC_ACCESS_VIOLATION = 2,
-};
-
 struct acc {
 	u64 va_range_base;
 	u32 asid;
@@ -60,9 +33,9 @@ struct acc {
 	u8 engine_instance;
 };
 
-static bool access_is_atomic(enum access_type access_type)
+static bool access_is_atomic(enum xe_pagefault_access_type access_type)
 {
-	return access_type == ACCESS_TYPE_ATOMIC;
+	return access_type == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
 }
 
 static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
@@ -102,7 +75,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	return 0;
 }
 
-static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
+static int handle_vma_pagefault(struct xe_gt *gt, struct xe_pagefault *pf,
 				struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -181,7 +154,7 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
 	return vm;
 }
 
-static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
+static int handle_pagefault(struct xe_gt *gt, struct xe_pagefault *pf)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_vm *vm;
@@ -235,7 +208,7 @@ static int send_pagefault_reply(struct xe_guc *guc,
 	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
+static void print_pagefault(struct xe_device *xe, struct xe_pagefault *pf)
 {
 	drm_dbg(&xe->drm, "\n\tASID: %d\n"
 		 "\tVFID: %d\n"
@@ -255,7 +228,7 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
 
 #define PF_MSG_LEN_DW	4
 
-static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
+static bool get_pagefault(struct pf_queue *pf_queue, struct xe_pagefault *pf)
 {
 	const struct xe_guc_pagefault_desc *desc;
 	bool ret = false;
@@ -342,7 +315,7 @@ static void pf_queue_work_func(struct work_struct *w)
 	struct xe_gt *gt = pf_queue->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc_pagefault_reply reply = {};
-	struct pagefault pf = {};
+	struct xe_pagefault pf = {};
 	unsigned long threshold;
 	int ret;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
index 839c065a5e4c..33616043d17a 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
@@ -11,6 +11,34 @@
 struct xe_gt;
 struct xe_guc;
 
+struct xe_pagefault {
+	u64 page_addr;
+	u32 asid;
+	u16 pdata;
+	u8 vfid;
+	u8 access_type;
+	u8 fault_type;
+	u8 fault_level;
+	u8 engine_class;
+	u8 engine_instance;
+	u8 fault_unsuccessful;
+	bool prefetch;
+	bool trva_fault;
+};
+
+enum xe_pagefault_access_type {
+	XE_PAGEFAULT_ACCESS_TYPE_READ = 0,
+	XE_PAGEFAULT_ACCESS_TYPE_WRITE = 1,
+	XE_PAGEFAULT_ACCESS_TYPE_ATOMIC = 2,
+	XE_PAGEFAULT_ACCESS_TYPE_RESERVED = 3,
+};
+
+enum xe_pagefault_type {
+	XE_PAGEFAULT_TYPE_NOT_PRESENT = 0,
+	XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION = 1,
+	XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION = 2,
+};
+
 int xe_gt_pagefault_init(struct xe_gt *gt);
 void xe_gt_pagefault_reset(struct xe_gt *gt);
 int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
-- 
2.43.0

