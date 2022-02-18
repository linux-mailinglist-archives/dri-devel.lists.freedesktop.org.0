Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6914BC228
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 22:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8613310EA54;
	Fri, 18 Feb 2022 21:33:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B50910EA53;
 Fri, 18 Feb 2022 21:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645219988; x=1676755988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NoZlZ9ZEe+pAsQl/jbPO0eGAzLR3mb2aSlY4gjgTjtw=;
 b=hHOqvFWb2MvhK0FI6Ix54DsQZRb8lmdm8herqvbl+nmJBBKkHghchf4f
 iB/GvFNEKtLWnH+rMERl10OOJ2ivc/OKwyoBxgvTiUV2JSeLVtThB4Me8
 ktqYLUIr+CzB3KyLx7QR0sM/EObrF2LZ0U866xEfL4VdC73G/0HR4+p3L
 ZJn/ne1kgXVvEfUrvkB9qYrQ257qizpncwnQxS0T/96MyAkFaOiN5hnFL
 p8bP4cqzHiU9Jg8Xxw2xzvGao/L8I/ckGkpKVhTvO0ChD0xPBhxJzXMhU
 Gpyq9zlmMYk/V4OJDbk9VJk08LGGMj9993h+1eXJ5z/uuU1yxt5nmkS+X w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238638709"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238638709"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 13:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="546499005"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 18 Feb 2022 13:33:07 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/3] drm/i915/guc: Limit scheduling properties to avoid
 overflow
Date: Fri, 18 Feb 2022 13:33:05 -0800
Message-Id: <20220218213307.1338478-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

GuC converts the pre-emption timeout and timeslice quantum values into
clock ticks internally. That significantly reduces the point of 32bit
overflow. On current platforms, worst case scenario is approximately
110 seconds. Rather than allowing the user to set higher values and
then get confused by early timeouts, add limits when setting these
values.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 +++++++++++++++
 drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 ++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index e53008b4dd05..2a1e9f36e6f5 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -389,6 +389,21 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
 		engine->props.preempt_timeout_ms = 0;
 
+	/* Cap timeouts to prevent overflow inside GuC */
+	if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
+		if (engine->props.timeslice_duration_ms > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
+			drm_info(&engine->i915->drm, "Warning, clamping timeslice duration to %d to prevent possibly overflow\n",
+				 GUC_POLICY_MAX_EXEC_QUANTUM_MS);
+			engine->props.timeslice_duration_ms = GUC_POLICY_MAX_EXEC_QUANTUM_MS;
+		}
+
+		if (engine->props.preempt_timeout_ms > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
+			drm_info(&engine->i915->drm, "Warning, clamping pre-emption timeout to %d to prevent possibly overflow\n",
+				 GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
+			engine->props.preempt_timeout_ms = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
+		}
+	}
+
 	engine->defaults = engine->props; /* never to change again */
 
 	engine->context_size = intel_engine_context_size(gt, engine->class);
diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index 967031056202..f57efe026474 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -221,6 +221,13 @@ timeslice_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
 		return -EINVAL;
 
+	if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
+	    duration > GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
+		duration = GUC_POLICY_MAX_EXEC_QUANTUM_MS;
+		drm_info(&engine->i915->drm, "Warning, clamping timeslice duration to %lld to prevent possibly overflow\n",
+			 duration);
+	}
+
 	WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
 
 	if (execlists_active(&engine->execlists))
@@ -325,6 +332,13 @@ preempt_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
 		return -EINVAL;
 
+	if (intel_uc_uses_guc_submission(&engine->gt->uc) &&
+	    timeout > GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS) {
+		timeout = GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS;
+		drm_info(&engine->i915->drm, "Warning, clamping pre-emption timeout to %lld to prevent possibly overflow\n",
+			 timeout);
+	}
+
 	WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
 
 	if (READ_ONCE(engine->execlists.pending[0]))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 6a4612a852e2..ad131092f8df 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -248,6 +248,15 @@ struct guc_lrc_desc {
 
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

