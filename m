Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92718373807
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 11:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2758934F;
	Wed,  5 May 2021 09:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEB08934F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 09:47:44 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id r9so1862302ejj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 02:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f4gFrWwIxyzSsboinT0HiYMYMSgY3WAO2l2ug4TxpW4=;
 b=WUzNHBDebwpvVElga1180NeMAH2eenXcVwDqvVb/gWtUnXLjERRf46Mf2SUOMYX5wE
 pjn+yVHa780YTbx1swAZvN6ZjaARDwQl2lUX0hGJt3JBx8FOBowU/PN0AAPiQ5Q8FLVO
 YYLPPOCw7VaIOIZ3jzcbG7V/47PlQMbYSmvtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f4gFrWwIxyzSsboinT0HiYMYMSgY3WAO2l2ug4TxpW4=;
 b=Pe8vjySODYB/FO4u2pVtdapUF+HyzdhrHQLJogTkWlDOooIRHrxMoO9HD43XtJPMWv
 QJ9pQbbtxZFc9X5va1FmUwAdKnCtnNaSNeC3BZ0UhVUXj/mhaPboajC5amNa92qYKP5B
 AMsleVhS4co8Ixcs4BMJxxhM2cutrY7wh8dNqMYGJ3HlyYasLI5EDQpToxgumTuYoJVt
 xgEbL1wF2i4zhtF5oO6AftnpVvVgg/E+FyNlH60q/nPF9nyRGj7JcJqfWXSgBQ4NTMdC
 CUsMiIG9SHyyenMT0TT6BrlpostYuoyMWqnjXndUvWF6gKeQwhFZBIIl/YHneORDysLq
 eTOQ==
X-Gm-Message-State: AOAM533zhDdZITTN040kVpgj5r9iAHNunKGqr8VV3NfYxLJdVtEKoBcC
 s4kpVxOn+jT7EpUWGWwEdFXQcg==
X-Google-Smtp-Source: ABdhPJxZUbcxcHvcc62uRB50N0u7+g0R/w71jgXyIe6UpGDTyo5hEQ9UkZvCow0w8pmz8m1esZO1lw==
X-Received: by 2002:a17:906:bc8e:: with SMTP id
 lv14mr26346490ejb.418.1620208063530; 
 Wed, 05 May 2021 02:47:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j16sm16149558edr.9.2021.05.05.02.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:47:42 -0700 (PDT)
Date: Wed, 5 May 2021 11:47:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 18/27] drm/i915/gem: Optionally set SSEU in
 intel_context_set_gem
Message-ID: <YJJpvYcU76jTnz4b@phenom.ffwll.local>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-19-jason@jlekstrand.net>
 <YJGZ2ioBnQ5CkkGI@phenom.ffwll.local>
 <4178c5fb-1f6d-b7cf-2149-e84604490cb0@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4178c5fb-1f6d-b7cf-2149-e84604490cb0@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 05, 2021 at 10:28:59AM +0100, Tvrtko Ursulin wrote:
> 
> On 04/05/2021 20:00, Daniel Vetter wrote:
> > On Mon, May 03, 2021 at 10:57:39AM -0500, Jason Ekstrand wrote:
> > > For now this is a no-op because everyone passes in a null SSEU but it
> > > lets us get some of the error handling and selftest refactoring plumbed
> > > through.
> > > 
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > 
> > it is a bit icky that intel_context_set_gem also sets the sseu, feels a
> > bit like a layering violation, but welp I couldn't come up with a better
> > idea either.
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> It is actually quite horrible. As you say it breaks separation of duties and
> open codes stuff all over the place without transferring over the commentary
> about why.

I didn't really see lost commentary anywhere? Can you pls point out what
got lost?
-Daniel

