Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69071C9CACD
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 19:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A9D10E6B1;
	Tue,  2 Dec 2025 18:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2v9L3gM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF7210E68E;
 Tue,  2 Dec 2025 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764701199; x=1796237199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJJ8D2gy5LGm9LLMM9hxB9bSt86XAMqaAiqwRLvFfm8=;
 b=c2v9L3gMs9t1N/fHhTtNVzXoG1qpLX/wNYZC+XzHk9KAhKV6ZsIna2Xs
 5HEo8ClX+pVIc05R2J1TsCHttlN1POG1HjFB2ZoDhP9XmAcB1vdu6avDB
 Kd1p6BGorL+fxc0HH9G9pc41Yakg2cjrskwA/q0t+aB73iER+g9fXd933
 fVMAYQGPjVccgR8TP/gpnqWx/XY9+/4gSMDD623mh6QVYqg6Xt8XevJr3
 x9qDKf9xfh27vSOu6AbhPewr74o5EqRfjtEArWlA0DpgOsSAXI3ugYfhu
 PCAAUaengROdQfjsoA027otaQDKkftYlK7W1HCeIxU8OjvhbEwfAMyV3s g==;
X-CSE-ConnectionGUID: ytiLFtouS2ORiLjK3G9HsA==
X-CSE-MsgGUID: 7o1amJOPQ0mgyNKihJ278g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89335158"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="89335158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:46:38 -0800
X-CSE-ConnectionGUID: F49dJPb8Qdqq/cy/d+j0iw==
X-CSE-MsgGUID: 8G50OCPVRxmjvBbARnaSIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194123365"
Received: from dut4086lnl.fm.intel.com ([10.105.10.149])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:46:37 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v29 2/5] drm/xe/xe_pagefault: Track address precision per
 pagefault
Date: Tue,  2 Dec 2025 18:46:39 +0000
Message-ID: <20251202184636.96142-9-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202184636.96142-7-jonathan.cavitt@intel.com>
References: <20251202184636.96142-7-jonathan.cavitt@intel.com>
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
index d3b516407d60..2cf439658466 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -65,6 +65,12 @@ struct xe_pagefault {
 	struct {
 		/** @consumer.page_addr: address of page fault */
 		u64 page_addr;
+		/**
+		 * @consumer.addr_precision: precision of the page fault address.
+		 * u8 rather than u32 to keep compact - actual precision is
+		 * BIT(consumer.addr_precision).  Currently only 12
+		 */
+		u8 addr_precision;
 		/** @consumer.asid: address space ID */
 		u32 asid;
 		/**
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

