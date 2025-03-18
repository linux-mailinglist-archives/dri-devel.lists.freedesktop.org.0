Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD719A67A7E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 18:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3A710E4B1;
	Tue, 18 Mar 2025 17:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJZZgU88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0225410E22D;
 Tue, 18 Mar 2025 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742317909; x=1773853909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PBWie2+/rbYN2yuYGMoh1ZNLSE4OAu5EEdRh9OQVMR0=;
 b=cJZZgU88xTT20IkL4RSv6dheqijB+rIGsKUPfoL02RTxK3E0dxzjNDaP
 OcXyjv3lnJfiD1ROGgYcfDb8XQieIeI/nmADANrtzxGuHeSK1ApNUeeZQ
 8/fMPKdJAufOf0BgWMQgfmwpZafDO8sQpGTeLtUVsWP262OApjxHyUZdn
 wMQbOT9pBDiq34HND8tXoQ4eLXzIkZmmL7xFy9dbRrBFm2BsTO9DDADE3
 KDITKIADR0gwQjMCeIOksy6ktFJPGj95Rd5Gl1mQn+l8DW1s5/eeDupb/
 yL8VdxlQqv7OM3+5IZonCDmsRBjOUcLVkZpT/uFLtBORePmcfz5lBaULJ w==;
X-CSE-ConnectionGUID: 8HyoaIa4RnaNdl5iEppLDA==
X-CSE-MsgGUID: hPHhwo02SLKVlk8OlVdPkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54854834"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="54854834"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 10:11:48 -0700
X-CSE-ConnectionGUID: 1zxYVRdfSv2VFaV/d9pU+w==
X-CSE-MsgGUID: di0JJQx/R7GROCboyeXJbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="122805738"
Received: from dut4419lnl.fm.intel.com ([10.105.10.214])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 10:11:49 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com
Subject: [PATCH v9 4/6] drm/xe/xe_gt_pagefault: Add address_type field to
 pagefaults
Date: Tue, 18 Mar 2025 17:11:31 +0000
Message-ID: <20250318171146.78571-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250318171146.78571-1-jonathan.cavitt@intel.com>
References: <20250318171146.78571-1-jonathan.cavitt@intel.com>
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
index 37b4ab5135a8..483820be4e0a 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -207,11 +207,13 @@ static int handle_pagefault(struct xe_gt *gt, struct xe_gt_pagefault *pf)
 
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
@@ -285,6 +287,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct xe_gt_pagefault *pf)
 		pf->asid = FIELD_GET(PFD_ASID, desc->dw1);
 		pf->vfid = FIELD_GET(PFD_VFID, desc->dw2);
 		pf->access_type = FIELD_GET(PFD_ACCESS_TYPE, desc->dw2);
+		pf->address_type = 0;
 		pf->fault_type = FIELD_GET(PFD_FAULT_TYPE, desc->dw2);
 		pf->page_addr = (u64)(FIELD_GET(PFD_VIRTUAL_ADDR_HI, desc->dw3)) <<
 			PFD_VIRTUAL_ADDR_HI_SHIFT;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
index 55c598c4a1bc..87ed7f54e050 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
@@ -26,6 +26,8 @@ struct xe_gt_pagefault {
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

