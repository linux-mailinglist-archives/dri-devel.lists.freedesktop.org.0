Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060C836EEDD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 19:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE076F40A;
	Thu, 29 Apr 2021 17:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96446F40A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 17:25:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x7so67664683wrw.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=x6jlCjsarGCwU4nVz2a7ALIF2olfrtcXPSdUohqVl3o=;
 b=RyPMCVBgnyzh8M0FnnlsJPHn4zdb8eGGrBBdvmZtlFagXX0NtMpw0rc/wkL/r9E78b
 E426BpbBa8FSPNdns0NJhdsoWwB+HI5azGhxENpdfEgyLSZW3SjmMsDU4kskbxxyPLmS
 oHlnshaEzygUiXFQ9T6lZL+oxsim3csMpqJRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x6jlCjsarGCwU4nVz2a7ALIF2olfrtcXPSdUohqVl3o=;
 b=XAa/6AxiaF9+1Mumk5BMKdE11OIikiHwS76P3un69/43j5IAOArw7yq+o4RXP7tO8e
 5/jJs/OwHA8ahvGFLN4Mk3nUsc7x5XeYhWkPJGFwbSkVFqFFghlA+K0Ld2LdezO7Qg+D
 7EQ9B0DssQMarDQgU+xmUSwMiBc+vR6FoFnfHopaXJJE27rRB0ghX4QqkcZgdWYzkKZJ
 tBNaskHeC4Z70FMDKceBl3tq/yim6Nxmf3XMOItIH//LbvmPr66WiVscnFx5LDK//AH0
 RaH/kZqdZyVnjrrsh0S7/jFkVvkP0/N3JC/abzhDkTU+N/HOAn5dRpnbGVX3DweoZjxe
 VobQ==
X-Gm-Message-State: AOAM530EuGYYu8/hqGZlfK2C/bJsXu+spk4Sw8zj61YCoZQMzMcFg9OI
 SMyqFSbdaSF2qSFdBMq7ml5a1A==
X-Google-Smtp-Source: ABdhPJy32oTb7eznrU2erG0npVQg/eLhLOV0rNrxlvDNX+HXgxo3wlPldmtVfSarRsjDK1Md9MzCiw==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr921873wrq.321.1619717116310; 
 Thu, 29 Apr 2021 10:25:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t63sm701438wma.20.2021.04.29.10.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 10:25:15 -0700 (PDT)
Date: Thu, 29 Apr 2021 19:25:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 21/21] drm/i915/gem: Roll all of context creation together
Message-ID: <YIrr+g0zNwYKpH18@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-22-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-22-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 05:31:31PM -0500, Jason Ekstrand wrote:
> Now that we have the whole engine set and VM at context creation time,
> we can just assign those fields instead of creating first and handling
> the VM and engines later.  This lets us avoid creating useless VMs and
> engine sets and lets us git rid of the complex VM setting code.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

I think for ocd reasons it would be nice to split this up into the engine
and vm cleanups and sort in with the corresponding prep patch.

It does all look pretty reasonable though. I'll review the details in
these later patches in the series once we've agreed on the big picture
shuffling.
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 159 ++++++------------
>  .../gpu/drm/i915/gem/selftests/mock_context.c |  33 ++--
>  2 files changed, 64 insertions(+), 128 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index ef23ab4260c24..829730d402e8a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1201,56 +1201,6 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
>  	return 0;
>  }
>  
> -static struct i915_gem_context *
> -__create_context(struct drm_i915_private *i915,
> -		 const struct i915_gem_proto_context *pc)
> -{
> -	struct i915_gem_context *ctx;
> -	struct i915_gem_engines *e;
> -	int err;
> -	int i;
> -
> -	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> -	if (!ctx)
> -		return ERR_PTR(-ENOMEM);
> -
> -	kref_init(&ctx->ref);
> -	ctx->i915 = i915;
> -	ctx->sched = pc->sched;
> -	mutex_init(&ctx->mutex);
> -	INIT_LIST_HEAD(&ctx->link);
> -
> -	spin_lock_init(&ctx->stale.lock);
> -	INIT_LIST_HEAD(&ctx->stale.engines);
> -
> -	mutex_init(&ctx->engines_mutex);
> -	e = default_engines(ctx);
> -	if (IS_ERR(e)) {
> -		err = PTR_ERR(e);
> -		goto err_free;
> -	}
> -	RCU_INIT_POINTER(ctx->engines, e);
> -
> -	INIT_RADIX_TREE(&ctx->handles_vma, GFP_KERNEL);
> -	mutex_init(&ctx->lut_mutex);
> -
> -	/* NB: Mark all slices as needing a remap so that when the context first
> -	 * loads it will restore whatever remap state already exists. If there
> -	 * is no remap info, it will be a NOP. */
> -	ctx->remap_slice = ALL_L3_SLICES(i915);
> -
> -	ctx->user_flags = pc->user_flags;
> -
> -	for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
> -		ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
> -
> -	return ctx;
> -
> -err_free:
> -	kfree(ctx);
> -	return ERR_PTR(err);
> -}
> -
>  static inline struct i915_gem_engines *
>  __context_engines_await(const struct i915_gem_context *ctx,
>  			bool *user_engines)
> @@ -1294,86 +1244,77 @@ context_apply_all(struct i915_gem_context *ctx,
>  	i915_sw_fence_complete(&e->fence);
>  }
>  
> -static void __apply_ppgtt(struct intel_context *ce, void *vm)
> -{
> -	i915_vm_put(ce->vm);
> -	ce->vm = i915_vm_get(vm);
> -}
> -
> -static struct i915_address_space *
> -__set_ppgtt(struct i915_gem_context *ctx, struct i915_address_space *vm)
> -{
> -	struct i915_address_space *old;
> -
> -	old = rcu_replace_pointer(ctx->vm,
> -				  i915_vm_open(vm),
> -				  lockdep_is_held(&ctx->mutex));
> -	GEM_BUG_ON(old && i915_vm_is_4lvl(vm) != i915_vm_is_4lvl(old));
> -
> -	context_apply_all(ctx, __apply_ppgtt, vm);
> -
> -	return old;
> -}
> -
> -static void __assign_ppgtt(struct i915_gem_context *ctx,
> -			   struct i915_address_space *vm)
> -{
> -	if (vm == rcu_access_pointer(ctx->vm))
> -		return;
> -
> -	vm = __set_ppgtt(ctx, vm);
> -	if (vm)
> -		i915_vm_close(vm);
> -}
> -
>  static struct i915_gem_context *
>  i915_gem_create_context(struct drm_i915_private *i915,
>  			const struct i915_gem_proto_context *pc)
>  {
>  	struct i915_gem_context *ctx;
> -	int ret;
> +	struct i915_gem_engines *e;
> +	int err;
> +	int i;
>  
> -	ctx = __create_context(i915, pc);
> -	if (IS_ERR(ctx))
> -		return ctx;
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
>  
> -	if (pc->vm) {
> -		mutex_lock(&ctx->mutex);
> -		__assign_ppgtt(ctx, pc->vm);
> -		mutex_unlock(&ctx->mutex);
> -	}
> +	kref_init(&ctx->ref);
> +	ctx->i915 = i915;
> +	ctx->sched = pc->sched;
> +	mutex_init(&ctx->mutex);
> +	INIT_LIST_HEAD(&ctx->link);
>  
> -	if (pc->num_user_engines >= 0) {
> -		struct i915_gem_engines *engines;
> +	spin_lock_init(&ctx->stale.lock);
> +	INIT_LIST_HEAD(&ctx->stale.engines);
>  
> -		engines = user_engines(ctx, pc->num_user_engines,
> -				       pc->user_engines);
> -		if (IS_ERR(engines)) {
> -			context_close(ctx);
> -			return ERR_CAST(engines);
> -		}
> +	if (pc->vm)
> +		RCU_INIT_POINTER(ctx->vm, i915_vm_open(pc->vm));
>  
> -		mutex_lock(&ctx->engines_mutex);
> +	mutex_init(&ctx->engines_mutex);
> +	if (pc->num_user_engines >= 0) {
>  		i915_gem_context_set_user_engines(ctx);
> -		engines = rcu_replace_pointer(ctx->engines, engines, 1);
> -		mutex_unlock(&ctx->engines_mutex);
> -
> -		free_engines(engines);
> +		e = user_engines(ctx, pc->num_user_engines, pc->user_engines);
> +	} else {
> +		i915_gem_context_clear_user_engines(ctx);
> +		e = default_engines(ctx);
> +	}
> +	if (IS_ERR(e)) {
> +		err = PTR_ERR(e);
> +		goto err_vm;
>  	}
> +	RCU_INIT_POINTER(ctx->engines, e);
> +
> +	INIT_RADIX_TREE(&ctx->handles_vma, GFP_KERNEL);
> +	mutex_init(&ctx->lut_mutex);
> +
> +	/* NB: Mark all slices as needing a remap so that when the context first
> +	 * loads it will restore whatever remap state already exists. If there
> +	 * is no remap info, it will be a NOP. */
> +	ctx->remap_slice = ALL_L3_SLICES(i915);
> +
> +	ctx->user_flags = pc->user_flags;
> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
> +		ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
>  
>  	if (pc->single_timeline) {
> -		ret = drm_syncobj_create(&ctx->syncobj,
> +		err = drm_syncobj_create(&ctx->syncobj,
>  					 DRM_SYNCOBJ_CREATE_SIGNALED,
>  					 NULL);
> -		if (ret) {
> -			context_close(ctx);
> -			return ERR_PTR(ret);
> -		}
> +		if (err)
> +			goto err_engines;
>  	}
>  
>  	trace_i915_context_create(ctx);
>  
>  	return ctx;
> +
> +err_engines:
> +	free_engines(e);
> +err_vm:
> +	if (ctx->vm)
> +		i915_vm_close(ctx->vm);
> +	kfree(ctx);
> +	return ERR_PTR(err);
>  }
>  
>  static void init_contexts(struct i915_gem_contexts *gc)
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> index e4aced7eabb72..5ee7e9bb6175d 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -30,15 +30,6 @@ mock_context(struct drm_i915_private *i915,
>  
>  	i915_gem_context_set_persistence(ctx);
>  
> -	mutex_init(&ctx->engines_mutex);
> -	e = default_engines(ctx);
> -	if (IS_ERR(e))
> -		goto err_free;
> -	RCU_INIT_POINTER(ctx->engines, e);
> -
> -	INIT_RADIX_TREE(&ctx->handles_vma, GFP_KERNEL);
> -	mutex_init(&ctx->lut_mutex);
> -
>  	if (name) {
>  		struct i915_ppgtt *ppgtt;
>  
> @@ -46,25 +37,29 @@ mock_context(struct drm_i915_private *i915,
>  
>  		ppgtt = mock_ppgtt(i915, name);
>  		if (!ppgtt)
> -			goto err_put;
> -
> -		mutex_lock(&ctx->mutex);
> -		__set_ppgtt(ctx, &ppgtt->vm);
> -		mutex_unlock(&ctx->mutex);
> +			goto err_free;
>  
> +		ctx->vm = i915_vm_open(&ppgtt->vm);
>  		i915_vm_put(&ppgtt->vm);
>  	}
>  
> +	mutex_init(&ctx->engines_mutex);
> +	e = default_engines(ctx);
> +	if (IS_ERR(e))
> +		goto err_vm;
> +	RCU_INIT_POINTER(ctx->engines, e);
> +
> +	INIT_RADIX_TREE(&ctx->handles_vma, GFP_KERNEL);
> +	mutex_init(&ctx->lut_mutex);
> +
>  	return ctx;
>  
> +err_vm:
> +	if (ctx->vm)
> +		i915_vm_close(ctx->vm);
>  err_free:
>  	kfree(ctx);
>  	return NULL;
> -
> -err_put:
> -	i915_gem_context_set_closed(ctx);
> -	i915_gem_context_put(ctx);
> -	return NULL;
>  }
>  
>  void mock_context_close(struct i915_gem_context *ctx)
> -- 
> 2.31.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
