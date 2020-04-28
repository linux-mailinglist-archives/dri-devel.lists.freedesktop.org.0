Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90A01BCBB4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 21:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BCE6EA13;
	Tue, 28 Apr 2020 19:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDBA6EA13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 19:00:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v8so3082921wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mY24f7xBl26TmYlxn3t1q4X4+4CUlBUp+Rl/LFTIwrw=;
 b=MLyBKs+NAuGwe92aVjh4XFlhTReQbGJQEYwTma8vETdXwHk0xLF9Cz2Alj4KQgvGZx
 kXBSYPhUTGTIXcAREQfuBTS7uswQm7AYLOsX2eiPt5CKXHOTuaVLwsVVFR1hcerP8lPn
 bbfW+SMEf86y02aXilTZN4hqh7mmw9/s8Kza8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mY24f7xBl26TmYlxn3t1q4X4+4CUlBUp+Rl/LFTIwrw=;
 b=bSQ/sS8on0MOCZd4uUL0d/UeUlVrD7l25wAnroXeTZcD9XoPRwpMHxxUBgLogXu2CG
 s5v8Ta7Be/r1QeLaTVmlLEG5ocl4k2v98MvwqT9JGoYkFyVlz3SJSv3eOSr0AyvvMYdz
 2XKWGCNVFVICHtre0+mv3XAf3V3qM2PI4tgBV11BZiMZcXD2wqukWgdzGhjmWNt1/BPD
 4kc7XLNsE1I+XSU6rGydFCJ2njBDmUDymvjYhrwkcdJugWtqMw+MnqeOz0Dwoa5pJgnX
 5FcCq47WmHeZnSRW/oFbmFTGsOS7u5WJNV3HWMEtZfkekdQ4MEdLHu+yPErg/5ubs79g
 wcbw==
X-Gm-Message-State: AGi0Pua7GmAb/zVsUhe//RTGoJQvLukr/7AXjZjYZv8PMcavxVdcREk5
 s3o0ToP4GKFxwTJkijl0wWKKCw==
X-Google-Smtp-Source: APiQypK0ZjaW+YEw6GxBs5oFHFzqJjhtHStKtrSAExvB3p8y8jELGHDZLTxjGvw08UTq9l7yjf+JkQ==
X-Received: by 2002:a1c:5446:: with SMTP id p6mr6018262wmi.172.1588100411176; 
 Tue, 28 Apr 2020 12:00:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g15sm27359240wrp.96.2020.04.28.12.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 12:00:10 -0700 (PDT)
Date: Tue, 28 Apr 2020 21:00:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH 3/5] drm/i915/dmabuf: Add LMEM knowledge to dmabuf map
 handler
Message-ID: <20200428190008.GB3456981@phenom.ffwll.local>
References: <20200422212519.36276-1-michael.j.ruhl@intel.com>
 <20200422212519.36276-4-michael.j.ruhl@intel.com>
 <20200428150140.GR3456981@phenom.ffwll.local>
 <14063C7AD467DE4B82DEDB5C278E866301021346F5@FMSMSX108.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E866301021346F5@FMSMSX108.amr.corp.intel.com>
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
Cc: "Xiong, Jianxin" <jianxin.xiong@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 05:36:03PM +0000, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: Daniel Vetter <daniel@ffwll.ch>
> >Sent: Tuesday, April 28, 2020 11:02 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: dri-devel@lists.freedesktop.org; daniel@ffwll.ch; Xiong, Jianxin
> ><jianxin.xiong@intel.com>
> >Subject: Re: [PATCH 3/5] drm/i915/dmabuf: Add LMEM knowledge to dmabuf
> >map handler
> >
> >On Wed, Apr 22, 2020 at 05:25:17PM -0400, Michael J. Ruhl wrote:
> >> LMEM backed buffer objects do not have struct page information.
> >> Instead the dma_address of the struct sg is used to store the
> >> LMEM address information (relative to the device, this is not
> >> the CPU physical address).
> >>
> >> The dmabuf map handler requires pages to do a dma_map_xx.
> >>
> >> Add new mapping/unmapping functions, based on the LMEM usage
> >> of the dma_address to allow LMEM backed buffer objects to be
> >> mapped.
> >>
> >> Before mapping check the peer2peer distance to verify that P2P
> >> dma can occur.
> >
> >So this is supposed to check the importer's allow_peer2peer flag, and that
> >one is supposed to require the implementation of ->move_notify. Which
> >requires a pile of locking changes to align with dma_resv.
> 
> Yeah, I was avoiding that step for the moment.  I am not completely
> comfortable with the how and why of how the move_notify is supposed
> to work, so I  left the current mechanism "as is", and am planning on
> adding the move_notify part as a next step.
> 
> >By not doing all that you avoid the lockdep splats, but you're also
> >breaking the peer2peer dma-buf contract big time :-)
> 
> OK.   I have some concerns because of the differences between the
> AMD and i915 implementations.  It is not clear to me how compatible
> they currently are, and if "matched" the implementation how that would
> affect the i915 driver.

That's kinda the problem. They're not compatible :-/

I'm also pretty sure that we'll discover a bunch of places where the
current debug checks and lockdep annotations we have are insufficient, and
we'll need to add more to lock down this cross driver interface.
-Daniel

