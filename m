Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C714F190125
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 23:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BEC89D64;
	Mon, 23 Mar 2020 22:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B27C89D64
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 22:38:42 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 214715C0BDA;
 Mon, 23 Mar 2020 23:38:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585003121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtDRm0rt0EN9bu0Pp3CSomkeSSXwEszVPn0tf6k0qdk=;
 b=SGDQ4/a4hw7ZfdXCkXqUHghdctZEPd0De9I0k9f1X9LLs2vcOYVvQXUTs7G8QN6l2B2zL0
 CZuC9Q6JZOBTaYV9SG7amOqoDOW462glOPN7D9FvydipNaDCS3lEoKmpRA/hLevZdE0oP8
 PT9AUp779NApA+JiXOyxVgBecQ5vDkY=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 23:38:41 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 12/21] drm: mxsfb: Move vblank event arm to CRTC
 .atomic_flush()
In-Reply-To: <20200309195216.31042-13-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-13-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <ae03781156d1091bf234003a960c3cd5@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-09 20:52, Laurent Pinchart wrote:
> The vblank event is armed in the plane .atomic_update(). This works fine
> as we have a single plane, but will break as soon as multiple planes are
> supported (not to mention it's logically the wrong place to perform the
> operation). Move it to CRTC .atomic_flush().

The comment in the bracket make it sound as if there was something wrong
with the code before, but from what I understand that was just fine and
the only option we had with drm_simple_kms_helper, correct? Can you
maybe make that a bit clearer? (e.g. by stating that now that we no
longer use the simple display pipeline we can and should use the flush
callback).

Otherwise looks good.

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 35 ++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 8f339adb8d04..ebe0785694cb 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -295,6 +295,25 @@ static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,
>  	return drm_atomic_add_affected_planes(state->state, crtc);
>  }
>  
> +static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
> +				    struct drm_crtc_state *old_state)
> +{
> +	struct drm_pending_vblank_event *event;
> +
> +	event = crtc->state->event;
> +	crtc->state->event = NULL;
> +
> +	if (!event)
> +		return;
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (drm_crtc_vblank_get(crtc) == 0)
> +		drm_crtc_arm_vblank_event(crtc, event);
> +	else
> +		drm_crtc_send_vblank_event(crtc, event);
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
>  static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  				     struct drm_crtc_state *old_state)
>  {
> @@ -364,6 +383,7 @@ static void mxsfb_crtc_disable_vblank(struct drm_crtc *crtc)
>  
>  static const struct drm_crtc_helper_funcs mxsfb_crtc_helper_funcs = {
>  	.atomic_check = mxsfb_crtc_atomic_check,
> +	.atomic_flush = mxsfb_crtc_atomic_flush,
>  	.atomic_enable = mxsfb_crtc_atomic_enable,
>  	.atomic_disable = mxsfb_crtc_atomic_disable,
>  };
> @@ -410,23 +430,8 @@ static void mxsfb_plane_atomic_update(struct
> drm_plane *plane,
>  				      struct drm_plane_state *old_pstate)
>  {
>  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
> -	struct drm_crtc *crtc = &mxsfb->crtc;
> -	struct drm_pending_vblank_event *event;
>  	dma_addr_t paddr;
>  
> -	spin_lock_irq(&crtc->dev->event_lock);
> -	event = crtc->state->event;
> -	if (event) {
> -		crtc->state->event = NULL;
> -
> -		if (drm_crtc_vblank_get(crtc) == 0) {
> -			drm_crtc_arm_vblank_event(crtc, event);
> -		} else {
> -			drm_crtc_send_vblank_event(crtc, event);
> -		}
> -	}
> -	spin_unlock_irq(&crtc->dev->event_lock);
> -
>  	paddr = mxsfb_get_fb_paddr(mxsfb);
>  	if (paddr) {
>  		mxsfb_enable_axi_clk(mxsfb);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
