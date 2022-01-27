Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD88E49DBCC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 08:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D14110E1EB;
	Thu, 27 Jan 2022 07:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8C889E36;
 Thu, 27 Jan 2022 07:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643269345; x=1674805345;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mPi71fris68ShFSFX7NPuifeZxZK9rkUhwdbL0MGzp4=;
 b=ZiW4SR/BN70xXlMiaKanvBXT/F7xaJLtzSJNLzCnHqKG2izcY6lTnmut
 s7F4cqA72Y/vHBaOL2JMjhJgxtr038lVdkJQrKOXK+PCT/QcxHYJz/GFa
 aKl2+Q9XJF8Mcn6ls6eDWy3LoL7zqXySt+OPB9LPsEUXuZQePU9K/hWn7
 nudHRa/qiGEHtkPsw/Kth6rcOEJeuRuuhcSkrdfYWlEtwXFz59NtmUeFP
 eSNfNWUKf05mOBoZbNag+ob99F26cIf56WSQ5cM7olPTjq086D0gD2RAp
 kHKDToSiwCXf/rFVaAENE1zeJX6iSaTU2cL1onNwFaimYrBLjlzfF9j2r w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333131897"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="333131897"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 23:42:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="480191093"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 23:42:19 -0800
Date: Wed, 26 Jan 2022 23:36:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 01/19] dma-buf-map: Add read/write helpers
Message-ID: <20220127073637.GA17282@jons-linux-dev-box>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-2-lucas.demarchi@intel.com>
 <91bfa9d4-99fc-767e-5ba2-a2643cf585f5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91bfa9d4-99fc-767e-5ba2-a2643cf585f5@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 08:24:04AM +0100, Christian König wrote:
> Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
> > In certain situations it's useful to be able to read or write to an
> > offset that is calculated by having the memory layout given by a struct
> > declaration. Usually we are going to read/write a u8, u16, u32 or u64.
> > 
> > Add a pair of macros dma_buf_map_read_field()/dma_buf_map_write_field()
> > to calculate the offset of a struct member and memcpy the data from/to
> > the dma_buf_map. We could use readb, readw, readl, readq and the write*
> > counterparts, however due to alignment issues this may not work on all
> > architectures. If alignment needs to be checked to call the right
> > function, it's not possible to decide at compile-time which function to
> > call: so just leave the decision to the memcpy function that will do
> > exactly that on IO memory or dereference the pointer.
> > 
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >   include/linux/dma-buf-map.h | 81 +++++++++++++++++++++++++++++++++++++
> >   1 file changed, 81 insertions(+)
> > 
> > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> > index 19fa0b5ae5ec..65e927d9ce33 100644
> > --- a/include/linux/dma-buf-map.h
> > +++ b/include/linux/dma-buf-map.h
> > @@ -6,6 +6,7 @@
> >   #ifndef __DMA_BUF_MAP_H__
> >   #define __DMA_BUF_MAP_H__
> > +#include <linux/kernel.h>
> >   #include <linux/io.h>
> >   #include <linux/string.h>
> > @@ -229,6 +230,46 @@ static inline void dma_buf_map_clear(struct dma_buf_map *map)
> >   	}
> >   }
> > +/**
> > + * dma_buf_map_memcpy_to_offset - Memcpy into offset of dma-buf mapping
> > + * @dst:	The dma-buf mapping structure
> > + * @offset:	The offset from which to copy
> > + * @src:	The source buffer
> > + * @len:	The number of byte in src
> > + *
> > + * Copies data into a dma-buf mapping with an offset. The source buffer is in
> > + * system memory. Depending on the buffer's location, the helper picks the
> > + * correct method of accessing the memory.
> > + */
> > +static inline void dma_buf_map_memcpy_to_offset(struct dma_buf_map *dst, size_t offset,
> > +						const void *src, size_t len)
> > +{
> > +	if (dst->is_iomem)
> > +		memcpy_toio(dst->vaddr_iomem + offset, src, len);
> > +	else
> > +		memcpy(dst->vaddr + offset, src, len);
> > +}
> > +
> > +/**
> > + * dma_buf_map_memcpy_from_offset - Memcpy from offset of dma-buf mapping into system memory
> > + * @dst:	Destination in system memory
> > + * @src:	The dma-buf mapping structure
> > + * @src:	The offset from which to copy
> > + * @len:	The number of byte in src
> > + *
> > + * Copies data from a dma-buf mapping with an offset. The dest buffer is in
> > + * system memory. Depending on the mapping location, the helper picks the
> > + * correct method of accessing the memory.
> > + */
> > +static inline void dma_buf_map_memcpy_from_offset(void *dst, const struct dma_buf_map *src,
> > +						  size_t offset, size_t len)
> > +{
> > +	if (src->is_iomem)
> > +		memcpy_fromio(dst, src->vaddr_iomem + offset, len);
> > +	else
> > +		memcpy(dst, src->vaddr + offset, len);
> > +}
> > +
> 
> Well that's certainly a valid use case, but I suggest to change the
> implementation of the existing functions to call the new ones with offset=0.
> 
> This way we only have one implementation.
> 
Trivial - but agree with Christian that is a good cleanup.

