Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2B665F08E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F65410E13E;
	Thu,  5 Jan 2023 15:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC81B10E11F;
 Thu,  5 Jan 2023 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672933934; x=1704469934;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=07rEmud9u3v4yR1dxZqrmwXHFiO37KqMuantmUAu7Fw=;
 b=mV8lbSw+TivQZn58on3V+tx6FMXIhU1h191tHXxFPCp6z3Cgwl5420if
 +EpTo/7+sgVdQC+XZZUXeBBmCqwZfAB4Dr13dyu7lr5Sn4ERMN6Co7/xk
 AV3vDN3PndDvpzBXxa9TjfI6MG7IRkIOIG1zczpCUqIAlmPVRigrF6j0N
 zoEld8IQGP+Gc/3JCrxdc/JJ2wzTwfu9QhyGp1s5aBxDisl8TtstL9dzD
 dbbt7B1ch8M2xi3TBlses9BgeTSxwP40UVXH/2lJV0wfb0i/nL6Cad3lX
 jPRirpmIZZKCQIspdG2DrFbUhv8qOgjakU0+1qA5wWmmBwpAORXlq6MF4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="349453823"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="349453823"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 07:52:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="655622313"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="655622313"
Received: from dgomm-mobl.ger.corp.intel.com (HELO intel.com) ([10.249.43.18])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 07:52:08 -0800
Date: Thu, 5 Jan 2023 16:52:05 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/i915: Fix potential context UAFs
Message-ID: <Y7byJa9VZyKO2gnT@ashyti-mobl2.lan>
References: <20230103234948.1218393-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103234948.1218393-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "open list:INTEL DRM DRIVERS" <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, katrinzhou <katrinzhou@tencent.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Tue, Jan 03, 2023 at 03:49:46PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> gem_context_register() makes the context visible to userspace, and which
> point a separate thread can trigger the I915_GEM_CONTEXT_DESTROY ioctl.
> So we need to ensure that nothing uses the ctx ptr after this.  And we
> need to ensure that adding the ctx to the xarray is the *last* thing
> that gem_context_register() does with the ctx pointer.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

I also agree with Tvrtko that we should add Stable: and Fixes:.

One little thing, "user after free" is clearer that UAF :)

Thanks,
Andi

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 24 +++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 7f2831efc798..6250de9b9196 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1688,6 +1688,10 @@ void i915_gem_init__contexts(struct drm_i915_private *i915)
>  	init_contexts(&i915->gem.contexts);
>  }
>  
> +/*
> + * Note that this implicitly consumes the ctx reference, by placing
> + * the ctx in the context_xa.
> + */
>  static void gem_context_register(struct i915_gem_context *ctx,
>  				 struct drm_i915_file_private *fpriv,
>  				 u32 id)
> @@ -1703,10 +1707,6 @@ static void gem_context_register(struct i915_gem_context *ctx,
>  	snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
>  		 current->comm, pid_nr(ctx->pid));
>  
> -	/* And finally expose ourselves to userspace via the idr */
> -	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
> -	WARN_ON(old);
> -
>  	spin_lock(&ctx->client->ctx_lock);
>  	list_add_tail_rcu(&ctx->client_link, &ctx->client->ctx_list);
>  	spin_unlock(&ctx->client->ctx_lock);
> @@ -1714,6 +1714,10 @@ static void gem_context_register(struct i915_gem_context *ctx,
>  	spin_lock(&i915->gem.contexts.lock);
>  	list_add_tail(&ctx->link, &i915->gem.contexts.list);
>  	spin_unlock(&i915->gem.contexts.lock);
> +
> +	/* And finally expose ourselves to userspace via the idr */
> +	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
> +	WARN_ON(old);
>  }
>  
>  int i915_gem_context_open(struct drm_i915_private *i915,
> @@ -2199,14 +2203,22 @@ finalize_create_context_locked(struct drm_i915_file_private *file_priv,
>  	if (IS_ERR(ctx))
>  		return ctx;
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
>  	gem_context_register(ctx, file_priv, id);
>  
>  	old = xa_erase(&file_priv->proto_context_xa, id);
>  	GEM_BUG_ON(old != pc);
>  	proto_context_close(file_priv->dev_priv, pc);
>  
> -	/* One for the xarray and one for the caller */
> -	return i915_gem_context_get(ctx);
> +	return ctx;
>  }
>  
>  struct i915_gem_context *
> -- 
> 2.38.1
