Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126C5EEB8F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 04:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B6310E9C0;
	Thu, 29 Sep 2022 02:17:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9159510E9B0;
 Thu, 29 Sep 2022 02:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664417840; x=1695953840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3At9ZmJALAtJTThwrvGjxOIfiAyzxO0mhS/hjGfppFg=;
 b=iQvdMS4uVqH1EyWeNG3tvRt6Y35LaGaedMXlyqLY7ui6gB26WnwSTipu
 nk79sPeK73naKlLA33HALf439URW2crIyv2ZSzenrB3bEce88Umn43oKk
 QW2gPKp2UoWsMfELDPMY4sKk8YcOgKl9B3llGOvXsMUhrYqdA886i1Ws+
 1sNjDJSmU+4+U/3z5B5X4YeNylRiP7FDGLaPOh/M2P9TRb942hE8E1K3u
 5pIwc9YFmlaLDseZSRd4HT8p/i40L1AqoXVM1fMVgGm2CHqJfrzAie0Cb
 cNLJd7r/eVTmsG65L5CWV34BMLFXGgat3AzEj0QP9X+rZci/MPJ4c8DBI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="281484117"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="281484117"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 19:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="573275934"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="573275934"
Received: from relo-linux-5.jf.intel.com ([10.165.21.142])
 by orsmga003.jf.intel.com with ESMTP; 28 Sep 2022 19:17:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v4 1/4] drm/i915/guc: Limit scheduling properties to avoid
 overflow
Date: Wed, 28 Sep 2022 19:18:10 -0700
Message-Id: <20220929021813.2172701-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
References: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

GuC converts the pre-emption timeout and timeslice quantum values into
clock ticks internally. That significantly reduces the point of 32bit
overflow. On current platforms, worst case scenario is approximately
110 seconds. Rather than allowing the user to set higher values and
then get confused by early timeouts, add limits when setting these
values.

v2: Add helper functions for clamping (review feedback from Tvrtko).
v3: Add a bunch of BUG_ON range checks in addition to the checks
already in the clamping functions (Tvrtko)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> (v1)
---
 drivers/gpu/drm/i915/gt/intel_engine.h        |  6 ++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 69 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/sysfs_engines.c       | 25 ++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 21 ++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 +++
 5 files changed, 119 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 04e435bce79bd..cbc8b857d5f7a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -348,4 +348,10 @@ intel_engine_get_hung_context(struct intel_engine_cs *engine)
 	return engine->hung_ce;
 }
 
+u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs *engine, u64 value);
+u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs *engine, u64 value);
+u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, u64 value);
+u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 value);
+u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs *engine, u64 value);
+
 #endif /* _INTEL_RINGBUFFER_H_ */
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 2ddcad497fa30..8f16955f0821e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -512,6 +512,26 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 		engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
 	}
 
+	/* Cap properties according to any system limits */
+#define CLAMP_PROP(field) \
+	do { \
+		u64 clamp = intel_clamp_##field(engine, engine->props.field); \
+		if (clamp != engine->props.field) { \
+			drm_notice(&engine->i915->drm, \
+				   "Warning, clamping %s to %lld to prevent overflow\n", \
+				   #field, clamp); \
+			engine->props.field = clamp; \
+		} \
+	} while (0)
+
+	CLAMP_PROP(heartbeat_interval_ms);
+	CLAMP_PROP(max_busywait_duration_ns);
+	CLAMP_PROP(preempt_timeout_ms);
+	CLAMP_PROP(stop_timeout_ms);
+	CLAMP_PROP(timeslice_duration_ms);
+
+#undef CLAMP_PROP
+
 	engine->defaults = engine->props; /* never to change again */
 
 	engine->context_size = intel_engine_context_size(gt, engine->class);
@@ -534,6 +554,55 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 	return 0;
 }
 
