Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C502F402DA8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507216E0AF;
	Tue,  7 Sep 2021 17:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DA56E088;
 Tue,  7 Sep 2021 17:19:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220322736"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="220322736"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="605352260"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Prasad Nallani <prasad.nallani@intel.com>
Subject: [PATCH 6/8] drm/i915/xehp: Define context scheduling attributes in
 lrc descriptor
Date: Tue,  7 Sep 2021 10:19:14 -0700
Message-Id: <20210907171916.2548047-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210907171916.2548047-1-matthew.d.roper@intel.com>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In Dual Context mode the EUs are shared between render and compute
command streamers. The hardware provides a field in the lrc descriptor
to indicate the prioritization of the thread dispatch associated to the
corresponding context.

The context priority is set to 'low' at creation time and relies on the
existing context priority to set it to low/normal/high.

HSDES: 1604462009
Bspec: 46145, 46260
Original-patch-by: Michel Thierry
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Prasad Nallani <prasad.nallani@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c            |  4 +++-
 drivers/gpu/drm/i915/gt/intel_engine_types.h         |  1 +
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c |  6 +++++-
 drivers/gpu/drm/i915/gt/intel_lrc.h                  | 10 ++++++++++
 drivers/gpu/drm/i915/i915_reg.h                      |  4 ++++
 5 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index b346b946602d..2f719f0ecac3 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -382,8 +382,10 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 		engine->props.preempt_timeout_ms = 0;
 
 	/* features common between engines sharing EUs */
-	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS)
+	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS) {
 		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
+		engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
+	}
 
 	engine->defaults = engine->props; /* never to change again */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 30a0c69c36c8..00bf0296b28a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -455,6 +455,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_REQUIRES_CMD_PARSER BIT(7)
 #define I915_ENGINE_WANT_FORCED_PREEMPTION BIT(8)
 #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
+#define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
 	unsigned int flags;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 4c600c46414d..2b36ec7f3a04 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -662,9 +662,13 @@ static inline void execlists_schedule_out(struct i915_request *rq)
 static u64 execlists_update_context(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
-	u64 desc = ce->lrc.desc;
+	u64 desc;
 	u32 tail, prev;
 
+	desc = ce->lrc.desc;
+	if (rq->engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
+		desc |= lrc_desc_priority(rq_prio(rq));
+
 	/*
 	 * WaIdleLiteRestore:bdw,skl
 	 *
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h b/drivers/gpu/drm/i915/gt/intel_lrc.h
index 7f697845c4cf..d3f2096b3d51 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.h
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
@@ -79,4 +79,14 @@ static inline u32 lrc_get_runtime(const struct intel_context *ce)
 	return READ_ONCE(ce->lrc_reg_state[CTX_TIMESTAMP]);
 }
 
+static inline u32 lrc_desc_priority(int prio)
+{
+	if (prio > I915_PRIORITY_NORMAL)
+		return GEN12_CTX_PRIORITY_HIGH;
+	else if (prio < I915_PRIORITY_NORMAL)
+		return GEN12_CTX_PRIORITY_LOW;
+	else
+		return GEN12_CTX_PRIORITY_NORMAL;
+}
+
 #endif /* __INTEL_LRC_H__ */
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 0bb185ce9529..5b68c02c35af 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -4212,6 +4212,10 @@ enum {
 #define GEN8_CTX_L3LLC_COHERENT (1 << 5)
 #define GEN8_CTX_PRIVILEGE (1 << 8)
 #define GEN8_CTX_ADDRESSING_MODE_SHIFT 3
+#define GEN12_CTX_PRIORITY_MASK REG_GENMASK(10, 9)
+#define GEN12_CTX_PRIORITY_HIGH REG_FIELD_PREP(GEN12_CTX_PRIORITY_MASK, 2)
+#define GEN12_CTX_PRIORITY_NORMAL REG_FIELD_PREP(GEN12_CTX_PRIORITY_MASK, 1)
+#define GEN12_CTX_PRIORITY_LOW REG_FIELD_PREP(GEN12_CTX_PRIORITY_MASK, 0)
 
 #define GEN8_CTX_ID_SHIFT 32
 #define GEN8_CTX_ID_WIDTH 21
-- 
2.25.4

