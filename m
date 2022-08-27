Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FBC5A334B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 03:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E034010E07D;
	Sat, 27 Aug 2022 01:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D22010E07D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 01:02:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BF31120A;
 Sat, 27 Aug 2022 03:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661562130;
 bh=xM+jc/Lbu0hMzy1wbKSSzGzBexj3Q7pU5VPh5k7CheA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fb9xxoydXWJsc+JFk0bFjDlQVTbhJEzXIZTivsUoyZOUpTQz2HzH73u9XLrE/Fqiq
 gwIb9aVoh0edrb9RlDA6abB4j4/7j3bRMxS2ACP0eQjgqhmLlu4X1AHxE4F/kCMZKE
 OBGD/4LnKwdF3HSC7Tww4h0q1ZlN3uSWTysj5AMU=
Date: Sat, 27 Aug 2022 04:02:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v4 5/5] drm: rcar-du: dsi: Fix VCLKSET write
Message-ID: <YwltC1QcnOLExY0Y@pendragon.ideasonboard.com>
References: <20220824124726.187224-1-tomi.valkeinen@ideasonboard.com>
 <20220824124726.187224-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220824124726.187224-6-tomi.valkeinen@ideasonboard.com>
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

On Wed, Aug 24, 2022 at 03:47:26PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> rcar_mipi_dsi_startup() writes correct values to VCLKSET, but as it uses
> or-operation to add the new values to the current value in the register,
> it should first make sure the fields are cleared.
> 
> Do this by using rcar_mipi_dsi_write() to write the VCLKSET register
> with a variable that has all the unused bits zeroed.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 06250f2f3499..90128d5e3d17 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -414,7 +414,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  
>  	/* Enable DOT clock */
>  	vclkset = VCLKSET_CKEN;
> -	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> +	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
>  
>  	if (dsi_format == 24)
>  		vclkset |= VCLKSET_BPP_24;
> @@ -429,7 +429,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
>  		|  VCLKSET_LANE(dsi->lanes - 1);
>  
> -	rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> +	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
>  
>  	/* After setting VCLKSET register, enable VCLKEN */
>  	rcar_mipi_dsi_set(dsi, VCLKEN, VCLKEN_CKEN);

-- 
Regards,

Laurent Pinchart
