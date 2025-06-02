Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9643DACAB99
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 11:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D0E10E4E2;
	Mon,  2 Jun 2025 09:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lPP4f5MO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEA410E1C8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 09:42:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E943CC80;
 Mon,  2 Jun 2025 11:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1748857371;
 bh=Qk7HCEn2kQwMoo97ED70//dpd1Rs3Ea5nSCYTLe93Mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lPP4f5MOgoHvSdVknol94ZvnANY6nalCH5fpHGb/ofu4jgPwkWugIwIP2V7nubX5m
 JIVM9zT0UbjD35BZbWJEPVl6CSRLKRjjZMn01ymQYutm5Elf5Jai7CBFc/zRjYCsZ5
 PG2bUWOH7lGIYzI/8aXqe8Bwyo1dNl7qwhnQL8Cc=
Date: Mon, 2 Jun 2025 12:42:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 12/12] drm: renesas: rz-du: mipi_dsi: Add support for
 LPCLK clock handling
Message-ID: <20250602094243.GB3645@pendragon.ideasonboard.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530165906.411144-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530165906.411144-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Prabhakar,

Thank you for the patch.

On Fri, May 30, 2025 at 05:59:06PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add LPCLK clock support in the RZ/G2L MIPI DSI driver via the optional
> clock API. This clock is required by some SoCs like RZ/V2H(P) for proper
> DPHY configuration, whereas it is absent on others like RZ/G2L.
> 
> Introduce a new `lpclk` field in the `rzg2l_mipi_dsi` structure and
> conditionally acquire the "lpclk" clock using `devm_clk_get_optional()`
> during probe. This allows LPCLK-aware SoCs to pass the clock via device
> tree without impacting existing platforms.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
> - No changes
> 
> v4->v5:
> - Made use of devm_clk_get_optional() for lpclk
> - Added Reviewed tag from Biju
> 
> v3->v4
> - No changes
> 
> v2->v3:
> - No changes
> 
> v1->v2:
> - Added LPCLK as feature flag
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index f9f2d883c40d..a31f9b6aa920 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -62,6 +62,7 @@ struct rzg2l_mipi_dsi {
>  	struct drm_bridge *next_bridge;
>  
>  	struct clk *vclk;
> +	struct clk *lpclk;
>  
>  	enum mipi_dsi_pixel_format format;
>  	unsigned int num_data_lanes;
> @@ -791,6 +792,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	if (IS_ERR(dsi->vclk))
>  		return PTR_ERR(dsi->vclk);
>  
> +	dsi->lpclk = devm_clk_get_optional(dsi->dev, "lpclk");
> +	if (IS_ERR(dsi->lpclk))
> +		return PTR_ERR(dsi->lpclk);
> +

This clock isn't used in this series, it will only be used when you will
submit the next version of "[PATCH v4 15/15] drm: renesas: rz-du:
mipi_dsi: Add support for RZ/V2H(P) SoC". As this patch doesn't bring
any used feature, I'm tempted to say it could be bundled with the
RZ/V2H(P) support patch.

>  	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
>  	if (IS_ERR(dsi->rstc))
>  		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),

-- 
Regards,

Laurent Pinchart
