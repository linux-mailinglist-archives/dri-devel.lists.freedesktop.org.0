Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4402CA95762
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 22:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6904610E4AD;
	Mon, 21 Apr 2025 20:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYw4Y/Rh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97AA10E4A5;
 Mon, 21 Apr 2025 20:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745267637; x=1776803637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f66PdOSTcAjk7Vl5yS0Wqep9Dq0k4cBlXx7IAw1xGdQ=;
 b=KYw4Y/RhH8U0OWMhLl5SKyj6UTWftQRYcc71iAPAhsDTta//sMA03sSX
 FCG5bxHlHiIGawjmIp2/Zj41ysmrz0DqxeGEc39/+QY04vPc5ji0usrdA
 1lfsjL28B9UTidI1YBHw63RcSEEGnHlfbfLkQRkkCzfqdzXp3UDtqaqnJ
 q/+rvBGsD6CzdST0A3RW9lwreYfkEGd1e9M8xMZUhRmDwWG5iGiSRgG7X
 zArDrgtzVG8BCAQJOfiM7xJpHV2A+xA7h1J37XxpeVgWVbaFhKxK6yt/B
 b4AQCRiURiHw8y6JXn//rdYq7Dks+2lzHBUFxXSVbfXR5SGZrGD0kfrMh Q==;
X-CSE-ConnectionGUID: /Ka/TyidTfOKDkRDmN3Q5Q==
X-CSE-MsgGUID: cK3dKWctTA+2uHxXnATzAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57471153"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; d="scan'208";a="57471153"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 13:33:53 -0700
X-CSE-ConnectionGUID: yoBKe7+JTD6wrYo46PqKAA==
X-CSE-MsgGUID: tsm+krM9R3KFc7lMcYPN8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; d="scan'208";a="132343357"
Received: from dut4440lnl.fm.intel.com ([10.105.10.70])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 13:33:53 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com,
 ivan.briano@intel.com, matthew.auld@intel.com
Subject: [PATCH v20 1/5] drm/xe/xe_gt_pagefault: Disallow writes to read-only
 VMAs
Date: Mon, 21 Apr 2025 20:33:48 +0000
Message-ID: <20250421203353.64900-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250421203353.64900-1-jonathan.cavitt@intel.com>
References: <20250421203353.64900-1-jonathan.cavitt@intel.com>
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

