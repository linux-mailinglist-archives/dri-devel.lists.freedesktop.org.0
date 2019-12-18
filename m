Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436AA124C24
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44036E84C;
	Wed, 18 Dec 2019 15:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9B56E84C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:49:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 934E0B23;
 Wed, 18 Dec 2019 16:49:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576684193;
 bh=ckbI8wccE/ygxqSPEp5v6gm6VLIHWS9j1JU7iO9qAus=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZKaWnXPp1KNWhioJ4LWrYqXdnssNO8Lakl3X78HwTFChxIwk/YlSgB6+eCBExnItz
 HUp/Vr1Le7KAfBVjMX4lQptH9vQz1+xIQYYaNGGbeKB3+RFMEENx8ln9qUbMO5UFEc
 P8c3hDmfl2CZO2XIlholujzUWvxmLIZyNcHn3lbg=
Date: Wed, 18 Dec 2019 17:49:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 02/10] drm/bridge: dw-hdmi: add max bpc connector
 property
Message-ID: <20191218154942.GG4863@pendragon.ideasonboard.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
 <20191218154637.17509-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218154637.17509-3-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil and Jonas,

Thank you for the patch.

On Wed, Dec 18, 2019 at 04:46:29PM +0100, Neil Armstrong wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> Add the max_bpc property to the dw-hdmi connector to prepare support
> for 10, 12 & 16bit output support.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 6a0b4b3a6739..e7a0600f8cc5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2368,6 +2368,10 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>  				    DRM_MODE_CONNECTOR_HDMIA,
>  				    hdmi->ddc);
>  
> +	drm_atomic_helper_connector_reset(connector);
> +
> +	drm_connector_attach_max_bpc_property(connector, 8, 16);
> +

I'm not asking you to rework this, but have you given any thought on how
we would be able to support this feature in a model where the bridge
wouldn't create a connector anymore (as done in the latest version of
the omapdrm series) ?

>  	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
>  		drm_object_attach_property(&connector->base,
>  			connector->dev->mode_config.hdr_output_metadata_property, 0);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
