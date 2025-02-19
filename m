Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C820A3C57F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 17:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6562510E867;
	Wed, 19 Feb 2025 16:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UPH6/BzU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D37D10E347;
 Wed, 19 Feb 2025 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739984154; x=1771520154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u2AbzGaI4Ls00Mz3zF+gpAWIquuEq3mLtyJZINYvlBU=;
 b=UPH6/BzUlexhu5/kqrZ7ob4JQJyBfU0VxRdrwlpAZYC/tncMRg5zno8f
 k7sn+ANgRa5GT9CulSMxvhE3vrhgqSgyzdEtughxKeCiNCCRE5cyLo6R6
 WnRtJpT9P0Y7QTtbdjmEHiyyR3ZhQirynf005sRnKIxFhAwDXyNTAbmyK
 wySV006/RLvGHM2DTVeC75OnzVVlolJ+98oCZ6OtTyWo0RtA0P2z1U+SQ
 ZV0nfi+Dy/nixMslWFwK3sI7eFTCO3kAIdTbCExscNNrPscGIxOYqYH+c
 G4jPMLDudho8B1ziSNK4dYGAW4SevIZ3zmLvJm19skzY7TDm/mP6NMz6X g==;
X-CSE-ConnectionGUID: 1Z8mCdGETI6O972+3dMl+Q==
X-CSE-MsgGUID: eQMNYAk2QKGvO+vVpeu1PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40991886"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="40991886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 08:55:45 -0800
X-CSE-ConnectionGUID: afh4tM0vTA21gsdl7zEXUQ==
X-CSE-MsgGUID: EJgmWZW4Q3m5ZWXcq9Yd4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114966322"
Received: from dut4410lnl.fm.intel.com ([10.105.8.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 08:23:40 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@ursulin.net,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v3 2/6] drm/xe/xe_gt_pagefault: Migrate pagefault struct to
 header
Date: Wed, 19 Feb 2025 16:23:36 +0000
Message-ID: <20250219162340.116499-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219162340.116499-1-jonathan.cavitt@intel.com>
References: <20250219162340.116499-1-jonathan.cavitt@intel.com>
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

