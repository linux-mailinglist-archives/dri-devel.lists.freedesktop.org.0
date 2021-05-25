Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241B38FA36
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 07:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537A66E837;
	Tue, 25 May 2021 05:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178956E831;
 Tue, 25 May 2021 05:48:36 +0000 (UTC)
IronPort-SDR: lT2fZtWudyuvibCb/gtQqA7s717BjoJvjNn5gEOvVR0E3Kdrx65V7DBuyiC89UpyWpXRVpnkqX
 naTecb824/2w==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="266005446"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="266005446"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:35 -0700
IronPort-SDR: 5sG0VeE9FTDBdN7xBj1EGe/fmQ+03PK7jTwa0S6iZ3TcMorZZvJRUQ2yRkyKgB0951igc3HLoK
 HsYATKpSzgYw==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="397231761"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:35 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 11/17] drm/i915/pxp: interface for marking contexts as
 using protected content
Date: Mon, 24 May 2021 22:47:57 -0700
Message-Id: <20210525054803.7387-12-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
References: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extra tracking and checks around protected objects, coming in a follow-up
patch, will be enabled only for contexts that opt in. Contexts can only be
marked as using protected content at creation time and they must be both
bannable and not recoverable.

When a PXP teardown occurs, all gem contexts marked this way that
have been used at least once will be marked as invalid and all new
submissions using them will be rejected. All intel contexts within the
invalidated gem contexts will be marked banned.
A new flag has been added to the RESET_STATS ioctl to report the
invalidation to userspace.

v2: split to its own patch and improve doc (Chris), invalidate contexts
on teardown

v3: improve doc, use -EACCES for execbuf fail (Chris), make protected
    context flag not mandatory in protected object execbuf to avoid
    abuse (Lionel)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 59 ++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   | 18 ++++++
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  2 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 18 ++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.c          | 48 +++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  3 +
 include/uapi/drm/i915_drm.h                   | 26 ++++++++
 8 files changed, 172 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 188dee13e017..11b67f1f6e96 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -76,6 +76,8 @@
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_ring.h"
 
+#include "pxp/intel_pxp.h"
+
 #include "i915_gem_context.h"
 #include "i915_globals.h"
 #include "i915_trace.h"
@@ -1971,6 +1973,40 @@ static int set_priority(struct i915_gem_context *ctx,
 	return 0;
 }
 
+static int set_protected(struct i915_gem_context *ctx,
+			 const struct drm_i915_gem_context_param *args)
+{
+	int ret = 0;
+
+	if (!intel_pxp_is_enabled(&ctx->i915->gt.pxp))
+		ret = -ENODEV;
+	else if (ctx->file_priv) /* can't change this after creation! */
+		ret = -EEXIST;
+	else if (args->size)
+		ret = -EINVAL;
+	else if (!args->value)
+		clear_bit(UCONTEXT_PROTECTED, &ctx->user_flags);
+	else if (i915_gem_context_is_recoverable(ctx) ||
+		 !i915_gem_context_is_bannable(ctx))
+		ret = -EPERM;
+	else
+		set_bit(UCONTEXT_PROTECTED, &ctx->user_flags);
+
+	return ret;
+}
+
+static int get_protected(struct i915_gem_context *ctx,
+			 struct drm_i915_gem_context_param *args)
+{
+	if (!intel_pxp_is_enabled(&ctx->i915->gt.pxp))
+		return -ENODEV;
+
+	args->size = 0;
+	args->value = i915_gem_context_uses_protected_content(ctx);
+
+	return 0;
+}
+
 static int ctx_setparam(struct drm_i915_file_private *fpriv,
 			struct i915_gem_context *ctx,
 			struct drm_i915_gem_context_param *args)
@@ -2003,6 +2039,8 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
 			ret = -EPERM;
 		else if (args->value)
 			i915_gem_context_set_bannable(ctx);
+		else if (i915_gem_context_uses_protected_content(ctx))
+			ret = -EPERM; /* can't clear this for protected contexts */
 		else
 			i915_gem_context_clear_bannable(ctx);
 		break;
@@ -2010,10 +2048,12 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
 	case I915_CONTEXT_PARAM_RECOVERABLE:
 		if (args->size)
 			ret = -EINVAL;
-		else if (args->value)
-			i915_gem_context_set_recoverable(ctx);
-		else
+		else if (!args->value)
 			i915_gem_context_clear_recoverable(ctx);
