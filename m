Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688E34C7430
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8D710E84E;
	Mon, 28 Feb 2022 17:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBFA10E84F;
 Mon, 28 Feb 2022 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646070187; x=1677606187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=17o/Nx37I6PL6bHZAAsdZKlTm3nXc9UUOB+EayUMh5E=;
 b=n4Nr7sxc5wWYUZ9qyFdjs2IBY2iE93R5lfbz1atOd6OWvDeP2PMrKfjY
 qiVOL7bb+Fas6eT0fYZURPfNwwBsgF3lfYnTWF35FWhUns4k1+3rbn4n/
 NOGae3sy04ixoHUbGA7IIT9Gv00ce9yZEzrZsS8oTIgw0/MI9TI/IroWa
 85PbNJBeshJ1jVp876i7b8eVb8Wqj9nXgswNKCgZC9oaSnGhR0gWP8Ayy
 5UoszW5jjWnYbIFh/WPA5KmjoAb63WFTqIwiVOz0gXUQTS5u3BLbGCxil
 uo7uUg8FWxez7XBMrBUsL0JT+cfKzzWvFDNEQ3W3/ebfoJBr1bPEOnSb3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="232913192"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="232913192"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:06 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575392845"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/13] drm/i915/xehp: Enable ccs/dual-ctx in RCU_MODE
Date: Mon, 28 Feb 2022 09:42:41 -0800
Message-Id: <20220228174245.1569581-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228174245.1569581-1-matthew.d.roper@intel.com>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have to specify in the Render Control Unit Mode register
when CCS is enabled.

v2:
 - Move RCU_MODE programming to a helper function.  (Tvrtko)
 - Clean up and clarify comments.  (Tvrtko)
 - Add RCU_MODE to the GuC save/restore list.  (Daniele)

Bspec: 46034
Original-author: Michel Thierry
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine.h          |  2 ++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c       | 17 +++++++++++++++++
 .../drm/i915/gt/intel_execlists_submission.c    | 16 ++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 16 ++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index be4b1e65442f..1c0ab05c3c40 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -265,6 +265,8 @@ intel_engine_create_pinned_context(struct intel_engine_cs *engine,
 
 void intel_engine_destroy_pinned_context(struct intel_context *ce);
 
+void xehp_enable_ccs_engines(struct intel_engine_cs *engine);
+
 #define ENGINE_PHYSICAL	0
 #define ENGINE_MOCK	1
 #define ENGINE_VIRTUAL	2
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 2136c56d3abc..92f4cf9833ee 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -2070,6 +2070,23 @@ intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
 	return active;
 }
 
+void xehp_enable_ccs_engines(struct intel_engine_cs *engine)
+{
+	/*
+	 * If there are any non-fused-off CCS engines, we need to enable CCS
+	 * support in the RCU_MODE register.  This only needs to be done once,
+	 * so for simplicity we'll take care of this in the RCS engine's
+	 * resume handler; since the RCS and all CCS engines belong to the
+	 * same reset domain and are reset together, this will also take care
+	 * of re-applying the setting after i915-triggered resets.
+	 */
+	if (!CCS_MASK(engine->gt))
+		return;
+
+	intel_uncore_write(engine->uncore, GEN12_RCU_MODE,
+			   _MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "mock_engine.c"
 #include "selftest_engine.c"
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index c8407cc96c42..574c0542c92f 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2914,6 +2914,19 @@ static int execlists_resume(struct intel_engine_cs *engine)
 	return 0;
 }
 
+static int gen12_rcs_resume(struct intel_engine_cs *engine)
+{
+	int ret;
+
+	ret = execlists_resume(engine);
+	if (ret)
+		return ret;
+
+	xehp_enable_ccs_engines(engine);
+
+	return 0;
+}
+
 static void execlists_reset_prepare(struct intel_engine_cs *engine)
 {
 	ENGINE_TRACE(engine, "depth<-%d\n",
@@ -3468,6 +3481,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
 		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
 		break;
 	}
+
+	if (engine->class == RENDER_CLASS)
+		engine->resume = gen12_rcs_resume;
 }
 
 int intel_execlists_submission_setup(struct intel_engine_cs *engine)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 6db8bb1982ca..7e42fecd6093 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3619,6 +3619,19 @@ static bool guc_sched_engine_disabled(struct i915_sched_engine *sched_engine)
 	return !sched_engine->tasklet.callback;
 }
 
+static int gen12_rcs_resume(struct intel_engine_cs *engine)
+{
+	int ret;
+
+	ret = guc_resume(engine);
+	if (ret)
+		return ret;
+
+	xehp_enable_ccs_engines(engine);
+
+	return 0;
+}
+
 static void guc_set_default_submission(struct intel_engine_cs *engine)
 {
 	engine->submit_request = guc_submit_request;
@@ -3739,6 +3752,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
 		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
 		break;
 	}
+
+	if (engine->class == RENDER_CLASS)
+		engine->resume = gen12_rcs_resume;
 }
 
 static inline void guc_default_irqs(struct intel_engine_cs *engine)
-- 
2.34.1

