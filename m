Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A82D92C941C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACEB89B06;
	Tue,  1 Dec 2020 00:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8390E89B06
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:40:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 068FF31D;
 Tue,  1 Dec 2020 01:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606783244;
 bh=8sve7zmvqAe3Z+4/N4WQsLh+Z5+v4sFLsIUAEN5CPAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=slC5TUH+OmcptusG5xfP4G2Gvw69eTzWByIyVAhTOrfuhWUZjYbmoA3LzNPZ+LaEt
 6kJ1AOgU1hpAXWX4YgTdS7ECxVZrZIH033s44vnO/Hn/N5VVl4IPzGVRtVU8MGubft
 ff92CEWBtiFmWfVTqsjyVVejEjI+XI0M2IKT8jsE=
Date: Tue, 1 Dec 2020 02:40:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 80/80] drm/omap: dsi: fix DCS_CMD_ENABLE
Message-ID: <20201201004035.GD4315@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-81-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-81-tomi.valkeinen@ti.com>
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

On Tue, Nov 24, 2020 at 02:45:38PM +0200, Tomi Valkeinen wrote:
> We only need to set VC_CTRL:DCS_CMD_ENABLE for command mode panels when
> the HW has DSI_QUIRK_DCS_CMD_CONFIG_VC quirk. The old code did this
> right by accident, but now we set DCS_CMD_ENABLE for video mode panels
> too.
> 
> Fix this by skipping the set for video mode.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index ffecacd7350a..d52bef0c7aa2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3401,7 +3401,8 @@ static void dsi_setup_dsi_vcs(struct dsi_data *dsi)
>  	REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 1, 1); /* SOURCE_VP */
>  	dsi->vc[VC_VIDEO].source = DSI_VC_SOURCE_VP;
>  
> -	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC)
> +	if ((dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC) &&
> +	    !(dsi->dsidev->mode_flags & MIPI_DSI_MODE_VIDEO))
>  		REG_FLD_MOD(dsi, DSI_VC_CTRL(VC_VIDEO), 1, 30, 30); /* DCS_CMD_ENABLE */
>  
>  	dsi_vc_enable(dsi, VC_CMD, 1);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
