Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B34021C000
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82EE6ED34;
	Fri, 10 Jul 2020 22:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DF26ED34
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:38:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 913AA2C0;
 Sat, 11 Jul 2020 00:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594420711;
 bh=rFSuTX5wRWIcJnUejGQEjcHy7pjruEfOhPqp7XEoc0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h9iXuugYhyo/oWqxSY/KHL9UXnQrqXvTJ4XmNskH8btKaFqhXtGzzoQChjjZtg4iT
 RSpymlaIju/d3OMrLqQmlyHxSeG2NtpZMLa2K30xxHSq2UF0dFnvmcPrwJR9nsXnX3
 xlOTKO5631odFzSzbSEULqal3QjB5NkBeQfSLrZk=
Date: Sat, 11 Jul 2020 01:38:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 17/21] drm/bridge: megachips: make connector creation
 optional
Message-ID: <20200710223825.GU5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-18-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-18-sam@ravnborg.org>
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
 Martin Donnelly <martin.donnelly@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Fri, Jul 03, 2020 at 09:24:13PM +0200, Sam Ravnborg wrote:
> Make the connector creation optional to enable usage of the
> megachips-stdpxxxx-ge-b850v3-fw bridge with the DRM bridge connector helper.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Peter Senna Tschudin <peter.senna@gmail.com>
> Cc: Martin Donnelly <martin.donnelly@ge.com>
> Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 5f06e18f0a61..991417ab35b6 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -251,16 +251,6 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
>  {
>  	struct i2c_client *stdp4028_i2c
>  			= ge_b850v3_lvds_ptr->stdp4028_i2c;
> -	int ret;
> -
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> -
> -	ret = ge_b850v3_lvds_create_connector(bridge);
> -	if (ret)
> -		return ret;
>  
>  	/* Configures the bridge to re-enable interrupts after each ack. */
>  	i2c_smbus_write_word_data(stdp4028_i2c,
> @@ -272,7 +262,10 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
>  				  STDP4028_DPTX_IRQ_EN_REG,
>  				  STDP4028_DPTX_IRQ_CONFIG);
>  
> -	return 0;
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
> +
> +	return ge_b850v3_lvds_create_connector(bridge);
>  }
>  
>  static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