> >I think this needs more work, or I need better glasses in case I'm not
> >spotting where this is all done.
> 
> Nope, your glasses are good.  
> 
> I will take a close look at how to incorporate the peer2peer stuff.
> 
> Mike
> 
> 
> >-Daniel
> >
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 82
> >++++++++++++++++++++--
> >>  1 file changed, 76 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> >b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> >> index 7ea4abb6a896..402c989cc23d 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> >> @@ -7,6 +7,7 @@
> >>  #include <linux/dma-buf.h>
> >>  #include <linux/highmem.h>
> >>  #include <linux/dma-resv.h>
> >> +#include <linux/pci-p2pdma.h>
> >>  #include <linux/scatterlist.h>
> >>
> >>  #include "i915_drv.h"
> >> @@ -18,6 +19,67 @@ static struct drm_i915_gem_object
> >*dma_buf_to_obj(struct dma_buf *buf)
> >>  	return to_intel_bo(buf->priv);
> >>  }
> >>
> >> +static void dmabuf_unmap_addr(struct device *dev, struct scatterlist *sgl,
> >> +			      int nents, enum dma_data_direction dir)
> >> +{
> >> +	struct scatterlist *sg;
> >> +	int i;
> >> +
> >> +	for_each_sg(sgl, sg, nents, i)
> >> +		dma_unmap_resource(dev, sg_dma_address(sg),
> >sg_dma_len(sg),
> >> +				   dir, 0);
> >> +}
> >> +
> >> +/**
> >> + * dmabuf_map_addr - Update LMEM address to a physical address and
> >map the
> >> + * resource.
> >> + * @dev: valid device
> >> + * @obj: valid i915 GEM object
> >> + * @sg: scatter list to appy mapping to
> >> + * @nents: number of entries in the scatter list
> >> + * @dir: DMA direction
> >> + *
> >> + * The dma_address of the scatter list is the LMEM "address".  From this
> >the
> >> + * actual physical address can be determined.
> >> + *
> >> + * Return of 0 means error.
> >> + *
> >> + */
> >> +static int dmabuf_map_addr(struct device *dev, struct
> >drm_i915_gem_object *obj,
> >> +			   struct scatterlist *sgl, int nents,
> >> +			   enum dma_data_direction dir)
> >> +{
> >> +	struct scatterlist *sg;
> >> +	phys_addr_t addr;
> >> +	int distance;
> >> +	int i;
> >> +
> >> +	distance = pci_p2pdma_distance_many(obj->base.dev->pdev, &dev,
> >1,
> >> +					    true);
> >> +	if (distance < 0) {
> >> +		pr_info("%s: from: %s  to: %s  distance: %d\n", __func__,
> >> +			pci_name(obj->base.dev->pdev), dev_name(dev),
> >> +			distance);
> >> +		return 0;
> >> +	}
> >> +
> >> +	for_each_sg(sgl, sg, nents, i) {
> >> +		addr = sg_dma_address(sg) + obj->mm.region->io_start;
> >> +
> >> +		sg->dma_address = dma_map_resource(dev, addr, sg-
> >>length, dir,
> >> +						   0);
> >> +		if (dma_mapping_error(dev, sg->dma_address))
> >> +			goto unmap;
> >> +		sg->dma_length = sg->length;
> >> +	}
> >> +
> >> +	return nents;
> >> +
> >> +unmap:
> >> +	dmabuf_unmap_addr(dev, sgl, i, dir);
> >> +	return 0;
> >> +}
> >> +
> >>  static struct sg_table *i915_gem_map_dma_buf(struct
> >dma_buf_attachment *attach,
> >>  					     enum dma_data_direction dir)
> >>  {
> >> @@ -44,12 +106,17 @@ static struct sg_table
> >*i915_gem_map_dma_buf(struct dma_buf_attachment *attach,
> >>  	dst = sgt->sgl;
> >>  	for_each_sg(obj->mm.pages->sgl, src, obj->mm.pages->nents, i) {
> >>  		sg_set_page(dst, sg_page(src), src->length, 0);
> >> +		sg_dma_address(dst) = sg_dma_address(src);
> >>  		dst = sg_next(dst);
> >>  	}
> >>
> >> -	if (!dma_map_sg_attrs(attach->dev,
> >> -			      sgt->sgl, sgt->nents, dir,
> >> -			      DMA_ATTR_SKIP_CPU_SYNC)) {
> >> +	if (i915_gem_object_has_struct_page(obj))
> >> +		ret = dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents,
> >dir,
> >> +				       DMA_ATTR_SKIP_CPU_SYNC);
> >> +	else
> >> +		ret = dmabuf_map_addr(attach->dev, obj, sgt->sgl, sgt-
> >>nents,
> >> +				      dir);
> >> +	if (!ret) {
> >>  		ret = -ENOMEM;
> >>  		goto err_free_sg;
> >>  	}
> >> @@ -72,9 +139,12 @@ static void i915_gem_unmap_dma_buf(struct
> >dma_buf_attachment *attach,
> >>  {
> >>  	struct drm_i915_gem_object *obj = dma_buf_to_obj(attach-
> >>dmabuf);
> >>
> >> -	dma_unmap_sg_attrs(attach->dev,
> >> -			   sgt->sgl, sgt->nents, dir,
> >> -			   DMA_ATTR_SKIP_CPU_SYNC);
> >> +	if (i915_gem_object_has_struct_page(obj))
> >> +		dma_unmap_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
> >> +				   DMA_ATTR_SKIP_CPU_SYNC);
> >> +	else
> >> +		dmabuf_unmap_addr(attach->dev, sgt->sgl, sgt->nents, dir);
> >> +
> >>  	sg_free_table(sgt);
> >>  	kfree(sgt);
> >>
> >> --
> >> 2.21.0
> >>
> >
> >--
> >Daniel Vetter
> >Software Engineer, Intel Corporation
> >http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
