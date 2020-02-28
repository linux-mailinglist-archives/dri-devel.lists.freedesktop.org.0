Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03462174066
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 20:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F2A6F4B7;
	Fri, 28 Feb 2020 19:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED256F4B7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 19:41:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0D33A28;
 Fri, 28 Feb 2020 20:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582918867;
 bh=WEG8DVTyErity+gsC2wUGAk8lrrNzL516swTwP5TMXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=llzpKAw+pHwAHyGuDBLV2J/ke1XgAer6pf7Pkcb73OZPJdDoOopf6XE4cJZ8KngOD
 Qbp83sI6zIE9o+wFHY1szNb6tUanfWOj8B02DlkwvkOuaDvIehkUngdkg+NPLSuCRH
 dMAn5qmmlNIsRbkH5OvltrojbVRS1BXipOS4W9vk=
Date: Fri, 28 Feb 2020 21:40:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv2] drm/omap: Fix drm_handle_vblank() handling for command
 mode panels
Message-ID: <20200228194043.GA28903@pendragon.ideasonboard.com>
References: <20200228171657.11884-1-tony@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228171657.11884-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, ruleh <ruleh@gmx.de>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tony,

Thank you for the patch.

On Fri, Feb 28, 2020 at 09:16:57AM -0800, Tony Lindgren wrote:
> When trying to run weston on droid4 with the updated sgx blobs, the LCD
> is just black and not updating. Weston also displays the following on
> startup:
> 
> Warning: computed repaint delay is insane: -205475 msec
> 
> Weston runs fine on the HDMI alone though, and the issue was narrowed
> down to an issue with vblank as suggested by ruleh <ruleh@gmx.de>.
> 
> Turns out that for command mode displays, we're not currently calling
> drm_handle_vblank() at all since omap_irq_handler() won't do it for
> us since we get no vblank interrupts. Let's fix the issue by calling
> drm_handle_vblank() and omap_crtc_vblank_irq() for command mode
> displays from omap_crtc_framedone_irq() and make the vblank handling
> the same for command mode panels as it is for normal displays.

vblank handling is tricky and race-prone. This patch needs very careful
attention. I'll try to get a look at it next week if Tomi doesn't beat
me to it. Sorry for the delay.

