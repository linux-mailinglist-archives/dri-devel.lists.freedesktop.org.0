Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC424E55D0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3CF10E750;
	Wed, 23 Mar 2022 15:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F0210E750
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 15:58:53 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nX3Nr-00014b-HU; Wed, 23 Mar 2022 16:58:51 +0100
Message-ID: <4e042a9c6137ebed6dba955fa39de5359a8a05d0.camel@pengutronix.de>
Subject: Re: [PATCH 05/23] drm/etnaviv: stop using dma_resv_excl_fence
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Date: Wed, 23 Mar 2022 16:58:49 +0100
In-Reply-To: <20220321135856.1331-5-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-5-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 21.03.2022 um 14:58 +0100 schrieb Christian König:
> We can get the excl fence together with the shared ones as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  1 -
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 14 +++++---------
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 10 ----------
>  3 files changed, 5 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> index 98e60df882b6..f596d743baa3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> @@ -80,7 +80,6 @@ struct etnaviv_gem_submit_bo {
>  	u64 va;
>  	struct etnaviv_gem_object *obj;
>  	struct etnaviv_vram_mapping *mapping;
> -	struct dma_fence *excl;
>  	unsigned int nr_shared;
>  	struct dma_fence **shared;

Please rename this to something less specific, like fences or
dependencies. Now that the exclusive fence can be part of this array,
the naming is confusing.

Otherwise the commit looks fine.
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

>  };
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 4eb00a0cb650..385ea141c23e 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -188,15 +188,11 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
>  			continue;
>  
> -		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
> -			ret = dma_resv_get_fences(robj, true, &bo->nr_shared,
> -						  &bo->shared);
> -			if (ret)
> -				return ret;
> -		} else {
> -			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
> -		}
> -
> +		ret = dma_resv_get_fences(robj,
> +					  bo->flags & ETNA_SUBMIT_BO_WRITE,
> +					  &bo->nr_shared, &bo->shared);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 35e5ef7dbdcc..59277dc62011 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -39,16 +39,6 @@ etnaviv_sched_dependency(struct drm_sched_job *sched_job,
>  		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
>  		int j;
>  
> -		if (bo->excl) {
> -			fence = bo->excl;
> -			bo->excl = NULL;
> -
> -			if (!dma_fence_is_signaled(fence))
> -				return fence;
> -
> -			dma_fence_put(fence);
> -		}
> -
>  		for (j = 0; j < bo->nr_shared; j++) {
>  			if (!bo->shared[j])
>  				continue;


