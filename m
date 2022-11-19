Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D02630FD9
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880ED10E27B;
	Sat, 19 Nov 2022 17:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D467C10E27B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:32:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64D99749;
 Sat, 19 Nov 2022 18:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879130;
 bh=jUNlhbtAmBCo3WSrJ05Ql8p8uJj3KXKKDHveVbtyPoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lGtopmRf0xfqqInvuNWq7Mm4rIG9EsuczeVHxAs34qeydUmT3lQbnfUbDqIm1JxJ6
 9834nQL95f5TFyExc93nluI3j7yurfPdjC2RpimboGSd4q1UBLpNNgOd3Yyr+iSRSb
 ZQaBwiAOVn3bew/dHTEgFwU22faVllz0GS6LVFWs=
Date: Sat, 19 Nov 2022 19:31:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 029/606] drm/bridge: sii902x: Convert to i2c's .probe_new()
Message-ID: <Y3kTCi4qVO8hl/lR@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-30-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-30-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:36:03PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/sii902x.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 878fb7d3732b..ea590db41970 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -1066,8 +1066,7 @@ static int sii902x_init(struct sii902x *sii902x)
>  	return i2c_mux_add_adapter(sii902x->i2cmux, 0, 0, 0);
>  }
>  
> -static int sii902x_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int sii902x_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct device_node *endpoint;
> @@ -1169,7 +1168,7 @@ static const struct i2c_device_id sii902x_i2c_ids[] = {
>  MODULE_DEVICE_TABLE(i2c, sii902x_i2c_ids);
>  
>  static struct i2c_driver sii902x_driver = {
> -	.probe = sii902x_probe,
> +	.probe_new = sii902x_probe,
>  	.remove = sii902x_remove,
>  	.driver = {
>  		.name = "sii902x",
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
