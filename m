Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B6A462B4B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 04:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4116E44E;
	Tue, 30 Nov 2021 03:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2136E44D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 03:48:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 642AB8F0;
 Tue, 30 Nov 2021 04:48:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638244111;
 bh=Ju85iL4hNDoC8/eyKjROgknF4Z5dOgHf2nxHw5W0fyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FXXt811b8LE70eYPo2ULKzDpORmN/2tq+qjrkMX1DRvLYrQjfD29lRn/qNJWSsFbG
 sWYocMrPzrwfOTPubgPTN58Nxv3dn4dRXvBGIVZHfcwhQAXqome8QRWRF3dMGG9wpM
 HELbLmvn+QM54/Mzgt9CmknWjsYfTdCrt5E3o4w0=
Date: Tue, 30 Nov 2021 05:48:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: crtc: Support external DSI dot clock
Message-ID: <YaWe9nOzk+zN9d5u@pendragon.ideasonboard.com>
References: <20211126093514.927340-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211126093514.927340-1-kieran.bingham+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thank you for the patch.

On Fri, Nov 26, 2021 at 09:35:14AM +0000, Kieran Bingham wrote:
> On platforms with an external clock, both the group and crtc must be
> handled accordingly to correctly pass through the external clock and
> configure the DU to use the external rate.
> 
> The CRTC support was missed while adding the DSI support on the r8a779a0
> which led to the output clocks being incorrectly determined.
> 
> Ensure that when a CRTC is routed through the DSI encoder, the external
> clock is used without any further divider being applied.
> 
> Fixes: b291fdcf5114 ("drm: rcar-du: Add r8a779a0 device support")
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 5672830ca184..5236f917cc68 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -261,12 +261,13 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>  		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
>  
>  		escr = ESCR_DCLKSEL_DCLKIN | div;
> -	} else if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index)) {
> +	} else if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) ||
> +		   rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) {
>  		/*
> -		 * Use the LVDS PLL output as the dot clock when outputting to
> -		 * the LVDS encoder on an SoC that supports this clock routing
> -		 * option. We use the clock directly in that case, without any
> -		 * additional divider.
> +		 * Use the external LVDS or DSI PLL output as the dot clock when
> +		 * outputting to the LVDS or DSI encoder on an SoC that supports
> +		 * this clock routing option. We use the clock directly in that
> +		 * case, without any additional divider.
>  		 */
>  		escr = ESCR_DCLKSEL_DCLKIN;
>  	} else {

-- 
Regards,

Laurent Pinchart
