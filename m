Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DB7373819
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 11:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B526C6E456;
	Wed,  5 May 2021 09:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E516E455
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 09:50:18 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gx5so1823487ejb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 02:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zqHCx1/t/oaFr5cO63sKjX79V8HhdDzZggfgijctA3c=;
 b=R6eXGIXtBS8TYW/h6I9Ouau5ALS2GIYngD+/b9aAU+I4xlxhQQLbzkWTGpWKmUraS4
 harnCVWvDTXA39HKyXm1srqWLWA7PCkq0NtOO3NzX5VeeKamCdPOuZnJfG8gBHDJ0YGc
 bMxwyf4P90Ss5TXblStzzsKpVVD4E4oD4j6TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zqHCx1/t/oaFr5cO63sKjX79V8HhdDzZggfgijctA3c=;
 b=OXdxpQ1fXfE1G9RKEgywoRvyswZz7rCiQ4MsTVOzklhoEt1nGPMOSFES/b/BNudTIa
 DK0IIiaNTfBVYyrY/HHmdL/TN5bxdv+Wups7tqb3VXtAK95A0dXuI5xuOBlXNH2zlP4W
 g0khN3qqjtrQJehGn1qV6adj92WtfmQTfmHD7yxySaUUyY8th7Rr0BF+Hv0eqiz0nwmL
 XdFzfp3NJsWHAIf0UvAe/ikY0jBVKHk+azVAoObXtGLqdL3oW5cPSayeisFb6zZ0Y67V
 ZYIFqKYhVo/uVqtzTzNvJ1BadbI/pli7hL4acbfIQSUSUb+/rpM7ggW/T8z8uKFk3ugq
 QooQ==
X-Gm-Message-State: AOAM531cuLORl4L853W9dMFWuXvHUI+hwLAUaf+1+c449VvcvTSSuoVm
 pLS4KfoLYrViI09kf1I//klW9g==
X-Google-Smtp-Source: ABdhPJyfXsZ3X1PkMUuOzaG0aJusuBDi8ZZnc8/+4lA6XytUxiUSwrYhsZLdtmsZ5dh1E5ml/0WOyA==
X-Received: by 2002:a17:907:2d0c:: with SMTP id
 gs12mr12216133ejc.173.1620208216681; 
 Wed, 05 May 2021 02:50:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z12sm15723054edr.17.2021.05.05.02.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:50:16 -0700 (PDT)
Date: Wed, 5 May 2021 11:50:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 25/27] drm/i915/selftests: Take a VM in kernel_context()
Message-ID: <YJJqVh//VBhxWm/Z@phenom.ffwll.local>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-26-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503155748.1961781-26-jason@jlekstrand.net>
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

