Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EE459C062
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 15:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D008B51E;
	Mon, 22 Aug 2022 13:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B9A8B487
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:20:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B73B2B3;
 Mon, 22 Aug 2022 15:20:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661174430;
 bh=T3xjb+9Jx29xj6VPguf1lXxrZ++lLKuha4NYqNKcs48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XScdmiSfT/cY7RPPh5ccp81wWZCFld9+FsSN0k2yHXbxBNT1LVZvbVEkcYZO7474v
 c1L74SNGSqRpLyciKS2Acu4we+gwFnb2LHVVBn4X3tW0DLMdi9MNv0oUIJRLZTQyPh
 Xsh4pULi3BPfG+1STGwc5JHvtWPSozCTo8TauUZM=
Date: Mon, 22 Aug 2022 16:20:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 2/4] drm: rcar-du: dsi: Improve DSI shutdown
Message-ID: <YwOCmqcZfU4zfr3D@pendragon.ideasonboard.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
 <20220822130513.119029-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220822130513.119029-3-tomi.valkeinen@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Mon, Aug 22, 2022 at 04:05:10PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Improve the DSI shutdown procedure by clearing various bits that were
> set while enabling the DSI output. There has been no clear issues caused
> by these, but it's safer to ensure that the features are disabled at the
> start of the next DSI enable.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 7f2be490fcf8..6a10a35f1122 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -441,9 +441,21 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  
>  static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
>  {
> +	/* Disable VCLKEN */
> +	rcar_mipi_dsi_clr(dsi, VCLKEN, VCLKEN_CKEN);
> +
> +	/* Disable DOT clock */
> +	rcar_mipi_dsi_clr(dsi, VCLKSET, VCLKSET_CKEN);

I think you can write 0 to those two registers, this will also be safer.
With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I think there's a bug in rcar_mipi_dsi_startup() related to this by the
way, the function only uses rcar_mipi_dsi_set() to set bits, so if the
DSI format is modified between two starts, bad things will happen.

> +
>  	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_RSTZ);
>  	rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
>  
> +	/* CFGCLK disable */
> +	rcar_mipi_dsi_clr(dsi, CFGCLKSET, CFGCLKSET_CKEN);
> +
> +	/* LPCLK disable */
> +	rcar_mipi_dsi_clr(dsi, LPCLKSET, LPCLKSET_CKEN);
> +
>  	dev_dbg(dsi->dev, "DSI device is shutdown\n");
>  }
>  

-- 
Regards,

Laurent Pinchart
