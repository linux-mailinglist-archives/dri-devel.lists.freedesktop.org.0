Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F4DA5FF54
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 19:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AB910E914;
	Thu, 13 Mar 2025 18:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIJrK95C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA87A10E90B;
 Thu, 13 Mar 2025 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741890858; x=1773426858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EX1g/4ZvEY7GSy7ARqUXvg37KKeV+p0TymOsr5HLoSQ=;
 b=cIJrK95CUA7Di695UGor8Tp09PkfQ9L7uR3N92KdoaS8HZG8ST5oGrNX
 whnaso7wEqAevShE4D7pssW7okMmrfAX6bFutKfgb6SC90Gt/rc9mOEDX
 yiJScoJIUoUsrY3cmJq2mphhonmey67PYi+UGgQjEIzpQuFPz+OWC5VG5
 RPXE4RwlJfoJubjaKZYT1qi2ZdZg2ZX5k4McfUovc+46dEan62zohDQ3D
 yOqJcImBqNTmZy6xlVKltrjg/umXA8BL94us0N1aEDSGeaSRWgkt1VuwF
 EyT+QXprwptjtJYZF5VmcYu1HoFTi8xltNkIMtiZQ/vMHJuAqaNg3Mjmb w==;
X-CSE-ConnectionGUID: OR7DFRSKQz+7oXEEC7VsMQ==
X-CSE-MsgGUID: CIJbIa9ISseDRc4+/IUNvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="65485461"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="65485461"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 11:34:18 -0700
X-CSE-ConnectionGUID: i/VwLW7aSGK8VVycHrGjIw==
X-CSE-MsgGUID: 5Y/NUDv9RKm9MmfwXp3LXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="151900778"
Received: from dut4440lnl.fm.intel.com ([10.105.10.40])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 11:34:17 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mzorek@intel.com
Subject: [PATCH v8 4/6] drm/xe/xe_gt_pagefault: Add address_type field to
 pagefaults
Date: Thu, 13 Mar 2025 18:34:06 +0000
Message-ID: <20250313183415.133863-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313183415.133863-1-jonathan.cavitt@intel.com>
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_pagefault.c       | 3 +++
 drivers/gpu/drm/xe/xe_gt_pagefault_types.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 06a4e3fdc11d..e67ee7ac3df7 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -206,11 +206,13 @@ static int handle_pagefault(struct xe_gt *gt, struct xe_gt_pagefault *pf)
 
 	vma = lookup_vma(vm, pf->page_addr);
 	if (!vma) {
+		pf->address_type = DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT;
 		err = -EINVAL;
 		goto unlock_vm;
 	}
 
 	if (xe_vma_read_only(vma) && pf->access_type != XE_GT_PAGEFAULT_ACCESS_TYPE_READ) {
+		pf->address_type = DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT;
 		err = -EPERM;
 		goto unlock_vm;
 	}
@@ -284,6 +286,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct xe_gt_pagefault *pf)
 		pf->asid = FIELD_GET(PFD_ASID, desc->dw1);
 		pf->vfid = FIELD_GET(PFD_VFID, desc->dw2);
 		pf->access_type = FIELD_GET(PFD_ACCESS_TYPE, desc->dw2);
+		pf->address_type = 0;
 		pf->fault_type = FIELD_GET(PFD_FAULT_TYPE, desc->dw2);
 		pf->page_addr = (u64)(FIELD_GET(PFD_VIRTUAL_ADDR_HI, desc->dw3)) <<
 			PFD_VIRTUAL_ADDR_HI_SHIFT;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
index 90b7085d4b8e..68721973debb 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
@@ -24,6 +24,8 @@ struct xe_gt_pagefault {
 	 * from xe_gt_pagefault_access_type
 	 */
 	u8 access_type;
+	/** @address_type: Type of address access that resulted in fault */
+	u8 address_type;
 	/**
 	 * @fault_type: fault type of this pagefault, as a value
 	 * from xe_gt_pagefault_fault_type
-- 
2.43.0

