Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC4B37F7F1
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 14:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7506E877;
	Thu, 13 May 2021 12:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6096E877
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 12:29:44 +0000 (UTC)
Date: Thu, 13 May 2021 13:29:30 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Fix pixclock rate for 24-bit serial panels
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Message-Id: <6DP1TQ.W6B9JRRW1OY5@crapouillou.net>
In-Reply-To: <20210323144008.166248-1-paul@crapouillou.net>
References: <20210323144008.166248-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Almost two months later,


Le mar., mars 23 2021 at 14:40:08 +0000, Paul Cercueil=20
<paul@crapouillou.net> a =E9crit :
> When using a 24-bit panel on a 8-bit serial bus, the pixel clock
> requested by the panel has to be multiplied by 3, since the subpixels
> are shifted sequentially.
>=20
> The code (in ingenic_drm_encoder_atomic_check) already computed
> crtc_state->adjusted_mode->crtc_clock accordingly, but clk_set_rate()
> used crtc_state->adjusted_mode->clock instead.
>=20
> Fixes: 28ab7d35b6e0 ("drm/ingenic: Properly compute timings when=20
> using a 3x8-bit panel")
> Cc: stable@vger.kernel.org # v5.10
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Can I get an ACK for my patch?

Thanks!
-Paul

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index d60e1eefc9d1..cba68bf52ec5 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -342,7 +342,7 @@ static void ingenic_drm_crtc_atomic_flush(struct=20
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
>=20


