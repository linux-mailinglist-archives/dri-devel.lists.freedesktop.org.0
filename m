Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FF5373029
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 21:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059926EB5D;
	Tue,  4 May 2021 19:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB966EB5D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 19:00:46 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id u21so14772847ejo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 12:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=T/Jos64aRiMKcEoPsl6rc9URCNWvR86DLtLdh3wKsNo=;
 b=fjbd9j+cWf3fzDP1GQsxWPwklA2Rk38yZRQaEgikCtTZhTvzDD6WG7EWPK59Kjr6vK
 t+Za017U/QsCXcs1KAWyurDqfWy8ffi9jciGnLO5UU/4wTyKwpbMDOzM8zHKb+ifgVMR
 dcFE0FGPqd8WHMTDmwnty84IVyVoJpqc8LSWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T/Jos64aRiMKcEoPsl6rc9URCNWvR86DLtLdh3wKsNo=;
 b=GkRLPwt3N1asHsEzG7dWX4QOlyFK4pTvRtD0adWqEZs7jeoKpZkslwjp3vZGluDo2v
 tHEUy2AgkxwAakMKg3Nw4SI4CciLzBrrnbBqUS3GNQleN8WxDf81IqhG8JYq9w9p2Ezj
 F+2MJoig5KoNdiBErxiNm/96qmdJulg2HXW5yn4VtbHnmyl0OXkL1nQucrZ+VGD31mRf
 bRbnLF3+kZhL44GEUKuRZk4iESu7ocqflX6TR69MohSOK+P8x+juhqlHKuarNu75VmU4
 6mtwREtKDzP7m3s4rD0m2C4Kbt8BSON3GP14DUU2Zn9N6AQzFNpwgEVB8CLE2LPzye9+
 OBQw==
X-Gm-Message-State: AOAM530RLhCZTs4K59RDDtYy5PJvhXiGmE+32VU9GsNUBpdBVnBDKENw
 Dksy5ACkBQsRUitcW1Ue8E+WYw==
X-Google-Smtp-Source: ABdhPJxkTRmvABwMfPlAZ/14r3IhL8J+XIwG160AM3mSUkV5Z/ys2fQ9Puv21dPMDw4Sx8ewPV+H1A==
X-Received: by 2002:a17:906:36d9:: with SMTP id
 b25mr23758298ejc.530.1620154845482; 
 Tue, 04 May 2021 12:00:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p21sm15175739edw.18.2021.05.04.12.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 12:00:44 -0700 (PDT)
Date: Tue, 4 May 2021 21:00:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 18/27] drm/i915/gem: Optionally set SSEU in
 intel_context_set_gem
Message-ID: <YJGZ2ioBnQ5CkkGI@phenom.ffwll.local>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-19-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503155748.1961781-19-jason@jlekstrand.net>
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

On Mon, May 03, 2021 at 10:57:39AM -0500, Jason Ekstrand wrote:
> For now this is a no-op because everyone passes in a null SSEU but it
> lets us get some of the error handling and selftest refactoring plumbed
> through.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

it is a bit icky that intel_context_set_gem also sets the sseu, feels a
bit like a layering violation, but welp I couldn't come up with a better
idea either.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 41 +++++++++++++++----
>  .../gpu/drm/i915/gem/selftests/mock_context.c |  6 ++-
>  2 files changed, 36 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index ce729e640bbf7..6dd50d669c5b9 100644
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
> @@ -1544,6 +1565,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
>  	struct intel_engine_cs *stack[16];
>  	struct intel_engine_cs **siblings;
>  	struct intel_context *ce;
> +	struct intel_sseu null_sseu = {};
>  	u16 num_siblings, idx;
>  	unsigned int n;
>  	int err;
> @@ -1616,7 +1638,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
>  		goto out_siblings;
>  	}
>  
> -	intel_context_set_gem(ce, set->ctx);
> +	intel_context_set_gem(ce, set->ctx, null_sseu);
>  
>  	if (cmpxchg(&set->engines->engines[idx], NULL, ce)) {
>  		intel_context_put(ce);
> @@ -1724,6 +1746,7 @@ set_engines(struct i915_gem_context *ctx,
>  	struct drm_i915_private *i915 = ctx->i915;
>  	struct i915_context_param_engines __user *user =
>  		u64_to_user_ptr(args->value);
> +	struct intel_sseu null_sseu = {};
>  	struct set_engines set = { .ctx = ctx };
>  	unsigned int num_engines, n;
>  	u64 extensions;
> @@ -1733,7 +1756,7 @@ set_engines(struct i915_gem_context *ctx,
>  		if (!i915_gem_context_user_engines(ctx))
>  			return 0;
>  
> -		set.engines = default_engines(ctx);
> +		set.engines = default_engines(ctx, null_sseu);
>  		if (IS_ERR(set.engines))
>  			return PTR_ERR(set.engines);
>  
> @@ -1790,7 +1813,7 @@ set_engines(struct i915_gem_context *ctx,
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
