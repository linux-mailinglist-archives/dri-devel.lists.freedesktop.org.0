Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F335968B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 09:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6A76E9B6;
	Fri,  9 Apr 2021 07:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA076E9B6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 07:40:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so1675989wmg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 00:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0EBWYRlLxvnFujddjmjpDVoYFdd40v/a/+AKEKz2GXQ=;
 b=lCof/IheuA+x8IElwV3I5rQ9VqfdjjrDUR8iijsok6yqlbRqfbDjfDtyf7gjz+4/hP
 rCapaY0HRobZmTO/fk5Y0DMk+qixJ4q6jcqjeoRkuLE/ygsr//GNC6jSoYAEwB52WyfM
 zzncvPj/gWo2OxiaZdcgrAZedzySRFJmflYw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0EBWYRlLxvnFujddjmjpDVoYFdd40v/a/+AKEKz2GXQ=;
 b=TXHV7KnKTZ1KS4vdiLPOzTghoHbQPUw3eHvgBhBsf4QeKfjKqZjOBJwMcOKwDOv3ya
 ypuhPdLt/1PcZq28LjAQ2K8b/TDt9VKrnnR5ExXDHIKwe1YY/DQ3HgjNQS532CvtC84S
 /+1AOLCZIMHuYjYaSebQQ59mPMXy1+CmK8ch6DnJV0K5gbrBc/siPOUvJX/8TuMqHY9V
 w69R0HDMoJM3Qj3ga8R9BiQ1axYwuR7k8avbQvZ4NyEkarvf50dmLQBAVhXr87RAqEsM
 1KwgyJCnvmLhvq69XJU4Zh7mn8jdN5kiMGJ0u2EWMCLTosNLso1yJRyShg+aHxR+mrUu
 lOeQ==
X-Gm-Message-State: AOAM532QSjBnbnq6XF5n7u04juZjtCoteJS/Ub8wRGWCvNCrhWW82xyi
 GjL9/BRZbJ6FPIs/r1NXfxBfDQ==
X-Google-Smtp-Source: ABdhPJzoFwRAlCc/EujnRNXJqwsRN169e9lh8Grvt0Qg+qUdbV2r37QQMifdZsf8TFLlpxTjqNHSDQ==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr12509323wmg.102.1617954020617; 
 Fri, 09 Apr 2021 00:40:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a3sm3218922wru.40.2021.04.09.00.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 00:40:20 -0700 (PDT)
Date: Fri, 9 Apr 2021 09:40:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 2/2] drm/vmwgfx: Make sure unpinning handles reservations
Message-ID: <YHAE4nTC9Bi/s/s9@phenom.ffwll.local>
References: <20210408172245.673785-1-zackr@vmware.com>
 <20210408172245.673785-2-zackr@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408172245.673785-2-zackr@vmware.com>
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 01:22:45PM -0400, Zack Rusin wrote:
> Quite often it's a little hard to tell if reservations are already held
> in code paths that unpin bo's. While our pinning/unpinning code should
> be more explicit that requires a substential amount of work so instead
> we can avoid the issues by making sure we try to reserve before unpinning.
> Because we unpin those bo's only on destruction/error paths just that check
> tells us if we're already reserved or not and allows to cleanly unpin.
> 
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> Fixes: d1a73c641afd ("drm/vmwgfx: Make sure we unpin no longer needed buffers")
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 17 ++++++++++++++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_mob.c |  8 ++++----
>  2 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 8087a9013455..03bef9c17e56 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1517,6 +1517,21 @@ static inline struct vmw_surface *vmw_surface_reference(struct vmw_surface *srf)
>  	return srf;
>  }
>  
> +/*
> + * vmw_bo_unpin_safe - currently pinning requires a reservation to be held
> + * but sometimes it's hard to tell if we're in a callback whose parent
> + * is already holding a reservation, to avoid deadloacks we have to try
> + * to get a reservation explicitly to also try to avoid messing up the
> + * internal ttm lru bo list
> + */
> +static inline void vmw_bo_unpin_safe(struct ttm_buffer_object *bo)
> +{
> +	bool locked = dma_resv_trylock(bo->base.resv);
> +	ttm_bo_unpin(bo);
> +	if (locked)
> +		dma_resv_unlock(bo->base.resv);
> +}
> +
>  static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
>  {
>  	struct vmw_buffer_object *tmp_buf = *buf;
> @@ -1524,7 +1539,7 @@ static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
>  	*buf = NULL;
>  	if (tmp_buf != NULL) {
>  		if (tmp_buf->base.pin_count > 0)
> -			ttm_bo_unpin(&tmp_buf->base);
> +			vmw_bo_unpin_safe(&tmp_buf->base);

So in the unreference callback I understand it might be tricky and you
need this, but do all the others below really don't know whether the bo is
locked or not?

Also _trylock is a bit much yolo locking here, I'd minimally put a comment
there that we don't actually care about races, it's just to shut up ttm
locking checks. Whether that's true or not is another question I think.

And if it's just this case here, maybe inline the trylock, and for the
others do a vmw_bo_unpin_unlocked which unconditionally grabs the lock?
-Daniel

>  		ttm_bo_put(&tmp_buf->base);
>  	}
>  }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> index a0b53141dded..23ffeb2dd6e0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> @@ -277,7 +277,7 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
>  						 &batch->otables[i]);
>  	}
>  
> -	ttm_bo_unpin(batch->otable_bo);
> +	vmw_bo_unpin_safe(batch->otable_bo);
>  	ttm_bo_put(batch->otable_bo);
>  	batch->otable_bo = NULL;
>  	return ret;
> @@ -343,7 +343,7 @@ static void vmw_otable_batch_takedown(struct vmw_private *dev_priv,
>  	vmw_bo_fence_single(bo, NULL);
>  	ttm_bo_unreserve(bo);
>  
> -	ttm_bo_unpin(batch->otable_bo);
> +	vmw_bo_unpin_safe(batch->otable_bo);
>  	ttm_bo_put(batch->otable_bo);
>  	batch->otable_bo = NULL;
>  }
> @@ -530,7 +530,7 @@ static void vmw_mob_pt_setup(struct vmw_mob *mob,
>  void vmw_mob_destroy(struct vmw_mob *mob)
>  {
>  	if (mob->pt_bo) {
> -		ttm_bo_unpin(mob->pt_bo);
> +		vmw_bo_unpin_safe(mob->pt_bo);
>  		ttm_bo_put(mob->pt_bo);
>  		mob->pt_bo = NULL;
>  	}
> @@ -646,7 +646,7 @@ int vmw_mob_bind(struct vmw_private *dev_priv,
>  out_no_cmd_space:
>  	vmw_fifo_resource_dec(dev_priv);
>  	if (pt_set_up) {
> -		ttm_bo_unpin(mob->pt_bo);
> +		vmw_bo_unpin_safe(mob->pt_bo);
>  		ttm_bo_put(mob->pt_bo);
>  		mob->pt_bo = NULL;
>  	}
> -- 
> 2.27.0
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
