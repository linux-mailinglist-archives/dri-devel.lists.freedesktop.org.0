Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE71B21BFC6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF21E6ED23;
	Fri, 10 Jul 2020 22:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE29D6ED23
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:26:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 685DA2C0;
 Sat, 11 Jul 2020 00:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594419977;
 bh=Hgdj3Xwj32FSTIut3UAj5FeG0DKavfkakMqlc7LPMoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C43EKXotznBxZ2AtP5ZPnLrUwjQrDYRpuWVGJEJsBbO7CsgaNtmCjI2OaH33AfTmS
 B00zwPwV74fFppupAlO1rkazLebC5IY8xt5pTaCpFW+0QQKUL7g/dO0AMFF3ohezY4
 VDt4Y0pzUIUTqM273K4kY3WqOyEQc9V66xSLcMl0=
Date: Sat, 11 Jul 2020 01:26:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 10/21] drm/bridge: ti-tpd12s015: make connector
 creation optional
Message-ID: <20200710222610.GN5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-11-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-11-sam@ravnborg.org>
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
 Peter Senna Tschudin <peter.senna@gmail.com>,
 kbuild test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Fri, Jul 03, 2020 at 09:24:06PM +0200, Sam Ravnborg wrote:
> The ti-tpd12s015 do not create any connector, so ignore
> the flags argument, just pass it on to the next bridge
> in the chain.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/ti-tpd12s015.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
> index 514cbf0eac75..4f1666422ab2 100644
> --- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
> +++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
> @@ -43,9 +43,6 @@ static int tpd12s015_attach(struct drm_bridge *bridge,
>  	struct tpd12s015_device *tpd = to_tpd12s015(bridge);
>  	int ret;
>  
> -	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> -		return -EINVAL;
> -

The driver is only used by devices that use
DRM_BRIDGE_ATTACH_NO_CONNECTOR. I'd rather keep this check and port
other potential users to DRM_BRIDGE_ATTACH_NO_CONNECTOR instead of
allowing operation in !DRM_BRIDGE_ATTACH_NO_CONNECTOR mode.

>  	ret = drm_bridge_attach(bridge->encoder, tpd->next_bridge,
>  				bridge, flags);
>  	if (ret < 0)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
