Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280B2F4C34
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 14:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2B76E9B9;
	Wed, 13 Jan 2021 13:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215316E9B9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 13:27:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m4so2105488wrx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 05:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lCYeQanLeA2mtO0z/liQy5Dnl5RdZOuMbLpbxzXLYSM=;
 b=RM7obAOpCVYsksTktgWwg95mnocQUP4J2idqoOH1I23qMZu5ScRVysh5fUBpT+QdNf
 yom/XZYGe5nQ8mWhLH3p8+GODbEA64QbsDkTN9t0G9EiYWKTraSdM1tEhkdcAJQoKy4h
 T2lMsMf36l8+yHWWjYQe8vEr4zyLGtfMerQSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lCYeQanLeA2mtO0z/liQy5Dnl5RdZOuMbLpbxzXLYSM=;
 b=TqABCzyKv/98dTBAhDWuac2g65pYbeOEimOficNu1aphsqifKkzo6Dl0XPv0hmBuuI
 E6k7wODsCuM6f6AuN/kQEb6/uNwhU7OCUXQlRwhNfsxVNluGGmM002ocNS+z+3pomun+
 JDAqVv3OZ5pzbKeV6NYBVjdPdZeeGNRlWPB+sWQV3VmKO5STb5chPjZpqFQGsw4SZ9S1
 vrOd/XcrIPW9WYKojX33jPzird5MhJT1K3+f+/jJG/fCX3b+y83SYn2V/i+el2yw0wO4
 KDBgmjFLxu0wSTlYrV0lL6mb4ViK28dtMj3YibOBQVmxHa48Z47K4CCO23MWtQwl+FqD
 LKJA==
X-Gm-Message-State: AOAM530icaQnU8RQpMGDaZz9KJZP2Z5gvGHsD5nAH2UR089khGGHFYdd
 bBNN13PVMdQ7FizBBiyEeFM1yG804+KeGCy4
X-Google-Smtp-Source: ABdhPJzNQg8ByMbIOtPrlbE2iiqSgkltGAKXdz/c3IsithtAJh2PbsvKM9KsgmhLs882BmaFn7J5YQ==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr2673044wru.291.1610544470622; 
 Wed, 13 Jan 2021 05:27:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l16sm3383241wrx.5.2021.01.13.05.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:27:49 -0800 (PST)
Date: Wed, 13 Jan 2021 14:27:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: stop using GFP_TRANSHUGE_LIGHT
Message-ID: <X/71UyN5bxZCr3pe@phenom.ffwll.local>
References: <20210113131325.223511-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113131325.223511-1-christian.koenig@amd.com>
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
Cc: hdegoede@redhat.com, ray.huang@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 02:13:25PM +0100, Christian K=F6nig wrote:
> The only flag we really need is __GFP_NOMEMALLOC, highmem depends on
> dma32 and moveable/compound should never be set in the first place.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Needs Fixes: line and References to the GFP_TRANSHUGE_LIGHT report from
Hans and for the chromium report for the mmap fail. With those:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also I guess really time for me to stitch together that hack to catch
dma-buf sglist struct page abusers ...
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 8cd776adc592..11e0313db0ea 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -79,12 +79,13 @@ static struct page *ttm_pool_alloc_page(struct ttm_po=
ol *pool, gfp_t gfp_flags,
>  	struct page *p;
>  	void *vaddr;
>  =

> -	if (order) {
> -		gfp_flags |=3D GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
> +	/* Don't set the __GFP_COMP flag for higher order allocations.
> +	 * Mapping pages directly into an userspace process and calling
> +	 * put_page() on a TTM allocated page is illegal.
> +	 */
> +	if (order)
> +		gfp_flags |=3D __GFP_NOMEMALLOC | __GFP_NORETRY |
>  			__GFP_KSWAPD_RECLAIM;
> -		gfp_flags &=3D ~__GFP_MOVABLE;
> -		gfp_flags &=3D ~__GFP_COMP;
> -	}
>  =

>  	if (!pool->use_dma_alloc) {
>  		p =3D alloc_pages(gfp_flags, order);
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
