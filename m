Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9521840502B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756AF6E893;
	Thu,  9 Sep 2021 12:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758046E877;
 Thu,  9 Sep 2021 12:32:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="208005437"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="208005437"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:32:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="470057764"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:32:04 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH v8 10/17] drm/i915/pxp: interfaces for using protected objects
Date: Thu,  9 Sep 2021 05:29:08 -0700
Message-Id: <20210909122915.971652-11-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909122915.971652-1-daniele.ceraolospurio@intel.com>
References: <20210909122915.971652-1-daniele.ceraolospurio@intel.com>
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

This api allow user mode to create protected buffers and to mark
contexts as making use of such objects. Only when using contexts
marked in such a way is the execution guaranteed to work as expected.

Contexts can only be marked as using protected content at creation time
(i.e. the parameter is immutable) and they must be both bannable and not
recoverable. Given that the protected session gets invalidated on
suspend, contexts created this way hold a runtime pm wakeref until
they're either destroyed or invalidated.

All protected objects and contexts will be considered invalid when the
PXP session is destroyed and all new submissions using them will be
rejected. All intel contexts within the invalidated gem contexts will be
marked banned. Userspace can detect that an invalidation has occurred via
the RESET_STATS ioctl, where we report it the same way as a ban due to a
hang.

v5: squash patches, rebase on proto_ctx, update kerneldoc

v6: rebase on obj create_ext changes

v7: Use session counter to check if an object it valid, hold wakeref in
    context, don't add a new flag to RESET_STATS (Daniel)

v8: don't increase guilty count for contexts banned during pxp
    invalidation (Rodrigo)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 98 ++++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |  6 ++
 .../gpu/drm/i915/gem/i915_gem_context_types.h | 28 ++++++
 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 72 ++++++++++----
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 18 ++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  6 ++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  8 ++
 .../gpu/drm/i915/gem/selftests/mock_context.c |  4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c          | 77 +++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.h          | 12 +++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  6 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  9 ++
 include/uapi/drm/i915_drm.h                   | 52 +++++++++-
 14 files changed, 362 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c2ab0e22db0a..8d2d4dbdab7c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -77,6 +77,8 @@
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_ring.h"
 
+#include "pxp/intel_pxp.h"
+
 #include "i915_gem_context.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
@@ -186,10 +188,13 @@ static int validate_priority(struct drm_i915_private *i915,
 	return 0;
 }
 
-static void proto_context_close(struct i915_gem_proto_context *pc)
+static void proto_context_close(struct drm_i915_private *i915,
+				struct i915_gem_proto_context *pc)
 {
 	int i;
 
+	if (pc->pxp_wakeref)
+		intel_runtime_pm_put(&i915->runtime_pm, pc->pxp_wakeref);
 	if (pc->vm)
 		i915_vm_put(pc->vm);
 	if (pc->user_engines) {
@@ -241,6 +246,33 @@ static int proto_context_set_persistence(struct drm_i915_private *i915,
 	return 0;
 }
 
+static int proto_context_set_protected(struct drm_i915_private *i915,
+				       struct i915_gem_proto_context *pc,
+				       bool protected)
+{
+	int ret = 0;
+
+	if (!intel_pxp_is_enabled(&i915->gt.pxp)) {
+		ret = -ENODEV;
+	} else if (!protected) {
+		pc->uses_protected_content = false;
+	} else if ((pc->user_flags & BIT(UCONTEXT_RECOVERABLE)) ||
+		   !(pc->user_flags & BIT(UCONTEXT_BANNABLE))) {
+		ret = -EPERM;
+	} else {
+		pc->uses_protected_content = true;
+
+		/*
+		 * protected context usage requires the PXP session to be up,
+		 * which in turn requires the device to be active.
+		 */
+		pc->pxp_wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+		ret = intel_pxp_wait_for_arb_start(&i915->gt.pxp);
+	}
+
+	return ret;
+}
+
 static struct i915_gem_proto_context *
 proto_context_create(struct drm_i915_private *i915, unsigned int flags)
 {
@@ -269,7 +301,7 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
 	return pc;
 
 proto_close:
-	proto_context_close(pc);
+	proto_context_close(i915, pc);
 	return err;
 }
 
@@ -693,6 +725,8 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
 			ret = -EPERM;
 		else if (args->value)
 			pc->user_flags |= BIT(UCONTEXT_BANNABLE);
+		else if (pc->uses_protected_content)
+			ret = -EPERM;
 		else
 			pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
 		break;
@@ -700,10 +734,12 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
 	case I915_CONTEXT_PARAM_RECOVERABLE:
 		if (args->size)
 			ret = -EINVAL;
-		else if (args->value)
-			pc->user_flags |= BIT(UCONTEXT_RECOVERABLE);
-		else
+		else if (!args->value)
 			pc->user_flags &= ~BIT(UCONTEXT_RECOVERABLE);
+		else if (pc->uses_protected_content)
+			ret = -EPERM;
+		else
+			pc->user_flags |= BIT(UCONTEXT_RECOVERABLE);
 		break;
 
 	case I915_CONTEXT_PARAM_PRIORITY:
@@ -731,6 +767,11 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
 						    args->value);
 		break;
 
+	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
+		ret = proto_context_set_protected(fpriv->dev_priv, pc,
+						  args->value);
+		break;
+
 	case I915_CONTEXT_PARAM_NO_ZEROMAP:
 	case I915_CONTEXT_PARAM_BAN_PERIOD:
 	case I915_CONTEXT_PARAM_RINGSIZE:
@@ -1189,6 +1230,9 @@ static void context_close(struct i915_gem_context *ctx)
 		i915_vm_close(vm);
 	}
 
