Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB41EA75186
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 21:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288F510EABE;
	Fri, 28 Mar 2025 20:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjO/0v2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C483610E1D1;
 Fri, 28 Mar 2025 20:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743194448; x=1774730448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cgto85fKuTD8MpW293iqRYh8Sld8vy1+NG6nM7iS8z4=;
 b=jjO/0v2pYJ8Kvi6Q4hlfeEzsOJ/AQnRjr/OtAGds7ndovPXVKxigOvw8
 VfSis0csbE4B8knqjL/fv2418SOtakvX9/Lxp52O0NZYQ8HjkM+LAwiwu
 I2mpCR8NFnhJAA2yy1yMGMGVB2ozestF+TXTTc15cN/VevDxSf8U9tlCE
 ELB3L3wC92UtTGOia3KjSo22fupHait1rYtFXGDpArQ0HT3ndtMWWGxrR
 QUbnm3eM5efBoNdd62AP33dDWe4vB2ni0wcF30fiMurPAy6iLwPIWSDW1
 qKiXXI3hlLtWIN6ZtRV8B12nATPGJ/ZmVU69cHkVECBTgQOtfj903I92Y w==;
X-CSE-ConnectionGUID: r6F9nRhPSleNgFIFDnpa2Q==
X-CSE-MsgGUID: YAHwAbvxQbiQbytHfUoW3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55230028"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55230028"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:40:46 -0700
X-CSE-ConnectionGUID: OstkcWTmRrCS3qLgWoWCVA==
X-CSE-MsgGUID: 7wSHwHVkQveP2rUjURmabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="129673616"
Received: from dut4086lnl.fm.intel.com ([10.105.10.92])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:40:47 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com
Subject: [PATCH v15 3/6] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Date: Fri, 28 Mar 2025 20:40:40 +0000
Message-ID: <20250328204045.157914-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328204045.157914-1-jonathan.cavitt@intel.com>
References: <20250328204045.157914-1-jonathan.cavitt@intel.com>
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
xe_gt_pagefault_types.h header file, and move the associated enum values
into the regs folder under xe_pagefault_desc.h

Since xe_pagefault_desc.h is being initialized here, also move the
xe_guc_pagefault_desc hardware formats to the new file.

v2:
- Normalize names for common header (Matt Brost)

v3:
- s/Migrate/Move (Michal W)
- s/xe_pagefault/xe_gt_pagefault (Michal W)
- Create new header file, xe_gt_pagefault_types.h (Michal W)
- Add kernel docs (Michal W)

v4:
- Fix includes usage (Michal W)
- Reference Bspec (Michal W)

v5:
- Convert enums to defines in regs folder (Michal W)
- Move xe_guc_pagefault_desc to regs folder (Michal W)

Bspec: 77412
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h | 50 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_pagefault.c        | 43 ++++--------------
 drivers/gpu/drm/xe/xe_gt_pagefault_types.h  | 42 +++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_fwif.h            | 28 ------------
 4 files changed, 101 insertions(+), 62 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h

diff --git a/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h b/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
new file mode 100644
index 000000000000..cfa18cb8e8ac
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PAGEFAULT_DESC_H_
+#define _XE_PAGEFAULT_DESC_H_
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+struct xe_guc_pagefault_desc {
+	u32 dw0;
+#define PFD_FAULT_LEVEL		GENMASK(2, 0)
+#define PFD_SRC_ID		GENMASK(10, 3)
+#define PFD_RSVD_0		GENMASK(17, 11)
+#define XE2_PFD_TRVA_FAULT	BIT(18)
+#define PFD_ENG_INSTANCE	GENMASK(24, 19)
+#define PFD_ENG_CLASS		GENMASK(27, 25)
+#define PFD_PDATA_LO		GENMASK(31, 28)
+
+	u32 dw1;
+#define PFD_PDATA_HI		GENMASK(11, 0)
+#define PFD_PDATA_HI_SHIFT	4
+#define PFD_ASID		GENMASK(31, 12)
+
+	u32 dw2;
+#define PFD_ACCESS_TYPE		GENMASK(1, 0)
+#define PFD_FAULT_TYPE		GENMASK(3, 2)
+#define PFD_VFID		GENMASK(9, 4)
+#define PFD_RSVD_1		BIT(10)
+#define XE3P_PFD_PREFETCH	BIT(11)
+#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
+#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
+
+	u32 dw3;
+#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
+#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
+} __packed;
+
+#define FLT_ACCESS_TYPE_READ		0u
+#define FLT_ACCESS_TYPE_WRITE		1u
+#define FLT_ACCESS_TYPE_ATOMIC		2u
+#define FLT_ACCESS_TYPE_RESERVED	3u
+
+#define FLT_TYPE_NOT_PRESENT_FAULT		0u
+#define FLT_TYPE_WRITE_ACCESS_VIOLATION		1u
+#define FLT_TYPE_ATOMIC_ACCESS_VIOLATION	2u
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3240890aac07..0cedf089a3f2 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -12,8 +12,10 @@
 #include <drm/drm_managed.h>
 
 #include "abi/guc_actions_abi.h"
