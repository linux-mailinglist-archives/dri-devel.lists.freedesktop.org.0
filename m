Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7360136D9AB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 16:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22226E0EA;
	Wed, 28 Apr 2021 14:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39A26E0EB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 14:37:08 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so9395232wmy.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vpkQVSWK2DWvopANTqJRlJwtVO8vUYwoQRHSo0nwyFU=;
 b=a+KtKd0X/Q9iGOcFGjt2IOhHY2+7+Jobxn7nP5cIogAXp5sZWwB+M6wokbtTKcFR8r
 gyojJCqJwEtalpuQoQvdiRjoWbi7UGHhISAm1KUs7kOnuz1rD0fpaWtpQuUVCELcfn7s
 c9d73M2Cnmu51ALlS33D5uzfPJLCMi56dJ/iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vpkQVSWK2DWvopANTqJRlJwtVO8vUYwoQRHSo0nwyFU=;
 b=kgBxfixYZbKGiINfXhrUDm3ePJI/Qo7TMS0OqFGTqPOm4+3Gu26ZWPUCBmKwAuqHrH
 Gj5aH8qdpfiQzYeJST8wQdrpsoS7vuG7oyX8iF01pGdeIZisJoNJ5NnUCXg1mVyuzb1C
 3vzOmaLwCnkGJhwt+OO5ANJKl/qGTtj0kBg10DkwR4QNWJ1MFNHaZggtnK6qj3gS3slp
 U76/ZklaQhtyfDu/ejGQf9haRMmuBgmuV7UDGaRwfLKJlutuwrISUTQ0OgLJtmuQy7Ip
 tM/8KxNxZlX/nhWlhi4WJ3+djSvWl7VXajLK8FA3GAC/62nYcSVvLWtdp0R5iYsJWjEy
 wJPw==
X-Gm-Message-State: AOAM5318+hLyqgA43zLQogoKLMgMt8G+BNA1S3qqjrj8gAKxt7Qns/rZ
 VkUCvU6+uIx30Yx+SM28UphbPQ==
X-Google-Smtp-Source: ABdhPJzW/xYPrH7XD6davZYu8ZSHZiYldECgq5Vis0Pt+JGk7BS6QuE5XmZmPs7J5XAwZp2t0FrCEw==
X-Received: by 2002:a1c:2985:: with SMTP id
 p127mr31879077wmp.165.1619620627603; 
 Wed, 28 Apr 2021 07:37:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c77sm3963776wme.37.2021.04.28.07.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 07:37:07 -0700 (PDT)
Date: Wed, 28 Apr 2021 16:37:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 12/21] drm/i915/gem: Add a separate validate_priority
 helper
Message-ID: <YIlzEejLztKalbxN@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-13-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-13-jason@jlekstrand.net>
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

On Fri, Apr 23, 2021 at 05:31:22PM -0500, Jason Ekstrand wrote:

Maybe explain that you pull this out since with the proto context there
will be two paths to set this, one for proto context, the other for
context already finalized and executing patches?

With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 42 +++++++++++++--------
>  1 file changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 941fbf78267b4..e5efd22c89ba2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -169,6 +169,28 @@ lookup_user_engine(struct i915_gem_context *ctx,
>  	return i915_gem_context_get_engine(ctx, idx);
>  }
>  
> +static int validate_priority(struct drm_i915_private *i915,
> +			     const struct drm_i915_gem_context_param *args)
> +{
> +	s64 priority = args->value;
> +
> +	if (args->size)
> +		return -EINVAL;
> +
> +	if (!(i915->caps.scheduler & I915_SCHEDULER_CAP_PRIORITY))
> +		return -ENODEV;
> +
> +	if (priority > I915_CONTEXT_MAX_USER_PRIORITY ||
> +	    priority < I915_CONTEXT_MIN_USER_PRIORITY)
> +		return -EINVAL;
> +
> +	if (priority > I915_CONTEXT_DEFAULT_PRIORITY &&
> +	    !capable(CAP_SYS_NICE))
> +		return -EPERM;
> +
> +	return 0;
> +}
> +
>  static struct i915_address_space *
>  context_get_vm_rcu(struct i915_gem_context *ctx)
>  {
> @@ -1744,23 +1766,13 @@ static void __apply_priority(struct intel_context *ce, void *arg)
>  static int set_priority(struct i915_gem_context *ctx,
>  			const struct drm_i915_gem_context_param *args)
>  {
> -	s64 priority = args->value;
> -
> -	if (args->size)
> -		return -EINVAL;
> -
> -	if (!(ctx->i915->caps.scheduler & I915_SCHEDULER_CAP_PRIORITY))
> -		return -ENODEV;
> -
> -	if (priority > I915_CONTEXT_MAX_USER_PRIORITY ||
> -	    priority < I915_CONTEXT_MIN_USER_PRIORITY)
> -		return -EINVAL;
> +	int err;
>  
> -	if (priority > I915_CONTEXT_DEFAULT_PRIORITY &&
> -	    !capable(CAP_SYS_NICE))
> -		return -EPERM;
> +	err = validate_priority(ctx->i915, args);
> +	if (err)
> +		return err;
>  
> -	ctx->sched.priority = priority;
> +	ctx->sched.priority = args->value;
>  	context_apply_all(ctx, __apply_priority, ctx);
>  
>  	return 0;
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
