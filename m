Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1590AD99DD
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 05:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD76510E0CB;
	Sat, 14 Jun 2025 03:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmrshUqn";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FC210E0CB;
 Sat, 14 Jun 2025 03:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749870145; x=1781406145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lEbvjP7oyFx/WmF820IupnoTIvVblT4e/Zqi+A2+vR4=;
 b=NmrshUqnpsMgh1S/UdvJD18+5i+KrETPk5xI10V/OYJpCKeaGOd1O7OJ
 KgzKdSdRI3qUIHR4rE0TDJej6+2C8Gxx4BbXSpdnc1APjrJ94k7PSbNmc
 zoz2z0QzqYq7eG57TONAoYR2canrChSkZzJhDiUK+kirW7RNXKumH4Vjk
 Pu0IZXl5KhVq+SrdZWPJ5iuzUnZsWZb+aOsUgaOK69skltUW/ta1cuXXq
 jQ9At5oP/BSIF7RLO/XdN4DbQRElWi5tHEKmk7CHE7BlxPPywTfz04PON
 njtqB/Ht2r4+eeSwdSiC3IqL00VhJ/hx72QieBCMUFovCuSVHQ934aF1V Q==;
X-CSE-ConnectionGUID: LAJLdrlPR2qQW6CG3AggDg==
X-CSE-MsgGUID: neu8+eT/TlOUtVLM8nI05g==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62700223"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="62700223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 20:02:23 -0700
X-CSE-ConnectionGUID: ilEgh+LqRY2vag/r3HKyYw==
X-CSE-MsgGUID: jjwYMwrnT++Dyi3nMl4Rug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="147973871"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa009.jf.intel.com with ESMTP; 13 Jun 2025 20:02:23 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2] drm/i915/guc: Enable CT_DEAD output in regular debug builds
Date: Fri, 13 Jun 2025 20:02:22 -0700
Message-ID: <20250614030222.105601-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

There is a sporadic failure to enable CTs ocurring in CI on one
specific machine that can't be reproduced locally. The driver already
supports dumping out a whole bunch of GuC related debug info on such a
failure but only when the verbose GuC debug config option is enabled.
It would be preferable to not enable all the verbose debug output. So
just bump the CT_DEAD code to regular I915 debug level rather than GUC
debug level, at least temporarily for CI.

To prevent excessive spam in other parts of CI, also add a check
against doing a CT_DEAD dump during an error injection test. No point
in dumping large amounts of 'why did this fail' info when the fail is
deliberately induced.

v2: Revert accidentally enabling some other verbose debug output.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 11 +++++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 0d5197c0824a9..380a11c92d632 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -13,7 +13,7 @@
 #include "intel_guc_ct.h"
 #include "intel_guc_print.h"
 
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
 enum {
 	CT_DEAD_ALIVE = 0,
 	CT_DEAD_SETUP,
@@ -144,7 +144,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
 	spin_lock_init(&ct->requests.lock);
 	INIT_LIST_HEAD(&ct->requests.pending);
 	INIT_LIST_HEAD(&ct->requests.incoming);
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
 	INIT_WORK(&ct->dead_ct_worker, ct_dead_ct_worker_func);
 #endif
 	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
@@ -373,7 +373,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 
 	ct->enabled = true;
 	ct->stall_time = KTIME_MAX;
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
 	ct->dead_ct_reported = false;
 	ct->dead_ct_reason = CT_DEAD_ALIVE;
 #endif
@@ -1377,7 +1377,7 @@ void intel_guc_ct_print_info(struct intel_guc_ct *ct,
 		   ct->ctbs.recv.desc->tail);
 }
 
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
 static void ct_dead_ct_worker_func(struct work_struct *w)
 {
 	struct intel_guc_ct *ct = container_of(w, struct intel_guc_ct, dead_ct_worker);
@@ -1386,6 +1386,9 @@ static void ct_dead_ct_worker_func(struct work_struct *w)
 	if (ct->dead_ct_reported)
 		return;
 
+	if (i915_error_injected())
+		return;
+
 	ct->dead_ct_reported = true;
 
 	guc_info(guc, "CTB is dead - reason=0x%X\n", ct->dead_ct_reason);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index 2c4bb9a941be6..e9a6ec4e6d387 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -97,7 +97,7 @@ struct intel_guc_ct {
 	/** @stall_time: time of first time a CTB submission is stalled */
 	ktime_t stall_time;
 
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
 	int dead_ct_reason;
 	bool dead_ct_reported;
 	struct work_struct dead_ct_worker;
-- 
2.49.0

