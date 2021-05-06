Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F88D375AF3
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98726ECFB;
	Thu,  6 May 2021 18:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD05E6ED1E;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: aZStrq31sG0J8ds6Qp7UeccP0IFMZbw/mGNNHlpIiyu/ETbZCb5+jgbfJY44Pn01vUR7gdieEw
 IGGRgDC49fNw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195454"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195454"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: DYjkfVw2QW13AAoqpdUywCNQ/QmlhPN8E7PRkd6JnqpACc7KXuwJsxLQgYQRvL5lu89jiAvf4B
 P6qH2NZLORuA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583543"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 59/97] drm/i915/guc: GuC virtual engines
Date: Thu,  6 May 2021 12:14:13 -0700
Message-Id: <20210506191451.77768-60-matthew.brost@intel.com>
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

Implement GuC virtual engines. Rather simple implementation, basically
just allocate an engine, setup context enter / exit function to virtual
engine specific functions, set all other variables / functions to guc
versions, and set the engine mask to that of all the siblings.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  19 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |   1 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |  10 +
 drivers/gpu/drm/i915/gt/intel_engine.h        |  45 +++-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  14 +
 .../drm/i915/gt/intel_execlists_submission.c  | 186 +++++++------
 .../drm/i915/gt/intel_execlists_submission.h  |  11 -
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  20 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 253 +++++++++++++++++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   2 +
 10 files changed, 429 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index d30260ffe2a7..e6bc5c666f93 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -72,7 +72,6 @@
 #include "gt/intel_context_param.h"
 #include "gt/intel_engine_heartbeat.h"
 #include "gt/intel_engine_user.h"
-#include "gt/intel_execlists_submission.h" /* virtual_engine */
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_ring.h"
 
@@ -1569,9 +1568,6 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
 	if (!HAS_EXECLISTS(i915))
 		return -ENODEV;
 
-	if (intel_uc_uses_guc_submission(&i915->gt.uc))
-		return -ENODEV; /* not implement yet */
-
 	if (get_user(idx, &ext->engine_index))
 		return -EFAULT;
 
@@ -1628,7 +1624,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
 		}
 	}
 
-	ce = intel_execlists_create_virtual(siblings, n);
+	ce = intel_engine_create_virtual(siblings, n);
 	if (IS_ERR(ce)) {
 		err = PTR_ERR(ce);
 		goto out_siblings;
@@ -1724,13 +1720,9 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
 		 * A non-virtual engine has no siblings to choose between; and
 		 * a submit fence will always be directed to the one engine.
 		 */
-		if (intel_engine_is_virtual(virtual)) {
-			err = intel_virtual_engine_attach_bond(virtual,
-							       master,
-							       bond);
-			if (err)
-				return err;
-		}
+		err = intel_engine_attach_bond(virtual, master, bond);
+		if (err)
+			return err;
 	}
 
 	return 0;
@@ -2117,8 +2109,7 @@ static int clone_engines(struct i915_gem_context *dst,
 		 * the virtual engine instead.
 		 */
 		if (intel_engine_is_virtual(engine))
-			clone->engines[n] =
-				intel_execlists_clone_virtual(engine);
+			clone->engines[n] = intel_engine_clone_virtual(engine);
 		else
 			clone->engines[n] = intel_context_create(engine);
 		if (IS_ERR_OR_NULL(clone->engines[n])) {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index b5c908f3f4f2..ba772762f7b9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -10,6 +10,7 @@
 #include "i915_gem_context_types.h"
 
 #include "gt/intel_context.h"
+#include "gt/intel_engine.h"
 
 #include "i915_drv.h"
 #include "i915_gem.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index e7af6a2368f8..6945963a31ba 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -47,6 +47,16 @@ struct intel_context_ops {
 
 	void (*reset)(struct intel_context *ce);
 	void (*destroy)(struct kref *kref);
+
+	/* virtual engine/context interface */
+	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
+						unsigned int count);
+	struct intel_context *(*clone_virtual)(struct intel_engine_cs *engine);
+	struct intel_engine_cs *(*get_sibling)(struct intel_engine_cs *engine,
+					       unsigned int sibling);
+	int (*attach_bond)(struct intel_engine_cs *engine,
+			   const struct intel_engine_cs *master,
+			   const struct intel_engine_cs *sibling);
 };
 
 struct intel_context {
diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 988d9688ae4d..3cd09381b6f8 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -261,13 +261,56 @@ intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
 	return intel_engine_has_preemption(engine);
 }
 
