Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639FE2AB55F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 11:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DA68940F;
	Mon,  9 Nov 2020 10:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5178940F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 10:49:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12F38B2B;
 Mon,  9 Nov 2020 11:49:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604918983;
 bh=7n9Yat1LWWRbM/MHFdHEdgdkx/EI6U1p1Djt3qGtJ/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NYfDuXIR1o6F1exG7Fs5IxNCYfHhiu+dNJgw81gLix9699bqnzy/jVn5ozxQ3uFEV
 fU6w/tR4TXc+sbNgDtRiGGl8Fqycz6smegn5qwEyg3lunFjyTZXSYRuZPg9cZ6gv48
 2HGMUnx+pVgY7Jf4BwShCSXHOs6nRWV3ETtBlzNo=
Date: Mon, 9 Nov 2020 12:49:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 37/56] drm/omap: panel-dsi-cm: support unbinding
Message-ID: <20201109104939.GH6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-38-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-38-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi and Sebastian,

On Thu, Nov 05, 2020 at 02:03:14PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Now, that the driver implements the common DRM panel API
> the unbind no longer needs to be suppressed.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'd be curious to know what happens when you try to unbind through sysfs
though...

> ---
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 5159dd51a353..086c7d71fe17 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -607,7 +607,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  	return r;
>  }
>  
> -static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
> +static int dsicm_remove(struct mipi_dsi_device *dsi)
>  {
>  	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
>  
> @@ -637,11 +637,10 @@ MODULE_DEVICE_TABLE(of, dsicm_of_match);
>  
>  static struct mipi_dsi_driver dsicm_driver = {
>  	.probe = dsicm_probe,
> -	.remove = __exit_p(dsicm_remove),
> +	.remove = dsicm_remove,
>  	.driver = {
>  		.name = "panel-dsi-cm",
>  		.of_match_table = dsicm_of_match,
> -		.suppress_bind_attrs = true,
>  	},
>  };
>  module_mipi_dsi_driver(dsicm_driver);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
