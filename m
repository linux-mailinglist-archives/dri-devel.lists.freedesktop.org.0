Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6051209C3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 16:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A326E0A6;
	Mon, 16 Dec 2019 15:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1052 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2019 15:32:11 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAAF6E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 15:32:11 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1igs50-0006G3-74; Mon, 16 Dec 2019 16:14:38 +0100
Message-ID: <9c16bae9e83c0878215586595b5ca16b3d5e8810.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Use dma_resv locking wrappers
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Mon, 16 Dec 2019 16:14:34 +0100
In-Reply-To: <20191214000927.1616384-1-daniel.vetter@ffwll.ch>
References: <20191125094356.161941-2-daniel.vetter@ffwll.ch>
 <20191214000927.1616384-1-daniel.vetter@ffwll.ch>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, etnaviv@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sa, 2019-12-14 at 01:09 +0100, Daniel Vetter wrote:
> I'll add more fancy logic to them soon, so everyone really has to use
> them. Plus they already provide some nice additional debug
> infrastructure on top of direct ww_mutex usage for the fences tracked
> by dma_resv.
> 
> v2: Fix the lost _interruptible (Michael)
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org
> Cc: "Ruhl, Michael J" <michael.j.ruhl@intel.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

If you want to stack other stuff on top of this before the next merge
window feel free to take it through drm-misc. Otherwise I'm going to
pick it up with the next sweep.

Regards,
Lucas

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index aa3e4c3b063a..3b0afa156d92 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -113,7 +113,7 @@ static void submit_unlock_object(struct etnaviv_gem_submit *submit, int i)
>  	if (submit->bos[i].flags & BO_LOCKED) {
>  		struct drm_gem_object *obj = &submit->bos[i].obj->base;
>  
> -		ww_mutex_unlock(&obj->resv->lock);
> +		dma_resv_unlock(obj->resv);
>  		submit->bos[i].flags &= ~BO_LOCKED;
>  	}
>  }
> @@ -133,8 +133,7 @@ static int submit_lock_objects(struct etnaviv_gem_submit *submit,
>  		contended = i;
>  
>  		if (!(submit->bos[i].flags & BO_LOCKED)) {
> -			ret = ww_mutex_lock_interruptible(&obj->resv->lock,
> -							  ticket);
> +			ret = dma_resv_lock_interruptible(obj->resv, ticket);
>  			if (ret == -EALREADY)
>  				DRM_ERROR("BO at index %u already on submit list\n",
>  					  i);
> @@ -161,8 +160,7 @@ static int submit_lock_objects(struct etnaviv_gem_submit *submit,
>  		obj = &submit->bos[contended].obj->base;
>  
>  		/* we lost out in a seqno race, lock and retry.. */
> -		ret = ww_mutex_lock_slow_interruptible(&obj->resv->lock,
> -						       ticket);
> +		ret = dma_resv_lock_slow_interruptible(obj->resv, ticket);
>  		if (!ret) {
>  			submit->bos[contended].flags |= BO_LOCKED;
>  			slow_locked = contended;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
