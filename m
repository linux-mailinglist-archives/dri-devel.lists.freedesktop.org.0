Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C973CEB2F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 20:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E4689FE3;
	Mon, 19 Jul 2021 18:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E8989FE3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 18:52:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="191394697"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="191394697"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 11:52:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="431789555"
Received: from luisarey-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.212.15.36])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 11:51:57 -0700
Date: Mon, 19 Jul 2021 14:51:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v5 10/15] drm/i915/pxp: interfaces for using protected
 objects
Message-ID: <YPXJzNVOzXPT15P5@intel.com>
References: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
 <20210716041034.382-11-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716041034.382-11-daniele.ceraolospurio@intel.com>
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 09:10:29PM -0700, Daniele Ceraolo Spurio wrote:
> This api allow user mode to create protected buffers and to mark
> contexts as making use of such objects. Only when using contexts
> marked in such a way is the execution guaranteed to work as expected.
> 
> Contexts can only be marked as using protected content at creation time
> (i.e. the parameter is immutable) and they must be both bannable and not
> recoverable.
> 
> All protected objects and contexts that have backing storage will be
> considered invalid when the PXP session is destroyed and all new
> submissions using them will be rejected. All intel contexts within the
> invalidated gem contexts will be marked banned. A new flag has been
> added to the RESET_STATS ioctl to report the context invalidation to
> userspace.
> 
> This patch was previously sent as 2 separate patches, which have been
> squashed following a request to have all the uapi in a single patch.
> I've retained the s-o-b from both.

s-o-b doesn't mean authorship. we probably should start using more
the co-developed-by and add

Co-developed-by: Someone
[Someone has developed the addition of this and that function
before other changes got squashed]

or something like that...

