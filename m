Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F942C93CC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FF289DB4;
	Tue,  1 Dec 2020 00:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCB689DB4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:20:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EE1645D;
 Tue,  1 Dec 2020 01:20:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606782020;
 bh=EmyZhbpmN7xDql+z/nlN+5tqU9dCcEyFXY+mi6UcLxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AwYBZdI58ErMUughOnUN0s+jqjFqH1Tq2cHSeh6vpEdr80lA4JqOsIJvaeC7lHSSG
 BayeZmvolUzP47b0Sy4PpQbbNDhKpbi+ETJd93WcWK7v03/Q3AKn6uC3vBmKMOZXC6
 YIIpos18LbcKStFV+RqHBCUbipeIwjbYQvuhar6w=
Date: Tue, 1 Dec 2020 02:20:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 66/80] drm/omap: dsi: set LP/HS before update
Message-ID: <20201201002011.GK25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-67-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-67-tomi.valkeinen@ti.com>
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

On Tue, Nov 24, 2020 at 02:45:24PM +0200, Tomi Valkeinen wrote:
> We currently use a single VC for sending commands and pixel data. The
> LP/HS mode for pixel data is correct by accident, as we have set the VC
> to HS already earlier.
> 
> However, if we use a different VC for video data, the VC is in LP mode.
> Fix this by always setting the LP/HS mode before starting a frame
> update.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index c3f13226ac26..41d6231d6e31 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3918,6 +3918,8 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
>  
>  	dsi_set_ulps_auto(dsi, false);
>  
> +	dsi_vc_enable_hs(dssdev, vc, !(dsi->dsidev->mode_flags & MIPI_DSI_MODE_LPM));
> +
>  	r = _dsi_send_nop(dsi, vc, dsi->dsidev->channel);
>  	if (r < 0) {
>  		DSSWARN("failed to send nop between frames: %d\n", r);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
