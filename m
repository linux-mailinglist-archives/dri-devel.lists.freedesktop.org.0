Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C3395FEA
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 16:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777BB6E18E;
	Mon, 31 May 2021 14:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0B46E4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 14:18:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n2so11161798wrm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 07:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9Y90GAy/qzhEjo4EyyWqBMSs4yVrz/tgr6sk/6Oef8Y=;
 b=VxOLoDTZ08Q5kAHAUTzDJF4ieerfDE5hjNpkOF0Ry61+QRzbq74kTiY+jyOmZZK0jB
 b0r06lIozAUgNH4gu8N3VHQfOiryng+zuMl2cUEI9sDwr1Xcwnz8H7eTMmZt990kB1O+
 uzYewnXExX4O/ISvTuSKbrL9dVtyvsXovIOFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9Y90GAy/qzhEjo4EyyWqBMSs4yVrz/tgr6sk/6Oef8Y=;
 b=csSvdrAa/UxYdtzeizX+Ke44MCFoj7DhJHAtNOT7uZssuplMwlvzxNJEdWATfGrb24
 UYWhtbAixySjXgdiK8Aowy8aidiGEqQ2BSwS0KQGIybyJuP7yXkX1XwGnHTCjf2nad5n
 zfbFxtnmvodUK+5JXmcyH7/eNkRfKATIdx5+FlWYMtYtEXbUBv6bmT3SqUDQI7vh4mV6
 MXhGHhkeS3rsMJZa5bUk44YPdL92a2y9vhdNKOBfIP9OZrIrYFxf2g6YVTFEW+05ezdt
 gblyc/MygZ1o4077OSLevcAfa724h/o5iIiYG+Ogppa2eLNkw/LAbaNPkXdBHO5HBcqn
 me8g==
X-Gm-Message-State: AOAM532yhkB64k0lD3gBvBUMnTna7sFPlAADRpUAo5r7FloFTqlaUEaw
 UlPBUnuJaS9HinrvyhHTbUO1Vlx+ZldAXg==
X-Google-Smtp-Source: ABdhPJxIvwSM89y7d18aVA+ZTiKsCQgYkivc568yrJpmIzZSbbh4gxdVmL/Z/lEPcWCdPvg6BDhVKA==
X-Received: by 2002:adf:8b9a:: with SMTP id o26mr12299206wra.96.1622470733910; 
 Mon, 31 May 2021 07:18:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j101sm18612300wrj.66.2021.05.31.07.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 07:18:53 -0700 (PDT)
Date: Mon, 31 May 2021 16:18:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 29/29] drm/i915/gem: Roll all of context
 creation together
Message-ID: <YLTwSzcnqNTRSXDD@phenom.ffwll.local>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
 <20210527162650.1182544-30-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527162650.1182544-30-jason@jlekstrand.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 11:26:50AM -0500, Jason Ekstrand wrote:
> Now that we have the whole engine set and VM at context creation time,
> we can just assign those fields instead of creating first and handling
> the VM and engines later.  This lets us avoid creating useless VMs and
> engine sets and lets us get rid of the complex VM setting code.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

On the last three patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Looking at the end result we still have the ctx->user_flags which are
muttable, and I think for again no reason at all. Especially for
persistence I think it'd be nice to have that immutable, since some of the
dedicated cleanup code for that is rather hairy.

But really also would be nice if the other 3 hang related flags would be
immutable too.

Anyway that's a separate thing for sure, since the big ones are clearly
the mutable vm/engines, and that's now gone.

Cheers!

I'll check with Zbyscek who cross-checks the revised igt coverage against
the revised uapi. And to avoid confusion like last round: I'll expect you
to ping me if you disagree on some or send out v6. Next round should
already come with r-b: me on all the patches (well one maybe I need to
check out again when you've moved the wrongly squashed hunk to the right
place).
-Daniel
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 159 ++++++------------
>  .../gpu/drm/i915/gem/selftests/mock_context.c |  33 ++--
>  2 files changed, 64 insertions(+), 128 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index e6a6ead477ff4..502a2bd1a043e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1298,56 +1298,6 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
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
> @@ -1391,86 +1341,77 @@ context_apply_all(struct i915_gem_context *ctx,
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
