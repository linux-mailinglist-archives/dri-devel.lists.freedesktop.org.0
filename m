Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21E2A7F1F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76106E0F3;
	Thu,  5 Nov 2020 12:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364EB6E0F3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:55:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c18so1492526wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 04:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sFwOKwB2TNg5TpBmFBl5Lu91vN07WmDYle2rnuxKBWY=;
 b=cnbVLxUR5S3r9xHOthcnJT9saBH8TcY57c6umuRXT+99+GGcr6qiIGjUrwuUx6os/3
 374Tqx1o0UtjgAwurK6qBvskAcm/W9HLQjEG9nVbMEuDPdtDZKkgAcK+14zVmTXMXlrm
 7CI0Jvy44b1r2XUQJuygJrhv6CXq4WDHdCOzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sFwOKwB2TNg5TpBmFBl5Lu91vN07WmDYle2rnuxKBWY=;
 b=Y2LLS+0Vl2DUC7YupNErz4GYGOaD1QKsAwGfY1eaZdDsQxENXCkQDX6Z8CBr6EmASm
 pWMYHNXSpNG1hQz3JOUoQdkPvLdUSa8wO2Gfk7wDPGYrskc/xzm48N6CTu+Bf/g/CF6L
 UrntTxOhbGgV3AzNiuO/a0/T8nBodDDHAtS9OPxQG6JcUgR5MNCELibNOCAuKSUpXuHE
 YjVvNtWe6Db7U1gEs063nbied9K2GMj4Ak3QtviEY0Wi9uQuCWxCTKtxbTVralzcPueP
 6MH94D2y9t2AjXDW6Hl1DJESJO/7NM0E/InPQrBEMVD+PQSvesCsYweqXZkOr4V3vIoP
 r92A==
X-Gm-Message-State: AOAM531slAxXogurmFNRVyLA20L/OxIddaPGvOkqATpn3R4KoAK0468D
 QyRJ2l3WPD7j1WfSRn6NcsrHBQ==
X-Google-Smtp-Source: ABdhPJwyy473jBgFmkYyk3BbjYwzWA5cm/jUE455bctr7sNSz1V+VWohOSk9h+DcwDoLjLXXnFfQCw==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr2587815wmj.69.1604580937910; 
 Thu, 05 Nov 2020 04:55:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s12sm2332692wmc.6.2020.11.05.04.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 04:55:37 -0800 (PST)
Date: Thu, 5 Nov 2020 13:55:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/4] drm/amdgpu: stop using pages with
 drm_prime_sg_to_page_addr_arrays
Message-ID: <20201105125535.GX401619@phenom.ffwll.local>
References: <20201104130024.264974-1-christian.koenig@amd.com>
 <20201104130024.264974-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104130024.264974-2-christian.koenig@amd.com>
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

On Wed, Nov 04, 2020 at 02:00:22PM +0100, Christian K=F6nig wrote:
> This is deprecated.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Ok you convinced me that amdgpu is safe. Maybe for completeness paste the
explanation you put into the other mail into the commit message here (just
the entire thing seems fine).

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index c01c060e4ac5..d6781b479839 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1036,8 +1036,8 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_=
device *bdev,
>  		goto release_sg;
>  =

>  	/* convert SG to linear array of pages and dma addresses */
> -	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
> -					 gtt->ttm.dma_address, ttm->num_pages);
> +	drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL, gtt->ttm.dma_address,
> +					 ttm->num_pages);
>  =

>  	return 0;
>  =

> @@ -1382,7 +1382,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_dev=
ice *bdev,
>  			ttm->sg =3D sgt;
>  		}
>  =

> -		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
> +		drm_prime_sg_to_page_addr_arrays(ttm->sg, NULL,
>  						 gtt->ttm.dma_address,
>  						 ttm->num_pages);
>  		return 0;
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