> For reference, below is my current weston.ini. The repaint-window is
> maxed out to force immediate repaint instead of the default 7 ms.
> Otherwise it seems that the repaint is happening at about 60 fps with
> es2gears_wayland compared to about 130 fps where it seems to max out.
> 
> [core]
> xwayland=true
> backend=drm-backend.so
> repaint-window=1000
> pageflip-timeout=1000
> 
> [libinput]
> rotation=0
> 
> [output]
> name=DSI-1
> transform=90
> 
> [output]
> name=HDMI-1
> mode=1024x768@60
> 
> Fixes: 47103a80f55a ("drm/omap: add framedone interrupt support")
> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: ruleh <ruleh@gmx.de>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpu/drm/omapdrm/omap_crtc.c | 41 +++++++++++------------------
>  drivers/gpu/drm/omapdrm/omap_crtc.h |  2 +-
>  drivers/gpu/drm/omapdrm/omap_irq.c  |  2 +-
>  3 files changed, 18 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -325,23 +325,21 @@ void omap_crtc_vblank_irq(struct drm_crtc *crtc)
>  	DBG("%s: apply done", omap_crtc->name);
>  }
>  
> -void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus)
> +void omap_crtc_framedone_irq(struct drm_crtc *crtc, int id, uint32_t irqstatus)
>  {
> +	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
>  	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
> +	struct drm_device *dev = crtc->dev;
>  
>  	if (!omap_crtc->framedone_handler)
>  		return;
>  
> -	omap_crtc->framedone_handler(omap_crtc->framedone_handler_data);
> -
> -	spin_lock(&crtc->dev->event_lock);
> -	/* Send the vblank event if one has been requested. */
> -	if (omap_crtc->event) {
> -		drm_crtc_send_vblank_event(crtc, omap_crtc->event);
> -		omap_crtc->event = NULL;
> +	if (omap_state->manually_updated) {
> +		drm_handle_vblank(dev, id);
> +		omap_crtc_vblank_irq(crtc);
>  	}
> -	omap_crtc->pending = false;
> -	spin_unlock(&crtc->dev->event_lock);
> +
> +	omap_crtc->framedone_handler(omap_crtc->framedone_handler_data);
>  
>  	/* Wake up omap_atomic_complete. */
>  	wake_up(&omap_crtc->pending_wait);
> @@ -439,8 +437,12 @@ static void omap_crtc_destroy(struct drm_crtc *crtc)
>  
>  static void omap_crtc_arm_event(struct drm_crtc *crtc)
>  {
> +	struct omap_crtc_state *omap_crtc_state = to_omap_crtc_state(crtc->state);
>  	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
>  
> +	if (omap_crtc->pending && omap_crtc_state->manually_updated)
> +		return;
> +
>  	WARN_ON(omap_crtc->pending);
>  	omap_crtc->pending = true;
>  
> @@ -455,17 +457,12 @@ static void omap_crtc_atomic_enable(struct drm_crtc *crtc,
>  {
>  	struct omap_drm_private *priv = crtc->dev->dev_private;
>  	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
> -	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
>  	int ret;
>  
>  	DBG("%s", omap_crtc->name);
>  
>  	priv->dispc_ops->runtime_get(priv->dispc);
>  
> -	/* manual updated display will not trigger vsync irq */
> -	if (omap_state->manually_updated)
> -		return;
> -
>  	spin_lock_irq(&crtc->dev->event_lock);
>  	drm_crtc_vblank_on(crtc);
>  	ret = drm_crtc_vblank_get(crtc);
> @@ -646,20 +643,14 @@ static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
>  
>  	DBG("%s: GO", omap_crtc->name);
>  
> -	if (omap_crtc_state->manually_updated) {
> -		/* send new image for page flips and modeset changes */
> -		spin_lock_irq(&crtc->dev->event_lock);
> -		omap_crtc_flush(crtc);
> -		omap_crtc_arm_event(crtc);
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -		return;
> -	}
> -
>  	ret = drm_crtc_vblank_get(crtc);
>  	WARN_ON(ret != 0);
>  
>  	spin_lock_irq(&crtc->dev->event_lock);
> -	priv->dispc_ops->mgr_go(priv->dispc, omap_crtc->channel);
> +	if (omap_crtc_state->manually_updated)
> +		omap_crtc_flush(crtc);
> +	else
> +		priv->dispc_ops->mgr_go(priv->dispc, omap_crtc->channel);
>  	omap_crtc_arm_event(crtc);
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  }
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.h b/drivers/gpu/drm/omapdrm/omap_crtc.h
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.h
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.h
> @@ -30,7 +30,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
>  int omap_crtc_wait_pending(struct drm_crtc *crtc);
>  void omap_crtc_error_irq(struct drm_crtc *crtc, u32 irqstatus);
>  void omap_crtc_vblank_irq(struct drm_crtc *crtc);
> -void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus);
> +void omap_crtc_framedone_irq(struct drm_crtc *crtc, int id, uint32_t irqstatus);
>  void omap_crtc_flush(struct drm_crtc *crtc);
>  
>  #endif /* __OMAPDRM_CRTC_H__ */
> diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
> --- a/drivers/gpu/drm/omapdrm/omap_irq.c
> +++ b/drivers/gpu/drm/omapdrm/omap_irq.c
> @@ -232,7 +232,7 @@ static irqreturn_t omap_irq_handler(int irq, void *arg)
>  			omap_crtc_error_irq(crtc, irqstatus);
>  
>  		if (irqstatus & priv->dispc_ops->mgr_get_framedone_irq(priv->dispc, channel))
> -			omap_crtc_framedone_irq(crtc, irqstatus);
> +			omap_crtc_framedone_irq(crtc, id, irqstatus);
>  	}
>  
>  	omap_irq_ocp_error_handler(dev, irqstatus);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
