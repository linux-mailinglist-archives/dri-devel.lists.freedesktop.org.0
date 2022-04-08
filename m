Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA04F9001
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 09:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E87710E655;
	Fri,  8 Apr 2022 07:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7340810E401
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 07:58:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r7so4944516wmq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8gZxwgtjNldQdWOHmbuyBINbNYL+r4dNmkA4XgTkZyk=;
 b=CEqSTp8mOA317UKyaNECHFwHjtRZl9G1A0wNlqdAQonk3PwOD+fEFhUsfEsN+7JvDX
 fTveu5/EOaD9oHV0GGv5SZJFxE+sqA2NV2LfsY4OKlB3KdniUqYFmNsyWFe4NOvObJCe
 O5o/w2ns59ZGcS5XrCkZkQbh8qneT3a4gFjDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8gZxwgtjNldQdWOHmbuyBINbNYL+r4dNmkA4XgTkZyk=;
 b=imIyk6LxRYBTRWBU5GrLZfbsmR8ynyXwbr/Ob6OVvFLn02dXkO/gQbE6A1vKpZoK+B
 cK/NeWxmfKF1bq/S/Scgut2tNYByThleTV1z3m2/LlRIMS/uZ79FtVLu4lxBH98KxScF
 wfBSVXSkh0+YV/YRtGrmQAqyJ1obAJDGy12Fb/jY9xIGM+6a/VBfRpLDla6JDpXAzJ62
 m6vPaxxoYxyTmb9P07c0qYV8wGbZOG6yjOnS0fwD5gngXi6Taqs7LynpEEv4Qp8hCl+O
 91a4rMLq5wOiPHHnqhGdpmpVvP+/fzozlHFsx7JDKt77WHPRnc73Jk0dTBEgYLGrGdqS
 +VTw==
X-Gm-Message-State: AOAM531wT1unWUkM6VFnrhjXF6L7Nc8DdGHGg7V6RTSQ3Ku7IBvYHYc4
 qscpfsUFWf5kaWxiE0/YLgmtLw==
X-Google-Smtp-Source: ABdhPJwEGuFRb3D+dqRIfLFmnbcVcoeaP+c29MR86azql4/m6MLfgUopZkaAm7ctouDOs3mzc4ffmQ==
X-Received: by 2002:a7b:c30e:0:b0:37f:a63d:3d1f with SMTP id
 k14-20020a7bc30e000000b0037fa63d3d1fmr15514167wmj.178.1649404705559; 
 Fri, 08 Apr 2022 00:58:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a5d584f000000b00204171ba528sm18398286wrf.109.2022.04.08.00.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 00:58:25 -0700 (PDT)
Date: Fri, 8 Apr 2022 09:58:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/1] drm/i915: Inherit submitter nice when scheduling
 requests
Message-ID: <Yk/rHyGrOlrkDtdR@phenom.ffwll.local>
References: <20220407151627.3387655-1-tvrtko.ursulin@linux.intel.com>
 <20220407151627.3387655-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407151627.3387655-2-tvrtko.ursulin@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 07, 2022 at 04:16:27PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Inherit submitter nice at point of request submission to account for long
> running processes getting either externally or self re-niced.
> 
> This accounts for the current processing landscape where computational
> pipelines are composed of CPU and GPU parts working in tandem.
> 
> Nice value will only apply to requests which originate from user contexts
> and have default context priority. This is to avoid disturbing any
> application made choices of low and high (batch processing and latency
> sensitive compositing). In this case nice value adjusts the effective
> priority in the narrow band of -19 to +20 around
> I915_CONTEXT_DEFAULT_PRIORITY.
> 
> This means that userspace using the context priority uapi directly has a
> wider range of possible adjustments (in practice that only applies to
> execlists platforms - with GuC there are only three priority buckets), but
> in all cases nice adjustment has the expected effect: positive nice
> lowering the scheduling priority and negative nice raising it.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

I don't think adding any more fancy features to i915-scheduler makes
sense, at least not before we've cut over to drm/sched.
-Daniel

> ---
>  drivers/gpu/drm/i915/i915_request.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 582770360ad1..e5cfa073d8f0 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1811,8 +1811,17 @@ void i915_request_add(struct i915_request *rq)
>  	/* XXX placeholder for selftests */
>  	rcu_read_lock();
>  	ctx = rcu_dereference(rq->context->gem_context);
> -	if (ctx)
> +	if (ctx) {
>  		attr = ctx->sched;
> +		/*
> +		 * Inherit process nice when scheduling user contexts but only
> +		 * if context has the default priority to avoid touching
> +		 * contexts where GEM uapi has been used to explicitly lower
> +		 * or elevate it.
> +		 */
> +		if (attr.priority == I915_CONTEXT_DEFAULT_PRIORITY)
> +			attr.priority = -task_nice(current);
> +	}
>  	rcu_read_unlock();
>  
>  	__i915_request_queue(rq, &attr);
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