That aside, the patch is right as we had agreed and following the
new guidance for immutable params.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> v5: squash patches, rebase on proto_ctx, update kerneldoc
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 68 ++++++++++++--
>  drivers/gpu/drm/i915/gem/i915_gem_context.h   | 18 ++++
>  .../gpu/drm/i915/gem/i915_gem_context_types.h |  2 +
>  drivers/gpu/drm/i915/gem/i915_gem_create.c    | 26 ++++++
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 40 ++++++++-
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  6 ++
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    | 12 +++
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 13 +++
>  drivers/gpu/drm/i915/pxp/intel_pxp.c          | 89 +++++++++++++++++++
>  drivers/gpu/drm/i915/pxp/intel_pxp.h          | 15 ++++
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  3 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  5 ++
>  include/uapi/drm/i915_drm.h                   | 55 +++++++++++-
>  13 files changed, 344 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 7d6f52d8a801..d8d3d99d4039 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -78,6 +78,8 @@
>  #include "gt/intel_gpu_commands.h"
>  #include "gt/intel_ring.h"
>  
> +#include "pxp/intel_pxp.h"
> +
>  #include "i915_gem_context.h"
>  #include "i915_globals.h"
>  #include "i915_trace.h"
> @@ -246,6 +248,25 @@ static int proto_context_set_persistence(struct drm_i915_private *i915,
>  	return 0;
>  }
>  
> +static int proto_context_set_protected(struct drm_i915_private *i915,
> +				       struct i915_gem_proto_context *pc,
> +				       bool protected)
> +{
> +	int ret = 0;
> +
> +	if (!intel_pxp_is_enabled(&i915->gt.pxp))
> +		ret = -ENODEV;
> +	else if (!protected)
> +		pc->user_flags &= ~BIT(UCONTEXT_PROTECTED);
> +	else if ((pc->user_flags & BIT(UCONTEXT_RECOVERABLE)) ||
> +		 !(pc->user_flags & BIT(UCONTEXT_BANNABLE)))
> +		ret = -EPERM;
> +	else
> +		pc->user_flags |= BIT(UCONTEXT_PROTECTED);
> +
> +	return ret;
> +}
> +
>  static struct i915_gem_proto_context *
>  proto_context_create(struct drm_i915_private *i915, unsigned int flags)
>  {
> @@ -689,6 +710,8 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>  			ret = -EPERM;
>  		else if (args->value)
>  			pc->user_flags |= BIT(UCONTEXT_BANNABLE);
> +		else if (pc->user_flags & BIT(UCONTEXT_PROTECTED))
> +			ret = -EPERM;
>  		else
>  			pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
>  		break;
> @@ -696,10 +719,12 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>  	case I915_CONTEXT_PARAM_RECOVERABLE:
>  		if (args->size)
>  			ret = -EINVAL;
> -		else if (args->value)
> -			pc->user_flags |= BIT(UCONTEXT_RECOVERABLE);
> -		else
> +		else if (!args->value)
>  			pc->user_flags &= ~BIT(UCONTEXT_RECOVERABLE);
> +		else if (pc->user_flags & BIT(UCONTEXT_PROTECTED))
> +			ret = -EPERM;
> +		else
> +			pc->user_flags |= BIT(UCONTEXT_RECOVERABLE);
>  		break;
>  
>  	case I915_CONTEXT_PARAM_PRIORITY:
> @@ -727,6 +752,11 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>  						    args->value);
>  		break;
>  
> +	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
> +		ret = proto_context_set_protected(fpriv->dev_priv, pc,
> +						  args->value);
> +		break;
> +
>  	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
>  	case I915_CONTEXT_PARAM_RINGSIZE:
> @@ -1799,6 +1829,18 @@ static int set_priority(struct i915_gem_context *ctx,
>  	return 0;
>  }
>  
> +static int get_protected(struct i915_gem_context *ctx,
> +			 struct drm_i915_gem_context_param *args)
> +{
> +	if (!intel_pxp_is_enabled(&ctx->i915->gt.pxp))
> +		return -ENODEV;
> +
> +	args->size = 0;
> +	args->value = i915_gem_context_uses_protected_content(ctx);
> +
> +	return 0;
> +}
> +
>  static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  			struct i915_gem_context *ctx,
>  			struct drm_i915_gem_context_param *args)
> @@ -1822,6 +1864,8 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  			ret = -EPERM;
>  		else if (args->value)
>  			i915_gem_context_set_bannable(ctx);
> +		else if (i915_gem_context_uses_protected_content(ctx))
> +			ret = -EPERM; /* can't clear this for protected contexts */
>  		else
>  			i915_gem_context_clear_bannable(ctx);
>  		break;
> @@ -1829,10 +1873,12 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  	case I915_CONTEXT_PARAM_RECOVERABLE:
>  		if (args->size)
>  			ret = -EINVAL;
> -		else if (args->value)
> -			i915_gem_context_set_recoverable(ctx);
> -		else
> +		else if (!args->value)
>  			i915_gem_context_clear_recoverable(ctx);
> +		else if (i915_gem_context_uses_protected_content(ctx))
> +			ret = -EPERM; /* can't set this for protected contexts */
> +		else
> +			i915_gem_context_set_recoverable(ctx);
>  		break;
>  
>  	case I915_CONTEXT_PARAM_PRIORITY:
> @@ -1847,6 +1893,7 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  		ret = set_persistence(ctx, args);
>  		break;
>  
> +	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
>  	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
>  	case I915_CONTEXT_PARAM_RINGSIZE:
> @@ -2175,6 +2222,10 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>  		args->value = i915_gem_context_is_persistent(ctx);
>  		break;
>  
> +	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
> +		ret = get_protected(ctx, args);
> +		break;
> +
>  	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
>  	case I915_CONTEXT_PARAM_ENGINES:
> @@ -2251,6 +2302,11 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
>  	args->batch_active = atomic_read(&ctx->guilty_count);
>  	args->batch_pending = atomic_read(&ctx->active_count);
>  
> +	/* re-use args->flags for output flags */
> +	args->flags = 0;
> +	if (i915_gem_context_invalidated(ctx))
> +		args->flags |= I915_CONTEXT_INVALIDATED;
> +
>  	i915_gem_context_put(ctx);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> index 20411db84914..4963c5b719cd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> @@ -108,6 +108,24 @@ i915_gem_context_clear_user_engines(struct i915_gem_context *ctx)
>  	clear_bit(CONTEXT_USER_ENGINES, &ctx->flags);
>  }
>  
> +static inline bool
> +i915_gem_context_invalidated(const struct i915_gem_context *ctx)
> +{
> +	return test_bit(CONTEXT_INVALID, &ctx->flags);
> +}
> +
> +static inline void
> +i915_gem_context_set_invalid(struct i915_gem_context *ctx)
> +{
> +	set_bit(CONTEXT_INVALID, &ctx->flags);
> +}
> +
> +static inline bool
> +i915_gem_context_uses_protected_content(const struct i915_gem_context *ctx)
> +{
> +	return test_bit(UCONTEXT_PROTECTED, &ctx->user_flags);
> +}
> +
>  /* i915_gem_context.c */
>  void i915_gem_init__contexts(struct drm_i915_private *i915);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 94c03a97cb77..1aa2290aa3c7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -301,6 +301,7 @@ struct i915_gem_context {
>  #define UCONTEXT_BANNABLE		2
>  #define UCONTEXT_RECOVERABLE		3
>  #define UCONTEXT_PERSISTENCE		4
> +#define UCONTEXT_PROTECTED		5
>  
>  	/**
>  	 * @flags: small set of booleans
> @@ -308,6 +309,7 @@ struct i915_gem_context {
>  	unsigned long flags;
>  #define CONTEXT_CLOSED			0
>  #define CONTEXT_USER_ENGINES		1
> +#define CONTEXT_INVALID			2
>  
>  	/** @mutex: guards everything that isn't engines or handles_vma */
>  	struct mutex mutex;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 51f92e4b1a69..fc6c211815b8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -6,6 +6,7 @@
>  #include "gem/i915_gem_ioctls.h"
>  #include "gem/i915_gem_lmem.h"
>  #include "gem/i915_gem_region.h"
> +#include "pxp/intel_pxp.h"
>  
>  #include "i915_drv.h"
>  #include "i915_trace.h"
> @@ -96,7 +97,11 @@ i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
>  
>  	GEM_BUG_ON(size != obj->base.size);
>  
> +	if (obj->user_flags & I915_GEM_OBJECT_PROTECTED)
> +		intel_pxp_object_add(obj);
> +
>  	trace_i915_gem_object_create(obj);
> +
>  	return 0;
>  }
>  
> @@ -341,8 +346,29 @@ static int ext_set_placements(struct i915_user_extension __user *base,
>  	return set_placements(&ext, data);
>  }
>  
> +static int ext_set_protected(struct i915_user_extension __user *base, void *data)
> +{
> +	struct drm_i915_gem_create_ext_protected_content ext;
> +	struct create_ext *ext_data = data;
> +
> +	if (copy_from_user(&ext, base, sizeof(ext)))
> +		return -EFAULT;
> +
> +	if (ext.flags)
> +		return -EINVAL;
> +
> +	if (!intel_pxp_is_enabled(&ext_data->i915->gt.pxp))
> +		return -ENODEV;
> +
> +	ext_data->vanilla_object->user_flags |= I915_GEM_OBJECT_PROTECTED;
> +
> +	return 0;
> +}
> +
> +
>  static const i915_user_extension_fn create_extensions[] = {
>  	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
> +	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 5ea8b4e23e42..f8bf74a1a392 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -21,6 +21,8 @@
>  #include "gt/intel_gt_pm.h"
>  #include "gt/intel_ring.h"
>  
> +#include "pxp/intel_pxp.h"
> +
>  #include "i915_drv.h"
>  #include "i915_gem_clflush.h"
>  #include "i915_gem_context.h"
> @@ -753,6 +755,11 @@ static int eb_select_context(struct i915_execbuffer *eb)
>  	if (unlikely(IS_ERR(ctx)))
>  		return PTR_ERR(ctx);
>  
> +	if (i915_gem_context_invalidated(ctx)) {
> +		i915_gem_context_put(ctx);
> +		return -EACCES;
> +	}
> +
>  	eb->gem_context = ctx;
>  	if (rcu_access_pointer(ctx->vm))
>  		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
> @@ -821,7 +828,7 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
>  	do {
>  		struct drm_i915_gem_object *obj;
>  		struct i915_vma *vma;
> -		int err;
> +		int err = 0;
>  
>  		rcu_read_lock();
>  		vma = radix_tree_lookup(&eb->gem_context->handles_vma, handle);
> @@ -835,6 +842,26 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
>  		if (unlikely(!obj))
>  			return ERR_PTR(-ENOENT);
>  
> +		/*
> +		 * If the user has opted-in for protected-object tracking, make
> +		 * sure the object encryption can be used.
> +		 * We only need to do this when the object is first used with
> +		 * this context, because the context itself will be banned when
> +		 * the protected objects become invalid.
> +		 */
> +		if (i915_gem_context_uses_protected_content(eb->gem_context) &&
> +		    i915_gem_object_is_protected(obj)) {
> +			if (!intel_pxp_is_active(&vm->gt->pxp))
> +				err = -ENODEV;
> +			else if (!i915_gem_object_has_valid_protection(obj))
> +				err = -ENOEXEC;
> +
> +			if (err) {
> +				i915_gem_object_put(obj);
> +				return ERR_PTR(err);
> +			}
> +		}
> +
>  		vma = i915_vma_instance(obj, vm, NULL);
>  		if (IS_ERR(vma)) {
>  			i915_gem_object_put(obj);
> @@ -2953,6 +2980,17 @@ eb_select_engine(struct i915_execbuffer *eb)
>  
>  	intel_gt_pm_get(ce->engine->gt);
>  
> +	if (i915_gem_context_uses_protected_content(eb->gem_context)) {
> +		err = intel_pxp_wait_for_arb_start(&ce->engine->gt->pxp);
> +		if (err)
> +			goto err;
> +
> +		if (i915_gem_context_invalidated(eb->gem_context)) {
> +			err = -EACCES;
> +			goto err;
> +		}
> +	}
> +
>  	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>  		err = intel_context_alloc_state(ce);
>  		if (err)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 9da7b288b7ed..4e09ff8730da 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -25,6 +25,7 @@
>  #include <linux/sched/mm.h>
>  
>  #include "display/intel_frontbuffer.h"
> +#include "pxp/intel_pxp.h"
>  #include "i915_drv.h"
>  #include "i915_gem_clflush.h"
>  #include "i915_gem_context.h"
> @@ -77,6 +78,8 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
>  	INIT_LIST_HEAD(&obj->lut_list);
>  	spin_lock_init(&obj->lut_lock);
>  
> +	INIT_LIST_HEAD(&obj->pxp_link);
> +
>  	spin_lock_init(&obj->mmo.lock);
>  	obj->mmo.offsets = RB_ROOT;
>  
> @@ -235,6 +238,9 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
>  		spin_unlock(&obj->vma.lock);
>  	}
>  
> +	if (i915_gem_object_has_valid_protection(obj))
> +		intel_pxp_object_remove(obj);
> +
>  	__i915_gem_object_free_mmaps(obj);
>  
>  	GEM_BUG_ON(!list_empty(&obj->lut_list));
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 8be4fadeee48..d56487e1653b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -291,6 +291,18 @@ i915_gem_object_never_mmap(const struct drm_i915_gem_object *obj)
>  	return i915_gem_object_type_has(obj, I915_GEM_OBJECT_NO_MMAP);
>  }
>  
> +static inline bool
> +i915_gem_object_is_protected(const struct drm_i915_gem_object *obj)
> +{
> +	return obj->user_flags & I915_GEM_OBJECT_PROTECTED;
> +}
> +
> +static inline bool
> +i915_gem_object_has_valid_protection(const struct drm_i915_gem_object *obj)
> +{
> +	return i915_gem_object_is_protected(obj) && !list_empty(&obj->pxp_link);
> +}
> +
>  static inline bool
>  i915_gem_object_is_framebuffer(const struct drm_i915_gem_object *obj)
>  {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index ef3de2ae9723..c8fd862f06b3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -205,6 +205,11 @@ struct drm_i915_gem_object {
>  	} mmo;
>  
>  	I915_SELFTEST_DECLARE(struct list_head st_link);
> +	/**
> +	 * @user_flags: small set of booleans set by the user
> +	 */
> +	unsigned long user_flags;
> +#define I915_GEM_OBJECT_PROTECTED BIT(0)
>  
>  	unsigned long flags;
>  #define I915_BO_ALLOC_CONTIGUOUS BIT(0)
> @@ -351,6 +356,14 @@ struct drm_i915_gem_object {
>  		bool created:1;
>  	} ttm;
>  
> +	/*
> +	 * When the PXP session is invalidated, we need to mark all protected
> +	 * objects as invalid. To easily do so we add them all to a list. The
> +	 * presence on the list is used to check if the encryption is valid or
> +	 * not.
> +	 */
> +	struct list_head pxp_link;
> +
>  	/** Record of address bit 17 of each page at last unbind. */
>  	unsigned long *bit_17;
>  
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index b0c7edc10cc3..f418281e8c10 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -7,6 +7,7 @@
>  #include "intel_pxp_irq.h"
>  #include "intel_pxp_session.h"
>  #include "intel_pxp_tee.h"
> +#include "gem/i915_gem_context.h"
>  #include "gt/intel_context.h"
>  #include "i915_drv.h"
>  
> @@ -70,6 +71,9 @@ void intel_pxp_init(struct intel_pxp *pxp)
>  
>  	mutex_init(&pxp->tee_mutex);
>  
> +	spin_lock_init(&pxp->lock);
> +	INIT_LIST_HEAD(&pxp->protected_objects);
> +
>  	/*
>  	 * we'll use the completion to check if there is a termination pending,
>  	 * so we start it as completed and we reinit it when a termination
> @@ -166,3 +170,88 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp)
>  
>  	intel_pxp_irq_disable(pxp);
>  }
> +
> +int intel_pxp_object_add(struct drm_i915_gem_object *obj)
> +{
> +	struct intel_pxp *pxp = &to_i915(obj->base.dev)->gt.pxp;
> +
> +	if (!intel_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	if (!list_empty(&obj->pxp_link))
> +		return -EEXIST;
> +
> +	spin_lock_irq(&pxp->lock);
> +	list_add(&obj->pxp_link, &pxp->protected_objects);
> +	spin_unlock_irq(&pxp->lock);
> +
> +	return 0;
> +}
> +
> +void intel_pxp_object_remove(struct drm_i915_gem_object *obj)
> +{
> +	struct intel_pxp *pxp = &to_i915(obj->base.dev)->gt.pxp;
> +
> +	if (!intel_pxp_is_enabled(pxp))
> +		return;
> +
> +	spin_lock_irq(&pxp->lock);
> +	list_del_init(&obj->pxp_link);
> +	spin_unlock_irq(&pxp->lock);
> +}
> +
> +void intel_pxp_invalidate(struct intel_pxp *pxp)
> +{
> +	struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
> +	struct drm_i915_gem_object *obj, *tmp;
> +	struct i915_gem_context *ctx, *cn;
> +
> +	/* delete objects that have been used with the invalidated session */
> +	spin_lock_irq(&pxp->lock);
> +	list_for_each_entry_safe(obj, tmp, &pxp->protected_objects, pxp_link) {
> +		if (i915_gem_object_has_pages(obj))
> +			list_del_init(&obj->pxp_link);
> +	}
> +	spin_unlock_irq(&pxp->lock);
> +
> +	/* ban all contexts marked as protected */
> +	spin_lock_irq(&i915->gem.contexts.lock);
> +	list_for_each_entry_safe(ctx, cn, &i915->gem.contexts.list, link) {
> +		struct i915_gem_engines_iter it;
> +		struct intel_context *ce;
> +
> +		if (!kref_get_unless_zero(&ctx->ref))
> +			continue;
> +
> +		if (likely(!i915_gem_context_uses_protected_content(ctx)) ||
> +		    i915_gem_context_invalidated(ctx)) {
> +			i915_gem_context_put(ctx);
> +			continue;
> +		}
> +
> +		spin_unlock_irq(&i915->gem.contexts.lock);
> +
> +		/*
> +		 * Note that by the time we get here the HW keys are already
> +		 * long gone, so any batch using them that's already on the
> +		 * engines is very likely a lost cause (and it has probably
> +		 * already hung the engine). Therefore, we skip attempting to
> +		 * pull the running context out of the HW and we prioritize
> +		 * bringing the session back as soon as possible.
> +		 */
> +		for_each_gem_engine(ce, i915_gem_context_lock_engines(ctx), it) {
> +			/* only invalidate if at least one ce was allocated */
> +			if (test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
> +				intel_context_set_banned(ce);
> +				i915_gem_context_set_invalid(ctx);
> +			}
> +		}
> +		i915_gem_context_unlock_engines(ctx);
> +
> +		spin_lock_irq(&i915->gem.contexts.lock);
> +		list_safe_reset_next(ctx, cn, link);
> +		i915_gem_context_put(ctx);
> +	}
> +	spin_unlock_irq(&i915->gem.contexts.lock);
> +}
> +
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> index 074b3b980957..4f7647f34153 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -9,6 +9,8 @@
>  #include "gt/intel_gt_types.h"
>  #include "intel_pxp_types.h"
>  
> +struct drm_i915_gem_object;
> +
>  static inline struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
>  {
>  	return container_of(pxp, struct intel_gt, pxp);
> @@ -33,6 +35,11 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
>  
>  void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
>  int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp);
> +
> +int intel_pxp_object_add(struct drm_i915_gem_object *obj);
> +void intel_pxp_object_remove(struct drm_i915_gem_object *obj);
> +
> +void intel_pxp_invalidate(struct intel_pxp *pxp);
>  #else
>  static inline void intel_pxp_init(struct intel_pxp *pxp)
>  {
> @@ -46,6 +53,14 @@ static inline int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
>  {
>  	return 0;
>  }
> +
> +static inline int intel_pxp_object_add(struct drm_i915_gem_object *obj)
> +{
> +	return 0;
> +}
> +static inline void intel_pxp_object_remove(struct drm_i915_gem_object *obj)
> +{
> +}
>  #endif
>  
>  #endif /* __INTEL_PXP_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index 67c30e534d50..0edd563a653d 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -85,6 +85,9 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>  	/* must mark termination in progress calling this function */
>  	GEM_WARN_ON(pxp->arb_is_valid);
>  
> +	/* invalidate protected objects */
> +	intel_pxp_invalidate(pxp);
> +
>  	/* terminate the hw sessions */
>  	ret = intel_pxp_terminate_session(pxp, ARB_SESSION);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index 475e3312c287..be2bed3a2e4e 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -7,7 +7,9 @@
>  #define __INTEL_PXP_TYPES_H__
>  
>  #include <linux/completion.h>
> +#include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/spinlock.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  
> @@ -43,6 +45,9 @@ struct intel_pxp {
>  	u32 session_events; /* protected with gt->irq_lock */
>  #define PXP_TERMINATION_REQUEST  BIT(0)
>  #define PXP_TERMINATION_COMPLETE BIT(1)
> +
> +	spinlock_t lock; /* protects the objects list */
> +	struct list_head protected_objects;
>  };
>  
>  #endif /* __INTEL_PXP_TYPES_H__ */
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 5296e4f77e0a..8b06d7742114 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1761,12 +1761,32 @@ struct drm_i915_gem_context_param {
>   * attempted to use it, never re-use this context param number.
>   */
>  #define I915_CONTEXT_PARAM_RINGSIZE	0xc
> +
> +/*
> + * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
> + *
> + * Mark that the context makes use of protected content, which will result
> + * in the context being invalidated when the protected content session is. The
> + * invalidation is reported back to userspace via the RESET_STATS ioctl (see
> + * relevant doc for details).
> + * This flag can only be set at context creation time and, when set to true,
> + * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECOVERABLE
> + * to false. This flag can't be set to true in conjunction with setting the
> + * I915_CONTEXT_PARAM_BANNABLE flag to false.
> + *
> + * In addition to the normal failure cases, setting this flag during context
> + * creation can result in the following errors:
> + *
> + * -ENODEV: feature not available
> + * -EPERM: trying to mark a recoverable or not bannable context as protected
> + */
> +#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
>  /* Must be kept compact -- no holes and well documented */
>  
>  	__u64 value;
>  };
>  
> -/*
> +/**
>   * Context SSEU programming
>   *
>   * It may be necessary for either functional or performance reason to configure
> @@ -2099,6 +2119,12 @@ struct drm_i915_reg_read {
>  struct drm_i915_reset_stats {
>  	__u32 ctx_id;
>  	__u32 flags;
> +	/*
> +	 * contexts marked as using protected content are invalidated when the
> +	 * protected content session dies. Submission of invalidated contexts
> +	 * is rejected with -EACCES.
> +	 */
> +#define I915_CONTEXT_INVALIDATED 0x1
>  
>  	/* All resets since boot/module reload, for all contexts */
>  	__u32 reset_count;
> @@ -2839,8 +2865,12 @@ struct drm_i915_gem_create_ext {
>  	 *
>  	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
>  	 * struct drm_i915_gem_create_ext_memory_regions.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
> +	 * struct drm_i915_gem_create_ext_protected_content.
>  	 */
>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>  	__u64 extensions;
>  };
>  
> @@ -2898,6 +2928,29 @@ struct drm_i915_gem_create_ext_memory_regions {
>  	__u64 regions;
>  };
>  
> +/**
> + * struct drm_i915_gem_create_ext_protected_content - The
> + * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
> + *
> + * If this extension is provided, buffer contents are expected to be protected
> + * by PXP encryption and require decryption for scan out and processing. This
> + * is only possible on platforms that have PXP enabled, on all other scenarios
> + * using this extension will cause the ioctl to fail and return -ENODEV. The
> + * flags parameter is reserved for future expansion and must currently be set
> + * to zero.
> + *
> + * The buffer contents are considered invalid after a PXP session teardown.
> + *
> + * The encryption is guaranteed to be processed correctly only if the object
> + * is submitted with a context created using the
> + * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable extra checks
> + * at submission time on the validity of the objects involved.
> + */
> +struct drm_i915_gem_create_ext_protected_content {
> +	struct i915_user_extension base;
> +	__u32 flags;
> +};
> +
>  /* ID of the protected content session managed by i915 when PXP is active */
>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>  
> -- 
> 2.32.0
> 
