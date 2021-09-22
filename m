Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058624148CF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 14:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6216E6EB91;
	Wed, 22 Sep 2021 12:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A083A6EB8E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 12:28:50 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mT1Mm-0003JV-9N; Wed, 22 Sep 2021 14:28:48 +0200
Message-ID: <099b027c8a3562c2ebe9c6b4e5cabb4db55b6983.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: fix another potential dma_resv DAG violation
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 daniel@ffwll.ch, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Date: Wed, 22 Sep 2021 14:28:47 +0200
In-Reply-To: <20210922114148.107356-1-christian.koenig@amd.com>
References: <20210922114148.107356-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 22.09.2021 um 13:41 +0200 schrieb Christian König:
> Setting the exclusive fence without waiting for the shared
> fences violates the DAG and is illegal.
> 
> We really need to get away from this ASAP and make the
> driver interface more bullet prove.

Uh, what happened to Daniels patch "drm/etnaviv: Don't break exclusive
fence ordering", which fixed this without totally doing away with the
no-implicit handling? I have to admit that I haven't followed up with
that patch series due to ETOOMUCHOTHERSTUFF, but from a quick glance
this patch looked better than what you propose here.

Regards,
Lucas

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 7e17bc2b5df1..4db40e88f67f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -185,19 +185,15 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  				return ret;
>  		}
>  
> -		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
> -			continue;
> -
>  		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
>  			ret = dma_resv_get_fences(robj, &bo->excl,
>  						  &bo->nr_shared,
>  						  &bo->shared);
>  			if (ret)
>  				return ret;
> -		} else {
> +		} else if (!(submit->flags & ETNA_SUBMIT_NO_IMPLICIT)) {
>  			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
>  		}
> -
>  	}
>  
>  	return ret;


