Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD8C3BE4C9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80178921C;
	Wed,  7 Jul 2021 08:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C014A8921C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:54:38 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1m13KG-0000x8-Oh; Wed, 07 Jul 2021 10:54:36 +0200
Message-ID: <7ae23a2b1a4aec4e57881e0d88a7d046fe17bfda.camel@pengutronix.de>
Subject: Re: [PATCH 3/7] drm/etnaviv: Don't break exclusive fence ordering
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Wed, 07 Jul 2021 10:54:33 +0200
In-Reply-To: <20210706101209.3034092-4-daniel.vetter@ffwll.ch>
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
 <20210706101209.3034092-4-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

I'm feeling like I miss a ton of context here, so some maybe dumb
questions/remarks below.

Am Dienstag, dem 06.07.2021 um 12:12 +0200 schrieb Daniel Vetter:
> There's only one exclusive slot, and we must not break the ordering.
> 
> A better fix would be to us a dma_fence_chain or _array like e.g.
> amdgpu now uses, but it probably makes sense to lift this into
> dma-resv.c code as a proper concept, so that drivers don't have to
> hack up their own solution each on their own. Hence go with the simple
> fix for now.
> 
> Another option is the fence import ioctl from Jason:
> 
> https://lore.kernel.org/dri-devel/20210610210925.642582-7-jason@jlekstrand.net/

Sorry, but why is the fence import ioctl a alternative to the fix
proposed in this patch?

> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 92478a50a580..5c4fed2b7c6a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -178,18 +178,20 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  	for (i = 0; i < submit->nr_bos; i++) {
>  		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
>  		struct dma_resv *robj = bo->obj->base.resv;
> +		bool write = bo->flags & ETNA_SUBMIT_BO_WRITE;
>  
> -		if (!(bo->flags & ETNA_SUBMIT_BO_WRITE)) {
> +		if (!(write)) {

No parenthesis around the write needed.

>  			ret = dma_resv_reserve_shared(robj, 1);
>  			if (ret)
>  				return ret;
>  		}
>  
> -		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
> +		/* exclusive fences must be ordered */

I feel like this comment isn't really helpful. It might tell you all
you need to know if you just paged in all the context around dma_resv
and the dependency graph, but it's not more than noise to me right now.

I guess the comment should answer the question against what the
exclusive fence we are going to add needs to be ordered and why it
isn't safe to skip implicit sync in that case.

Regards,
Lucas 
> +		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT && !write)
>  			continue;
>  
>  		ret = drm_sched_job_await_implicit(&submit->sched_job, &bo->obj->base,
> -						   bo->flags & ETNA_SUBMIT_BO_WRITE);
> +						   write);
>  		if (ret)
>  			return ret;
>  	}


