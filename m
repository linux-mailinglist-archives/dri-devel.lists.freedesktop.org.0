Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8119C7545F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 17:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976AA10E77B;
	Thu, 20 Nov 2025 16:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmHhLMfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D000610E778;
 Thu, 20 Nov 2025 16:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763655287; x=1795191287;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8FQ3Hx/P7dpdV17EIj8i93hlmzauTJyPVO0chUYXFTc=;
 b=LmHhLMfz7hJ8Y2QbGJ2glJOcEASblEV8rxS4DM6YYjl49usCZdBan15k
 OpbJ2ulgK9wQ2Kl9SS7U3PwzOOdVmLXOQ7KEldhg+CDSoqvEsIPQE/4wY
 e9WwaNO+q+KfoV38g2mSi7nMRFj5sbVDCEmwmfJT4Er3pjwOERJWrA/SE
 Chfw0fqUqfWGqpnyWuV8uXWJxijhoh/nP2XZM2Hu5oHvHJJlD4MrJuGnZ
 UxqCy4igE4RQevSlN0OEygOnZqp+qbDYZPCH6Oqd9KGYgxGlqLMH06dhh
 f79e4QfgsK85ikq4ZSI+XzScvRmcgRFwbmJaCn+G8fD0BkfoqjAUlR7Em A==;
X-CSE-ConnectionGUID: IIhwHUGLTR2qK5T1bK1brA==
X-CSE-MsgGUID: 4YT96dngQ+adl7/Ms6WnIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83353096"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="83353096"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 08:14:47 -0800
X-CSE-ConnectionGUID: 6kyUDZjeRrCVQr+kF9Zn2A==
X-CSE-MsgGUID: h8yGTxHUTLyjCrItzSWwxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191529642"
Received: from carterle-desk.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.246.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 08:14:43 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/xe: Fix memory leak when handling pagefault vma
Date: Thu, 20 Nov 2025 18:14:35 +0200
Message-ID: <20251120161435.3674556-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When the pagefault handling code was moved to a new file, an extra
drm_exec_init() was added to the VMA path. This call is unnecessary because
xe_validation_ctx_init() already performs a drm_exec_init(), resulting in a
memory leak reported by kmemleak.

Remove the redundant drm_exec_init() from the VMA pagefault handling code.

Fixes: fb544b844508 ("drm/xe: Implement xe_pagefault_queue_work")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: intel-xe@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index fe3e40145012..afb06598b6e1 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -102,7 +102,6 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 
 	/* Lock VM and BOs dma-resv */
 	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
-	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
 					 needs_vram == 1);
-- 
2.43.0

