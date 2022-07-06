Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE15690AC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B656112690;
	Wed,  6 Jul 2022 17:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB95112B4F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 17:28:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C84C30A;
 Wed,  6 Jul 2022 19:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657128534;
 bh=ZlWUPRClil4qnXIdp+fR5UfEwUINySgLRda1BvGZM0o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OleaHpGJkxCqxMi0edhbip+w2jz5LM0UB3MzmawpmEgY4c0AHsmJUhQR7fZtK488B
 0IEaOg4igLvoisoX8YMEOLUqK7SWMn+bZwRrTfUhE4EfuG+LFuG1bXDA6mWt9764qf
 9hzvpFmYF2kYnmEjsejv8Dt2/iUSAAcazRe8P4Gs=
Date: Wed, 6 Jul 2022 20:28:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 3/4] drm/gem: rename struct drm_gem_dma_object.{paddr
 => dma_addr}
Message-ID: <YsXGPfKYhPsayHpv@pendragon.ideasonboard.com>
References: <20220706124352.874528-1-dakr@redhat.com>
 <20220706124352.874528-4-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220706124352.874528-4-dakr@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

Thank you for the patch.

On Wed, Jul 06, 2022 at 02:43:51PM +0200, Danilo Krummrich wrote:
> The field paddr of struct drm_gem_dma_object holds a DMA address, which
> might actually be a physical address. However, depending on the platform,
> it can also be a bus address or a virtual address managed by an IOMMU.
> 
> Hence, rename the field to dma_addr, which is more applicable.
> 
> Since 'paddr' is a very commonly used term and symbol name a simple regex
> does not do the trick. Instead, users of the struct were fixed up
> iteratively with a trial and error approach building with
> `make allyesconfig && make drivers/gpu/drm`.

Not for this patch as you've already done the work manually, but can I
recommend the excellent coccinelle tool ? Its semantic patches can very
easily rename structure members.

> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  .../arm/display/komeda/komeda_framebuffer.c   |  4 ++--
>  drivers/gpu/drm/arm/malidp_mw.c               |  2 +-
>  drivers/gpu/drm/arm/malidp_planes.c           | 12 +++++-----
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |  2 +-
>  drivers/gpu/drm/drm_fb_dma_helper.c           | 10 ++++----
>  drivers/gpu/drm/drm_gem_dma_helper.c          | 23 +++++++++++--------
>  drivers/gpu/drm/imx/ipuv3-plane.c             |  6 ++---
>  drivers/gpu/drm/sprd/sprd_dpu.c               |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c        | 14 +++++------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 14 +++++------
>  drivers/gpu/drm/tidss/tidss_dispc.c           | 16 ++++++-------
>  drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_bo.c                  |  2 +-
>  drivers/gpu/drm/vc4/vc4_gem.c                 |  8 +++----
>  drivers/gpu/drm/vc4/vc4_irq.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_plane.c               |  4 ++--
>  drivers/gpu/drm/vc4/vc4_render_cl.c           | 14 +++++------
>  drivers/gpu/drm/vc4/vc4_txp.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_v3d.c                 |  4 ++--
>  drivers/gpu/drm/vc4/vc4_validate.c            | 12 +++++-----
>  include/drm/drm_gem_dma_helper.h              |  4 ++--
>  21 files changed, 81 insertions(+), 78 deletions(-)

[snip]

> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> index 56fc1a1e7f87..8851d294bb53 100644
> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c

[snip]

> @@ -460,10 +461,11 @@ drm_gem_dma_prime_import_sg_table(struct drm_device *dev,
>  	if (IS_ERR(dma_obj))
>  		return ERR_CAST(dma_obj);
>  
> -	dma_obj->paddr = sg_dma_address(sgt->sgl);
> +	dma_obj->dma_addr = sg_dma_address(sgt->sgl);
>  	dma_obj->sgt = sgt;
>  
> -	DRM_DEBUG_PRIME("dma_addr = %pad, size = %zu\n", &dma_obj->paddr, attach->dmabuf->size);
> +	DRM_DEBUG_PRIME("dma_addr = %pad, size = %zu\n", &dma_obj->dma_addr,
> +							 attach->dmabuf->size);

The second line should be aligned left, just right of the opening
parenthesis.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	return &dma_obj->base;
>  }

[snip]

-- 
Regards,

Laurent Pinchart
