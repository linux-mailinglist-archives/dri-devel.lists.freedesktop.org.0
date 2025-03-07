Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CA0A57509
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 23:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014B310EC55;
	Fri,  7 Mar 2025 22:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBLuYllp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B22A10EC4A;
 Fri,  7 Mar 2025 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741387287; x=1772923287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7kg75Tyyd8ZeYruQ/MbWxm2QqgWZiPahNdEEuu/Obk8=;
 b=ZBLuYllpYTtVuDbF4lWybjGjBPh0/Mol6DzeEZCTyEUNGtQ3HmAObweQ
 S4A1I+LeRJgx4g1AKJMWYSr2F5OD+zCil8xWWVH6d0CbQZY0D6+uuVBTY
 q6dFrAGpkQAsq4JXnE04Ed4VZZX+CJWZqsv03PYzBVXkE2itfIcsXSdRM
 CGKcXmiryECIklB0DFlRrMm6NYl1m7QLWXIs5HNfeD0Dj/2bNTNdVXH5I
 SYx8xdQEP0M8tzZQa15zymP7/Clg3MbrkFMlCvrfkb6V2h9yVY2iiHGwG
 p/8DDEJ26333rXN/yfHcVPdkX0G1B8Sd4bet7DWkvlkaqJ0bFu/IJzQ+u w==;
X-CSE-ConnectionGUID: zTFecB4xRtK+vaE+wBNTnA==
X-CSE-MsgGUID: xv/MHjF9RMyhHVaVuCizPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="41704521"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="41704521"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:41:27 -0800
X-CSE-ConnectionGUID: JwMl4at3SnmlkdOxvuj3hg==
X-CSE-MsgGUID: T/nWD2GJTLaSOs3fQPG0fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="124457958"
Received: from dut4440lnl.fm.intel.com ([10.105.10.114])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:41:27 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v6 5/6] drm/xe/xe_gt_pagefault: Add address_type field to
 pagefaults
Date: Fri,  7 Mar 2025 22:41:23 +0000
Message-ID: <20250307224125.111430-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307224125.111430-1-jonathan.cavitt@intel.com>
References: <20250307224125.111430-1-jonathan.cavitt@intel.com>
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
index 964ca1efb698..fa8bf743d4d7 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -206,11 +206,13 @@ static int handle_pagefault(struct xe_gt *gt, struct xe_pagefault *pf)
 
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
@@ -284,6 +286,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct xe_pagefault *pf)
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

