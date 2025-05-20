Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A1AABDCA3
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12DC10E4DB;
	Tue, 20 May 2025 14:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O0pHPqMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA0F10E4DB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:26:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6B8F2EC;
 Tue, 20 May 2025 16:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1747751147;
 bh=7ulwypwJJ5Y11qeYAI4E5zzbs2+20sESyLFc+V69als=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O0pHPqMCOcxnGJSnAo+O5VnqA122+DeVV9m1qoqKaFT5rKyyJozNqRl85bWQ6KxqE
 EDHshQUO+V6ApK3dIzvxdtWzD6ithBq7iP7/IYOdTlV0YaX9frCeFnuZIK5eGqrTYM
 wyT3rwzpbjXHTvcH3aVTr46/16ldZhAN3tI7FUW4=
Date: Tue, 20 May 2025 16:26:02 +0200
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
Subject: Re: [PATCH v5 09/12] drm: renesas: rz-du: mipi_dsi: Add feature flag
 for 16BPP support
Message-ID: <20250520142602.GH13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, May 12, 2025 at 07:23:27PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Introduce the `RZ_MIPI_DSI_FEATURE_16BPP` flag in `rzg2l_mipi_dsi_hw_info`
> to indicate support for 16BPP pixel formats. The RZ/V2H(P) SoC supports
> 16BPP, whereas this feature is missing on the RZ/G2L SoC.
> 
> Update the `mipi_dsi_host_attach()` function to check this flag before
> allowing 16BPP formats. If the SoC does not support 16BPP, return an error
> to prevent incorrect format selection.
> 
> This change enables finer-grained format support control for different
> SoC variants.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v4->v5:
> - Updated RZ_MIPI_DSI_FEATURE_16BPP macro to use BIT(0)
> - Added Reviewed tag from Biju
> 
> v3->v4:
> - No changes
> 
> v2->v3:
> - No changes
> 
> v1->v2:
> - Renamed RZ_MIPI_DSI_FEATURE_16BPP
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index f93519613662..55a1c1b043c8 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -28,6 +28,8 @@
>  
>  #include "rzg2l_mipi_dsi_regs.h"
>  
> +#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
> +
>  struct rzg2l_mipi_dsi;
>  
>  struct rzg2l_mipi_dsi_hw_info {
> @@ -37,6 +39,7 @@ struct rzg2l_mipi_dsi_hw_info {
>  	u32 link_reg_offset;
>  	unsigned long max_dclk;
>  	unsigned long min_dclk;
> +	u8 features;
>  };
>  
>  struct rzg2l_mipi_dsi {
> @@ -643,8 +646,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  
>  	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
>  	case 24:
> +		break;
>  	case 18:
>  		break;
> +	case 16:
> +		if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_16BPP)) {
> +			dev_err(dsi->dev, "Unsupported format 0x%04x\n",
> +				device->format);
> +			return -EINVAL;
> +		}
> +		break;
>  	default:
>  		dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->format);
>  		return -EINVAL;

-- 
Regards,

Laurent Pinchart