+struct intel_context *
+intel_engine_create_virtual(struct intel_engine_cs **siblings,
+			    unsigned int count);
+
+static inline bool
+intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
+{
+	if (intel_engine_uses_guc(engine))
+		return intel_guc_virtual_engine_has_heartbeat(engine);
+	else
+		GEM_BUG_ON("Only should be called in GuC submission");
+
+	return false;
+}
+
 static inline bool
 intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
 {
 	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
 		return false;
 
-	return READ_ONCE(engine->props.heartbeat_interval_ms);
+	if (intel_engine_is_virtual(engine))
+		return intel_virtual_engine_has_heartbeat(engine);
+	else
+		return READ_ONCE(engine->props.heartbeat_interval_ms);
+}
+
+static inline struct intel_context *
+intel_engine_clone_virtual(struct intel_engine_cs *src)
+{
+	GEM_BUG_ON(!intel_engine_is_virtual(src));
+	return src->cops->clone_virtual(src);
+}
+
+static inline int
+intel_engine_attach_bond(struct intel_engine_cs *engine,
+			 const struct intel_engine_cs *master,
+			 const struct intel_engine_cs *sibling)
+{
+	if (!engine->cops->attach_bond)
+		return 0;
+
+	return engine->cops->attach_bond(engine, master, sibling);
+}
+
+static inline struct intel_engine_cs *
+intel_engine_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
+{
+	GEM_BUG_ON(!intel_engine_is_virtual(engine));
+	return engine->cops->get_sibling(engine, sibling);
 }
 
 #endif /* _INTEL_RINGBUFFER_H_ */
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 7866ff0c2673..903f72f0953a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1792,6 +1792,20 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
 	return total;
 }
 
+struct intel_context *
+intel_engine_create_virtual(struct intel_engine_cs **siblings,
+			    unsigned int count)
+{
+	if (count == 0)
+		return ERR_PTR(-EINVAL);
+
+	if (count == 1)
+		return intel_context_create(siblings[0]);
+
+	GEM_BUG_ON(!siblings[0]->cops->create_virtual);
+	return siblings[0]->cops->create_virtual(siblings, count);
+}
+
 static bool match_ring(struct i915_request *rq)
 {
 	u32 ring = ENGINE_READ(rq->engine, RING_START);
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 0927a2416b52..ae12d7f19ecd 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -205,6 +205,9 @@ static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
 	return container_of(engine, struct virtual_engine, base);
 }
 
+static struct intel_context *
+execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
+
 static struct i915_request *
 __active_request(const struct intel_timeline * const tl,
 		 struct i915_request *rq,
@@ -2557,6 +2560,8 @@ static const struct intel_context_ops execlists_context_ops = {
 
 	.reset = lrc_reset,
 	.destroy = lrc_destroy,
+
+	.create_virtual = execlists_create_virtual,
 };
 
 static int emit_pdps(struct i915_request *rq)
@@ -3505,6 +3510,94 @@ static void virtual_context_exit(struct intel_context *ce)
 		intel_engine_pm_put(ve->siblings[n]);
 }
 
