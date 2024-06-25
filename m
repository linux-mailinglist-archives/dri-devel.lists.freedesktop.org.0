Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5305915B00
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 02:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B240710E26C;
	Tue, 25 Jun 2024 00:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7DB5B10E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 00:29:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 526AF339;
 Mon, 24 Jun 2024 17:29:53 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6DA03F6A8;
 Mon, 24 Jun 2024 17:29:25 -0700 (PDT)
Date: Tue, 25 Jun 2024 01:27:43 +0100
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
Subject: Re: [PATCH 01/23] drm: sun4i: de2/de3: Change CSC argument
Message-ID: <20240625012743.058e9ece@minigeek.lan>
In-Reply-To: <20240620113150.83466-2-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
 <20240620113150.83466-2-ryan@testtoast.com>
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

On Thu, 20 Jun 2024 23:29:39 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Currently, CSC module takes care only for converting YUV to RGB.
> However, DE3 is more suited to work in YUV color space. Change CSC mode
> argument to format type to be more neutral. New argument only tells
> layer format type and doesn't imply output type.
> 
> This commit doesn't make any functional change.

I can confirm that this is indeed just renaming, preparing for the
intention change (from conversion mode to input type). 

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

cheers,
Andre

> ---
>  drivers/gpu/drm/sun4i/sun8i_csc.c      | 22 +++++++++++-----------
>  drivers/gpu/drm/sun4i/sun8i_csc.h      | 10 +++++-----
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++++--------
>  3 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
> index 58480d8e4f704..6ebd1c3aa3ab5 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
> @@ -108,7 +108,7 @@ static const u32 yuv2rgb_de3[2][3][12] = {
>  };
>  
>  static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
> -				       enum sun8i_csc_mode mode,
> +				       enum format_type fmt_type,
>  				       enum drm_color_encoding encoding,
>  				       enum drm_color_range range)
>  {
> @@ -118,12 +118,12 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
>  
>  	table = yuv2rgb[range][encoding];
>  
> -	switch (mode) {
> -	case SUN8I_CSC_MODE_YUV2RGB:
> +	switch (fmt_type) {
> +	case FORMAT_TYPE_YUV:
>  		base_reg = SUN8I_CSC_COEFF(base, 0);
>  		regmap_bulk_write(map, base_reg, table, 12);
>  		break;
> -	case SUN8I_CSC_MODE_YVU2RGB:
> +	case FORMAT_TYPE_YVU:
>  		for (i = 0; i < 12; i++) {
>  			if ((i & 3) == 1)
>  				base_reg = SUN8I_CSC_COEFF(base, i + 1);
> @@ -141,7 +141,7 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
>  }
>  
>  static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
> -					    enum sun8i_csc_mode mode,
> +					    enum format_type fmt_type,
>  					    enum drm_color_encoding encoding,
>  					    enum drm_color_range range)
>  {
> @@ -151,12 +151,12 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
>  
>  	table = yuv2rgb_de3[range][encoding];
>  
> -	switch (mode) {
> -	case SUN8I_CSC_MODE_YUV2RGB:
> +	switch (fmt_type) {
> +	case FORMAT_TYPE_YUV:
>  		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
>  		regmap_bulk_write(map, addr, table, 12);
>  		break;
> -	case SUN8I_CSC_MODE_YVU2RGB:
> +	case FORMAT_TYPE_YVU:
>  		for (i = 0; i < 12; i++) {
>  			if ((i & 3) == 1)
>  				addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE,
> @@ -206,7 +206,7 @@ static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, bool enable)
>  }
>  
>  void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
> -				     enum sun8i_csc_mode mode,
> +				     enum format_type fmt_type,
>  				     enum drm_color_encoding encoding,
>  				     enum drm_color_range range)
>  {
> @@ -214,14 +214,14 @@ void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
>  
>  	if (mixer->cfg->is_de3) {
>  		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
> -						mode, encoding, range);
> +						fmt_type, encoding, range);
>  		return;
>  	}
>  
>  	base = ccsc_base[mixer->cfg->ccsc][layer];
>  
>  	sun8i_csc_set_coefficients(mixer->engine.regs, base,
> -				   mode, encoding, range);
> +				   fmt_type, encoding, range);
>  }
>  
>  void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
> index 828b86fd0cabb..7322770f39f03 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
> @@ -22,14 +22,14 @@ struct sun8i_mixer;
>  
>  #define SUN8I_CSC_CTRL_EN		BIT(0)
>  
> -enum sun8i_csc_mode {
> -	SUN8I_CSC_MODE_OFF,
> -	SUN8I_CSC_MODE_YUV2RGB,
> -	SUN8I_CSC_MODE_YVU2RGB,
> +enum format_type {
> +	FORMAT_TYPE_RGB,
> +	FORMAT_TYPE_YUV,
> +	FORMAT_TYPE_YVU,
>  };
>  
>  void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
> -				     enum sun8i_csc_mode mode,
> +				     enum format_type fmt_type,
>  				     enum drm_color_encoding encoding,
>  				     enum drm_color_range range);
>  void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index f9c0a56d3a148..76e2d3ec0a78c 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -242,19 +242,19 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
>  	return 0;
>  }
>  
> -static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
> +static u32 sun8i_vi_layer_get_format_type(const struct drm_format_info *format)
>  {
>  	if (!format->is_yuv)
> -		return SUN8I_CSC_MODE_OFF;
> +		return FORMAT_TYPE_RGB;
>  
>  	switch (format->format) {
>  	case DRM_FORMAT_YVU411:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
>  	case DRM_FORMAT_YVU444:
> -		return SUN8I_CSC_MODE_YVU2RGB;
> +		return FORMAT_TYPE_YVU;
>  	default:
> -		return SUN8I_CSC_MODE_YUV2RGB;
> +		return FORMAT_TYPE_YUV;
>  	}
>  }
>  
> @@ -262,7 +262,7 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
>  					 int overlay, struct drm_plane *plane)
>  {
>  	struct drm_plane_state *state = plane->state;
> -	u32 val, ch_base, csc_mode, hw_fmt;
> +	u32 val, ch_base, fmt_type, hw_fmt;
>  	const struct drm_format_info *fmt;
>  	int ret;
>  
> @@ -280,9 +280,9 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
>  			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
>  			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
>  
> -	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
> -	if (csc_mode != SUN8I_CSC_MODE_OFF) {
> -		sun8i_csc_set_ccsc_coefficients(mixer, channel, csc_mode,
> +	fmt_type = sun8i_vi_layer_get_format_type(fmt);
> +	if (fmt_type != FORMAT_TYPE_RGB) {
> +		sun8i_csc_set_ccsc_coefficients(mixer, channel, fmt_type,
>  						state->color_encoding,
>  						state->color_range);
>  		sun8i_csc_enable_ccsc(mixer, channel, true);

