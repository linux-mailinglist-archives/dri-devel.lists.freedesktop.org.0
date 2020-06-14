Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D02C1F8791
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jun 2020 09:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF066E170;
	Sun, 14 Jun 2020 07:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF186E170
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 07:48:51 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 29D488052B;
 Sun, 14 Jun 2020 09:48:49 +0200 (CEST)
Date: Sun, 14 Jun 2020 09:48:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] drm: mcde: Fix forgotten user of drm->dev_private
Message-ID: <20200614074847.GB220677@ravnborg.org>
References: <20200613223027.4189309-1-linus.walleij@linaro.org>
 <20200613223027.4189309-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200613223027.4189309-2-linus.walleij@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=Asabxd5-pIFabpSqRscA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 14, 2020 at 12:30:27AM +0200, Linus Walleij wrote:
> We forgot one call site directly using drm->dev_private.
> This leads to a crash like this:
> 
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference at virtual address 00000918
> pgd = (ptrval)
> [00000918] *pgd=00000000
> Internal error: Oops: 5 [#1] SMP ARM
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-15001-gfa384b50b96b-dirty #514
> Hardware name: ST-Ericsson Ux5x0 platform (Device Tree Support)
> PC is at mcde_display_enable+0x78/0x7c0
> LR is at mcde_display_enable+0x78/0x7c0
> 
> Fix this by using to_mcde() as in other functions.
> 
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Fixes: fd7ee85cfe7b ("drm/mcde: Don't use drm_device->dev_private")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

This is the last hit for "git grep dev_private".
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/mcde/mcde_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
> index b319a474f801..212aee60cf61 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c
> @@ -838,7 +838,7 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
>  	struct drm_crtc *crtc = &pipe->crtc;
>  	struct drm_plane *plane = &pipe->plane;
>  	struct drm_device *drm = crtc->dev;
> -	struct mcde *mcde = drm->dev_private;
> +	struct mcde *mcde = to_mcde(drm);
>  	const struct drm_display_mode *mode = &cstate->mode;
>  	struct drm_framebuffer *fb = plane->state->fb;
>  	u32 format = fb->format->format;
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
