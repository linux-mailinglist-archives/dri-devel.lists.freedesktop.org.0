Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6532C817E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB1C6E43C;
	Mon, 30 Nov 2020 09:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF8B6E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:55:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 615BD97E;
 Mon, 30 Nov 2020 10:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606730146;
 bh=F632zAfOnkVUhZDpDRO4KCi2k6m3q4ajdwqJGrR2YWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=klBINz1nb6p/F/LRk5mCz93AhVajhK67Q6oh+HVo4SYGj6AEcBiwNOTJB5//Q9ZvF
 e8EFcltBt2P5WzJhYmpBa1kOSYuyII4kmKEYrZUIi4IKQfBWAk8ivZQqC8p6e+1HBP
 HZG3CKaHdQvRpL9nHyap7095zt6hHuJTe/eMgTVw=
Date: Mon, 30 Nov 2020 11:55:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 59/80] drm/omap: dsi: set trans_mode according to
 client mode_flags
Message-ID: <20201130095538.GK4141@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-60-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-60-tomi.valkeinen@ti.com>
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

On Tue, Nov 24, 2020 at 02:45:17PM +0200, Tomi Valkeinen wrote:
> The DSI host driver currently ignores the video mode flags in
> client->mode_flags. Add the code to take the transfer mode from client's
> mode_flags.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index c3592c6db977..7fee9cf8782d 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -5140,6 +5140,13 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
>  	dsi->config.lp_clk_min = 7000000; // TODO: get from client?
>  	dsi->config.lp_clk_max = client->lp_rate;
>  
> +	if (client->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> +		dsi->config.trans_mode = OMAP_DSS_DSI_BURST_MODE;
> +	else if (client->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +		dsi->config.trans_mode = OMAP_DSS_DSI_PULSE_MODE;
> +	else
> +		dsi->config.trans_mode = OMAP_DSS_DSI_EVENT_MODE;
> +
>  	dsi->ulps_auto_idle = false;
>  
>  	return 0;
> 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
