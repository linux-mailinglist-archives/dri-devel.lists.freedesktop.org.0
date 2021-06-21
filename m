Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2F3AEBCF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749006E1A3;
	Mon, 21 Jun 2021 14:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC4F6E1A3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:54:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id w13so4106932wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XLVAZwAxuXNsGaV6lvPX7vIKs+0qO2BfXOSpcxK89hk=;
 b=CeFZUpYWyygSdLxxQ3eB4z2Nk6uk921eYPoXBo/JPjyJbOyoFIWC5KOrJYX4j73pY3
 2iOfXdUrkwhkp58y6/RPMu8y2ZruriZjHFk2+m1BZYRkvu05V3lLx8/GS8Gt0Bz8pRUZ
 kdfSXYYgrKfPrI7nD2Svww6QvgK98Vroo5+tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XLVAZwAxuXNsGaV6lvPX7vIKs+0qO2BfXOSpcxK89hk=;
 b=kZLa8wsMIb2wxz0x/ktXzfKZ0Gas+ARL9WzRY3jWssM89Pshiw7ldMr5QGC1TxrE/M
 YSE+oS6+uoyvH1Hd+WLbyO0oU/FuLzCYB1qwcZSqncWneY/0+YPz4rilGbHaRIxsViGe
 QtWK1exclzxUorUoGocgxiq13u/ww+O6awtbtwPVGl9Z9di9Rd8YzNsaa41z/j7kgQbF
 SIWe9RrppqbGkZe04+jw+KFWkD9MA6VxlZ6/eLCjBkKVm4nqrnJErAtBTd4q5h2Ad6ff
 7rnsvJ/I/ZqFuk2uEnicLy1KubunrNoqLXZfp7DHaUnJXC/P7HwxR7fA8pfgQlaPrj0n
 lowQ==
X-Gm-Message-State: AOAM530E+WLqowIs3irrHH6LNq+RsiJsbDK9bg+a3GJI96jQoFn1loRD
 rQ9WCGv7sPDpjt5/GokSrx1MCQ==
X-Google-Smtp-Source: ABdhPJyQ0JSmH8QndMZrr5AL5YLnvQqlqh8f8Kc50ydxa8bqPvF6adZqTFdw3Y3grNzRd/IgPkjjIA==
X-Received: by 2002:a05:600c:281:: with SMTP id
 1mr25368979wmk.171.1624287277670; 
 Mon, 21 Jun 2021 07:54:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n4sm4429425wrw.21.2021.06.21.07.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 07:54:37 -0700 (PDT)
Date: Mon, 21 Jun 2021 16:54:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/3] drm/nouveau: wait for moving fence after pinning
Message-ID: <YNCoK1qv6CCIy0Rl@phenom.ffwll.local>
References: <20210621130328.11070-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210621130328.11070-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 03:03:26PM +0200, Christian König wrote:
> We actually need to wait for the moving fence after pinning
> the BO to make sure that the pin is completed.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@kernel.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_prime.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index 347488685f74..591738545eba 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -93,7 +93,13 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
>  	if (ret)
>  		return -EINVAL;
>  
> -	return 0;
> +	if (nvbo->bo.moving) {

Don't we need to hold the dma_resv to read this? We can grab a reference
and then unlock, but I think just unlocked wait can go boom pretty easily
(since we don't hold a reference or lock so someone else can jump in and
free the moving fence).
-Daniel

> +		ret = dma_fence_wait(nvbo->bo.moving, true);
> +		if (ret)
> +			nouveau_bo_unpin(nvbo);
> +	}
> +
> +	return ret;
>  }
>  
>  void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
