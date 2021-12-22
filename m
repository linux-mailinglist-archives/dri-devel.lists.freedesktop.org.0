Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2A047D8BD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7617B10E2D4;
	Wed, 22 Dec 2021 21:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDA710E2D4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:30:41 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w16so13528020edc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cRuxaJUssp+3x7yqlysYE2p8OoJ6aDX0xXr2ZckK16U=;
 b=KP2ZB8x9mT1Rkak3thP1kypDm8oatJJtSsCJZnCX2xS28QtkRB2qgE4fihR14jxAAC
 g1F3xxGk7NNzdhhsyxgdLZBxvhrrbDboX+KahX37I1+aR1X9+nSsmcHSn7bO0ysKrZNd
 IO/IP3UvQVGLj3h1SjMf+VjJlm5+pgIkT7iKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cRuxaJUssp+3x7yqlysYE2p8OoJ6aDX0xXr2ZckK16U=;
 b=Pme0V/0+DHatb19yEY/TVnPlXLxWYleND2qYndCRBP/H0LGkuJJwhjpCqslSxG1x7o
 xSbsR0E6Ue46LpwBjJqP5cbpzaPz5u+wv9EDqfxWxdz7odm+hpCFbHtHV+AgdUUAoV6y
 ibtLuJYx07jmCuJIh21psfGsmFvANGcl+EJGDK/Y8l3AiMekPnCq8aygKg/WiL+u7jQC
 LpQXQmRh1aD0WVlFFHbPJ/7CYVbAsQi82izJpeMcv/wJZun+/5y45fH97S6gKTjjEhEa
 WgA6N0v1GkI5BeBBMjxmIyL2ChHiUXTdCTgPzorQ3pKPfmeeCDYrCA1F7WKCyd/jC9mJ
 FTkQ==
X-Gm-Message-State: AOAM530qcATtGX6PFnHiwyY6uGv4o/aWvbZU0ReMuFUCQzdKoe+N5WfZ
 IW6zEkxUOaCXhJx+KdJPcCnMMQ==
X-Google-Smtp-Source: ABdhPJwK4laAQJWZO9107YfUXlS+5KTEbT9Av7yKnW08IQXOuHhQ+uXbytjjJxGVeJE7kHRHfqd8rw==
X-Received: by 2002:a17:907:7241:: with SMTP id
 ds1mr3868968ejc.695.1640208640204; 
 Wed, 22 Dec 2021 13:30:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b10sm1320362ede.52.2021.12.22.13.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:30:39 -0800 (PST)
Date: Wed, 22 Dec 2021 22:30:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 09/24] drm/radeon: stop using dma_resv_excl_fence
Message-ID: <YcOY/jR9nogI7yzU@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-10-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-10-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 01:33:56PM +0100, Christian König wrote:
> Instead use the new dma_resv_get_singleton function.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/radeon/radeon_display.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 573154268d43..a6f875118f01 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -533,7 +533,12 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
>  		DRM_ERROR("failed to pin new rbo buffer before flip\n");
>  		goto cleanup;
>  	}
> -	work->fence = dma_fence_get(dma_resv_excl_fence(new_rbo->tbo.base.resv));
> +	r = dma_resv_get_singleton(new_rbo->tbo.base.resv, false, &work->fence);
> +	if (r) {
> +		radeon_bo_unreserve(new_rbo);
> +		DRM_ERROR("failed to get new rbo buffer fences\n");
> +		goto cleanup;
> +	}

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	radeon_bo_get_tiling_flags(new_rbo, &tiling_flags, NULL);
>  	radeon_bo_unreserve(new_rbo);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
