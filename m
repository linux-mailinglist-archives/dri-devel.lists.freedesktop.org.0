Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F049B0BF7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270D210EB62;
	Fri, 25 Oct 2024 17:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="S8Q80AED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6469210EB63
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:42:15 +0000 (UTC)
Message-ID: <712eea49-37f3-4d15-9e04-676937766b65@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729878133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+Jj2781dcd+BwBoELpxEdGuTpRCIY6QYhPS0y3qUZo=;
 b=S8Q80AEDkavT2o7WucvJJPPV26dWwEjL+JWM+QC4JNItX3+we6/04KXTE97tPiGjRuzxV5
 nJGkZ3vZ6bpgpDPWjLcNnzwUNbvNhhXvzZGKvC5YKlAQFsk4NVpJWjA7H6SqmGhrYL9RE8
 C9hxNCVjhQLiB+4FBDRW+UbAtJYE9go=
Date: Sat, 26 Oct 2024 01:42:06 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm/etnaviv: Track GPU VA size separately
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
 <20241004194207.1013744-2-sui.jingfeng@linux.dev>
 <b93c08b0bab16c86190ca186f20d2cb036a4b8d0.camel@pengutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <b93c08b0bab16c86190ca186f20d2cb036a4b8d0.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 2024/10/7 18:12, Lucas Stach wrote:
> Am Samstag, dem 05.10.2024 um 03:42 +0800 schrieb Sui Jingfeng:
>> Etnaviv assumes that GPU page size is 4KiB, yet on some systems, the CPU
>> page size is 16KiB. The size of etnaviv buffer objects will be aligned
>> to CPU page size on kernel side, however, userspace still assumes the
>> page size is 4KiB and doing allocation with 4KiB page as unit. This
>> results in userspace allocated GPU virtual address range collision and
>> therefore unable to be inserted to the specified hole exactly.
>>
>> The root cause is that kernel side BO takes up bigger address space than
>> userspace assumes when the size of it is not CPU page size aligned. To
>> Preserve GPU VA continuous as much as possible, track the size that
>> userspace/GPU think of it is.
>>
>> Yes, we still need to overallocate to suit the CPU, but there is no need
>> to waste GPU VA space anymore.
>>
>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 8 +++++---
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.h | 1 +
>>   drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 8 ++++----
>>   3 files changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> index 5c0c9d4e3be1..943fc20093e6 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> @@ -543,7 +543,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
>>   	.vm_ops = &vm_ops,
>>   };
>>   
>> -static int etnaviv_gem_new_impl(struct drm_device *dev, u32 flags,
>> +static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
>>   	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
>>   {
>>   	struct etnaviv_gem_object *etnaviv_obj;
>> @@ -570,6 +570,7 @@ static int etnaviv_gem_new_impl(struct drm_device *dev, u32 flags,
>>   	if (!etnaviv_obj)
>>   		return -ENOMEM;
>>   
>> +	etnaviv_obj->user_size = size;
>>   	etnaviv_obj->flags = flags;
>>   	etnaviv_obj->ops = ops;
>>   
>> @@ -588,11 +589,12 @@ int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
>>   {
>>   	struct etnaviv_drm_private *priv = dev->dev_private;
>>   	struct drm_gem_object *obj = NULL;
>> +	unsigned int user_size = size;
> This still needs to be be aligned to 4K. Userspace may request
> unaligned buffer sizes and we don't want to risk any confusion about
> which part is visible to the GPU, so better make sure this size is
> aligned to the GPU page size.


OK,aligned to the GPU page size is reasonable. Since the buffer is very high likely be used by GPU.


> Also, that more personal preference, but I would call this gpu_size or
> something like that, to avoid any confusion with the user_size in
> etnaviv_cmdbuf, where user_size doesn't denote the GPU visible size.

Yeah, theuser_size denote the length of command buffer, it's usually just need to 
aligned to 8 bytes. And generally, the size command buffer won't larger 
than 4KiB (a GPU PAGE).

I'm imagine that just 'size' with some extra comment, as it's possible
that a buffer is only get used by CPU for specific purpose.

Best Regards,
Sui

> Regards,
> Lucas
>
>>   	int ret;
>>   
>>   	size = PAGE_ALIGN(size);
>>   
>> -	ret = etnaviv_gem_new_impl(dev, flags, &etnaviv_gem_shmem_ops, &obj);
>> +	ret = etnaviv_gem_new_impl(dev, user_size, flags, &etnaviv_gem_shmem_ops, &obj);
>>   	if (ret)
>>   		goto fail;
>>   
>> @@ -627,7 +629,7 @@ int etnaviv_gem_new_private(struct drm_device *dev, size_t size, u32 flags,
>>   	struct drm_gem_object *obj;
>>   	int ret;
>>   
>> -	ret = etnaviv_gem_new_impl(dev, flags, ops, &obj);
>> +	ret = etnaviv_gem_new_impl(dev, size, flags, ops, &obj);
>>   	if (ret)
>>   		return ret;
>>   
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
>> index a42d260cac2c..c6e27b9abb0c 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
>> @@ -36,6 +36,7 @@ struct etnaviv_gem_object {
>>   	const struct etnaviv_gem_ops *ops;
>>   	struct mutex lock;
>>   
>> +	u32 user_size;
>>   	u32 flags;
>>   
>>   	struct list_head gem_node;
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
>> index 1661d589bf3e..6fbc62772d85 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
>> @@ -281,6 +281,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
>>   {
>>   	struct sg_table *sgt = etnaviv_obj->sgt;
>>   	struct drm_mm_node *node;
>> +	unsigned int user_size;
>>   	int ret;
>>   
>>   	lockdep_assert_held(&etnaviv_obj->lock);
>> @@ -303,13 +304,12 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
>>   	}
>>   
>>   	node = &mapping->vram_node;
>> +	user_size = etnaviv_obj->user_size;
>>   
>>   	if (va)
>> -		ret = etnaviv_iommu_insert_exact(context, node,
>> -						 etnaviv_obj->base.size, va);
>> +		ret = etnaviv_iommu_insert_exact(context, node, user_size, va);
>>   	else
>> -		ret = etnaviv_iommu_find_iova(context, node,
>> -					      etnaviv_obj->base.size);
>> +		ret = etnaviv_iommu_find_iova(context, node, user_size);
>>   	if (ret < 0)
>>   		goto unlock;
>>   

-- 
Best regards,
Sui

