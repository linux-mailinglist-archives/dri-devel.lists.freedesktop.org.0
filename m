Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F91A36701
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 21:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B3010ED39;
	Fri, 14 Feb 2025 20:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcXy+hH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CFB10E033;
 Fri, 14 Feb 2025 20:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739565479; x=1771101479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W4fOQASwtVxUSBCEFadqime9r1dlookPL1M+/T61cvk=;
 b=bcXy+hH6fHyWUTE/A1Mq07L9Zo0Rgg/NCEKeMeAUGoMdJWqWQrF9XN5T
 F/lJh04+vFTs9dtxhC0AqjytrP/GemVRVuFp4RX75lN6q2w5t30HjbKwI
 dNtvdkFwyl8tPDgrAmaxM6MTU2hR4tloqc1TWvTokRSnwhXptsm/V1VIr
 2nxQUPrl0yj80/NAcQHqX7897eC7rYI2e9AmyHA5ShRDZF1R+03dvcQ/P
 GtCYUVB4ANH2b/z6OsB07hv8hOBy+BJ2WJvfKRjlJQ01Nashp0+XqVQj2
 e7Kx8DyYSOMK/tNhZOF6DrIizSbDrS1GUkNoJ8Qgj9XR8S2esbELPUSNY w==;
X-CSE-ConnectionGUID: OOFIqy9EQBGQiGSt+CSrAg==
X-CSE-MsgGUID: oDZtxYL8R8KtEySeesmd8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39558866"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="39558866"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:37:59 -0800
X-CSE-ConnectionGUID: ketLe7alTrSohSVA1SXrAg==
X-CSE-MsgGUID: EiQWC1P9Qi6nlf9Yja4slQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118760815"
Received: from dut4066lnl.fm.intel.com ([10.105.8.61])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:37:59 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jonathan.cavitt@intel.com,
 saurabhg.gupta@intel.com, alex.zuo@intel.com, joonas.lahtinen@intel.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com
Subject: [PATCH 2/4] drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
Date: Fri, 14 Feb 2025 20:37:55 +0000
Message-ID: <20250214203757.27895-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214203757.27895-1-jonathan.cavitt@intel.com>
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
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

Additionally, add string declarations for the associated enum values, as
well as functions that translate from the enum values to their string
counterparts.  The string variants will be useful for debugging later.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 27 ---------------
 drivers/gpu/drm/xe/xe_gt_pagefault.h | 51 ++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 46701ca11ce0..fe18e3ec488a 100644
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
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
index 839c065a5e4c..d502fdb5b68c 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
@@ -11,6 +11,57 @@
 struct xe_gt;
 struct xe_guc;
 
+struct pagefault {
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
+enum access_type {
+	ACCESS_TYPE_READ = 0,
+	ACCESS_TYPE_WRITE = 1,
+	ACCESS_TYPE_ATOMIC = 2,
+	ACCESS_TYPE_RESERVED = 3,
+};
+
+enum fault_type {
+	NOT_PRESENT = 0,
+	WRITE_ACCESS_VIOLATION = 1,
+	ATOMIC_ACCESS_VIOLATION = 2,
+};
+
+static char *access_type_str[] = {
+	"ACCESS_TYPE_READ",
+	"ACCESS_TYPE_WRITE",
+	"ACCESS_TYPE_ATOMIC",
+	"ACCESS_TYPE_RESERVED",
+};
+
+static char *fault_type_str[] = {
+	"NOT_PRESENT",
+	"WRITE_ACCESS_VIOLATION",
+	"ATOMIC_ACCESS_VIOLATION",
+};
+
+static inline char *access_type_to_str(enum access_type a)
+{
+	return access_type_str[a];
+}
+
+static inline char *fault_type_to_str(enum fault_type f)
+{
+	return fault_type_str[f];
+}
+
 int xe_gt_pagefault_init(struct xe_gt *gt);
 void xe_gt_pagefault_reset(struct xe_gt *gt);
 int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
-- 
2.43.0

