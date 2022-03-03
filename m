Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AED4CC92E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5096310E3B4;
	Thu,  3 Mar 2022 22:37:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824DD10E38E;
 Thu,  3 Mar 2022 22:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646347058; x=1677883058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KSF7CMpi5AlZE2XAyqc7iF8DrwVsfOp+HReq8WXU0as=;
 b=hAab3LuXRHzcwxbI2Hapymcl61/KL7mXRzicCme39ldFuu10oNDAXH/n
 T8eh70GEYqB3oB/Ded2p9Zcg6d3JFioulvkZTGqisvVKejEh9/8wZYaZK
 ViMjYFTl5VMaMscA1v1f00JUqdTHcqvYNDzTn2/9Zcd9u+In2Oozjz/mP
 FyaalMg5VOm9wI68ulUUb/pBwhY7Xc5n0LSeU+2iqcLX4f7cAL+SPr/z4
 ZOAR+6nWRf3Bfz1ZIQ7K6RwnTkupiUkd2dJlaibdONJLz5ThdXinkNAYO
 mKCn0o1oT6XOf9HnFG66QSePUx7McjSHw2Qu5SVtMJaw/YJAEuVjbjoqa Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="233794763"
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="233794763"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 14:37:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="609745283"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2022 14:37:37 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 1/4] drm/i915/guc: Limit scheduling properties to avoid
 overflow
Date: Thu,  3 Mar 2022 14:37:34 -0800
Message-Id: <20220303223737.708659-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303223737.708659-1-John.C.Harrison@Intel.com>
References: <20220303223737.708659-1-John.C.Harrison@Intel.com>
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

v2: Add helper functins for clamping (review feedback from Tvrtko).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> (v1)
---
 drivers/gpu/drm/i915/gt/intel_engine.h      |  6 ++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 69 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/sysfs_engines.c     | 25 +++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++
 4 files changed, 99 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 1c0ab05c3c40..d7044c4e526e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -351,4 +351,10 @@ intel_engine_get_hung_context(struct intel_engine_cs *engine)
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
index 7447411a5b26..22e70e4e007c 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -442,6 +442,26 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
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
@@ -464,6 +484,55 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
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
+		value = min_t(u64, value, GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
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
+		value = min_t(u64, value, GUC_POLICY_MAX_EXEC_QUANTUM_MS);
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
index 967031056202..f2d9858d827c 100644
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
index 4b300b6cc0f9..a2d574f2fdd5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -262,6 +262,15 @@ struct guc_lrc_desc {
 
 #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
 
+/*
+ * GuC converts the timeout to clock ticks internally. Different platforms have
+ * different GuC clocks. Thus, the maximum value before overflow is platform
+ * dependent. Current worst case scenario is about 110s. So, limit to 100s to be
+ * safe.
+ */
+#define GUC_POLICY_MAX_EXEC_QUANTUM_MS		(100 * 1000)
+#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS	(100 * 1000)
+
 struct guc_policies {
 	u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
 	/* In micro seconds. How much time to allow before DPC processing is
-- 
2.25.1

