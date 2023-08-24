Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36277877C4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 20:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B03F10E5AD;
	Thu, 24 Aug 2023 18:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9224A10E5AD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 18:26:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BB01191A;
 Thu, 24 Aug 2023 20:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692901485;
 bh=2AnQjB1urJZiJcrvpwSIzp0BpsDSTYuL7TtrrEOrk/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KeHAlGkczJR/792WYAFzBhwpG9ZUwgYLrK4fM/+jzLMPSOrgLOKi38YfkCHdQKgkb
 6Likf1WzIpotsadyflTxrAiYxdAXZ4FXuu04Jz7itGKnjihH/aHgNJojUTcJIX2slt
 RER/9x6iwmEQujdDWJHIDavyhFxqLC+TIWiz0GAk=
Date: Thu, 24 Aug 2023 21:26:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3] drm/bridge/analogix/anx78xx: Drop ID table
Message-ID: <20230824182609.GA6477@pendragon.ideasonboard.com>
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <groeck@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Thu, Aug 24, 2023 at 07:15:46PM +0100, Biju Das wrote:
> The driver has an ID table, but it uses the wrong API for retrieving match
> data and that will lead to a crash, if it is instantiated by user space or
> using ID. From this, there is no user for the ID table and let's drop it
> from the driver as it saves some memory.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I wonder, as the device can only be instantiated from OF, should we add

	depends on OF

to Kconfig, and drop the

#if IS_ENABLED(CONFIG_OF)

from the driver ?

> ---
> v2->v3:
>  * Updated commit header.
> v1->v2:
>  * Dropped ID table support.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 800555aef97f..6169db73d2fe 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1367,12 +1367,6 @@ static void anx78xx_i2c_remove(struct i2c_client *client)
>  	kfree(anx78xx->edid);
>  }
>  
> -static const struct i2c_device_id anx78xx_id[] = {
> -	{ "anx7814", 0 },
> -	{ /* sentinel */ }
> -};
> -MODULE_DEVICE_TABLE(i2c, anx78xx_id);
> -
>  static const struct of_device_id anx78xx_match_table[] = {
>  	{ .compatible = "analogix,anx7808", .data = anx7808_i2c_addresses },
>  	{ .compatible = "analogix,anx7812", .data = anx781x_i2c_addresses },
> @@ -1389,7 +1383,6 @@ static struct i2c_driver anx78xx_driver = {
>  		  },
>  	.probe = anx78xx_i2c_probe,
>  	.remove = anx78xx_i2c_remove,
> -	.id_table = anx78xx_id,
>  };
>  module_i2c_driver(anx78xx_driver);
>  

-- 
Regards,

Laurent Pinchart
