Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A5C373855
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 12:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D886E486;
	Wed,  5 May 2021 10:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996AA6E12A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 10:05:03 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id h10so1265495edt.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rZf4B47OKajzKb0F2hl7+FlEitre8D9irxRkLzEEMTY=;
 b=R/H9179To+Z/qMesWAUPvVDstj5lYVjg5xZ6ryUemEnv3WxzuawhyDMzj/uuX//s8p
 UE7egHK8RZBuWYk1Jp2MAaPVWzNByfWXr8XBs4PRa6+WI0cT/l/Q9SVMOC+vyqvMyZmf
 +JEiHj1KZ3UlPZTBXQc3wbf79YcTVe9EHDNVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rZf4B47OKajzKb0F2hl7+FlEitre8D9irxRkLzEEMTY=;
 b=RG0kBIvaUiVwFTs8Q5VQyB1/eTWzZ5wMNBg95rTZ+3F8Ed2x3gXTvudKPw/Px5BFMF
 g8096LoRcY8cDbSEXvtYNJu1qALsUaJ+GYWI641L2buRd1uhD6iW+ZZ9hpeCUm0cBdKM
 61vyR/7thI1KuPRid9GP12hXwufhADTpptdenTbuVo2rwzKA6FoFCTgCbDTgCI7iXPJf
 nXN1AxyP53biSocerbvRYQl5ez9G/1UB77ClXENw/Xom/CccsPuNRUFmGjwgS8MGet1/
 is85Seiy83rCiRaB4RILj/+pxCUWXZmm+m76BqjG9uDXfcmNNxvprbGq4Zc1Nq9Q5vgJ
 TaOQ==
X-Gm-Message-State: AOAM532LOWf6abGWy6uOgaAqP+UQdAtZxCzA90F6p7UQqwJrRYeYS8lF
 8TCVGlcUM7YNTYzt4m0exv82AA==
X-Google-Smtp-Source: ABdhPJyZllXdjLK8mN62y04hiqMFVDbhxvJtZJ9ovG+ik0ziVuCaMkDG1Ph3qHEGMXe9hLhS+mjghg==
X-Received: by 2002:a05:6402:254a:: with SMTP id
 l10mr31573551edb.145.1620209102203; 
 Wed, 05 May 2021 03:05:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id kx3sm2582357ejc.44.2021.05.05.03.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 03:05:01 -0700 (PDT)
Date: Wed, 5 May 2021 12:05:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 27/27] drm/i915/gem: Roll all of context
 creation together
Message-ID: <YJJtzL+Q86jY1fGH@phenom.ffwll.local>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-28-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503155748.1961781-28-jason@jlekstrand.net>
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

On Mon, May 03, 2021 at 10:57:48AM -0500, Jason Ekstrand wrote:
> Now that we have the whole engine set and VM at context creation time,
> we can just assign those fields instead of creating first and handling
> the VM and engines later.  This lets us avoid creating useless VMs and
> engine sets and lets us get rid of the complex VM setting code.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Ok here comes the cleanup around engine setup control flow and locking and
all that.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

So one thing I noticed that's still in the uapi bucket is that we now
still have all the ctx->user_flags as mutable. I think especially
persistence has a big impact on ctx cleanup, so would be nice if we can
make that one invariant. Recoverable/no_error_capture less so, and
bannable is kinda meh.

Did you look into how much it would be to lock these down too? We could
then split the muttable ones out into a ctx->mutable_user_flags or so and
only use atomic bitops for these.

Anyway the big items are the vm and engines, and that's taken care of now.
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 159 ++++++------------
>  .../gpu/drm/i915/gem/selftests/mock_context.c |  33 ++--
>  2 files changed, 64 insertions(+), 128 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 6e5828fe1a792..6bffb0e579b4e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1302,56 +1302,6 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
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
> -	e = default_engines(ctx, pc->legacy_rcs_sseu);
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
> @@ -1395,86 +1345,77 @@ context_apply_all(struct i915_gem_context *ctx,
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
> +		e = default_engines(ctx, pc->legacy_rcs_sseu);
>  	}
> +	if (IS_ERR(e)) {
> +		err = PTR_ERR(e);
> +		goto err_vm;
> +	}
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
> index 500ef27ba4771..fee070df1c97b 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -31,15 +31,6 @@ mock_context(struct drm_i915_private *i915,
>  
>  	i915_gem_context_set_persistence(ctx);
>  
> -	mutex_init(&ctx->engines_mutex);
> -	e = default_engines(ctx, null_sseu);
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
> @@ -47,25 +38,29 @@ mock_context(struct drm_i915_private *i915,
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
> +	e = default_engines(ctx, null_sseu);
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
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
