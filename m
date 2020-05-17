Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F781D6650
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 08:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930616E3C6;
	Sun, 17 May 2020 06:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57FD6E3C6
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 06:17:40 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C667780533;
 Sun, 17 May 2020 08:17:38 +0200 (CEST)
Date: Sun, 17 May 2020 08:17:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/12] gpu/drm: ingenic: Fix bogus crtc_atomic_check
 callback
Message-ID: <20200517061737.GC609600@ravnborg.org>
References: <20200516215057.392609-1-paul@crapouillou.net>
 <20200516215057.392609-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200516215057.392609-4-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=q0884fTdi5gFdvFPT1AA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=9LHmKk7ezEChjTCyhBa9:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: devicetree@vger.kernel.org, od@zcrc.me,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 16, 2020 at 11:50:49PM +0200, Paul Cercueil wrote:
> The code was comparing the SoC's maximum height with the mode's width,
> and vice-versa. D'oh.
> 
> Cc: stable@vger.kernel.org # v5.6
> Fixes: a7c909b7c037 ("gpu/drm: ingenic: Check for display size in CRTC atomic check")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Looks correct.
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
> Notes:
>     This patch was previously sent standalone.
>     I marked it as superseded in patchwork.
>     Nothing has been changed here.
> 
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 632d72177123..0c472382a08b 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -330,8 +330,8 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>  	if (!drm_atomic_crtc_needs_modeset(state))
>  		return 0;
>  
> -	if (state->mode.hdisplay > priv->soc_info->max_height ||
> -	    state->mode.vdisplay > priv->soc_info->max_width)
> +	if (state->mode.hdisplay > priv->soc_info->max_width ||
> +	    state->mode.vdisplay > priv->soc_info->max_height)
>  		return -EINVAL;
>  
>  	rate = clk_round_rate(priv->pix_clk,
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
