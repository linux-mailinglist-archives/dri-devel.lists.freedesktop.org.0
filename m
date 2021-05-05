Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9037385A
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 12:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8049E89D61;
	Wed,  5 May 2021 10:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9002892B1;
 Wed,  5 May 2021 10:09:17 +0000 (UTC)
IronPort-SDR: mJyr81ABPs8sXOW9uGyXLRsUBUCCsxrYt68M3c8lYB/eYIf+kVVdvTVcARLCe8SwJWGH/K+qhQ
 D4GreSwqCmzA==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="196138337"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="196138337"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 03:09:17 -0700
IronPort-SDR: aRjV7kWLT486c9EjPt9k0LrFL+i4sXqgRCb2XoQcWf5xJmbzcX611JXkxqtCfnih8+ObzKIB5A
 W0TL7qVOLmzQ==
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; d="scan'208";a="463803463"
Received: from pgcarton-mobl1.ger.corp.intel.com (HELO [10.213.195.12])
 ([10.213.195.12])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 03:09:16 -0700
Subject: Re: [Intel-gfx] [PATCH 16/27] drm/i915/gem: Add an intermediate
 proto_context struct
To: Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-17-jason@jlekstrand.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <edfac38a-81ba-2b1b-08ef-ab1870125e3b@linux.intel.com>
Date: Wed, 5 May 2021 11:09:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503155748.1961781-17-jason@jlekstrand.net>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/05/2021 16:57, Jason Ekstrand wrote:
> The current context uAPI allows for two methods of setting context
> parameters: SET_CONTEXT_PARAM and CONTEXT_CREATE_EXT_SETPARAM.  The
> former is allowed to be called at any time while the later happens as
> part of GEM_CONTEXT_CREATE.  Currently, everything settable via one is
> settable via the other.  While some params are fairly simple and setting
> them on a live context is harmless such the context priority, others are
> far trickier such as the VM or the set of engines.  In order to swap out
> the VM, for instance, we have to delay until all current in-flight work
> is complete, swap in the new VM, and then continue.  This leads to a
> plethora of potential race conditions we'd really rather avoid.
> 
> Unfortunately, both methods of setting the VM and engine set are in
> active use today so we can't simply disallow setting the VM or engine
> set vial SET_CONTEXT_PARAM.  In order to work around this wart, this
> commit adds a proto-context struct which contains all the context create
> parameters.

The detailed commentary from "drm/i915/gem: Delay context creation" 
would be useful at this point in the series so it is known what this 
patch tries to do.

For the record, again, my opinion is that from here in the series 
onwards (mostly), there is a negative cost-benefit ratio and most 
certainly isn't something which should be rammed quickly in without a 
consensus.

Regards,

Tvrtko

> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 145 ++++++++++++++----
>   .../gpu/drm/i915/gem/i915_gem_context_types.h |  22 +++
>   .../gpu/drm/i915/gem/selftests/mock_context.c |  16 +-
>   3 files changed, 153 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 4835991898ac9..10bd1b6dd1774 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -191,6 +191,97 @@ static int validate_priority(struct drm_i915_private *i915,
>   	return 0;
>   }
>   
> +static void proto_context_close(struct i915_gem_proto_context *pc)
> +{
> +	if (pc->vm)
> +		i915_vm_put(pc->vm);
> +	kfree(pc);
> +}
> +
> +static int proto_context_set_persistence(struct drm_i915_private *i915,
> +					 struct i915_gem_proto_context *pc,
> +					 bool persist)
> +{
> +	if (persist) {
> +		/*
> +		 * Only contexts that are short-lived [that will expire or be
> +		 * reset] are allowed to survive past termination. We require
> +		 * hangcheck to ensure that the persistent requests are healthy.
> +		 */
> +		if (!i915->params.enable_hangcheck)
> +			return -EINVAL;
> +
> +		__set_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);
> +	} else {
> +		/* To cancel a context we use "preempt-to-idle" */
> +		if (!(i915->caps.scheduler & I915_SCHEDULER_CAP_PREEMPTION))
> +			return -ENODEV;
> +
> +		/*
> +		 * If the cancel fails, we then need to reset, cleanly!
> +		 *
> +		 * If the per-engine reset fails, all hope is lost! We resort
> +		 * to a full GPU reset in that unlikely case, but realistically
> +		 * if the engine could not reset, the full reset does not fare
> +		 * much better. The damage has been done.
> +		 *
> +		 * However, if we cannot reset an engine by itself, we cannot
> +		 * cleanup a hanging persistent context without causing
> +		 * colateral damage, and we should not pretend we can by
> +		 * exposing the interface.
> +		 */
> +		if (!intel_has_reset_engine(&i915->gt))
> +			return -ENODEV;
> +
> +		__clear_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct i915_gem_proto_context *
> +proto_context_create(struct drm_i915_private *i915, unsigned int flags)
> +{
> +	struct i915_gem_proto_context *pc, *err;
> +
> +	pc = kzalloc(sizeof(*pc), GFP_KERNEL);
> +	if (!pc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (HAS_FULL_PPGTT(i915)) {
> +		struct i915_ppgtt *ppgtt;
> +
> +		ppgtt = i915_ppgtt_create(&i915->gt);
> +		if (IS_ERR(ppgtt)) {
> +			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
> +				PTR_ERR(ppgtt));
> +			err = ERR_CAST(ppgtt);
> +			goto proto_close;
> +		}
> +		pc->vm = &ppgtt->vm;
> +	}
> +
> +	pc->user_flags = 0;
> +	__set_bit(UCONTEXT_BANNABLE, &pc->user_flags);
> +	__set_bit(UCONTEXT_RECOVERABLE, &pc->user_flags);
> +	proto_context_set_persistence(i915, pc, true);
> +	pc->sched.priority = I915_PRIORITY_NORMAL;
> +
> +	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> +		if (!HAS_EXECLISTS(i915)) {
> +			err = ERR_PTR(-EINVAL);
> +			goto proto_close;
> +		}
> +		pc->single_timeline = true;
> +	}
> +
> +	return pc;
> +
> +proto_close:
> +	proto_context_close(pc);
> +	return err;
> +}
> +
>   static struct i915_address_space *
>   context_get_vm_rcu(struct i915_gem_context *ctx)
>   {
> @@ -660,7 +751,8 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
>   }
>   
>   static struct i915_gem_context *
> -__create_context(struct drm_i915_private *i915)
> +__create_context(struct drm_i915_private *i915,
> +		 const struct i915_gem_proto_context *pc)
>   {
>   	struct i915_gem_context *ctx;
>   	struct i915_gem_engines *e;
> @@ -673,7 +765,7 @@ __create_context(struct drm_i915_private *i915)
>   
>   	kref_init(&ctx->ref);
>   	ctx->i915 = i915;
> -	ctx->sched.priority = I915_PRIORITY_NORMAL;
> +	ctx->sched = pc->sched;
>   	mutex_init(&ctx->mutex);
>   	INIT_LIST_HEAD(&ctx->link);
>   
> @@ -696,9 +788,7 @@ __create_context(struct drm_i915_private *i915)
>   	 * is no remap info, it will be a NOP. */
>   	ctx->remap_slice = ALL_L3_SLICES(i915);
>   
> -	i915_gem_context_set_bannable(ctx);
> -	i915_gem_context_set_recoverable(ctx);
> -	__context_set_persistence(ctx, true /* cgroup hook? */);
> +	ctx->user_flags = pc->user_flags;
>   
>   	for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
>   		ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
> @@ -786,38 +876,23 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
>   }
>   
>   static struct i915_gem_context *
> -i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> +i915_gem_create_context(struct drm_i915_private *i915,
> +			const struct i915_gem_proto_context *pc)
>   {
>   	struct i915_gem_context *ctx;
>   	int ret;
>   
> -	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
> -	    !HAS_EXECLISTS(i915))
> -		return ERR_PTR(-EINVAL);
> -
> -	ctx = __create_context(i915);
> +	ctx = __create_context(i915, pc);
>   	if (IS_ERR(ctx))
>   		return ctx;
>   
> -	if (HAS_FULL_PPGTT(i915)) {
> -		struct i915_ppgtt *ppgtt;
> -
> -		ppgtt = i915_ppgtt_create(&i915->gt);
> -		if (IS_ERR(ppgtt)) {
> -			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
> -				PTR_ERR(ppgtt));
> -			context_close(ctx);
> -			return ERR_CAST(ppgtt);
> -		}
> -
> +	if (pc->vm) {
>   		mutex_lock(&ctx->mutex);
> -		__assign_ppgtt(ctx, &ppgtt->vm);
> +		__assign_ppgtt(ctx, pc->vm);
>   		mutex_unlock(&ctx->mutex);
> -
> -		i915_vm_put(&ppgtt->vm);
>   	}
>   
> -	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> +	if (pc->single_timeline) {
>   		ret = drm_syncobj_create(&ctx->syncobj,
>   					 DRM_SYNCOBJ_CREATE_SIGNALED,
>   					 NULL);
> @@ -883,6 +958,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
>   			  struct drm_file *file)
>   {
>   	struct drm_i915_file_private *file_priv = file->driver_priv;
> +	struct i915_gem_proto_context *pc;
>   	struct i915_gem_context *ctx;
>   	int err;
>   	u32 id;
> @@ -892,7 +968,14 @@ int i915_gem_context_open(struct drm_i915_private *i915,
>   	/* 0 reserved for invalid/unassigned ppgtt */
>   	xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
>   
> -	ctx = i915_gem_create_context(i915, 0);
> +	pc = proto_context_create(i915, 0);
> +	if (IS_ERR(pc)) {
> +		err = PTR_ERR(pc);
> +		goto err;
> +	}
> +
> +	ctx = i915_gem_create_context(i915, pc);
> +	proto_context_close(pc);
>   	if (IS_ERR(ctx)) {
>   		err = PTR_ERR(ctx);
>   		goto err;
> @@ -1885,6 +1968,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct drm_i915_private *i915 = to_i915(dev);
>   	struct drm_i915_gem_context_create_ext *args = data;
> +	struct i915_gem_proto_context *pc;
>   	struct create_ext ext_data;
>   	int ret;
>   	u32 id;
> @@ -1907,7 +1991,12 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>   		return -EIO;
>   	}
>   
> -	ext_data.ctx = i915_gem_create_context(i915, args->flags);
> +	pc = proto_context_create(i915, args->flags);
> +	if (IS_ERR(pc))
> +		return PTR_ERR(pc);
> +
> +	ext_data.ctx = i915_gem_create_context(i915, pc);
> +	proto_context_close(pc);
>   	if (IS_ERR(ext_data.ctx))
>   		return PTR_ERR(ext_data.ctx);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 5f0673a2129f9..0bf337b6d89ac 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -66,6 +66,28 @@ struct i915_gem_engines_iter {
>   	const struct i915_gem_engines *engines;
>   };
>   
> +/**
> + * struct i915_gem_proto_context - prototype context
> + *
> + * The struct i915_gem_proto_context represents the creation parameters for
> + * an i915_gem_context.  This is used to gather parameters provided either
> + * through creation flags or via SET_CONTEXT_PARAM so that, when we create
> + * the final i915_gem_context, those parameters can be immutable.
> + */
> +struct i915_gem_proto_context {
> +	/** @vm: See i915_gem_context::vm */
> +	struct i915_address_space *vm;
> +
> +	/** @user_flags: See i915_gem_context::user_flags */
> +	unsigned long user_flags;
> +
> +	/** @sched: See i915_gem_context::sched */
> +	struct i915_sched_attr sched;
> +
> +	/** @single_timeline: See See i915_gem_context::syncobj */
> +	bool single_timeline;
> +};
> +
>   /**
>    * struct i915_gem_context - client state
>    *
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> index 51b5a3421b400..e0f512ef7f3c6 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -80,11 +80,17 @@ void mock_init_contexts(struct drm_i915_private *i915)
>   struct i915_gem_context *
>   live_context(struct drm_i915_private *i915, struct file *file)
>   {
> +	struct i915_gem_proto_context *pc;
>   	struct i915_gem_context *ctx;
>   	int err;
>   	u32 id;
>   
> -	ctx = i915_gem_create_context(i915, 0);
> +	pc = proto_context_create(i915, 0);
> +	if (IS_ERR(pc))
> +		return ERR_CAST(pc);
> +
> +	ctx = i915_gem_create_context(i915, pc);
> +	proto_context_close(pc);
>   	if (IS_ERR(ctx))
>   		return ctx;
>   
> @@ -142,8 +148,14 @@ struct i915_gem_context *
>   kernel_context(struct drm_i915_private *i915)
>   {
>   	struct i915_gem_context *ctx;
> +	struct i915_gem_proto_context *pc;
> +
> +	pc = proto_context_create(i915, 0);
> +	if (IS_ERR(pc))
> +		return ERR_CAST(pc);
>   
> -	ctx = i915_gem_create_context(i915, 0);
> +	ctx = i915_gem_create_context(i915, pc);
> +	proto_context_close(pc);
>   	if (IS_ERR(ctx))
>   		return ctx;
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
