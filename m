Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5379A4E7B3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B216A10E66A;
	Tue,  4 Mar 2025 17:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmhfHNXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C423110E673;
 Tue,  4 Mar 2025 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741108138; x=1772644138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vzZzYIojd5dkdMAwzLd6eS4b8XbLM0jXbUyZQw790pg=;
 b=RmhfHNXaJHORYIiOj2UQvjHJWlFrbtM5bea6gBH9uF8kSM1QwuxSEOKQ
 vOxQbqORB6M+uNS2RTEbvh5bzOas3B/iu/318k9OOmi8deH2SRyu4e54d
 3K/y3ubsTNheSreGQMUPtV+eFbLBKHs6WXaLfe66KW06bQlrPtkXvOcUu
 eYmSShDsCoQX+VNPDSsusyo+4gt4A+LmPhXoHOFGZYkxLDkVAZKwqFxoC
 7T4PyttITlHGXdEDRLsc/EgJlqzZX30O6Rc6PGsL/bf2RZMvzKkssE6aS
 GuFCngMzbw2H33qSljmhpqebncT+8KlFpsbptWBW8Zjz4/cYk6rPkry0h Q==;
X-CSE-ConnectionGUID: 8b6r+8TcRbG4w0FzviwY5A==
X-CSE-MsgGUID: YssDLH4VSoqZkakpxjWmQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44847574"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="44847574"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 09:08:58 -0800
X-CSE-ConnectionGUID: Bf7iufRrQJ+RCgigXQp0mw==
X-CSE-MsgGUID: Mk5NowKxSB6sp69M2Xhyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="123036941"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 09:08:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 5/6] drm/xe/xe_gt_pagefault: Add address_type field to
 pagefaults
Date: Tue,  4 Mar 2025 17:08:53 +0000
Message-ID: <20250304170854.67195-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304170854.67195-1-jonathan.cavitt@intel.com>
References: <20250304170854.67195-1-jonathan.cavitt@intel.com>
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

