Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A291A59D2C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 18:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7766210E49D;
	Mon, 10 Mar 2025 17:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h13jrTMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE1010E035;
 Mon, 10 Mar 2025 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741627116; x=1773163116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ieKuHmn27w3PN3pMvDhjjtEHM309mhLhuobHvgvFdkE=;
 b=h13jrTMmB5Dh0YVFhaA07+BIncgKcgZcoo/TDka9K77KjcPlWKjoLWuz
 M/GLqZzRMVYc4rdOUtlKW/VJDe0dHOLkUXtazEtXok0nUFlz8UA4Nz5KN
 Ge+pqh2tWB5ORvoqFwW8+I1jANgvhHTpFkxhQFzOOryP+JygTAn/6mn74
 ZimYbizoa9hPhSWRjKyAEl9q2P+2lE5tafnmCHgncvvPqG2sGhOYptfcP
 hJJH0T5UUjsumGtqqUUC/l5n2DLJxpeyyvI+fev8THh/XcLqDLdnFVNwY
 ti+ye4qZurywHeM/3WlU8ATZyITiyMU3BnkPKZojM+yJcbm5mOqQf7Dpz g==;
X-CSE-ConnectionGUID: EwVvdleOQZCIbQAHR+Eu6A==
X-CSE-MsgGUID: yFLqiW1GTN+YyyDrTaPKAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42669304"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42669304"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:18:35 -0700
X-CSE-ConnectionGUID: dbcaVMh8QY6VElyS7p3zpw==
X-CSE-MsgGUID: vH9vbN69Qt6mmgC+6kV31w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="125097627"
Received: from dut4432lnl.fm.intel.com ([10.105.10.85])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:18:34 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v7 5/6] drm/xe/xe_gt_pagefault: Add address_type field to
 pagefaults
Date: Mon, 10 Mar 2025 17:18:33 +0000
Message-ID: <20250310171834.78299-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310171834.78299-1-jonathan.cavitt@intel.com>
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
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
index 7661b9ad1cd0..69ac8f437d11 100644
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

