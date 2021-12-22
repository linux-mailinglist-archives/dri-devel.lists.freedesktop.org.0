Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F67F47D8B3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF3F10E2D1;
	Wed, 22 Dec 2021 21:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FB110E2D1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:26:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id o6so13619733edc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Yz9uOCBqf37QPt8riRSUwHZh5OXIzEuZG643lYUqqT0=;
 b=AsZf00kNYJbXTi+o0VPiWrjucHLQCYKuMEtPaDmV+QlUkS9Tb8LnTvlYvRund4qRY/
 7Q1HL1ta8f11APqzxBEWRfPCt7VZCMXDNmVhYiXcaz6XH51yOF6rFiD4DdrZjc8jfy50
 ZfF+QBYTKan2yCtlZviSJz2PTde73iCYmHhHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Yz9uOCBqf37QPt8riRSUwHZh5OXIzEuZG643lYUqqT0=;
 b=cU+dwzlfzX/M3FUnwHlrOeKOyId8urLMu+UIs7d38p52KLfiWFrK5+lzTYXv6b4HVF
 GsVJM9ssGgPh5oWGJqd+ZkK4u7dDTVcID/WAR/WAQokx8wgJ57NQv3X6iCS3Dr+tefLg
 anqMcHgBu8jZ1/bgRFCZxZFZGn6QPWOBOGGJiYcvLNph9pHIDBV8itacNjQAaA3FV8P4
 t5/ybpXZnuPnPa2qv3bEC9HayKffaW9aHf8/cirAyICkOLPuuDs9JvnnW3CvlUGK63jS
 Y2b//edrtVE98x5aowFaDlIQxcFGrpFO4K0+Wp5CWtcSMkZ/8EZ1M+al47Mg1txUm4/V
 8dKw==
X-Gm-Message-State: AOAM530qwzz53Q+n+0Pg9PhCmUWVWy5MYx++hb8X0oIbDO04RZBveVeH
 pWf4ieajQoNF5ME4EnpsqVuMHH147KVuWw==
X-Google-Smtp-Source: ABdhPJwvq7qwcdZObxpBfJF3/nVSIH0D+E85X0+1f84I5+ccF1IFYv54iv16kHiZkbEGAehnLSlIww==
X-Received: by 2002:a05:6402:350a:: with SMTP id
 b10mr4520545edd.89.1640208414469; 
 Wed, 22 Dec 2021 13:26:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 16sm1051926ejd.204.2021.12.22.13.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:26:54 -0800 (PST)
Date: Wed, 22 Dec 2021 22:26:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 07/24] drm/nouveau: stop using dma_resv_excl_fence
Message-ID: <YcOYHNkiN3bZDbyH@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-8-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-8-christian.koenig@amd.com>
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

On Tue, Dec 07, 2021 at 01:33:54PM +0100, Christian König wrote:
> Instead use the new dma_resv_get_singleton function.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index fa73fe57f97b..74f8652d2bd3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -959,7 +959,14 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
>  {
>  	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>  	struct drm_device *dev = drm->dev;
> -	struct dma_fence *fence = dma_resv_excl_fence(bo->base.resv);
> +	struct dma_fence *fence;
> +	int ret;
> +
> +	/* TODO: This is actually a memory management dependency */
> +	ret = dma_resv_get_singleton(bo->base.resv, false, &fence);
> +	if (ret)
> +		dma_resv_wait_timeout(bo->base.resv, false, false,
> +				      MAX_SCHEDULE_TIMEOUT);

Needs ack from nouveau folks.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
>  	nv10_bo_put_tile_region(dev, *old_tile, fence);
>  	*old_tile = new_tile;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
