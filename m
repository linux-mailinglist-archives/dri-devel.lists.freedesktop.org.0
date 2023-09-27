Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A090A7B02F8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 13:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF6510E4DD;
	Wed, 27 Sep 2023 11:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04B810E4DD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 11:30:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [95.214.66.65])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEA3F18BF;
 Wed, 27 Sep 2023 13:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695814148;
 bh=5bo6r2/LPGApnRs+9PTPwUM7C/LYIxjo4c/kVCF055o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SE0hr3lCvxdNSPiag/tjfksWjD1WxDpwvNuTn/T/Z+YbWdmwqZqPZZMRVGpHDRvSd
 xD5zpLxnLjAs30o9ZwjqZZt+Ghtn+vXwSPnFjZVgDZEPgdQyUiyyn6ukEzlsABUWrt
 LI4qYzvDAf4Fr70omOAXBZwPSRxqU6EAPGm0jxzg=
Date: Wed, 27 Sep 2023 14:30:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611uxc: use drm_bridge_get_edid()
 instead of using ->get_edid directly
Message-ID: <20230927113058.GA8079@pendragon.ideasonboard.com>
References: <20230914131450.2473061-1-jani.nikula@intel.com>
 <20230914131450.2473061-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230914131450.2473061-2-jani.nikula@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Thu, Sep 14, 2023 at 04:14:50PM +0300, Jani Nikula wrote:
> Make drm_bridge_get_edid() the one place to call the hook.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> UNTESTED

I can't test this either, but it looks fine.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 22c84d29c2bc..7835738a532e 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -296,7 +296,7 @@ static int lt9611uxc_connector_get_modes(struct drm_connector *connector)
>  	unsigned int count;
>  	struct edid *edid;
>  
> -	edid = lt9611uxc->bridge.funcs->get_edid(&lt9611uxc->bridge, connector);
> +	edid = drm_bridge_get_edid(&lt9611uxc->bridge, connector);
>  	drm_connector_update_edid_property(connector, edid);
>  	count = drm_add_edid_modes(connector, edid);
>  	kfree(edid);

-- 
Regards,

Laurent Pinchart
