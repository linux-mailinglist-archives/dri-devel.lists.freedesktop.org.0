Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FED2C93D3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4055F89DD8;
	Tue,  1 Dec 2020 00:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B172089DD8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:21:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43F7645D;
 Tue,  1 Dec 2020 01:21:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606782080;
 bh=Lu33/2kcnuW1RbmNV5G6DLZQSxSuhYk9Oe+BD9FRLEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZnFxT5R/MEaAp55v3Y4sU2wjGumKy6GukLh11sLDKmnJo2DBc0mG1wPQ2TMZh6Usq
 Di6Bb85PMnGduWMG/8pnZ5ytrcfzJ0duVPbDpQ4UCn3Llomn/pU2QO6Xx1IOaU9pMa
 V8uczcRoYyZOlbv1ZhQ6K2upfVjPntngApzbnNtk=
Date: Tue, 1 Dec 2020 02:21:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 67/80] drm/omap: dsi: use separate VCs for cmd and video
Message-ID: <20201201002112.GL25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-68-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-68-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:25PM +0200, Tomi Valkeinen wrote:
> For command mode panels we can use a single VC for sending command and
> video data, even if we have to change the data source for that VC when
> going from command to video or vice versa.
> 
> However, with video mode panels we want to keep the pixel data VC
> enabled, and use another VC for command data, and the commands will get
> interleaved into the pixel data.
> 
> This patch makes the driver use VC0 for commands and VC1 for video.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 41d6231d6e31..019814a0a264 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -452,7 +452,9 @@ static bool dsi_perf;
>  module_param(dsi_perf, bool, 0644);
>  #endif
>  
> -#define VC_DEFAULT 0
> +/* Note: for some reason video mode seems to work only if VC_VIDEO is 0 */
> +#define VC_VIDEO	0
> +#define VC_CMD		1
>  
>  #define drm_bridge_to_dsi(bridge) \
>  	container_of(bridge, struct dsi_data, bridge)
> @@ -3723,7 +3725,7 @@ static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
>  	dsi_bus_lock(dsi);
>  	dsi->video_enabled = false;
>  
> -	dsi_disable_video_output(dssdev, VC_DEFAULT);
> +	dsi_disable_video_output(dssdev, VC_VIDEO);
>  
>  	dsi_display_disable(dssdev);
>  
> @@ -3946,7 +3948,7 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
>  
>  static int dsi_update_all(struct omap_dss_device *dssdev)
>  {
> -	return dsi_update_channel(dssdev, VC_DEFAULT);
> +	return dsi_update_channel(dssdev, VC_VIDEO);
>  }
>  
>  /* Display funcs */
> @@ -4179,7 +4181,7 @@ static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
>  
>  	dsi_display_enable(dssdev);
>  
> -	dsi_enable_video_output(dssdev, VC_DEFAULT);
> +	dsi_enable_video_output(dssdev, VC_VIDEO);
>  
>  	dsi->video_enabled = true;
>  
> @@ -4936,7 +4938,7 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
>  {
>  	struct dsi_data *dsi = host_to_omap(host);
>  	int r;
> -	int vc = VC_DEFAULT;
> +	int vc = VC_CMD;
>  
>  	dsi_bus_lock(dsi);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
