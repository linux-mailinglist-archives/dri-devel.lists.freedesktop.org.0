Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF28A488B9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 20:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6767310EB71;
	Thu, 27 Feb 2025 19:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4NZO9MY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B368C10EB62;
 Thu, 27 Feb 2025 19:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740683703; x=1772219703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=25X1bI0jpmDxxZZD77ZruB8Cpd2GmsaAXiu+gF/RLsQ=;
 b=Z4NZO9MYxeMJesUOK0LGmhHTJB1Thd/HYpzQlUKkLexd5aScEumgm7W4
 kPQVPaPf4kq1Zll2YYsWtsDN3Ha+1ce35qVCWdZQaCMJx6dMLYoSXkpNV
 2OaDlUIkM0L1C4slC3FIA3HLhepR8T5dGEre7jga6/JwGIOcAZCHxk5ma
 5+1IwU05pEGb9CmfR18t1Qes2vfelW/y3lknEB1+qjcUlPjGlVCe0BMtG
 aD7cUMPM8Xgdnf3tDItbF6itFmPH+GqM3+U+o9Gg8qkEM0XQhukDog24P
 3/K7xDzUpCIndmWhoyPJcOw2/LLzqaFCvHMK6Li3zeU3QAD3Z6NMsgoDq g==;
X-CSE-ConnectionGUID: EhkVUnIgROKX7VCQdgpIDA==
X-CSE-MsgGUID: QD/klkqYS+KEVyH+PTI5DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41850054"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41850054"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
X-CSE-ConnectionGUID: G+vJsFOXRjKHRHCD7iSs+g==
X-CSE-MsgGUID: FNOLI6YHQoiKtw638DpIhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117775283"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/xe/xe_gt_pagefault: Disallow writes to read-only
 VMAs
Date: Thu, 27 Feb 2025 19:14:50 +0000
Message-ID: <20250227191457.84035-2-jonathan.cavitt@intel.com>
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

