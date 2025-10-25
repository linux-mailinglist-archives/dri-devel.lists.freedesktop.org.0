Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6633EC08FF9
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8880F10E2A5;
	Sat, 25 Oct 2025 12:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/NbWUbn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731B810E2A5;
 Sat, 25 Oct 2025 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393921; x=1792929921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=93Iy6abYvlh9PEzz9JgfwmgrRaLPx5PlcRvj70IdeME=;
 b=R/NbWUbnHwVzhkGlDtl004bmwQiOejWzV0fcVX+o5FJZuyg8JDwnPRap
 RMIuMJm0vdifSVSRD8Cs8GVu9g+kBH3cHz8nOjUNGXC9qTIg9EU+Wi8wF
 zNoJfmu/JAH/trvDqIPt0bmeONKfT3mktC/0NVjpNRn+sldo7+hi3ysLJ
 lVDz7sBACVFZ7j8zQk9H/j7UXMGq52TOsgDkJ61pLuq0rP8eH4D7GmOv/
 RUSqrnnV5Cjccs+M4UiVykiq+28w5X6q/e/6bcrSMw6xTXeKoovRyhjQR
 vwbEciaI5cDBo6Cpi+Mjk+mm4vCsWxwUbwY+rVwliCw0YzXmEv/OQWmaU g==;
X-CSE-ConnectionGUID: E6anLfOgS1uheS7d8FFA8A==
X-CSE-MsgGUID: qSl1aXeNQzWDkiCpz2prWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590397"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590397"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:05:21 -0700
X-CSE-ConnectionGUID: 6QwzKUmpQtKO3eOhBV6XAw==
X-CSE-MsgGUID: W7IAOz1zTfiKNT8j2jy/XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023842"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:05:18 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 15/15] drm/xe: Retry migration once
Date: Sat, 25 Oct 2025 14:04:12 +0200
Message-ID: <20251025120412.12262-16-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
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

Data present in foreign device memory may cause migration to fail.
For now, retry once after first migrating to system.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 9814f95cb212..41e075aa015c 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1529,13 +1529,24 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
 		      struct drm_pagemap *dpagemap)
 {
+	int err, retries = 1;
+
 	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
-	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
-				       xe_svm_range_end(range),
-				       range->base.gpusvm->mm,
-				       ctx->timeslice_ms);
+retry:
+	err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
+				      xe_svm_range_end(range),
+				      range->base.gpusvm->mm,
+				      ctx->timeslice_ms);
+	if ((err == -EBUSY || err == -EFAULT) && retries--) {
+		range_debug(range, "ALLOCATE VRAM - Retry.");
+
+		drm_gpusvm_range_evict(range->base.gpusvm, &range->base);
+		goto retry;
+	}
+
+	return err;
 }
 
 static struct drm_pagemap_addr
-- 
2.51.0