+	if (ctx->pxp_wakeref)
+		intel_runtime_pm_put(&ctx->i915->runtime_pm, ctx->pxp_wakeref);
+
 	ctx->file_priv = ERR_PTR(-EBADF);
 
 	/*
@@ -1338,6 +1382,11 @@ i915_gem_create_context(struct drm_i915_private *i915,
 			goto err_engines;
 	}
 
+	if (pc->uses_protected_content) {
+		ctx->pxp_wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+		ctx->uses_protected_content = true;
+	}
+
 	trace_i915_context_create(ctx);
 
 	return ctx;
@@ -1409,7 +1458,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
 	}
 
 	ctx = i915_gem_create_context(i915, pc);
-	proto_context_close(pc);
+	proto_context_close(i915, pc);
 	if (IS_ERR(ctx)) {
 		err = PTR_ERR(ctx);
 		goto err;
@@ -1436,7 +1485,7 @@ void i915_gem_context_close(struct drm_file *file)
 	unsigned long idx;
 
 	xa_for_each(&file_priv->proto_context_xa, idx, pc)
-		proto_context_close(pc);
+		proto_context_close(file_priv->dev_priv, pc);
 	xa_destroy(&file_priv->proto_context_xa);
 	mutex_destroy(&file_priv->proto_context_lock);
 
@@ -1731,6 +1780,18 @@ static int set_priority(struct i915_gem_context *ctx,
 	return 0;
 }
 
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
@@ -1754,6 +1815,8 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
 			ret = -EPERM;
 		else if (args->value)
 			i915_gem_context_set_bannable(ctx);
+		else if (i915_gem_context_uses_protected_content(ctx))
+			ret = -EPERM; /* can't clear this for protected contexts */
 		else
 			i915_gem_context_clear_bannable(ctx);
 		break;
@@ -1761,10 +1824,12 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
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
@@ -1779,6 +1844,7 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
 		ret = set_persistence(ctx, args);
 		break;
 
+	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
 	case I915_CONTEXT_PARAM_NO_ZEROMAP:
 	case I915_CONTEXT_PARAM_BAN_PERIOD:
 	case I915_CONTEXT_PARAM_RINGSIZE:
@@ -1857,7 +1923,7 @@ finalize_create_context_locked(struct drm_i915_file_private *file_priv,
 
 	old = xa_erase(&file_priv->proto_context_xa, id);
 	GEM_BUG_ON(old != pc);
-	proto_context_close(pc);
+	proto_context_close(file_priv->dev_priv, pc);
 
 	/* One for the xarray and one for the caller */
 	return i915_gem_context_get(ctx);
@@ -1943,7 +2009,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 			goto err_pc;
 		}
 
-		proto_context_close(ext_data.pc);
+		proto_context_close(i915, ext_data.pc);
 		gem_context_register(ctx, ext_data.fpriv, id);
 	} else {
 		ret = proto_context_register(ext_data.fpriv, ext_data.pc, &id);
@@ -1957,7 +2023,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 	return 0;
 
 err_pc:
-	proto_context_close(ext_data.pc);
+	proto_context_close(i915, ext_data.pc);
 	return ret;
 }
 
