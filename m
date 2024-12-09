Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80619EA260
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 00:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D4010E365;
	Mon,  9 Dec 2024 23:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K/z8bvjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A235610E365
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 23:04:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CC556EC;
 Tue, 10 Dec 2024 00:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733785441;
 bh=Qcxa64sqKdeh/6r/m4016i3rOJhE43hZnPajfIkR4ek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K/z8bvjw0WtKMU/6c110zoSWLuKHA3PhH5s6qjsCLUoYZdfKcTUJsPHKtAr0v6nPK
 m0+EK8lGSCPgh1m2q+BINxwB+g0ZLUjG7ykzLBwcwr5OZW9GvqwWZUFcrv6b5GT5Py
 zLOI2oWhMAv/ZKI5FaiDvPUgmEMWFZdPKcy7o/gM=
Date: Tue, 10 Dec 2024 01:04:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 02/10] drm/rcar-du: Write DPTSR only if the second
 source exists
Message-ID: <20241209230418.GC26531@pendragon.ideasonboard.com>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-2-d74c2166fa15@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241206-rcar-gh-dsi-v3-2-d74c2166fa15@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Fri, Dec 06, 2024 at 11:32:35AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Currently the driver always writes DPTSR when setting up the hardware.
> However, writing the register is only meaningful when the second source
> for a plane is used, and the register is not even documented for SoCs
> that do not have the second source.

I've confirmed that for all the models currently supported by the DU
driver.

> So move the write behind a condition.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I will test the series on an M3N board.

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> index 2ccd2581f544..1ec806c8e013 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> @@ -185,11 +185,21 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
>  	rcar_du_group_write(rgrp, DORCR, dorcr);
>  
> -	/* Apply planes to CRTCs association. */
> -	mutex_lock(&rgrp->lock);
> -	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> -			    rgrp->dptsr_planes);
> -	mutex_unlock(&rgrp->lock);
> +	/*
> +	 * DPTSR is used to select the source for the planes of a group. The
> +	 * first source is chosen by writing 0 to the respective bits, and this
> +	 * is always the default value of the register. In other words, writing
> +	 * DPTSR is only needed if the SoC supports choosing the second source.
> +	 *
> +	 * The SoCs documentations seems to confirm this, as the DPTSR register
> +	 * is not documented if only the first source exists on that SoC.
> +	 */
> +	if (rgrp->channels_mask & BIT(1)) {
> +		mutex_lock(&rgrp->lock);
> +		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> +				    rgrp->dptsr_planes);
> +		mutex_unlock(&rgrp->lock);
> +	}
>  }
>  
>  /*
> 

-- 
Regards,

Laurent Pinchart
