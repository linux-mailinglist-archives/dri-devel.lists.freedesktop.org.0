Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84BF92AD34
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 02:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F3F10E211;
	Tue,  9 Jul 2024 00:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E50310E211
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 00:44:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0C061007;
 Mon,  8 Jul 2024 17:44:39 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F14C53F762;
 Mon,  8 Jul 2024 17:44:11 -0700 (PDT)
Date: Tue, 9 Jul 2024 01:42:10 +0100
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
Subject: Re: [PATCH v2 02/23] drm: sun4i: de2/de3: Merge CSC functions into one
Message-ID: <20240709014210.45ce6054@minigeek.lan>
In-Reply-To: <20240703105454.41254-3-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
 <20240703105454.41254-3-ryan@testtoast.com>
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

On Wed,  3 Jul 2024 22:50:52 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Merging both function into one lets this one decide on it's own if CSC
> should be enabled or not.

"both functions" is not very specific or telling, and left me a bit
clueless, so can we maybe use:

"At the moment the colour space conversion is handled by two functions:
one to setup the conversion parameters, and another one to enable the
conversion. Merging both into one gives more flexibility for upcoming
extensions to support whole YUV pipelines, in the DE33."

Maybe someone knows the real killer reason why this is required, this
could then be added here.

> Currently heuristics for that is pretty simple
> - enable it for YUV formats and disable for RGB. However, DE3 can have
> whole pipeline in RGB or YUV format. YUV pipeline will be supported in
> later commits.

