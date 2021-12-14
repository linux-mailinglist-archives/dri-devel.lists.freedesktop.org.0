Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C555474604
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 16:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA93810E55D;
	Tue, 14 Dec 2021 15:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CB310E55C;
 Tue, 14 Dec 2021 15:07:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="239217677"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="239217677"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 07:07:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="463824251"
Received: from phenderx-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.226.89])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 07:07:11 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Log engine resets
Date: Tue, 14 Dec 2021 15:07:04 +0000
Message-Id: <20211214150704.984034-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Log engine resets done by the GuC firmware in the similar way it is done
by the execlists backend.

This way we have notion of where the hangs are before the GuC gains
support for proper error capture.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 97311119da6f..51512123dc1a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -11,6 +11,7 @@
 #include "gt/intel_context.h"
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_engine_heartbeat.h"
+#include "gt/intel_engine_user.h"
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_clock_utils.h"
@@ -3934,9 +3935,18 @@ static void capture_error_state(struct intel_guc *guc,
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct drm_i915_private *i915 = gt->i915;
-	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
+	struct intel_engine_cs *engine = ce->engine;
 	intel_wakeref_t wakeref;
 
+	if (intel_engine_is_virtual(engine)) {
+		drm_notice(&i915->drm, "%s class, engines 0x%x; GuC engine reset\n",
+			   intel_engine_class_repr(engine->class),
+			   engine->mask);
+		engine = guc_virtual_get_sibling(engine, 0);
+	} else {
+		drm_notice(&i915->drm, "%s GuC engine reset\n", engine->name);
+	}
+
 	intel_engine_set_hung_context(engine, ce);
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
 		i915_capture_error_state(gt, engine->mask);
-- 
2.32.0

