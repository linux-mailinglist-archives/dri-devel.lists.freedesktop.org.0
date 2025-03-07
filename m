Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0473FA57505
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 23:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF5C10EC4C;
	Fri,  7 Mar 2025 22:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4Mxdvia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9006110EC4F;
 Fri,  7 Mar 2025 22:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741387287; x=1772923287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NBeXvSWAsJ4e7D6fq+XzQgXufZPHcwB28J2XpBnFFR8=;
 b=a4MxdviaYzlLMxij/FcVjT+H1u/Sl0KjKHZYhJ167CzUXPzpppY2FkNR
 d7owPQddcIuCbyiIJNhJj0fE1zhOcvDN8pp5dqPTftMofOaEtFtOjrSQr
 wpM9T8P1BODwUtxcHUmwYLf0gxYMOMQAZ6dquZMrQw+ToFTqyWIKO4L3O
 AD3cew24o3AVSQDfCScMeJPUZ2K/S7vV0wQ6DXx+hyn6pAHy6QkREgDRC
 yUQPFVxwy6s6DgIY2Q8uDyuw9d+znj2RJ1qDUpU32/JOQWz5Q/hVdt8m9
 wwJEff9oFuvGn/Lz3fhP3XC/34jqgSghEeBkfHeAx+es4JAgkTUD4Dd4A Q==;
X-CSE-ConnectionGUID: 5wGDD1vaRmKRRZnZtWO/RQ==
X-CSE-MsgGUID: HwchswiISGaFxs/fbvJr6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="41704513"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="41704513"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:41:26 -0800
X-CSE-ConnectionGUID: G34JJSsBRuGgsehXdtexFw==
X-CSE-MsgGUID: agQWWY5LSEidnQcCd0rVxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="124457942"
Received: from dut4440lnl.fm.intel.com ([10.105.10.114])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:41:26 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/6] drm/xe/xe_gt_pagefault: Disallow writes to read-only
 VMAs
Date: Fri,  7 Mar 2025 22:41:19 +0000
Message-ID: <20250307224125.111430-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307224125.111430-1-jonathan.cavitt@intel.com>
References: <20250307224125.111430-1-jonathan.cavitt@intel.com>
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
index c5ad9a0a89c2..a4e688e72efd 100644
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

