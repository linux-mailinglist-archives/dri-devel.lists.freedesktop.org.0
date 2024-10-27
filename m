Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3580D9B1C2F
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 05:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D0F10E1A2;
	Sun, 27 Oct 2024 04:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="SJssK9NX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [91.218.175.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8513E10E041;
 Sun, 27 Oct 2024 04:48:41 +0000 (UTC)
Message-ID: <c86f224d-fdd3-4b91-a0d1-0a34e38236f0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730004519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LSorqQbck8YB4T0NmsqrtoTk57hv8mFuEl/XEJMvTs=;
 b=SJssK9NXel3SGm4jK3DxYAZvL9fP6n6z7iZY+8ah2HX8aDgsP/XlVPECPFMGeqsiiJ1R1x
 sc7Tz1xQGhfdSoG84+NYX4HPSWEi67IBuNinN0yrSyfn4qxcQwB+c/i9xwxaMTTv+KhjYY
 NcULPT/HRZXfAHQIhkIFlj/Pk7GXtos=
Date: Sun, 27 Oct 2024 12:48:29 +0800
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
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <b93c08b0bab16c86190ca186f20d2cb036a4b8d0.camel@pengutronix.de>
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

On 10/7/24 18:12, Lucas Stach wrote:
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
> 
> This still needs to be be aligned to 4K. 

Yes, extremely correct here, for the perspective of concept.

Have to be GPU page size aligned, because the GPU map 4KiB once a time.
GPU will access full range of a 4KiB page, and this is out of CPU's
control.

> Userspace may request unaligned buffer sizes 

User-space shall *NOT* request unaligned buffer, since user-space
*already* made the assumption GPU page is 4KiB. Then it's the user
space's responsibility that keeping requested buffer aligned.

- The kernel space actually can and *should* return aligned size
   to user-space though.

- Since softpin feature is landed, it becomes evident that kernel
   space need user-space *report* a correct length of GPUVA.

But I'm fine with the kernel pay some extra price for safe reasons.

Best regards,
Sui

> and we don't want to risk any confusion about
> which part is visible to the GPU, so better make sure this size is
> aligned to the GPU page size.
> Also, that more personal preference, but I would call this gpu_size or
> something like that, to avoid any confusion with the user_size in> etnaviv_cmdbuf, where user_size doesn't denote the GPU visible size.
>
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
> 

-- 
Best regards
Sui

