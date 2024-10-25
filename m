Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA0B9B0B06
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5145E10EB4F;
	Fri, 25 Oct 2024 17:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="c9GGxZXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782F210EB4F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:19:52 +0000 (UTC)
Message-ID: <c451e343-4014-4de5-87b8-50429399adaa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729876790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zT8cxh9uxcPpAXeRpOz4K99RVMk98+LQB2m+38sDL18=;
 b=c9GGxZXTqKq/17PPlPsVMWRapDMJVqwydDYWu2ns/FLqowPdC7ORXzFoI+zJd7C8TDSLir
 Lj4PH0liZOkEAFW/6AzRORJmkXklKHv2BOBZ7KmK3KPsj+xiO8Akx1wdYUIvqi5/D+MoyA
 PtGgM1V404IJCS5GcRToxe82udFBhOc=
Date: Sat, 26 Oct 2024 01:19:42 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] drm/etnaviv: Map and unmap the GPU VA range with
 respect to its user size
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
 <20241004194207.1013744-3-sui.jingfeng@linux.dev>
 <13b9c1bde7f0534f7f3c576126def206bdafd60c.camel@pengutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <13b9c1bde7f0534f7f3c576126def206bdafd60c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/10/7 18:17, Lucas Stach wrote:
> Am Samstag, dem 05.10.2024 um 03:42 +0800 schrieb Sui Jingfeng:
>> Since the GPU VA space is compact in terms of 4KiB unit, map and/or unmap
>> the area that doesn't belong to a context breaks the philosophy of PPAS.
>> That results in severe errors: GPU hang and MMU fault (page not present)
>> and such.
>>
>> Shrink the usuable size of etnaviv GEM buffer object to its user size,
>> instead of the original physical size of its backing memory.
>>
>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 28 +++++++++------------------
>>   1 file changed, 9 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
>> index 6fbc62772d85..a52ec5eb0e3d 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
>> @@ -70,8 +70,10 @@ static int etnaviv_context_map(struct etnaviv_iommu_context *context,
>>   }
>>   
>>   static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
>> +			     unsigned int user_len,
>>   			     struct sg_table *sgt, int prot)
>> -{	struct scatterlist *sg;
>> +{
>> +	struct scatterlist *sg;
>>   	unsigned int da = iova;
>>   	unsigned int i;
>>   	int ret;
>> @@ -81,7 +83,8 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
>>   
>>   	for_each_sgtable_dma_sg(sgt, sg, i) {
>>   		phys_addr_t pa = sg_dma_address(sg) - sg->offset;
>> -		size_t bytes = sg_dma_len(sg) + sg->offset;
>> +		unsigned int phys_len = sg_dma_len(sg) + sg->offset;
>> +		size_t bytes = MIN(phys_len, user_len);
>>   
>>   		VERB("map[%d]: %08x %pap(%zx)", i, iova, &pa, bytes);
>>   
>> @@ -89,6 +92,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
>>   		if (ret)
>>   			goto fail;
>>   
>> +		user_len -= bytes;
>>   		da += bytes;
>>   	}
> Since the MIN(phys_len, user_len) may limit the mapped amount in the
> wrong direction,

I was thinking that if this will could really happen.

'if (phys_len <= user_len)' is true, the 'bytes' is a number of multiple
of PAGE_SIZE. Since our sg table is created by drm_prime_pages_to_sg(),
so the program still works exactly some as before.

It only differs from previous when 'if (phys_len > user_len)' is true,
but then, it is the tail SG entry that the size of it is not a multiple
of PAGE_SIZE. The 'bytes' will be *exactly* the size of remain GPUVA
range we should map.

> I would think it would be good to add a
> WARN_ON(user_len != 0) after the dma SG iteration.

So the program here seems nearly always correct, no?

Or are you means that when the CPU PAGE size < 4KiB cases ?

I never ever have a CPU has < 4 KiB page configuration.

Regards,
Sui


>>   
>> @@ -104,21 +108,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
>>   static void etnaviv_iommu_unmap(struct etnaviv_iommu_context *context, u32 iova,
>>   				struct sg_table *sgt, unsigned len)
>>   {
>> -	struct scatterlist *sg;
>> -	unsigned int da = iova;
>> -	int i;
>> -
>> -	for_each_sgtable_dma_sg(sgt, sg, i) {
>> -		size_t bytes = sg_dma_len(sg) + sg->offset;
>> -
>> -		etnaviv_context_unmap(context, da, bytes);
>> -
>> -		VERB("unmap[%d]: %08x(%zx)", i, iova, bytes);
>> -
>> -		BUG_ON(!PAGE_ALIGNED(bytes));
>> -
>> -		da += bytes;
>> -	}
>> +	etnaviv_context_unmap(context, iova, len);
> This drops some sanity checks, but I have only ever seen them fire when
> we had other kernel memory corruption issues, so I'm fine with the
> simplification you did here.
>
> Regards,
> Lucas
>
>>   
>>   	context->flush_seq++;
>>   }
>> @@ -131,7 +121,7 @@ static void etnaviv_iommu_remove_mapping(struct etnaviv_iommu_context *context,
>>   	lockdep_assert_held(&context->lock);
>>   
>>   	etnaviv_iommu_unmap(context, mapping->vram_node.start,
>> -			    etnaviv_obj->sgt, etnaviv_obj->base.size);
>> +			    etnaviv_obj->sgt, etnaviv_obj->user_size);
>>   	drm_mm_remove_node(&mapping->vram_node);
>>   }
>>   
>> @@ -314,7 +304,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
>>   		goto unlock;
>>   
>>   	mapping->iova = node->start;
>> -	ret = etnaviv_iommu_map(context, node->start, sgt,
>> +	ret = etnaviv_iommu_map(context, node->start, user_size, sgt,
>>   				ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE);
>>   
>>   	if (ret < 0) {

-- 
Best regards,
Sui