+static struct intel_engine_cs *
+virtual_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
+{
+	struct virtual_engine *ve = to_virtual_engine(engine);
+
+	if (sibling >= ve->num_siblings)
+		return NULL;
+
+	return ve->siblings[sibling];
+}
+
+static struct intel_context *
+virtual_clone(struct intel_engine_cs *src)
+{
+	struct virtual_engine *se = to_virtual_engine(src);
+	struct intel_context *dst;
+
+	dst = execlists_create_virtual(se->siblings, se->num_siblings);
+	if (IS_ERR(dst))
+		return dst;
+
+	if (se->num_bonds) {
+		struct virtual_engine *de = to_virtual_engine(dst->engine);
+
+		de->bonds = kmemdup(se->bonds,
+				    sizeof(*se->bonds) * se->num_bonds,
+				    GFP_KERNEL);
+		if (!de->bonds) {
+			intel_context_put(dst);
+			return ERR_PTR(-ENOMEM);
+		}
+
+		de->num_bonds = se->num_bonds;
+	}
+
+	return dst;
+}
+
+static struct ve_bond *
+virtual_find_bond(struct virtual_engine *ve,
+		  const struct intel_engine_cs *master)
+{
+	int i;
+
+	for (i = 0; i < ve->num_bonds; i++) {
+		if (ve->bonds[i].master == master)
+			return &ve->bonds[i];
+	}
+
+	return NULL;
+}
+
+static int virtual_attach_bond(struct intel_engine_cs *engine,
+			       const struct intel_engine_cs *master,
+			       const struct intel_engine_cs *sibling)
+{
+	struct virtual_engine *ve = to_virtual_engine(engine);
+	struct ve_bond *bond;
+	int n;
+
+	/* Sanity check the sibling is part of the virtual engine */
+	for (n = 0; n < ve->num_siblings; n++)
+		if (sibling == ve->siblings[n])
+			break;
+	if (n == ve->num_siblings)
+		return -EINVAL;
+
+	bond = virtual_find_bond(ve, master);
+	if (bond) {
+		bond->sibling_mask |= sibling->mask;
+		return 0;
+	}
+
+	bond = krealloc(ve->bonds,
+			sizeof(*bond) * (ve->num_bonds + 1),
+			GFP_KERNEL);
+	if (!bond)
+		return -ENOMEM;
+
+	bond[ve->num_bonds].master = master;
+	bond[ve->num_bonds].sibling_mask = sibling->mask;
+
+	ve->bonds = bond;
+	ve->num_bonds++;
+
+	return 0;
+}
+
 static const struct intel_context_ops virtual_context_ops = {
 	.flags = COPS_HAS_INFLIGHT,
 
@@ -3519,6 +3612,10 @@ static const struct intel_context_ops virtual_context_ops = {
 	.exit = virtual_context_exit,
 
 	.destroy = virtual_context_destroy,
+
+	.clone_virtual = virtual_clone,
+	.get_sibling = virtual_get_sibling,
+	.attach_bond = virtual_attach_bond,
 };
 
 static intel_engine_mask_t virtual_submission_mask(struct virtual_engine *ve)
@@ -3667,20 +3764,6 @@ static void virtual_submit_request(struct i915_request *rq)
 	spin_unlock_irqrestore(&ve->base.sched_engine->lock, flags);
 }
 
-static struct ve_bond *
-virtual_find_bond(struct virtual_engine *ve,
-		  const struct intel_engine_cs *master)
-{
-	int i;
-
-	for (i = 0; i < ve->num_bonds; i++) {
-		if (ve->bonds[i].master == master)
-			return &ve->bonds[i];
-	}
-
-	return NULL;
-}
-
 static void
 virtual_bond_execute(struct i915_request *rq, struct dma_fence *signal)
 {
@@ -3703,20 +3786,13 @@ virtual_bond_execute(struct i915_request *rq, struct dma_fence *signal)
 	to_request(signal)->execution_mask &= ~allowed;
 }
 
-struct intel_context *
-intel_execlists_create_virtual(struct intel_engine_cs **siblings,
-			       unsigned int count)
+static struct intel_context *
+execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 {
 	struct virtual_engine *ve;
 	unsigned int n;
 	int err;
 
-	if (count == 0)
-		return ERR_PTR(-EINVAL);
-
-	if (count == 1)
-		return intel_context_create(siblings[0]);
-
 	ve = kzalloc(struct_size(ve, siblings, count), GFP_KERNEL);
 	if (!ve)
 		return ERR_PTR(-ENOMEM);
@@ -3851,70 +3927,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 	return ERR_PTR(err);
 }
 
