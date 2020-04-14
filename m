Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4AC1A777B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 11:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17996E4B6;
	Tue, 14 Apr 2020 09:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC486E1E5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 09:38:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE0B3521;
 Tue, 14 Apr 2020 11:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586857107;
 bh=GIZD7ncHw9+mQ5u216QEXY0mzu/uL45fzgd+A6LAm7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=edj+P5O/4SFQ/AlvCZL0hbzZeZc5dADBz3u4vsE+iBoqlx600x1u3v8BXdJ028EtK
 LZgl3/nf8aLCFRMUwM6HLJvB6CQ6LXINKZUXYqyX+9Pt93VQia18qLmCe5/e6P8J9e
 JiSwOanM4YWU/pvDZ9gy/PmmYq7mzbHs+xp1imWM=
Date: Tue, 14 Apr 2020 12:38:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 4/4] drm/bridge: tc358764: make connector creation
 optional
Message-ID: <20200414093816.GD19819@pendragon.ideasonboard.com>
References: <20200414084727.8326-1-sam@ravnborg.org>
 <20200414084727.8326-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414084727.8326-5-sam@ravnborg.org>
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
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Tue, Apr 14, 2020 at 10:47:27AM +0200, Sam Ravnborg wrote:
> Make the connector creation optional to enable usage of the
> tc358764 bridge with the DRM bridge connector helper.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you for the conversion. "Just a few" more bridge drivers to go,
and then there will be no more excuse not to use the DRM bridge
connector helper :-)

> ---
>  drivers/gpu/drm/bridge/tc358764.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> index a5abf15e5c7f..4ebabea86040 100644
> --- a/drivers/gpu/drm/bridge/tc358764.c
> +++ b/drivers/gpu/drm/bridge/tc358764.c
> @@ -337,10 +337,8 @@ static int tc358764_attach(struct drm_bridge *bridge,
>  	if (ret < 0)
>  		return ret;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
>  
>  	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
>  	ret = drm_connector_init(drm, &ctx->connector,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
