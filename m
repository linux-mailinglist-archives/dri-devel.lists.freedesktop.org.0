Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2092ADB4FD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 17:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE81B10E36F;
	Mon, 16 Jun 2025 15:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cd+rEl4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C94710E107;
 Mon, 16 Jun 2025 15:13:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 357B7346;
 Mon, 16 Jun 2025 17:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750086793;
 bh=0HNCExAqJ+LaxU1ueCxhXgS3CX0/GTT4qiqhOCeleZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cd+rEl4LeP/ZHIM4gWEMYhjqXD0/rin9VjD52OOHdZvIkqhRoZaWZn00QN6bJnKA6
 pVExi1IbQLR4xfrlBC/dpwg8ODX0SRU7pxY8ZM2CFH8LzJOKfAccxMJQ+5H54VHgVS
 rCMxoyNkNFjfyxiC7+vvZacma5jP5aesiq8AWwhs=
Date: Mon, 16 Jun 2025 18:13:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <20250616151309.GF10542@pendragon.ideasonboard.com>
References: <20250613090431.127087-1-tzimmermann@suse.de>
 <20250613090431.127087-26-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613090431.127087-26-tzimmermann@suse.de>
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

Hi Thomas,

Thank you for the patch.

On Fri, Jun 13, 2025 at 11:00:44AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index b47463473472..7ea0cd4f71d3 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_fourcc.h>
> @@ -363,10 +364,12 @@ static int zynqmp_dpsub_dumb_create(struct drm_file *file_priv,
>  				    struct drm_mode_create_dumb *args)
>  {
>  	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(drm);
> -	unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> +	int ret;
>  
>  	/* Enforce the alignment constraints of the DMA engine. */
> -	args->pitch = ALIGN(pitch, dpsub->dma_align);
> +	ret = drm_mode_size_dumb(drm, args, dpsub->dma_align, 0);
> +	if (ret)
> +		return ret;
>  
>  	return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
>  }

-- 
Regards,

Laurent Pinchart
