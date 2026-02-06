Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLbyAzobhmlNJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:47:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A164A100857
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8718A10E84C;
	Fri,  6 Feb 2026 16:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQ+EDPGV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6053810E039;
 Fri,  6 Feb 2026 16:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770396463; x=1801932463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Q2mgk48R1/t6v6oivgIv+oqBLFnnlBulEyzGDiJrTk=;
 b=BQ+EDPGV9oKcTUDrsmyqQCKM8rw/jfzPgxqXIx/1Ujc0WkwgBQrW7jyI
 Ej7sVJfhbaE/Yc41OFEo/m8P/MlILnA/fVykf5m+XUHYgfHgcqMVoLflz
 pBa9LF22dXixaWarfBcJKoBAuBLeB1WKHuDEEi2d35zdtjs/vPKJ60IR8
 QWZyiZ2L8q2ylbUxh+f/sxyss5d54j2YKcXfLhk95OTSGwL5kuZ4Sl+c9
 Ln42685IyNlp7JhqATYWz0VbU6c0DF02Q/KIQLUMHBS7qSCUeQE2SQXDY
 aD2pRUW61gde0oKdvncwE5YXSZ+M7aw07Vna03D4pu7yPNvuK/zbF580s A==;
X-CSE-ConnectionGUID: nbLuOe/rS1OjvViN/+g4Uw==
X-CSE-MsgGUID: gxJ9pn2RQjq5NYGpXCeE1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71671679"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71671679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 08:47:42 -0800
X-CSE-ConnectionGUID: pJorP6DyR7q+PYDPexeBpw==
X-CSE-MsgGUID: u2E+JdQ7RsGFRhyG8LvOBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="248540884"
Received: from dut4086lnl.fm.intel.com ([10.105.10.85])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 08:47:40 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v33 2/5] drm/xe/xe_pagefault: Track address precision per
 pagefault
Date: Fri,  6 Feb 2026 16:47:34 +0000
Message-ID: <20260206164731.8395-9-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206164731.8395-7-jonathan.cavitt@intel.com>
References: <20260206164731.8395-7-jonathan.cavitt@intel.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A164A100857
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
index 922a4f3344b1..a24de27eb303 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -231,6 +231,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 {
 	xe_gt_info(pf->gt, "\n\tASID: %d\n"
 		   "\tFaulted Address: 0x%08x%08x\n"
+		   "\tAddress Precision: %lu\n"
 		   "\tFaultType: %d\n"
 		   "\tAccessType: %d\n"
 		   "\tFaultLevel: %d\n"
@@ -239,6 +240,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 		   pf->consumer.asid,
 		   upper_32_bits(pf->consumer.page_addr),
 		   lower_32_bits(pf->consumer.page_addr),
+		   BIT(pf->consumer.addr_precision),
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

