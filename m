Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7598FC69950
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8C110E4A2;
	Tue, 18 Nov 2025 13:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bUbLFHtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0533410E171;
 Tue, 18 Nov 2025 13:23:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 110E060236;
 Tue, 18 Nov 2025 13:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E793EC2BCB5;
 Tue, 18 Nov 2025 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763472221;
 bh=lwcvP48QGsft5QCTxDFGFyY3YpYMOdXqPEjncpW/yfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bUbLFHtkpDWyLJXRZsMX2LU2hcAze47ndKcvD6Iuk9yZe3HaWq7bdUK7nEYQncqv3
 joPGl+Z/eaeR9UcxTkZk0WaYHvsEzpPp7pdn19wXHTgnsAVCn3EvK30BlTYbPhmL0z
 GpABGHzyglZ7Qc1Ln0FHg0jfSG1Q6KAmMttHTsAVc9RLzmgMLvYo+/Pf4HUpPGW5GZ
 CdGZG1z8/2Q0osmclC0SDVDMqyBJRJv+7c0llBfPKtdGfx+4ox8CLvoWYATFaEWGbj
 QVr10DOM4RP9+yEv182s13Y+Wnd5ueh0Z4hBms+vXgy+5lqlB2ptj0ZGBkynP0Pgfo
 QdrRJJt93PmXw==
Date: Tue, 18 Nov 2025 14:23:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Defer signalling the request fence
Message-ID: <v2dqkfbcbypssudrwzdr6m7a3ns7iwynaw2ld7im3m7hau33o3@qtftkian2k2e>
References: <20251024170313.135544-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024170313.135544-2-krzysztof.niemiec@intel.com>
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

...

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

Please do not do this: you are scheduling work and leaving it
to run on its own. This can cause races with the global
variables, and you may exit with work still pending.

You must at least wait for the work to finish before leaving the
test.

Andi

>  	if (err) {
>  		__live_put(active);
>  		active = ERR_PTR(err);
> -- 
> 2.45.2
> 
