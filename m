Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB665072C3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DDF10F047;
	Tue, 19 Apr 2022 16:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABE610F043
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:16:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-6-68-nat.elisa-mobile.fi
 [85.76.6.68])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C616D4A8;
 Tue, 19 Apr 2022 18:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650385012;
 bh=DSSuR404nj5QPF2HLXbaPbvb+6H1UHjlTg9Av0gzTCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UyEQF6OYB7SDlZr5gM9iy8tWpriyOJcHVN9oA+ng9M/s52hGMXgUjEuPi1kIg6jKA
 Zf/DXot+AlL12+Pel0F7//mqUnpiK5+nXjgkSRcABPyCkrzniyX9VxGTEZGCFjFtNV
 cjKjneBJWjtzvXaad0PZOOPv4aGsYnQgsyWxeBwo=
Date: Tue, 19 Apr 2022 19:16:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] drm: bridge: adv7511: Enable DRM_BRIDGE_OP_HPD based on
 HPD interrupt
Message-ID: <Yl7gdMJayGqb20bW@pendragon.ideasonboard.com>
References: <20220419142453.48839-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220419142453.48839-1-biju.das.jz@bp.renesas.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Robert Foss <robert.foss@linaro.org>, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Tue, Apr 19, 2022 at 03:24:53PM +0100, Biju Das wrote:
> Connector detection using poll method won't work in case of bridge
> attached to the encoder with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR, as
> the code defaults to HPD.
> 
> Enable DRM_BRIDGE_OP_HPD based on HPD interrupt availability, so that
> it will fall back to polling, if HPD is not available.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 668dcefbae17..b3f10c54e064 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1292,8 +1292,10 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  		goto err_unregister_cec;
>  
>  	adv7511->bridge.funcs = &adv7511_bridge_funcs;
> -	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> -			    | DRM_BRIDGE_OP_HPD;
> +	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> +	if (adv7511->i2c_main->irq)
> +		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
> +
>  	adv7511->bridge.of_node = dev->of_node;
>  	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  

-- 
Regards,

Laurent Pinchart