The actual patch looks like a valid transformation to me, so with an
amended commit message:

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/gpu/drm/sun4i/sun8i_csc.c      | 89 ++++++++++----------------
>  drivers/gpu/drm/sun4i/sun8i_csc.h      |  9 ++-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 11 +---
>  3 files changed, 40 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
> index 6ebd1c3aa3ab5..0dcbc0866ae82 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
> @@ -107,23 +107,28 @@ static const u32 yuv2rgb_de3[2][3][12] = {
>  	},
>  };
>  
> -static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
> -				       enum format_type fmt_type,
> -				       enum drm_color_encoding encoding,
> -				       enum drm_color_range range)
> +static void sun8i_csc_setup(struct regmap *map, u32 base,
> +			    enum format_type fmt_type,
> +			    enum drm_color_encoding encoding,
> +			    enum drm_color_range range)
>  {
> +	u32 base_reg, val;
>  	const u32 *table;
> -	u32 base_reg;
>  	int i;
>  
>  	table = yuv2rgb[range][encoding];
>  
>  	switch (fmt_type) {
> +	case FORMAT_TYPE_RGB:
> +		val = 0;
> +		break;
>  	case FORMAT_TYPE_YUV:
> +		val = SUN8I_CSC_CTRL_EN;
>  		base_reg = SUN8I_CSC_COEFF(base, 0);
>  		regmap_bulk_write(map, base_reg, table, 12);
>  		break;
>  	case FORMAT_TYPE_YVU:
> +		val = SUN8I_CSC_CTRL_EN;
>  		for (i = 0; i < 12; i++) {
>  			if ((i & 3) == 1)
>  				base_reg = SUN8I_CSC_COEFF(base, i + 1);
> @@ -135,28 +140,37 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
>  		}
>  		break;
>  	default:
> +		val = 0;
>  		DRM_WARN("Wrong CSC mode specified.\n");
>  		return;
>  	}
> +
> +	regmap_write(map, SUN8I_CSC_CTRL(base), val);
>  }
>  
> -static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
> -					    enum format_type fmt_type,
> -					    enum drm_color_encoding encoding,
> -					    enum drm_color_range range)
> +static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
> +				 enum format_type fmt_type,
> +				 enum drm_color_encoding encoding,
> +				 enum drm_color_range range)
>  {
> +	u32 addr, val, mask;
>  	const u32 *table;
> -	u32 addr;
>  	int i;
>  
> +	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
>  	table = yuv2rgb_de3[range][encoding];
>  
>  	switch (fmt_type) {
> +	case FORMAT_TYPE_RGB:
> +		val = 0;
> +		break;
>  	case FORMAT_TYPE_YUV:
> +		val = mask;
>  		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
>  		regmap_bulk_write(map, addr, table, 12);
>  		break;
>  	case FORMAT_TYPE_YVU:
> +		val = mask;
>  		for (i = 0; i < 12; i++) {
>  			if ((i & 3) == 1)
>  				addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE,
> @@ -173,67 +187,30 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
>  		}
>  		break;
>  	default:
> +		val = 0;
>  		DRM_WARN("Wrong CSC mode specified.\n");
>  		return;
>  	}
> -}
> -
> -static void sun8i_csc_enable(struct regmap *map, u32 base, bool enable)
> -{
> -	u32 val;
> -
> -	if (enable)
> -		val = SUN8I_CSC_CTRL_EN;
> -	else
> -		val = 0;
> -
> -	regmap_update_bits(map, SUN8I_CSC_CTRL(base), SUN8I_CSC_CTRL_EN, val);
> -}
> -
> -static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, bool enable)
> -{
> -	u32 val, mask;
> -
> -	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
> -
> -	if (enable)
> -		val = mask;
> -	else
> -		val = 0;
>  
>  	regmap_update_bits(map, SUN50I_MIXER_BLEND_CSC_CTL(DE3_BLD_BASE),
>  			   mask, val);
>  }
>  
> -void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
> -				     enum format_type fmt_type,
> -				     enum drm_color_encoding encoding,
> -				     enum drm_color_range range)
> -{
> -	u32 base;
> -
> -	if (mixer->cfg->is_de3) {
> -		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
> -						fmt_type, encoding, range);
> -		return;
> -	}
> -
> -	base = ccsc_base[mixer->cfg->ccsc][layer];
> -
> -	sun8i_csc_set_coefficients(mixer->engine.regs, base,
> -				   fmt_type, encoding, range);
> -}
> -
> -void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
> +void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
> +			enum format_type fmt_type,
> +			enum drm_color_encoding encoding,
> +			enum drm_color_range range)
>  {
>  	u32 base;
>  
>  	if (mixer->cfg->is_de3) {
> -		sun8i_de3_ccsc_enable(mixer->engine.regs, layer, enable);
> +		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
> +				     fmt_type, encoding, range);
>  		return;
>  	}
>  
>  	base = ccsc_base[mixer->cfg->ccsc][layer];
>  
> -	sun8i_csc_enable(mixer->engine.regs, base, enable);
> +	sun8i_csc_setup(mixer->engine.regs, base,
> +			fmt_type, encoding, range);
>  }
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
> index 7322770f39f03..b7546e06e315c 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
> @@ -28,10 +28,9 @@ enum format_type {
>  	FORMAT_TYPE_YVU,
>  };
>  
> -void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
> -				     enum format_type fmt_type,
> -				     enum drm_color_encoding encoding,
> -				     enum drm_color_range range);
> -void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
> +void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
> +			enum format_type fmt_type,
> +			enum drm_color_encoding encoding,
> +			enum drm_color_range range);
>  
>  #endif
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index 76e2d3ec0a78c..6ee3790a2a812 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -281,14 +281,9 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
>  			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
>  
>  	fmt_type = sun8i_vi_layer_get_format_type(fmt);
> -	if (fmt_type != FORMAT_TYPE_RGB) {
> -		sun8i_csc_set_ccsc_coefficients(mixer, channel, fmt_type,
> -						state->color_encoding,
> -						state->color_range);
> -		sun8i_csc_enable_ccsc(mixer, channel, true);
> -	} else {
> -		sun8i_csc_enable_ccsc(mixer, channel, false);
> -	}
> +	sun8i_csc_set_ccsc(mixer, channel, fmt_type,
> +			   state->color_encoding,
> +			   state->color_range);
>  
>  	if (!fmt->is_yuv)
>  		val = SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;

