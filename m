Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C77ABDC74
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B281610E538;
	Tue, 20 May 2025 14:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iMnFyB8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DE110E538
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:24:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01D8B2EC;
 Tue, 20 May 2025 16:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1747751031;
 bh=QTLMqr2zIE+uYbBUUKKtEg0SYp8ygrhoH+/kgbyNgeo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iMnFyB8K85swvPdyZroStTnuTT7U4Q71ieqt9tdGvY2q6gZKDOqHrldCf5weMh3wP
 4vi4me9No4YB84u+8XZ/gpIvofpAgdGCHoXSzETCFpR8MAU6rygk/lFP+2XPIxAk/T
 YcA/w4oR5A5uQzDp8NJA/PF4QjlM927R5QSrs73o=
Date: Tue, 20 May 2025 16:24:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 08/12] drm: renesas: rz-du: mipi_dsi: Use mHz for
 D-PHY frequency calculations
Message-ID: <20250520142405.GG13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, May 12, 2025 at 07:23:26PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
> precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
> high accuracy.

I have a hard time imagining the need for milliHz accuracy. Could you
please explain why that is needed on V2H ?

> These changes prepare the driver for upcoming RZ/V2H(P) SoC support.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
> - Added Reviewed tag from Biju
> 
> v3->v4:
> - Used MILLI instead of KILO
> - Made use of mul_u32_u32() for multiplication
> 
> v2->v3:
> - Replaced `unsigned long long` with `u64`
> - Replaced *_mhz with *_millihz` in functions
> 
> v1->v2:
> - No changes
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 5fc607be0c46..f93519613662 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -31,7 +31,7 @@
>  struct rzg2l_mipi_dsi;
>  
>  struct rzg2l_mipi_dsi_hw_info {
> -	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
> +	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
>  	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
> @@ -200,8 +200,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
>   */
>  
>  static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> -				    unsigned long hsfreq)
> +				    u64 hsfreq_millihz)
>  {
> +	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
>  	const struct rzg2l_mipi_dsi_timings *dphy_timings;
>  	unsigned int i;
>  	u32 dphyctrl0;
> @@ -274,6 +275,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  				  const struct drm_display_mode *mode)
>  {
>  	unsigned long hsfreq, vclk_rate;
> +	u64 hsfreq_millihz;
>  	unsigned int bpp;
>  	u32 txsetr;
>  	u32 clstptsetr;
> @@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	if (vclk_rate != mode->clock * MILLI)
>  		dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
>  			 mode->clock * MILLI, vclk_rate);
> -	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> +	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
>  
> -	ret = dsi->info->dphy_init(dsi, hsfreq);
> +	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
>  	if (ret < 0)
>  		goto err_phy;
>  
> @@ -315,6 +317,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
>  	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
>  
> +	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
>  	/*
>  	 * Global timings characteristic depends on high speed Clock Frequency
>  	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
> @@ -776,7 +779,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	 * mode->clock and format are not available. So initialize DPHY with
>  	 * timing parameters for 80Mbps.
>  	 */
> -	ret = dsi->info->dphy_init(dsi, 80000000);
> +	ret = dsi->info->dphy_init(dsi, 80000000ULL * MILLI);
>  	if (ret < 0)
>  		goto err_phy;
>  

-- 
Regards,

Laurent Pinchart
