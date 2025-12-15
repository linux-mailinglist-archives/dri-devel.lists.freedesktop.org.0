Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8DCC027B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 00:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA2B10E59B;
	Mon, 15 Dec 2025 23:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MV6LGbYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFD910E3B6;
 Mon, 15 Dec 2025 23:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765840194; x=1797376194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rDoP3Ma4ImOpne5cneuynZ4V5CxUjs4B5cgP6H3fM7I=;
 b=MV6LGbYek/vKrMuaHJPNLNbi2F2n3c/BDIyXgeP28whB/hIKvos1hn+j
 ekvNL+iL0xuEzvAsgxTIZOr/UuYY+TXwAs6xyd2k4ENmM2508jhabzPMf
 SoCQqCmRQj4rj/HIDltef8L5QlE/ZIL0+cjxcg+A+X9xmdoQjT9SBnUXB
 lfv20e7EzbaSX3tOyBq1hOeZcBGA2aN9Sx58xfwNLrMXrhbTSnkpIvQKb
 q6+IyXgohlHGTDqqU4sGZVXiv3DNmpdsSFci7T2Iy+Ep1fScDDGqTvbBm
 4PCSolqzkommpb9DEIdXiq85P2dKDUJNPfcktWt0u++7L1Bfbb0LpQsYH g==;
X-CSE-ConnectionGUID: HKqhz56zR1OjxPHuTh3fbg==
X-CSE-MsgGUID: vWudPSTQSeyr02NOMp6RbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67790372"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67790372"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 15:09:53 -0800
X-CSE-ConnectionGUID: MViyd4AGS0GKRNFVdwxwbw==
X-CSE-MsgGUID: i0Ftvq79TMKt8XMYIAw4yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="228511052"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 15:09:52 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v31 1/5] drm/xe/xe_pagefault: Disallow writes to read-only VMAs
Date: Mon, 15 Dec 2025 23:09:51 +0000
Message-ID: <20251215230949.164845-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215230949.164845-7-jonathan.cavitt@intel.com>
References: <20251215230949.164845-7-jonathan.cavitt@intel.com>
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

