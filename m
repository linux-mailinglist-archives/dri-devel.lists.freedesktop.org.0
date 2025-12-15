Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807FCCC0281
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 00:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE4610E5C8;
	Mon, 15 Dec 2025 23:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tm/gy/Z5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E16010E59B;
 Mon, 15 Dec 2025 23:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765840194; x=1797376194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=07dh5WtHHkT0vcJ7vCf7IgnxLKzrD0JpJDZ5B6vQriI=;
 b=Tm/gy/Z5zOAXpATaMT7M/lPvd+iE8MZTl9ySRwuRsAHih+PCTe+PSZ6H
 oSbOPk3YHtZQ7NEwY+rBInVgATP+r8EgQ0id0n/a0ZGrSDbZMsUeZGDHD
 SdYWn10dhGXD8AHu+RhdhedZfn4+wV1NSNMRbnumf64L2IhoA+DSWsNX5
 GQPwtQTrUBRSK2sJ+nYNfQSIyylDlBxsW9Qe0kPABBolAcqq4ISEgytcg
 1j6xElbGlflCOkyPXkD+805Vyt3eo3y++5VWO0ZK6em1wcoXam4Un3C+e
 bep/kGdRtV1NfjihyE0M6ayojvpmHMyKhjZLo/Vkc5VQk1aK2MmAhh5ky w==;
X-CSE-ConnectionGUID: 0jsU/BEUQYG3L3gBQIvxIQ==
X-CSE-MsgGUID: 5Pk1J7DjRPu5fZygTk0lcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67790373"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67790373"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 15:09:53 -0800
X-CSE-ConnectionGUID: 4T2xO1KWS82G85g3AQHjvw==
X-CSE-MsgGUID: XRiQFSZTS568Zi2QUqx1Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="228511061"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 15:09:52 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v31 2/5] drm/xe/xe_pagefault: Track address precision per
 pagefault
Date: Mon, 15 Dec 2025 23:09:52 +0000
Message-ID: <20251215230949.164845-9-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215230949.164845-7-jonathan.cavitt@intel.com>
References: <20251215230949.164845-7-jonathan.cavitt@intel.com>
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

Add an address precision field to the pagefault consumer.  This captures
the fact that pagefaults are reported on a SZ_4K granularity by GuC,
meaning the reported pagefault address is only the address of the page
where the faulting access occurred rather than the exact address of the
fault.  This field is necessary in case more reporters are added where
the granularity can be different.

v2:
- Keep u8 values together (Matt Brost)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pagefault.c   | 1 +
 drivers/gpu/drm/xe/xe_pagefault.c       | 2 ++
 drivers/gpu/drm/xe/xe_pagefault_types.h | 8 +++++++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 719a18187a31..79b790fedda8 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -74,6 +74,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
 		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
 		 PFD_VIRTUAL_ADDR_LO_SHIFT);
+	pf.consumer.addr_precision = 12;
 	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
 	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
 	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 0b625a52a598..47dec46515b5 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -231,6 +231,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 {
 	xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
 		  "\tFaulted Address: 0x%08x%08x\n"
+		  "\tAddress Precision: %lu\n"
 		  "\tFaultType: %d\n"
 		  "\tAccessType: %d\n"
 		  "\tFaultLevel: %d\n"
@@ -239,6 +240,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 		  pf->consumer.asid,
 		  upper_32_bits(pf->consumer.page_addr),
 		  lower_32_bits(pf->consumer.page_addr),
+		  BIT(pf->consumer.addr_precision),
 		  pf->consumer.fault_type,
 		  pf->consumer.access_type,
 		  pf->consumer.fault_level,
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index d3b516407d60..333db12713ef 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -67,6 +67,12 @@ struct xe_pagefault {
 		u64 page_addr;
 		/** @consumer.asid: address space ID */
 		u32 asid;
+		/**
+		 * @consumer.addr_precision: precision of the page fault address.
+		 * u8 rather than u32 to keep compact - actual precision is
+		 * BIT(consumer.addr_precision).  Currently only 12
+		 */
+		u8 addr_precision;
 		/**
 		 * @consumer.access_type: access type, u8 rather than enum to
 		 * keep size compact
@@ -85,7 +91,7 @@ struct xe_pagefault {
 		/** @consumer.engine_instance: engine instance */
 		u8 engine_instance;
 		/** consumer.reserved: reserved bits for future expansion */
-		u8 reserved[7];
+		u8 reserved[6];
 	} consumer;
 	/**
 	 * @producer: State for the producer (i.e., HW/FW interface). Populated
-- 
2.43.0

