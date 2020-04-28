Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C871BC227
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 17:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502C86E817;
	Tue, 28 Apr 2020 15:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94ADC6E817
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 15:01:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j1so25044694wrt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 08:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rgd8XnAwAnaonQHP8U+S6EDsBOWbCLru9re1qGI+j9o=;
 b=laf0BzS90Qs2/dx5EgFea7IVPuPzUsX3v+aMA9z8H6zbsE2Ydt7Gmi2aeFSJCxhaEL
 YSVGjTGl3RhPOjCNwzRkfEwAbYn8PDoMFbJh7nVffW6aH718nCFMLYbXxYjLiEzFKfRT
 m1ULq7jRbpc9KS7mLBcKCFicM31Yw/cDRytaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rgd8XnAwAnaonQHP8U+S6EDsBOWbCLru9re1qGI+j9o=;
 b=ttDBKb/f2Sp/cqgaLbgsn+RCqcfYu4f/GI5Hh15/tbZEzjS1Cs8ilYN934g6LbpmzU
 ZfddsWAV04L/DC9thPyIuFolhEDncTEtldnniE1DM4/8R2Z8wIghXU5sOZbHs6kxiGw0
 IwpO1+7EAlRi3FXQDaveotViIFW91FvTPMiPsj/klpoFrRrtpEScg13CBTVaMLBZNsZV
 A2G69jq/cmGC0g5Q55DLJH7G2PNj4i9jWVIrgs/ZB/NeQWG62XLA0M7ha3b671amOmVD
 OGW780drEBXMN/DOYq9f9T3NlyaVSewNAtY/fuyhGlTvJXJoh6BtGbPbRL+uW2dIsscM
 4baA==
X-Gm-Message-State: AGi0PuaiTLB6b4t7f2lOJSWJoC+c/MOv2cNfJVf6W1q8Trxe1H8MAkmA
 LusZWPesObKNOtu8Bct/p+e+YMK4dJA=
X-Google-Smtp-Source: APiQypIrAwPitWzpdewDBE+8BrAmu2tlsh/lk4S0vpMqkF/0UaMZ0t+/E30Hu85fly1b5OzuG/rvGA==
X-Received: by 2002:adf:e403:: with SMTP id g3mr34048331wrm.121.1588086103086; 
 Tue, 28 Apr 2020 08:01:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z2sm25118897wrm.77.2020.04.28.08.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 08:01:42 -0700 (PDT)
Date: Tue, 28 Apr 2020 17:01:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH 3/5] drm/i915/dmabuf: Add LMEM knowledge to dmabuf map
 handler
Message-ID: <20200428150140.GR3456981@phenom.ffwll.local>
References: <20200422212519.36276-1-michael.j.ruhl@intel.com>
 <20200422212519.36276-4-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422212519.36276-4-michael.j.ruhl@intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: jianxin.xiong@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 05:25:17PM -0400, Michael J. Ruhl wrote:
> LMEM backed buffer objects do not have struct page information.
> Instead the dma_address of the struct sg is used to store the
> LMEM address information (relative to the device, this is not
> the CPU physical address).
> 
> The dmabuf map handler requires pages to do a dma_map_xx.
> 
> Add new mapping/unmapping functions, based on the LMEM usage
> of the dma_address to allow LMEM backed buffer objects to be
> mapped.
> 
> Before mapping check the peer2peer distance to verify that P2P
> dma can occur.

So this is supposed to check the importer's allow_peer2peer flag, and that
one is supposed to require the implementation of ->move_notify. Which
requires a pile of locking changes to align with dma_resv.

By not doing all that you avoid the lockdep splats, but you're also
breaking the peer2peer dma-buf contract big time :-)

I think this needs more work, or I need better glasses in case I'm not
spotting where this is all done.
-Daniel

> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 82 ++++++++++++++++++++--
>  1 file changed, 76 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index 7ea4abb6a896..402c989cc23d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -7,6 +7,7 @@
>  #include <linux/dma-buf.h>
>  #include <linux/highmem.h>
>  #include <linux/dma-resv.h>
> +#include <linux/pci-p2pdma.h>
>  #include <linux/scatterlist.h>
>  
>  #include "i915_drv.h"
> @@ -18,6 +19,67 @@ static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
>  	return to_intel_bo(buf->priv);
>  }
>  
> +static void dmabuf_unmap_addr(struct device *dev, struct scatterlist *sgl,
> +			      int nents, enum dma_data_direction dir)
> +{
> +	struct scatterlist *sg;
> +	int i;
> +
> +	for_each_sg(sgl, sg, nents, i)
> +		dma_unmap_resource(dev, sg_dma_address(sg), sg_dma_len(sg),
> +				   dir, 0);
> +}
> +
> +/**
> + * dmabuf_map_addr - Update LMEM address to a physical address and map the
> + * resource.
> + * @dev: valid device
> + * @obj: valid i915 GEM object
> + * @sg: scatter list to appy mapping to
> + * @nents: number of entries in the scatter list
> + * @dir: DMA direction
> + *
> + * The dma_address of the scatter list is the LMEM "address".  From this the
> + * actual physical address can be determined.
> + *
> + * Return of 0 means error.
> + *
> + */
> +static int dmabuf_map_addr(struct device *dev, struct drm_i915_gem_object *obj,
> +			   struct scatterlist *sgl, int nents,
> +			   enum dma_data_direction dir)
> +{
> +	struct scatterlist *sg;
> +	phys_addr_t addr;
> +	int distance;
> +	int i;
> +
> +	distance = pci_p2pdma_distance_many(obj->base.dev->pdev, &dev, 1,
> +					    true);
> +	if (distance < 0) {
> +		pr_info("%s: from: %s  to: %s  distance: %d\n", __func__,
> +			pci_name(obj->base.dev->pdev), dev_name(dev),
> +			distance);
> +		return 0;
> +	}
> +
> +	for_each_sg(sgl, sg, nents, i) {
> +		addr = sg_dma_address(sg) + obj->mm.region->io_start;
> +
> +		sg->dma_address = dma_map_resource(dev, addr, sg->length, dir,
> +						   0);
> +		if (dma_mapping_error(dev, sg->dma_address))
> +			goto unmap;
> +		sg->dma_length = sg->length;
> +	}
> +
> +	return nents;
> +
> +unmap:
> +	dmabuf_unmap_addr(dev, sgl, i, dir);
> +	return 0;
> +}
> +
>  static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attach,
>  					     enum dma_data_direction dir)
>  {
> @@ -44,12 +106,17 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attach,
>  	dst = sgt->sgl;
>  	for_each_sg(obj->mm.pages->sgl, src, obj->mm.pages->nents, i) {
>  		sg_set_page(dst, sg_page(src), src->length, 0);
> +		sg_dma_address(dst) = sg_dma_address(src);
>  		dst = sg_next(dst);
>  	}
>  
> -	if (!dma_map_sg_attrs(attach->dev,
> -			      sgt->sgl, sgt->nents, dir,
> -			      DMA_ATTR_SKIP_CPU_SYNC)) {
> +	if (i915_gem_object_has_struct_page(obj))
> +		ret = dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
> +				       DMA_ATTR_SKIP_CPU_SYNC);
> +	else
> +		ret = dmabuf_map_addr(attach->dev, obj, sgt->sgl, sgt->nents,
> +				      dir);
> +	if (!ret) {
>  		ret = -ENOMEM;
>  		goto err_free_sg;
>  	}
> @@ -72,9 +139,12 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>  {
>  	struct drm_i915_gem_object *obj = dma_buf_to_obj(attach->dmabuf);
>  
> -	dma_unmap_sg_attrs(attach->dev,
> -			   sgt->sgl, sgt->nents, dir,
> -			   DMA_ATTR_SKIP_CPU_SYNC);
> +	if (i915_gem_object_has_struct_page(obj))
> +		dma_unmap_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
> +				   DMA_ATTR_SKIP_CPU_SYNC);
> +	else
> +		dmabuf_unmap_addr(attach->dev, sgt->sgl, sgt->nents, dir);
> +
>  	sg_free_table(sgt);
>  	kfree(sgt);
>  
> -- 
> 2.21.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
