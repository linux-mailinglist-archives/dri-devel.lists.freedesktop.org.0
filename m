Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73F111EBB5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326F96EDA2;
	Fri, 13 Dec 2019 20:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A676E153
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 20:10:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t2so76504wrr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 12:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=myxn8tbrMS5BdPFpgJdtAYzTzarg8MS5aEnjcV6O5Ok=;
 b=PSkk3RLK1sqwh5Wd/+XElUSor7ggR19cJM377Bl9FnGxTZRCcsDroLVWmxd6LpvXFI
 5Aibx4RKXnQgFSqhMsmlNJYEod/d45Uy8bey6Z0YBbM6vCIdqrP58yI//BaUmWTUkInB
 dRKfk/LGEXAXpi/OGFsp5/rFsjKVJwTlkJAtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=myxn8tbrMS5BdPFpgJdtAYzTzarg8MS5aEnjcV6O5Ok=;
 b=UyoztdQwcOJSkwWQVrxhExgU6jEoFeIFEpKaaOK0BsupwdHvIOnQvifTaZRjBpi1Y6
 jPcvthjGoBn70j3wf6sJdInAmarl452IQK+4c0WSGBIqQIdr2qlQVnU9OVj1HiuC3Muc
 c+8uTsw+ntmmSWw3FbA8YPCzOoLyKdgNATF+MSS8n0Cq99FNaXmxdDYZhgq+sT44JC2E
 KlvPKi5P/bjIN9f8igykPGCmt6pk8LW5gqTDtaLXlhPH4ajkfsPJbXOQY9m7UolvXCZc
 xzcn0+Xk0FgS/wToEJyeTsK6+NteWxfrqL0x4Fs45n/80okb8KREZ2Kq+Xr64Px1OnWS
 JwHA==
X-Gm-Message-State: APjAAAVU6wwhMWZu4e8+vbMpNLvGqY8VE3H/19w+z6B0zjVzZZ4ptqwY
 dcyODF7dFiCA0uIZMAodgn9Rw3O3EIQ=
X-Google-Smtp-Source: APXvYqxh2f1GY1qVvxJeLQwRyrgPvwuCusycQk+cz3fKq9+WYzq1lSewOwpiCX0/S51y8YGR/HEtuQ==
X-Received: by 2002:a5d:480f:: with SMTP id l15mr14711992wrq.305.1576267816414; 
 Fri, 13 Dec 2019 12:10:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id t81sm11389247wmg.6.2019.12.13.12.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 12:10:15 -0800 (PST)
Date: Fri, 13 Dec 2019 21:10:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/vc4: Use dma_resv locking wrappers
Message-ID: <20191213201013.GM624164@phenom.ffwll.local>
References: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
 <20191125094356.161941-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125094356.161941-5-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 25, 2019 at 10:43:56AM +0100, Daniel Vetter wrote:
> I'll add more fancy logic to them soon, so everyone really has to use
> them. Plus they already provide some nice additional debug
> infrastructure on top of direct ww_mutex usage for the fences tracked
> by dma_resv.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Ping for some review/acks.

Thanks, Daniel

> ---
>  drivers/gpu/drm/vc4/vc4_gem.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 7a06cb6e31c5..e1cfc3ccd05a 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -568,7 +568,7 @@ vc4_unlock_bo_reservations(struct drm_device *dev,
>  	for (i = 0; i < exec->bo_count; i++) {
>  		struct drm_gem_object *bo = &exec->bo[i]->base;
>  
> -		ww_mutex_unlock(&bo->resv->lock);
> +		dma_resv_unlock(bo->resv);
>  	}
>  
>  	ww_acquire_fini(acquire_ctx);
> @@ -595,8 +595,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
>  retry:
>  	if (contended_lock != -1) {
>  		bo = &exec->bo[contended_lock]->base;
> -		ret = ww_mutex_lock_slow_interruptible(&bo->resv->lock,
> -						       acquire_ctx);
> +		ret = dma_resv_lock_slow_interruptible(bo->resv, acquire_ctx);
>  		if (ret) {
>  			ww_acquire_done(acquire_ctx);
>  			return ret;
> @@ -609,19 +608,19 @@ vc4_lock_bo_reservations(struct drm_device *dev,
>  
>  		bo = &exec->bo[i]->base;
>  
> -		ret = ww_mutex_lock_interruptible(&bo->resv->lock, acquire_ctx);
> +		ret = dma_resv_lock_interruptible(bo->resv, acquire_ctx);
>  		if (ret) {
>  			int j;
>  
>  			for (j = 0; j < i; j++) {
>  				bo = &exec->bo[j]->base;
> -				ww_mutex_unlock(&bo->resv->lock);
> +				dma_resv_unlock(bo->resv);
>  			}
>  
>  			if (contended_lock != -1 && contended_lock >= i) {
>  				bo = &exec->bo[contended_lock]->base;
>  
> -				ww_mutex_unlock(&bo->resv->lock);
> +				dma_resv_unlock(bo->resv);
>  			}
>  
>  			if (ret == -EDEADLK) {
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