On Mon, May 03, 2021 at 10:57:46AM -0500, Jason Ekstrand wrote:
> This better models where we want to go with contexts in general where
> things like the VM and engine set are create parameters instead of being
> set after the fact.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Looks reasonable.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  .../drm/i915/gem/selftests/i915_gem_context.c |  4 ++--
>  .../gpu/drm/i915/gem/selftests/mock_context.c |  9 ++++++++-
>  .../gpu/drm/i915/gem/selftests/mock_context.h |  4 +++-
>  drivers/gpu/drm/i915/gt/selftest_execlists.c  | 20 +++++++++----------
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
>  5 files changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index 16ff64ab34a1b..76029d7143f6c 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -680,7 +680,7 @@ static int igt_ctx_exec(void *arg)
>  			struct i915_gem_context *ctx;
>  			struct intel_context *ce;
>  
> -			ctx = kernel_context(i915);
> +			ctx = kernel_context(i915, NULL);
>  			if (IS_ERR(ctx)) {
>  				err = PTR_ERR(ctx);
>  				goto out_file;
> @@ -813,7 +813,7 @@ static int igt_shared_ctx_exec(void *arg)
>  			struct i915_gem_context *ctx;
>  			struct intel_context *ce;
>  
> -			ctx = kernel_context(i915);
> +			ctx = kernel_context(i915, NULL);
>  			if (IS_ERR(ctx)) {
>  				err = PTR_ERR(ctx);
>  				goto out_test;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> index 61aaac4a334cf..500ef27ba4771 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -150,7 +150,8 @@ live_context_for_engine(struct intel_engine_cs *engine, struct file *file)
>  }
>  
>  struct i915_gem_context *
> -kernel_context(struct drm_i915_private *i915)
> +kernel_context(struct drm_i915_private *i915,
> +	       struct i915_address_space *vm)
>  {
>  	struct i915_gem_context *ctx;
>  	struct i915_gem_proto_context *pc;
> @@ -159,6 +160,12 @@ kernel_context(struct drm_i915_private *i915)
>  	if (IS_ERR(pc))
>  		return ERR_CAST(pc);
>  
> +	if (vm) {
> +		if (pc->vm)
> +			i915_vm_put(pc->vm);
> +		pc->vm = i915_vm_get(vm);
> +	}
> +
>  	ctx = i915_gem_create_context(i915, pc);
>  	proto_context_close(pc);
>  	if (IS_ERR(ctx))
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.h b/drivers/gpu/drm/i915/gem/selftests/mock_context.h
> index 2a6121d33352d..7a02fd9b5866a 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.h
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.h
> @@ -10,6 +10,7 @@
>  struct file;
>  struct drm_i915_private;
>  struct intel_engine_cs;
> +struct i915_address_space;
>  
>  void mock_init_contexts(struct drm_i915_private *i915);
>  
> @@ -25,7 +26,8 @@ live_context(struct drm_i915_private *i915, struct file *file);
>  struct i915_gem_context *
>  live_context_for_engine(struct intel_engine_cs *engine, struct file *file);
>  
> -struct i915_gem_context *kernel_context(struct drm_i915_private *i915);
> +struct i915_gem_context *kernel_context(struct drm_i915_private *i915,
> +					struct i915_address_space *vm);
>  void kernel_context_close(struct i915_gem_context *ctx);
>  
>  #endif /* !__MOCK_CONTEXT_H */
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index a0e75b71a3374..0989e024f7a03 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -1522,12 +1522,12 @@ static int live_busywait_preempt(void *arg)
>  	 * preempt the busywaits used to synchronise between rings.
>  	 */
>  
> -	ctx_hi = kernel_context(gt->i915);
> +	ctx_hi = kernel_context(gt->i915, NULL);
>  	if (!ctx_hi)
>  		return -ENOMEM;
>  	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
>  
> -	ctx_lo = kernel_context(gt->i915);
> +	ctx_lo = kernel_context(gt->i915, NULL);
>  	if (!ctx_lo)
>  		goto err_ctx_hi;
>  	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
> @@ -1724,12 +1724,12 @@ static int live_preempt(void *arg)
>  	if (igt_spinner_init(&spin_lo, gt))
>  		goto err_spin_hi;
>  
> -	ctx_hi = kernel_context(gt->i915);
> +	ctx_hi = kernel_context(gt->i915, NULL);
>  	if (!ctx_hi)
>  		goto err_spin_lo;
>  	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
>  
> -	ctx_lo = kernel_context(gt->i915);
> +	ctx_lo = kernel_context(gt->i915, NULL);
>  	if (!ctx_lo)
>  		goto err_ctx_hi;
>  	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
> @@ -1816,11 +1816,11 @@ static int live_late_preempt(void *arg)
>  	if (igt_spinner_init(&spin_lo, gt))
>  		goto err_spin_hi;
>  
> -	ctx_hi = kernel_context(gt->i915);
> +	ctx_hi = kernel_context(gt->i915, NULL);
>  	if (!ctx_hi)
>  		goto err_spin_lo;
>  
> -	ctx_lo = kernel_context(gt->i915);
> +	ctx_lo = kernel_context(gt->i915, NULL);
>  	if (!ctx_lo)
>  		goto err_ctx_hi;
>  
> @@ -1910,7 +1910,7 @@ struct preempt_client {
>  
>  static int preempt_client_init(struct intel_gt *gt, struct preempt_client *c)
>  {
> -	c->ctx = kernel_context(gt->i915);
> +	c->ctx = kernel_context(gt->i915, NULL);
>  	if (!c->ctx)
>  		return -ENOMEM;
>  
> @@ -3367,12 +3367,12 @@ static int live_preempt_timeout(void *arg)
>  	if (igt_spinner_init(&spin_lo, gt))
>  		return -ENOMEM;
>  
> -	ctx_hi = kernel_context(gt->i915);
> +	ctx_hi = kernel_context(gt->i915, NULL);
>  	if (!ctx_hi)
>  		goto err_spin_lo;
>  	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
>  
> -	ctx_lo = kernel_context(gt->i915);
> +	ctx_lo = kernel_context(gt->i915, NULL);
>  	if (!ctx_lo)
>  		goto err_ctx_hi;
>  	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
> @@ -3659,7 +3659,7 @@ static int live_preempt_smoke(void *arg)
>  	}
>  
>  	for (n = 0; n < smoke.ncontext; n++) {
> -		smoke.contexts[n] = kernel_context(smoke.gt->i915);
> +		smoke.contexts[n] = kernel_context(smoke.gt->i915, NULL);
>  		if (!smoke.contexts[n])
>  			goto err_ctx;
>  	}
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 746985971c3a6..3676eaf6b2aee 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -42,7 +42,7 @@ static int hang_init(struct hang *h, struct intel_gt *gt)
>  	memset(h, 0, sizeof(*h));
>  	h->gt = gt;
>  
> -	h->ctx = kernel_context(gt->i915);
> +	h->ctx = kernel_context(gt->i915, NULL);
>  	if (IS_ERR(h->ctx))
>  		return PTR_ERR(h->ctx);
>  
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
