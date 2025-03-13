Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DE1A5FF50
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 19:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5052310E910;
	Thu, 13 Mar 2025 18:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQmfwW2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998FE10E90F;
 Thu, 13 Mar 2025 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741890858; x=1773426858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c10iHRPfUSzVWdJ19XvLqKIooqItU5iV2rOyI2mR3ls=;
 b=LQmfwW2t82wjmATRf39R5AtrdL3u1QsRTQi6E0L9WWYLHY3Dmbx4UdHp
 oOmNURBpZGqesl8h/igV0V+rKs/PraMTS+yugYD1H/Z4vsv/kh8BLzQU4
 KIOTVIq1FWptloy/nBXxrw1ZIL7VH4rVflPB6qZaHtGy6kyXlb7r3yhwz
 8a7B5O7tJa00mPDbzCIFZzNNdWz+2hl/MlPQ45ZITI6n8WgC75dwdrVWC
 KwE+eYL2Si70wRqhxwuwtWDIitPKcKUMIj+H0Q3ckIC3fn7eLnM5M/yI9
 ODeBQWuw/d92fwl+k2AfVyI/WtrUlu61kCCMv9/HTSGoRn2RJVSZ3KaKB w==;
X-CSE-ConnectionGUID: w9lzwtWxRqufm1LF2zPtbQ==
X-CSE-MsgGUID: fVJ2Ub48Rw6xUaSj2m3Pkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="65485459"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="65485459"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 11:34:17 -0700
X-CSE-ConnectionGUID: uibQ0TL/SEGEuLtWidMKLA==
X-CSE-MsgGUID: hl23cZMxR6eehM7m+PeXpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="151900772"
Received: from dut4440lnl.fm.intel.com ([10.105.10.40])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 11:34:17 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mzorek@intel.com
Subject: [PATCH v8 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to header
Date: Thu, 13 Mar 2025 18:34:04 +0000
Message-ID: <20250313183415.133863-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313183415.133863-1-jonathan.cavitt@intel.com>
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
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

Move the pagefault struct from xe_gt_pagefault.c to the
xe_gt_pagefault_types.h header file, along with the associated enum values.

v2:
- Normalize names for common header (Matt Brost)

v3:
- s/Migrate/Move (Michal W)
- s/xe_pagefault/xe_gt_pagefault (Michal W)
- Create new header file, xe_gt_pagefault_types.h (Michal W)
- Add kernel docs (Michal W)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c       | 41 +++----------
 drivers/gpu/drm/xe/xe_gt_pagefault.h       |  2 +
 drivers/gpu/drm/xe/xe_gt_pagefault_types.h | 67 ++++++++++++++++++++++
 3 files changed, 76 insertions(+), 34 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3240890aac07..06a4e3fdc11d 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -23,33 +23,6 @@
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
@@ -61,9 +34,9 @@ struct acc {
 	u8 engine_instance;
 };
 
-static bool access_is_atomic(enum access_type access_type)
+static bool access_is_atomic(enum xe_gt_pagefault_access_type access_type)
 {
-	return access_type == ACCESS_TYPE_ATOMIC;
+	return access_type == XE_GT_PAGEFAULT_ACCESS_TYPE_ATOMIC;
 }
 
 static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
@@ -205,7 +178,7 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
 	return vm;
 }
 
-static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
+static int handle_pagefault(struct xe_gt *gt, struct xe_gt_pagefault *pf)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_vm *vm;
@@ -237,7 +210,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
-	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
+	if (xe_vma_read_only(vma) && pf->access_type != XE_GT_PAGEFAULT_ACCESS_TYPE_READ) {
 		err = -EPERM;
 		goto unlock_vm;
 	}
@@ -271,7 +244,7 @@ static int send_pagefault_reply(struct xe_guc *guc,
 	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
+static void print_pagefault(struct xe_device *xe, struct xe_gt_pagefault *pf)
 {
 	drm_dbg(&xe->drm, "\n\tASID: %d\n"
 		 "\tVFID: %d\n"
@@ -291,7 +264,7 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
 
 #define PF_MSG_LEN_DW	4
 
-static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
+static bool get_pagefault(struct pf_queue *pf_queue, struct xe_gt_pagefault *pf)
 {
 	const struct xe_guc_pagefault_desc *desc;
 	bool ret = false;
@@ -378,7 +351,7 @@ static void pf_queue_work_func(struct work_struct *w)
 	struct xe_gt *gt = pf_queue->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc_pagefault_reply reply = {};
-	struct pagefault pf = {};
+	struct xe_gt_pagefault pf = {};
 	unsigned long threshold;
 	int ret;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
index 839c065a5e4c..69b700c4915a 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
@@ -8,6 +8,8 @@
 
 #include <linux/types.h>
 
+#include "xe_gt_pagefault_types.h"
+
 struct xe_gt;
 struct xe_guc;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
new file mode 100644
index 000000000000..90b7085d4b8e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022-2025 Intel Corporation
+ */
+
+#ifndef _XE_GT_PAGEFAULT_TYPES_H_
+#define _XE_GT_PAGEFAULT_TYPES_H_
+
+/**
+ * struct xe_gt_pagefault - Structure of pagefaults returned by the
+ * pagefault handler
+ */
+struct xe_gt_pagefault {
+	/** @page_addr: faulted address of this pagefault */
+	u64 page_addr;
+	/** @asid: ASID of this pagefault */
+	u32 asid;
+	/** @pdata: PDATA of this pagefault */
+	u16 pdata;
+	/** @vfid: VFID of this pagefault */
+	u8 vfid;
+	/**
+	 * @access_type: access type of this pagefault, as a value
+	 * from xe_gt_pagefault_access_type
+	 */
+	u8 access_type;
+	/**
+	 * @fault_type: fault type of this pagefault, as a value
+	 * from xe_gt_pagefault_fault_type
+	 */
+	u8 fault_type;
+	/** @fault_level: fault level of this pagefault */
+	u8 fault_level;
+	/** @engine_class: engine class this pagefault was reported on */
+	u8 engine_class;
+	/** @engine_instance: engine instance this pagefault was reported on */
+	u8 engine_instance;
+	/** @fault_unsuccessful: flag for if the pagefault recovered or not */
+	u8 fault_unsuccessful;
+	/** @prefetch: unused */
+	bool prefetch;
+	/** @trva_fault: is set if this is a TRTT fault */
+	bool trva_fault;
+};
+
+/**
+ * enum xe_gt_pagefault_access_type - Access type reported to the xe_gt_pagefault
+ * struct.  Saved to xe_gt_pagefault@access_type
+ */
+enum xe_gt_pagefault_access_type {
+	XE_GT_PAGEFAULT_ACCESS_TYPE_READ = 0,
+	XE_GT_PAGEFAULT_ACCESS_TYPE_WRITE = 1,
+	XE_GT_PAGEFAULT_ACCESS_TYPE_ATOMIC = 2,
+	XE_GT_PAGEFAULT_ACCESS_TYPE_RESERVED = 3,
+};
+
+/**
+ * enum xe_gt_pagefault_fault_type - Fault type reported to the xe_gt_pagefault
+ * struct.  Saved to xe_gt_pagefault@fault_type
+ */
+enum xe_gt_pagefault_fault_type {
+	XE_GT_PAGEFAULT_TYPE_NOT_PRESENT = 0,
+	XE_GT_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION = 1,
+	XE_GT_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION = 2,
+};
+
+#endif
-- 
2.43.0

