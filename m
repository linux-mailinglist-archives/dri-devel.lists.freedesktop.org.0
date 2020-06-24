Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7872074A1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 15:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56946E2E9;
	Wed, 24 Jun 2020 13:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994846E2E9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:33:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF0DF2A8;
 Wed, 24 Jun 2020 15:33:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593005618;
 bh=oPJEvSxFywT0HtSvWf+oYQN0nglSD0Pg3DxsenVJifA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=auf2iFpAChhJJIWZ9TisQswT+bIVmoKFlQW95iQKJQVWs3bMMT7uQ6RfH56HAw1pZ
 ZzYszaWvqO2EipE8fawFGnN7dnfKgamv5GIAuPTJYQtSm2xtIfR9GCkkMlTYUzTwI0
 yBu2zitEIkXkq8uzUTxZ8S5RceksgVDUoIsb3be8=
Date: Wed, 24 Jun 2020 16:33:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RESEND PATCH v5 5/5] drm/bridge: lvds-codec: simplify error
 handling code
Message-ID: <20200624133312.GC5980@pendragon.ideasonboard.com>
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114138eucas1p262505da3ad1067720080d20209ff32de@eucas1p2.samsung.com>
 <20200624114127.3016-6-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624114127.3016-6-a.hajda@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 andy.shevchenko@gmail.com, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Wed, Jun 24, 2020 at 01:41:27PM +0200, Andrzej Hajda wrote:
> Using probe_err code has following advantages:
> - shorter code,
> - recorded defer probe reason for debugging,
> - uniform error code logging.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/bridge/lvds-codec.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index 24fb1befdfa2..c76fa0239e39 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -71,13 +71,8 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
>  	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
>  							     GPIOD_OUT_HIGH);
> -	if (IS_ERR(lvds_codec->powerdown_gpio)) {
> -		int err = PTR_ERR(lvds_codec->powerdown_gpio);
> -
> -		if (err != -EPROBE_DEFER)
> -			dev_err(dev, "powerdown GPIO failure: %d\n", err);
> -		return err;
> -	}
> +	if (IS_ERR(lvds_codec->powerdown_gpio))
> +		return probe_err(dev, lvds_codec->powerdown_gpio, "powerdown GPIO failure\n");

Line wrap please.

It bothers me that the common pattern of writing the error code at the
end of the message isn't possible anymore. Maybe I'll get used to it,
but it removes some flexibility.

>  
>  	/* Locate the panel DT node. */
>  	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
