Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628BDC70E7A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 20:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86ACD10E275;
	Wed, 19 Nov 2025 19:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYR61x3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E9D10E276;
 Wed, 19 Nov 2025 19:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763582010; x=1795118010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=io/MgYqZWbMMOZ6mpczadp66gQnofO6oCcGMNEoNwGA=;
 b=mYR61x3rvxI2oXlPTzrs0IIZOIR5AK/Lb82VauvZtvbY2vyY6nDcNqkG
 DoIRGKntV4By7CwzQX1GNNVoND1+uRaKOdp8Fm/+GIKhyXJZUQFKxa4Gl
 EUf+U2NKQtsrWHqXcH3/fV517KSeddYyZqO5Se2pz1VJtepGLR/Yrop6h
 GVmoEkB4HKZ07TCkM8FDJFfezy77JGcKIYAC1wI0c281fUTIrvhxBWvWS
 hPztWAmEEAWuH4zTQEAkg7VwgM5YeEM0I7LbQDepKBhJyPeSy/3x/3uXX
 edGfbpofeAmNtpRtmJz1na/z0lKB4zMqs3enXMHwmRJnWg1mUVFMA8YxP g==;
X-CSE-ConnectionGUID: dAghMnlIRtOOypuj/aDpIg==
X-CSE-MsgGUID: a252ZnhZRISMUmqJzsAqMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="75964656"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="75964656"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 11:53:29 -0800
X-CSE-ConnectionGUID: l/lzWO4iTCuOZV5XgIaWfQ==
X-CSE-MsgGUID: iq8N/fKqT8ahRQYJT/vYHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="190942904"
Received: from dut4025lnl.fm.intel.com ([10.105.8.193])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 11:53:29 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com,
 ivan.briano@intel.com, matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v26 1/4] drm/xe/xe_pagefault: Disallow writes to read-only VMAs
Date: Wed, 19 Nov 2025 19:53:24 +0000
Message-ID: <20251119195322.86585-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119195322.86585-6-jonathan.cavitt@intel.com>
References: <20251119195322.86585-6-jonathan.cavitt@intel.com>
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
VMAs.  Add code to handle this in xe_pagefault_service after the VMA
lookup.

Fixes: fb544b844508 ("drm/xe: Implement xe_pagefault_queue_work")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index fe3e40145012..836c39010f02 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -188,6 +188,11 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 		goto unlock_vm;
 	}
 
+	if (xe_vma_read_only(vma) && pf->consumer.access_type != XE_PAGEFAULT_ACCESS_TYPE_READ) {
+		err = -EPERM;
+		goto unlock_vm;
+	}
+
 	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
 
 	if (xe_vma_is_cpu_addr_mirror(vma))
-- 
2.43.0

