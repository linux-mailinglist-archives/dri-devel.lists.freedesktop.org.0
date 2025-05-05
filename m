Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA2AA959E
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 16:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DF510E32C;
	Mon,  5 May 2025 14:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="OmFc+L4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (unknown [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id EA27210E2FE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
 Content-Type; bh=3y/rMwTX7/q52MQT8W3rwgpcVh3Foflvbog5MQz9n0g=;
 b=OmFc+L4HoEYxoBsF6wnygtoYUbwLHIeKHfkYNv4jtJ0nlrCx6eZTJAbTC/u02f
 zKjD67G+EoazxT6TvxPwv7Pp4+BqUET7olojlO8aGm3BRZzvXumLTqjqshCw+7EJ
 uchm2e2qeQzNbQYNvlRzlqhvASGSYkeDYV2NuiQCU8Fjw=
Received: from [192.168.124.17] (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wA3kieyyRhoQoOrEg--.36304S2; 
 Mon, 05 May 2025 22:22:43 +0800 (CST)
Message-ID: <a681cfd8-0c8c-4ffe-9f42-f0e54ee2539d@163.com>
Date: Mon, 5 May 2025 22:22:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/shmem-helper: Import dmabuf without mapping its
 sg_table
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250501064324.398650-1-oushixiong1025@163.com>
 <71ec7bd1-be90-462e-8a07-e56fccae4096@suse.de>
 <8e4f60ec-caa8-431a-88f8-aee8183d96e5@amd.com>
From: oushixiong <oushixiong1025@163.com>
In-Reply-To: <8e4f60ec-caa8-431a-88f8-aee8183d96e5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3kieyyRhoQoOrEg--.36304S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gw1ftrWxZF43AF4xWr1Dtrb_yoW3Kw1rpF
 s8AFWUKrW5tryqgrZ7ZF1vva4Ygw48Kr1Iqry3J3yY9F1ktFnFyF1Fkr98uFW7AryUGr1F
 qr1UCFWfGryYyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UOa9-UUUUU=
X-Originating-IP: [113.246.126.51]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbBYxBED2gYnjclMAABs1
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

Hi Christian,

My patch is based on linux-next, so this patch is not based on the 
latest code. Then, I'd like to ask which patch resolved the issue with 
sg-tables?


Thanks and Regards,

Shixiong.


在 2025/5/5 19:25, Christian König 写道:
> Hi Thomas & Shixiong,
>
> first of all the patch is still based on outdated code. For example the cache_sgt_mapping member is already removed in drm-misc-next.
>
> So if I'm not completely mistaken the issue is already resolved upstream.
>
> Regards,
> Christian.
>
> On 5/5/25 13:12, Thomas Zimmermann wrote:
>> (cc'ing Christian)
>>
>> Hi,
>>
>> I don't feel qualified to fully review this patch.
>>
>> It would be good to have the issue with sg-tables solved, but I dislike the dedicated initializer macros. So my question is if this has any drawbacks. Or could we make this available and the default for all shmem-based drivers?
>>
>> Best regards
>> Thomas
>>
>> Am 01.05.25 um 08:43 schrieb oushixiong1025@163.com:
>>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>>
>>> [WHY]
>>> 1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
>>>      DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
>>>      sg_table import.
>>>      They only need dma_buf_vmap() to access the shared buffer's
>>>      kernel virtual address.
>>>
>>> 2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
>>>      trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
>>>      restricts the maximum DMA streaming mapping memory, resulting in
>>>      errors like:
>>>
>>>      ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
>>>
>>> [HOW]
>>> Provide a gem_prime_import implementation without sg_table mapping
>>> to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
>>> require sg_table can adopt this.
>>>
>>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>>> ---
>>>    drivers/gpu/drm/drm_gem_shmem_helper.c | 95 ++++++++++++++++++++++++++
>>>    include/drm/drm_gem_shmem_helper.h     | 24 +++++++
>>>    2 files changed, 119 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> index d99dee67353a..9e41e350ff6f 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -39,6 +39,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>>>    static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
>>>        .free = drm_gem_shmem_object_free,
>>>        .print_info = drm_gem_shmem_object_print_info,
>>> +    .export = drm_gem_shmem_object_prime_export,
>>>        .pin = drm_gem_shmem_object_pin,
>>>        .unpin = drm_gem_shmem_object_unpin,
>>>        .get_sg_table = drm_gem_shmem_object_get_sg_table,
>>> @@ -799,6 +800,100 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>>    }
>>>    EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>>>    +const struct dma_buf_ops drm_gem_shmem_prime_dmabuf_ops =  {
>>> +    .cache_sgt_mapping = true,
>>> +    .attach = drm_gem_map_attach,
>>> +    .detach = drm_gem_map_detach,
>>> +    .map_dma_buf = drm_gem_map_dma_buf,
>>> +    .unmap_dma_buf = drm_gem_unmap_dma_buf,
>>> +    .release = drm_gem_dmabuf_release,
>>> +    .mmap = drm_gem_dmabuf_mmap,
>>> +    .vmap = drm_gem_dmabuf_vmap,
>>> +    .vunmap = drm_gem_dmabuf_vunmap,
>>> +};
>>> +
>>> +/**
>>> + * drm_gem_shmem_prime_export - implementation of the export callback
>>> + * @shmem: shmem GEM object
>>> + */
>>> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
>>> +                       int flags)
>>> +{
>>> +    struct drm_gem_object *obj = &shmem->base;
>>> +    struct drm_device *dev = obj->dev;
>>> +    struct dma_buf_export_info exp_info = {
>>> +        .exp_name = KBUILD_MODNAME, /* white lie for debug */
>>> +        .owner = dev->driver->fops->owner,
>>> +        .ops = &drm_gem_shmem_prime_dmabuf_ops,
>>> +        .size = obj->size,
>>> +        .flags = flags,
>>> +        .priv = obj,
>>> +        .resv = obj->resv,
>>> +    };
>>> +
>>> +    return drm_gem_dmabuf_export(dev, &exp_info);
>>> +}
>>> +
>>> +/**
>>> + * drm_gem_shmem_prime_import - Import dmabuf without mapping its sg_table
>>> + * @dev: Device to import into
>>> + * @dma_buf: dma-buf object to import
>>> + *
>>> + * Drivers that use the shmem helpers but also wants to import dmabuf without
>>> + * mapping its sg_table can use this as their &drm_driver.gem_prime_import
>>> + * implementation.
>>> + */
>>> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
>>> +                          struct dma_buf *dma_buf)
>>> +{
>>> +    struct dma_buf_attachment *attach;
>>> +    struct drm_gem_shmem_object *shmem;
>>> +    size_t size;
>>> +    int ret;
>>> +
>>> +    if (dma_buf->ops == &drm_gem_shmem_prime_dmabuf_ops) {
>>> +        struct drm_gem_object *obj;
>>> +
>>> +        obj = dma_buf->priv;
>>> +        if (obj->dev == dev) {
>>> +            /*
>>> +             * Importing dmabuf exported from our own gem increases
>>> +             * refcount on gem itself instead of f_count of dmabuf.
>>> +             */
>>> +            drm_gem_object_get(obj);
>>> +            return obj;
>>> +        }
>>> +    }
>>> +
>>> +    attach = dma_buf_attach(dma_buf, dev->dev);
>>> +    if (IS_ERR(attach))
>>> +        return ERR_CAST(attach);
>>> +
>>> +    get_dma_buf(dma_buf);
>>> +
>>> +    size = PAGE_ALIGN(attach->dmabuf->size);
>>> +
>>> +    shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>>> +    if (IS_ERR(shmem)) {
>>> +        ret = PTR_ERR(shmem);
>>> +        goto fail_detach;
>>> +    }
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
>>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import);
>>> +
>>>    MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>>>    MODULE_IMPORT_NS("DMA_BUF");
>>>    MODULE_LICENSE("GPL v2");
>>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
>>> index cef5a6b5a4d6..78ef91593a8e 100644
>>> --- a/include/drm/drm_gem_shmem_helper.h
>>> +++ b/include/drm/drm_gem_shmem_helper.h
>>> @@ -110,6 +110,8 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>>>    void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>>>                  struct iosys_map *map);
>>>    int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
>>> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
>>> +                          int flags);
>>>      int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
>>>    void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
>>> @@ -168,6 +170,18 @@ static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsign
>>>        drm_gem_shmem_print_info(shmem, p, indent);
>>>    }
>>>    +/**
>>> + * drm_gem_shmem_object_prime_export - GEM object function for export()
>>> + * @obj: GEM object
>>> + *
>>> + */
>>> +static inline struct dma_buf *drm_gem_shmem_object_prime_export(struct drm_gem_object *obj,
>>> +                                int flags)
>>> +{
>>> +    struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>>> +
>>> +    return drm_gem_shmem_prime_export(shmem, flags);
>>> +}
>>>    /**
>>>     * drm_gem_shmem_object_pin - GEM object function for drm_gem_shmem_pin()
>>>     * @obj: GEM object
>>> @@ -276,6 +290,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>>                        struct sg_table *sgt);
>>>    int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>>                      struct drm_mode_create_dumb *args);
>>> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
>>> +                          struct dma_buf *buf);
>>>      /**
>>>     * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
>>> @@ -287,4 +303,12 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>>        .gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>>>        .dumb_create           = drm_gem_shmem_dumb_create
>>>    +/**
>>> + * This macro provides a shmem GEM operations that implementate a simple
>>> + * gem_prime_import.
>>> + */
>>> +#define DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS \
>>> +    .gem_prime_import    = drm_gem_shmem_prime_import, \
>>> +    .dumb_create        = drm_gem_shmem_dumb_create
>>> +
>>>    #endif /* __DRM_GEM_SHMEM_HELPER_H__ */

