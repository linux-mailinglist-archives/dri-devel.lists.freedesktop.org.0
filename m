Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7238F3B1623
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306CF6E459;
	Wed, 23 Jun 2021 08:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105596E459
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 08:45:52 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7390C9B1;
 Wed, 23 Jun 2021 10:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624437950;
 bh=vdil5caf9R7y+sZCCneZTTgcfclZfdMpg+nhInQs7Vc=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=ULHV8yQfdAxEKAdH/t90iz16PyBGMq0f9ilNegrWIS+osdgoWjIBJoeYOaY0+O22g
 6+J49pQ+KiNXrN1l4D6hZGHKxXRsoDlI56KlI5+edxlUUy1J16EmTWlOv2QGpmMfrp
 BELta1AWAOQZEsUy0JBz/qWNqWb+Gi4e5nVujH/Q=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: lvds: Don't set bridge driver_private field
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20210623030545.7627-1-laurent.pinchart+renesas@ideasonboard.com>
Message-ID: <afc45f0a-28c4-696a-51fb-70ff0fee1581@ideasonboard.com>
Date: Wed, 23 Jun 2021 09:45:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623030545.7627-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 23/06/2021 04:05, Laurent Pinchart wrote:
> The drm_bridge.driver_private field is set but never used. Don't set it.

Doesn't seem harmful to keep it though.. but if it's not needed..

It looks like we get the driver context structure through container_of
with bridge_to_rcar_lvds(), as the bridge is embedded there so indeed
it's not needed.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 70dbbe44bb23..5909173b26eb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -919,7 +919,6 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	lvds->bridge.driver_private = lvds;
>  	lvds->bridge.funcs = &rcar_lvds_bridge_ops;
>  	lvds->bridge.of_node = pdev->dev.of_node;
>  
> 
