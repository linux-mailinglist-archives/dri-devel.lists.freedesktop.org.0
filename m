Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4950BA4E7B7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB79E10E682;
	Tue,  4 Mar 2025 17:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9TIrZuL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A063D10E66E;
 Tue,  4 Mar 2025 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741108138; x=1772644138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=25X1bI0jpmDxxZZD77ZruB8Cpd2GmsaAXiu+gF/RLsQ=;
 b=E9TIrZuLg1NfzrvuaQnuw5NL3c5aFnndvlpRG+j/hccFXBy+EkHZYAhk
 afmjWT3EsKnHA6enH8LPqkmSdOkZ7PVtzJUR+4MmvUZ+wjv9TKfdCaErS
 1qVOj0sKmdW1+n1ECg3l/ytG0od33VghxHtS4iCMB0wMG0wxGfmNzoRI9
 iVhFucEIwQvV2llAfGvoeY9wAWtUu1qi7AemP4x/vvYdkNOrcYsX2GLhK
 ZqBDkmfnkJmq7R7BUbDu6JYc/Qx12mv8rHKFsJocn/Cev8ULNyP5M3kbX
 PMpD1Z7Akzfm5CaUNLxbnQ2pBfJzB1+4JodbM8s+hARGO/Mi/RIrWrXpK A==;
X-CSE-ConnectionGUID: qL1Lghg+ST6umRM3DCAeDA==
X-CSE-MsgGUID: vVb2pjdKT5+XFCzUdM2l6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44847570"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="44847570"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 09:08:57 -0800
X-CSE-ConnectionGUID: 0c2ew5RrRQ6KDi2J5rVe3Q==
X-CSE-MsgGUID: TW8M3rbTQiqTiOd0lT8+vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="123036928"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 09:08:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/6] drm/xe/xe_gt_pagefault: Disallow writes to read-only
 VMAs
Date: Tue,  4 Mar 2025 17:08:49 +0000
Message-ID: <20250304170854.67195-2-jonathan.cavitt@intel.com>
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

