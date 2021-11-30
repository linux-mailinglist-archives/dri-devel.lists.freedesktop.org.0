Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C7B462AF2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 04:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B496E311;
	Tue, 30 Nov 2021 03:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20E86E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 03:13:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A98388F0;
 Tue, 30 Nov 2021 04:13:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638242012;
 bh=3mQg4zP6l4hzppk+4aIh5rYPaWyxuoUU5tl5IYlbphU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=stzAMPSEL6rNSarXh+GlNl3vr8OlIAIwzltmYlBPACuAZZ0mnOYHQiaTdZhe9E6/V
 B2WQdiIgnGduf7Ehi9vWhG3pJ9cp6K3lLparFjmrEqJ927EqAGDU5W/KL8u06FRqAI
 hssGJNK/GfRGkBY//GbftLaIh7r1SXG1J85TK5Q0=
Date: Tue, 30 Nov 2021 05:13:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/4] drm: rcar-du: mipi-dsi: Ensure correct fout is
 reported
Message-ID: <YaWWwhadGi8Hx/Ar@pendragon.ideasonboard.com>
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
 <20211126101518.938783-4-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211126101518.938783-4-kieran.bingham+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thank you for the patch.

On Fri, Nov 26, 2021 at 10:15:17AM +0000, Kieran Bingham wrote:
> The debug reporting for the clock calculations was erroneously reporting
> the last calculation of fout, rather than the fout that was determined
> to have the least error, and therefore be the values chosen to operate
> with.
> 
> Fix the reporting to show the correct output by storing the determined
> fout, along with the error value.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> 
> I spent /way/ too long confused why my clock values didn't make sense
> before I noticed this.. :-(

Oops :-S Sorry about that.

>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index e94245029f95..833f4480bdf3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -168,6 +168,7 @@ static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *dsi, u32 phtw)
>   */
>  
>  struct dsi_setup_info {
> +	unsigned long fout;
>  	unsigned int err;
>  	u16 vco_cntrl;
>  	u16 prop_cntrl;
> @@ -247,6 +248,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  				setup_info->m = m - 2;
>  				setup_info->n = n - 1;
>  				setup_info->err = err;
> +				setup_info->fout = fout;
>  				if (err == 0)
>  					goto done;
>  			}
> @@ -256,7 +258,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  done:
>  	dev_dbg(dsi->dev,
>  		"%pC %lu Hz -> Fout %lu Hz (target %lu Hz, error %d.%02u%%), PLL M/N/DIV %u/%u/%u\n",
> -		clk, fin, fout, fout_target, setup_info->err / 100,
> +		clk, fin, setup_info->fout, fout_target, setup_info->err / 100,

We don't need the fout in the caller, so it could be a local variable
(best_fout for instance). I can however imagine that we the frequency
could become useful in the caller, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		setup_info->err % 100, setup_info->m,
>  		setup_info->n, setup_info->div);
>  	dev_dbg(dsi->dev,

-- 
Regards,

Laurent Pinchart