@@ -1988,7 +2054,7 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
 	GEM_WARN_ON(ctx && pc);
 
 	if (pc)
-		proto_context_close(pc);
+		proto_context_close(file_priv->dev_priv, pc);
 
 	if (ctx)
 		context_close(ctx);
@@ -2106,6 +2172,10 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 		args->value = i915_gem_context_is_persistent(ctx);
 		break;
 
+	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
+		ret = get_protected(ctx, args);
+		break;
+
 	case I915_CONTEXT_PARAM_NO_ZEROMAP:
 	case I915_CONTEXT_PARAM_BAN_PERIOD:
 	case I915_CONTEXT_PARAM_ENGINES:
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index d3279086a5e7..babfecb17ad1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -108,6 +108,12 @@ i915_gem_context_clear_user_engines(struct i915_gem_context *ctx)
 	clear_bit(CONTEXT_USER_ENGINES, &ctx->flags);
 }
 
+static inline bool
+i915_gem_context_uses_protected_content(const struct i915_gem_context *ctx)
+{
+	return ctx->uses_protected_content;
+}
+
 /* i915_gem_context.c */
 void i915_gem_init__contexts(struct drm_i915_private *i915);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index c4617e4d9fa9..a627b09c4680 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -198,6 +198,12 @@ struct i915_gem_proto_context {
 
 	/** @single_timeline: See See &i915_gem_context.syncobj */
 	bool single_timeline;
+
+	/** @uses_protected_content: See &i915_gem_context.uses_protected_content */
+	bool uses_protected_content;
+
+	/** @pxp_wakeref: See &i915_gem_context.pxp_wakeref */
+	intel_wakeref_t pxp_wakeref;
 };
 
 /**
@@ -321,6 +327,28 @@ struct i915_gem_context {
 #define CONTEXT_CLOSED			0
 #define CONTEXT_USER_ENGINES		1
 
+	/**
+	 * @uses_protected_content: context uses PXP-encrypted objects.
+	 *
+	 * This flag can only be set at ctx creation time and it's immutable for
+	 * the lifetime of the context. See I915_CONTEXT_PARAM_PROTECTED_CONTENT
+	 * in uapi/drm/i915_drm.h for more info on setting restrictions and
+	 * expected behaviour of marked contexts.
+	 */
+	bool uses_protected_content;
+
+	/**
+	 * @pxp_wakeref: wakeref to keep the device awake when PXP is in use
+	 *
+	 * PXP sessions are invalidated when the device is suspended, which in
+	 * turns invalidates all contexts and objects using it. To keep the
+	 * flow simple, we keep the device awake when contexts using PXP objects
+	 * are in use. It is expected that the userspace application only uses
+	 * PXP when the display is on, so taking a wakeref here shouldn't worsen
+	 * our power metrics.
+	 */
+	intel_wakeref_t pxp_wakeref;
+
 	/** @mutex: guards everything that isn't engines or handles_vma */
 	struct mutex mutex;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 1d341b8c47c0..8955d6abcef1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -6,6 +6,7 @@
 #include "gem/i915_gem_ioctls.h"
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
+#include "pxp/intel_pxp.h"
 
 #include "i915_drv.h"
 #include "i915_trace.h"
@@ -82,21 +83,11 @@ static int i915_gem_publish(struct drm_i915_gem_object *obj,
 	return 0;
 }
 
-/**
- * Creates a new object using the same path as DRM_I915_GEM_CREATE_EXT
- * @i915: i915 private
- * @size: size of the buffer, in bytes
- * @placements: possible placement regions, in priority order
- * @n_placements: number of possible placement regions
- *
- * This function is exposed primarily for selftests and does very little
- * error checking.  It is assumed that the set of placement regions has
- * already been verified to be valid.
- */
-struct drm_i915_gem_object *
-__i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
-			      struct intel_memory_region **placements,
-			      unsigned int n_placements)
+static struct drm_i915_gem_object *
+__i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
+				  struct intel_memory_region **placements,
+				  unsigned int n_placements,
+				  unsigned int ext_flags)
 {
 	struct intel_memory_region *mr = placements[0];
 	struct drm_i915_gem_object *obj;
@@ -135,6 +126,9 @@ __i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
 
 	GEM_BUG_ON(size != obj->base.size);
 
+	/* Add any flag set by create_ext options */
+	obj->flags |= ext_flags;
+
 	trace_i915_gem_object_create(obj);
 	return obj;
 
@@ -145,6 +139,26 @@ __i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
 	return ERR_PTR(ret);
 }
 