> >   /**
> >    * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> >    * @dst:	The dma-buf mapping structure
> > @@ -263,4 +304,44 @@ static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
> >   		map->vaddr += incr;
> >   }
> > +/**
> > + * dma_buf_map_read_field - Read struct member from dma-buf mapping with
> > + * arbitrary size and handling un-aligned accesses
> > + *
> > + * @map__:	The dma-buf mapping structure
> > + * @type__:	The struct to be used containing the field to read
> > + * @field__:	Member from struct we want to read
> > + *
> > + * Read a value from dma-buf mapping calculating the offset and size: this assumes
> > + * the dma-buf mapping is aligned with a a struct type__. A single u8, u16, u32
> > + * or u64 can be read, based on the offset and size of type__.field__.
> > + */
> > +#define dma_buf_map_read_field(map__, type__, field__) ({				\
> > +	type__ *t__;									\
> > +	typeof(t__->field__) val__;							\
> > +	dma_buf_map_memcpy_from_offset(&val__, map__, offsetof(type__, field__),	\
> > +				       sizeof(t__->field__));				\
> > +	val__;										\
> > +})
> > +
> > +/**
> > + * dma_buf_map_write_field - Write struct member to the dma-buf mapping with
> > + * arbitrary size and handling un-aligned accesses
> > + *
> > + * @map__:	The dma-buf mapping structure
> > + * @type__:	The struct to be used containing the field to write
> > + * @field__:	Member from struct we want to write
> > + * @val__:	Value to be written
> > + *
> > + * Write a value to the dma-buf mapping calculating the offset and size.
> > + * A single u8, u16, u32 or u64 can be written based on the offset and size of
> > + * type__.field__.
> > + */
> > +#define dma_buf_map_write_field(map__, type__, field__, val__) ({			\
> > +	type__ *t__;									\
> > +	typeof(t__->field__) val____ = val__;						\
> > +	dma_buf_map_memcpy_to_offset(map__, offsetof(type__, field__),			\
> > +				     &val____, sizeof(t__->field__));			\
> > +})
> > +
> 
> Uff well that absolutely looks like overkill to me.
> 

Hold on...

> That's a rather special use case as far as I can see and I think we should
> only have this in the common framework if more than one driver is using it.
>

I disagree, this is rather elegant.

The i915 can't be the *only* driver that defines a struct which
describes the layout of a dma_buf object.  

IMO this base macro allows *all* other drivers to build on this write
directly to fields in structures those drivers have defined. Patches
later in this series do this for the GuC ads.

Matt
 
> Regards,
> Christian.
> 
> >   #endif /* __DMA_BUF_MAP_H__ */
> 
