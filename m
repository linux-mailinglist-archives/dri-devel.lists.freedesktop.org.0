Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41784C91CA4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 12:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D9D10E8E3;
	Fri, 28 Nov 2025 11:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hSJg941e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9E810E052;
 Fri, 28 Nov 2025 11:28:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D6A1240166;
 Fri, 28 Nov 2025 11:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0E4C4CEF1;
 Fri, 28 Nov 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764329333;
 bh=vRbKmq6ux/J8YlL9fr1lPyCP/8rOPoCqpNayoF8hR8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hSJg941euWXznuq6k82SNu2s445C9U617HvuTsdq9KTS7AmRHxg76QM4g01FcPpVi
 C7rzCxt8w/8YrJxZvN5H+a8th6lpB8qVL+JgeDnoWjjRIzTISCgfblKPGwKQ3Z/tBj
 T2RBd+qaZGik9ibWWYrLqPYJa9gLIWqPsH1CYINhMAfO8vrizAR1Ai/WRoX48Ab4kw
 b8jMOGTivKA6P+9beHDi59e32i2D81S16ojiIVR3eLJMHlwbMA29SFhujDpUI+wnUd
 Q4c0zz2D6rGPKJ/GazdkhLBXhkN76LrLonuS43xsnIY/g1+Aub/jD/NXz6C0zZO+Sa
 waoiIZFMgazhQ==
Date: Fri, 28 Nov 2025 12:28:50 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v2] drm/i915/selftests: Defer signalling the request fence
Message-ID: <os3g7uhmiksfasf6fv7aczkt3a3ab5r3znol5gj24gxhno5sj7@ftsi6bbopz5w>
References: <20251029143501.42998-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029143501.42998-2-krzysztof.niemiec@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Sorry, I haven't replied to you in v1, but my concerns still
remain and they are not adressed here.

> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_active.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
> index 0d89d70b9c36..a82a56c3eeb6 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_active.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_active.c
> @@ -74,15 +74,25 @@ static struct live_active *__live_alloc(struct drm_i915_private *i915)
>  	return active;
>  }
>  
> +static struct i915_sw_fence *submit;
> +static struct delayed_work __live_submit_work;
> +
> +static void __live_submit_work_handler(struct work_struct *work)
> +{
> +	i915_sw_fence_commit(submit);
> +	heap_fence_put(submit);
> +}
> +
>  static struct live_active *
>  __live_active_setup(struct drm_i915_private *i915)
>  {
>  	struct intel_engine_cs *engine;
> -	struct i915_sw_fence *submit;
>  	struct live_active *active;
>  	unsigned int count = 0;
>  	int err = 0;
>  
> +	INIT_DELAYED_WORK(&__live_submit_work, __live_submit_work_handler);
> +
>  	active = __live_alloc(i915);
>  	if (!active)
>  		return ERR_PTR(-ENOMEM);
> @@ -132,8 +142,7 @@ __live_active_setup(struct drm_i915_private *i915)
>  	}
>  
>  out:
> -	i915_sw_fence_commit(submit);
> -	heap_fence_put(submit);
> +	schedule_delayed_work(&__live_submit_work, msecs_to_jiffies(500));

Where does the 500 ms delay come from? How long will this work
run?  Could it overlap with the next test execution? If so, what
happens to the global variables?

Please ensure everything is cleaned up before exiting the test.
Embed the global state in a per test structure that is torn down
at the end of the test. I do not want to leave any stray work or
state behind.

Even if it looks fine, this is a house of cards and easy to
break.

Sorry, this patch is not ready to go.

Andi

>  	if (err) {
>  		__live_put(active);
>  		active = ERR_PTR(err);
> -- 
> 2.45.2
> 
