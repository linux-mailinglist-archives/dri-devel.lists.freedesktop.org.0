Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3081098BEF0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 16:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4012210E62B;
	Tue,  1 Oct 2024 14:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="O9ydflBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7A010E1DE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 14:05:56 +0000 (UTC)
Message-ID: <17a0ad71-c8ea-4ddd-81d5-b5e5cf7da334@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1727791555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WP8Ea3FTMEaJZz4Aye+QXhBOCFZYoGecK0PTlUFcWU4=;
 b=O9ydflBNHJ0uXii5CmkmjFS80LLkLezOqMPCa9WGbNDGzQSOiKrREmUMMATfjbOuLNNAre
 Dm6i4WFQDpieX41GM3QdxDq9hAyvZMg7KYlTJxgKHHkceV+vv9k3fPWAIEbiXE0oBDTxnS
 m58gQwuoZ1Yx8ctTxaav4FhSU9rK+Ro=
Date: Tue, 1 Oct 2024 22:05:42 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v15 04/19] drm/etnaviv: Make etnaviv_gem_prime_vmap() a
 static function
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
 <20240908094357.291862-5-sui.jingfeng@linux.dev>
 <4a8d06075edb6b5e0d2d71355a55acfd19cd2983.camel@pengutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <4a8d06075edb6b5e0d2d71355a55acfd19cd2983.camel@pengutronix.de>
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

On 2024/10/1 21:40, Lucas Stach wrote:
> Am Sonntag, dem 08.09.2024 um 17:43 +0800 schrieb Sui Jingfeng:
>> The etnaviv_gem_prime_vmap() function has no caller in the
>> etnaviv_gem_prime.c file, move it into etnaviv_gem.c file.
>> While at it, rename it as etnaviv_gem_object_vmap(), since
>> it is a intermidiate layer function, it has no direct relation
>> ship with the PRIME. The etnaviv_gem_prime.c file already has
>> etnaviv_gem_prime_vmap_impl() as the implementation to vmap
>> a imported GEM buffer object.
>>
> I don't agree with the premise with this patch.

I think it is a fact, not a premise.

> This function is
> clearly prime specific,

Because the drm_gem_object_funcs::vmap() will be called by the drm_gem_vmap().
Therefore, all etnaviv GEM buffer object has to response to the invoke of the
drm_gem_object_funcs::vmap() interface.

- Dedicated VRAM buffer object
- SHMEM buffer object
- PRIME buffer object
- userptr (I'm not sure if this one has the need)

> so I don't think it should move.

The name of the etnaviv_gem_prime_vmap() sounds like that
a PRIME buffer object is being vmapped. But dedicated VRAM
backed BO, SHMEM backed BO can also be vmapped as well. So
I think the etnaviv_gem_object_vmap() should be universal.


> Regards,
> Lucas
>
>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  1 -
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 16 +++++++++++++++-
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 12 ------------
>>   3 files changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>> index 2eb2ff13f6e8..c217b54b214c 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
>> @@ -55,7 +55,6 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>>   
>>   int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
>>   struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
>> -int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>>   struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
>>   	struct dma_buf_attachment *attach, struct sg_table *sg);
>>   int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> index fad23494d08e..85d4e7c87a6a 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> @@ -6,6 +6,7 @@
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_prime.h>
>>   #include <linux/dma-mapping.h>
>> +#include <linux/iosys-map.h>
>>   #include <linux/shmem_fs.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/vmalloc.h>
>> @@ -340,6 +341,19 @@ void *etnaviv_gem_vmap(struct drm_gem_object *obj)
>>   	return etnaviv_obj->vaddr;
>>   }
>>   
>> +static int etnaviv_gem_object_vmap(struct drm_gem_object *obj,
>> +				   struct iosys_map *map)
>> +{
>> +	void *vaddr;
>> +
>> +	vaddr = etnaviv_gem_vmap(obj);
>> +	if (!vaddr)
>> +		return -ENOMEM;
>> +	iosys_map_set_vaddr(map, vaddr);
>> +
>> +	return 0;
>> +}
>> +
>>   void etnaviv_gem_vunmap(struct drm_gem_object *obj)
>>   {
>>   	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>> @@ -595,7 +609,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
>>   	.pin = etnaviv_gem_prime_pin,
>>   	.unpin = etnaviv_gem_prime_unpin,
>>   	.get_sg_table = etnaviv_gem_prime_get_sg_table,
>> -	.vmap = etnaviv_gem_prime_vmap,
>> +	.vmap = etnaviv_gem_object_vmap,
>>   	.vunmap = etnaviv_gem_object_vunmap,
>>   	.mmap = etnaviv_gem_mmap,
>>   	.vm_ops = &vm_ops,
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> index bea50d720450..8f523cbee60a 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
>> @@ -25,18 +25,6 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
>>   	return drm_prime_pages_to_sg(obj->dev, etnaviv_obj->pages, npages);
>>   }
>>   
>> -int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>> -{
>> -	void *vaddr;
>> -
>> -	vaddr = etnaviv_gem_vmap(obj);
>> -	if (!vaddr)
>> -		return -ENOMEM;
>> -	iosys_map_set_vaddr(map, vaddr);
>> -
>> -	return 0;
>> -}
>> -
>>   int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
>>   {
>>   	if (!obj->import_attach) {

-- 
Best regards,
Sui

