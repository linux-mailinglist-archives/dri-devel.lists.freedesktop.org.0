Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F3EBCDCF8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 17:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8431010EB6F;
	Fri, 10 Oct 2025 15:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E2FB10EB6F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 15:34:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E2181595;
 Fri, 10 Oct 2025 08:34:10 -0700 (PDT)
Received: from [10.57.35.12] (unknown [10.57.35.12])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B0B73F66E;
 Fri, 10 Oct 2025 08:34:15 -0700 (PDT)
Message-ID: <06087818-e5a9-437d-83c6-337ade252cb6@arm.com>
Date: Fri, 10 Oct 2025 16:34:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] drm/prime: Provide default
 ::{begin,end}_cpu_access() implementations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
 <20251010101147.3290604-3-boris.brezillon@collabora.com>
 <6ed1980c-48f0-41fc-90a6-7f74311cb977@arm.com>
 <20251010170346.38e76026@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251010170346.38e76026@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/10/2025 16:03, Boris Brezillon wrote:
> On Fri, 10 Oct 2025 15:11:54 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 10/10/2025 11:11, Boris Brezillon wrote:
>>> Hook-up drm_gem_dmabuf_{begin,end}_cpu_access() to drm_gem_sync() so
>>> that drivers relying on the default prime_dmabuf_ops can still have
>>> a way to prepare for CPU accesses from outside the UMD.
>>>
>>> v2:
>>> - New commit
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  drivers/gpu/drm/drm_prime.c | 36 ++++++++++++++++++++++++++++++++++++
>>>  include/drm/drm_prime.h     |  5 +++++
>>>  2 files changed, 41 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>> index 43a10b4af43a..03c09f9ab129 100644
>>> --- a/drivers/gpu/drm/drm_prime.c
>>> +++ b/drivers/gpu/drm/drm_prime.c
>>> @@ -823,6 +823,40 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
>>>  }
>>>  EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
>>>  
>>> +int drm_gem_dmabuf_begin_cpu_access(struct dma_buf *dma_buf,
>>> +				    enum dma_data_direction direction)
>>> +{
>>> +	struct drm_gem_object *obj = dma_buf->priv;
>>> +	enum drm_gem_object_access_flags access = DRM_GEM_OBJECT_CPU_ACCESS;
>>> +
>>> +	if (direction == DMA_FROM_DEVICE)
>>> +		access |= DRM_GEM_OBJECT_READ_ACCESS;
>>> +	else if (direction == DMA_BIDIRECTIONAL)
>>> +		access |= DRM_GEM_OBJECT_RW_ACCESS;
>>> +	else
>>> +		return -EINVAL;
>>> +
>>> +	return drm_gem_sync(obj, 0, obj->size, access);
>>> +}
>>> +EXPORT_SYMBOL(drm_gem_dmabuf_begin_cpu_access);
>>> +
>>> +int drm_gem_dmabuf_end_cpu_access(struct dma_buf *dma_buf,
>>> +				  enum dma_data_direction direction)
>>> +{
>>> +	struct drm_gem_object *obj = dma_buf->priv;
>>> +	enum drm_gem_object_access_flags access = DRM_GEM_OBJECT_DEV_ACCESS;
>>> +
>>> +	if (direction == DMA_TO_DEVICE)
>>> +		access |= DRM_GEM_OBJECT_READ_ACCESS;
>>> +	else if (direction == DMA_BIDIRECTIONAL)
>>> +		access |= DRM_GEM_OBJECT_RW_ACCESS;
>>> +	else
>>> +		return -EINVAL;
>>> +
>>> +	return drm_gem_sync(obj, 0, obj->size, access);
>>> +}
>>> +EXPORT_SYMBOL(drm_gem_dmabuf_end_cpu_access);  
>>
>> I feel I must be missing something, but why does
>> drm_gem_dmabuf_begin_cpu_access() reject DMA_TO_DEVICE and
>> drm_gem_dmabuf_end_cpu_access() reject DMA_FROM_DEVICE?
> 
> Not really sure what it means to prepare for dev access and synchronize
> with what the device might have changed in memory. Sounds like device
> -> device synchronization, which is not what this API is for.
> 
> Similarly preparing for CPU access with TO_DEVICE (AKA forcing previous
> CPU changes to be visible to the device) doesn't make sense either.

Well those operations might well be no-ops, but we shouldn't return an
error just because of that.

>>
>> My understanding is that these begin/end calls should be bracketing the
>> operation and the same direction should be specified for each.
> 
> If [1] is correct and the begin/end_cpu_access() is based on the
> dma_sync_ semantics, nope, that's not how it's supposed to work. The
> way I see it, it just expresses the cache operations you want to take
> place around your CPU access.

Well that function completely ignored the direction flag. Looking at a
caller of the APIs it seems very common to bracket the work with the
same direction - admittedly they are all DMA_FROM_DEVICE examples I've
found. E.g. a random FB driver:

https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/solomon/ssd130x.c#L1026

> 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);

I have to admit I don't really know what the point of this is - and the
error return isn't used beyond a drm_err(). But we don't want to spam
the logs with errors!

> If you read data from the CPU, you want dir=FROM_DEVICE in your
> begin_cpu_access(), so that the CPU caches are invalidated. If you
> write from the CPU, you want dir=TO_DEVICE in your end_cpu_access. If
> you know you will be reading again soon, you might want to pass
> dir=BIDIR in your end_cpu_access(), though I'm not too sure what's the
> benefit of that to be honest.
> 
> [1]https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/tegra/gem.c#L684

The documentation[2] states:

>  * - Fallback operations in the kernel, for example when a device is connected
>  *   over USB and the kernel needs to shuffle the data around first before
>  *   sending it away. Cache coherency is handled by bracketing any transactions
>  *   with calls to dma_buf_begin_cpu_access() and dma_buf_end_cpu_access()
>  *   access.

So I guess the purpose is where it's not "cache coherency" as such, but
actually having to shuffle the data between different memories.

Thanks,
Steve

[2]
https://elixir.bootlin.com/linux/v6.17.1/source/drivers/dma-buf/dma-buf.c#L1282

