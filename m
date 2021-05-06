Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2261375903
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 19:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B823D6ECC0;
	Thu,  6 May 2021 17:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880E06ECCB;
 Thu,  6 May 2021 17:13:05 +0000 (UTC)
IronPort-SDR: LJyUS3l+jNzBRZt3USXr1zJsGWpqGg2gzfvtHzcxkcGn+uIlQN4/BFGMsQTYLzs7b5mlSMdD5D
 HPzHv8Qgaqpg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="195412171"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="195412171"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 10:13:05 -0700
IronPort-SDR: p1rw+IaA7P6Eg6GNmiG2bem6/JOWdWJ8RvHn7k9nFeg8m7Oxk0iW8nQ8I6ljxr1pHjtMSgMNiR
 v7CWDD35XyLA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="622533965"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 10:13:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 4/5] drm/i915: Introduce 'set parallel submit' extension
Date: Thu,  6 May 2021 10:30:48 -0700
Message-Id: <20210506173049.72503-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506173049.72503-1-matthew.brost@intel.com>
References: <20210506173049.72503-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tony.ye@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, carl.zhang@intel.com,
 jason.ekstrand@intel.com, jon.bloomfield@intel.com, daniel.vetter@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_drm.h updates for 'set parallel submit' extension.

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
CC: Carl Zhang <carl.zhang@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/i915_drm.h | 126 ++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 26d2e135aa31..0175b12b33b8 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1712,6 +1712,7 @@ struct drm_i915_gem_context_param {
  * Extensions:
  *   i915_context_engines_load_balance (I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE)
  *   i915_context_engines_bond (I915_CONTEXT_ENGINES_EXT_BOND)
+ *   i915_context_engines_parallel_submit (I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT)
  */
 #define I915_CONTEXT_PARAM_ENGINES	0xa
 
@@ -1894,9 +1895,134 @@ struct i915_context_param_engines {
 	__u64 extensions; /* linked chain of extension blocks, 0 terminates */
 #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
 #define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_bond */
+#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
 	struct i915_engine_class_instance engines[0];
 } __attribute__((packed));
 
+/*
+ * i915_context_engines_parallel_submit:
+ *
+ * Setup a gem context to allow multiple BBs to be submitted in a single execbuf
+ * IOCTL. Those BBs will then be scheduled to run on the GPU in parallel.
+ *
+ * All hardware contexts in the engine set are configured for parallel
+ * submission (i.e. once this gem context is configured for parallel submission,
+ * all the hardware contexts, regardless if a BB is available on each individual
+ * context, will be submitted to the GPU in parallel). A user can submit BBs to
+ * subset of the hardware contexts, in a single execbuf IOCTL, but it is not
+ * recommended as it may reserve physical engines with nothing to run on them.
+ * Highly recommended to configure the gem context with N hardware contexts then
+ * always submit N BBs in a single IOCTL.
+ *
+ * Their are two currently defined ways to control the placement of the
+ * hardware contexts on physical engines: default behavior (no flags) and
+ * I915_PARALLEL_IMPLICT_BONDS (a flag). More flags may be added the in the
+ * future as new hardware / use cases arise. Details of how to use this
+ * interface below above the flags.
+ *
+ * Returns -EINVAL if hardware context placement configuration invalid or if the
+ * placement configuration isn't supported on the platform / submission
+ * interface.
+ * Returns -ENODEV if extension isn't supported on the platform / submission
+ * inteface.
+ */
+struct i915_context_engines_parallel_submit {
+	struct i915_user_extension base;
+
+/*
+ * Default placement behvavior (currently unsupported):
+ *
+ * Rather than restricting parallel submission to a single class with a
+ * logically contiguous placement (I915_PARALLEL_IMPLICT_BONDS), add a mode that
+ * enables parallel submission across multiple engine classes. In this case each
+ * context's logical engine mask indicates where that context can placed. It is
+ * implied in this mode that all contexts have mutual exclusive placement (e.g.
+ * if one context is running CS0 no other contexts can run on CS0).
+ *
+ * Example 1 pseudo code:
+ * CSX[Y] = engine class X, logical instance Y
+ * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
+ * set_engines(INVALID, INVALID)
+ * set_load_balance(engine_index=0, num_siblings=2, engines=CS0[0],CS0[1])
+ * set_load_balance(engine_index=1, num_siblings=2, engines=CS1[0],CS1[1])
+ * set_parallel()
+ *
+ * Results in the following valid placements:
+ * CS0[0], CS1[0]
+ * CS0[0], CS1[1]
+ * CS0[1], CS1[0]
+ * CS0[1], CS1[1]
+ *
+ * Example 2 pseudo code:
+ * CS[X] = generic engine of same class, logical instance X
+ * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
+ * set_engines(INVALID, INVALID)
+ * set_load_balance(engine_index=0, num_siblings=3, engines=CS[0],CS[1],CS[2])
+ * set_load_balance(engine_index=1, num_siblings=3, engines=CS[0],CS[1],CS[2])
+ * set_parallel()
+ *
+ * Results in the following valid placements:
+ * CS[0], CS[1]
+ * CS[0], CS[2]
+ * CS[1], CS[0]
+ * CS[1], CS[2]
+ * CS[2], CS[0]
+ * CS[2], CS[1]
+ *
+ * This enables a use case where all engines are created equally, we don't care
+ * where they are scheduled, we just want a certain number of resources, for
+ * those resources to be scheduled in parallel, and possibly across multiple
+ * engine classes.
+ */
+
+/*
+ * I915_PARALLEL_IMPLICT_BONDS - Create implict bonds between each context.
+ * Each context must have the same number sibling and bonds are implictly create
+ * of the siblings.
+ *
+ * All of the below examples are in logical space.
+ *
+ * Example 1 pseudo code:
+ * CS[X] = generic engine of same class, logical instance X
+ * set_engines(CS[0], CS[1])
+ * set_parallel(flags=I915_PARALLEL_IMPLICT_BONDS)
+ *
+ * Results in the following valid placements:
+ * CS[0], CS[1]
+ *
+ * Example 2 pseudo code:
+ * CS[X] = generic engine of same class, logical instance X
+ * INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
+ * set_engines(INVALID, INVALID)
+ * set_load_balance(engine_index=0, num_siblings=2, engines=CS[0],CS[2])
+ * set_load_balance(engine_index=1, num_siblings=2, engines=CS[1],CS[3])
+ * set_parallel(flags=I915_PARALLEL_IMPLICT_BONDS)
+ *
+ * Results in the following valid placements:
+ * CS[0], CS[1]
+ * CS[2], CS[3]
+ *
+ * This enables a use case where all engines are not equal and certain placement
+ * rules are required (i.e. split-frame requires all contexts to be placed in a
+ * logically contiguous order on the VCS engines on gen11+ platforms). This use
+ * case (logically contiguous placement, within a single engine class) is
+ * supported when using GuC submission. Execlist mode could support all possible
+ * bonding configurations but currently doesn't support this extension.
+ */
+#define I915_PARALLEL_IMPLICT_BONDS		(1<<0)
+/*
+ * Do not allow BBs to be preempted mid BB rather insert coordinated preemption
+ * points on all hardware contexts between each set of BBs. An example use case
+ * of this feature is split-frame on gen11+ hardware. When using this feature a
+ * BB must be submitted on each hardware context in the parallel gem context.
+ * The execbuf2 IOCTL enforces the user adheres to policy.
+ */
+#define I915_PARALLEL_NO_PREEMPT_MID_BATCH	(1<<1)
+#define I915_PARALLEL_UNKNOWN_FLAGS  (-(I915_PARALLEL_NO_PREEMPT_MID_BATCH << 1))
+	__u64 flags; /* all undefined flags must be zero */
+	__u64 mbz64[4]; /* reserved for future use; must be zero */
+} __attribute__ ((packed));
+
 #define I915_DEFINE_CONTEXT_PARAM_ENGINES(name__, N__) struct { \
 	__u64 extensions; \
 	struct i915_engine_class_instance engines[N__]; \
-- 
2.28.0

