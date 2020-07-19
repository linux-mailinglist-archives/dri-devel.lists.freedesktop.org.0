Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA3E225144
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 12:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C9F6E060;
	Sun, 19 Jul 2020 10:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807576E060
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 10:24:00 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 2772C8051D;
 Sun, 19 Jul 2020 12:23:56 +0200 (CEST)
Date: Sun, 19 Jul 2020 12:23:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Silence uninitialized-variable warning
Message-ID: <20200719102354.GA20692@ravnborg.org>
References: <20200719093834.14084-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719093834.14084-1-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8
 a=xnlXP8Hkb89yI6koaScA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Sun, Jul 19, 2020 at 11:38:34AM +0200, Paul Cercueil wrote:
> Silence compiler warning about used but uninitialized 'ipu_state'
> variable. In practice, the variable would never be used when
> uninitialized, but the compiler cannot know that 'priv->ipu_plane' will
> always be NULL if CONFIG_INGENIC_IPU is disabled.
> 
> Silence the warning by initializing the value to NULL.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Patch looks good. Had to dig into the code to understand the
change to the no_vblank flag.
So:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I expect you to commit the patch.

Looking at the code I noticed that the return value of
drm_atomic_get_plane_state() is not checked.
Can you try to look into this.

	Sam

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index b6d946fbeaf5..ada990a7f911 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -198,7 +198,7 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>  					 struct drm_crtc_state *state)
>  {
>  	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
> -	struct drm_plane_state *f1_state, *f0_state, *ipu_state;
> +	struct drm_plane_state *f1_state, *f0_state, *ipu_state = NULL;
>  	long rate;
>  
>  	if (!drm_atomic_crtc_needs_modeset(state))
> @@ -229,7 +229,7 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>  
>  		/* If all the planes are disabled, we won't get a VBLANK IRQ */
>  		priv->no_vblank = !f1_state->fb && !f0_state->fb &&
> -				  !(priv->ipu_plane && ipu_state->fb);
> +				  !(ipu_state && ipu_state->fb);
>  	}
>  
>  	return 0;
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