+/**
+ * Creates a new object using the same path as DRM_I915_GEM_CREATE_EXT
+ * @i915: i915 private
+ * @size: size of the buffer, in bytes
+ * @placements: possible placement regions, in priority order
+ * @n_placements: number of possible placement regions
+ *
+ * This function is exposed primarily for selftests and does very little
+ * error checking.  It is assumed that the set of placement regions has
+ * already been verified to be valid.
+ */
+struct drm_i915_gem_object *
+__i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
+			      struct intel_memory_region **placements,
+			      unsigned int n_placements)
+{
+	return __i915_gem_object_create_user_ext(i915, size, placements,
+						 n_placements, 0);
+}
+
 int
 i915_gem_dumb_create(struct drm_file *file,
 		     struct drm_device *dev,
@@ -224,6 +238,7 @@ struct create_ext {
 	struct drm_i915_private *i915;
 	struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
 	unsigned int n_placements;
+	unsigned long flags;
 };
 
 static void repr_placements(char *buf, size_t size,
@@ -353,8 +368,28 @@ static int ext_set_placements(struct i915_user_extension __user *base,
 	return set_placements(&ext, data);
 }
 
+static int ext_set_protected(struct i915_user_extension __user *base, void *data)
+{
+	struct drm_i915_gem_create_ext_protected_content ext;
+	struct create_ext *ext_data = data;
+
+	if (copy_from_user(&ext, base, sizeof(ext)))
+		return -EFAULT;
+
+	if (ext.flags)
+		return -EINVAL;
+
+	if (!intel_pxp_is_enabled(&ext_data->i915->gt.pxp))
+		return -ENODEV;
+
+	ext_data->flags |= I915_BO_PROTECTED;
+
+	return 0;
+}
+
 static const i915_user_extension_fn create_extensions[] = {
 	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
+	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
 };
 
 /**
@@ -389,9 +424,10 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 		ext_data.n_placements = 1;
 	}
 
-	obj = __i915_gem_object_create_user(i915, args->size,
-					    ext_data.placements,
-					    ext_data.n_placements);
+	obj = __i915_gem_object_create_user_ext(i915, args->size,
+						ext_data.placements,
+						ext_data.n_placements,
+						ext_data.flags);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 2f2434b52317..d129a9f951da 100644
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
@@ -821,6 +823,22 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
 		if (unlikely(!obj))
 			return ERR_PTR(-ENOENT);
 
+		/*
+		 * If the user has opted-in for protected-object tracking, make
+		 * sure the object encryption can be used.
+		 * We only need to do this when the object is first used with
+		 * this context, because the context itself will be banned when
+		 * the protected objects become invalid.
+		 */
+		if (i915_gem_context_uses_protected_content(eb->gem_context) &&
+		    i915_gem_object_is_protected(obj)) {
+			err = intel_pxp_key_check(&vm->gt->pxp, obj);
+			if (err) {
+				i915_gem_object_put(obj);
+				return ERR_PTR(err);
+			}
+		}
+
 		vma = i915_vma_instance(obj, vm, NULL);
 		if (IS_ERR(vma)) {
 			i915_gem_object_put(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 6fb9afb65034..e85f2d9fddee 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -25,6 +25,7 @@
 #include <linux/sched/mm.h>
 
 #include "display/intel_frontbuffer.h"
+#include "pxp/intel_pxp.h"
 #include "i915_drv.h"
 #include "i915_gem_clflush.h"
 #include "i915_gem_context.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..ed171daf49a7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -269,6 +269,12 @@ i915_gem_object_clear_tiling_quirk(struct drm_i915_gem_object *obj)
 	clear_bit(I915_TILING_QUIRK_BIT, &obj->flags);
 }
 
+static inline bool
+i915_gem_object_is_protected(const struct drm_i915_gem_object *obj)
+{
+	return obj->flags & I915_BO_PROTECTED;
+}
+
 static inline bool
 i915_gem_object_type_has(const struct drm_i915_gem_object *obj,
 			 unsigned long flags)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 2471f36aaff3..7d7e9c77f199 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -298,6 +298,7 @@ struct drm_i915_gem_object {
 			     I915_BO_ALLOC_USER)
 #define I915_BO_READONLY         BIT(4)
 #define I915_TILING_QUIRK_BIT    5 /* unknown swizzling; do not release! */
+#define I915_BO_PROTECTED        BIT(6)
 
 	/**
 	 * @mem_flags - Mutable placement-related flags
@@ -537,6 +538,13 @@ struct drm_i915_gem_object {
 		bool created:1;
 	} ttm;
 
+	/*
+	 * Record which PXP key instance this object was created against (if
+	 * any), so we can use it to determine if the encryption is valid by
+	 * comparing against the current key instance.
+	 */
+	u32 pxp_key_instance;
+
 	/** Record of address bit 17 of each page at last unbind. */
 	unsigned long *bit_17;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index 067d68a6fe4c..c0a8ef368044 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -88,7 +88,7 @@ live_context(struct drm_i915_private *i915, struct file *file)
 		return ERR_CAST(pc);
 
 	ctx = i915_gem_create_context(i915, pc);
-	proto_context_close(pc);
+	proto_context_close(i915, pc);
 	if (IS_ERR(ctx))
 		return ctx;
 
@@ -163,7 +163,7 @@ kernel_context(struct drm_i915_private *i915,
 	}
 
 	ctx = i915_gem_create_context(i915, pc);
-	proto_context_close(pc);
+	proto_context_close(i915, pc);
 	if (IS_ERR(ctx))
 		return ctx;
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index b0c7edc10cc3..08fd440a4622 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -7,6 +7,7 @@
 #include "intel_pxp_irq.h"
 #include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
+#include "gem/i915_gem_context.h"
 #include "gt/intel_context.h"
 #include "i915_drv.h"
 
@@ -166,3 +167,79 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp)
 
 	intel_pxp_irq_disable(pxp);
 }
+
+int intel_pxp_key_check(struct intel_pxp *pxp, struct drm_i915_gem_object *obj)
+{
+	if (!intel_pxp_is_active(pxp))
+		return -ENODEV;
+
+	if (!i915_gem_object_is_protected(obj))
+		return -EINVAL;
+
+	GEM_BUG_ON(!pxp->key_instance);
+
+	/*
+	 * If this is the first time we're using this object, it's not
+	 * encrypted yet; it will be encrypted with the current key, so mark it
+	 * as such. If the object is already encrypted, check instead if the
+	 * used key is still valid.
+	 */
+	if (!obj->pxp_key_instance)
+		obj->pxp_key_instance = pxp->key_instance;
+	else if (obj->pxp_key_instance != pxp->key_instance)
+		return -ENOEXEC;
+
+	return 0;
+}
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
+		if (likely(!i915_gem_context_uses_protected_content(ctx))) {
+			i915_gem_context_put(ctx);
+			continue;
+		}
+
+		spin_unlock_irq(&i915->gem.contexts.lock);
+
+		/*
+		 * By the time we get here, the HW keys are already long gone,
+		 * so any batch using them that's already on the engines is very
+		 * likely a lost cause (and it has probably already hung the
+		 * engine). Therefore, we skip attempting to pull the running
+		 * context out of the HW and we prioritize bringing the session
+		 * back as soon as possible.
+		 */
+		for_each_gem_engine(ce, i915_gem_context_lock_engines(ctx), it)
+			intel_context_ban(ce, NULL);
+		i915_gem_context_unlock_engines(ctx);
+
+		/*
+		 * The context has been killed, no need to keep the wakeref.
+		 * This is safe from races because the only other place this
+		 * is touched is context_close and we're holding a ctx ref
+		 */
+		if (ctx->pxp_wakeref) {
+			intel_runtime_pm_put(&i915->runtime_pm,
+					     ctx->pxp_wakeref);
+			ctx->pxp_wakeref = 0;
+		}
+
+		spin_lock_irq(&i915->gem.contexts.lock);
+		list_safe_reset_next(ctx, cn, link);
+		i915_gem_context_put(ctx);
+	}
+	spin_unlock_irq(&i915->gem.contexts.lock);
+}
+
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 8f1e86caa53f..f942bdd2af0c 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -9,6 +9,8 @@
 #include "gt/intel_gt_types.h"
 #include "intel_pxp_types.h"
 
