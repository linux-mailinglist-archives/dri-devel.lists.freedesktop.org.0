Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 029A02E0B27
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 14:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238C26E876;
	Tue, 22 Dec 2020 13:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137E6E876
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 13:51:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 190so1939279wmz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 05:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3HLveXZesoO5BWjN5yTfGClAAv1JQHhuwanBcZb0Tpw=;
 b=UcmOXjO/Mu2XDeFNywrNCW09jPRFOLOQAwaGmKOc6vlNbpZ+JGgggVD9c7pJG50wBl
 ILkvBLl0+QKulggYfuWqD5bjHhzpDRaop/NpaeHSRkuve0fsJU8NWS2iHLI3ca9I3TEq
 Q+O9QCUyLWlAdrIbQC76GR7oIe/hkfoC7GoNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3HLveXZesoO5BWjN5yTfGClAAv1JQHhuwanBcZb0Tpw=;
 b=ppEpnSH8hECHct9OShtEHTjrvN3adV56gpOWFa9M806KT/cKD26XjhfA3OIOdFirz/
 B0YShpMwBIGdGddrUYdFg6xR2Czn799pMnyIRZn9zRRf5DDDQH/X1DdFCkRn4zF3yNsA
 m0pmBRytJLgE1BuutsX0HnjqVEsFYJxRlFOsLCa1XutXv2YNsb80ZI8pksc5xeEHSohh
 gkxYY2I70ug+Fy24zHJG2UQMQl+TmzItbGGCaoSQMfzndrxJ54fK8vj/bTjtx/OGrnI+
 48Cuprz+JmvnyPwNQGRTNjFzoAiczJxJB7h6JeSm//nb5ke4f336VYNk0aYQmBg2K4xd
 Qeew==
X-Gm-Message-State: AOAM5333G34kBK2M1+eK4rVOwhLl4xexKahEgKxhZN+9JPs0ouScsYZ9
 0PMjCpslICl3QXuUS72nAsURYQ==
X-Google-Smtp-Source: ABdhPJx245cB3MiQrYA/Fd/tH5nkWtvcJ96fO/4zx23xdNDVzyIEEnYI0IW/MJK9n9az/4y8ueRc5g==
X-Received: by 2002:a1c:7f52:: with SMTP id a79mr21597491wmd.157.1608645115608; 
 Tue, 22 Dec 2020 05:51:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p15sm30024993wrt.15.2020.12.22.05.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 05:51:54 -0800 (PST)
Date: Tue, 22 Dec 2020 14:51:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/4] drm/ttm: optimize ttm pool shrinker a bit
Message-ID: <X+H5+OuETFR7ePdp@phenom.ffwll.local>
References: <20201218175538.1364-1-christian.koenig@amd.com>
 <20201218175538.1364-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218175538.1364-4-christian.koenig@amd.com>
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
Cc: ray.huang@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 18, 2020 at 06:55:38PM +0100, Christian K=F6nig wrote:
> Only initialize the DMA coherent pools if they are used.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Ah, just realized the answer to my question on patch 2: The pools are
per-device, due to dma_alloc_coherent being per-device (but really mostly
it isn't, but that's what we have to deal with fighting the dma-api
abstraction).

I think this would make a lot more sense if the shrinkers are per-pool
(and also most of the debugfs files), since as-is in a multi-gpu system
the first gpu's pool gets preferrentially thrashed. Which isn't a nice
design. Splitting that into per gpu shrinkers means we get equal shrinking
without having to maintain a global lru. This is how xfs seems to set up
their shrinkers, and in general xfs people have a solid understanding of
this stuff.

Aside: I think it also would make tons of sense to split up your new ttm
bo shrinker up into a per-device lru, and throw the global system memory
lru out the window completely :-) Assuming we can indeed get rid of it,
and vmwgfx doesn't need it somewhere still.

Aside from this lgtm, but I guess will change a bit with that shuffling.
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 1cdacd58753a..f09e34614226 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -504,10 +504,12 @@ void ttm_pool_init(struct ttm_pool *pool, struct de=
vice *dev,
>  	pool->use_dma_alloc =3D use_dma_alloc;
>  	pool->use_dma32 =3D use_dma32;
>  =

> -	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> -		for (j =3D 0; j < MAX_ORDER; ++j)
> -			ttm_pool_type_init(&pool->caching[i].orders[j],
> -					   pool, i, j);
> +	if (use_dma_alloc) {
> +		for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> +			for (j =3D 0; j < MAX_ORDER; ++j)
> +				ttm_pool_type_init(&pool->caching[i].orders[j],
> +						   pool, i, j);
> +	}
>  }
>  EXPORT_SYMBOL(ttm_pool_init);
>  =

> @@ -523,9 +525,11 @@ void ttm_pool_fini(struct ttm_pool *pool)
>  {
>  	unsigned int i, j;
>  =

> -	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> -		for (j =3D 0; j < MAX_ORDER; ++j)
> -			ttm_pool_type_fini(&pool->caching[i].orders[j]);
> +	if (pool->use_dma_alloc) {
> +		for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> +			for (j =3D 0; j < MAX_ORDER; ++j)
> +				ttm_pool_type_fini(&pool->caching[i].orders[j]);
> +	}
>  }
>  EXPORT_SYMBOL(ttm_pool_fini);
>  =

> @@ -630,6 +634,11 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct s=
eq_file *m)
>  {
>  	unsigned int i;
>  =

> +	if (!pool->use_dma_alloc) {
> +		seq_puts(m, "unused\n");
> +		return 0;
> +	}
> +
>  	ttm_pool_debugfs_header(m);
>  =

>  	spin_lock(&shrinker_lock);
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
