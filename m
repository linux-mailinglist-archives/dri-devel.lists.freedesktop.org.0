Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02100BE7137
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 10:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212F310EB42;
	Fri, 17 Oct 2025 08:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BwTXOkMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF5610EB40;
 Fri, 17 Oct 2025 08:14:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C67644555;
 Fri, 17 Oct 2025 08:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C47C4CEE7;
 Fri, 17 Oct 2025 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760688890;
 bh=WgmGxowg4YifJntvPv4VERS8Lf84ABa0RNmkryHG+Is=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BwTXOkMIOZMSszWM8T8bLUP//0m9jWfzGT6s1RygldDM/OYIBUVUFS+dwHn/V1opv
 VPSgTZBBi05zP9Gbzlm2E7DABGKrRiJPPpxc1njFcEc4bX4f0RwTrMkHolAZsD/swI
 DEzoD9+a6P0WRA3d6Ncfgxt2+CvWu18b6tGIxcxq9xZREvZrOxdQsgUKagu0p/15Ne
 iiLv/bingqDORgfrM1gy21SvXqJp9S+QtQRjhEKW9n2r/MfSFAsscL0ZwLQOgppL1t
 Ydok6tPIbEGnPuQ7Bi37wFXTz6pC1qvx5lTgqSHbDGdp22qkmw26mf6p1JTfizBn6Y
 fDeYoK06Sd0qw==
Date: Fri, 17 Oct 2025 10:14:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH v2 1/3] drm/i915: Avoid lock inversion when pinning to GGTT
Message-ID: <teb77bxalkobbdkfzsrgslpjcnj2kkbyidstgjqfjr6422kmb4@bjikp64baaxm>
References: <20251014125504.14804-5-janusz.krzysztofik@linux.intel.com>
 <20251014125504.14804-6-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014125504.14804-6-janusz.krzysztofik@linux.intel.com>
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

Hi Janusz,

...

> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 25e97031d76e4..20deb01c0e5fe 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1595,8 +1595,14 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  err_vma_res:
>  	i915_vma_resource_free(vma_res);
>  err_fence:
> -	if (work)
> -		dma_fence_work_commit_imm(&work->base);
> +	if (work) {
> +		/* don't risk lockdep splat against stop_machine() */
> +		if (i915_vma_is_ggtt(vma) &&
> +		    intel_vm_no_concurrent_access_wa(vma->vm->i915))
> +			dma_fence_work_commit(&work->base);
> +		else
> +			dma_fence_work_commit_imm(&work->base);

This looks a bit hacky to me. The proper solution would be to fix
the locking order and make sure we do not call stop_machine()
while holding the lock.

In the past we have added plenty of dirty and ugly hacks to
work around locking orders just to make lockdep happy. I would
rather live with a lockdep warning than carry a hack for many
years ahead.

On the other hand, we call stop_machine() for a specific case
caused by a hardware flaw in BXT, so doing a heavy refactoring
might be excessive.

To be honest, I do not have a clean solution in mind, and I do
not feel like either blocking or acking this approach.

It looks like you have achieved consensus here, so I can apply it
if you want (for maintainership's sake), unless someone objects.

Thanks,
Andi

> +	}
>  err_rpm:
>  	intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
>  
> -- 
> 2.51.0
> 
