Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFECE4F5726
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C540D10E748;
	Wed,  6 Apr 2022 08:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EB810EBAB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 20:32:07 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id D8901C0960
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 20:26:47 +0000 (UTC)
Received: (Authenticated sender: contact@artur-rojek.eu)
 by mail.gandi.net (Postfix) with ESMTPA id 87D1320004;
 Tue,  5 Apr 2022 20:26:40 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 05 Apr 2022 22:26:40 +0200
From: Artur Rojek <contact@artur-rojek.eu>
To: Christophe Branchereau <cbranchereau@gmail.com>
Subject: Re: [PATCH v5 1/3] drm/ingenic : add ingenic_drm_bridge_atomic_enable
 and disable
In-Reply-To: <20220321133651.291592-2-cbranchereau@gmail.com>
References: <20220321133651.291592-1-cbranchereau@gmail.com>
 <20220321133651.291592-2-cbranchereau@gmail.com>
Message-ID: <2d0ebd708f9c5a6f1ff1f3ba2e9c92c2@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 06 Apr 2022 08:00:38 +0000
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
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-21 14:36, Christophe Branchereau wrote:
Hi Christophe,

looks good to me.

Cheers,
Artur

Acked-by: Artur Rojek <contact@artur-rojek.eu>

> ingenic_drm_bridge_atomic_enable allows the CRTC to be enabled after
> panels have slept out, and before their display is turned on, solving
> a graphical bug on the newvision nv3502c.
> 
> Also add ingenic_drm_bridge_atomic_disable to balance it out.
> 
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 34 +++++++++++++++--------
>  1 file changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index dcf44cb00821..2bbfd2e7fdab 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -226,6 +226,18 @@ static int ingenic_drm_update_pixclk(struct
> notifier_block *nb,
>  	}
>  }
> 
> +static void ingenic_drm_bridge_atomic_enable(struct drm_bridge 
> *bridge,
> +					     struct drm_bridge_state *old_bridge_state)
> +{
> +	struct ingenic_drm *priv = drm_device_get_priv(bridge->dev);
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
> @@ -237,28 +249,20 @@ static void
> ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>  	if (WARN_ON(IS_ERR(priv_state)))
>  		return;
> 
> -	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
> -
>  	/* Set addresses of our DMA descriptor chains */
>  	next_id = priv_state->use_palette ? HWDESC_PALETTE : 0;
>  	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, 
> next_id));
>  	regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_addr(priv, 1));
> 
> -	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
> -			   JZ_LCD_CTRL_ENABLE | JZ_LCD_CTRL_DISABLE,
> -			   JZ_LCD_CTRL_ENABLE);
> -
>  	drm_crtc_vblank_on(crtc);
>  }
> 
> -static void ingenic_drm_crtc_atomic_disable(struct drm_crtc *crtc,
> -					    struct drm_atomic_state *state)
> +static void ingenic_drm_bridge_atomic_disable(struct drm_bridge 
> *bridge,
> +					      struct drm_bridge_state *old_bridge_state)
>  {
> -	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
> +	struct ingenic_drm *priv = drm_device_get_priv(bridge->dev);
>  	unsigned int var;
> 
> -	drm_crtc_vblank_off(crtc);
> -
>  	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
>  			   JZ_LCD_CTRL_DISABLE, JZ_LCD_CTRL_DISABLE);
> 
> @@ -267,6 +271,12 @@ static void
> ingenic_drm_crtc_atomic_disable(struct drm_crtc *crtc,
>  				 1000, 0);
>  }
> 
> +static void ingenic_drm_crtc_atomic_disable(struct drm_crtc *crtc,
> +					    struct drm_atomic_state *state)
> +{
> +	drm_crtc_vblank_off(crtc);
> +}
> +
>  static void ingenic_drm_crtc_update_timings(struct ingenic_drm *priv,
>  					    struct drm_display_mode *mode)
>  {
> @@ -968,6 +978,8 @@ static const struct drm_encoder_helper_funcs
> ingenic_drm_encoder_helper_funcs =
> 
>  static const struct drm_bridge_funcs ingenic_drm_bridge_funcs = {
>  	.attach			= ingenic_drm_bridge_attach,
> +	.atomic_enable		= ingenic_drm_bridge_atomic_enable,
> +	.atomic_disable		= ingenic_drm_bridge_atomic_disable,
>  	.atomic_check		= ingenic_drm_bridge_atomic_check,
>  	.atomic_reset		= drm_atomic_helper_bridge_reset,
>  	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
