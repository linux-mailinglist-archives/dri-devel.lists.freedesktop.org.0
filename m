Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA5865CF92
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 10:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955B610E50B;
	Wed,  4 Jan 2023 09:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046A610E509;
 Wed,  4 Jan 2023 09:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672824841; x=1704360841;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KPN8YqY9LSOEXrt90pYffb+Xv9BOeYf4y3o6s7PYJ+s=;
 b=EdNrL82zUUb6tL6/FVZFZQt6aq+CppjjQ4tSOYqNUAtTGKS7KJdbXf1c
 X1N51T4FlEySt1mMnKufvMJTzkKEZ/riR5niG0A8NCy8ZiiKvci+5EAtI
 t2qcpiLgxq6h1p2XzSZq11NCCow0uAmcuskprOH7Q0Hph9RQ+/f/6DJDU
 9qN/3qT7gAUJI6Kz95lpiN2dSJ453pTnwp7gJKnk3SgVGRWEbaR5kKXJJ
 RE0Gpxq/pBpwZOnPRRsXDFy73sh3qPXoYP2ZbAc6gs4tTDMY4QofXza/I
 wlrgWBNBu0FMMxkpIEuNUl4/ljJJUehLeHiDqbPqjy4rzcvRp9qTrW6ho Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301582480"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="301582480"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 01:34:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="743790546"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="743790546"
Received: from wfurtakx-mobl.ger.corp.intel.com (HELO [10.213.223.45])
 ([10.213.223.45])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 01:33:56 -0800
Message-ID: <04ec647c-184e-942e-a7ed-4ba393e591b7@linux.intel.com>
Date: Wed, 4 Jan 2023 09:33:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915: Fix potential context UAFs
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230103234948.1218393-1-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230103234948.1218393-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 "open list:INTEL DRM DRIVERS" <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, katrinzhou <katrinzhou@tencent.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/01/2023 23:49, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> gem_context_register() makes the context visible to userspace, and which
> point a separate thread can trigger the I915_GEM_CONTEXT_DESTROY ioctl.
> So we need to ensure that nothing uses the ctx ptr after this.  And we
> need to ensure that adding the ctx to the xarray is the *last* thing
> that gem_context_register() does with the ctx pointer.

Any backtraces from oopses or notes on how it was found to record in the commit message?

> Signed-off-by: Rob Clark <robdclark@chromium.org>

Fixes: a4c1cdd34e2c ("drm/i915/gem: Delay context creation (v3)")
References: 3aa9945a528e ("drm/i915: Separate GEM context construction and registration to userspace")
Cc: <stable@vger.kernel.org> # v5.15+

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 24 +++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 7f2831efc798..6250de9b9196 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1688,6 +1688,10 @@ void i915_gem_init__contexts(struct drm_i915_private *i915)
>   	init_contexts(&i915->gem.contexts);
>   }
>   
> +/*
> + * Note that this implicitly consumes the ctx reference, by placing
> + * the ctx in the context_xa.
> + */
>   static void gem_context_register(struct i915_gem_context *ctx,
>   				 struct drm_i915_file_private *fpriv,
>   				 u32 id)
> @@ -1703,10 +1707,6 @@ static void gem_context_register(struct i915_gem_context *ctx,
>   	snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
>   		 current->comm, pid_nr(ctx->pid));
>   
> -	/* And finally expose ourselves to userspace via the idr */
> -	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
> -	WARN_ON(old);
> -
>   	spin_lock(&ctx->client->ctx_lock);
>   	list_add_tail_rcu(&ctx->client_link, &ctx->client->ctx_list);
>   	spin_unlock(&ctx->client->ctx_lock);
> @@ -1714,6 +1714,10 @@ static void gem_context_register(struct i915_gem_context *ctx,
>   	spin_lock(&i915->gem.contexts.lock);
>   	list_add_tail(&ctx->link, &i915->gem.contexts.list);
>   	spin_unlock(&i915->gem.contexts.lock);
> +
> +	/* And finally expose ourselves to userspace via the idr */
> +	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
> +	WARN_ON(old);

Have you seen that this hunk is needed or just moving it for a good measure? To be clear, it is probably best to move it even if the current placement cannot cause any problems, I am just double-checking if you had any concrete observations here while mulling over easier stable backports if we would omit it.

>   }
>   
>   int i915_gem_context_open(struct drm_i915_private *i915,
> @@ -2199,14 +2203,22 @@ finalize_create_context_locked(struct drm_i915_file_private *file_priv,
>   	if (IS_ERR(ctx))
>   		return ctx;
>   
> +	/*
> +	 * One for the xarray and one for the caller.  We need to grab
> +	 * the reference *prior* to making the ctx visble to userspace
> +	 * in gem_context_register(), as at any point after that
> +	 * userspace can try to race us with another thread destroying
> +	 * the context under our feet.
> +	 */
> +	i915_gem_context_get(ctx);
> +
>   	gem_context_register(ctx, file_priv, id);
>   
>   	old = xa_erase(&file_priv->proto_context_xa, id);
>   	GEM_BUG_ON(old != pc);
>   	proto_context_close(file_priv->dev_priv, pc);
>   
> -	/* One for the xarray and one for the caller */
> -	return i915_gem_context_get(ctx);
> +	return ctx;

Otherwise userspace can look up a context which hasn't had it's reference count increased yep. I can add the Fixes: and Stable: tags while merging if no complaints.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

>   }
>   
>   struct i915_gem_context *
