Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A94073BD41
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32F010E684;
	Fri, 23 Jun 2023 16:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DB810E685
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 16:53:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D24A4440;
 Fri, 23 Jun 2023 18:53:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687539202;
 bh=3QdgbBKNiVmTM+3oQfUmbPGWfcpAOaIZaauIsW7EWQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n+EYxAGo5ZkyUW08R1BH0AkF+HIF+oqx1+cp3Lt+HHfXmsDZ8gs9/YDejrdHfx8XP
 LTUaFoaVZad3dMEJpYIpB/zrJXiYdXcd52lpGN7w6edg6aabPb2dJDztpi5WBnOA3i
 Doj1kUrLZPxzbtZpH9FCjFz8hW8931cwX3yNM1gc=
Date: Fri, 23 Jun 2023 19:53:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 29/39] drm: renesas: shmobile: Move
 shmob_drm_crtc_finish_page_flip()
Message-ID: <20230623165357.GG2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <e51f11814e6db911123f938c5bb1d73814fc6731.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e51f11814e6db911123f938c5bb1d73814fc6731.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:41AM +0200, Geert Uytterhoeven wrote:
> Move the shmob_drm_crtc_finish_page_flip() function up, to avoid having
> to move it during the modification in the next change.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 40 +++++++++++--------
>  1 file changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 2c0ca802d36026f4..1d7fcf64bf2aab80 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -270,6 +270,30 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  	scrtc->started = true;
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * Page Flip
> + */
> +
> +void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
> +{
> +	struct drm_pending_vblank_event *event;
> +	struct drm_device *dev = scrtc->base.dev;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dev->event_lock, flags);
> +	event = scrtc->event;
> +	scrtc->event = NULL;
> +	if (event) {
> +		drm_crtc_send_vblank_event(&scrtc->base, event);
> +		drm_crtc_vblank_put(&scrtc->base);
> +	}
> +	spin_unlock_irqrestore(&dev->event_lock, flags);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * CRTC Functions
> + */
> +
>  static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
>  {
>  	struct drm_crtc *crtc = &scrtc->base;
> @@ -412,22 +436,6 @@ static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
>  	.mode_set_base = shmob_drm_crtc_mode_set_base,
>  };
>  
> -void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
> -{
> -	struct drm_pending_vblank_event *event;
> -	struct drm_device *dev = scrtc->base.dev;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&dev->event_lock, flags);
> -	event = scrtc->event;
> -	scrtc->event = NULL;
> -	if (event) {
> -		drm_crtc_send_vblank_event(&scrtc->base, event);
> -		drm_crtc_vblank_put(&scrtc->base);
> -	}
> -	spin_unlock_irqrestore(&dev->event_lock, flags);
> -}
> -
>  static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
>  				    struct drm_framebuffer *fb,
>  				    struct drm_pending_vblank_event *event,

-- 
Regards,

Laurent Pinchart
