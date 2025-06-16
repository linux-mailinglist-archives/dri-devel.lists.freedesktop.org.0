Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF628ADB502
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 17:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3557410E3CB;
	Mon, 16 Jun 2025 15:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QM67Xzx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E74110E3CB;
 Mon, 16 Jun 2025 15:14:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55562346;
 Mon, 16 Jun 2025 17:13:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750086834;
 bh=aNDbKOOjHpsSVm/u+QK5zaGokrrj0d/sOrb/9/P49gE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QM67Xzx99jtSxFtbVWkxi9ny3lkeshszCYykwUWs4y08YnSKdKJ/O207ngwOCheOQ
 TcS9TWQkg/ZF3B5IT/PRnJdD6ZeF54pordOC63Upxph3fPlOeSwafp7l71BiZ0xPAD
 TAv/k4j+OiUsCXXAJRp6zom83aLOsyaQGJY4FajI=
Date: Mon, 16 Jun 2025 18:13:50 +0300
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
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 17/25] drm/renesas/rcar-du: Compute dumb-buffer sizes
 with drm_mode_size_dumb()
Message-ID: <20250616151350.GG10542@pendragon.ideasonboard.com>
References: <20250613090431.127087-1-tzimmermann@suse.de>
 <20250613090431.127087-18-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613090431.127087-18-tzimmermann@suse.de>
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

On Fri, Jun 13, 2025 at 11:00:36AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 4c8fe83dd610..dd353fb858ef 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> @@ -407,8 +408,8 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			struct drm_mode_create_dumb *args)
>  {
>  	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
> -	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>  	unsigned int align;
> +	int ret;
>  
>  	/*
>  	 * The R8A7779 DU requires a 16 pixels pitch alignment as documented,
> @@ -419,7 +420,9 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	else
>  		align = 16 * args->bpp / 8;
>  
> -	args->pitch = roundup(min_pitch, align);
> +	ret = drm_mode_size_dumb(dev, args, align, 0);
> +	if (ret)
> +		return ret;
>  
>  	return drm_gem_dma_dumb_create_internal(file, dev, args);
>  }

-- 
Regards,

Laurent Pinchart