> 
> Regards,
> 
> Tvrtko
> 
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 41 +++++++++++++++----
> > >   .../gpu/drm/i915/gem/selftests/mock_context.c |  6 ++-
> > >   2 files changed, 36 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > index ce729e640bbf7..6dd50d669c5b9 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > @@ -320,9 +320,12 @@ context_get_vm_rcu(struct i915_gem_context *ctx)
> > >   	} while (1);
> > >   }
> > > -static void intel_context_set_gem(struct intel_context *ce,
> > > -				  struct i915_gem_context *ctx)
> > > +static int intel_context_set_gem(struct intel_context *ce,
> > > +				 struct i915_gem_context *ctx,
> > > +				 struct intel_sseu sseu)
> > >   {
> > > +	int ret = 0;
> > > +
> > >   	GEM_BUG_ON(rcu_access_pointer(ce->gem_context));
> > >   	RCU_INIT_POINTER(ce->gem_context, ctx);
> > > @@ -349,6 +352,12 @@ static void intel_context_set_gem(struct intel_context *ce,
> > >   		intel_context_set_watchdog_us(ce, (u64)timeout_ms * 1000);
> > >   	}
> > > +
> > > +	/* A valid SSEU has no zero fields */
> > > +	if (sseu.slice_mask && !WARN_ON(ce->engine->class != RENDER_CLASS))
> > > +		ret = intel_context_reconfigure_sseu(ce, sseu);
> > > +
> > > +	return ret;
> > >   }
> > >   static void __free_engines(struct i915_gem_engines *e, unsigned int count)
> > > @@ -416,7 +425,8 @@ static struct i915_gem_engines *alloc_engines(unsigned int count)
> > >   	return e;
> > >   }
> > > -static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
> > > +static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
> > > +						struct intel_sseu rcs_sseu)
> > >   {
> > >   	const struct intel_gt *gt = &ctx->i915->gt;
> > >   	struct intel_engine_cs *engine;
> > > @@ -429,6 +439,8 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
> > >   	for_each_engine(engine, gt, id) {
> > >   		struct intel_context *ce;
> > > +		struct intel_sseu sseu = {};
> > > +		int ret;
> > >   		if (engine->legacy_idx == INVALID_ENGINE)
> > >   			continue;
> > > @@ -442,10 +454,18 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
> > >   			goto free_engines;
> > >   		}
> > > -		intel_context_set_gem(ce, ctx);
> > > -
> > >   		e->engines[engine->legacy_idx] = ce;
> > >   		e->num_engines = max(e->num_engines, engine->legacy_idx + 1);
> > > +
> > > +		if (engine->class == RENDER_CLASS)
> > > +			sseu = rcs_sseu;
> > > +
> > > +		ret = intel_context_set_gem(ce, ctx, sseu);
> > > +		if (ret) {
> > > +			err = ERR_PTR(ret);
> > > +			goto free_engines;
> > > +		}
> > > +
> > >   	}
> > >   	return e;
> > > @@ -759,6 +779,7 @@ __create_context(struct drm_i915_private *i915,
> > >   {
> > >   	struct i915_gem_context *ctx;
> > >   	struct i915_gem_engines *e;
> > > +	struct intel_sseu null_sseu = {};
> > >   	int err;
> > >   	int i;
> > > @@ -776,7 +797,7 @@ __create_context(struct drm_i915_private *i915,
> > >   	INIT_LIST_HEAD(&ctx->stale.engines);
> > >   	mutex_init(&ctx->engines_mutex);
> > > -	e = default_engines(ctx);
> > > +	e = default_engines(ctx, null_sseu);
> > >   	if (IS_ERR(e)) {
> > >   		err = PTR_ERR(e);
> > >   		goto err_free;
> > > @@ -1544,6 +1565,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
> > >   	struct intel_engine_cs *stack[16];
> > >   	struct intel_engine_cs **siblings;
> > >   	struct intel_context *ce;
> > > +	struct intel_sseu null_sseu = {};
> > >   	u16 num_siblings, idx;
> > >   	unsigned int n;
> > >   	int err;
> > > @@ -1616,7 +1638,7 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
> > >   		goto out_siblings;
> > >   	}
> > > -	intel_context_set_gem(ce, set->ctx);
> > > +	intel_context_set_gem(ce, set->ctx, null_sseu);
> > >   	if (cmpxchg(&set->engines->engines[idx], NULL, ce)) {
> > >   		intel_context_put(ce);
> > > @@ -1724,6 +1746,7 @@ set_engines(struct i915_gem_context *ctx,
> > >   	struct drm_i915_private *i915 = ctx->i915;
> > >   	struct i915_context_param_engines __user *user =
> > >   		u64_to_user_ptr(args->value);
> > > +	struct intel_sseu null_sseu = {};
> > >   	struct set_engines set = { .ctx = ctx };
> > >   	unsigned int num_engines, n;
> > >   	u64 extensions;
> > > @@ -1733,7 +1756,7 @@ set_engines(struct i915_gem_context *ctx,
> > >   		if (!i915_gem_context_user_engines(ctx))
> > >   			return 0;
> > > -		set.engines = default_engines(ctx);
> > > +		set.engines = default_engines(ctx, null_sseu);
> > >   		if (IS_ERR(set.engines))
> > >   			return PTR_ERR(set.engines);
> > > @@ -1790,7 +1813,7 @@ set_engines(struct i915_gem_context *ctx,
> > >   			return PTR_ERR(ce);
> > >   		}
> > > -		intel_context_set_gem(ce, ctx);
> > > +		intel_context_set_gem(ce, ctx, null_sseu);
> > >   		set.engines->engines[n] = ce;
> > >   	}
> > > diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > > index e0f512ef7f3c6..cbeefd060e97b 100644
> > > --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > > +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> > > @@ -14,6 +14,7 @@ mock_context(struct drm_i915_private *i915,
> > >   {
> > >   	struct i915_gem_context *ctx;
> > >   	struct i915_gem_engines *e;
> > > +	struct intel_sseu null_sseu = {};
> > >   	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> > >   	if (!ctx)
> > > @@ -31,7 +32,7 @@ mock_context(struct drm_i915_private *i915,
> > >   	i915_gem_context_set_persistence(ctx);
> > >   	mutex_init(&ctx->engines_mutex);
> > > -	e = default_engines(ctx);
> > > +	e = default_engines(ctx, null_sseu);
> > >   	if (IS_ERR(e))
> > >   		goto err_free;
> > >   	RCU_INIT_POINTER(ctx->engines, e);
> > > @@ -112,6 +113,7 @@ live_context_for_engine(struct intel_engine_cs *engine, struct file *file)
> > >   {
> > >   	struct i915_gem_engines *engines;
> > >   	struct i915_gem_context *ctx;
> > > +	struct intel_sseu null_sseu = {};
> > >   	struct intel_context *ce;
> > >   	engines = alloc_engines(1);
> > > @@ -130,7 +132,7 @@ live_context_for_engine(struct intel_engine_cs *engine, struct file *file)
> > >   		return ERR_CAST(ce);
> > >   	}
> > > -	intel_context_set_gem(ce, ctx);
> > > +	intel_context_set_gem(ce, ctx, null_sseu);
> > >   	engines->engines[0] = ce;
> > >   	engines->num_engines = 1;
> > > -- 
> > > 2.31.1
> > > 
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
