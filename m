Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D394A372DDE
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 18:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A885F6EB2C;
	Tue,  4 May 2021 16:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48DE6EB2C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 16:17:17 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id b17so8101253ede.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 09:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ESFJVv5DD0a0lmX5earpPgnUG03s7gPJvDUyjYaF9K8=;
 b=CxRubMeQ0WB0uv6ckiXSNXpyOJU2mF1sliGYvM5TQsu62XmOqTDs80SoZ0IAqrBZ80
 DWVBcNtMUgsThI9RgtbUW3diFpU0CRmeLU71w4jpn2rC+xy5qn8Oeh7GkL5lMdcjyDSf
 T2OSOFaliINFmQtwl2e02T6QFWoXiOwkZnl/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ESFJVv5DD0a0lmX5earpPgnUG03s7gPJvDUyjYaF9K8=;
 b=LtgK3MRtO3SbQS2z/QD5h1rpIde5DNM9rpQreeX4KZqBgjT0xlrblNTx94+OQD6zY2
 rMYvE0/rh2TcxUocDrFr8HDU6vJpZN6pbtn4xdzhUg1aXh3annvn+wU0TbV7SXTmrOWg
 1vr4qjOkHVKQpAg4Xxk8k65W8GkJDs/zMYu5vPI6cWMJwOiIpwHGsAD1rTbZs8taQg4q
 Wlp1nlQvfIySFdXbUbSLXsaQJyKQ1sU3gFRZyeWDGHZr3DaWdQnLMUh0HlHLSnqSDRwF
 yw4K70IFTkPgjgHi10WnN5h3QZlh+wgY4tzqmQmUOnvhiKOGyuTvylggqpDqMq88TiWk
 Am5w==
X-Gm-Message-State: AOAM530kAKQ8/j2lHNKTny/q4siCv4qhy7TsDCVRh8rS2PAkWkpr97kw
 WwtXQ5YBdBDcYM98y7FoB7C+vg==
X-Google-Smtp-Source: ABdhPJyvKQzJF0/AlXhNtfpJKg6+52LaLovqjj9DKxED6MHQXyXlpP4dj8XE7foqZMWvVkz5/cLMOw==
X-Received: by 2002:a05:6402:752:: with SMTP id
 p18mr27103368edy.127.1620145036423; 
 Tue, 04 May 2021 09:17:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id gn36sm1614962ejc.23.2021.05.04.09.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 09:17:15 -0700 (PDT)
Date: Tue, 4 May 2021 18:17:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 17/27] drm/i915/gem: Rework error handling in
 default_engines
Message-ID: <YJFzilYYEb+SMz1i@phenom.ffwll.local>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-18-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503155748.1961781-18-jason@jlekstrand.net>
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

On Mon, May 03, 2021 at 10:57:38AM -0500, Jason Ekstrand wrote:
> Since free_engines works for partially constructed engine sets, we can
> use the usual goto pattern.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

I guess subsequent patches apply the same for the set_engines command and
__free_engines disappears? Otherwise feels a bit silly.

Anyway looks correct.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 10bd1b6dd1774..ce729e640bbf7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -420,7 +420,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
>  {
>  	const struct intel_gt *gt = &ctx->i915->gt;
>  	struct intel_engine_cs *engine;
> -	struct i915_gem_engines *e;
> +	struct i915_gem_engines *e, *err;
>  	enum intel_engine_id id;
>  
>  	e = alloc_engines(I915_NUM_ENGINES);
> @@ -438,18 +438,21 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
>  
>  		ce = intel_context_create(engine);
>  		if (IS_ERR(ce)) {
> -			__free_engines(e, e->num_engines + 1);
> -			return ERR_CAST(ce);
> +			err = ERR_CAST(ce);
> +			goto free_engines;
>  		}
>  
>  		intel_context_set_gem(ce, ctx);
>  
>  		e->engines[engine->legacy_idx] = ce;
> -		e->num_engines = max(e->num_engines, engine->legacy_idx);
> +		e->num_engines = max(e->num_engines, engine->legacy_idx + 1);
>  	}
> -	e->num_engines++;
>  
>  	return e;
> +
> +free_engines:
> +	free_engines(e);
> +	return err;
>  }
>  
>  void i915_gem_context_release(struct kref *ref)
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
