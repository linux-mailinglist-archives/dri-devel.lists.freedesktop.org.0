Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB97A249DA2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 14:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0F489A77;
	Wed, 19 Aug 2020 12:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920FC89A77
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 12:18:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADC8229E;
 Wed, 19 Aug 2020 14:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597839484;
 bh=rgyMk6KBa5WDEPrqfP+rYW8ORjB39hkCcRAKL7fM4IU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VkORhLsFm/rjVtA/B+q0vMaBBdv71eVPY7PUmpPIMw6JZgcl8VUkfgQ5ggUfpa/Xf
 5rLIg+UukvA1AKZFEc5qLqv66YpDN3c/9RxdjNNmRgXfp3BDHaUvcHHT0cjKlzR8WX
 Mo0wK5Hr3ACT2GgmLt8/yZ/VvRByqycjKaJUx8ds=
Date: Wed, 19 Aug 2020 15:17:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/omap: fix incorrect lock state
Message-ID: <20200819121747.GE6049@pendragon.ideasonboard.com>
References: <20200819103021.440288-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819103021.440288-1-tomi.valkeinen@ti.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Aug 19, 2020 at 01:30:21PM +0300, Tomi Valkeinen wrote:
> After commit 92cc68e35863c1c61c449efa2b2daef6e9926048 ("drm/vblank: Use
> spin_(un)lock_irq() in drm_crtc_vblank_on()") omapdrm locking is broken:
> 
> WARNING: inconsistent lock state
> 5.8.0-rc2-00483-g92cc68e35863 #13 Tainted: G        W
> --------------------------------
> inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
> swapper/0/0 [HC1[1]:SC0[0]:HE0:SE1] takes:
> ea98222c (&dev->event_lock#2){?.+.}-{2:2}, at: drm_handle_vblank+0x4c/0x520 [drm]
> {HARDIRQ-ON-W} state was registered at:
>   trace_hardirqs_on+0x9c/0x1ec
>   _raw_spin_unlock_irq+0x20/0x58
>   omap_crtc_atomic_enable+0x54/0xa0 [omapdrm]
>   drm_atomic_helper_commit_modeset_enables+0x218/0x270 [drm_kms_helper]
>   omap_atomic_commit_tail+0x48/0xc4 [omapdrm]
>   commit_tail+0x9c/0x190 [drm_kms_helper]
>   drm_atomic_helper_commit+0x154/0x188 [drm_kms_helper]
>   drm_client_modeset_commit_atomic+0x228/0x268 [drm]
>   drm_client_modeset_commit_locked+0x60/0x1d0 [drm]
>   drm_client_modeset_commit+0x24/0x40 [drm]
>   drm_fb_helper_restore_fbdev_mode_unlocked+0x54/0xa8 [drm_kms_helper]
>   drm_fb_helper_set_par+0x2c/0x5c [drm_kms_helper]
>   drm_fb_helper_hotplug_event.part.0+0xa0/0xbc [drm_kms_helper]
>   drm_kms_helper_hotplug_event+0x24/0x30 [drm_kms_helper]
>   output_poll_execute+0x1a8/0x1c0 [drm_kms_helper]
>   process_one_work+0x268/0x800
>   worker_thread+0x30/0x4e0
>   kthread+0x164/0x190
>   ret_from_fork+0x14/0x20
> 
> The reason for this is that omapdrm calls drm_crtc_vblank_on() while
> holding event_lock taken with spin_lock_irq().
> 
> It is not clear why drm_crtc_vblank_on() and drm_crtc_vblank_get() are
> called while holding event_lock. I don't see any problem with moving
> those calls outside the lock, which is what this patch does.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've had a quick look at other callers of drm_crtc_vblank_on() and none
of them call it with a spinlock held in the same function. I have
however only checked locally, not up the call stack.

> ---
>  drivers/gpu/drm/omapdrm/omap_crtc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index 6d40914675da..328a4a74f534 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -451,11 +451,12 @@ static void omap_crtc_atomic_enable(struct drm_crtc *crtc,
>  	if (omap_state->manually_updated)
>  		return;
>  
> -	spin_lock_irq(&crtc->dev->event_lock);
>  	drm_crtc_vblank_on(crtc);
> +
>  	ret = drm_crtc_vblank_get(crtc);
>  	WARN_ON(ret != 0);
>  
> +	spin_lock_irq(&crtc->dev->event_lock);
>  	omap_crtc_arm_event(crtc);
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
