Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5FEA4CDCE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 23:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D88F10E2F8;
	Mon,  3 Mar 2025 22:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvWsVMBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6705F10E235;
 Mon,  3 Mar 2025 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741039224; x=1772575224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vzZzYIojd5dkdMAwzLd6eS4b8XbLM0jXbUyZQw790pg=;
 b=UvWsVMByizy73AnhphFGGRcBntfKJggymd5aUqPRQjRVod2o13gEG4eU
 LNrX3tmsv4ti9EEeOg8BQ/+Dlq78kZgAUgwzTI0Zss0QBINFzlWkfWx0k
 /DDzEvF+P2DaOxB0Bvguh7jhPs8AVycYqZz+z3/nuqyLbWNnFaFU6ykEg
 YF6EHdNjenVNncyi3WJ85Mq1VripXGzs4OYrj3szhZDxfoPiG3uWjbUKR
 5XvCbAle2DIhMpa4dcDCd5lcWlh0YANavVojFNHlZn3p+KfuRPdfU+vcX
 P2HCjIl2PWYzsXZQn4OSAer2tYjSo5oX8gKuWYvXrzj2EdPRUCw8m9cxV w==;
X-CSE-ConnectionGUID: 6fcRhZ9JRmqzb78oNaFzLQ==
X-CSE-MsgGUID: b4Al2mNjS42Hy6Hy6F76nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41846108"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41846108"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:00:24 -0800
X-CSE-ConnectionGUID: bnKheVk2QTiaeC4W4kHk2g==
X-CSE-MsgGUID: ++fj/fOCSZK5OfnjV5SFEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118020904"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:00:24 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/6] drm/xe/xe_gt_pagefault: Add address_type field to
 pagefaults
Date: Mon,  3 Mar 2025 22:00:21 +0000
Message-ID: <20250303220022.67200-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303220022.67200-1-jonathan.cavitt@intel.com>
References: <20250303220022.67200-1-jonathan.cavitt@intel.com>
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
index 84907fb4295e..ecf9f76bd423 100644
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

