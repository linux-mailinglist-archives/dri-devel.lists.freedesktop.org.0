Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B054AAE9FC
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 20:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8CD10E0E8;
	Wed,  7 May 2025 18:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEDn4a0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA62410E0A4;
 Wed,  7 May 2025 18:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746643820; x=1778179820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b9RSxDugkcQQRyOlDcCIsAh14gLge+OfImLfziHdF40=;
 b=OEDn4a0V7wsywbKEeDZruGQffm0NQeaQHF7xeZRbVVNzyoVwTlGRNZia
 jZ5uJiBqgC77+lJis/7E0f0g7rkFT5I3+O4zvLQjWpgOLkCVNKxFBBwuG
 M6bkk2soKNj2IBSx78z3Zv5QyG+TGfLiggRhQ7Kq3FIu+neXEnRDhZ8Dg
 zC1KbZ3fcbqKTylBY9F49OkHtIH5xpHVxFQ0pqy1wtVtpNvhNC8IAwKB2
 qfp7qHrXLwcipafTNd31jfX0KwpTU5Dt995CuGkM26sqTmNPckwChl5IK
 LQ0Kc7vof/EaDZYto6IXanVcE4qSshTumqdqQlPD2aVdVdRXYN6Ahb2iP g==;
X-CSE-ConnectionGUID: EP7Y+gGwQjWRSnOwiNLiVg==
X-CSE-MsgGUID: 20U754xASEGLdBBHoaAZdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48299891"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48299891"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 11:50:19 -0700
X-CSE-ConnectionGUID: a24QNygWSbWA8ThIC87UAg==
X-CSE-MsgGUID: 7SG0BkKITR+41ZI/LyoRsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="135753373"
Received: from dut4036ptlh.fm.intel.com ([10.105.8.54])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 11:50:19 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com,
 ivan.briano@intel.com, matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v25 1/5] drm/xe/xe_gt_pagefault: Disallow writes to read-only
 VMAs
Date: Wed,  7 May 2025 18:50:12 +0000
Message-ID: <20250507185017.251360-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507185017.251360-1-jonathan.cavitt@intel.com>
References: <20250507185017.251360-1-jonathan.cavitt@intel.com>
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
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 10622ca471a2..d4e3b7eb165a 100644
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

