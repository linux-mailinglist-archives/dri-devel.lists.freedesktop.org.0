Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC841A62D1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 08:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ADA6E188;
	Mon, 13 Apr 2020 06:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF316E188
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 06:03:46 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 865B08048A;
 Mon, 13 Apr 2020 08:03:43 +0200 (CEST)
Date: Mon, 13 Apr 2020 08:03:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 4/4] drm: bridge: adv7511: Make connector creation optional
Message-ID: <20200413060341.GE6324@ravnborg.org>
References: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200409004610.12346-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409004610.12346-5-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=Q7H639hEakLP61KJCQoA:9
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 03:46:10AM +0300, Laurent Pinchart wrote:
> Now that the driver supports all the connector-related bridge
> operations, make the connector creation optional. This enables usage of
> the adv7511 with the DRM bridge connector helper.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 723560b36ee0..60efd19fa4df 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -902,17 +902,14 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
>  				 enum drm_bridge_attach_flags flags)
>  {
>  	struct adv7511 *adv = bridge_to_adv7511(bridge);
> -	int ret;
> +	int ret = 0;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		ret = adv7511_connector_init(adv);
> +		if (ret < 0)
> +			return ret;
>  	}
>  
> -	ret = adv7511_connector_init(adv);
> -	if (ret < 0)
> -		return ret;
> -
>  	if (adv->type == ADV7533 || adv->type == ADV7535)
>  		ret = adv7533_attach_dsi(adv);
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
