Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6633A12FB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 13:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA4C89E0D;
	Wed,  9 Jun 2021 11:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20C76E038
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 11:41:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso3981759wms.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 04:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UnSonGVClf8V1RsFNHy6Xe8G95gO3GAycYrAogtXCWI=;
 b=PoJuBeqSVhCFiQKtvYsmLSYpLijZPExuEkTKjXCCN10FekOwrc9t8dZZ80MwRu9Rpt
 bAeZo6RUaN9ozoOoJuh6Akkx0QmIT74f3Yzh1sqg5JqpgTwT4dj1orGLivovLOCDDNdt
 oVTY2MfCTT7uTUnc/QZO891u2o4CcKDfMFyhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UnSonGVClf8V1RsFNHy6Xe8G95gO3GAycYrAogtXCWI=;
 b=WdO0q8Joad4VjpFRjj0GzSAjgX3hZdZ9VWaHTfB813TVqdqTgubuSJ4nH3MDStrngM
 76ku4BA/9s5xE9BqikkAt9CRv9rIhsnktw+vkl9PhzmBas5f2yUUmNE3iiGgm9CYhNJU
 GveYKYmL+fqN4wfrXP4WPhqUZUYL7jDUNRtJ/WmzIY7n4C1+ywFbai/p/DyEenVF3WUh
 R82OMVxtyuq+eOfIv2ppmeGNnW3SAlx7Aa7iOkDcQ5xsIoffNUTHOWtdZPdl2dfztJ56
 M7K3POkxvIF5l90cJtgOXt3Xyiap/Ql0CDNYXmsX9/WHC696pihulzmpF6oRQb6fA1og
 vN+Q==
X-Gm-Message-State: AOAM532epGT/rCFZd9hScTPuNhnA+aMnRRkWqAD7TOyxbIvBsH2tvVQq
 t/cgJnveSQYpwQV54AJLdS1Pfg==
X-Google-Smtp-Source: ABdhPJxCKHf/Hj5JOnotvaOIQpAJk5lSDbAO0VJw2Q9DdfG+ZRAh9MZkxxistRlAK8zLc/ZmllmzQQ==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr9230339wmc.88.1623238886451;
 Wed, 09 Jun 2021 04:41:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l2sm23020973wrp.21.2021.06.09.04.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 04:41:25 -0700 (PDT)
Date: Wed, 9 Jun 2021 13:41:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 31/31] drm/i915: Drop some RCU usage around
 context VMs
Message-ID: <YMCo5N8cn902qLgc@phenom.ffwll.local>
References: <20210609043613.102962-1-jason@jlekstrand.net>
 <20210609043613.102962-32-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609043613.102962-32-jason@jlekstrand.net>
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

On Tue, Jun 08, 2021 at 11:36:13PM -0500, Jason Ekstrand wrote:
> This instance now only happens during context creation so there's no way
> we can race with a context close/destroy.  We don't need to bother with
> the RCU and can access the pointer directly.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

There's another one in execbuf.c, and the real crux is that we need to
fully audit the lifetimes of everything. I think it's better to do this
all together in a seperate patch series, which entirely removes the rcu
barrier on the i915_address_space cleanup, and also removes the rcu
protection from everywhere else.

Otherwise we just have an inconsistent mess that happens to work,
sometimes.
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 5312142daa0c0..ffdfed536ce9a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -787,15 +787,12 @@ static int intel_context_set_gem(struct intel_context *ce,
>  
>  	ce->ring_size = SZ_16K;
>  
> -	if (rcu_access_pointer(ctx->vm)) {
> -		struct i915_address_space *vm;
> -
> -		rcu_read_lock();
> -		vm = context_get_vm_rcu(ctx); /* hmm */
> -		rcu_read_unlock();
> -
> +	if (ctx->vm) {
> +		/* This only happens during context creation so no need to
> +		 * bother with any RCU nonsense.
> +		 */
>  		i915_vm_put(ce->vm);
> -		ce->vm = vm;
> +		ce->vm = i915_vm_get(ctx->vm);
>  	}
>  
>  	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
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
