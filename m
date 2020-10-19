Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF8F2920C6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 02:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA666E155;
	Mon, 19 Oct 2020 00:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABC46E155
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 00:55:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2705D6E;
 Mon, 19 Oct 2020 02:55:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1603068924;
 bh=tOXnkkRj98BJCVwTopIvEwnZ3JPBrNQuP3wdI26At4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j1xaqDWbIv84pyHUqAJ/tSWRY87/DnhRJxx5Q7r93QRm6ECrRC96Qqorr8eO4fx3O
 Tqso2mDm7rJhNevt/1tDwEgKbQfPgs071VtDyT2Cyko7uuuq0bjvpoXSJlSYepQOu2
 l0DKv+KErAOnIEmwlLkCOCC/19BliaMKoJf3jAIY=
Date: Mon, 19 Oct 2020 03:54:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH] drm/bridge: lvds-codec: Add support for pixel data
 sampling edge select
Message-ID: <20201019005438.GD4174@pendragon.ideasonboard.com>
References: <20201002230823.242147-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002230823.242147-1-marex@denx.de>
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

Thank you for the patch.

On Sat, Oct 03, 2020 at 01:08:23AM +0200, Marek Vasut wrote:
> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
> select input pixel data sampling edge. Add DT property "pixelclk-active",
> same as the one used by display timings, and configure bus flags based on
> this DT property.

The feature looks good to me. I however wonder if we shouldn't use the
standard pclk-sample endpoint property (documented in [1]) instead of a
custom properly.

The DT bindings for the lvds-codec should be updated accordingly. And
the property should only be taken into account when operating in encoder
mode, as for decoder mode there's no polarity for the sampling of LVDS
signals, as you've explained in a reply to Sam.

[1] Documentation/devicetree/bindings/media/video-interfaces.txt

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
>  drivers/gpu/drm/bridge/lvds-codec.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index f52ccffc1bd1..bc941d4fb5b9 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -19,6 +19,7 @@ struct lvds_codec {
>  	struct device *dev;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
> +	struct drm_bridge_timings timings;
>  	struct regulator *vcc;
>  	struct gpio_desc *powerdown_gpio;
>  	u32 connector_type;
> @@ -80,6 +81,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	struct device_node *panel_node;
>  	struct drm_panel *panel;
>  	struct lvds_codec *lvds_codec;
> +	u32 val;
>  	int ret;
>  
>  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
> @@ -124,6 +126,12 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	if (IS_ERR(lvds_codec->panel_bridge))
>  		return PTR_ERR(lvds_codec->panel_bridge);
>  
> +	if (!of_property_read_u32(dev->of_node, "pixelclk-active", &val)) {
> +		lvds_codec->timings.input_bus_flags = val ?
> +			DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE :
> +			DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE;
> +	}
> +
>  	/*
>  	 * The panel_bridge bridge is attached to the panel's of_node,
>  	 * but we need a bridge attached to our of_node for our user
> @@ -131,6 +139,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	 */
>  	lvds_codec->bridge.of_node = dev->of_node;
>  	lvds_codec->bridge.funcs = &funcs;
> +	lvds_codec->bridge.timings = &lvds_codec->timings;
>  	drm_bridge_add(&lvds_codec->bridge);
>  
>  	platform_set_drvdata(pdev, lvds_codec);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
