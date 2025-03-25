Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC0A6E721
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 00:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748D910E4F1;
	Mon, 24 Mar 2025 23:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oE+NvcFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D700A10E4EA;
 Mon, 24 Mar 2025 23:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742857773; x=1774393773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hl8+lM11PRLmxBjMwYzmp398zmvgVeUwbwpOM7K9t/8=;
 b=oE+NvcFS0I8WDLGVeA4Z9yDqNfkPSQW0tQqsnkgHaZtakMkA4bLJ0+9o
 gqPWKjuy3Lr3cqAZUsIaBUAC08nwnSLqAVq2oYNXdwsKwxNttdN+R9J4K
 G0wQr4eLz18TvhMXzKxU7iERXUF/eL37kYUmCklymbvipj6doSK94VTmO
 ZkejOW4Zmue2dBplsm2lmd85JviV5vmvpGzPONUMjOWZmB4ICmx7xm4CI
 lj186DtEk8so/q+MOD2Fu7eTu+axU7AcfAHzva9PzXjYxLd+OC3sc5U2Q
 ktzoHGer7pDQtUeI3I26EmdaLsOayVOpMNMb0Bi8npVJMAYXmIOCNpoq9 A==;
X-CSE-ConnectionGUID: iCfkKb1IS9CO9vA++cyqvw==
X-CSE-MsgGUID: FBsgOhvZR3qjpAQsiVKUXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44104314"
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; d="scan'208";a="44104314"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 16:09:32 -0700
X-CSE-ConnectionGUID: 6J40w/H7TCidEFGzOVhb6w==
X-CSE-MsgGUID: KJppq87gRlGy2LYc/b1JEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; d="scan'208";a="124220329"
Received: from dut4086lnl.fm.intel.com ([10.105.10.68])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 16:09:33 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com
Subject: [PATCH v12 1/5] drm/xe/xe_gt_pagefault: Disallow writes to read-only
 VMAs
Date: Mon, 24 Mar 2025 23:09:24 +0000
Message-ID: <20250324230931.63840-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324230931.63840-1-jonathan.cavitt@intel.com>
References: <20250324230931.63840-1-jonathan.cavitt@intel.com>
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

