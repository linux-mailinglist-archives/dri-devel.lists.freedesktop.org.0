Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C1C35C8D4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 16:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD1C6E5C6;
	Mon, 12 Apr 2021 14:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8746E5C6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 14:34:19 +0000 (UTC)
Date: Mon, 12 Apr 2021 15:34:07 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Fix pixclock rate for 24-bit serial panels
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Message-Id: <VGGGRQ.1IX0AMZPBZBT3@crapouillou.net>
In-Reply-To: <20210323144008.166248-1-paul@crapouillou.net>
References: <20210323144008.166248-1-paul@crapouillou.net>
MIME-Version: 1.0
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
Cc: linux-mips@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, od@zcrc.me, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Can I have an ACK for this patch?

Then I can apply it to drm-misc-next-fixes.

Cheers,
-Paul


Le mar. 23 mars 2021 =E0 14:40, Paul Cercueil <paul@crapouillou.net> a =

=E9crit :
> When using a 24-bit panel on a 8-bit serial bus, the pixel clock
> requested by the panel has to be multiplied by 3, since the subpixels
> are shifted sequentially.
> =

> The code (in ingenic_drm_encoder_atomic_check) already computed
> crtc_state->adjusted_mode->crtc_clock accordingly, but clk_set_rate()
> used crtc_state->adjusted_mode->clock instead.
> =

> Fixes: 28ab7d35b6e0 ("drm/ingenic: Properly compute timings when =

> using a 3x8-bit panel")
> Cc: stable@vger.kernel.org # v5.10
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =

> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index d60e1eefc9d1..cba68bf52ec5 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -342,7 +342,7 @@ static void ingenic_drm_crtc_atomic_flush(struct =

> drm_crtc *crtc,
>  	if (priv->update_clk_rate) {
>  		mutex_lock(&priv->clk_mutex);
>  		clk_set_rate(priv->pix_clk,
> -			     crtc_state->adjusted_mode.clock * 1000);
> +			     crtc_state->adjusted_mode.crtc_clock * 1000);
>  		priv->update_clk_rate =3D false;
>  		mutex_unlock(&priv->clk_mutex);
>  	}
> --
> 2.30.2
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
