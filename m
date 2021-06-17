Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335293AB59B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 16:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21206E8BF;
	Thu, 17 Jun 2021 14:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9C36E8BF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 14:14:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 944B6E7B;
 Thu, 17 Jun 2021 16:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1623939256;
 bh=hF29H5G9lOwa6KnCuMQqI5VpXy3ivxjr+tXdvvRfXTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xr1iuQiFQN0JP+F1bWWhREP4z4ue0UrpoU6ZSoZgKA3hFvBNRBJImfRiXk3ULE5Tr
 MbMwi1y2cYYD3Yytq6G6kGQM/3uENT5NFqnFbWbenJy0pqjPeLon7Y1mLhY4UkWC+t
 4e8Uk7cjhFo+VgpieMuOtgU5nViwE69/w5kwdLYQ=
Date: Thu, 17 Jun 2021 17:13:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jonathan Liu <net147@gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Fix null pointer dereference
 in remove callback
Message-ID: <YMtYoaSIIRhb85fh@pendragon.ideasonboard.com>
References: <20210617111925.162120-1-net147@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210617111925.162120-1-net147@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Thank you for the patch.

On Thu, Jun 17, 2021 at 09:19:25PM +1000, Jonathan Liu wrote:
> If attach has not been called, unloading the driver can result in a null
> pointer dereference in mipi_dsi_detach as ctx->dsi has not been assigned
> yet.

Shouldn't this be done in a brige .detach() operation instead ?

> Fixes: ceb515ba29ba6b ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver")
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 750f2172ef08..8e9f45c5c7c1 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -671,8 +671,11 @@ static int sn65dsi83_remove(struct i2c_client *client)
>  {
>  	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
>  
> -	mipi_dsi_detach(ctx->dsi);
> -	mipi_dsi_device_unregister(ctx->dsi);
> +	if (ctx->dsi) {
> +		mipi_dsi_detach(ctx->dsi);
> +		mipi_dsi_device_unregister(ctx->dsi);
> +	}
> +
>  	drm_bridge_remove(&ctx->bridge);
>  	of_node_put(ctx->host_node);
>  

-- 
Regards,

Laurent Pinchart
