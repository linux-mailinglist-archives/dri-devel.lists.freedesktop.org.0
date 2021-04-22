Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B115368302
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 17:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0561D6EAB5;
	Thu, 22 Apr 2021 15:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DC36E231;
 Thu, 22 Apr 2021 15:08:11 +0000 (UTC)
IronPort-SDR: b7fZj2grKEdmD5RFy+4mkjnUOjl8j8I1FVMdmK8Axw2rqjbSIqGyA51+XM8EDh0QpVj4kpoa8c
 zrLbpYmwL/Cg==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="281232062"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="281232062"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 08:08:09 -0700
IronPort-SDR: T/5+o0zVrtodvOGZroRZynMfMIOSBWyyAoFusk/D64jsr+CYM83otQCr+NAIp/u/rgOvLJ1e0V
 psP154V3yjvg==
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="455823517"
Received: from parymurx-mobl2.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.213.129.132])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 08:08:04 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Make preempt timeout for banned contexts
 configurable
Date: Thu, 22 Apr 2021 16:07:42 +0100
Message-Id: <20210422150742.514319-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Zhen Han <zhen.han@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

When we ban a context, for instance when userspace marked itself as non-
persistent and has exited, we apply a 1ms grace period after which any
belonging workload still on the GPU (did not preempt) will be forcibly
terminated (using engine reset).

For some workloads period between preemptible points can be longer than
this default which results in preempt timeout reset messages, even though
the process would actually gracefully exit if given enough time.

Coupled with the fact that error messages during normal operation, even if
harmless, can be frowned upon, we are left with two options. We could
either increase the timeout for everyone, or we could allow it to be
configured.

Given how rapid response to banned contexts (which can be for many reasons
including deliberate denial of service attempts) is preferrable this patch
opts for the latter.

The default timeout is left at 1ms but can now be configured either at
kernel build time via CONFIG_DRM_I915_BANNED_CONTEXT_TIMEOUT, or at
runtime using engine sysfs controls, with the added one being named
banned_context_timeout_ms.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Zhen Han <zhen.han@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.profile          | 13 +++++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  3 ++
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 +
 .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c       | 54 +++++++++++++++++++
 5 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
index 39328567c200..0be56c7084ff 100644
--- a/drivers/gpu/drm/i915/Kconfig.profile
+++ b/drivers/gpu/drm/i915/Kconfig.profile
@@ -119,3 +119,16 @@ config DRM_I915_TIMESLICE_DURATION
 	  /sys/class/drm/card?/engine/*/timeslice_duration_ms
 
 	  May be 0 to disable timeslicing.
+
+config DRM_I915_BANNED_CONTEXT_TIMEOUT
+	int "Banned context timeout (ms)"
+	default 1 # milliseconds
+	help
+	  How long to wait (in milliseconds) for a banned context to cleanly
+	  terminate their workloads. If the context does not yield inside the
+	  configured time it will be forcibly reset.
+
+	  This is adjustable via
+	  /sys/class/drm/card?/engine/*/banned_context_timeout_ms
+
+	  If configured to zero a 1ms minimum will still apply.
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 6dbdbde00f14..80b973367db8 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -306,6 +306,8 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 		CONFIG_DRM_I915_STOP_TIMEOUT;
 	engine->props.timeslice_duration_ms =
 		CONFIG_DRM_I915_TIMESLICE_DURATION;
+	engine->props.banned_context_timeout_ms =
+		min(1, CONFIG_DRM_I915_BANNED_CONTEXT_TIMEOUT);
 
 	/* Override to uninterruptible for OpenCL workloads. */
 	if (INTEL_GEN(i915) == 12 && engine->class == RENDER_CLASS)
@@ -1623,6 +1625,7 @@ static void print_properties(struct intel_engine_cs *engine,
 		P(preempt_timeout_ms),
 		P(stop_timeout_ms),
 		P(timeslice_duration_ms),
+		P(banned_context_timeout_ms),
 
 		{},
 #undef P
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 883bafc44902..ec4f16b0308a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -549,6 +549,7 @@ struct intel_engine_cs {
 		unsigned long preempt_timeout_ms;
 		unsigned long stop_timeout_ms;
 		unsigned long timeslice_duration_ms;
+		unsigned long banned_context_timeout_ms;
 	} props, defaults;
 
 	I915_SELFTEST_DECLARE(struct fault_attr reset_timeout);
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index de124870af44..e2c4e4230979 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1209,7 +1209,7 @@ static unsigned long active_preempt_timeout(struct intel_engine_cs *engine,
 
 	/* Force a fast reset for terminated contexts (ignoring sysfs!) */
 	if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq)))
-		return 1;
+		return engine->props.banned_context_timeout_ms;
 
 	return READ_ONCE(engine->props.preempt_timeout_ms);
 }
diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index 967031056202..cce9ab8a3309 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -411,6 +411,52 @@ heartbeat_default(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 static struct kobj_attribute heartbeat_interval_def =
 __ATTR(heartbeat_interval_ms, 0444, heartbeat_default, NULL);
 
+static ssize_t
+banned_context_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct intel_engine_cs *engine = kobj_to_engine(kobj);
+	unsigned long long timeout;
+	int err;
+
+	err = kstrtoull(buf, 0, &timeout);
+	if (err)
+		return err;
+
+	if (timeout < 1 || timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
+		return -EINVAL;
+
+	WRITE_ONCE(engine->props.banned_context_timeout_ms, timeout);
+
+	return count;
+}
+
+static ssize_t
+banned_context_timeout_show(struct kobject *kobj, struct kobj_attribute *attr,
+		     char *buf)
+{
+	struct intel_engine_cs *engine = kobj_to_engine(kobj);
+
+	return sprintf(buf, "%lu\n", engine->props.banned_context_timeout_ms);
+}
+
+static struct kobj_attribute banned_context_timeout_attr =
+__ATTR(banned_context_timeout_ms, 0644, banned_context_timeout_show,
+       banned_context_timeout_store);
+
+static ssize_t
+banned_context_timeout_default(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buf)
+{
+	struct intel_engine_cs *engine = kobj_to_engine(kobj);
+
+	return sprintf(buf, "%lu\n",
+		       engine->defaults.banned_context_timeout_ms);
+}
+
+static struct kobj_attribute banned_context_timeout_def =
+__ATTR(banned_context_timeout_ms, 0444, banned_context_timeout_default, NULL);
+
 static void kobj_engine_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -476,6 +522,10 @@ static void add_defaults(struct kobj_engine *parent)
 	if (intel_engine_has_preempt_reset(ke->engine) &&
 	    sysfs_create_file(&ke->base, &preempt_timeout_def.attr))
 		return;
+
+	if (intel_engine_has_preempt_reset(ke->engine) &&
+	    sysfs_create_file(&ke->base, &banned_context_timeout_def.attr))
+		return;
 }
 
 void intel_engines_add_sysfs(struct drm_i915_private *i915)
@@ -521,6 +571,10 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 		    sysfs_create_file(kobj, &preempt_timeout_attr.attr))
 			goto err_engine;
 
+		if (intel_engine_has_preempt_reset(engine) &&
+		    sysfs_create_file(kobj, &banned_context_timeout_attr.attr))
+			goto err_engine;
+
 		add_defaults(container_of(kobj, struct kobj_engine, base));
 
 		if (0) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
