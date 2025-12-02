Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DCDC9D2D7
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 23:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD9110E6F4;
	Tue,  2 Dec 2025 22:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEeG9g2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3C310E6F4;
 Tue,  2 Dec 2025 22:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764713544; x=1796249544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rDoP3Ma4ImOpne5cneuynZ4V5CxUjs4B5cgP6H3fM7I=;
 b=nEeG9g2u26gVZT5ak5nMgWPrd3nlWPvcOhSTpQAofngGEfcQWd0Q8zPR
 T/riQzT4f0xtrBF6xdL3ANuDcTgcGnPr5t11U6aZGG88+LAjtiTAVdPjm
 ZcaDauNw97IF4BaCysU7wbMP3EalsJQLtmpF8YnVoZDKMD1E4CNyv3vr2
 nUNkWhetcJJb6WWD6fUgNiMwy1FmQXQn5mxiful0d68oRzjLjaQ2e5GqS
 eOHOL47wEeJe7oPzLxaj5eBmKmX32gUKmYxPBg509cGP+s3BlF/bfWW/2
 gHAJ3jcq8njagvm186rZgAIVUn0n6ABnTuXv35N7Y6Yx+ymAxGH3Z3xXV w==;
X-CSE-ConnectionGUID: uJYDzNWYR/OPiSr31Y5zPQ==
X-CSE-MsgGUID: sacYgso6S1KM4RHvkqh/XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84096316"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="84096316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:12:24 -0800
X-CSE-ConnectionGUID: uFhUyyjiSbqgJ5kibxnZhw==
X-CSE-MsgGUID: 9LMHcEegS4moySVGEPARyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194490328"
Received: from dut4086lnl.fm.intel.com ([10.105.10.149])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:12:24 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v30 1/5] drm/xe/xe_pagefault: Disallow writes to read-only VMAs
Date: Tue,  2 Dec 2025 22:12:23 +0000
Message-ID: <20251202221221.106060-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202221221.106060-7-jonathan.cavitt@intel.com>
References: <20251202221221.106060-7-jonathan.cavitt@intel.com>
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

v2:
- Apply max line length (Matthew)

Fixes: fb544b844508 ("drm/xe: Implement xe_pagefault_queue_work")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index afb06598b6e1..0b625a52a598 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -187,6 +187,12 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 		goto unlock_vm;
 	}
 
+	if (xe_vma_read_only(vma) &&
+	    pf->consumer.access_type != XE_PAGEFAULT_ACCESS_TYPE_READ) {
+		err = -EPERM;
+		goto unlock_vm;
+	}
+
 	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
 
 	if (xe_vma_is_cpu_addr_mirror(vma))
-- 
2.43.0