+#include "regs/xe_pagefault_desc.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_pagefault_types.h"
 #include "xe_gt_stats.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
@@ -23,33 +25,6 @@
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
@@ -61,9 +36,9 @@ struct acc {
 	u8 engine_instance;
 };
 
-static bool access_is_atomic(enum access_type access_type)
+static bool access_is_atomic(u32 access_type)
 {
-	return access_type == ACCESS_TYPE_ATOMIC;
+	return access_type == FLT_ACCESS_TYPE_ATOMIC;
 }
 
 static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
@@ -205,7 +180,7 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
 	return vm;
 }
 
-static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
+static int handle_pagefault(struct xe_gt *gt, struct xe_gt_pagefault *pf)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_vm *vm;
@@ -237,7 +212,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
-	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
+	if (xe_vma_read_only(vma) && pf->access_type != FLT_ACCESS_TYPE_READ) {
 		err = -EPERM;
 		goto unlock_vm;
 	}
@@ -271,7 +246,7 @@ static int send_pagefault_reply(struct xe_guc *guc,
 	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
+static void print_pagefault(struct xe_device *xe, struct xe_gt_pagefault *pf)
 {
 	drm_dbg(&xe->drm, "\n\tASID: %d\n"
 		 "\tVFID: %d\n"
@@ -291,7 +266,7 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
 
 #define PF_MSG_LEN_DW	4
 
-static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
+static bool get_pagefault(struct pf_queue *pf_queue, struct xe_gt_pagefault *pf)
 {
 	const struct xe_guc_pagefault_desc *desc;
 	bool ret = false;
@@ -378,7 +353,7 @@ static void pf_queue_work_func(struct work_struct *w)
 	struct xe_gt *gt = pf_queue->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc_pagefault_reply reply = {};
-	struct pagefault pf = {};
+	struct xe_gt_pagefault pf = {};
 	unsigned long threshold;
 	int ret;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
new file mode 100644
index 000000000000..b7d41b558de3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022-2025 Intel Corporation
+ */
+
+#ifndef _XE_GT_PAGEFAULT_TYPES_H_
+#define _XE_GT_PAGEFAULT_TYPES_H_
+
+#include <linux/types.h>
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
+	/** @access_type: access type of this pagefault */
+	u8 access_type;
+	/** @fault_type: fault type of this pagefault */
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
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 6f57578b07cb..30ac21bb4f15 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -290,34 +290,6 @@ enum xe_guc_response_desc_type {
 	FAULT_RESPONSE_DESC
 };
 
-struct xe_guc_pagefault_desc {
-	u32 dw0;
-#define PFD_FAULT_LEVEL		GENMASK(2, 0)
-#define PFD_SRC_ID		GENMASK(10, 3)
-#define PFD_RSVD_0		GENMASK(17, 11)
-#define XE2_PFD_TRVA_FAULT	BIT(18)
-#define PFD_ENG_INSTANCE	GENMASK(24, 19)
-#define PFD_ENG_CLASS		GENMASK(27, 25)
-#define PFD_PDATA_LO		GENMASK(31, 28)
-
-	u32 dw1;
-#define PFD_PDATA_HI		GENMASK(11, 0)
-#define PFD_PDATA_HI_SHIFT	4
-#define PFD_ASID		GENMASK(31, 12)
-
-	u32 dw2;
-#define PFD_ACCESS_TYPE		GENMASK(1, 0)
-#define PFD_FAULT_TYPE		GENMASK(3, 2)
-#define PFD_VFID		GENMASK(9, 4)
-#define PFD_RSVD_1		GENMASK(11, 10)
-#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
-#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
-
-	u32 dw3;
-#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
-#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
-} __packed;
-
 struct xe_guc_pagefault_reply {
 	u32 dw0;
 #define PFR_VALID		BIT(0)
-- 
2.43.0

