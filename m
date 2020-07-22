Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87508229815
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 14:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13E06E13B;
	Wed, 22 Jul 2020 12:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB8F6E13B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 12:16:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 894FF329;
 Wed, 22 Jul 2020 14:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595420159;
 bh=pf3+Ge9hYR6C+05IUL3E6eTSEz6m+aUSIyOHoAkAfho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nXkJuXZC6QLfy8hyuh7GRYRQAfAOZCNtQgGFAZ0csQO0aznHtgR5Ef6o0HHt1nSH2
 StrGjoZNBxtlhVGGOZoPO0Q7hdWydbfJS4yR76v4P1K5NblQxzIzTJGT7grwthi/DB
 hOl24I96PIUtNFH8QXPPaB3Ihvw9VWDlNkPpyToM=
Date: Wed, 22 Jul 2020 15:15:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH] drm/bridge/adv7511: set the bridge type properly
Message-ID: <20200722121554.GD5833@pendragon.ideasonboard.com>
References: <20200720124228.12552-1-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720124228.12552-1-laurentiu.palcu@oss.nxp.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurentiu,

Thank you for the patch.

On Mon, Jul 20, 2020 at 03:42:27PM +0300, Laurentiu Palcu wrote:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> 
> After the drm_bridge_connector_init() helper function has been added, the ADV
> driver has been changed accordingly. However, the 'type' field of the bridge
> structure was left unset, which makes the helper function always return -EINVAL.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Hi,
> 
> I've hit this while trying to use this helper in the new i.MX8MQ DCSS
> driver, as suggested by Sam, and I wanted to test it with NWL MIPI_DSI and
> ADV since support is already in mainline.
> 
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index f45cdca9cce5..a0d392c338da 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1283,6 +1283,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
>  			    | DRM_BRIDGE_OP_HPD;
>  	adv7511->bridge.of_node = dev->of_node;
> +	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  
>  	drm_bridge_add(&adv7511->bridge);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