+struct drm_i915_gem_object;
+
 static inline struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
 {
 	return container_of(pxp, struct intel_gt, pxp);
@@ -33,6 +35,10 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
 
 void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
 int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp);
+
+int intel_pxp_key_check(struct intel_pxp *pxp, struct drm_i915_gem_object *obj);
+
+void intel_pxp_invalidate(struct intel_pxp *pxp);
 #else
 static inline void intel_pxp_init(struct intel_pxp *pxp)
 {
@@ -46,6 +52,12 @@ static inline int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
 {
 	return -ENODEV;
 }
+
+static inline int intel_pxp_key_check(struct intel_pxp *pxp,
+				      struct drm_i915_gem_object *obj)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __INTEL_PXP_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 67c30e534d50..c6a5e4197e40 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -72,6 +72,9 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
 		return ret;
 	}
 
+	if (!++pxp->key_instance)
+		++pxp->key_instance;
+
 	pxp->arb_is_valid = true;
 
 	return 0;
@@ -85,6 +88,9 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
 	/* must mark termination in progress calling this function */
 	GEM_WARN_ON(pxp->arb_is_valid);
 
+	/* invalidate protected objects */
+	intel_pxp_invalidate(pxp);
+
 	/* terminate the hw sessions */
 	ret = intel_pxp_terminate_session(pxp, ARB_SESSION);
 	if (ret) {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 5a170e43c959..c394ab2e452b 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -7,7 +7,9 @@
 #define __INTEL_PXP_TYPES_H__
 
 #include <linux/completion.h>
+#include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
@@ -27,6 +29,13 @@ struct intel_pxp {
 	 */
 	bool arb_is_valid;
 
+	/*
+	 * Keep track of which key instance we're on, so we can use it to
+	 * determine if an object was created using the current key or a
+	 * previous one.
+	 */
+	u32 key_instance;
+
 	struct mutex tee_mutex; /* protects the tee channel binding */
 
 	/*
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 920e9e852e5a..df680286dd7e 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1846,12 +1846,33 @@ struct drm_i915_gem_context_param {
  * attempted to use it, never re-use this context param number.
  */
 #define I915_CONTEXT_PARAM_RINGSIZE	0xc
+
+/*
+ * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
+ *
+ * Mark that the context makes use of protected content, which will result
+ * in the context being invalidated when the protected content session is.
+ * Given that the protected content session is killed on suspend, the device
+ * is kept awake for the lifetime of a protected context, so the user should
+ * make sure to dispose of them once done.
+ * This flag can only be set at context creation time and, when set to true,
+ * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECOVERABLE
+ * to false. This flag can't be set to true in conjunction with setting the
+ * I915_CONTEXT_PARAM_BANNABLE flag to false.
+ *
+ * In addition to the normal failure cases, setting this flag during context
+ * creation can result in the following errors:
+ *
+ * -ENODEV: feature not available
+ * -EPERM: trying to mark a recoverable or not bannable context as protected
+ */
+#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
 /* Must be kept compact -- no holes and well documented */
 
 	__u64 value;
 };
 
-/*
+/**
  * Context SSEU programming
  *
  * It may be necessary for either functional or performance reason to configure
@@ -2979,8 +3000,12 @@ struct drm_i915_gem_create_ext {
 	 *
 	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
 	 * struct drm_i915_gem_create_ext_memory_regions.
+	 *
+	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
+	 * struct drm_i915_gem_create_ext_protected_content.
 	 */
 #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
+#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
 	__u64 extensions;
 };
 
@@ -3038,6 +3063,31 @@ struct drm_i915_gem_create_ext_memory_regions {
 	__u64 regions;
 };
 
+/**
+ * struct drm_i915_gem_create_ext_protected_content - The
+ * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
+ *
+ * If this extension is provided, buffer contents are expected to be protected
+ * by PXP encryption and require decryption for scan out and processing. This
+ * is only possible on platforms that have PXP enabled, on all other scenarios
+ * using this extension will cause the ioctl to fail and return -ENODEV. The
+ * flags parameter is reserved for future expansion and must currently be set
+ * to zero.
+ *
+ * The buffer contents are considered invalid after a PXP session teardown.
+ *
+ * The encryption is guaranteed to be processed correctly only if the object
+ * is submitted with a context created using the
+ * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable extra checks
+ * at submission time on the validity of the objects involved.
+ */
+struct drm_i915_gem_create_ext_protected_content {
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+	/** @flags: reserved for future usage, currently MBZ */
+	__u32 flags;
+};
+
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
-- 
2.25.1

