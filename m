Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6874AD9985
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 03:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA86410E779;
	Sat, 14 Jun 2025 01:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJInJ9Tc";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1125110E1AF;
 Sat, 14 Jun 2025 01:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749865323; x=1781401323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iPs6qCmhqt69fTEQUv2x39eUxGM0y2Qfmda25VU5QjU=;
 b=OJInJ9TcZJ3zmyksZXmUJoPWFUV7AHuLXJ6SAi9o5PgfvZlI1w3jLWNq
 tKFOmbNAxUxF/Y15KwV7CNAH/QOsz7ivTVtauoHqZ8cY0+2ndb89QQztE
 yRE8uekgX53ehtv8AlqfOm+WqJL4QE6fQfWS37PixFmrAyz1KNtstZGFF
 b+KDMLYbn99eiTtB5hzqcrBpI5lJRfdpjRK6x31gnEIUZrtdpEOIbX3iM
 z7wEa0oLVzoAtY4c7mJXynJa7tZ+kiBL+EJhaZW4HmxpO1A3rx0CgCyZH
 w3vXJThOAzyCA3bB3ilJdmf3aQz1hsfD+oJrscbr5xu3xKC1b+4pMgUt+ Q==;
X-CSE-ConnectionGUID: 62xXBSLASs6+d+8b8ydkDg==
X-CSE-MsgGUID: hIvb2Hy4ST6e4wYoNaHfVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69529982"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="69529982"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:42:03 -0700
X-CSE-ConnectionGUID: hzQKLC2zSd6vHF3+UjSgJw==
X-CSE-MsgGUID: PnQIDfm/Q/+hnRex3D0zGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="153135885"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa004.fm.intel.com with ESMTP; 13 Jun 2025 18:41:53 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/i915/guc: Enable CT_DEAD output in regular debug builds
Date: Fri, 13 Jun 2025 18:41:53 -0700
Message-ID: <20250614014153.91379-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 13 ++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 0d5197c0824a9..6544fc3823668 100644
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
@@ -44,7 +44,7 @@ static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
 
 #define CT_ERROR(_ct, _fmt, ...) \
 	guc_err(ct_to_guc(_ct), "CT: " _fmt, ##__VA_ARGS__)
-#ifdef CONFIG_DRM_I915_DEBUG_GUC
+#ifdef CONFIG_DRM_I915_DEBUG
 #define CT_DEBUG(_ct, _fmt, ...) \
 	guc_dbg(ct_to_guc(_ct), "CT: " _fmt, ##__VA_ARGS__)
 #else
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

