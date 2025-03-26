Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FDCA71C85
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 17:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB0C10E756;
	Wed, 26 Mar 2025 16:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNTcZk+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698B310E751;
 Wed, 26 Mar 2025 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743008273; x=1774544273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hl8+lM11PRLmxBjMwYzmp398zmvgVeUwbwpOM7K9t/8=;
 b=BNTcZk+CqGl+355cGNzuyofvqHFKUSl4/q0xXlx1EMMshRVTEq96ss3G
 z20sHfIQNJypj6NB2tJZNKg1AATdGHUteDW8lCu//i55Eldr79pDm0N49
 24C5DgPpt/Ye4ShRIsy55cvWcilecGeVCCbQQvEcKzBxIPhcOVYyijJEd
 DWV9tQmB+zIOCqcjNXZiKCec/UK0smAmp7L551Cm30vpqtKAN/KuNzZl/
 gkiqqPPH9mzeZ3x7iB+k31NHVDPhNqkAWb/apEKicrPTml/Cq+K95NTjY
 q8ytopohy7V86IBtJhktA3GL0JpbcZUoh7SPdH233bDtgNcbe04gOA06k Q==;
X-CSE-ConnectionGUID: YEXsiowuQiyLwA8E+zIu4Q==
X-CSE-MsgGUID: hNyLDzm5QlKRnSEakDXyVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55308955"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="55308955"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 09:57:52 -0700
X-CSE-ConnectionGUID: 7zJwzwN3R6yD06RRmL6mGg==
X-CSE-MsgGUID: pnI4ZpfTRqO0g0wpmwvj0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="155739758"
Received: from dut4419lnl.fm.intel.com ([10.105.10.235])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 09:57:52 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com
Subject: [PATCH v14 2/6] drm/xe/xe_gt_pagefault: Disallow writes to read-only
 VMAs
Date: Wed, 26 Mar 2025 16:57:46 +0000
Message-ID: <20250326165751.72881-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326165751.72881-1-jonathan.cavitt@intel.com>
References: <20250326165751.72881-1-jonathan.cavitt@intel.com>
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

The page fault handler should reject write/atomic access to read only
VMAs.  Add code to handle this in handle_pagefault after the VMA lookup.

Fixes: 3d420e9fa848 ("drm/xe: Rework GPU page fault handling")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 9fa11e837dd1..3240890aac07 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -237,6 +237,11 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
+	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
+		err = -EPERM;
+		goto unlock_vm;
+	}
+
 	atomic = access_is_atomic(pf->access_type);
 
 	if (xe_vma_is_cpu_addr_mirror(vma))
-- 
2.43.0

