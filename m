Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3261736D590
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 12:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBFC6EB0F;
	Wed, 28 Apr 2021 10:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523676EB0D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 10:16:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 a22-20020a05600c2256b029014294520f18so4139166wmm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 03:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uOe+N+c5K6O3uq5CbTn5rAb8QuLRjU8n5kOdij1gBug=;
 b=M4HeYxuM89a7YgEKBWnwMZWFLL8q1Ba0yoLDdeEQ7Q46HtvGgBFY/kQUaKWAuQ42bk
 fU4B8kSBScZvy24gFLNOt6kyePI5iYNI9YDgDLbPuVM6nWemnUwaHaLw76YsbpdsKtoB
 x34jzyTi1YhL+ZEMlS0T4hTbu7qSPkTa5L/Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uOe+N+c5K6O3uq5CbTn5rAb8QuLRjU8n5kOdij1gBug=;
 b=QN5elPWjIwvwYwnE2jEMY1elr3RnVpLxRw5soBFW2DtnJhcgMYTnn9+9PcYmPm4Rkt
 b7ExdLuK6ghMC25BWS59HpbhE5vG6QYSo0ziUAJaRRxNRp48bajtf/xiDfK5+tkWafU4
 b9Q9FO7OPKkko6LzkN9aYcPeQx7y1E2tQA6SWPiiQOYtgdv1K1qsASMkIO18xPt2PT9m
 77bXbehIJdsS/MoVmW5n1yHeftDABqohGsv51Usg5tfQum/E58vW2RJ9ucv2kMwDZ3V4
 MF5Xy5cqO6SAIXWYJnka0awLWMkDghPMuuUZuQ+TN9OVaFefIy9fjpIIv7dFyBCQRsvr
 LI1A==
X-Gm-Message-State: AOAM530yeeehlq4HeJjL2rNCZPdl/UkMbxTOOzRAISxZatfGFLik8XD0
 v9Bw0nh6Jnj4B8r70PwNAvieAg==
X-Google-Smtp-Source: ABdhPJze9tAmYWkN9PpjByBDUhstnKFzTfm01HJwTR4FBIbRiPMNOLxTx49dRjUhYC8OI2AZIj5klQ==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr5701526wmk.43.1619604965986; 
 Wed, 28 Apr 2021 03:16:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h10sm7722715wrt.40.2021.04.28.03.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:16:05 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:16:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 09/21] drm/i915/gem: Disallow creating
 contexts with too many engines
Message-ID: <YIk14zVfa8Mw4rUF@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-10-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-10-jason@jlekstrand.net>
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

On Fri, Apr 23, 2021 at 05:31:19PM -0500, Jason Ekstrand wrote:
> There's no sense in allowing userspace to create more engines than it
> can possibly access via execbuf.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 5f8d0faf783aa..ecb3bf5369857 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1640,11 +1640,10 @@ set_engines(struct i915_gem_context *ctx,
>  		return -EINVAL;
>  	}
>  
> -	/*
> -	 * Note that I915_EXEC_RING_MASK limits execbuf to only using the
> -	 * first 64 engines defined here.
> -	 */
>  	num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);

Maybe add a comment like /* RING_MASK has not shift, so can be used
directly here */ since I had to check that :-)

Same story about igt testcases needed, just to be sure.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	if (num_engines > I915_EXEC_RING_MASK + 1)
> +		return -EINVAL;
> +
>  	set.engines = alloc_engines(num_engines);
>  	if (!set.engines)
>  		return -ENOMEM;
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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