+u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs *engine, u64 value)
+{
+	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
+
+	return value;
+}
+
+u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs *engine, u64 value)
+{
+	value = min(value, jiffies_to_nsecs(2));
+
+	return value;
+}
+
+u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, u64 value)
+{
+	/*
+	 * NB: The GuC API only supports 32bit values. However, the limit is further
+	 * reduced due to internal calculations which would otherwise overflow.
+	 */
+	if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
+		value = min_t(u64, value, guc_policy_max_preempt_timeout_ms());
+
+	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
+
+	return value;
+}
+
+u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 value)
+{
+	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
+
+	return value;
+}
+
+u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs *engine, u64 value)
+{
+	/*
+	 * NB: The GuC API only supports 32bit values. However, the limit is further
+	 * reduced due to internal calculations which would otherwise overflow.
+	 */
+	if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
+		value = min_t(u64, value, guc_policy_max_exec_quantum_ms());
+
+	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
+
+	return value;
+}
+
 static void __setup_engine_capabilities(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *i915 = engine->i915;
diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index 9670310562029..f2d9858d827c2 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -144,7 +144,7 @@ max_spin_store(struct kobject *kobj, struct kobj_attribute *attr,
 	       const char *buf, size_t count)
 {
 	struct intel_engine_cs *engine = kobj_to_engine(kobj);
-	unsigned long long duration;
+	unsigned long long duration, clamped;
 	int err;
 
 	/*
@@ -168,7 +168,8 @@ max_spin_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (err)
 		return err;
 
-	if (duration > jiffies_to_nsecs(2))
+	clamped = intel_clamp_max_busywait_duration_ns(engine, duration);
+	if (duration != clamped)
 		return -EINVAL;
 
 	WRITE_ONCE(engine->props.max_busywait_duration_ns, duration);
@@ -203,7 +204,7 @@ timeslice_store(struct kobject *kobj, struct kobj_attribute *attr,
 		const char *buf, size_t count)
 {
 	struct intel_engine_cs *engine = kobj_to_engine(kobj);
-	unsigned long long duration;
+	unsigned long long duration, clamped;
 	int err;
 
 	/*
@@ -218,7 +219,8 @@ timeslice_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (err)
 		return err;
 
-	if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
+	clamped = intel_clamp_timeslice_duration_ms(engine, duration);
+	if (duration != clamped)
 		return -EINVAL;
 
 	WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
@@ -256,7 +258,7 @@ stop_store(struct kobject *kobj, struct kobj_attribute *attr,
 	   const char *buf, size_t count)
 {
 	struct intel_engine_cs *engine = kobj_to_engine(kobj);
-	unsigned long long duration;
+	unsigned long long duration, clamped;
 	int err;
 
 	/*
@@ -272,7 +274,8 @@ stop_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (err)
 		return err;
 
-	if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
+	clamped = intel_clamp_stop_timeout_ms(engine, duration);
+	if (duration != clamped)
 		return -EINVAL;
 
 	WRITE_ONCE(engine->props.stop_timeout_ms, duration);
@@ -306,7 +309,7 @@ preempt_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
 		      const char *buf, size_t count)
 {
 	struct intel_engine_cs *engine = kobj_to_engine(kobj);
-	unsigned long long timeout;
+	unsigned long long timeout, clamped;
 	int err;
 
 	/*
@@ -322,7 +325,8 @@ preempt_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (err)
 		return err;
 
-	if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
+	clamped = intel_clamp_preempt_timeout_ms(engine, timeout);
+	if (timeout != clamped)
 		return -EINVAL;
 
 	WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
@@ -362,7 +366,7 @@ heartbeat_store(struct kobject *kobj, struct kobj_attribute *attr,
 		const char *buf, size_t count)
 {
 	struct intel_engine_cs *engine = kobj_to_engine(kobj);
-	unsigned long long delay;
+	unsigned long long delay, clamped;
 	int err;
 
 	/*
@@ -379,7 +383,8 @@ heartbeat_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (err)
 		return err;
 
-	if (delay >= jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
+	clamped = intel_clamp_heartbeat_interval_ms(engine, delay);
+	if (delay != clamped)
 		return -EINVAL;
 
 	err = intel_engine_set_heartbeat(engine, delay);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index e7a7fb450f442..968ebd79dce70 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -327,6 +327,27 @@ struct guc_update_scheduling_policy {
 
 #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
 
+/*
+ * GuC converts the timeout to clock ticks internally. Different platforms have
+ * different GuC clocks. Thus, the maximum value before overflow is platform
+ * dependent. Current worst case scenario is about 110s. So, the spec says to
+ * limit to 100s to be safe.
+ */
+#define GUC_POLICY_MAX_EXEC_QUANTUM_US		(100 * 1000 * 1000UL)
+#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_US	(100 * 1000 * 1000UL)
+
+static inline u32 guc_policy_max_exec_quantum_ms(void)
+{
+	BUILD_BUG_ON(GUC_POLICY_MAX_EXEC_QUANTUM_US >= UINT_MAX);
+	return GUC_POLICY_MAX_EXEC_QUANTUM_US / 1000;
+}
+
+static inline u32 guc_policy_max_preempt_timeout_ms(void)
+{
+	BUILD_BUG_ON(GUC_POLICY_MAX_PREEMPT_TIMEOUT_US >= UINT_MAX);
+	return GUC_POLICY_MAX_PREEMPT_TIMEOUT_US / 1000;
+}
+
 struct guc_policies {
 	u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
 	/* In micro seconds. How much time to allow before DPC processing is
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0ef295a94060c..039c187ce570d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2430,6 +2430,10 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
 	int ret;
 
 	/* NB: For both of these, zero means disabled. */
+	GEM_BUG_ON(overflows_type(engine->props.timeslice_duration_ms * 1000,
+				  execution_quantum));
+	GEM_BUG_ON(overflows_type(engine->props.preempt_timeout_ms * 1000,
+				  preemption_timeout));
 	execution_quantum = engine->props.timeslice_duration_ms * 1000;
 	preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 
@@ -2463,6 +2467,10 @@ static void guc_context_policy_init_v69(struct intel_engine_cs *engine,
 		desc->policy_flags |= CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE_V69;
 
 	/* NB: For both of these, zero means disabled. */
+	GEM_BUG_ON(overflows_type(engine->props.timeslice_duration_ms * 1000,
+				  desc->execution_quantum));
+	GEM_BUG_ON(overflows_type(engine->props.preempt_timeout_ms * 1000,
+				  desc->preemption_timeout));
 	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
 	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 }
-- 
2.37.3

