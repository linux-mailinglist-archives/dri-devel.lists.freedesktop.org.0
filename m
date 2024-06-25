Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26A2915B06
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 02:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB4A10E2A0;
	Tue, 25 Jun 2024 00:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 65A7510E2A0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 00:29:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C57DF339;
 Mon, 24 Jun 2024 17:30:12 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53A0D3F6A8;
 Mon, 24 Jun 2024 17:29:45 -0700 (PDT)
Date: Tue, 25 Jun 2024 01:28:04 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chris
 Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 14/23] drm: sun4i: de2/de3: refactor mixer initialisation
Message-ID: <20240625012804.27e55708@minigeek.lan>
In-Reply-To: <20240620113150.83466-15-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
 <20240620113150.83466-15-ryan@testtoast.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jun 2024 23:29:52 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Now that the DE variant can be selected by enum, take the oppportunity
> to factor out some common initialisation code to a separate function.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 69 ++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index 7874b68786eee..533aa93d2a30e 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -404,6 +404,40 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
>  	return of_ep.id;
>  }
>  
> +static void sun8i_mixer_init(struct sun8i_mixer *mixer)
> +{
> +	unsigned int base;
> +	int plane_cnt, i;
> +
> +	base = sun8i_blender_base(mixer);

Please move the initialisation up into the line with the declaration.

> +
> +	/* Enable the mixer */
> +	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
> +		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
> +
> +	/* Set background color to black */
> +	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
> +		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> +
> +	/*
> +	 * Set fill color of bottom plane to black. Generally not needed
> +	 * except when VI plane is at bottom (zpos = 0) and enabled.
> +	 */
> +	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> +		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> +	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
> +		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> +
> +	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
> +	for (i = 0; i < plane_cnt; i++)
> +		regmap_write(mixer->engine.regs,
> +			     SUN8I_MIXER_BLEND_MODE(base, i),
> +			     SUN8I_MIXER_BLEND_MODE_DEF);
> +
> +	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> +			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
> +}
> +
>  static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  			      void *data)
>  {
> @@ -412,8 +446,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  	struct sun4i_drv *drv = drm->dev_private;
>  	struct sun8i_mixer *mixer;
>  	void __iomem *regs;
> -	unsigned int base;
> -	int plane_cnt;
>  	int i, ret;
>  
>  	/*
> @@ -517,8 +549,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  
>  	list_add_tail(&mixer->engine.list, &drv->engine_list);
>  
> -	base = sun8i_blender_base(mixer);
> -
>  	/* Reset registers and disable unused sub-engines */
>  	if (mixer->cfg->de_type == sun8i_mixer_de3) {
>  		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
> @@ -534,7 +564,8 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  		regmap_write(mixer->engine.regs, SUN50I_MIXER_FMT_EN, 0);
>  		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC0_EN, 0);
>  		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC1_EN, 0);
> -	} else {
> +

That seems to add an extra line, which shouldn't be here.

Verified that the rest is indeed just a code move, from below into a
separate function. So with the two minor bits above fixed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +	} else if (mixer->cfg->de_type == sun8i_mixer_de2) {
>  		for (i = 0; i < DE2_MIXER_UNIT_SIZE; i += 4)
>  			regmap_write(mixer->engine.regs, i, 0);
>  
> @@ -547,32 +578,8 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  		regmap_write(mixer->engine.regs, SUN8I_MIXER_DCSC_EN, 0);
>  	}
>  
> -	/* Enable the mixer */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
> -		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
> -
> -	/* Set background color to black */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
> -		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> -
> -	/*
> -	 * Set fill color of bottom plane to black. Generally not needed
> -	 * except when VI plane is at bottom (zpos = 0) and enabled.
> -	 */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> -		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
> -		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> -
> -	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
> -	for (i = 0; i < plane_cnt; i++)
> -		regmap_write(mixer->engine.regs,
> -			     SUN8I_MIXER_BLEND_MODE(base, i),
> -			     SUN8I_MIXER_BLEND_MODE_DEF);
> -
> -	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> -			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
> -
> +	sun8i_mixer_init(mixer);
> +	
>  	return 0;
>  
>  err_disable_bus_clk:

