Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8FD21BF93
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2254C6ED20;
	Fri, 10 Jul 2020 22:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0FB6ED1E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:11:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F3332C0;
 Sat, 11 Jul 2020 00:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594419091;
 bh=DB/dLRzpKPwoH+tOaCV0As4MQjWoJgqr8sxrYe0wrkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZplTGsQCot0jIIpx826QqApkFSDY0RdHonqF+16wfk13iHZn0DGeyQBTqeis3Fcj+
 QnkAkxlZIx46BDAS36S3eUAAq90TikmfzgXoJo2oNOd+y4WhADGHDlouZXyTc2KjTE
 oqHoZsUA7axxhO73ycemrD5jgjKvscVM/Q4COZ7g=
Date: Sat, 11 Jul 2020 01:11:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 02/21] drm/panel: panel-simple: add default
 connector_type
Message-ID: <20200710221124.GI5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-3-sam@ravnborg.org>
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

On Fri, Jul 03, 2020 at 09:23:58PM +0200, Sam Ravnborg wrote:
> All panels shall report a connector type.
> panel-simple has a lot of panels with no connector_type,
> and for these fall back to DPI as the default.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 7b5d212215e0..b3ec965721b0 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -500,6 +500,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	struct panel_simple *panel;
>  	struct display_timing dt;
>  	struct device_node *ddc;
> +	int connector_type;
>  	int err;
>  
>  	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
> @@ -566,8 +567,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  			desc->bpc != 8);
>  	}
>  
> -	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
> -		       desc->connector_type);
> +	/* Default DRM_MODE_CONNECTOR_DPI if no connector_type is set */
> +	if (desc->connector_type != 0)
> +		connector_type = desc->connector_type;
> +	else
> +		connector_type = DRM_MODE_CONNECTOR_DPI;

This avoids a WARN_ON(), which is good, but should we add a dev_warn()
to get this fixed ?

> +
> +	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
>  
>  	err = drm_panel_of_backlight(&panel->base);
>  	if (err)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