-struct intel_context *
-intel_execlists_clone_virtual(struct intel_engine_cs *src)
-{
-	struct virtual_engine *se = to_virtual_engine(src);
-	struct intel_context *dst;
-
-	dst = intel_execlists_create_virtual(se->siblings,
-					     se->num_siblings);
-	if (IS_ERR(dst))
-		return dst;
-
-	if (se->num_bonds) {
-		struct virtual_engine *de = to_virtual_engine(dst->engine);
-
-		de->bonds = kmemdup(se->bonds,
-				    sizeof(*se->bonds) * se->num_bonds,
-				    GFP_KERNEL);
-		if (!de->bonds) {
-			intel_context_put(dst);
-			return ERR_PTR(-ENOMEM);
-		}
-
-		de->num_bonds = se->num_bonds;
-	}
-
-	return dst;
-}
-
-int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
-				     const struct intel_engine_cs *master,
-				     const struct intel_engine_cs *sibling)
-{
-	struct virtual_engine *ve = to_virtual_engine(engine);
-	struct ve_bond *bond;
-	int n;
-
-	/* Sanity check the sibling is part of the virtual engine */
-	for (n = 0; n < ve->num_siblings; n++)
-		if (sibling == ve->siblings[n])
-			break;
-	if (n == ve->num_siblings)
-		return -EINVAL;
-
-	bond = virtual_find_bond(ve, master);
-	if (bond) {
-		bond->sibling_mask |= sibling->mask;
-		return 0;
-	}
-
-	bond = krealloc(ve->bonds,
-			sizeof(*bond) * (ve->num_bonds + 1),
-			GFP_KERNEL);
-	if (!bond)
-		return -ENOMEM;
-
-	bond[ve->num_bonds].master = master;
-	bond[ve->num_bonds].sibling_mask = sibling->mask;
-
-	ve->bonds = bond;
-	ve->num_bonds++;
-
-	return 0;
-}
-
 void intel_execlists_show_requests(struct intel_engine_cs *engine,
 				   struct drm_printer *m,
 				   void (*show_request)(struct drm_printer *m,
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
index 4ca9b475e252..74041b1994af 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
@@ -32,15 +32,4 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
 							int indent),
 				   unsigned int max);
 
