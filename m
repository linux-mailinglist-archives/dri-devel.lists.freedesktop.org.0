Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1BA2FB6C0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 15:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBB36E332;
	Tue, 19 Jan 2021 14:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91716E332
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 14:10:18 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id e15so10433030wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 06:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JR7UXM+TrD5Ernrsl3A/jvDjjK2P+v1rmVBpaiODoLU=;
 b=i9q7c7px4L5aLVA7fSfCI5tn2UZlU4DnREOL6bWyJc1znzy1igcu7qiukX9eRlrQa+
 AgTm3zLLcF/LtYW/v9x7QYGerKcel9u2tABxmLO6JVWCrI0awWmxA8lkMGgMz1d/vNhh
 Snm2XoPP1IdusJi155dCx/4cghU0MBg7av8gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JR7UXM+TrD5Ernrsl3A/jvDjjK2P+v1rmVBpaiODoLU=;
 b=mRMg37YMhZXvtJupQIhNXYyhCzy0yLLgnV9fmKg2zEFAcaxwXnjB4Fdl9Hr5/MEgbo
 Ajerl7iiyVfKJG3xD4PDYeL7BkxRkqHhfE7i0OnhtesOa2XITLb/4pKvD7ZijzQbbWoS
 Ru9ePgRmlYzykqt2KWJO3jMcl8BqjD+VH0MhYws1zAnwRUFYqYv4mx1j+UOrLT9fSya/
 R5ECDNhgFFfcJQei1EgZsIHhQxSJk3dUGIObJok1jZ6QvdyBXNX6LeIJrqIwHWdCYNZt
 pMam6eCtxj1aZbsZjqnx293QP5flneBCUCHFF5AKORJdoq06U2RNgM7T87Zyv07d56/V
 qRsA==
X-Gm-Message-State: AOAM533FBv0aTwkcRCHvExW83skYEuZNhlL1Bh5+GnBdqwux7+RDRksb
 iBdxlMmDoelGCgCMEpm10n/p9Q==
X-Google-Smtp-Source: ABdhPJwOLx1nBHtB9AhxOd3MDoKPrzRxuoQj0LPvCj6eIl9gLthRHW5FzVRNO1xDnswiCs5KK0i6/g==
X-Received: by 2002:a1c:2e43:: with SMTP id u64mr4317761wmu.105.1611065417618; 
 Tue, 19 Jan 2021 06:10:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e15sm37069365wrx.86.2021.01.19.06.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 06:10:16 -0800 (PST)
Date: Tue, 19 Jan 2021 15:10:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/4] drm/ttm: optimize ttm pool shrinker a bit
Message-ID: <YAboRgKfYWLUSTzc@phenom.ffwll.local>
References: <20210119121821.2320-1-christian.koenig@amd.com>
 <20210119121821.2320-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119121821.2320-4-christian.koenig@amd.com>
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

On Tue, Jan 19, 2021 at 01:18:21PM +0100, Christian K=F6nig wrote:
> Only initialize the DMA coherent pools if they are used.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 98ecb9c9842c..e0617717113f 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -505,10 +505,12 @@ void ttm_pool_init(struct ttm_pool *pool, struct de=
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

> @@ -524,9 +526,11 @@ void ttm_pool_fini(struct ttm_pool *pool)
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

> @@ -631,6 +635,11 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct s=
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
