Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92436915B03
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 02:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0F610E29B;
	Tue, 25 Jun 2024 00:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 01FFA10E29B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 00:29:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7593A339;
 Mon, 24 Jun 2024 17:30:02 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B3C93F6A8;
 Mon, 24 Jun 2024 17:29:34 -0700 (PDT)
Date: Tue, 25 Jun 2024 01:27:54 +0100
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
Subject: Re: [PATCH 13/23] drm: sun4i: de2/de3: add mixer version enum
Message-ID: <20240625012754.0b9c4b21@minigeek.lan>
In-Reply-To: <20240620113150.83466-14-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
 <20240620113150.83466-14-ryan@testtoast.com>
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

On Thu, 20 Jun 2024 23:29:51 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The Allwinner DE2 and DE3 display engine mixers are currently identified
> by a simple boolean flag. This will not scale to support additional DE
> variants.
> 
> Convert the boolean flag to an enum, and refactor the initialiser by
> moving common code to a separate function.

Thanks for splitting this up, makes review much easier.
Can confirm that is just refactoring, from bool to enum:

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/gpu/drm/sun4i/sun8i_csc.c       |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c     | 14 ++++++++++++--
>  drivers/gpu/drm/sun4i/sun8i_mixer.h     | 11 ++++++++---
>  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  8 ++++----
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  4 ++--
>  6 files changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
> index e12a81fa91083..2d5a2cf7cba24 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
> @@ -365,7 +365,7 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
>  {
>  	u32 base;
>  
> -	if (mixer->cfg->is_de3) {
> +	if (mixer->cfg->de_type == sun8i_mixer_de3) {
>  		sun8i_de3_ccsc_setup(&mixer->engine, layer,
>  				     fmt_type, encoding, range);
>  		return;
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index ef8067b2cbc8c..7874b68786eee 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -520,7 +520,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>  	base = sun8i_blender_base(mixer);
>  
>  	/* Reset registers and disable unused sub-engines */
> -	if (mixer->cfg->is_de3) {
> +	if (mixer->cfg->de_type == sun8i_mixer_de3) {
>  		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
>  			regmap_write(mixer->engine.regs, i, 0);
>  
> @@ -611,6 +611,7 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
>  
>  static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
>  	.ccsc		= CCSC_MIXER0_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 2048,
>  	.ui_num		= 3,
> @@ -619,6 +620,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
>  	.ccsc		= CCSC_MIXER1_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.scaler_mask	= 0x3,
>  	.scanline_yuv	= 2048,
>  	.ui_num		= 1,
> @@ -627,6 +629,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
>  	.ccsc		= CCSC_MIXER0_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 432000000,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 2048,
> @@ -636,6 +639,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
>  	.ccsc		= CCSC_MIXER0_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 2048,
> @@ -645,6 +649,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
>  	.ccsc		= CCSC_MIXER1_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0x3,
>  	.scanline_yuv	= 2048,
> @@ -653,6 +658,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
>  };
>  
>  static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
> +	.de_type = sun8i_mixer_de2,
>  	.vi_num = 2,
>  	.ui_num = 1,
>  	.scaler_mask = 0x3,
> @@ -663,6 +669,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
>  	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0x3,
>  	.scanline_yuv	= 2048,
> @@ -672,6 +679,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
>  	.ccsc		= CCSC_MIXER1_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0x1,
>  	.scanline_yuv	= 1024,
> @@ -681,6 +689,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
>  	.ccsc		= CCSC_MIXER0_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0xf,
>  	.scanline_yuv	= 4096,
> @@ -690,6 +699,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
>  	.ccsc		= CCSC_MIXER1_LAYOUT,
> +	.de_type	= sun8i_mixer_de2,
>  	.mod_rate	= 297000000,
>  	.scaler_mask	= 0x3,
>  	.scanline_yuv	= 2048,
> @@ -699,7 +709,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
>  
>  static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
>  	.ccsc		= CCSC_MIXER0_LAYOUT,
> -	.is_de3		= true,
> +	.de_type	= sun8i_mixer_de3,
>  	.has_formatter	= 1,
>  	.mod_rate	= 600000000,
>  	.scaler_mask	= 0xf,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> index 13401643c7bfc..19052c594f8c2 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -150,6 +150,11 @@ enum {
>  	CCSC_D1_MIXER0_LAYOUT,
>  };
>  
> +enum sun8i_mixer_type {
> +	sun8i_mixer_de2,
> +	sun8i_mixer_de3,
> +};
> +
>  /**
>   * struct sun8i_mixer_cfg - mixer HW configuration
>   * @vi_num: number of VI channels
> @@ -171,7 +176,7 @@ struct sun8i_mixer_cfg {
>  	int		scaler_mask;
>  	int		ccsc;
>  	unsigned long	mod_rate;
> -	unsigned int	is_de3 : 1;
> +	unsigned int	de_type;
>  	unsigned int    has_formatter : 1;
>  	unsigned int	scanline_yuv;
>  };
> @@ -196,13 +201,13 @@ engine_to_sun8i_mixer(struct sunxi_engine *engine)
>  static inline u32
>  sun8i_blender_base(struct sun8i_mixer *mixer)
>  {
> -	return mixer->cfg->is_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
> +	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
>  }
>  
>  static inline u32
>  sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
>  {
> -	if (mixer->cfg->is_de3)
> +	if (mixer->cfg->de_type == sun8i_mixer_de3)
>  		return DE3_CH_BASE + channel * DE3_CH_SIZE;
>  	else
>  		return DE2_CH_BASE + channel * DE2_CH_SIZE;
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
> index ae0806bccac7f..504ffa0971a4f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
> @@ -93,7 +93,7 @@ static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
>  {
>  	int vi_num = mixer->cfg->vi_num;
>  
> -	if (mixer->cfg->is_de3)
> +	if (mixer->cfg->de_type == sun8i_mixer_de3)
>  		return DE3_VI_SCALER_UNIT_BASE +
>  		       DE3_VI_SCALER_UNIT_SIZE * vi_num +
>  		       DE3_UI_SCALER_UNIT_SIZE * (channel - vi_num);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index 329e8bf8cd20d..866ed04fa0a14 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -74,7 +74,7 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
>  
>  	ch_base = sun8i_channel_base(mixer, channel);
>  
> -	if (mixer->cfg->is_de3) {
> +	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
>  		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
>  		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
>  		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
> @@ -553,7 +553,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
>  	layer->channel = index;
>  	layer->overlay = 0;
>  
> -	if (mixer->cfg->is_de3) {
> +	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
>  		formats = sun8i_vi_layer_de3_formats;
>  		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
>  	} else {
> @@ -577,7 +577,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
>  
>  	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
>  
> -	if (mixer->cfg->vi_num == 1 || mixer->cfg->is_de3) {
> +	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= sun8i_mixer_de3) {
>  		ret = drm_plane_create_alpha_property(&layer->plane);
>  		if (ret) {
>  			dev_err(drm->dev, "Couldn't add alpha property\n");
> @@ -594,7 +594,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
>  
>  	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
>  			      BIT(DRM_COLOR_YCBCR_BT709);
> -	if (mixer->cfg->is_de3)
> +	if (mixer->cfg->de_type >= sun8i_mixer_de3)
>  		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
>  
>  	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> index 2e49a6e5f1f1c..aa346c3beb303 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> @@ -835,7 +835,7 @@ static const u32 bicubic4coefftab32[480] = {
>  
>  static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
>  {
> -	if (mixer->cfg->is_de3)
> +	if (mixer->cfg->de_type == sun8i_mixer_de3)
>  		return DE3_VI_SCALER_UNIT_BASE +
>  		       DE3_VI_SCALER_UNIT_SIZE * channel;
>  	else
> @@ -982,7 +982,7 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
>  		cvphase = vphase;
>  	}
>  
> -	if (mixer->cfg->is_de3) {
> +	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
>  		u32 val;
>  
>  		if (format->hsub == 1 && format->vsub == 1)

