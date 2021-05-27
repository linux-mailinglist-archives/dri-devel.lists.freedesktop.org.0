Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C32393570
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 20:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C525D6F494;
	Thu, 27 May 2021 18:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351106F494
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 18:31:24 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j14so833259wrq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aDxqQ9WiFH4xQVdAZTWGoERm5NM6kp6n2oMJTxk1IQc=;
 b=gezh5mb9Gv0lFKJNWuq6YloMvUSh8IItIkFVNshqdtjRoEBPz1dS+ifsbf+Bp3EQVJ
 gFKrl3Ceb3PKduYp/0aA+vtK1kmL06ii6JftitqdWcGGb6ohHTWpDZ8d/AfXrLwYbKmS
 QbmtOOblQYsC4wM5CYSA74PXyHdZWjILnJXIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aDxqQ9WiFH4xQVdAZTWGoERm5NM6kp6n2oMJTxk1IQc=;
 b=fRv+++12JbrdzTe0W7adeP/PsQ+AzHV7DElxrUuTick7GXJaJ6I3eC4O7SLOR8r7KV
 2ifjH/dsQAA5JSy3HF9A6iAB16hvSKmxkKQLH6bVNT4OIqKmd2DBnxptgDBVts2Wwb4F
 4C1hMNGp1Y+0X1hwOUT4BXMJ/bhriRm+nZ7GQwAEeZIg9qRKYY7VigM6VVn1IEVzHJZS
 jLSSBqtLqMRKBd6ohSOuHfrkM/dkEpZfLdWLSriqCBG1Jf/cOaNKosX4iKxNDqUXc1Og
 d2BNHnx7xAUa5DzAIrGFQTHuh2HHko49Bb7oaoEPndYzWHc35mxOJ363A6VQG6lS7loM
 wNdQ==
X-Gm-Message-State: AOAM531hrkjVtKv/Lc6cLwP9RVH/la7ZpAqXcBB7KZvhM7hB2YD5r3OV
 Km7gaQJaQ1U7oGABEeqRfTWU52PlNnONAw==
X-Google-Smtp-Source: ABdhPJwHYqKWfeskHw2OIqBpB+zlshG/eBmxgisGdhsTASHM9vnRDjm4Z+rq7oOtSmv2tKKIR3jx+Q==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr4923573wrt.189.1622140282917; 
 Thu, 27 May 2021 11:31:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b13sm11558231wmj.40.2021.05.27.11.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 11:31:22 -0700 (PDT)
Date: Thu, 27 May 2021 20:31:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 20/29] drm/i915/gem: Make an alignment check more sensible
Message-ID: <YK/leG45kvVHayN7@phenom.ffwll.local>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
 <20210527162650.1182544-21-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527162650.1182544-21-jason@jlekstrand.net>
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

On Thu, May 27, 2021 at 11:26:41AM -0500, Jason Ekstrand wrote:
> What we really want to check is that size of the engines array, i.e.
> args->size - sizeof(*user) is divisible by the element size, i.e.
> sizeof(*user->engines) because that's what's required for computing the
> array length right below the check.  However, we're currently not doing
> this and instead doing a compile-time check that sizeof(*user) is
> divisible by sizeof(*user->engines) and avoiding the subtraction.  As
> far as I can tell, the only reason for the more confusing pair of checks
> is to avoid a single subtraction of a constant.
> 
> The other thing the BUILD_BUG_ON might be trying to implicitly check is
> that offsetof(user->engines) == sizeof(*user) and we don't have any
> weird padding throwing us off.  However, that's not the check it's doing
> and it's not even a reliable way to do that check.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Yeah a non-dense compiler should be able to figure this out, plus
set_engines isn't a hotpath.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 12a148ba421b6..cf7c281977a3e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1758,9 +1758,8 @@ set_engines(struct i915_gem_context *ctx,
>  		goto replace;
>  	}
>  
> -	BUILD_BUG_ON(!IS_ALIGNED(sizeof(*user), sizeof(*user->engines)));
>  	if (args->size < sizeof(*user) ||
> -	    !IS_ALIGNED(args->size, sizeof(*user->engines))) {
> +	    !IS_ALIGNED(args->size -  sizeof(*user), sizeof(*user->engines))) {
>  		drm_dbg(&i915->drm, "Invalid size for engine array: %d\n",
>  			args->size);
>  		return -EINVAL;
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
