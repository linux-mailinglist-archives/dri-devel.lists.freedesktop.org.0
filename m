Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8074D8D8B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 20:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD3E10E5FE;
	Mon, 14 Mar 2022 19:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963B110E5FE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 19:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1647287862; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJhVqCXdY5vJSE5DEOiKyiWllO/DjfEoLcGECqfYSW4=;
 b=NIVNpvPTZkirRbu+BOYPi60LbI9AoqxRpyRbWSy3PC7vaNpfuMN52w1uACB69NAxLSxnyE
 25hP3YRM/ICm61yd3jYj0TlLbVHBEDcKiPUG7PSJbPu0elKwdCGGK/4KUcVIH3pRDyB2hE
 f3R+tOb354A4L3E2V8sLsbC1mdgrsCw=
Date: Mon, 14 Mar 2022 19:57:32 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/4] drm/ingenic : add ingenic_drm_bridge_atomic_enable
To: Christophe Branchereau <cbranchereau@gmail.com>
Message-Id: <WF3R8R.TU622OO0WUTK3@crapouillou.net>
In-Reply-To: <20220311170240.173846-2-cbranchereau@gmail.com>
References: <20220311170240.173846-1-cbranchereau@gmail.com>
 <20220311170240.173846-2-cbranchereau@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

Le ven., mars 11 2022 at 18:02:37 +0100, Christophe Branchereau=20
<cbranchereau@gmail.com> a =E9crit :
> This allows the CRTC to be enabled after panels have slept out,
> and before their display is turned on, solving a graphical bug
> on the newvision nv3502c
>=20
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index dcf44cb00821..51512f41263e 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -226,6 +226,18 @@ static int ingenic_drm_update_pixclk(struct=20
> notifier_block *nb,
>  	}
>  }
>=20
> +static void ingenic_drm_bridge_atomic_enable(struct drm_bridge=20
> *bridge,
> +					     struct drm_bridge_state *old_bridge_state)
> +{
> +	struct ingenic_drm *priv =3D drm_device_get_priv(bridge->dev);
> +
> +	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
> +
> +	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
> +			   JZ_LCD_CTRL_ENABLE | JZ_LCD_CTRL_DISABLE,
> +			   JZ_LCD_CTRL_ENABLE);
> +}
> +
>  static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>  					   struct drm_atomic_state *state)
>  {
> @@ -237,17 +249,11 @@ static void=20
> ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>  	if (WARN_ON(IS_ERR(priv_state)))
>  		return;
>=20
> -	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
> -
>  	/* Set addresses of our DMA descriptor chains */
>  	next_id =3D priv_state->use_palette ? HWDESC_PALETTE : 0;
>  	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv,=20
> next_id));
>  	regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_addr(priv, 1));
>=20
> -	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
> -			   JZ_LCD_CTRL_ENABLE | JZ_LCD_CTRL_DISABLE,
> -			   JZ_LCD_CTRL_ENABLE);
> -
>  	drm_crtc_vblank_on(crtc);
>  }
>=20
> @@ -968,6 +974,7 @@ static const struct drm_encoder_helper_funcs=20
> ingenic_drm_encoder_helper_funcs =3D
>=20
>  static const struct drm_bridge_funcs ingenic_drm_bridge_funcs =3D {
>  	.attach			=3D ingenic_drm_bridge_attach,
> +	.atomic_enable		=3D ingenic_drm_bridge_atomic_enable,

Shouldn't we have a .atomic_disable() as well? If the CRTC is now=20
enabled in the bridge's .atomic_enable, it would make sense to have it=20
disabled in the .atomic_disable().

Cheers,
-Paul

>  	.atomic_check		=3D ingenic_drm_bridge_atomic_check,
>  	.atomic_reset		=3D drm_atomic_helper_bridge_reset,
>  	.atomic_duplicate_state	=3D drm_atomic_helper_bridge_duplicate_state,
> --
> 2.35.1
>=20


