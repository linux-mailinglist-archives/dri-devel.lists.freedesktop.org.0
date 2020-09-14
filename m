Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD82699EC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 01:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841656E185;
	Mon, 14 Sep 2020 23:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EC66E185
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:50:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EA51275;
 Tue, 15 Sep 2020 01:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600127439;
 bh=iNsUVoOpimtPMpsh7LHnXpgXant0qZ7noNfJYzDAiGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KVH0dF3lCBMEelfW/yL36CLM5YPgv+PZVSZEAEE6NEMKTPVnvX4lYd54ZRrn0SLpe
 FTMil3hTIMXEpfvGsdC4XmAo2WCHAsdBGPvTFCRHwB4hNx2DxsRTdzUxd9sY2SxVjM
 CT5zEDbdVTM5AaZlQJeDHuVU4NWah/O8o++taL+8=
Date: Tue, 15 Sep 2020 02:50:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 1/2] drm/tilcdc: Do not keep vblank interrupts enabled
 all the time
Message-ID: <20200914235011.GK15543@pendragon.ideasonboard.com>
References: <cover.1600072407.git.jsarha@ti.com>
 <f22f53c569ee2722d909c4673b5c7cd43628bfd6.1600072407.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f22f53c569ee2722d909c4673b5c7cd43628bfd6.1600072407.git.jsarha@ti.com>
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
Cc: tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jyri,

Thank you for the patch.

On Mon, Sep 14, 2020 at 11:34:49AM +0300, Jyri Sarha wrote:
> END_OF_FRAME interrupts have been enabled all the time since the
> beginning of this driver. It is about time to add this feature.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 36 +++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> index 1856962411c7..29f263e1975a 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -147,12 +147,9 @@ static void tilcdc_crtc_enable_irqs(struct drm_device *dev)
>  		tilcdc_set(dev, LCDC_RASTER_CTRL_REG,
>  			LCDC_V1_SYNC_LOST_INT_ENA | LCDC_V1_FRAME_DONE_INT_ENA |
>  			LCDC_V1_UNDERFLOW_INT_ENA);
> -		tilcdc_set(dev, LCDC_DMA_CTRL_REG,
> -			LCDC_V1_END_OF_FRAME_INT_ENA);
>  	} else {
>  		tilcdc_write(dev, LCDC_INT_ENABLE_SET_REG,
>  			LCDC_V2_UNDERFLOW_INT_ENA |
> -			LCDC_V2_END_OF_FRAME0_INT_ENA |
>  			LCDC_FRAME_DONE | LCDC_SYNC_LOST);
>  	}
>  }
> @@ -678,11 +675,44 @@ static int tilcdc_crtc_atomic_check(struct drm_crtc *crtc,
>  
>  static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
> +	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
> +	struct drm_device *dev = crtc->dev;
> +	struct tilcdc_drm_private *priv = dev->dev_private;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
> +
> +	tilcdc_clear_irqstatus(dev, LCDC_END_OF_FRAME0);
> +
> +	if (priv->rev == 1)
> +		tilcdc_set(dev, LCDC_DMA_CTRL_REG,
> +			   LCDC_V1_END_OF_FRAME_INT_ENA);
> +	else
> +		tilcdc_set(dev, LCDC_INT_ENABLE_SET_REG,
> +			   LCDC_V2_END_OF_FRAME0_INT_ENA);
> +
> +	spin_unlock_irqrestore(&tilcdc_crtc->irq_lock, flags);
> +
>  	return 0;
>  }
>  
>  static void tilcdc_crtc_disable_vblank(struct drm_crtc *crtc)
>  {
> +	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
> +	struct drm_device *dev = crtc->dev;
> +	struct tilcdc_drm_private *priv = dev->dev_private;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
> +
> +	if (priv->rev == 1)
> +		tilcdc_clear(dev, LCDC_DMA_CTRL_REG,
> +			     LCDC_V1_END_OF_FRAME_INT_ENA);
> +	else
> +		tilcdc_clear(dev, LCDC_INT_ENABLE_SET_REG,
> +			     LCDC_V2_END_OF_FRAME0_INT_ENA);
> +
> +	spin_unlock_irqrestore(&tilcdc_crtc->irq_lock, flags);
>  }
>  
>  static void tilcdc_crtc_reset(struct drm_crtc *crtc)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
