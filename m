Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E40778AEBF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 13:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E335A10E295;
	Mon, 28 Aug 2023 11:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864AE10E295
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 11:26:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC49F4E6;
 Mon, 28 Aug 2023 13:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693221915;
 bh=GM+XJslD5h10LBk82PdayP/lt6/CuMxY/0uWWK/51EU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rOZWzH1gOxBnBeUesDaljUk2cVi2ppCOYmV+n/e1mZUzC8TWAK9H95VQrF51HBazu
 4M3dMOJ33yyE695ncwKrD/xQo2Xz7DO5WwytI3eP2V68uJyAKdXVRlG4NLs/hVB3sQ
 WJSiFiKH46mh6PEHABsDYgeZzuxoUk99Vyg0X3dY=
Date: Mon, 28 Aug 2023 14:26:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 2/2] drm/bridge: Drop conditionals around of_node
 pointers
Message-ID: <20230828112646.GI14596@pendragon.ideasonboard.com>
References: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
 <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Sat, Aug 26, 2023 at 08:19:01AM +0100, Biju Das wrote:
> Having conditional around the of_node pointers turns out to make driver
> code use ugly #ifdef and #if blocks. So drop the conditionals.
> 
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4:
>  * New patch
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 2 --
>  include/drm/drm_bridge.h                           | 2 --

This should be split in two patches, one addressing drm_bridge.h (and
likely referencing the commit that dropped the conditionals in struct
device, as mentioned by Doug), and one for the drivers.

>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 6169db73d2fe..ad8241758896 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1231,9 +1231,7 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
>  
>  	mutex_init(&anx78xx->lock);
>  
> -#if IS_ENABLED(CONFIG_OF)
>  	anx78xx->bridge.of_node = client->dev.of_node;
> -#endif
>  
>  	anx78xx->client = client;
>  	i2c_set_clientdata(client, anx78xx);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index c339fc85fd07..d49d5c03df3e 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -716,10 +716,8 @@ struct drm_bridge {
>  	struct drm_encoder *encoder;
>  	/** @chain_node: used to form a bridge chain */
>  	struct list_head chain_node;
> -#ifdef CONFIG_OF
>  	/** @of_node: device node pointer to the bridge */
>  	struct device_node *of_node;
> -#endif
>  	/** @list: to keep track of all added bridges */
>  	struct list_head list;
>  	/**

-- 
Regards,

Laurent Pinchart
