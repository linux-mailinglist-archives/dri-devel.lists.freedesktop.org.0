Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA20630FC9
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F8910E223;
	Sat, 19 Nov 2022 17:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD60A10E223
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:30:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E938749;
 Sat, 19 Nov 2022 18:30:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879035;
 bh=o9lUHRbGBJ0hhJHW6kYdWTu2wvJ8H+zsns7IATdHrbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rrEiHpwKhllKXjddcBxHOnbfouXahjh8kHM9Y+KBoChKcIJIGdcds5ltGgJsT70xQ
 ngASIOg81jJgPbfCgGtqvD3+AJfW1RWt+B4EFPM4Ps0sJ41bqhG/knvEoyBAxX1ron
 um213vJD5vIKI8cw2LXfb9pBRSe7Sdj4BRr7FJwQ=
Date: Sat, 19 Nov 2022 19:30:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 031/606] drm/bridge: sii8620: Convert to i2c's .probe_new()
Message-ID: <Y3kSq4nBa6gukzlj@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-32-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-32-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:36:05PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/sil-sii8620.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index 511982a1cedb..b96d03cd878d 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -2284,8 +2284,7 @@ static const struct drm_bridge_funcs sii8620_bridge_funcs = {
>  	.mode_valid = sii8620_mode_valid,
>  };
>  
> -static int sii8620_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int sii8620_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct sii8620 *ctx;
> @@ -2379,7 +2378,7 @@ static struct i2c_driver sii8620_driver = {
>  		.name	= "sii8620",
>  		.of_match_table = of_match_ptr(sii8620_dt_match),
>  	},
> -	.probe		= sii8620_probe,
> +	.probe_new	= sii8620_probe,
>  	.remove		= sii8620_remove,
>  	.id_table = sii8620_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
