Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F7253AA1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 01:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B08A6EB12;
	Wed, 26 Aug 2020 23:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9996EB10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 23:23:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32A1D9CE;
 Thu, 27 Aug 2020 01:23:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598484223;
 bh=y42Nali6Az8w+ZoScWi3PnmykR8Ep6dOnztkZyVkIXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=enIrvf6abnt0dBgsSbua7bKiublQEWK9i8kGvvIReiyE4R5kn/5DWMOt6AM042Hzm
 zrhMyk1fXm+0fkn02Z+xKYZGFktbJTEH4kIEmekH5HqlM5cJftQXdmNeM1GV2CuxHj
 olF8W2BXKCHcRxFd1qxRGw928jROaS/l9AgrJYag=
Date: Thu, 27 Aug 2020 02:23:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/bridge: tc358767: fix EDID memory leak
Message-ID: <20200826232322.GA28543@pendragon.ideasonboard.com>
References: <20200826134017.437486-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826134017.437486-1-tomi.valkeinen@ti.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Aug 26, 2020 at 04:40:17PM +0300, Tomi Valkeinen wrote:
> The current EDID allocated with drm_get_edid() is freed when the driver
> gets a new EDID, but it is not freed when the driver is removed, causing
> a leak.
> 
> Free the EDID (if any) on driver remove.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index c2777b226c75..dbb18a86beaf 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1695,6 +1695,8 @@ static int tc_remove(struct i2c_client *client)
>  	drm_bridge_remove(&tc->bridge);
>  	drm_dp_aux_unregister(&tc->aux);
>  
> +	kfree(tc->edid);
> +

tc->edid is gone in drm-misc-next, problem solved already :-)

>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