-struct intel_context *
-intel_execlists_create_virtual(struct intel_engine_cs **siblings,
-			       unsigned int count);
-
-struct intel_context *
-intel_execlists_clone_virtual(struct intel_engine_cs *src);
-
-int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
-				     const struct intel_engine_cs *master,
-				     const struct intel_engine_cs *sibling);
-
 #endif /* __INTEL_EXECLISTS_SUBMISSION_H__ */
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index f349048ccbf6..77c411d8e5a0 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -3710,7 +3710,7 @@ static int nop_virtual_engine(struct intel_gt *gt,
 	GEM_BUG_ON(!nctx || nctx > ARRAY_SIZE(ve));
 
 	for (n = 0; n < nctx; n++) {
-		ve[n] = intel_execlists_create_virtual(siblings, nsibling);
+		ve[n] = intel_engine_create_virtual(siblings, nsibling);
 		if (IS_ERR(ve[n])) {
 			err = PTR_ERR(ve[n]);
 			nctx = n;
@@ -3906,7 +3906,7 @@ static int mask_virtual_engine(struct intel_gt *gt,
 	 * restrict it to our desired engine within the virtual engine.
 	 */
 
-	ve = intel_execlists_create_virtual(siblings, nsibling);
+	ve = intel_engine_create_virtual(siblings, nsibling);
 	if (IS_ERR(ve)) {
 		err = PTR_ERR(ve);
 		goto out_close;
@@ -4037,7 +4037,7 @@ static int slicein_virtual_engine(struct intel_gt *gt,
 		i915_request_add(rq);
 	}
 
-	ce = intel_execlists_create_virtual(siblings, nsibling);
+	ce = intel_engine_create_virtual(siblings, nsibling);
 	if (IS_ERR(ce)) {
 		err = PTR_ERR(ce);
 		goto out;
@@ -4089,7 +4089,7 @@ static int sliceout_virtual_engine(struct intel_gt *gt,
 
 	/* XXX We do not handle oversubscription and fairness with normal rq */
 	for (n = 0; n < nsibling; n++) {
-		ce = intel_execlists_create_virtual(siblings, nsibling);
+		ce = intel_engine_create_virtual(siblings, nsibling);
 		if (IS_ERR(ce)) {
 			err = PTR_ERR(ce);
 			goto out;
@@ -4191,7 +4191,7 @@ static int preserved_virtual_engine(struct intel_gt *gt,
 	if (err)
 		goto out_scratch;
 
-	ve = intel_execlists_create_virtual(siblings, nsibling);
+	ve = intel_engine_create_virtual(siblings, nsibling);
 	if (IS_ERR(ve)) {
 		err = PTR_ERR(ve);
 		goto out_scratch;
@@ -4414,16 +4414,16 @@ static int bond_virtual_engine(struct intel_gt *gt,
 		for (n = 0; n < nsibling; n++) {
 			struct intel_context *ve;
 
-			ve = intel_execlists_create_virtual(siblings, nsibling);
+			ve = intel_engine_create_virtual(siblings, nsibling);
 			if (IS_ERR(ve)) {
 				err = PTR_ERR(ve);
 				onstack_fence_fini(&fence);
 				goto out;
 			}
 
-			err = intel_virtual_engine_attach_bond(ve->engine,
-							       master,
-							       siblings[n]);
+			err = intel_engine_attach_bond(ve->engine,
+						       master,
+						       siblings[n]);
 			if (err) {
 				intel_context_put(ve);
 				onstack_fence_fini(&fence);
@@ -4559,7 +4559,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
 	if (igt_spinner_init(&spin, gt))
 		return -ENOMEM;
 
-	ve = intel_execlists_create_virtual(siblings, nsibling);
+	ve = intel_engine_create_virtual(siblings, nsibling);
 	if (IS_ERR(ve)) {
 		err = PTR_ERR(ve);
 		goto out_spin;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a789994d6de7..dc79d287c50a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -60,6 +60,15 @@
  *
  */
 
+/* GuC Virtual Engine */
+struct guc_virtual_engine {
+	struct intel_engine_cs base;
+	struct intel_context context;
+};
+
+static struct intel_context *
+guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
+
 #define GUC_REQUEST_SIZE 64 /* bytes */
 
 /*
@@ -931,20 +940,35 @@ static int guc_lrc_desc_pin(struct intel_context *ce)
 	return ret;
 }
 
-static int guc_context_pre_pin(struct intel_context *ce,
-			       struct i915_gem_ww_ctx *ww,
-			       void **vaddr)
+static int __guc_context_pre_pin(struct intel_context *ce,
+				 struct intel_engine_cs *engine,
+				 struct i915_gem_ww_ctx *ww,
+				 void **vaddr)
 {
-	return lrc_pre_pin(ce, ce->engine, ww, vaddr);
+	return lrc_pre_pin(ce, engine, ww, vaddr);
 }
 
-static int guc_context_pin(struct intel_context *ce, void *vaddr)
+static int __guc_context_pin(struct intel_context *ce,
+			     struct intel_engine_cs *engine,
+			     void *vaddr)
 {
 	if (i915_ggtt_offset(ce->state) !=
 	    (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK))
 		set_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
 
-	return lrc_pin(ce, ce->engine, vaddr);
+	return lrc_pin(ce, engine, vaddr);
+}
+
+static int guc_context_pre_pin(struct intel_context *ce,
+			       struct i915_gem_ww_ctx *ww,
+			       void **vaddr)
+{
+	return __guc_context_pre_pin(ce, ce->engine, ww, vaddr);
+}
+
+static int guc_context_pin(struct intel_context *ce, void *vaddr)
+{
+	return __guc_context_pin(ce, ce->engine, vaddr);
 }
 
 static void guc_context_unpin(struct intel_context *ce)
@@ -1044,6 +1068,21 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 	deregister_context(ce, ce->guc_id);
 }
 
+static void __guc_context_destroy(struct intel_context *ce)
+{
+	lrc_fini(ce);
+	intel_context_fini(ce);
+
+	if (intel_engine_is_virtual(ce->engine)) {
+		struct guc_virtual_engine *ve =
+			container_of(ce, typeof(*ve), context);
+
+		kfree(ve);
+	} else {
+		intel_context_free(ce);
+	}
+}
+
 static void guc_context_destroy(struct kref *kref)
 {
 	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
@@ -1060,7 +1099,7 @@ static void guc_context_destroy(struct kref *kref)
 	if (context_guc_id_invalid(ce) ||
 	    !lrc_desc_registered(guc, ce->guc_id)) {
 		release_guc_id(guc, ce);
-		lrc_destroy(kref);
+		__guc_context_destroy(ce);
 		return;
 	}
 
@@ -1076,7 +1115,7 @@ static void guc_context_destroy(struct kref *kref)
 	if (context_guc_id_invalid(ce)) {
 		__release_guc_id(guc, ce);
 		spin_unlock_irqrestore(&guc->contexts_lock, flags);
-		lrc_destroy(kref);
+		__guc_context_destroy(ce);
 		return;
 	}
 
@@ -1121,6 +1160,8 @@ static const struct intel_context_ops guc_context_ops = {
 
 	.reset = lrc_reset,
 	.destroy = guc_context_destroy,
+
+	.create_virtual = guc_create_virtual,
 };
 
 static void __guc_signal_context_fence(struct intel_context *ce)
@@ -1250,6 +1291,96 @@ static int guc_request_alloc(struct i915_request *rq)
 	return 0;
 }
 
+static struct intel_engine_cs *
+guc_virtual_get_sibling(struct intel_engine_cs *ve, unsigned int sibling)
+{
+	struct intel_engine_cs *engine;
+	intel_engine_mask_t tmp, mask = ve->mask;
+	unsigned int num_siblings = 0;
+
+	for_each_engine_masked(engine, ve->gt, mask, tmp)
+		if (num_siblings++ == sibling)
+			return engine;
+
+	return NULL;
+}
+
+static int guc_virtual_context_pre_pin(struct intel_context *ce,
+				       struct i915_gem_ww_ctx *ww,
+				       void **vaddr)
+{
+	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
+
+	return __guc_context_pre_pin(ce, engine, ww, vaddr);
+}
+
+static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
+{
+	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
+
+	return __guc_context_pin(ce, engine, vaddr);
+}
+
+static void guc_virtual_context_enter(struct intel_context *ce)
+{
+	intel_engine_mask_t tmp, mask = ce->engine->mask;
+	struct intel_engine_cs *engine;
+
+	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
+		intel_engine_pm_get(engine);
+
+	intel_timeline_enter(ce->timeline);
+}
+
+static void guc_virtual_context_exit(struct intel_context *ce)
+{
+	intel_engine_mask_t tmp, mask = ce->engine->mask;
+	struct intel_engine_cs *engine;
+
+	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
+		intel_engine_pm_put(engine);
+
+	intel_timeline_exit(ce->timeline);
+}
+
+static int guc_virtual_context_alloc(struct intel_context *ce)
+{
+	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
+
+	return lrc_alloc(ce, engine);
+}
+
+static struct intel_context *guc_clone_virtual(struct intel_engine_cs *src)
+{
+	struct intel_engine_cs *siblings[GUC_MAX_INSTANCES_PER_CLASS], *engine;
+	intel_engine_mask_t tmp, mask = src->mask;
+	unsigned int num_siblings = 0;
+
+	for_each_engine_masked(engine, src->gt, mask, tmp)
+		siblings[num_siblings++] = engine;
+
+	return guc_create_virtual(siblings, num_siblings);
+}
+
+static const struct intel_context_ops virtual_guc_context_ops = {
+	.alloc = guc_virtual_context_alloc,
+
+	.pre_pin = guc_virtual_context_pre_pin,
+	.pin = guc_virtual_context_pin,
+	.unpin = guc_context_unpin,
+	.post_unpin = guc_context_post_unpin,
+
+	.enter = guc_virtual_context_enter,
+	.exit = guc_virtual_context_exit,
+
+	.sched_disable = guc_context_sched_disable,
+
+	.destroy = guc_context_destroy,
+
+	.clone_virtual = guc_clone_virtual,
+	.get_sibling = guc_virtual_get_sibling,
+};
+
 static void sanitize_hwsp(struct intel_engine_cs *engine)
 {
 	struct intel_timeline *tl;
@@ -1564,7 +1695,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 	} else if (context_destroyed(ce)) {
 		/* Context has been destroyed */
 		release_guc_id(guc, ce);
-		lrc_destroy(&ce->ref);
+		__guc_context_destroy(ce);
 	}
 
 	decr_outstanding_submission_g2h(guc);
@@ -1676,3 +1807,107 @@ void intel_guc_log_context_info(struct intel_guc *guc,
 			   atomic_read(&ce->guc_sched_state_no_lock));
 	}
 }
+
+static struct intel_context *
+guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
+{
+	struct guc_virtual_engine *ve;
+	struct intel_guc *guc;
+	unsigned int n;
+	int err;
+
+	ve = kzalloc(sizeof(*ve), GFP_KERNEL);
+	if (!ve)
+		return ERR_PTR(-ENOMEM);
+
+	guc = &siblings[0]->gt->uc.guc;
+
+	ve->base.i915 = siblings[0]->i915;
+	ve->base.gt = siblings[0]->gt;
+	ve->base.uncore = siblings[0]->uncore;
+	ve->base.id = -1;
+
+	ve->base.uabi_class = I915_ENGINE_CLASS_INVALID;
+	ve->base.instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
+	ve->base.uabi_instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
+	ve->base.saturated = ALL_ENGINES;
+	ve->base.breadcrumbs = intel_breadcrumbs_create(&ve->base);
+	if (!ve->base.breadcrumbs) {
+		kfree(ve);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	snprintf(ve->base.name, sizeof(ve->base.name), "virtual");
+
+	ve->base.sched_engine = i915_sched_engine_get(guc->sched_engine);
+
+	ve->base.cops = &virtual_guc_context_ops;
+	ve->base.request_alloc = guc_request_alloc;
+
+	ve->base.submit_request = guc_submit_request;
+
+	ve->base.flags = I915_ENGINE_IS_VIRTUAL;
+
+	intel_context_init(&ve->context, &ve->base);
+
+	for (n = 0; n < count; n++) {
+		struct intel_engine_cs *sibling = siblings[n];
+
+		GEM_BUG_ON(!is_power_of_2(sibling->mask));
+		if (sibling->mask & ve->base.mask) {
+			DRM_DEBUG("duplicate %s entry in load balancer\n",
+				  sibling->name);
+			err = -EINVAL;
+			goto err_put;
+		}
+
+		ve->base.mask |= sibling->mask;
+
+		if (n != 0 && ve->base.class != sibling->class) {
+			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
+				  sibling->class, ve->base.class);
+			err = -EINVAL;
+			goto err_put;
+		} else if (n == 0) {
+			ve->base.class = sibling->class;
+			ve->base.uabi_class = sibling->uabi_class;
+			snprintf(ve->base.name, sizeof(ve->base.name),
+				 "v%dx%d", ve->base.class, count);
+			ve->base.context_size = sibling->context_size;
+
+			ve->base.emit_bb_start = sibling->emit_bb_start;
+			ve->base.emit_flush = sibling->emit_flush;
+			ve->base.emit_init_breadcrumb =
+				sibling->emit_init_breadcrumb;
+			ve->base.emit_fini_breadcrumb =
+				sibling->emit_fini_breadcrumb;
+			ve->base.emit_fini_breadcrumb_dw =
+				sibling->emit_fini_breadcrumb_dw;
+
+			ve->base.flags |= sibling->flags;
+
+			ve->base.props.timeslice_duration_ms =
+				sibling->props.timeslice_duration_ms;
+		}
+	}
+
+	return &ve->context;
+
+err_put:
+	intel_context_put(&ve->context);
+	return ERR_PTR(err);
+}
+
+
+
+bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
+{
+	struct intel_engine_cs *engine;
+	intel_engine_mask_t tmp, mask = ve->mask;
+
+	for_each_engine_masked(engine, ve->gt, mask, tmp)
+		if (READ_ONCE(engine->props.heartbeat_interval_ms))
+			return true;
+
+	return false;
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index 6453e2bfa151..95df5ab06031 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -25,6 +25,8 @@ void intel_guc_log_submission_info(struct intel_guc *guc,
 				   struct drm_printer *p);
 void intel_guc_log_context_info(struct intel_guc *guc, struct drm_printer *p);
 
+bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
+
 static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
 {
 	/* XXX: GuC submission is unavailable for now */
-- 
2.28.0

