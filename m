Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8F339575C
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 10:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761396E885;
	Mon, 31 May 2021 08:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6668933C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 08:48:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q5so10079985wrs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 01:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2CyEtiSZMU1Z37NWnBi1E9CcNms0KHCapL7RdGmP/Jk=;
 b=eEd6rA53vJYvlM0sP3zes5ysh8iMP36eGYnYbmrbnsdoz6+CTCdjh7Oep+27xR8EyK
 J5rLIxUGQiFTg1POFwRV2aNC16KvG32mwhdsupK90LV7Nj2EYXE8dwsWV4uu5rcpnMad
 /b/5an8RVXBvB9Q5uHzi5JdZDYTcEqlhr0phg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2CyEtiSZMU1Z37NWnBi1E9CcNms0KHCapL7RdGmP/Jk=;
 b=TVx4rNjLCWvxHYMPrCk2yTrLlLQvfBazwtUpWVhLzvkl/qXmQ6m077sp2mO2+cKc+d
 biK/sOzWNKsVqZcghSnmOGl7ItH0qYXzWZR6boL4f8xS/wtb+ycV6NJaW0kddbHmeNXq
 yvpdqM76fpp7UcHsb8NWrl3XLagoAB6KOxrZFY5xkPGNSJ9VyqwLoLGh7B4n9k4nXRT3
 drmvca+gD2MsICHJbd8UClfr28u7uLCjSApQLK1xOL9RxpxIG2tIUlcQE8gRX/movZhH
 NlmgqXlSC6iIseJrdByTciXDUNeFinTfRdRXmKzXU74bbaCCkI9YXbB98q7gTwucnLmM
 cNLw==
X-Gm-Message-State: AOAM530tvSwuBgnSAOQKhsh7P4bWUtYxN6rl7oX/2LiglcRqjQ8tPX9J
 Usa50pUz7PiG4ekUU/sEmZScAA==
X-Google-Smtp-Source: ABdhPJyXQFjgS0Qr4emuKdSj9zcK1WgOjqS2aFt22Jwnw4geq+oqJneWgPCe6dmznzO16Ohg+ejU1A==
X-Received: by 2002:adf:eac9:: with SMTP id o9mr5761479wrn.78.1622450924491;
 Mon, 31 May 2021 01:48:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v15sm22536808wmj.39.2021.05.31.01.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 01:48:44 -0700 (PDT)
Date: Mon, 31 May 2021 10:48:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 18/29] drm/i915/gem: Optionally set SSEU in
 intel_context_set_gem
Message-ID: <YLSi6uim1hlBxNug@phenom.ffwll.local>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
 <20210527162650.1182544-19-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527162650.1182544-19-jason@jlekstrand.net>
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

On Thu, May 27, 2021 at 11:26:39AM -0500, Jason Ekstrand wrote:
> For now this is a no-op because everyone passes in a null SSEU but it
> lets us get some of the error handling and selftest refactoring plumbed
> through.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

