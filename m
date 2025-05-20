Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE41ABDC48
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D53D10E54B;
	Tue, 20 May 2025 14:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F8LH1+de";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B1E10E54B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:22:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A5D42EC;
 Tue, 20 May 2025 16:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1747750945;
 bh=O4/Qz//x5SNkBt3F+0GC+9Gq6U70ROuBxVnFGG4z+Hg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8LH1+deH9/T7V3LcZkLtalwoQgpgodz84VPaCqgnwg2JvIbXRnEcv62adwyKfbBB
 OS7Llac0oe1MnfpCAxnEnBDH00XLrBlli9lJwNMlaPW+iWcU/u3RADG9NDDttv00Ld
 rn6/b95dydSwG80duxxV0c9+jcxafAcu1tN3QkbQ=
Date: Tue, 20 May 2025 16:22:40 +0200
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
Subject: Re: [PATCH v5 06/12] drm: renesas: rz-du: mipi_dsi: Add OF data
 support
Message-ID: <20250520142240.GF13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, May 12, 2025 at 07:23:24PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> In preparation for adding support for the Renesas RZ/V2H(P) SoC, this patch
> introduces a mechanism to pass SoC-specific information via OF data in the
> DSI driver. This enables the driver to adapt dynamically to various
> SoC-specific requirements without hardcoding configurations.
> 
> The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to the one
> on the RZ/G2L SoC. While the LINK registers are shared between the two
> SoCs, the D-PHY registers differ. Also the VCLK range differs on both these
> SoCs. To accommodate these differences `struct rzg2l_mipi_dsi_hw_info` is
> introduced and as now passed as OF data.
> 
> These changes lay the groundwork for the upcoming RZ/V2H(P) SoC support by
> allowing SoC-specific data to be passed through OF.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
> - Dropped RZ_MIPI_DSI_FEATURE_DPHY_RST feature flag
> - Added Reviewed tag from Biju
> 
> v3->v4:
> - No changes
> 
> v2->v3:
> - Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it is not needed.
> 
> v1->v2:
> - Added DPHY_RST as feature flag
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 51 ++++++++++++++-----
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  2 -
>  2 files changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 3f6988303e63..00c2bc6e9d6c 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -28,10 +28,23 @@
>  
>  #include "rzg2l_mipi_dsi_regs.h"
>  
> +struct rzg2l_mipi_dsi;
> +
> +struct rzg2l_mipi_dsi_hw_info {
> +	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
> +	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
> +	u32 phy_reg_offset;
> +	u32 link_reg_offset;
> +	unsigned long max_dclk;
> +	unsigned long min_dclk;

I'd put min before max.

> +};
> +
>  struct rzg2l_mipi_dsi {
>  	struct device *dev;
>  	void __iomem *mmio;
>  
> +	const struct rzg2l_mipi_dsi_hw_info *info;
> +
>  	struct reset_control *rstc;
>  	struct reset_control *arstc;
>  	struct reset_control *prstc;
> @@ -164,22 +177,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
>  
>  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
>  {
> -	iowrite32(data, dsi->mmio + reg);
> +	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
>  }
>  
>  static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
>  {
> -	iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
> +	iowrite32(data, dsi->mmio + dsi->info->link_reg_offset + reg);
>  }
>  
>  static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
>  {
> -	return ioread32(dsi->mmio + reg);
> +	return ioread32(dsi->mmio + dsi->info->phy_reg_offset + reg);
>  }
>  
>  static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
>  {
> -	return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
> +	return ioread32(dsi->mmio + dsi->info->link_reg_offset + reg);
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -294,7 +307,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  			 mode->clock * MILLI, vclk_rate);
>  	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
>  
> -	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
> +	ret = dsi->info->dphy_init(dsi, hsfreq);
>  	if (ret < 0)
>  		goto err_phy;
>  
> @@ -337,7 +350,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	return 0;
>  
>  err_phy:
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  
>  	return ret;
> @@ -345,7 +358,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  
>  static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
>  {
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  }
>  
> @@ -587,10 +600,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>  				 const struct drm_display_info *info,
>  				 const struct drm_display_mode *mode)
>  {
> -	if (mode->clock > 148500)
> +	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
> +
> +	if (mode->clock > dsi->info->max_dclk)
>  		return MODE_CLOCK_HIGH;
>  
> -	if (mode->clock < 5803)
> +	if (mode->clock < dsi->info->min_dclk)
>  		return MODE_CLOCK_LOW;
>  
>  	return MODE_OK;
> @@ -716,6 +731,8 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, dsi);
>  	dsi->dev = &pdev->dev;
>  
> +	dsi->info = of_device_get_match_data(&pdev->dev);
> +
>  	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
>  	if (ret < 0)
>  		return dev_err_probe(dsi->dev, ret,
> @@ -759,13 +776,13 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	 * mode->clock and format are not available. So initialize DPHY with
>  	 * timing parameters for 80Mbps.
>  	 */
> -	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
> +	ret = dsi->info->dphy_init(dsi, 80000000);
>  	if (ret < 0)
>  		goto err_phy;
>  
>  	txsetr = rzg2l_mipi_dsi_link_read(dsi, TXSETR);
>  	dsi->num_data_lanes = min(((txsetr >> 16) & 3) + 1, num_data_lanes);
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  
>  	/* Initialize the DRM bridge. */
> @@ -782,7 +799,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_phy:
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  err_pm_disable:
>  	pm_runtime_disable(dsi->dev);
> @@ -797,8 +814,16 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> +static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
> +	.dphy_init = rzg2l_mipi_dsi_dphy_init,
> +	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
> +	.link_reg_offset = 0x10000,
> +	.max_dclk = 148500,
> +	.min_dclk = 5803,

Here too.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +};
> +
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
> -	{ .compatible = "renesas,rzg2l-mipi-dsi" },
> +	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
>  	{ /* sentinel */ }
>  };
>  
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> index 1dbc16ec64a4..16efe4dc59f4 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -41,8 +41,6 @@
>  #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
>  
>  /* --------------------------------------------------------*/
> -/* Link Registers */
> -#define LINK_REG_OFFSET			0x10000
>  
>  /* Link Status Register */
>  #define LINKSR				0x10

-- 
Regards,

Laurent Pinchart
