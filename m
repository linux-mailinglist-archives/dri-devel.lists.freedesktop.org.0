Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A1B36E7BE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 11:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266F26EDCF;
	Thu, 29 Apr 2021 09:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCB56E1F7;
 Thu, 29 Apr 2021 09:13:09 +0000 (UTC)
IronPort-SDR: RNO0E70EXb+WGg0WnlRP/8BN95vGWLgjtbOhxHslNizzLvjDbX9lePkGHXDKV+wpFHbmn555x/
 vqDi3TF0d8TA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="197011313"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="197011313"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:08 -0700
IronPort-SDR: ItxURtprWcBJYL9iAPCax8Jh86ScTwTG+knmoJHvLSjnNenmLk5RTAcxGjvrDasbLPntdafIsI
 L8xjZ+t5iXpA==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="537298821"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.64])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:13:07 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/i915: Add more checks when building workaround lists
Date: Thu, 29 Apr 2021 10:12:54 +0100
Message-Id: <20210429091254.855248-7-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
References: <20210429091254.855248-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Andres Calderon Jaramillo <andrescj@google.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In current code we check that a workaround is not completely
overwriting the existing one, but for instance partial conflict in some
bits would get missed, as would problems involving masked registers,
courtesy of the mask (wa->clr) being forced to zero for such registers and
also being conflated with the readback verification.

Now that previous patches have separated write masks from readback masks,
and ensured all masked registers are correctly tagged as such, we can
improve the verification checks to also detect partial conflicts, wrong
masks and inconsistent register usage.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reported-by: Andres Calderon Jaramillo <andrescj@google.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 81 +++++++++++++++----
 .../gpu/drm/i915/gt/intel_workarounds_types.h |  4 +
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  4 +-
 3 files changed, 72 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index cd84c2a86787..c82f165bdd8b 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -52,8 +52,11 @@
  * - Public functions to init or apply the given workaround type.
  */
 
-static void wa_init_start(struct i915_wa_list *wal, const char *name, const char *engine_name)
+static void
+wa_init_start(struct drm_i915_private *i915, struct i915_wa_list *wal,
+	      const char *name, const char *engine_name)
 {
+	wal->i915 = i915;
 	wal->name = name;
 	wal->engine_name = engine_name;
 }
@@ -81,6 +84,59 @@ static void wa_init_finish(struct i915_wa_list *wal)
 			 wal->wa_count, wal->name, wal->engine_name);
 }
 
