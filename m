Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A06630FEF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BA410E281;
	Sat, 19 Nov 2022 17:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA9310E281
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:34:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37282749;
 Sat, 19 Nov 2022 18:34:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668879256;
 bh=7tHvRVrH8z3LVgZXdtz7Q2QO8efFirX0nMfC9WpLVyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qusWdgmc6Z0RBi3FhNfKuV4YBnhEJNf1Grkf3xIZc1EjfHb0SYZXcO1b6xDU1tHgo
 ePR4v4RmHpBee/98hhPBSd6BZ3IjRtkev0jrwDM/cGUO1xd9C74rsmCTr4s0ZtkF63
 Au+2wa6aaObFVCOzgNXdiWZPYp4g6r9VsBOfloek=
Date: Sat, 19 Nov 2022 19:34:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 034/606] drm/bridge/tc358775: Convert to i2c's .probe_new()
Message-ID: <Y3kTiLEAGRFuckxI@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-35-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-35-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:36:08PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/tc358775.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> index 3ceb0e9f9bdc..91b5e1207c47 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -637,7 +637,7 @@ static int tc_attach_host(struct tc_data *tc)
>  	return 0;
>  }
>  
> -static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +static int tc_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct tc_data *tc;
> @@ -729,7 +729,7 @@ static struct i2c_driver tc358775_driver = {
>  		.of_match_table = tc358775_of_ids,
>  	},
>  	.id_table = tc358775_i2c_ids,
> -	.probe = tc_probe,
> +	.probe_new = tc_probe,
>  	.remove	= tc_remove,
>  };
>  module_i2c_driver(tc358775_driver);
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
