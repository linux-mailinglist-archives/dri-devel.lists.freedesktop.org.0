Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7F347892
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580966E9EE;
	Wed, 24 Mar 2021 12:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB636E9EC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 12:35:32 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x16so24270616wrn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=m+GMD16qozTG0Q0nr2TQIs4HYhUj0f7p+vFANdKymc4=;
 b=YaDSmeHxEcm9ZT654JH9NqRlQJ0yCNmAnHbl2776HVmZk26EgWphD+OOZEBvXR92Zp
 NS9ckL5F+XhdlnpTo3DQtBIlfaI6cA3n7FzT7DbwzOTeZn2DTuogbnSKteTDBju9Y7mJ
 BaX0WkI78Cuw+M9s0tSFYXWuIgXwbrHMHOa3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=m+GMD16qozTG0Q0nr2TQIs4HYhUj0f7p+vFANdKymc4=;
 b=MxeFe/n+9Iw27KpXLFgd8kU0MLU7XIMQJk6LaOWirQ4zICpUeWP5B2UKoi3cC+EGK7
 x/6VEouLPBy/5RGl7qga7+U3qmI0wiHsgalEHIVFRdgMUfbhiU+fMRSdFQVQFNLem+Ly
 hmxbmP9IAFfg8zNsu+9vHyKbk57+HPSLQjiFaFm4OCoIZLXO7Q9frw0504Zsa6c/2OAa
 /lgZdm71OJLnuBVB9nU2sM90boyJ1+F4rtE/MR2XzPZj7tWGEJonkETDxihY4N45HyNc
 hzBPqyj8Fu060KVPm/x+FS2e92OGEBbpkPcCaA4ioJhSMzIVeg7bmjo6pKomqVK7gRqp
 Fc7g==
X-Gm-Message-State: AOAM531ozMPrptcguxwrpeb2ZkhjbKas35P31CB9k9ih3cTD4wgj2YMk
 geuwDKyjXXpDEfMGIUxI8+tZSyTagy87Sykm
X-Google-Smtp-Source: ABdhPJw17hYPx3//aR4EyXkmg7OFe0CoerrO7xoh5E8ra955CzC6D6IZS3z7L/mKYq7loA7g9Rlriw==
X-Received: by 2002:a5d:468e:: with SMTP id u14mr3315933wrq.359.1616589330722; 
 Wed, 24 Mar 2021 05:35:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t14sm2867275wru.64.2021.03.24.05.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 05:35:30 -0700 (PDT)
Date: Wed, 24 Mar 2021 13:35:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 25/70] drm/i915: Take reservation lock
 around i915_vma_pin.
Message-ID: <YFsyENY66kIXsRLV@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-26-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323155059.628690-26-maarten.lankhorst@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 04:50:14PM +0100, Maarten Lankhorst wrote:
> We previously complained when ww =3D=3D NULL.
> =

> This function is now only used in selftests to pin an object,
> and ww locking is now fixed.
> =

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> ---
>  .../i915/gem/selftests/i915_gem_coherency.c   | 12 ++++-------
>  drivers/gpu/drm/i915/i915_gem.c               |  6 +++++-
>  drivers/gpu/drm/i915/i915_vma.c               |  4 +---
>  drivers/gpu/drm/i915/i915_vma.h               | 20 +++++++++++++++----
>  4 files changed, 26 insertions(+), 16 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c b/dr=
ivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> index b5dbf15570fc..3eec385d43bb 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> @@ -218,15 +218,13 @@ static int gpu_set(struct context *ctx, unsigned lo=
ng offset, u32 v)
>  	u32 *cs;
>  	int err;
>  =

> +	vma =3D i915_gem_object_ggtt_pin(ctx->obj, NULL, 0, 0, 0);
> +	if (IS_ERR(vma))
> +		return PTR_ERR(vma);
> +
>  	i915_gem_object_lock(ctx->obj, NULL);
>  	i915_gem_object_set_to_gtt_domain(ctx->obj, false);

I have different context here because of

https://lore.kernel.org/intel-gfx/20210203090205.25818-8-chris@chris-wilson=
.co.uk/

What's really worrying here is the silent (accidental maybe, commit
message doesn't explain anything) change to the argument of
set_to_gtt_domain(). I've decided to just go with what we have right now,
but please double-check this matches the old version you've had before
this landed in drm-tip. Since I haven't pushed out the branch I've pinged
you with the pastebin on irc for now.
-Daniel

>  =

> -	vma =3D i915_gem_object_ggtt_pin(ctx->obj, NULL, 0, 0, 0);
> -	if (IS_ERR(vma)) {
> -		err =3D PTR_ERR(vma);
> -		goto out_unlock;
> -	}
> -
>  	rq =3D intel_engine_create_kernel_request(ctx->engine);
>  	if (IS_ERR(rq)) {
>  		err =3D PTR_ERR(rq);
> @@ -265,9 +263,7 @@ static int gpu_set(struct context *ctx, unsigned long=
 offset, u32 v)
>  	i915_request_add(rq);
>  out_unpin:
>  	i915_vma_unpin(vma);
> -out_unlock:
>  	i915_gem_object_unlock(ctx->obj);
> -
>  	return err;
>  }
>  =

> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_=
gem.c
> index 3dee4e31fb14..8373662e4b5f 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -920,7 +920,11 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_obje=
ct *obj,
>  			return ERR_PTR(ret);
>  	}
>  =

> -	ret =3D i915_vma_pin_ww(vma, ww, size, alignment, flags | PIN_GLOBAL);
> +	if (ww)
> +		ret =3D i915_vma_pin_ww(vma, ww, size, alignment, flags | PIN_GLOBAL);
> +	else
> +		ret =3D i915_vma_pin(vma, size, alignment, flags | PIN_GLOBAL);
> +
>  	if (ret)
>  		return ERR_PTR(ret);
>  =

> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_=
vma.c
> index 1ffda2aaa7a0..265e3a3079e2 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -863,9 +863,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915=
_gem_ww_ctx *ww,
>  	int err;
>  =

>  #ifdef CONFIG_PROVE_LOCKING
> -	if (debug_locks && lockdep_is_held(&vma->vm->i915->drm.struct_mutex))
> -		WARN_ON(!ww);
> -	if (debug_locks && ww && vma->resv)
> +	if (debug_locks && !WARN_ON(!ww) && vma->resv)
>  		assert_vma_held(vma);
>  #endif
>  =

> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_=
vma.h
> index 6b48f5c42488..8df784a026d2 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -246,10 +246,22 @@ i915_vma_pin_ww(struct i915_vma *vma, struct i915_g=
em_ww_ctx *ww,
>  static inline int __must_check
>  i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
>  {
> -#ifdef CONFIG_LOCKDEP
> -	WARN_ON_ONCE(vma->resv && dma_resv_held(vma->resv));
> -#endif
> -	return i915_vma_pin_ww(vma, NULL, size, alignment, flags);
> +	struct i915_gem_ww_ctx ww;
> +	int err;
> +
> +	i915_gem_ww_ctx_init(&ww, true);
> +retry:
> +	err =3D i915_gem_object_lock(vma->obj, &ww);
> +	if (!err)
> +		err =3D i915_vma_pin_ww(vma, &ww, size, alignment, flags);
> +	if (err =3D=3D -EDEADLK) {
> +		err =3D i915_gem_ww_ctx_backoff(&ww);
> +		if (!err)
> +			goto retry;
> +	}
> +	i915_gem_ww_ctx_fini(&ww);
> +
> +	return err;
>  }
>  =

>  int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> -- =

> 2.31.0
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
