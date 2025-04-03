Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A599A7A8B2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924AD10E2E3;
	Thu,  3 Apr 2025 17:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cmESLwLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A862610E2D3;
 Thu,  3 Apr 2025 17:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743701774; x=1775237774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hl8+lM11PRLmxBjMwYzmp398zmvgVeUwbwpOM7K9t/8=;
 b=cmESLwLdnzy0l15aPKRg8wdGC41rfWO+D0Bnd8J9VCsYU289lkZwmTPV
 QNPxqWDtt79vv7bVk0LjmKdfB1+7WWxwRO4pfvQ+2udYnBrRM8PJuxhUo
 J22NgX5M6VZR7yMx5XgolzkSwUNCwv+DIVNLvUglwOWmX4WbxAsg+8Nov
 cgKYuXLsxmAitHh5dztlt446sCWPeB/eX4VLekmN9qm+kL/CFm8B2ea8B
 svjgU2Em34sR+w6IAlAn5+8pBhnyb+5TsHKLGE8wTFcToYv+usaraMNQc
 qw/tvKBqjHGv9ltZCIgfSWEItdvVjZ/LqyOkhYjoAaddIIDZCSWp6p0EY Q==;
X-CSE-ConnectionGUID: fVeetH04T+KtgOWQwK/uSA==
X-CSE-MsgGUID: fGaGhbpzTlKesX7JC2qvzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="56492989"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="56492989"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:36:14 -0700
X-CSE-ConnectionGUID: 35nZ19XwS2+LmHc3xdd2/A==
X-CSE-MsgGUID: FsXaVK/VQp6ut2GOr1HHXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="150276847"
Received: from live-gta-imageloader.fm.intel.com (HELO DUT138LNL.fm.intel.com)
 ([10.105.23.23])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:36:14 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com,
 ivan.briano@intel.com
Subject: [PATCH v17 1/5] drm/xe/xe_gt_pagefault: Disallow writes to read-only
 VMAs
Date: Thu,  3 Apr 2025 17:36:09 +0000
Message-ID: <20250403173614.67195-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403173614.67195-1-jonathan.cavitt@intel.com>
References: <20250403173614.67195-1-jonathan.cavitt@intel.com>
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