+		else if (i915_gem_context_uses_protected_content(ctx))
+			ret = -EPERM; /* can't set this for protected contexts */
+		else
+			i915_gem_context_set_recoverable(ctx);
 		break;
 
 	case I915_CONTEXT_PARAM_PRIORITY:
@@ -2040,6 +2080,10 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
 		ret = set_ringsize(ctx, args);
 		break;
 
+	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
+		ret = set_protected(ctx, args);
+		break;
+
 	case I915_CONTEXT_PARAM_BAN_PERIOD:
 	default:
 		ret = -EINVAL;
@@ -2493,6 +2537,10 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 		ret = get_ringsize(ctx, args);
 		break;
 
+	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
+		ret = get_protected(ctx, args);
+		break;
+
 	case I915_CONTEXT_PARAM_BAN_PERIOD:
 	default:
 		ret = -EINVAL;
@@ -2553,6 +2601,11 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
 	args->batch_active = atomic_read(&ctx->guilty_count);
 	args->batch_pending = atomic_read(&ctx->active_count);
 
+	/* re-use args->flags for output flags */
+	args->flags = 0;
+	if (i915_gem_context_invalidated(ctx))
+		args->flags |= I915_CONTEXT_INVALIDATED;
+
 	ret = 0;
 out:
 	rcu_read_unlock();
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index b5c908f3f4f2..169d3fb49252 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -108,6 +108,24 @@ i915_gem_context_clear_user_engines(struct i915_gem_context *ctx)
 	clear_bit(CONTEXT_USER_ENGINES, &ctx->flags);
 }
 
+static inline bool
+i915_gem_context_invalidated(const struct i915_gem_context *ctx)
+{
+	return test_bit(CONTEXT_INVALID, &ctx->flags);
+}
+
+static inline void
+i915_gem_context_set_invalid(struct i915_gem_context *ctx)
+{
+	set_bit(CONTEXT_INVALID, &ctx->flags);
+}
+
+static inline bool
+i915_gem_context_uses_protected_content(const struct i915_gem_context *ctx)
+{
+	return test_bit(UCONTEXT_PROTECTED, &ctx->user_flags);
+}
+
 /* i915_gem_context.c */
 void i915_gem_init__contexts(struct drm_i915_private *i915);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 340473aa70de..a0f80475da05 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -134,6 +134,7 @@ struct i915_gem_context {
 #define UCONTEXT_BANNABLE		2
 #define UCONTEXT_RECOVERABLE		3
 #define UCONTEXT_PERSISTENCE		4
+#define UCONTEXT_PROTECTED		5
 
 	/**
 	 * @flags: small set of booleans
@@ -141,6 +142,7 @@ struct i915_gem_context {
 	unsigned long flags;
 #define CONTEXT_CLOSED			0
 #define CONTEXT_USER_ENGINES		1
+#define CONTEXT_INVALID			2
 
 	struct mutex mutex;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 297143511f99..a11e9d5767bf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -21,6 +21,8 @@
 #include "gt/intel_gt_pm.h"
 #include "gt/intel_ring.h"
 
+#include "pxp/intel_pxp.h"
+
 #include "i915_drv.h"
 #include "i915_gem_clflush.h"
 #include "i915_gem_context.h"
@@ -746,6 +748,11 @@ static int eb_select_context(struct i915_execbuffer *eb)
 	if (unlikely(!ctx))
 		return -ENOENT;
 
+	if (i915_gem_context_invalidated(ctx)) {
+		i915_gem_context_put(ctx);
+		return -EACCES;
+	}
+
 	eb->gem_context = ctx;
 	if (rcu_access_pointer(ctx->vm))
 		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
@@ -2940,6 +2947,17 @@ eb_select_engine(struct i915_execbuffer *eb)
 
 	intel_gt_pm_get(ce->engine->gt);
 
+	if (i915_gem_context_uses_protected_content(eb->gem_context)) {
+		err = intel_pxp_wait_for_arb_start(&ce->engine->gt->pxp);
+		if (err)
+			goto err;
+
+		if (i915_gem_context_invalidated(eb->gem_context)) {
+			err = -EACCES;
+			goto err;
+		}
+	}
+
 	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
 		err = intel_context_alloc_state(ce);
 		if (err)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 6b0e7170c29b..f713d3423cea 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -7,6 +7,7 @@
 #include "intel_pxp_irq.h"
 #include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
+#include "gem/i915_gem_context.h"
 #include "gt/intel_context.h"
 #include "i915_drv.h"
 
@@ -164,3 +165,50 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp)
 
 	intel_pxp_irq_disable(pxp);
 }
+
+void intel_pxp_invalidate(struct intel_pxp *pxp)
+{
+	struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
+	struct i915_gem_context *ctx, *cn;
+
+	/* ban all contexts marked as protected */
+	spin_lock_irq(&i915->gem.contexts.lock);
+	list_for_each_entry_safe(ctx, cn, &i915->gem.contexts.list, link) {
+		struct i915_gem_engines_iter it;
+		struct intel_context *ce;
+
+		if (!kref_get_unless_zero(&ctx->ref))
+			continue;
+
+		if (likely(!i915_gem_context_uses_protected_content(ctx)) ||
+		    i915_gem_context_invalidated(ctx)) {
+			i915_gem_context_put(ctx);
+			continue;
+		}
+
+		spin_unlock_irq(&i915->gem.contexts.lock);
+
+		/*
+		 * Note that by the time we get here the HW keys are already
+		 * long gone, so any batch using them that's already on the
+		 * engines is very likely a lost cause (and it has probably
+		 * already hung the engine). Therefore, we skip attempting to
+		 * pull the running context out of the HW and we prioritize
+		 * bringing the session back as soon as possible.
+		 */
+		for_each_gem_engine(ce, i915_gem_context_lock_engines(ctx), it) {
+			/* only invalidate if at least one ce was allocated */
+			if (test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
+				intel_context_set_banned(ce);
+				i915_gem_context_set_invalid(ctx);
+			}
+		}
+		i915_gem_context_unlock_engines(ctx);
+
+		spin_lock_irq(&i915->gem.contexts.lock);
+		list_safe_reset_next(ctx, cn, link);
+		i915_gem_context_put(ctx);
+	}
+	spin_unlock_irq(&i915->gem.contexts.lock);
+}
+
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 074b3b980957..91c1a2056309 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -33,6 +33,7 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
 
 void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
 int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp);
