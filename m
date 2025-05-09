Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB879AB0D18
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 10:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3490810E2F8;
	Fri,  9 May 2025 08:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="CTv0R0w/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2FC8A10E2F8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
 Content-Type; bh=95oPAvsF1SHOoi8nOjSdd03uFl0CYQiedpsySV6V8L4=;
 b=CTv0R0w/i1jcXgnxkuysW0wE3EQRYomtOQzMf6zzS5vkdiZoP9evx94pmpWdWe
 6F3FXtlYR9gIST3z6azM3uh/PxRftVvIb2ajrua9gjAye5rxM3LVUg1NoiA70Rbd
 nKfFamWMBh6ohq8Axht3xobb00WVYr7g8f+aDXlUKVU0Y=
Received: from [10.42.20.80] (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wDnzVKjux1oT0quAA--.8322S2; 
 Fri, 09 May 2025 16:24:05 +0800 (CST)
Message-ID: <c72cb0fc-867d-4c10-8af1-19a93c396f1d@163.com>
Date: Fri, 9 May 2025 16:24:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/shmem-helper: Import dmabuf without mapping
 its sg_table
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250509032040.185730-1-oushixiong1025@163.com>
 <301f1962-88a5-4ea1-bfc1-826426d01ab5@amd.com>
 <a93a62b0-3252-4fed-b634-18a2e097ab7d@suse.de>
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <a93a62b0-3252-4fed-b634-18a2e097ab7d@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnzVKjux1oT0quAA--.8322S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF4rCr4fKw43ZF43Jr1UJrb_yoWfZFy3pF
 WYyFyUKrWjqrWqg3s2vwnFva4Y93y8KF1xWrW3Jw4Y93ZYyFnFkF15Cr98uryUAryUGF1F
 vrWUCFWfZryYkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U5sqAUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRpID2gduaMwggAAsd
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


在 2025/5/9 14:51, Thomas Zimmermann 写道:
> Hi
>
> Am 09.05.25 um 08:22 schrieb Christian König:
>> On 5/9/25 05:20, oushixiong1025@163.com wrote:
>>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>>
>>> [WHY]
>>> 1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
>>>     DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
>>>     sg_table import.
>>>     They only need dma_buf_vmap() to access the shared buffer's
>>>     kernel virtual address.
>>>
>>> 2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
>>>     trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
>>>     restricts the maximum DMA streaming mapping memory, resulting in
>>>     errors like:
>>>
>>>     ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), 
>>> total 32768 (slots), used 0 (slots)
>>>
>>> [HOW]
>>> Provide a gem_prime_import implementation without sg_table mapping
>>> to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
>>> require sg_table can adopt this.
>>>
>>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>>> ---
>>> v1->v2:
>>>     Patch rebase.
>>> v2->v3:
>>>     Rename the import callback function.
>>>     Remove drm_gem_shmem_prime_export() and separate some codes
>>>     to drm_gem_prime_import_self().
>>> v3->v4:
>>>     Separate the test from the policy.
>>>     Rename the macro.
>>>
>>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 57 
>>> ++++++++++++++++++++++++++
>>>   drivers/gpu/drm/drm_prime.c            | 36 ++++++++++++----
>>>   include/drm/drm_gem_shmem_helper.h     | 15 +++++++
>>>   include/drm/drm_prime.h                |  3 ++
>>>   4 files changed, 102 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c 
>>> b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> index aa43265f4f4f..8fa160c3635e 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -800,6 +800,63 @@ drm_gem_shmem_prime_import_sg_table(struct 
>>> drm_device *dev,
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>>>   +/**
>>> + * drm_gem_shmem_prime_import_no_sgt - Import dmabuf without 
>>> mapping its sg_table
>>> + * @dev: Device to import into
>>> + * @dma_buf: dma-buf object to import
>>> + *
>>> + * Drivers that use the shmem helpers but also wants to import 
>>> dmabuf without
>>> + * mapping its sg_table can use this as their 
>>> &drm_driver.gem_prime_import
>>> + * implementation.
>>> + */
>>> +struct drm_gem_object *drm_gem_shmem_prime_import_no_sgt(struct 
>>> drm_device *dev,
>>> +                             struct dma_buf *dma_buf)
>>
>> Please don't mention "no sgt" in the name, that we use sgtable is an 
>> implementation detail.
>>
>> Maybe use something like "no map" or similar.
>
> To be fair, I asked to not named it something like _vmap(), but rather 
> _no_sgt().  These vmap-only names purely describe a use case. I'd be 
> OK with any name that refers to the difference between the various 
> functions; not just their effect.
>
>>
>>
>>> +{
>>> +    struct dma_buf_attachment *attach;
>>> +    struct drm_gem_shmem_object *shmem;
>>> +    struct drm_gem_object *obj;
>>> +    size_t size;
>>> +    int ret;
>>> +
>>> +    if (drm_gem_prime_exported_dma_buf(dev, dma_buf)) {
>>> +        /*
>>> +         * Importing dmabuf exported from our own gem increases
>>> +         * refcount on gem itself instead of f_count of dmabuf.
>>> +         */
>>> +        obj = dma_buf->priv;
>>> +        drm_gem_object_get(obj);
>>> +        return obj;
>>> +    }
>>> +
>>> +    attach = dma_buf_attach(dma_buf, dev->dev);
>>> +    if (IS_ERR(attach))
>>> +        return ERR_CAST(attach);
>>> +
>>> +    get_dma_buf(dma_buf);
>
>
>>> +
>>> +    size = PAGE_ALIGN(attach->dmabuf->size);
>>> +
>>> +    shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>>> +    if (IS_ERR(shmem)) {
>>> +        ret = PTR_ERR(shmem);
>>> +        goto fail_detach;
>>> +    }
>
> Unrelated to this series, we might reconsider 
> drm_driver.gem_prime_import_sg_table. If we move the call to 
> dma_buf_map_attachment_unlocked() into the callback and rename it to 
> gem_prime_import_attachment, using sg tables would become optional for 
> all drivers. SHMEM would be able to create the object without SG table 
> without having to reimplement the prime boiler-plate code. Thoughts?
>
>
>>> +
>>> +    drm_dbg_prime(dev, "size = %zu\n", size);
>>> +
>>> +    shmem->base.import_attach = attach;
>>> +    shmem->base.resv = dma_buf->resv;
>>> +
>>> +    return &shmem->base;
>>> +
>>> +fail_detach:
>>> +    dma_buf_detach(dma_buf, attach);
>>> +    dma_buf_put(dma_buf);
>>> +
>>> +    return ERR_PTR(ret);
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_sgt);
>>> +
>>>   MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>>>   MODULE_IMPORT_NS("DMA_BUF");
>>>   MODULE_LICENSE("GPL v2");
>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>> index d828502268b8..5bcf483520b8 100644
>>> --- a/drivers/gpu/drm/drm_prime.c
>>> +++ b/drivers/gpu/drm/drm_prime.c
>>> @@ -910,6 +910,26 @@ struct dma_buf *drm_gem_prime_export(struct 
>>> drm_gem_object *obj,
>>>   }
>>>   EXPORT_SYMBOL(drm_gem_prime_export);
>>>   +
>>> +/**
>>> + * drm_gem_prime_exported_dma_buf -
>>> + * checks if the DMA-BUF was exported from a GEM object belonging 
>>> to @dev.
>>> + * @dev: drm_device to check against
>>> + * @dma_buf: dma-buf object to import
>>> + *
>>> + * Return: true if the DMA-BUF was exported from a GEM object 
>>> belonging
>>> + * to @dev, false otherwise.
>>> + */
>>> +
>>> +bool drm_gem_prime_exported_dma_buf(struct drm_device *dev,
>>> +                    struct dma_buf *dma_buf)
>> If I remember the naming conventions correctly this should be 
>> something like drm_gem_is_prime_exported_dma_buf().
>
> Again my fault. But the name you suggested sounds correct.
>
> Best regards
> Thomas
>
>>
>> Regards,
>> Christian.
>>
>>> +{
>>> +    struct drm_gem_object *obj = dma_buf->priv;
>>> +
>>> +    return (dma_buf->ops == &drm_gem_prime_dmabuf_ops) && (obj->dev 
>>> == dev);
>>> +}
>>> +EXPORT_SYMBOL(drm_gem_prime_exported_dma_buf);
>>> +
>>>   /**
>>>    * drm_gem_prime_import_dev - core implementation of the import 
>>> callback
>>>    * @dev: drm_device to import into
>>> @@ -933,16 +953,14 @@ struct drm_gem_object 
>>> *drm_gem_prime_import_dev(struct drm_device *dev,
>>>       struct drm_gem_object *obj;
>>>       int ret;
>>>   -    if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
>>> +    if (drm_gem_prime_exported_dma_buf(dev, dma_buf)) {
>>> +        /*
>>> +         * Importing dmabuf exported from our own gem increases
>>> +         * refcount on gem itself instead of f_count of dmabuf.
>>> +         */
>>>           obj = dma_buf->priv;
>>> -        if (obj->dev == dev) {
>>> -            /*
>>> -             * Importing dmabuf exported from our own gem increases
>>> -             * refcount on gem itself instead of f_count of dmabuf.
>>> -             */
>>> -            drm_gem_object_get(obj);
>>> -            return obj;
>>> -        }
>>> +        drm_gem_object_get(obj);
>>> +        return obj;
>>>       }
>>>         if (!dev->driver->gem_prime_import_sg_table)
>>> diff --git a/include/drm/drm_gem_shmem_helper.h 
>>> b/include/drm/drm_gem_shmem_helper.h
>>> index b4f993da3cae..9ee697ff52ea 100644
>>> --- a/include/drm/drm_gem_shmem_helper.h
>>> +++ b/include/drm/drm_gem_shmem_helper.h
>>> @@ -287,6 +287,8 @@ drm_gem_shmem_prime_import_sg_table(struct 
>>> drm_device *dev,
>>>                       struct sg_table *sgt);
>>>   int drm_gem_shmem_dumb_create(struct drm_file *file, struct 
>>> drm_device *dev,
>>>                     struct drm_mode_create_dumb *args);
>>> +struct drm_gem_object *drm_gem_shmem_prime_import_no_sgt(struct 
>>> drm_device *dev,
>>> +                             struct dma_buf *buf);
>>>     /**
>>>    * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
>>> @@ -298,4 +300,17 @@ int drm_gem_shmem_dumb_create(struct drm_file 
>>> *file, struct drm_device *dev,
>>>       .gem_prime_import_sg_table = 
>>> drm_gem_shmem_prime_import_sg_table, \
>>>       .dumb_create           = drm_gem_shmem_dumb_create
>>>   +/**
>>> + * DRM_GEM_SHMEM_DRIVER_OPS_NO_SGT - shmem GEM operations
>>> + *                                   without mapping sg_table on
>>> + *                                   imported buffer.
>>> + *
>>> + * This macro provides a shortcut for setting the shmem GEM 
>>> operations in
>>> + * the &drm_driver structure for drivers that do not require a 
>>> sg_table on
>>> + * imported buffers.
>>> + */
>>> +#define DRM_GEM_SHMEM_DRIVER_OPS_NO_SGT \
>>> +    .gem_prime_import       = drm_gem_shmem_prime_import_no_sgt, \
>>> +    .dumb_create            = drm_gem_shmem_dumb_create
>>> +

Name DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP or 
DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT ?

Best regards
Shixiong Ou.

>>>   #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
>>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>>> index fa085c44d4ca..ec83f1c077a4 100644
>>> --- a/include/drm/drm_prime.h
>>> +++ b/include/drm/drm_prime.h
>>> @@ -100,6 +100,9 @@ struct dma_buf *drm_gem_prime_export(struct 
>>> drm_gem_object *obj,
>>>   unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt);
>>>     /* helper functions for importing */
>>> +bool drm_gem_prime_exported_dma_buf(struct drm_device *dev,
>>> +                    struct dma_buf *dma_buf);
>>> +
>>>   struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device 
>>> *dev,
>>>                           struct dma_buf *dma_buf,
>>>                           struct device *attach_dev);
>