+static void
+log_bad_wa(const struct i915_wa_list *wal, const struct i915_wa *wa,
+	   const char *msg)
+{
+	drm_err(&wal->i915->drm,
+		"Discarding %s workaround! (reg=%x %s=%x set=%x)\n",
+		msg, i915_mmio_reg_offset(wa->reg), wa->clr ? "clear" : "mask",
+		wa->clr ?: wa->set >> 16, wa->set);
+}
+
+static bool
+check_conflict(const struct i915_wa_list *wal,
+	       const struct i915_wa *old,
+	       const struct i915_wa *new)
+{
+	u32 new_mask, old_mask, common, new_set, old_set;
+
+	if (new->clr && !old->clr) {
+		log_bad_wa(wal, new, "mixed masked and regular");
+		return true;
+	}
+
+	if (new->clr) {
+		new_mask = new->clr;
+		old_mask = old->clr;
+		new_set = new->set;
+		old_set = old->set;
+	} else {
+		new_mask = new->set >> 16;
+		old_mask = old->set >> 16;
+		new_set = new->set & 0xffff;
+		old_set = old->set & 0xffff;
+	}
+
+	if (new_set && (new_set & ~new_mask)) {
+		log_bad_wa(wal, new, "write outside the mask");
+		return true;
+	}
+
+	common = new_mask & old_mask;
+	if (common) {
+		if ((new_set & common) != (old_set & common)) {
+			log_bad_wa(wal, new, "conflicting");
+			return true;
+		} else if (new_mask == old_mask) {
+			log_bad_wa(wal, new, "duplicate");
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 {
 	unsigned int addr = i915_mmio_reg_offset(wa->reg);
@@ -118,18 +174,13 @@ static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 		} else {
 			wa_ = &wal->list[mid];
 
-			if ((wa->clr | wa_->clr) && !(wa->clr & ~wa_->clr)) {
-				DRM_ERROR("Discarding overwritten w/a for reg %04x (clear: %08x, set: %08x)\n",
-					  i915_mmio_reg_offset(wa_->reg),
-					  wa_->clr, wa_->set);
-
-				wa_->set &= ~wa->clr;
+			if (!check_conflict(wal, wa_, wa)) {
+				wal->wa_count++;
+				wa_->set |= wa->set;
+				wa_->clr |= wa->clr;
+				wa_->read |= wa->read;
 			}
 
-			wal->wa_count++;
-			wa_->set |= wa->set;
-			wa_->clr |= wa->clr;
-			wa_->read |= wa->read;
 			return;
 		}
 	}
@@ -716,7 +767,7 @@ __intel_engine_init_ctx_wa(struct intel_engine_cs *engine,
 	if (engine->class != RENDER_CLASS)
 		return;
 
-	wa_init_start(wal, name, engine->name);
+	wa_init_start(engine->i915, wal, name, engine->name);
 
 	if (IS_DG1(i915))
 		dg1_ctx_workarounds_init(engine, wal);
@@ -1232,7 +1283,7 @@ void intel_gt_init_workarounds(struct drm_i915_private *i915)
 {
 	struct i915_wa_list *wal = &i915->gt_wa_list;
 
-	wa_init_start(wal, "GT", "global");
+	wa_init_start(i915, wal, "GT", "global");
 	gt_init_workarounds(i915, wal);
 	wa_init_finish(wal);
 }
@@ -1575,7 +1626,7 @@ void intel_engine_init_whitelist(struct intel_engine_cs *engine)
 	struct drm_i915_private *i915 = engine->i915;
 	struct i915_wa_list *w = &engine->whitelist;
 
-	wa_init_start(w, "whitelist", engine->name);
+	wa_init_start(engine->i915, w, "whitelist", engine->name);
 
 	if (IS_DG1(i915))
 		dg1_whitelist_build(engine);
@@ -2095,7 +2146,7 @@ void intel_engine_init_workarounds(struct intel_engine_cs *engine)
 	if (INTEL_GEN(engine->i915) < 4)
 		return;
 
-	wa_init_start(wal, "engine", engine->name);
+	wa_init_start(engine->i915, wal, "engine", engine->name);
 	engine_init_workarounds(engine, wal);
 	wa_init_finish(wal);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
index c214111ea367..b6a9d1582a5c 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
@@ -10,6 +10,8 @@
 
 #include "i915_reg.h"
 
+struct drm_i915_private;
+
 struct i915_wa {
 	i915_reg_t	reg;
 	u32		clr;
@@ -18,6 +20,8 @@ struct i915_wa {
 };
 
 struct i915_wa_list {
+	struct drm_i915_private *i915;
+
 	const char	*name;
 	const char	*engine_name;
 	struct i915_wa	*list;
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 64937ec3f2dc..536cbe7889cc 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -64,14 +64,14 @@ reference_lists_init(struct intel_gt *gt, struct wa_lists *lists)
 
 	memset(lists, 0, sizeof(*lists));
 
-	wa_init_start(&lists->gt_wa_list, "GT_REF", "global");
+	wa_init_start(gt->i915, &lists->gt_wa_list, "GT_REF", "global");
 	gt_init_workarounds(gt->i915, &lists->gt_wa_list);
 	wa_init_finish(&lists->gt_wa_list);
 
 	for_each_engine(engine, gt, id) {
 		struct i915_wa_list *wal = &lists->engine[id].wa_list;
 
-		wa_init_start(wal, "REF", engine->name);
+		wa_init_start(gt->i915, wal, "REF", engine->name);
 		engine_init_workarounds(engine, wal);
 		wa_init_finish(wal);
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
