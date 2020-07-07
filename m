Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E66321798A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39926E80B;
	Tue,  7 Jul 2020 20:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB59D6E51C;
 Tue,  7 Jul 2020 20:37:21 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id DF91E2001E;
 Tue,  7 Jul 2020 22:37:16 +0200 (CEST)
Date: Tue, 7 Jul 2020 22:37:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 09/25] drm/atmel: Use drm_atomic_helper_commit
Message-ID: <20200707203715.GB23150@ravnborg.org>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-10-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707201229.472834-10-daniel.vetter@ffwll.ch>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=VwQbUJbxAAAA:8
 a=XYAwZIGsAAAA:8 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=e5mUnYsNAAAA:8
 a=HGsDnoEkBQlTwEb6aYUA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=AjGcO6oz07-iQ99wixmX:22 a=E8ToXWR_bxluHZ7gmE-Z:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Tue, Jul 07, 2020 at 10:12:13PM +0200, Daniel Vetter wrote:
> One of these drivers that predates the nonblocking support in helpers,
> and hand-rolled its own thing. Entirely not anything specific here, we
> can just delete it all and replace it with the helper version.
> 
> Could also perhaps use the drm_mode_config_helper_suspend/resume
> stuff, for another few lines deleted. But I'm not looking at that
> stuff, I'm just going through all the atomic commit functions and make
> sure they have properly annotated dma-fence critical sections
> everywhere.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: linux-arm-kernel@lists.infradead.org

Looks good, nice to see all this code deleted!

This more or less matches what I had concluded.
But..

    atmel_hlcdc_dc.wq is no longer used - so can also be deleted.

This will delete even more code - good.

I will try to test the patch in the weekend.
Will get back if I suceed doing so.

	Sam

> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 96 +-------------------
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h |  4 -
>  2 files changed, 1 insertion(+), 99 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index 871293d1aeeb..9ec156e98f06 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -557,103 +557,10 @@ static irqreturn_t atmel_hlcdc_dc_irq_handler(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -struct atmel_hlcdc_dc_commit {
> -	struct work_struct work;
> -	struct drm_device *dev;
> -	struct drm_atomic_state *state;
> -};
> -
> -static void
> -atmel_hlcdc_dc_atomic_complete(struct atmel_hlcdc_dc_commit *commit)
> -{
> -	struct drm_device *dev = commit->dev;
> -	struct atmel_hlcdc_dc *dc = dev->dev_private;
> -	struct drm_atomic_state *old_state = commit->state;
> -
> -	/* Apply the atomic update. */
> -	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> -	drm_atomic_helper_commit_planes(dev, old_state, 0);
> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> -
> -	drm_atomic_helper_wait_for_vblanks(dev, old_state);
> -
> -	drm_atomic_helper_cleanup_planes(dev, old_state);
> -
> -	drm_atomic_state_put(old_state);
> -
> -	/* Complete the commit, wake up any waiter. */
> -	spin_lock(&dc->commit.wait.lock);
> -	dc->commit.pending = false;
> -	wake_up_all_locked(&dc->commit.wait);
> -	spin_unlock(&dc->commit.wait.lock);
> -
> -	kfree(commit);
> -}
> -
> -static void atmel_hlcdc_dc_atomic_work(struct work_struct *work)
> -{
> -	struct atmel_hlcdc_dc_commit *commit =
> -		container_of(work, struct atmel_hlcdc_dc_commit, work);
> -
> -	atmel_hlcdc_dc_atomic_complete(commit);
> -}
> -
> -static int atmel_hlcdc_dc_atomic_commit(struct drm_device *dev,
> -					struct drm_atomic_state *state,
> -					bool async)
> -{
> -	struct atmel_hlcdc_dc *dc = dev->dev_private;
> -	struct atmel_hlcdc_dc_commit *commit;
> -	int ret;
> -
> -	ret = drm_atomic_helper_prepare_planes(dev, state);
> -	if (ret)
> -		return ret;
> -
> -	/* Allocate the commit object. */
> -	commit = kzalloc(sizeof(*commit), GFP_KERNEL);
> -	if (!commit) {
> -		ret = -ENOMEM;
> -		goto error;
> -	}
> -
> -	INIT_WORK(&commit->work, atmel_hlcdc_dc_atomic_work);
> -	commit->dev = dev;
> -	commit->state = state;
> -
> -	spin_lock(&dc->commit.wait.lock);
> -	ret = wait_event_interruptible_locked(dc->commit.wait,
> -					      !dc->commit.pending);
> -	if (ret == 0)
> -		dc->commit.pending = true;
> -	spin_unlock(&dc->commit.wait.lock);
> -
> -	if (ret)
> -		goto err_free;
> -
> -	/* We have our own synchronization through the commit lock. */
> -	BUG_ON(drm_atomic_helper_swap_state(state, false) < 0);
> -
> -	/* Swap state succeeded, this is the point of no return. */
> -	drm_atomic_state_get(state);
> -	if (async)
> -		queue_work(dc->wq, &commit->work);
> -	else
> -		atmel_hlcdc_dc_atomic_complete(commit);
> -
> -	return 0;
> -
> -err_free:
> -	kfree(commit);
> -error:
> -	drm_atomic_helper_cleanup_planes(dev, state);
> -	return ret;
> -}
> -
>  static const struct drm_mode_config_funcs mode_config_funcs = {
>  	.fb_create = drm_gem_fb_create,
>  	.atomic_check = drm_atomic_helper_check,
> -	.atomic_commit = atmel_hlcdc_dc_atomic_commit,
> +	.atomic_commit = drm_atomic_helper_commit,
>  };
>  
>  static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
> @@ -716,7 +623,6 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>  	if (!dc->wq)
>  		return -ENOMEM;
>  
> -	init_waitqueue_head(&dc->commit.wait);
>  	dc->desc = match->data;
>  	dc->hlcdc = dev_get_drvdata(dev->dev->parent);
>  	dev->dev_private = dc;
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> index 469d4507e576..9367a3747a3a 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> @@ -346,10 +346,6 @@ struct atmel_hlcdc_dc {
>  		u32 imr;
>  		struct drm_atomic_state *state;
>  	} suspend;
> -	struct {
> -		wait_queue_head_t wait;
> -		bool pending;
> -	} commit;
>  };
>  
>  extern struct atmel_hlcdc_formats atmel_hlcdc_plane_rgb_formats;
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
