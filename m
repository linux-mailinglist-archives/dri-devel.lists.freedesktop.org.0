Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 847D47AEA33
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 12:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDBC10E3A2;
	Tue, 26 Sep 2023 10:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E25D10E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 10:19:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B88B5D8B;
 Tue, 26 Sep 2023 12:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695723489;
 bh=SBNoMValBa3zD8hhV+chpfhcWfb+RtbDclJg9oNmR1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WmiRTtZI8GwhvvBPjhdi/m0cBM1vZRIjW4O/s9HXdAmaxDEPUN3OyQWm816lTMIXh
 2dSFDsWwMeycp8mCJ3Q5vQUyJL+1J9Nany8dfHSbv/nZWil+YXgTbT+CZDIBkQl5kO
 ZfcJpL+iRkrgWK7DciBpc//NCAQ6ZUM3fWECTaw4=
Date: Tue, 26 Sep 2023 13:19:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/2] drm/bridge: use drm_bridge_get_edid() instead of
 using ->get_edid directly
Message-ID: <20230926101959.GB5854@pendragon.ideasonboard.com>
References: <20230914131450.2473061-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230914131450.2473061-1-jani.nikula@intel.com>
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

Thank you for the patch.

On Thu, Sep 14, 2023 at 04:14:49PM +0300, Jani Nikula wrote:
> Make drm_bridge_get_edid() the one place to call the hook.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 1da93d5a1f61..31baf1f5ff81 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -238,7 +238,7 @@ static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
>  	if (status != connector_status_connected)
>  		goto no_edid;
>  
> -	edid = bridge->funcs->get_edid(bridge, connector);
> +	edid = drm_bridge_get_edid(bridge, connector);
>  	if (!drm_edid_is_valid(edid)) {
>  		kfree(edid);
>  		goto no_edid;

-- 
Regards,

Laurent Pinchart
