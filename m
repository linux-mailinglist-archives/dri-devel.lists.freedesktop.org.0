Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4596C4BDB40
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 18:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A47710E734;
	Mon, 21 Feb 2022 17:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2262D10E727
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 17:23:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79574482;
 Mon, 21 Feb 2022 18:23:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645464216;
 bh=NqFJhwQyZcctRvGSCMd+zhukBkUPAuuq4bIRaGLQpwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UnWZz9+3GfBVY+qqLm9oKm+wGAxQsc0et10mmwWrNb2mO0PmP4NqbnLs7CyiJhyEX
 f7UwEn5I5JchMWg9Gyo+a1W9jwBLgcNA1SKZojb3riJcqYQSvzirkArvv79y2Z0w9B
 n/Rk/vRV1T1wdaPdLnmSv8bykTrU8BudZdsOpKn0=
Date: Mon, 21 Feb 2022 19:23:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] drm: rcar-du: Simplify division/shift logic
Message-ID: <YhPKjzUHVs0N6pj9@pendragon.ideasonboard.com>
References: <aee36069582647a0841ec8b49c4c824f901a3f9f.1645460725.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aee36069582647a0841ec8b49c4c824f901a3f9f.1645460725.git.geert+renesas@glider.be>
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
Cc: David Airlie <airlied@linux.ie>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Mon, Feb 21, 2022 at 05:26:15PM +0100, Geert Uytterhoeven wrote:
> "a / (1 << b)" == "a >> b".
> 
> No change in generated code.

If there's no change in generated code, isn't the current code more
readable ? :-)

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 72a272cfc11ee129..30afc1d3482a9670 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -229,7 +229,7 @@ static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
>  				 * the PLL, followed by a an optional fixed /7
>  				 * divider.
>  				 */
> -				fout = fvco / (1 << e) / div7;
> +				fout = (fvco >> e) / div7;
>  				div = max(1UL, DIV_ROUND_CLOSEST(fout, target));
>  				diff = abs(fout / div - target);
>  
> @@ -249,7 +249,7 @@ static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
>  	}
>  
>  done:
> -	output = fin * pll->pll_n / pll->pll_m / (1 << pll->pll_e)
> +	output = (fin * pll->pll_n / pll->pll_m >> pll->pll_e)
>  	       / div7 / pll->div;
>  	error = (long)(output - target) * 10000 / (long)target;
>  

-- 
Regards,

Laurent Pinchart
