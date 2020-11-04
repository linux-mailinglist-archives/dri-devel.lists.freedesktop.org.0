Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37C52A6BE1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 18:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB986E0CA;
	Wed,  4 Nov 2020 17:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BB06E0CA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 17:38:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x7so22985449wrl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 09:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1Uq05JHaAUVx9vyz+vgRmmzwKCL7BFrV7nV2QiqnhUo=;
 b=gUDl2HAUPgUdrASzoWgsoG1915/uk+kPyMsKTpacNVoUKt625M+aICjM72qzTQoFZh
 WHM8fO6zf2fqm4QMwOGwXSUA/mCLyXKy3tqnWCAr0ioYWdKr6+4EB0Xmig9k0YK5S8Al
 0ypD8tC8ZNxouXBZJhNRv7DSfd3m9d76K3m6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1Uq05JHaAUVx9vyz+vgRmmzwKCL7BFrV7nV2QiqnhUo=;
 b=NGbsoFTeG5u7J+Jr8lGJinpCpio9ADfRQ5P9yozhRzSEL5oETvChXy5NV2lQ4QSib4
 7aqxDhsA/ROllvi7OnIv859iJsxLoBtaHvGQ66Rp3G0gNRnGctqUyG5YhHgDD4Ja0NNf
 Ubrxw/WF7UpSriKikgMjyAxCM5DfgSrZFlwtBGkTRnitZ3Cvzel60RymHa/bQ/pz0K3G
 Q4706OkhBYg7xKTybukVrdB/beH9K4sfNMBHxVMS1hvm+RGbF8Ee3i7HrVm9Gc1tjkqQ
 Sd/LeSb3qHTJ/1QJHj9ACRVDairH8bswace4o2jE1Zb5kLE9ZQhycfiqo4X5510JAeuy
 gPKw==
X-Gm-Message-State: AOAM5338kEr7byKEBoo2qcJJGo6UhJM1zh7nL7mAAFGAo0a+FfU4ozwi
 6S16BSA+Ob0k+4F3yYBO1EReQw==
X-Google-Smtp-Source: ABdhPJwzb2CT42AJSs03QdhIYq2K+rWZZWi1HCi6exb1rCeyFsGxsjQ5uyiZJ/Z9gk1gZjlG2wDKfg==
X-Received: by 2002:a05:6000:36f:: with SMTP id
 f15mr33167936wrf.78.1604511482916; 
 Wed, 04 Nov 2020 09:38:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u5sm3024637wml.13.2020.11.04.09.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 09:38:02 -0800 (PST)
Date: Wed, 4 Nov 2020 18:38:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/4] drm/radeon: stop using pages with
 drm_prime_sg_to_page_addr_arrays
Message-ID: <20201104173800.GP401619@phenom.ffwll.local>
References: <20201104130024.264974-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104130024.264974-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 02:00:21PM +0100, Christian K=F6nig wrote:
> This is deprecated.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

So I tried to prove to myself that ttm doesn't access ->pages for these
cases, and kinda couldn't. We still seem to allocate the pages array and
all that, and there's lots of code using ->pages all over. And between
ttm_bo_type_sg and TTM_PAGE_FLAG_SG I didn't manage to chase a whole lot
of paths to their full conclusion.

So I reduced my ambitions and wanted to prove that at least for dma-buf
imports aka ttm_bo_type_sg, we're guaranteed that we don't try to mmap
these to userspace. And also failed to find that check.

btw this is across all drivers, mostly ttm code, not radeon specific.

So conclusion, still a mess here that at least I can't see throug clearly
:-/ here =3D ttm_tt and the entire backing storage handling and everything
that ties into it. Probably the area that still has the most midlayer feel
to ttm with all the refactoring in-flight in still.

tldr; tried to review patches 1-3, gave up.

Cheers, Daniel

> ---
>  drivers/gpu/drm/radeon/radeon_ttm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 95038ac3382e..f41fcee35f70 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -494,8 +494,8 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_bo_de=
vice *bdev, struct ttm_tt *
>  	if (r)
>  		goto release_sg;
>  =

> -	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
> -					 gtt->ttm.dma_address, ttm->num_pages);
> +	drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL, gtt->ttm.dma_address,
> +					 ttm->num_pages);
>  =

>  	return 0;
>  =

> @@ -673,8 +673,9 @@ static int radeon_ttm_tt_populate(struct ttm_bo_devic=
e *bdev,
>  	}
>  =

>  	if (slave && ttm->sg) {
> -		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
> -						 gtt->ttm.dma_address, ttm->num_pages);
> +		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
> +						 gtt->ttm.dma_address,
> +						 ttm->num_pages);
>  		return 0;
>  	}
>  =

> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
