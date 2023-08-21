Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF6E78290D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 14:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C30410E23A;
	Mon, 21 Aug 2023 12:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725CE10E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 12:30:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF23DB1;
 Mon, 21 Aug 2023 14:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692620969;
 bh=1mrJxLkC99gzp16A8v/85IwSqPWDBwEaC6o1axzK1+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jJdWTkmwg9PKH5oXH6XKlBpTf48/vROskAJCPWV/jQ4fPQIdDmV6GooTDKLWgESbm
 sC01DKCXwryFl13ZL95A3IVj/h9r8kfQXpCsewwREgvs3wTHS7C7ASl4T8kbxUfqHU
 UYS6x4FzGmU5ao8cZ85lFoiOalgW8it33qh4NZCU=
Date: Mon, 21 Aug 2023 15:30:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 2/2] drm: bridge: it66121: Simplify probe()
Message-ID: <20230821123053.GG10135@pendragon.ideasonboard.com>
References: <20230818191817.340360-1-biju.das.jz@bp.renesas.com>
 <20230818191817.340360-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230818191817.340360-3-biju.das.jz@bp.renesas.com>
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

On Fri, Aug 18, 2023 at 08:18:17PM +0100, Biju Das wrote:
> Simplify probe() by replacing of_device_get_match_data() and ID lookup
> for retrieving match data by i2c_get_match_data().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v2->v3:
>  * Added Rb tag from Andy.
> v1->v2:
>  * Dropped sentence for dropping local variable as it is integral part of
>    the patch.
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index ba95ad46e259..a80246ef4ffe 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1501,7 +1501,6 @@ static const char * const it66121_supplies[] = {
>  
>  static int it66121_probe(struct i2c_client *client)
>  {
> -	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
>  	struct device_node *ep;
>  	int ret;
> @@ -1523,10 +1522,7 @@ static int it66121_probe(struct i2c_client *client)
>  
>  	ctx->dev = dev;
>  	ctx->client = client;
> -	if (dev_fwnode(&client->dev))
> -		ctx->info = of_device_get_match_data(&client->dev);
> -	else
> -		ctx->info = (const struct it66121_chip_info *) id->driver_data;
> +	ctx->info = i2c_get_match_data(client);
>  
>  	of_property_read_u32(ep, "bus-width", &ctx->bus_width);
>  	of_node_put(ep);

-- 
Regards,

Laurent Pinchart
