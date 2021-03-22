Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D36343629
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 02:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CE989E3B;
	Mon, 22 Mar 2021 01:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C08A89E3B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 01:15:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49BE18CE;
 Mon, 22 Mar 2021 02:15:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616375735;
 bh=KqVbEF9AD6kMpQifhh6kf/1cwqDqoKzIUBhKoP8TY90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g/psRgqSKbNFWSod0RZYQdQFr0hvQzTIXjRz9k6bZA2/e+6Fsx3x2HkPlAtTIodKp
 U/xjr88pfNhHBsJoEyizy26hwHlj88DEJVe7pMOhJFmOoWiY8ZX9ajzJ8hOCBIripe
 67gdwhhMzNDp2Pw9TD9yfHYLF63S4VZuy09tdnUo=
Date: Mon, 22 Mar 2021 03:14:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2] drm/bridge: lvds-codec: Add support for pixel data
 sampling edge select
Message-ID: <YFfvjyllBa/tqTqI@pendragon.ideasonboard.com>
References: <20201224061832.92010-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201224061832.92010-1-marex@denx.de>
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

All my apologies for the awfully delayed review, and thank you for
pinging me.

On Thu, Dec 24, 2020 at 07:18:32AM +0100, Marek Vasut wrote:
> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
> select input pixel data sampling edge. Add DT property "pixelclk-active",
> same as the one used by display timings, and configure bus flags based on
> this DT property.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Antonio Borneo <antonio.borneo@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Limit the pixelclk-active to encoders only
>     - Update DT binding document
> ---
>  .../bindings/display/bridge/lvds-codec.yaml   |  7 +++
>  drivers/gpu/drm/bridge/lvds-codec.c           | 52 +++++++++++++------
>  2 files changed, 44 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index e5e3c72630cf..399a6528780a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -74,6 +74,13 @@ properties:
>  
>      additionalProperties: false
>  
> +  pixelclk-active:
> +    description: |
> +      Data sampling on rising or falling edge.
> +      Use 0 to sample pixel data on rising edge and
> +      Use 1 to sample pixel data on falling edge and
> +    enum: [0, 1]

The idea is good, but instead of adding a custom property, how about
reusing the pclk-sample property defined in
../../media/video-interfaces.yaml ?

The property is only valid for encoders, so I would at least mention
that in the description, or, better, handle this based on the compatible
string to allow validation.

> +
>    powerdown-gpios:
>      description:
>        The GPIO used to control the power down line of this device.
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index dcf579a4cf83..cab81ccd895d 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -15,13 +15,18 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_panel.h>
>  
> +struct lvds_codec_data {
> +	u32 connector_type;
> +	bool is_encoder;
> +};
> +
>  struct lvds_codec {
>  	struct device *dev;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
> +	struct drm_bridge_timings timings;
>  	struct regulator *vcc;
>  	struct gpio_desc *powerdown_gpio;
> -	u32 connector_type;
>  };
>  
>  static inline struct lvds_codec *to_lvds_codec(struct drm_bridge *bridge)
> @@ -76,17 +81,20 @@ static const struct drm_bridge_funcs funcs = {
>  
>  static int lvds_codec_probe(struct platform_device *pdev)
>  {
> +	const struct lvds_codec_data *data;
>  	struct device *dev = &pdev->dev;
>  	struct device_node *panel_node;
>  	struct drm_panel *panel;
>  	struct lvds_codec *lvds_codec;
> +	u32 val;
>  
>  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
>  	if (!lvds_codec)
>  		return -ENOMEM;
>  
> +	data = of_device_get_match_data(dev);
> +
>  	lvds_codec->dev = &pdev->dev;
> -	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
>  
>  	lvds_codec->vcc = devm_regulator_get(lvds_codec->dev, "power");
>  	if (IS_ERR(lvds_codec->vcc))
> @@ -115,10 +123,22 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  
>  	lvds_codec->panel_bridge =
>  		devm_drm_panel_bridge_add_typed(dev, panel,
> -						lvds_codec->connector_type);
> +						data->connector_type);
>  	if (IS_ERR(lvds_codec->panel_bridge))
>  		return PTR_ERR(lvds_codec->panel_bridge);
>  
> +	/*
> +	 * Encoder might sample data on different clock edge than the display,
> +	 * for example OnSemi FIN3385 has a dedicated strapping pin to select
> +	 * the sampling edge.
> +	 */
> +	if (data->is_encoder &&
> +	    !of_property_read_u32(dev->of_node, "pixelclk-active", &val)) {
> +		lvds_codec->timings.input_bus_flags = val ?
> +			DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE :
> +			DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE;
> +	}
> +
>  	/*
>  	 * The panel_bridge bridge is attached to the panel's of_node,
>  	 * but we need a bridge attached to our of_node for our user
> @@ -126,6 +146,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	 */
>  	lvds_codec->bridge.of_node = dev->of_node;
>  	lvds_codec->bridge.funcs = &funcs;
> +	lvds_codec->bridge.timings = &lvds_codec->timings;
>  	drm_bridge_add(&lvds_codec->bridge);
>  
>  	platform_set_drvdata(pdev, lvds_codec);
> @@ -142,19 +163,20 @@ static int lvds_codec_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct lvds_codec_data decoder_data = {
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.is_encoder = false,

The two fields are a bit redundant, as the decoder is always
LVDS-to-DPI, and the encoder DPI-to-LVDS. I don't mind too much, but
maybe we could drop the connector_type field, and derive the connector
type from is_encoder ?

One may then say that we could drop the lvds_codec_data structure as it
contains a single field, but I foresee a need to have device-specific
timings at some point, so I think it's a good addition.

The patch otherwise looks good.

> +};
> +
> +static const struct lvds_codec_data encoder_data = {
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +	.is_encoder = true,
> +};
> +
>  static const struct of_device_id lvds_codec_match[] = {
> -	{
> -		.compatible = "lvds-decoder",
> -		.data = (void *)DRM_MODE_CONNECTOR_DPI,
> -	},
> -	{
> -		.compatible = "lvds-encoder",
> -		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
> -	},
> -	{
> -		.compatible = "thine,thc63lvdm83d",
> -		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
> -	},
> +	{ .compatible = "lvds-decoder", .data = &decoder_data, },
> +	{ .compatible = "lvds-encoder", .data = &encoder_data, },
> +	{ .compatible = "thine,thc63lvdm83d", .data = &encoder_data, },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, lvds_codec_match);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
