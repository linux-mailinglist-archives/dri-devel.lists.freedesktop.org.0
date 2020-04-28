Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60131BC6E1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 19:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C9F6E894;
	Tue, 28 Apr 2020 17:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520F36E894
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 17:36:16 +0000 (UTC)
IronPort-SDR: kgnZpgnmRHiNlLTHKyO20zX07YzOdBBy8uvei7grXaSsi+Xm1+vMJNMX6rQqBE5+KLpNzBDt/P
 M/KQqk2j5Ukg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 10:36:15 -0700
IronPort-SDR: tVmqUai7rbrtrLINlFz58ia2ISjKWdVo8rUGJI1hUglyOaYeHPFBrbk5TMaO7ZorjL5TUa+iCP
 w1fGNPIoBJaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="336697627"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga001.jf.intel.com with ESMTP; 28 Apr 2020 10:36:15 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Apr 2020 10:36:04 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.13]) by
 FMSMSX112.amr.corp.intel.com ([169.254.5.239]) with mapi id 14.03.0439.000;
 Tue, 28 Apr 2020 10:36:03 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH 3/5] drm/i915/dmabuf: Add LMEM knowledge to dmabuf map
 handler
Thread-Topic: [PATCH 3/5] drm/i915/dmabuf: Add LMEM knowledge to dmabuf map
 handler
Thread-Index: AQHWGOyY+CqeFhPsj0ezedLSdHy0HqiPH1cA//+znnA=
Date: Tue, 28 Apr 2020 17:36:03 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E866301021346F5@FMSMSX108.amr.corp.intel.com>
References: <20200422212519.36276-1-michael.j.ruhl@intel.com>
 <20200422212519.36276-4-michael.j.ruhl@intel.com>
 <20200428150140.GR3456981@phenom.ffwll.local>
In-Reply-To: <20200428150140.GR3456981@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
MIME-Version: 1.0
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

>-----Original Message-----
>From: Daniel Vetter <daniel@ffwll.ch>
>Sent: Tuesday, April 28, 2020 11:02 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: dri-devel@lists.freedesktop.org; daniel@ffwll.ch; Xiong, Jianxin
><jianxin.xiong@intel.com>
>Subject: Re: [PATCH 3/5] drm/i915/dmabuf: Add LMEM knowledge to dmabuf
>map handler
>
>On Wed, Apr 22, 2020 at 05:25:17PM -0400, Michael J. Ruhl wrote:
>> LMEM backed buffer objects do not have struct page information.
>> Instead the dma_address of the struct sg is used to store the
>> LMEM address information (relative to the device, this is not
>> the CPU physical address).
>>
>> The dmabuf map handler requires pages to do a dma_map_xx.
>>
>> Add new mapping/unmapping functions, based on the LMEM usage
>> of the dma_address to allow LMEM backed buffer objects to be
>> mapped.
>>
>> Before mapping check the peer2peer distance to verify that P2P
>> dma can occur.
>
>So this is supposed to check the importer's allow_peer2peer flag, and that
>one is supposed to require the implementation of ->move_notify. Which
>requires a pile of locking changes to align with dma_resv.

Yeah, I was avoiding that step for the moment.  I am not completely
comfortable with the how and why of how the move_notify is supposed
to work, so I  left the current mechanism "as is", and am planning on
adding the move_notify part as a next step.

>By not doing all that you avoid the lockdep splats, but you're also
>breaking the peer2peer dma-buf contract big time :-)

OK.   I have some concerns because of the differences between the
AMD and i915 implementations.  It is not clear to me how compatible
they currently are, and if "matched" the implementation how that would
affect the i915 driver.

>I think this needs more work, or I need better glasses in case I'm not
>spotting where this is all done.

Nope, your glasses are good.  

I will take a close look at how to incorporate the peer2peer stuff.

Mike


