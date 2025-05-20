Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE4ABDB08
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1558F10E50F;
	Tue, 20 May 2025 14:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VspSBnyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55B310E4CC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:05:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC7952EC;
 Tue, 20 May 2025 16:04:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1747749900;
 bh=aFjA4hr5J+CI0Kp3gKA3bDQFHu0RiCSC/H0GYSVxbnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VspSBnyQktAx62F++sBRhCIQrHY3QVApCMawDHNAb7OAt+yH+f47X4xsKznjuBxLg
 +yBhzgWmYYk4Z5svrKbV7gq1ecAEzKOB8Sw2bhyHJUQCXtJfaU9DhLFDT8TybHbgxL
 jlqbkAGVNh6cpphXkatdqYF8c6XcJRXDP2ciqcro=
Date: Tue, 20 May 2025 16:05:14 +0200
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
Subject: Re: [PATCH v5 04/12] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ
 calculation
Message-ID: <20250520140514.GD13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, May 12, 2025 at 07:23:22PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Simplify the high-speed clock frequency (HSFREQ) calculation by removing
> the redundant multiplication and division by 8. The updated equation:
> 
>     hsfreq = (mode->clock * bpp) / (dsi->lanes);

You can drop the parentheses around the second factor. You can actuall
drop all prentheses.

> 
> produces the same result while improving readability and clarity.
> 
> Additionally, update the comment to clarify the relationship between HS
> clock bit frequency, HS byte clock frequency, and HSFREQ.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
> - No changes
> 
> v3->v4:
> - No changes
> 
> v2->v3:
> - No changes
> 
> v1->v2:
> - Added Reviewed-by tag from Biju
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index ec8baecb9ba5..c5f698cd74f1 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	 *       hsclk: DSI HS Byte clock frequency (Hz)
>  	 *       lanes: number of data lanes
>  	 *
> -	 * hsclk(bit) = hsclk(byte) * 8
> +	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
>  	 */
>  	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> -	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
> +	hsfreq = (mode->clock * bpp) / dsi->lanes;

You can drop the parentheses here too.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	ret = pm_runtime_resume_and_get(dsi->dev);
>  	if (ret < 0)

-- 
Regards,

Laurent Pinchart
