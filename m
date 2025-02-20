Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24287A3E5F4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 21:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F4910E9E3;
	Thu, 20 Feb 2025 20:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNR2qIwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844D110E9DB;
 Thu, 20 Feb 2025 20:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740083915; x=1771619915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u2AbzGaI4Ls00Mz3zF+gpAWIquuEq3mLtyJZINYvlBU=;
 b=BNR2qIwIqmAfME63jWrC8WrzGTkLMJ1VuWkDEL+R7rNIEgmV2j89K9dj
 d4N1GzBfWZThd638md7SoYlMNSoqTZo8ULWIn+vgPbx5aN0p4253c71Ci
 y/iVCVO7L/Ks273/ADNTYW1dLxZvVuclV9lNTv2Ojjn3bwzTuGc0ql0QM
 JtQNgVNJrBvQNZ+RhBzTPgCuJndMK0s9ahZWXDv6auD1IvLD/L3R+4/LQ
 5LbJ1Yfzm3FvxBtA2+AVI5GGshRAWOEiAvmoU6d0+Yh28DIWGK5WgnUuv
 mmLZ8TNq+ZB14LfNCFZlTJ3r9h30M1aoJYPl3WaZ88ivcM9buhbWHV5Fs g==;
X-CSE-ConnectionGUID: +7VRF9rTQBmW0oNT6jbkLA==
X-CSE-MsgGUID: dE+cGOH8T7apECVAtRTvxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41097932"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41097932"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:38:35 -0800
X-CSE-ConnectionGUID: hy5YU3vcR96NdNRgq0Ve6Q==
X-CSE-MsgGUID: 4YD1XWy9QEm+P+gkIC3mpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115100556"
Received: from dut4086lnl.fm.intel.com ([10.105.10.90])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:38:34 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v4 2/6] drm/xe/xe_gt_pagefault: Migrate pagefault struct to
 header
Date: Thu, 20 Feb 2025 20:38:28 +0000
Message-ID: <20250220203832.130430-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220203832.130430-1-jonathan.cavitt@intel.com>
References: <20250220203832.130430-1-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 27 ---------------------------
 drivers/gpu/drm/xe/xe_gt_pagefault.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 27 deletions(-)

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
index 839c065a5e4c..e9911da5c8a7 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
@@ -11,6 +11,34 @@
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
 int xe_gt_pagefault_init(struct xe_gt *gt);
 void xe_gt_pagefault_reset(struct xe_gt *gt);
 int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
-- 
2.43.0