>-Daniel
>
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 82
>++++++++++++++++++++--
>>  1 file changed, 76 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> index 7ea4abb6a896..402c989cc23d 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -7,6 +7,7 @@
>>  #include <linux/dma-buf.h>
>>  #include <linux/highmem.h>
>>  #include <linux/dma-resv.h>
>> +#include <linux/pci-p2pdma.h>
>>  #include <linux/scatterlist.h>
>>
>>  #include "i915_drv.h"
>> @@ -18,6 +19,67 @@ static struct drm_i915_gem_object
>*dma_buf_to_obj(struct dma_buf *buf)
>>  	return to_intel_bo(buf->priv);
>>  }
>>
>> +static void dmabuf_unmap_addr(struct device *dev, struct scatterlist *sgl,
>> +			      int nents, enum dma_data_direction dir)
>> +{
>> +	struct scatterlist *sg;
>> +	int i;
>> +
>> +	for_each_sg(sgl, sg, nents, i)
>> +		dma_unmap_resource(dev, sg_dma_address(sg),
>sg_dma_len(sg),
>> +				   dir, 0);
>> +}
>> +
>> +/**
>> + * dmabuf_map_addr - Update LMEM address to a physical address and
>map the
>> + * resource.
>> + * @dev: valid device
>> + * @obj: valid i915 GEM object
>> + * @sg: scatter list to appy mapping to
>> + * @nents: number of entries in the scatter list
>> + * @dir: DMA direction
>> + *
>> + * The dma_address of the scatter list is the LMEM "address".  From this
>the
>> + * actual physical address can be determined.
>> + *
>> + * Return of 0 means error.
>> + *
>> + */
>> +static int dmabuf_map_addr(struct device *dev, struct
>drm_i915_gem_object *obj,
>> +			   struct scatterlist *sgl, int nents,
>> +			   enum dma_data_direction dir)
>> +{
>> +	struct scatterlist *sg;
>> +	phys_addr_t addr;
>> +	int distance;
>> +	int i;
>> +
>> +	distance = pci_p2pdma_distance_many(obj->base.dev->pdev, &dev,
>1,
>> +					    true);
>> +	if (distance < 0) {
>> +		pr_info("%s: from: %s  to: %s  distance: %d\n", __func__,
>> +			pci_name(obj->base.dev->pdev), dev_name(dev),
>> +			distance);
>> +		return 0;
>> +	}
>> +
>> +	for_each_sg(sgl, sg, nents, i) {
>> +		addr = sg_dma_address(sg) + obj->mm.region->io_start;
>> +
>> +		sg->dma_address = dma_map_resource(dev, addr, sg-
>>length, dir,
>> +						   0);
>> +		if (dma_mapping_error(dev, sg->dma_address))
>> +			goto unmap;
>> +		sg->dma_length = sg->length;
>> +	}
>> +
>> +	return nents;
>> +
>> +unmap:
>> +	dmabuf_unmap_addr(dev, sgl, i, dir);
>> +	return 0;
>> +}
>> +
>>  static struct sg_table *i915_gem_map_dma_buf(struct
>dma_buf_attachment *attach,
>>  					     enum dma_data_direction dir)
>>  {
>> @@ -44,12 +106,17 @@ static struct sg_table
>*i915_gem_map_dma_buf(struct dma_buf_attachment *attach,
>>  	dst = sgt->sgl;
>>  	for_each_sg(obj->mm.pages->sgl, src, obj->mm.pages->nents, i) {
>>  		sg_set_page(dst, sg_page(src), src->length, 0);
>> +		sg_dma_address(dst) = sg_dma_address(src);
>>  		dst = sg_next(dst);
>>  	}
>>
>> -	if (!dma_map_sg_attrs(attach->dev,
>> -			      sgt->sgl, sgt->nents, dir,
>> -			      DMA_ATTR_SKIP_CPU_SYNC)) {
>> +	if (i915_gem_object_has_struct_page(obj))
>> +		ret = dma_map_sg_attrs(attach->dev, sgt->sgl, sgt->nents,
>dir,
>> +				       DMA_ATTR_SKIP_CPU_SYNC);
>> +	else
>> +		ret = dmabuf_map_addr(attach->dev, obj, sgt->sgl, sgt-
>>nents,
>> +				      dir);
>> +	if (!ret) {
>>  		ret = -ENOMEM;
>>  		goto err_free_sg;
>>  	}
>> @@ -72,9 +139,12 @@ static void i915_gem_unmap_dma_buf(struct
>dma_buf_attachment *attach,
>>  {
>>  	struct drm_i915_gem_object *obj = dma_buf_to_obj(attach-
>>dmabuf);
>>
>> -	dma_unmap_sg_attrs(attach->dev,
>> -			   sgt->sgl, sgt->nents, dir,
>> -			   DMA_ATTR_SKIP_CPU_SYNC);
>> +	if (i915_gem_object_has_struct_page(obj))
>> +		dma_unmap_sg_attrs(attach->dev, sgt->sgl, sgt->nents, dir,
>> +				   DMA_ATTR_SKIP_CPU_SYNC);
>> +	else
>> +		dmabuf_unmap_addr(attach->dev, sgt->sgl, sgt->nents, dir);
>> +
>>  	sg_free_table(sgt);
>>  	kfree(sgt);
>>
>> --
>> 2.21.0
>>
>
>--
>Daniel Vetter
>Software Engineer, Intel Corporation
>http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
