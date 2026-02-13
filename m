Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJlZBe2mj2kVSQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:34:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB53D139CF3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4B510E85E;
	Fri, 13 Feb 2026 22:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZf6uOxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0977A10E859;
 Fri, 13 Feb 2026 22:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771022055; x=1802558055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xYgoZjxVCrZdYiZLtOdym0exObXfnyfmkU5KJjMGCPg=;
 b=EZf6uOxFIqd4mP69O2sThFTC5YdGkoJEqhdyolZRK3857oFiKc1UlgUw
 Ldiqgyuz79BEJlYbuCi0St/cEe/bTb+mnd2hl1E1ueq7Yw5Fc7sEYbgb5
 cO8cEiJgOqNd9K74L1+7P4P5LiinkokaDOJ5gyi6CbgvZjl8bnzETMey9
 k52seKtB/qQG93oKESyTPKjTJKRD2Ghi7XatUBJwIfeItZywTVw9iXNzv
 oOZsiV9DBvLsIsQMMsvko1A94ks2JNEaNGgBlTwku/Pf9uObrB6p3Nufo
 xkRNH/McBdxQ0dSwx9UPUBeAsV+pLm7OWTHaGnuBTiZlJ/+vRbdps+3Ii w==;
X-CSE-ConnectionGUID: CvJBe9S4SdCjb9WE4iL6Ww==
X-CSE-MsgGUID: U5S9BGVPTL6036FP9OEE0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="94844921"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="94844921"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:34:14 -0800
X-CSE-ConnectionGUID: Rses95lvRQiGLSOvGJ9qvw==
X-CSE-MsgGUID: wnds4X48TWK4q37kugbB+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="250698302"
Received: from dut4086lnl.fm.intel.com ([10.105.11.7])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:34:14 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v34 3/6] drm/xe/xe_pagefault: Track address precision per
 pagefault
Date: Fri, 13 Feb 2026 22:34:14 +0000
Message-ID: <20260213223410.99613-11-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213223410.99613-8-jonathan.cavitt@intel.com>
References: <20260213223410.99613-8-jonathan.cavitt@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: BB53D139CF3
X-Rspamd-Action: no action

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
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  1 +
 drivers/gpu/drm/xe/xe_pagefault.c       |  2 ++
 drivers/gpu/drm/xe/xe_pagefault_types.h | 11 ++++++-----
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 8eaa1dfc1e66..ba6f8e8dbe4e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -75,6 +75,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
 		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
 		 PFD_VIRTUAL_ADDR_LO_SHIFT);
+	pf.consumer.addr_precision = 12;
 	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
 	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
 	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 47b6a7628dc1..c2ab183ded29 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -233,6 +233,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 					       pf->consumer.engine_class_instance);
 	xe_gt_info(pf->gt, "\n\tASID: %d\n"
 		   "\tFaulted Address: 0x%08x%08x\n"
+		   "\tAddress Precision: %lu\n"
 		   "\tFaultType: %lu\n"
 		   "\tAccessType: %d\n"
 		   "\tFaultLevel: %lu\n"
@@ -241,6 +242,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 		   pf->consumer.asid,
 		   upper_32_bits(pf->consumer.page_addr),
 		   lower_32_bits(pf->consumer.page_addr),
+		   BIT(pf->consumer.addr_precision),
 		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
 			     pf->consumer.fault_type_level),
 		   pf->consumer.access_type,
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index a14725a02f39..ce15fd8f46b5 100644
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
@@ -87,11 +93,6 @@ struct xe_pagefault {
 		u8 engine_class_instance;
 #define XE_PAGEFAULT_ENGINE_CLASS_MASK		GENMASK(3, 0)
 #define XE_PAGEFAULT_ENGINE_INSTANCE_MASK	GENMASK(7, 4)
-		/**
-		 * consumer.align: buffer u8 to keep struct aligned to u64.
-		 * Will be used later to store data.
-		 */
-		u8 align;
 		/** consumer.reserved: reserved bits for future expansion */
 		u64 reserved;
 	} consumer;
-- 
2.43.0

