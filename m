Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F329F430AE2
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 18:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6DE6E7FA;
	Sun, 17 Oct 2021 16:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4586E7FA
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 16:49:16 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 2980ee55-2f6a-11ec-9c3f-0050568c148b;
 Sun, 17 Oct 2021 16:49:15 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id D6ED0194B5B;
 Sun, 17 Oct 2021 18:49:20 +0200 (CEST)
Date: Sun, 17 Oct 2021 18:49:11 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] drm/bridge: lvds-codec: Add support for pixel
 data sampling edge select
Message-ID: <YWxUB9y3qFzkfRR0@ravnborg.org>
References: <20211017001204.299940-1-marex@denx.de>
 <20211017001204.299940-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017001204.299940-2-marex@denx.de>
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

Hi Marek,

On Sun, Oct 17, 2021 at 02:12:04AM +0200, Marek Vasut wrote:
> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
> select input pixel data sampling edge. Add DT property "pclk-sample", not
> the same as the one used by display timings but rather the same as used by
> media, and configure bus flags based on this DT property.

Late to the party here - sorry.

> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Limit the pixelclk-active to encoders only
>     - Update DT binding document
> V3: - Determine whether this is encoder from connector, i.e.
>       lvds_codec->connector_type == DRM_MODE_CONNECTOR_LVDS
> V4: - Switch to pclk-sample. Note that the value of this is inverted,
>       so all the existing users of pixelclk-active using previous
>       previous version of this patch must be reworked
> V5: Rebase on recent linux-next
> ---
>  drivers/gpu/drm/bridge/lvds-codec.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index f991842a161f..702ea803a743 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -21,6 +21,7 @@ struct lvds_codec {
>  	struct device *dev;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
> +	struct drm_bridge_timings timings;
>  	struct regulator *vcc;
>  	struct gpio_desc *powerdown_gpio;
>  	u32 connector_type;
> @@ -119,6 +120,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	struct device_node *bus_node;
>  	struct drm_panel *panel;
>  	struct lvds_codec *lvds_codec;
> +	u32 val;
>  	int ret;
>  
>  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
> @@ -187,12 +189,25 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/*
> +	 * Encoder might sample data on different clock edge than the display,
> +	 * for example OnSemi FIN3385 has a dedicated strapping pin to select
> +	 * the sampling edge.
> +	 */
> +	if (lvds_codec->connector_type == DRM_MODE_CONNECTOR_LVDS &&
> +	    !of_property_read_u32(dev->of_node, "pclk-sample", &val)) {
> +		lvds_codec->timings.input_bus_flags = val ?
> +			DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE :
> +			DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
> +	}
> +
>  	/*
>  	 * The panel_bridge bridge is attached to the panel's of_node,
>  	 * but we need a bridge attached to our of_node for our user
>  	 * to look up.
>  	 */
>  	lvds_codec->bridge.of_node = dev->of_node;
> +	lvds_codec->bridge.timings = &lvds_codec->timings;
I do not understand how this will work. The only field that is set is timings.input_bus_flags
but any user will see bridge.timings is set and will think this is all
timing info.

Maybe I just misses something obvious?

	Sam



>  	drm_bridge_add(&lvds_codec->bridge);
>  
>  	platform_set_drvdata(pdev, lvds_codec);
> -- 
> 2.33.0
