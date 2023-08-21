Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEDE78290B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 14:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB2710E22F;
	Mon, 21 Aug 2023 12:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D909510E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 12:30:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BD24B1;
 Mon, 21 Aug 2023 14:28:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692620931;
 bh=Fquzj1T2o3bHPZSg6/rb4XphtFyGlZaw1xngTYaSB8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jPg8ozpKvlnFHeNjytrt9vV5xS1P11w8ug06UTUIX+lxl/XBWn72F6e4rKi8e4XPt
 QzhDeaUheFgA8gSeFotJXn05XNTqbSWJNEiQce517F9yExdKZAVGJMIA/V33oFLsqf
 Sl7dWss4eQSIOWRMFOK9U7xwfvRf3nYctDJbXR4I=
Date: Mon, 21 Aug 2023 15:30:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 1/2] drm: bridge: it66121: Extend match support for OF
 tables
Message-ID: <20230821123015.GF10135@pendragon.ideasonboard.com>
References: <20230818191817.340360-1-biju.das.jz@bp.renesas.com>
 <20230818191817.340360-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230818191817.340360-2-biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Fri, Aug 18, 2023 at 08:18:16PM +0100, Biju Das wrote:
> The driver has OF match table, still it uses ID lookup table for
> retrieving match data. Currently the driver is working on the
> assumption that a I2C device registered via OF will always match a
> legacy I2C device ID. The correct approach is to have an OF device ID
> table using of_device_match_data() if the devices are registered via OF.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v2->v3:
>  * Removed fixes tag as nothing broken.
>  * Added Rb tag from Andy.
> v2:
>  * New patch.
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 466641c77fe9..ba95ad46e259 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1523,7 +1523,10 @@ static int it66121_probe(struct i2c_client *client)
>  
>  	ctx->dev = dev;
>  	ctx->client = client;
> -	ctx->info = (const struct it66121_chip_info *) id->driver_data;
> +	if (dev_fwnode(&client->dev))
> +		ctx->info = of_device_get_match_data(&client->dev);
> +	else
> +		ctx->info = (const struct it66121_chip_info *) id->driver_data;
>  
>  	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
>  	of_node_put(ep);
> @@ -1609,13 +1612,6 @@ static void it66121_remove(struct i2c_client *client)
>  	mutex_destroy(&ctx->lock);
>  }
>  
> -static const struct of_device_id it66121_dt_match[] = {
> -	{ .compatible = "ite,it66121" },
> -	{ .compatible = "ite,it6610" },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(of, it66121_dt_match);
> -
>  static const struct it66121_chip_info it66121_chip_info = {
>  	.id = ID_IT66121,
>  	.vid = 0x4954,
> @@ -1628,6 +1624,13 @@ static const struct it66121_chip_info it6610_chip_info = {
>  	.pid = 0x0611,
>  };
>  
> +static const struct of_device_id it66121_dt_match[] = {
> +	{ .compatible = "ite,it66121", &it66121_chip_info },
> +	{ .compatible = "ite,it6610", &it6610_chip_info },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, it66121_dt_match);
> +
>  static const struct i2c_device_id it66121_id[] = {
>  	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
>  	{ "it6610", (kernel_ulong_t) &it6610_chip_info },

-- 
Regards,

Laurent Pinchart
