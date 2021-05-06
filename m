Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E966F375B37
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D55A6EE0D;
	Thu,  6 May 2021 18:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8838E6ED8D;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: o2MS4VYna6ScKydkQVWbV90M/nwdkPB4mnD9DhJVwVql4FpeXLa3HH+oDPVzRW8Os2SKkpQwmj
 S2q7O+B8wq2Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531032"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531032"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: h+sjo82DpRfEljVcI4kfSdW9v5kztlIo9QSiWgkjm5BU/ILKticYJe3g0KeQjpccdk/As8rOnT
 m7zXCK+K5t6Q==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583612"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 79/97] drm/i915/guc: Don't call ring_is_idle in GuC
 submission
Date: Thu,  6 May 2021 12:14:33 -0700
Message-Id: <20210506191451.77768-80-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The engine registers really shouldn't be touched during GuC submission
as the GuC owns the registers. Don't call ring_is_idle and tie
intel_engine_is_idle strickly the engine pm.

Because intel_engine_is_idle tied to the engine pm, retire requests
before checking intel_engines_are_idle in gt_drop_caches, and lastly
increase the timeout in gt_drop_caches for the intel_engines_are_idle
check.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 13 +++++++++++++
 drivers/gpu/drm/i915/i915_debugfs.c       |  6 +++---
 drivers/gpu/drm/i915/i915_drv.h           |  2 +-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index e34a61600c8c..591226b96201 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1226,6 +1226,9 @@ static bool ring_is_idle(struct intel_engine_cs *engine)
 {
 	bool idle = true;
 
+	/* GuC submission shouldn't access HEAD & TAIL via MMIO */
+	GEM_BUG_ON(intel_engine_uses_guc(engine));
+
 	if (I915_SELFTEST_ONLY(!engine->mmio_base))
 		return true;
 
@@ -1292,6 +1295,16 @@ bool intel_engine_is_idle(struct intel_engine_cs *engine)
 	if (!i915_sched_engine_is_empty(engine->sched_engine))
 		return false;
 
+	/*
+	 * We shouldn't touch engine registers with GuC submission as the GuC
+	 * owns the registers. Let's tie the idle to engine pm, at worst this
+	 * function sometimes will falsely report non-idle when idle during the
+	 * delay to retire requests or with virtual engines and a request
+	 * running on another instance within the same class / submit mask.
+	 */
+	if (intel_engine_uses_guc(engine))
+		return false;
+
 	/* Ring stopped? */
 	return ring_is_idle(engine);
 }
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index d540dd8029d0..2639961504b5 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -867,13 +867,13 @@ gt_drop_caches(struct intel_gt *gt, u64 val)
 {
 	int ret;
 
+	if (val & DROP_RETIRE || val & DROP_RESET_ACTIVE)
+		intel_gt_retire_requests(gt);
+
 	if (val & DROP_RESET_ACTIVE &&
 	    wait_for(intel_engines_are_idle(gt), I915_IDLE_ENGINES_TIMEOUT))
 		intel_gt_set_wedged(gt);
 
-	if (val & DROP_RETIRE)
-		intel_gt_retire_requests(gt);
-
 	if (val & (DROP_IDLE | DROP_ACTIVE)) {
 		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
 		if (ret)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 3cfa6effbb5f..aa359b8480cd 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -576,7 +576,7 @@ struct i915_gem_mm {
 	u32 shrink_count;
 };
 
-#define I915_IDLE_ENGINES_TIMEOUT (200) /* in ms */
+#define I915_IDLE_ENGINES_TIMEOUT (500) /* in ms */
 
 unsigned long i915_fence_context_timeout(const struct drm_i915_private *i915,
 					 u64 context);
-- 
2.28.0