+void intel_pxp_invalidate(struct intel_pxp *pxp);
 #else
 static inline void intel_pxp_init(struct intel_pxp *pxp)
 {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index e751122cb24a..e9fe757e368a 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -85,6 +85,9 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
 	/* must mark termination in progress calling this function */
 	GEM_WARN_ON(pxp->arb_is_valid);
 
+	/* invalidate protected objects */
+	intel_pxp_invalidate(pxp);
+
 	/* terminate the hw sessions */
 	ret = intel_pxp_terminate_session(pxp, ARB_SESSION);
 	if (ret) {
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index fc4283c9b87c..3cc33fcbf520 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1743,6 +1743,26 @@ struct drm_i915_gem_context_param {
  * Default is 16 KiB.
  */
 #define I915_CONTEXT_PARAM_RINGSIZE	0xc
+
+/*
+ * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
+ *
+ * Mark that the context makes use of protected content, which will result
+ * in the context being invalidated when the protected content session is.
+ * This flag can only be set at context creation time and, when set to true,
+ * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECOVERABLE
+ * to false. This flag can't be set to true in conjunction with setting the
+ * I915_CONTEXT_PARAM_BANNABLE flag to false.
+ *
+ * Given the numerous restriction on this flag, there are several unique
+ * failure cases:
+ *
+ * -ENODEV: feature not available
+ * -EEXIST: trying to modify an existing context
+ * -EPERM: trying to mark a recoverable or not bannable context as protected
+ * -EACCES: submitting an invalidated context for execution
+ */
+#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
 /* Must be kept compact -- no holes and well documented */
 
 	__u64 value;
@@ -1973,6 +1993,12 @@ struct drm_i915_reg_read {
 struct drm_i915_reset_stats {
 	__u32 ctx_id;
 	__u32 flags;
+	/*
+	 * contexts marked as using protected content are invalidated when the
+	 * protected content session dies. Submission of invalidated contexts
+	 * is rejected with -EACCES.
+	 */
+#define I915_CONTEXT_INVALIDATED 0x1
 
 	/* All resets since boot/module reload, for all contexts */
 	__u32 reset_count;
-- 
2.29.2

