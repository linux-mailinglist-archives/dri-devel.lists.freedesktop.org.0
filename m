Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F06A488BE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 20:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1968010EB67;
	Thu, 27 Feb 2025 19:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZHq7S15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A3910EB67;
 Thu, 27 Feb 2025 19:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740683703; x=1772219703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ihH9wBnZzhdNjMrP46o0SW/6Cb8X5ov8UZ6nFxqDJAE=;
 b=iZHq7S15caMhe5s8QBBfg6CHQ4huw4/vgLZ7qE5jp/kj9a3rN9F48Kkg
 vFsJnGaE1ScX2/i4RDVMKjs08aUALGLb6k30hr/sAiCqSqwfHYT6+wJcH
 4NS+AE73mlfHsz069EIuWkcAVVxhrXiaZ4elRKu5u68I9WmaYrbox7AgW
 Ha4hKfSa8cbHWwJ84FgfTPVzav1go6i7KrqWYToYDpM7Z+whPd6uw3UoH
 /JGg11bEVvLnrpFRx4u3676BKTaJaBzxxeVpUHqXZdOfJ2zPv7vsu2qQZ
 Y996oFVXDnudZzk303F6V2oWH/b6lCLgVp4NAYYuPnpkSyqXeHcvQw5vE g==;
X-CSE-ConnectionGUID: 5N/uLpTxRD+BeQHhYuPPaQ==
X-CSE-MsgGUID: IwoH3pylQVi2QwuOic6hWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41850060"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41850060"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
X-CSE-ConnectionGUID: ILU3RFI6THWlW43wgBPOdw==
X-CSE-MsgGUID: ed3BMxscRs2KUHB4S7/PfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117775301"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/xe/xe_gt_pagefault: Add address_type field to
 pagefaults
Date: Thu, 27 Feb 2025 19:14:56 +0000
Message-ID: <20250227191457.84035-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227191457.84035-1-jonathan.cavitt@intel.com>
References: <20250227191457.84035-1-jonathan.cavitt@intel.com>
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

Add a new field to the xe_pagefault struct, address_type, that tracks
the type of fault the pagefault incurred.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 3 +++
 drivers/gpu/drm/xe/xe_gt_pagefault.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index e23b9d33afa5..aae94dc3a99f 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -204,11 +204,13 @@ static int handle_pagefault(struct xe_gt *gt, struct xe_pagefault *pf)
 
 	vma = lookup_vma(vm, pf->page_addr);
 	if (!vma) {
+		pf->address_type = DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT;
 		err = -EINVAL;
 		goto unlock_vm;
 	}
 
 	if (xe_vma_read_only(vma) && pf->access_type != XE_PAGEFAULT_ACCESS_TYPE_READ) {
+		pf->address_type = DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT;
 		err = -EPERM;
 		goto unlock_vm;
 	}
@@ -276,6 +278,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct xe_pagefault *pf)
 		pf->asid = FIELD_GET(PFD_ASID, desc->dw1);
 		pf->vfid = FIELD_GET(PFD_VFID, desc->dw2);
 		pf->access_type = FIELD_GET(PFD_ACCESS_TYPE, desc->dw2);
+		pf->address_type = 0;
 		pf->fault_type = FIELD_GET(PFD_FAULT_TYPE, desc->dw2);
 		pf->page_addr = (u64)(FIELD_GET(PFD_VIRTUAL_ADDR_HI, desc->dw3)) <<
 			PFD_VIRTUAL_ADDR_HI_SHIFT;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
index 33616043d17a..969f7b458d3f 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
@@ -17,6 +17,7 @@ struct xe_pagefault {
 	u16 pdata;
 	u8 vfid;
 	u8 access_type;
+	u8 address_type;
 	u8 fault_type;
 	u8 fault_level;
 	u8 engine_class;
-- 
2.43.0

