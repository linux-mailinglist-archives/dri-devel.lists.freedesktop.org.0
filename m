Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF448CA80
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 18:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9158010E5AC;
	Wed, 12 Jan 2022 17:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44AF10E231;
 Wed, 12 Jan 2022 17:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642010370; x=1673546370;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d/LjtuAyqmkFIWB4hNh60XmaO1IJi5r5eKvYN+nL3Gg=;
 b=DUHG5GDg++c6+Obn8RvFKjys3We9Zc95F3ybGpqFNb61e30p1ZdkClQQ
 YQO1JRTflnH0uyVI51quT1Yukoc6+g4KMCcdw3lcRvoHZEq4k0BKBiLVw
 svlUMeafj4G2b0c0uEjnPDoZEs6vlwimcoAk+hcXjMhEwLcr15rY8HcNw
 wqoo6y21ZwHqA0CKI1Sj84clg0UH5d/2KETl6AcLePZwsp+YbyHrQzck0
 VqDCEdFUgYCriHI5ayoQFfkFi0Pevcp5a2npLaJtPfrXUGdYQ4qp9F6+e
 hk2BUfa3r3+eL83iK1Lfni29vZsaIxpISQfj80StUpu8kpHQdq7YlzcTG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="241353294"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="241353294"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 09:59:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="623541892"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 09:59:29 -0800
Date: Wed, 12 Jan 2022 09:53:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] drm/i915/selftests: Fix NULL vs IS_ERR checking for
 kernel_context
Message-ID: <20220112175338.GA12463@jons-linux-dev-box>
References: <20211222075832.1732-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222075832.1732-1-linmq006@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Andi Shyti <andi.shyti@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 22, 2021 at 07:58:29AM +0000, Miaoqian Lin wrote:
> Since i915_gem_create_context() function return error pointers,
> the kernel_context() function does not return null, It returns error
> pointers too. Using IS_ERR() to check the return value to fix this.
> 

Just a nit, err is initialized to -ENOMEM in a bunch of these tests
which isn't needed anymore. If you want to clean that up too, feel free.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_execlists.c | 41 ++++++++++++++------
>  1 file changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index b367ecfa42de..eacfe920afed 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -1540,13 +1540,16 @@ static int live_busywait_preempt(void *arg)
>  	 */
>  
>  	ctx_hi = kernel_context(gt->i915, NULL);
> -	if (!ctx_hi)
> -		return -ENOMEM;
> +	if (IS_ERR(ctx_hi))
> +		return IS_ERR(ctx_hi);
> +
>  	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
>  
>  	ctx_lo = kernel_context(gt->i915, NULL);
> -	if (!ctx_lo)
> +	if (IS_ERR(ctx_lo)) {
> +		err = PTR_ERR(ctx_lo);
>  		goto err_ctx_hi;
> +	}
>  	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
>  
>  	obj = i915_gem_object_create_internal(gt->i915, PAGE_SIZE);
> @@ -1742,13 +1745,17 @@ static int live_preempt(void *arg)
>  		goto err_spin_hi;
>  
>  	ctx_hi = kernel_context(gt->i915, NULL);
> -	if (!ctx_hi)
> +	if (IS_ERR(ctx_hi)) {
> +		err = PTR_ERR(ctx_hi);
>  		goto err_spin_lo;
> +	}
>  	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
>  
>  	ctx_lo = kernel_context(gt->i915, NULL);
> -	if (!ctx_lo)
> +	if (IS_ERR(ctx_lo)) {
> +		err = PTR_ERR(ctx_lo);
>  		goto err_ctx_hi;
> +	}
>  	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
>  
>  	for_each_engine(engine, gt, id) {
> @@ -1834,12 +1841,16 @@ static int live_late_preempt(void *arg)
>  		goto err_spin_hi;
>  
>  	ctx_hi = kernel_context(gt->i915, NULL);
> -	if (!ctx_hi)
> +	if (IS_ERR(ctx_hi)) {
> +		err = PTR_ERR(ctx_hi);
>  		goto err_spin_lo;
> +	}
>  
>  	ctx_lo = kernel_context(gt->i915, NULL);
> -	if (!ctx_lo)
> +	if (IS_ERR(ctx_lo)) {
> +		err = PTR_ERR(ctx_lo);
>  		goto err_ctx_hi;
> +	}
>  
>  	/* Make sure ctx_lo stays before ctx_hi until we trigger preemption. */
>  	ctx_lo->sched.priority = 1;
> @@ -1928,8 +1939,8 @@ struct preempt_client {
>  static int preempt_client_init(struct intel_gt *gt, struct preempt_client *c)
>  {
>  	c->ctx = kernel_context(gt->i915, NULL);
> -	if (!c->ctx)
> -		return -ENOMEM;
> +	if (IS_ERR(c->ctx))
> +		return PTR_ERR(c->ctx);
>  
>  	if (igt_spinner_init(&c->spin, gt))
>  		goto err_ctx;
> @@ -3385,13 +3396,17 @@ static int live_preempt_timeout(void *arg)
>  		return -ENOMEM;
>  
>  	ctx_hi = kernel_context(gt->i915, NULL);
> -	if (!ctx_hi)
> +	if (IS_ERR(ctx_hi)) {
> +		err = PTR_ERR(ctx_hi);
>  		goto err_spin_lo;
> +	}
>  	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
>  
>  	ctx_lo = kernel_context(gt->i915, NULL);
> -	if (!ctx_lo)
> +	if (IS_ERR(ctx_lo)) {
> +		err = PTR_ERR(ctx_lo);
>  		goto err_ctx_hi;
> +	}
>  	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
>  
>  	for_each_engine(engine, gt, id) {
> @@ -3683,8 +3698,10 @@ static int live_preempt_smoke(void *arg)
>  
>  	for (n = 0; n < smoke.ncontext; n++) {
>  		smoke.contexts[n] = kernel_context(smoke.gt->i915, NULL);
> -		if (!smoke.contexts[n])
> +		if (IS_ERR(smoke.contexts[n])) {
> +			err = PTR_ERR(smoke.contexts[n]);
>  			goto err_ctx;
> +		}
>  	}
>  
>  	for (n = 0; n < ARRAY_SIZE(phase); n++) {
> -- 
> 2.17.1
> 
