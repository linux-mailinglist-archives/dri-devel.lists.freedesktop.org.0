Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9D35F07F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 11:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CF66E42A;
	Wed, 14 Apr 2021 09:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBE36E42A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 09:13:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id w186so5667878wmg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 02:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OIzEEKGbXSUxV0BFFxrpm4FJM7eI7hxjy1mKKNjLC6o=;
 b=kjzL3nZUzg0DsVDYIsLumzaYBInR53fR1KxWpAOjzhfStb8P70iwhbbuZTcBWyRZRb
 XH8eZ6WRwjk90QZqKEoQcmYDpxJxwvbGvD1ygk6q6i0iRjFAvK4GFi/GAU62gSCWvnXM
 q/rHF8NjBL3M/U9kS0qRhOHKdoiuZyxymUc4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OIzEEKGbXSUxV0BFFxrpm4FJM7eI7hxjy1mKKNjLC6o=;
 b=tMZ1UHEiNt8NK2nhDK6pa+VN8H/+bbfqhNfeUN4XHV6WpQf+gH6FoUn6cl+UP1N99b
 9VKbt2vKZJa2ELkKT1yCZ75JDWzOMQnnmG8HJVsN1CuiXtUQfknXPPvyPX1nfEXY12mD
 OS3AC9sU2XsaJjgTSwne9NBd7DQvryT03BmN28zzgZ0g9svmK9JMRP7UJHCmW/ZGeJFd
 Uu9ssN1YiN6oZKkcYdDK2qa59qU7IQBK6nVpEvnKURLmPf5lYc5Sn0s89pz3WFEkQsR9
 denbNy7MP5rC48qyj88hFj8xbgO7DtVCkJy2T4ibCEiyPQ/YXLWV5q4L0/asc66IlDv+
 t/Gw==
X-Gm-Message-State: AOAM532XWtXvsVuU/mbpJ7kNV5iBPgAVdVQ/W7tqdIi5MfxASDVBdqMX
 03L7Z+xAeATF+n4zkRJ0tdaHTw==
X-Google-Smtp-Source: ABdhPJzejj/5Yu1iS+o8ffJDp21zbtEGT43TpaptRRsR2OF7i2Q3ONIBzWMBjCd9Y1WDutNtrLP/lQ==
X-Received: by 2002:a1c:e3c3:: with SMTP id a186mr1934953wmh.81.1618391607157; 
 Wed, 14 Apr 2021 02:13:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s9sm4927801wmh.31.2021.04.14.02.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 02:13:26 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:13:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against
 pages_limit
Message-ID: <YHayNOd6fRc0i31Z@phenom.ffwll.local>
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
 <20210414064621.29273-9-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414064621.29273-9-Felix.Kuehling@amd.com>
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
Cc: amd-gfx@lists-freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 02:46:20AM -0400, Felix Kuehling wrote:
> Pages in SG BOs were not allocated by TTM. So don't count them against
> TTM's pages limit.
> 
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>

This sounds like papering over the lack of shrinker in ttm. Do we
guarantee that someone else has already accounted these buffers against
the ttm memory hard-limit anywhere? If not I think this needs to wait for
the shrinker work to get solid, since fixing the double-accounting for
this is probably not worth it.
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_tt.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 5d8820725b75..e8b8c3257392 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -317,9 +317,12 @@ int ttm_tt_populate(struct ttm_device *bdev,
>  	if (ttm_tt_is_populated(ttm))
>  		return 0;
>  
> -	atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> -	if (bdev->pool.use_dma32)
> -		atomic_long_add(ttm->num_pages, &ttm_dma32_pages_allocated);
> +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> +		if (bdev->pool.use_dma32)
> +			atomic_long_add(ttm->num_pages,
> +					&ttm_dma32_pages_allocated);
> +	}
>  
>  	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
>  	       atomic_long_read(&ttm_dma32_pages_allocated) >
> @@ -350,9 +353,12 @@ int ttm_tt_populate(struct ttm_device *bdev,
>  	return 0;
>  
>  error:
> -	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> -	if (bdev->pool.use_dma32)
> -		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
> +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> +		if (bdev->pool.use_dma32)
> +			atomic_long_sub(ttm->num_pages,
> +					&ttm_dma32_pages_allocated);
> +	}
>  	return ret;
>  }
>  EXPORT_SYMBOL(ttm_tt_populate);
> @@ -382,9 +388,12 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>  	else
>  		ttm_pool_free(&bdev->pool, ttm);
>  
> -	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> -	if (bdev->pool.use_dma32)
> -		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
> +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> +		if (bdev->pool.use_dma32)
> +			atomic_long_sub(ttm->num_pages,
> +					&ttm_dma32_pages_allocated);
> +	}
>  
>  	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
>  }
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