I've reviewed this one already in the previous round, did you change
anything that means I should re-review this here?
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 41 +++++++++++++++----
>  .../gpu/drm/i915/gem/selftests/mock_context.c |  6 ++-
>  2 files changed, 36 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index f8f3f514b4265..d247fb223aac7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -320,9 +320,12 @@ context_get_vm_rcu(struct i915_gem_context *ctx)
>  	} while (1);
>  }
>  
> -static void intel_context_set_gem(struct intel_context *ce,
> -				  struct i915_gem_context *ctx)
> +static int intel_context_set_gem(struct intel_context *ce,
> +				 struct i915_gem_context *ctx,
> +				 struct intel_sseu sseu)
>  {
> +	int ret = 0;
> +
>  	GEM_BUG_ON(rcu_access_pointer(ce->gem_context));
>  	RCU_INIT_POINTER(ce->gem_context, ctx);
>  
> @@ -349,6 +352,12 @@ static void intel_context_set_gem(struct intel_context *ce,
>  
>  		intel_context_set_watchdog_us(ce, (u64)timeout_ms * 1000);
>  	}
> +
> +	/* A valid SSEU has no zero fields */
> +	if (sseu.slice_mask && !WARN_ON(ce->engine->class != RENDER_CLASS))
> +		ret = intel_context_reconfigure_sseu(ce, sseu);
> +
> +	return ret;
>  }
>  
>  static void __free_engines(struct i915_gem_engines *e, unsigned int count)
> @@ -416,7 +425,8 @@ static struct i915_gem_engines *alloc_engines(unsigned int count)
>  	return e;
>  }
>  
> -static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
> +static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
> +						struct intel_sseu rcs_sseu)
>  {
>  	const struct intel_gt *gt = &ctx->i915->gt;
>  	struct intel_engine_cs *engine;
> @@ -429,6 +439,8 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
>  
>  	for_each_engine(engine, gt, id) {
>  		struct intel_context *ce;
> +		struct intel_sseu sseu = {};
> +		int ret;
>  
>  		if (engine->legacy_idx == INVALID_ENGINE)
>  			continue;
> @@ -442,10 +454,18 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
>  			goto free_engines;
>  		}
>  
> -		intel_context_set_gem(ce, ctx);
> -
>  		e->engines[engine->legacy_idx] = ce;
>  		e->num_engines = max(e->num_engines, engine->legacy_idx + 1);
> +
> +		if (engine->class == RENDER_CLASS)
> +			sseu = rcs_sseu;
> +
> +		ret = intel_context_set_gem(ce, ctx, sseu);
> +		if (ret) {
> +			err = ERR_PTR(ret);
> +			goto free_engines;
> +		}
> +
>  	}
>  
>  	return e;
> @@ -759,6 +779,7 @@ __create_context(struct drm_i915_private *i915,
>  {
>  	struct i915_gem_context *ctx;
>  	struct i915_gem_engines *e;
> +	struct intel_sseu null_sseu = {};
>  	int err;
>  	int i;
>  
> @@ -776,7 +797,7 @@ __create_context(struct drm_i915_private *i915,
>  	INIT_LIST_HEAD(&ctx->stale.engines);
>  
>  	mutex_init(&ctx->engines_mutex);
> -	e = default_engines(ctx);
> +	e = default_engines(ctx, null_sseu);
>  	if (IS_ERR(e)) {
>  		err = PTR_ERR(e);
>  		goto err_free;
> @@ -1543,6 +1564,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
>  	struct intel_engine_cs *stack[16];
>  	struct intel_engine_cs **siblings;
>  	struct intel_context *ce;
> +	struct intel_sseu null_sseu = {};
>  	u16 num_siblings, idx;
>  	unsigned int n;
>  	int err;
> @@ -1615,7 +1637,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
>  		goto out_siblings;
>  	}
>  
> -	intel_context_set_gem(ce, set->ctx);
> +	intel_context_set_gem(ce, set->ctx, null_sseu);
>  
>  	if (cmpxchg(&set->engines->engines[idx], NULL, ce)) {
>  		intel_context_put(ce);
> @@ -1723,6 +1745,7 @@ set_engines(struct i915_gem_context *ctx,
>  	struct drm_i915_private *i915 = ctx->i915;
>  	struct i915_context_param_engines __user *user =
>  		u64_to_user_ptr(args->value);
> +	struct intel_sseu null_sseu = {};
>  	struct set_engines set = { .ctx = ctx };
>  	unsigned int num_engines, n;
>  	u64 extensions;
> @@ -1732,7 +1755,7 @@ set_engines(struct i915_gem_context *ctx,
>  		if (!i915_gem_context_user_engines(ctx))
>  			return 0;
>  
> -		set.engines = default_engines(ctx);
> +		set.engines = default_engines(ctx, null_sseu);
>  		if (IS_ERR(set.engines))
>  			return PTR_ERR(set.engines);
>  
> @@ -1789,7 +1812,7 @@ set_engines(struct i915_gem_context *ctx,
>  			return PTR_ERR(ce);
>  		}
>  
> -		intel_context_set_gem(ce, ctx);
> +		intel_context_set_gem(ce, ctx, null_sseu);
>  
>  		set.engines->engines[n] = ce;
>  	}
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> index e0f512ef7f3c6..cbeefd060e97b 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -14,6 +14,7 @@ mock_context(struct drm_i915_private *i915,
>  {
>  	struct i915_gem_context *ctx;
>  	struct i915_gem_engines *e;
> +	struct intel_sseu null_sseu = {};
>  
>  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -31,7 +32,7 @@ mock_context(struct drm_i915_private *i915,
>  	i915_gem_context_set_persistence(ctx);
>  
>  	mutex_init(&ctx->engines_mutex);
> -	e = default_engines(ctx);
> +	e = default_engines(ctx, null_sseu);
>  	if (IS_ERR(e))
>  		goto err_free;
>  	RCU_INIT_POINTER(ctx->engines, e);
> @@ -112,6 +113,7 @@ live_context_for_engine(struct intel_engine_cs *engine, struct file *file)
>  {
>  	struct i915_gem_engines *engines;
>  	struct i915_gem_context *ctx;
> +	struct intel_sseu null_sseu = {};
>  	struct intel_context *ce;
>  
>  	engines = alloc_engines(1);
> @@ -130,7 +132,7 @@ live_context_for_engine(struct intel_engine_cs *engine, struct file *file)
>  		return ERR_CAST(ce);
>  	}
>  
> -	intel_context_set_gem(ce, ctx);
> +	intel_context_set_gem(ce, ctx, null_sseu);
>  	engines->engines[0] = ce;
>  	engines->num_engines = 1;
>  
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
