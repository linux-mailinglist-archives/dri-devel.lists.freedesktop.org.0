Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0B631004
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24ACC10E288;
	Sat, 19 Nov 2022 17:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E5110E288
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:36:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAEF5749;
 Sat, 19 Nov 2022 18:36:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879388;
 bh=ur20PFb5wg8xhGCSLHBhcvY/kvR6j5udJP8t3dHAvxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TP5CdX1+y7qdnS5cxrTKm2J9uACYoYa0c+5xN+8Lgwd1gKUSvhp5y19u0HpvoTCI0
 SSxM9RJZKtn4fnFTo+9J7V5bZEpErHjC99Y6cgaOkXb4KZqEnS8Ze0ysRft9iMmY80
 qfx37yYTbRQMqkQGjjjIvVj5Va2uwf50gk9eG5os=
Date: Sat, 19 Nov 2022 19:36:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 035/606] drm/bridge: ti-sn65dsi83: Convert to i2c's
 .probe_new()
Message-ID: <Y3kUDOapV4aA0ZCK@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-36-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-36-uwe@kleine-koenig.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 11:36:09PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 7ba9467fff12..aab7412b09bd 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -653,9 +653,9 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
>  	return 0;
>  }
>  
> -static int sn65dsi83_probe(struct i2c_client *client,
> -			   const struct i2c_device_id *id)
> +static int sn65dsi83_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	struct device *dev = &client->dev;
>  	enum sn65dsi83_model model;
>  	struct sn65dsi83 *ctx;
> @@ -730,7 +730,7 @@ static const struct of_device_id sn65dsi83_match_table[] = {
>  MODULE_DEVICE_TABLE(of, sn65dsi83_match_table);
>  
>  static struct i2c_driver sn65dsi83_driver = {
> -	.probe = sn65dsi83_probe,
> +	.probe_new = sn65dsi83_probe,
>  	.remove = sn65dsi83_remove,
>  	.id_table = sn65dsi83_id,
>  	.driver = {
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
