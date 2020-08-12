Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE512427EE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 11:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1366E1B9;
	Wed, 12 Aug 2020 09:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD3B6E1B9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 09:54:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84D26595;
 Wed, 12 Aug 2020 11:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597226072;
 bh=LHqWYKsaLofHO0i8LcYbq9pwMdf80i4uyOKkmzxI25I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tPI/LbM48L2Elv36CKvAcaIzpObJ0c7ZOHSh/Q8Z8smu3LIFW0EmAMsyvCwfd68ua
 zT0QO9eGhaQZBM39vOLzwZlJ+fQ3oTRk0xhh02n1sGecfldwyRNRMsGUS3I7fxWxZN
 f1LGxn4VG8pYdZr4SfMVUWXigxX+nXKieNP8L/mw=
Date: Wed, 12 Aug 2020 12:54:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vinay Simha BN <simhavcs@gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fixes bus formats read
Message-ID: <20200812095418.GG6057@pendragon.ideasonboard.com>
References: <1597217150-22911-1-git-send-email-simhavcs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597217150-22911-1-git-send-email-simhavcs@gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay,

Thank you for the patch.

On Wed, Aug 12, 2020 at 12:55:50PM +0530, Vinay Simha BN wrote:
> - bus formats read from drm_bridge_state.output_bus_cfg.format
>   and .atomic_get_input_bus_fmts() instead of connector
> 
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> 
> ---
>  v1:
>  * Laurent Pinchart review comments incorporated
>    drm_bridge_state.output_bus_cfg.format
>    instead of connector
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 76 ++++++++++++++++++++++++++++++---------
>  1 file changed, 59 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> index 7da15cd..5d8714a 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -271,6 +271,13 @@ struct tc_data {
>  	struct gpio_desc	*stby_gpio;
>  	u8			lvds_link; /* single-link or dual-link */
>  	u8			bpc;
> +	u32			output_bus_fmt;
> +};
> +
> +static const u32 tc_lvds_out_bus_fmts[] = {
> +	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> +	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
>  };
>  
>  static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
> @@ -359,19 +366,6 @@ static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
>  			ret, addr);
>  }
>  
> -/* helper function to access bus_formats */
> -static struct drm_connector *get_connector(struct drm_encoder *encoder)
> -{
> -	struct drm_device *dev = encoder->dev;
> -	struct drm_connector *connector;
> -
> -	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
> -		if (connector->encoder == encoder)
> -			return connector;
> -
> -	return NULL;
> -}
> -
>  static void tc_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
> @@ -380,7 +374,6 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
>  	u32 val = 0;
>  	u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
>  	struct drm_display_mode *mode;
> -	struct drm_connector *connector = get_connector(bridge->encoder);
>  
>  	mode = &bridge->encoder->crtc->state->adjusted_mode;
>  
> @@ -451,14 +444,13 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
>  	d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
>  
>  	dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
> -		connector->display_info.bus_formats[0],
> +		tc->output_bus_fmt,
>  		tc->bpc);
>  	/*
>  	 * Default hardware register settings of tc358775 configured
>  	 * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format
>  	 */
> -	if (connector->display_info.bus_formats[0] ==
> -		MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
> +	if (tc->output_bus_fmt == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
>  		/* VESA-24 */
>  		d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));
>  		d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_R7, LVI_R5, LVI_G0));
> @@ -590,6 +582,51 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
>  	return 0;
>  }
>  
> +static int tc_bridge_atomic_check(struct drm_bridge *bridge,
> +				  struct drm_bridge_state *bridge_state,
> +				  struct drm_crtc_state *crtc_state,
> +				  struct drm_connector_state *conn_state)
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +
> +	tc->output_bus_fmt = bridge_state->output_bus_cfg.format;

.atomic_check() isn't allowed to modify the device state, neither the
hardware state nor the software state in drm_bridge or tc_data. You can
instead access the bridge state directly in tc_bridge_enable(), with

	struct drm_bridge_state *state =
		drm_priv_to_bridge_state(bridge->base.state);

> +
> +	dev_dbg(tc->dev, "output_bus_fmt %04x\n", tc->output_bus_fmt);
> +
> +	return 0;
> +}
> +
> +static u32 *
> +tc_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
> +			     struct drm_bridge_state *bridge_state,
> +			     struct drm_crtc_state *crtc_state,
> +			     struct drm_connector_state *conn_state,
> +			     u32 output_fmt,
> +			     unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts = NULL;
> +	int i;

i only takes positive values, so it can be an unsigned int.

> +
> +	*num_input_fmts = 0;
> +
> +	for (i = 0 ; i < ARRAY_SIZE(tc_lvds_out_bus_fmts) ; ++i) {
> +		if (output_fmt == tc_lvds_out_bus_fmts[i]) {
> +			*num_input_fmts = 1;
> +			input_fmts = kcalloc(*num_input_fmts,
> +					     sizeof(*input_fmts),
> +					     GFP_KERNEL);
> +			if (!input_fmts)
> +				return NULL;
> +
> +			input_fmts[0] = output_fmt;

I don't think this is right, the input of the bridge isn't LVDS, is it ?
As far as I can tell, the hardware support transcoding any of the
supported input formats (RGB565, RGB666 or RGB888) to any of the
supported output formats. How about the following ?

static const u32 tc_lvds_in_bus_fmts[] = {
	MEDIA_BUS_FMT_RGB565_1X16,
	MEDIA_BUS_FMT_RGB666_1X18,
	MEDIA_BUS_FMT_RBG888_1X24,
};

...

	u32 *input_fmts;
	unsigned int i;

	*num_input_fmts = 0;

	for (i = 0 ; i < ARRAY_SIZE(tc_lvds_out_bus_fmts) ; ++i) {
		if (output_fmt == tc_lvds_out_bus_fmts[i])
			break;
	}

	if (i == ARRAY_SIZE(tc_lvds_out_bus_fmts))
		return NULL;

	input_fmts = kcalloc(*num_input_fmts, ARRAY_SIZE(tc_lvds_in_bus_fmts),
			     GFP_KERNEL);
	if (!input_fmts)
		return NULL;

	for (i = 0; i < ARRAY_SIZE(tc_lvds_in_bus_fmts); ++i)
		input_fmts[i] = tc_lvds_in_bus_fmts[i];

	*num_inputs_fmts = ARRAY_SIZE(tc_lvds_in_bus_fmts);
	return input_fmts;

> +
> +			break;
> +		}
> +	}
> +
> +	return input_fmts;
> +}
> +
>  static int tc_bridge_attach(struct drm_bridge *bridge,
>  			    enum drm_bridge_attach_flags flags)
>  {
> @@ -639,6 +676,11 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
>  }
>  
>  static const struct drm_bridge_funcs tc_bridge_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_get_input_bus_fmts = tc_bridge_get_input_bus_fmts,
> +	.atomic_check = tc_bridge_atomic_check,
>  	.attach = tc_bridge_attach,
>  	.pre_enable = tc_bridge_pre_enable,
>  	.enable = tc_bridge_enable,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
