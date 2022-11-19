Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B9630FB4
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0175710E100;
	Sat, 19 Nov 2022 17:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA3810E100
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:23:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E5F8749;
 Sat, 19 Nov 2022 18:23:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668878623;
 bh=5SoSRn6YtpRAonTAnkmq4fF/G3FXuf+07x+nXkuoWLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F3vu8+Z2EXYjoIOJLpr3Wbyt5KVtVek7VmQOe3eMINfNShYhMekxaYBNHR8u0VzZt
 WoVCMxyXXSaqz5xNKnD5s+KMEm/xDt95ByUG0s3SuaBLZJ6KrSeCUJQD3n1Utla+Ab
 agVA+fGFfO3VEa79uMoG5UN6PfLnZnNzwWC80a3c=
Date: Sat, 19 Nov 2022 19:23:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 020/606] drm/bridge: it6505: Convert to i2c's .probe_new()
Message-ID: <Y3kREC7Oypi8WdRK@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-21-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-21-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:35:54PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 21a9b8422bda..fea2b4279c31 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3265,8 +3265,7 @@ static void it6505_shutdown(struct i2c_client *client)
>  		it6505_lane_off(it6505);
>  }
>  
> -static int it6505_i2c_probe(struct i2c_client *client,
> -			    const struct i2c_device_id *id)
> +static int it6505_i2c_probe(struct i2c_client *client)
>  {
>  	struct it6505 *it6505;
>  	struct device *dev = &client->dev;
> @@ -3387,7 +3386,7 @@ static struct i2c_driver it6505_i2c_driver = {
>  		.of_match_table = it6505_of_match,
>  		.pm = &it6505_bridge_pm_ops,
>  	},
> -	.probe = it6505_i2c_probe,
> +	.probe_new = it6505_i2c_probe,
>  	.remove = it6505_i2c_remove,
>  	.shutdown = it6505_shutdown,
>  	.id_table = it6505_id,

-- 
Regards,

Laurent Pinchart
