Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C988E74ACF2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 10:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CF510E52C;
	Fri,  7 Jul 2023 08:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF55D10E531
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 08:33:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-32-136-nat.elisa-mobile.fi
 [85.76.32.136])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B31B558;
 Fri,  7 Jul 2023 10:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1688718768;
 bh=MhmJ9pJ9a55aNDKmho1ipzodgSmPCUeGpN8jVIoi1BM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K6TfX1n7nEa3q8K8A56uubRqLS51TypqiKorlVPT5ruw7+2Fx6CS2/44IOziX9RUg
 y31CoOkEi+cNPZYSpdlRghX7/+jd7UaKoryNvLoFOt5GNcz05qobXUF15z7r5lI29j
 nS5pcxwa0r0lMb3N5mkXwrnyNU9U3GWafE6j+Fjk=
Date: Fri, 7 Jul 2023 11:33:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH 01/18] drm/renesas: Convert to
 devm_platform_ioremap_resource()
Message-ID: <20230707083329.GA16622@pendragon.ideasonboard.com>
References: <20230707072034.48977-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230707072034.48977-1-frank.li@vivo.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yangtao,

Thank you for the patch.

On Fri, Jul 07, 2023 at 03:20:17PM +0800, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index e10e4d4b89a2..4bf9f5d15fa8 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -1002,7 +1002,6 @@ static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *dsi)
>  static int rcar_mipi_dsi_probe(struct platform_device *pdev)
>  {
>  	struct rcar_mipi_dsi *dsi;
> -	struct resource *mem;
>  	int ret;
>  
>  	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> @@ -1019,8 +1018,7 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	/* Acquire resources. */
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	dsi->mmio = devm_ioremap_resource(dsi->dev, mem);
> +	dsi->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(dsi->mmio))
>  		return PTR_ERR(dsi->mmio);
>  

-- 
Regards,

Laurent Pinchart
