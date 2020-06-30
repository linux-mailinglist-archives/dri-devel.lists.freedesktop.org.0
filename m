Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FA920F3B5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 13:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F60D88D18;
	Tue, 30 Jun 2020 11:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCCE88D18
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:44:56 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 738CA804B4;
 Tue, 30 Jun 2020 13:44:54 +0200 (CEST)
Date: Tue, 30 Jun 2020 13:44:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 06/10] drm/ingenic: Set DMA descriptor chain address
 in probe
Message-ID: <20200630114453.GB560155@ravnborg.org>
References: <20200629235210.441709-1-paul@crapouillou.net>
 <20200629235210.441709-6-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629235210.441709-6-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=e5mUnYsNAAAA:8
 a=_F4ZNtTwmw7fjDG2MVkA:9 a=7tZkzEg-RNLL3d5o:21 a=j8Rw1sZxBYetKqRA:21
 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, David Airlie <airlied@linux.ie>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Tue, Jun 30, 2020 at 01:52:06AM +0200, Paul Cercueil wrote:
> The address of the DMA descriptor never changes. It can therefore be set
> in the probe function.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: No change
> 
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 924c8daf071a..f7b0c5dc8cd8 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -358,8 +358,6 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>  		ingenic_drm_crtc_update_ctrl(priv, finfo);
>  
>  		clk_set_rate(priv->pix_clk, state->adjusted_mode.clock * 1000);
> -
> -		regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc->next);
>  	}
>  
>  	if (event) {
> @@ -757,6 +755,9 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/* Set address of our DMA descriptor chain */
> +	regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc_phys);
> +


What is the purpose of this code after the assignment was moved:

static int ingenic_drm_probe(struct platform_device *pdev)
{
...
	priv->dma_hwdesc->next = priv->dma_hwdesc_phys;

I do not see ->next used anymore.
Could this assignment be dropped?


And the following line:
	priv->dma_hwdesc->id = 0xdeafbead;

I can only see ->id be assingned, it is never referenced??

Maybe this is all related to the structure assumed by the data pointed
to by JZ_REG_LCD_DA0?

	Sam

>  	ret = drm_dev_register(drm, 0);
>  	if (ret) {
>  		dev_err(dev, "Failed to register DRM driver\n");
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
