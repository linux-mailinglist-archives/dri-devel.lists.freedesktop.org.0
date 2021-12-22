Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52FD47D8CC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D386F10E2D5;
	Wed, 22 Dec 2021 21:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7CD10E2D5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:31:57 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id m21so14902947edc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2T7m6MaySg2FvxYaYRTpWc42tSr8dmW3Qbv0jXUALeY=;
 b=dMgTo6RrvNQuOM8G52QyijpF7jh0AkCNEt6cihbEwJB3TckVCPvdeWvsTQjiqHo2m9
 zR+r9ZaHWGVyGRSR2lE4zCtt7QaKDhmDH1aySG52CYxDTZWnN948zrMxyoiobIRvkc0T
 1mPDnmZok26tFdbr61Q8wFql62SZstlpxlp98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2T7m6MaySg2FvxYaYRTpWc42tSr8dmW3Qbv0jXUALeY=;
 b=8KObfJ/G8+ft/HKS+pDEtZHpEFl6QchA8vZ6iivP4LY4DcF4t7PH+5xkiQjLcbzmnb
 VLUr1Xlv6rJ7N3egapIOFDih5rcFBlk7ltcjB6RxdKqOw39UmEMOHzf6CK1zVQkvplPf
 C+gLdx/fGq4kyPz7kM+3Fs3TT50utd2/xNk2Z2ppXy2W/UwPQQIRfOi3eC7Kf6cY0JXz
 8XZMv4aRYR/7X7j6PAjzyF7jFJ34OOmdynxCFhi+frzPwM5BcuefF8MMjv1QGI+l5aD7
 RQIDsB612+P1JM2jdfaXuhKj+CIRqkxawYBNWB2BESzd+Lsjo1ZiqbxrZaXMn99yGm44
 bCMw==
X-Gm-Message-State: AOAM5339FyFqgcI4RQRwWQmeJRRYszf4KMo8Mi0Kf+WARiO4DAPRyUN9
 d9ERHLErJ4Wa8XE74poISze3wm0Ouw7nDg==
X-Google-Smtp-Source: ABdhPJwzKn8NHPstNozIVE3zEuBv/ScM3bK17X1lHdgr1ouDigeX0VV5H0WqaeFXBBWpV7d0iw64EQ==
X-Received: by 2002:a17:906:eb56:: with SMTP id
 mc22mr3849902ejb.331.1640208716064; 
 Wed, 22 Dec 2021 13:31:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id zh8sm1061978ejb.1.2021.12.22.13.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:31:55 -0800 (PST)
Date: Wed, 22 Dec 2021 22:31:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 08/24] drm/vmwgfx: stop using dma_resv_excl_fence
Message-ID: <YcOZSc3Z1hf5lPlA@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-9-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-9-christian.koenig@amd.com>
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

On Tue, Dec 07, 2021 at 01:33:55PM +0100, Christian König wrote:
> Instead use the new dma_resv_get_singleton function.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index 8d1e869cc196..23c3fc2cbf10 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -1168,8 +1168,10 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
>  		vmw_bo_fence_single(bo, NULL);
>  		if (bo->moving)
>  			dma_fence_put(bo->moving);
> -		bo->moving = dma_fence_get
> -			(dma_resv_excl_fence(bo->base.resv));
> +
> +		/* TODO: This is actually a memory management dependency */
> +		return dma_resv_get_singleton(bo->base.resv, false,
> +					      &bo->moving);

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	}
>  
>  	return 0;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
