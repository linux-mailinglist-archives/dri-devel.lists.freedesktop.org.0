Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B23A7DC1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 14:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E29489FD3;
	Tue, 15 Jun 2021 12:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF14489FD3;
 Tue, 15 Jun 2021 12:02:01 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id t7so5534671edd.5;
 Tue, 15 Jun 2021 05:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=74xg67OkPNrW2Sf6CPxy6eTp/ulR0UM1WRVVLNUMsnU=;
 b=I4LcX4TbN0Nk/BRMN3YfqoZGm2V9ZG3YBAdPBZXox0PBCHSKH5PRzigLushvL6+mEC
 6p9QX7Oxj9aTUkKXNk8ioCbZfKASXXiPmoRo7lnz2nxjV5wDoQDaUD0ypae+UAHS6NE5
 xHJ0RRBCAEq8Csqn5QMOJWAQ+EBOom7XURjk0L8P+pfk51Re3HhsoOjJ+8z7MUIZajvb
 spzy+wXHur3icJnFDnSp5iBpnvL/UW0tp0ofbfhfc6UO68b6zRcwkiM8LrrJuGEDGHEy
 r+pYGJCaVtGl48L92kOJZsrauVb+vA36A3jNlbuBzPgNdtKFH0IBSPe7m3RqUTlDXnoJ
 gjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=74xg67OkPNrW2Sf6CPxy6eTp/ulR0UM1WRVVLNUMsnU=;
 b=AWfGJtwfhaBkMnIbdd03eNotXEpx+h4RP8NOZrPetaykBA5zah06WyEpRTmXWYYtWb
 FFAt+H4CMBsHsEhGshOIvgkJ7xK5pgpPLwA2jw2EOWqi9/Pw0UOE1zUjsGSV9vbMjnR5
 ZwxAqazbtYxPD0CRyP0u8GpEWtTb75k2+9zI7AkGR9v+9azpq6yZz+/M+zGyrwMd/YqC
 kP/8e54vC60cReKWoOKqmv7vtApAJBU5Fo/m/wz1+PIYx2PbvJUVgjxh5QxfWWzvLwyv
 oxBo9mu6yKXABGTf2DGdtXakFHQ8Ho76wJfvt/aOxoBa93hFHCl17vUrK+tcYMmLX3yg
 mGIA==
X-Gm-Message-State: AOAM531tim8NKw/5JP+N59k8ACTe8huGJiuHpSjDZbZL0c8vuA2J7Zbh
 MHpvZREoNJ2x2YcupWKqBTb/HBAeACM=
X-Google-Smtp-Source: ABdhPJzySIFiU8i9IsyVB71fD9wU9397xyKaPuwCtIWzRAQO79qZZ73IGTMZVdDEaXyLKHNwI51WPw==
X-Received: by 2002:a05:6402:8d3:: with SMTP id
 d19mr22523821edz.321.1623758520506; 
 Tue, 15 Jun 2021 05:02:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f438:4e93:3853:400c?
 ([2a02:908:1252:fb60:f438:4e93:3853:400c])
 by smtp.gmail.com with ESMTPSA id c19sm11704904edw.10.2021.06.15.05.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 05:02:00 -0700 (PDT)
Subject: Re: [RFC PATCH] drm/ttm: Do page counting after populate callback
 succeed
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210615115746.27424-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f70e88b3-f0db-fca8-f05e-f685f1a913ad@gmail.com>
Date: Tue, 15 Jun 2021 14:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210615115746.27424-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.06.21 um 13:57 schrieb xinhui pan:
> Amdgpu set SG flag in populate callback. So TTM still count pages in SG
> BO.

It's probably better to fix this instead. E.g. why does amdgpu modify 
the SG flag during populate and not during initial creation? That 
doesn't seem to make sense.

Christian.

> One easy way to fix this is lets count pages after populate callback.
>
> We hit one issue that amdgpu alloc many SG BOs, but TTM try to do swap
> again and again even if swapout does not swap SG BOs at all.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 32 +++++++++++++-------------------
>   1 file changed, 13 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index a1a25410ec74..4fa0a8cd71c0 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -317,13 +317,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	if (ttm_tt_is_populated(ttm))
>   		return 0;
>   
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> -		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> -		if (bdev->pool.use_dma32)
> -			atomic_long_add(ttm->num_pages,
> -					&ttm_dma32_pages_allocated);
> -	}
> -
>   	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
>   	       atomic_long_read(&ttm_dma32_pages_allocated) >
>   	       ttm_dma32_pages_limit) {
> @@ -342,6 +335,13 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	if (ret)
>   		goto error;
>   
> +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> +		if (bdev->pool.use_dma32)
> +			atomic_long_add(ttm->num_pages,
> +					&ttm_dma32_pages_allocated);
> +	}
> +
>   	ttm_tt_add_mapping(bdev, ttm);
>   	ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
>   	if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
> @@ -355,12 +355,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	return 0;
>   
>   error:
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> -		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> -		if (bdev->pool.use_dma32)
> -			atomic_long_sub(ttm->num_pages,
> -					&ttm_dma32_pages_allocated);
> -	}
>   	return ret;
>   }
>   EXPORT_SYMBOL(ttm_tt_populate);
> @@ -384,12 +378,6 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>   	if (!ttm_tt_is_populated(ttm))
>   		return;
>   
> -	ttm_tt_clear_mapping(ttm);
> -	if (bdev->funcs->ttm_tt_unpopulate)
> -		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
> -	else
> -		ttm_pool_free(&bdev->pool, ttm);
> -
>   	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>   		if (bdev->pool.use_dma32)
> @@ -397,6 +385,12 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>   					&ttm_dma32_pages_allocated);
>   	}
>   
> +	ttm_tt_clear_mapping(ttm);
> +	if (bdev->funcs->ttm_tt_unpopulate)
> +		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
> +	else
> +		ttm_pool_free(&bdev->pool, ttm);
> +
>   	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
>   }
>   

