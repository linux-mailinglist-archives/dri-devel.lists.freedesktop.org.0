Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562CE93C162
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 14:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03F610E775;
	Thu, 25 Jul 2024 12:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GLEzvhmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555C710E775
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 12:02:58 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5971b2be6b2so115308a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 05:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721908977; x=1722513777; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mf8aiHGco5imI6f94w6HLonBSVFjSGNh+4DGns98AUw=;
 b=GLEzvhmzdBLAY8OPSlSh58dNLiAaL+6Qht0FvCti5DxVAIMQLNTAWLGJ4pj+S2kM2h
 TC5V4lMHKWIiUFDxgq4hy2pJlYRrfjFN5Gqm/zG6Z1OL9Vwq8Gz8g9bUTPBFcem8E0BQ
 WWDm2Rs9cilZ//5CYUnjJwofehgepIpG27QJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721908977; x=1722513777;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mf8aiHGco5imI6f94w6HLonBSVFjSGNh+4DGns98AUw=;
 b=t+geqNXkOeD6bJiFHFICNlpljsJRH56sBQzoopyvhiYTmktWsGNGJJV8cfR0QpfL7h
 9+4y5WnneXiosvo+zaFtHYh5uTiBFKr1FGotMrIvAV31IfkhMXkDIJqVStefT+JLF6QG
 oZf+hNMvoMl9T/WcLlv9AduWMUkIwTCGGZ9ec+ELeZ6xkwtc/t+sRQy4qE0mseL1qNZz
 ViAlqGT1/sv1q72pimcQ6UkcMEiuhbKXyUt/PA8tRsmi6OCHcjmzm67Pz3zOeLKG6C6F
 olzvzpwqslCYfRcDiUi9WjeJTwrScQbtNQEP91XoAlAKZyQuA4HGjwkE0Pt0rRfSYnIr
 DnLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWkbP9zhCVvuHKtBALvqqMEmyGzhZZBg9ZVtgS14PYdo6Vymk55APH/yaNG1ptBTk1p9GW/4huLpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8KqQH9Wi8nGHn7Ejq2+ifTZdcrfKoDApKHnTEpOAzwA8l9Q5I
 hRCtc0uVsf3jcHa4LdO2XGSxiFQKXurn8UGfvxFzI7XKO9kstLJdt2i2VZ7SSpP/+Q0Vjq/vPKL
 T
X-Google-Smtp-Source: AGHT+IE6b/GeFAYE2dU0D/tDfJJDSL6dJ/hvmzWxix2ijQW5ph8EzVRo2YU5/oNuNtMYRAMX8OxL1A==
X-Received: by 2002:a05:6402:26cc:b0:5a0:d481:c409 with SMTP id
 4fb4d7f45d1cf-5ac278582e7mr1117164a12.0.1721908976665; 
 Thu, 25 Jul 2024 05:02:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63b59ca1sm750865a12.52.2024.07.25.05.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 05:02:56 -0700 (PDT)
Date: Thu, 25 Jul 2024 14:02:54 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/8] drm/radeon: use GEM references instead of TTMs
Message-ID: <ZqI-7hCrXRiy9ptL@phenom.ffwll.local>
References: <20240723121750.2086-1-christian.koenig@amd.com>
 <20240723121750.2086-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240723121750.2086-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Tue, Jul 23, 2024 at 02:17:44PM +0200, Christian König wrote:
> Instead of a TTM reference grab a GEM reference whenever necessary.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/radeon/radeon_gem.c    | 2 +-
>  drivers/gpu/drm/radeon/radeon_object.c | 7 ++-----
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 2ef201a072f1..05df49b3a5c6 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -88,7 +88,7 @@ static void radeon_gem_object_free(struct drm_gem_object *gobj)
>  
>  	if (robj) {
>  		radeon_mn_unregister(robj);
> -		radeon_bo_unref(&robj);
> +		ttm_bo_put(&robj->tbo);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index a955f8a2f7fe..4b972c8c9516 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -256,18 +256,15 @@ struct radeon_bo *radeon_bo_ref(struct radeon_bo *bo)
>  	if (bo == NULL)
>  		return NULL;
>  
> -	ttm_bo_get(&bo->tbo);
> +	drm_gem_object_get(&bo->tbo.base);
>  	return bo;
>  }
>  
>  void radeon_bo_unref(struct radeon_bo **bo)
>  {
> -	struct ttm_buffer_object *tbo;
> -
>  	if ((*bo) == NULL)
>  		return;
> -	tbo = &((*bo)->tbo);
> -	ttm_bo_put(tbo);
> +	drm_gem_object_put(&(*bo)->tbo.base);
>  	*bo = NULL;
>  }
>  
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
