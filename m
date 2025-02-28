Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D32A4A14F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2F510E2B6;
	Fri, 28 Feb 2025 18:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwNqQ1dv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB4510E0D9;
 Fri, 28 Feb 2025 18:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740766891; x=1772302891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=25X1bI0jpmDxxZZD77ZruB8Cpd2GmsaAXiu+gF/RLsQ=;
 b=gwNqQ1dvaZMIX9rpDebXPkY5etDhgLJ8a0es/93RVv5RPaWTspRr8u7y
 t1MaeoEOvlOSdMywhrJKZzLyM0SsPRRUVoVqBcVtDhk5uvEnFtJI/HRgD
 5F6z9f0FhZ75DeYTcdNricLh8peyJi9iNpVHPiNe77sURHRwmfqLSitba
 jlfKVxGqh1hF+ZR0eddUoeZRRzRouvHm/Ic/lHB3M3EL3puh8Gz77a27a
 OwcfVDIEGqDYEZtqZmLIicGx0i7m9GTde6mxoc3UPfEnMUTMRhHjX3Hxb
 9pXXnuyo9DCb2/wNVHmYAf/B69l+Mns0Wmy0zv3kRCj5ZiU9jcjIRtq12 w==;
X-CSE-ConnectionGUID: PaUOvgXZR160euT+patddQ==
X-CSE-MsgGUID: cy86f2YYRJeGjhKKxe1tng==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41729571"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41729571"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 10:21:29 -0800
X-CSE-ConnectionGUID: 4S9HPahASiG+gi9pvz0Q1g==
X-CSE-MsgGUID: Ty2HrxIXRMGdzGdjMFN1oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="148214513"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 10:21:23 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/6] drm/xe/xe_gt_pagefault: Disallow writes to read-only
 VMAs
Date: Fri, 28 Feb 2025 18:21:17 +0000
Message-ID: <20250228182122.77475-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228182122.77475-1-jonathan.cavitt@intel.com>
References: <20250228182122.77475-1-jonathan.cavitt@intel.com>
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
index 17d69039b866..f608a765fa7c 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -235,6 +235,11 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
+	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
+		err = -EPERM;
+		goto unlock_vm;
+	}
+
 	err = handle_vma_pagefault(gt, pf, vma);
 
 unlock_vm:
-- 
2.43.0

