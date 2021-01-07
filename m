Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A832ED664
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 19:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668D96E48C;
	Thu,  7 Jan 2021 18:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96136E4B1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 18:08:01 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t16so6565452wra.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 10:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wGoiidMHz8t7Nlo+6hdGgFlQcakaOeGgVDEu54EY9eM=;
 b=V3RtjHiVZTwHt4CEaP5BHMPrH6OrnSQ2+Tl56mXX1FLH2e5yooKoc9HswJjkCqOZA9
 7CaSjZImUCFzlWOVmZXELZnmyHrKZKXcjNWCBC/US1f7q4l8g+XJIjjA0xmpzHScGW9f
 qvVEYeBVJVJPev0hOEoZX2M/SFnBsRcQ3djhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wGoiidMHz8t7Nlo+6hdGgFlQcakaOeGgVDEu54EY9eM=;
 b=Bkt6X6Aq+sv5MicbatDh8lTUdX3G0XZijyQFnYrjWcBE2JwSIKmo51AD/9eAuEYqPV
 WDBO+iY92B6bn8SbBh9+pXwgOlbiGLa/0jTCRrgr+9olPgeZajLS5Ol9MYmUwRhzBO9q
 mFzVhKUDlBE8GLFpIV0hV2EAkQ6BPLo39JtFjZwdf8Q7zapeGY/UHs0VLNvu0TMaKDw3
 r7Dvl2yYlqk+tkR7dxWVUXmzXA1cGlKsfJAcfSuQuFKX/asPli8W6ANicZbG8JDl0uVr
 dWy4XU0dmAudsdbq3pbbW34tHe0F27Aqr3IRn3r1fH3OMLqLACIPq/WwUUjpl9GLgq4r
 NU3g==
X-Gm-Message-State: AOAM533QJUJVGYkCbibGu2+INrrW79gdB/kdFWK/wuo8f6eZTuMh1NIU
 GPSDRz+jd9MOel8LonmcYNcqtw==
X-Google-Smtp-Source: ABdhPJxLTRPnSqHS0bPohlc6/QsONxqhxq7SrtoJGd6k+648J1Spgwjtch68KAGbLtapxkkhGrnAjw==
X-Received: by 2002:adf:94c7:: with SMTP id 65mr9835120wrr.423.1610042880415; 
 Thu, 07 Jan 2021 10:08:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v11sm9332372wrt.25.2021.01.07.10.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 10:07:59 -0800 (PST)
Date: Thu, 7 Jan 2021 19:07:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] drm/radeon: stop re-init the TTM page pool
Message-ID: <X/dN/YFtnVAIllds@phenom.ffwll.local>
References: <20210105182309.1362-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105182309.1362-1-christian.koenig@amd.com>
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
Cc: ray.huang@amd.com, bp@alien8.de, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 07:23:08PM +0100, Christian K=F6nig wrote:
> Drivers are not supposed to init the page pool directly any more.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Please include reported-by credits and link to the bug reports on
lore.kernel.org when merging this. Also I guess this should have a Fixes:
line?

And maybe some words on how/why stuff blows up.
-Daniel

> ---
>  drivers/gpu/drm/radeon/radeon_ttm.c | 3 ---
>  1 file changed, 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index d4328ff57757..35b715f82ed8 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -729,9 +729,6 @@ int radeon_ttm_init(struct radeon_device *rdev)
>  	}
>  	rdev->mman.initialized =3D true;
>  =

> -	ttm_pool_init(&rdev->mman.bdev.pool, rdev->dev, rdev->need_swiotlb,
> -		      dma_addressing_limited(&rdev->pdev->dev));
> -
>  	r =3D radeon_ttm_init_vram(rdev);
>  	if (r) {
>  		DRM_ERROR("Failed initializing VRAM heap.\n");
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
