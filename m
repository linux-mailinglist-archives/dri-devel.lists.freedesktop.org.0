Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF04ABDCC9
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B6C10E517;
	Tue, 20 May 2025 14:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AcGVRCBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424C610E517
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:28:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A63262EC;
 Tue, 20 May 2025 16:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1747751280;
 bh=To839h9GABdkq17dtAEeZRfQrFBVJpTujeZieRb2WRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AcGVRCBQonYOMCs2KAdyYSnTFxRMRUVFDFkB1jgtRngy9MWqnGeCZdFrq3u/RnCcp
 cPeE04kwyXV8/dWZOJwVkXJ+lGKA3usJOrgICgLMYVd8DucNXE3u6he7AzQ2mumyiB
 sOuL9ntg/2TAMbDdaqFi/oE4TouHzdl+h7KOGhAY=
Date: Tue, 20 May 2025 16:28:15 +0200
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
Subject: Re: [PATCH v5 10/12] drm: renesas: rz-du: mipi_dsi: Add
 dphy_late_init() callback for RZ/V2H(P)
Message-ID: <20250520142815.GJ13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, May 12, 2025 at 07:23:28PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to
> allow additional D-PHY register configurations after enabling data and
> clock lanes. This is required for the RZ/V2H(P) SoC but not for the
> RZ/G2L SoC.
> 
> Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined,
> ensuring SoC-specific initialization is performed only when necessary.
> 
> This change prepares for RZ/V2H(P) SoC support while maintaining
> compatibility with existing platforms.
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
> - No changes
> 
> v2->v3:
> - No changes
> 
> v1->v2:
> - No changes
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 55a1c1b043c8..e1ce21a9ddb3 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -34,6 +34,7 @@ struct rzg2l_mipi_dsi;
>  
>  struct rzg2l_mipi_dsi_hw_info {
>  	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
> +	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);

As this is called at startup time I would have called it dphy_startup.
Up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
> @@ -320,6 +321,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
>  	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
>  
> +	if (dsi->info->dphy_late_init)
> +		dsi->info->dphy_late_init(dsi);
> +
>  	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
>  	/*
>  	 * Global timings characteristic depends on high speed Clock Frequency

-- 
Regards,

Laurent Pinchart
