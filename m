Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEB63FC80C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8168F89EEB;
	Tue, 31 Aug 2021 13:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9B189EEB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 13:18:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id n5so27577322wro.12
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 06:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pojVvlYPw6akJu8kFiLib5Zg8V2u8kGm1HhQe0vCyXk=;
 b=QnA60cVhJamnzIT90YiN+PatfD16+1Eba7nCb9g8XDTrs9kDn4H+EN78ukz+R0KANo
 yZNMcWQ/+k4dcVQGJhM8A86dHwU84UgVMyubJn/NcxRfFCpSER5zV7LBdnzFZa/kPqMf
 6aYknfnT71yp7JD3oQ1GZjSU6c36RHlr7nz+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pojVvlYPw6akJu8kFiLib5Zg8V2u8kGm1HhQe0vCyXk=;
 b=WDl86O6k2rZUebQVleDD3b8NPy0TsConWhlHV4KsflSrp1dBhAPuEW09+7ToYnKh7R
 AFFMxFf2LKvULlH4dKsl1XY/M8auydBX7Bqbc9OGXWzCWlaKoiMnu5ev2EN8SAlSnLMz
 28ikZb9my3BJR0fJSnb87AqaphjmZ55Mw4CCZHDe+iSbyg6Y1OnYQVACmucswxi3wZoP
 qvzIzWOev9EvDHRDENUWkbyi+fBn8imDfLmbu8voCvgPGLYD+clIEmsDu6aX+I006P0D
 O3bORBOiKkzo1n+lLUQmWmEgd/0k1VxI8YzGoOgoDnMqTwVy/9sX/nmjCVhPNechQ//f
 4gzw==
X-Gm-Message-State: AOAM530gGIC5/5UmAPUJxRBaPpZWvEX+r9EWkRr4Lq8ymphVxe4AiPKM
 MrlmhdSDMDMKBZn1XXxNDjxDSA==
X-Google-Smtp-Source: ABdhPJyYYBU93luHYywdSRG6Z8r/7jJNfeB53863ugafvR/TIgSUouu8cj+M0udtO6zDGvN808P2fg==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr30987879wrq.213.1630415926903; 
 Tue, 31 Aug 2021 06:18:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d145sm2424434wmd.3.2021.08.31.06.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 06:18:46 -0700 (PDT)
Date: Tue, 31 Aug 2021 15:18:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 ray.huang@amd.com
Subject: Re: [PATCH 2/5] drm/ttm: add busy and idle placement flags
Message-ID: <YS4sNDmk/HKowHxr@phenom.ffwll.local>
References: <20210831112110.113196-1-christian.koenig@amd.com>
 <20210831112110.113196-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210831112110.113196-2-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 31, 2021 at 01:21:07PM +0200, Christian König wrote:
> More flexible than the busy placements.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c    | 8 +++++++-
>  include/drm/ttm/ttm_placement.h | 6 ++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 0a3127436f61..c7034040c67f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -834,6 +834,9 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>  		const struct ttm_place *place = &placement->placement[i];
>  		struct ttm_resource_manager *man;
>  
> +		if (place->flags & TTM_PL_FLAG_BUSY)
> +			continue;
> +
>  		man = ttm_manager_type(bdev, place->mem_type);
>  		if (!man || !ttm_resource_manager_used(man))
>  			continue;
> @@ -860,6 +863,9 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>  		const struct ttm_place *place = &placement->busy_placement[i];
>  		struct ttm_resource_manager *man;
>  
> +		if (place->flags & TTM_PL_FLAG_IDLE)
> +			continue;
> +
>  		man = ttm_manager_type(bdev, place->mem_type);
>  		if (!man || !ttm_resource_manager_used(man))
>  			continue;
> @@ -869,7 +875,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>  		if (likely(!ret))
>  			return 0;
>  
> -		if (ret && ret != -EBUSY)
> +		if (ret != -EBUSY)
>  			goto error;
>  	}
>  
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index 8995c9e4ec1b..63f7217354c0 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -53,6 +53,12 @@
>  /* For multihop handling */
>  #define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>  
> +/* Placement is only used when we are evicting */
> +#define TTM_PL_FLAG_BUSY	(1 << 3)
> +
> +/* Placement is only used when we are not evicting */
> +#define TTM_PL_FLAG_IDLE	(1 << 4)

Using an enum for this (with BIT() macro or so) and then slapping
kerneldoc on top would be nice. That way you can also use the same enum in
parameters and structures and it's all a bit easier to find and connect.

Otherwise I think this series makes sense, but probably better for nouveau
folks to do review/testing.
-Daniel

> +
>  /**
>   * struct ttm_place
>   *
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
