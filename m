Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167922E194
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 19:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D56089F85;
	Sun, 26 Jul 2020 17:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A44189FC8
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 17:09:04 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F1B5980487;
 Sun, 26 Jul 2020 19:09:00 +0200 (CEST)
Date: Sun, 26 Jul 2020 19:08:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH] drm/bridge/adv7511: set the bridge type properly
Message-ID: <20200726170859.GE3275923@ravnborg.org>
References: <20200720124228.12552-1-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720124228.12552-1-laurentiu.palcu@oss.nxp.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=8AirrxEcAAAA:8 a=e5mUnYsNAAAA:8
 a=Y7K1v_ct7oQ-R3I0n14A:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 03:42:27PM +0300, Laurentiu Palcu wrote:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> 
> After the drm_bridge_connector_init() helper function has been added, the ADV
> driver has been changed accordingly. However, the 'type' field of the bridge
> structure was left unset, which makes the helper function always return -EINVAL.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Thanks, applied to drm-misc-fixes.

	Sam

> ---
> Hi,
> 
> I've hit this while trying to use this helper in the new i.MX8MQ DCSS
> driver, as suggested by Sam, and I wanted to test it with NWL MIPI_DSI and
> ADV since support is already in mainline.
> 
> Thanks,
> laurentiu
> 
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
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
