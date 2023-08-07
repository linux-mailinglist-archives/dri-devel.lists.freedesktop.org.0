Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10C8772E3B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 20:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B1110E37B;
	Mon,  7 Aug 2023 18:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6386810E37B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 18:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691434472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGmK0lr+Ae4kkT+rcZBfWw0gc9neet3R4+rYEQk6ky0=;
 b=BmuM9NqtWipzXsHxz9YV83QG5WWQIjxP/vJPdkFQDwOaZCMLiTii2C7fDQYW96oSWBuajT
 acNIyUSH15jrkW4vNjhM+fGpDfma7SNXoljnlA+IJ4kPApSCtY6AYKR4yBI2NIReoRopvh
 X5pPskVbxMM7cJJFtPeSHDQXR92lGMQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-V_V8-ZYNOH-YmVcyBfPowQ-1; Mon, 07 Aug 2023 14:54:29 -0400
X-MC-Unique: V_V8-ZYNOH-YmVcyBfPowQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94a348facbbso362384366b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 11:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691434468; x=1692039268;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGmK0lr+Ae4kkT+rcZBfWw0gc9neet3R4+rYEQk6ky0=;
 b=FLVzjIKAqH5Q61POMbI0d2byLncAiKU9Jya0G1dr2dZmBj9wLBIHAIp8fCu/TJcWW4
 9ecf8X/rS1WFTgDdr6an0PJbEwaXa64DquG6oDjRRpEHsULiLpaXSOlV51vTgtYTBVQU
 fIA2UpbYvbkZMcyffYLxQLB+Rm0U2+tb0UUEywvELJlHWmY2PMJ0i/+RL4rqdR++40bg
 qPXWYqHVTxdP45W+/F80BIc3YPV5FWxlckJ9O3es35t+yU5DMddJ7u8ZEC9+vYbFCHah
 BFMr8lc8qEhnmdfUJHyCTf+mvE1qfzPtPsTLUMs1S58IOUq3lpVj+xfqXoZMvLl3DJSO
 3Skg==
X-Gm-Message-State: AOJu0Yzych8rg/fJMf6Na/DydQ+IFtbWO1gMnTDC2DpZ0J2oqtXXhttN
 QsD+mlB92zRF8uQSJ6DWPzcKf98Jo9LDQwi7NLXruz0bKwv6F9+Y8t6i96K3cUyx97j/2pwcqdh
 WpAPpI6KCUBEK5y6UtV/40qViSCy/
X-Received: by 2002:a17:906:19b:b0:98d:1f6a:fd47 with SMTP id
 27-20020a170906019b00b0098d1f6afd47mr8934653ejb.76.1691434468151; 
 Mon, 07 Aug 2023 11:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBmf5yeIuKOZKg8cZawt01i8LS3w/uep4tJgbBbGkxhguyGfW95XtaFJPaIXTl4c7T/oQw3w==
X-Received: by 2002:a17:906:19b:b0:98d:1f6a:fd47 with SMTP id
 27-20020a170906019b00b0098d1f6afd47mr8934637ejb.76.1691434467873; 
 Mon, 07 Aug 2023 11:54:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a170906284800b0099bc08862b6sm5635415ejc.171.2023.08.07.11.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 11:54:27 -0700 (PDT)
Message-ID: <619cbc61-d40f-a19f-179d-1ae35a1a17d4@redhat.com>
Date: Mon, 7 Aug 2023 20:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v9 06/11] drm/nouveau: fence: separate fence
 alloc and emit
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, bskeggs@redhat.com, Liam.Howlett@oracle.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net, donald.robson@imgtec.com
References: <20230803165238.8798-1-dakr@redhat.com>
 <20230803165238.8798-7-dakr@redhat.com>
 <91fa63c6-dcce-34b0-938b-2f47362541e0@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <91fa63c6-dcce-34b0-938b-2f47362541e0@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 8/7/23 20:07, Christian König wrote:
> Am 03.08.23 um 18:52 schrieb Danilo Krummrich:
>> The new (VM_BIND) UAPI exports DMA fences through DRM syncobjs. Hence,
>> in order to emit fences within DMA fence signalling critical sections
>> (e.g. as typically done in the DRM GPU schedulers run_job() callback) we
>> need to separate fence allocation and fence emitting.
> 
> At least from the description that sounds like it might be illegal. 
> Daniel can you take a look as well.
> 
> What exactly are you doing here?

I'm basically doing exactly the same as amdgpu_fence_emit() does in 
amdgpu_ib_schedule() called by amdgpu_job_run().

The difference - and this is what this patch is for - is that I separate 
the fence allocation from emitting the fence, such that the fence 
structure is allocated before the job is submitted to the GPU scheduler. 
amdgpu solves this with GFP_ATOMIC within amdgpu_fence_emit() to 
allocate the fence structure in this case.

- Danilo

> 
> Regards,
> Christian.
> 
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/nouveau/dispnv04/crtc.c |  9 ++++-
>>   drivers/gpu/drm/nouveau/nouveau_bo.c    | 52 +++++++++++++++----------
>>   drivers/gpu/drm/nouveau/nouveau_chan.c  |  6 ++-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  9 +++--
>>   drivers/gpu/drm/nouveau/nouveau_fence.c | 16 +++-----
>>   drivers/gpu/drm/nouveau/nouveau_fence.h |  3 +-
>>   drivers/gpu/drm/nouveau/nouveau_gem.c   |  5 ++-
>>   7 files changed, 59 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c 
>> b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
>> index a6f2e681bde9..a34924523133 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
>> @@ -1122,11 +1122,18 @@ nv04_page_flip_emit(struct nouveau_channel *chan,
>>       PUSH_NVSQ(push, NV_SW, NV_SW_PAGE_FLIP, 0x00000000);
>>       PUSH_KICK(push);
>> -    ret = nouveau_fence_new(chan, false, pfence);
>> +    ret = nouveau_fence_new(pfence);
>>       if (ret)
>>           goto fail;
>> +    ret = nouveau_fence_emit(*pfence, chan);
>> +    if (ret)
>> +        goto fail_fence_unref;
>> +
>>       return 0;
>> +
>> +fail_fence_unref:
>> +    nouveau_fence_unref(pfence);
>>   fail:
>>       spin_lock_irqsave(&dev->event_lock, flags);
>>       list_del(&s->head);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c 
>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> index 057bc995f19b..e9cbbf594e6f 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -820,29 +820,39 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object 
>> *bo, int evict,
>>           mutex_lock(&cli->mutex);
>>       else
>>           mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
>> +
>>       ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, 
>> ctx->interruptible);
>> -    if (ret == 0) {
>> -        ret = drm->ttm.move(chan, bo, bo->resource, new_reg);
>> -        if (ret == 0) {
>> -            ret = nouveau_fence_new(chan, false, &fence);
>> -            if (ret == 0) {
>> -                /* TODO: figure out a better solution here
>> -                 *
>> -                 * wait on the fence here explicitly as going through
>> -                 * ttm_bo_move_accel_cleanup somehow doesn't seem to 
>> do it.
>> -                 *
>> -                 * Without this the operation can timeout and we'll 
>> fallback to a
>> -                 * software copy, which might take several minutes to 
>> finish.
>> -                 */
>> -                nouveau_fence_wait(fence, false, false);
>> -                ret = ttm_bo_move_accel_cleanup(bo,
>> -                                &fence->base,
>> -                                evict, false,
>> -                                new_reg);
>> -                nouveau_fence_unref(&fence);
>> -            }
>> -        }
>> +    if (ret)
>> +        goto out_unlock;
>> +
>> +    ret = drm->ttm.move(chan, bo, bo->resource, new_reg);
>> +    if (ret)
>> +        goto out_unlock;
>> +
>> +    ret = nouveau_fence_new(&fence);
>> +    if (ret)
>> +        goto out_unlock;
>> +
>> +    ret = nouveau_fence_emit(fence, chan);
>> +    if (ret) {
>> +        nouveau_fence_unref(&fence);
>> +        goto out_unlock;
>>       }
>> +
>> +    /* TODO: figure out a better solution here
>> +     *
>> +     * wait on the fence here explicitly as going through
>> +     * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
>> +     *
>> +     * Without this the operation can timeout and we'll fallback to a
>> +     * software copy, which might take several minutes to finish.
>> +     */
>> +    nouveau_fence_wait(fence, false, false);
>> +    ret = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, false,
>> +                    new_reg);
>> +    nouveau_fence_unref(&fence);
>> +
>> +out_unlock:
>>       mutex_unlock(&cli->mutex);
>>       return ret;
>>   }
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c 
>> b/drivers/gpu/drm/nouveau/nouveau_chan.c
>> index 6d639314250a..f69be4c8f9f2 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
>> @@ -62,9 +62,11 @@ nouveau_channel_idle(struct nouveau_channel *chan)
>>           struct nouveau_fence *fence = NULL;
>>           int ret;
>> -        ret = nouveau_fence_new(chan, false, &fence);
>> +        ret = nouveau_fence_new(&fence);
>>           if (!ret) {
>> -            ret = nouveau_fence_wait(fence, false, false);
>> +            ret = nouveau_fence_emit(fence, chan);
>> +            if (!ret)
>> +                ret = nouveau_fence_wait(fence, false, false);
>>               nouveau_fence_unref(&fence);
>>           }
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c 
>> b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> index 789857faa048..4ad40e42cae1 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -209,7 +209,8 @@ static vm_fault_t 
>> nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>>           goto done;
>>       }
>> -    nouveau_fence_new(dmem->migrate.chan, false, &fence);
>> +    if (!nouveau_fence_new(&fence))
>> +        nouveau_fence_emit(fence, dmem->migrate.chan);
>>       migrate_vma_pages(&args);
>>       nouveau_dmem_fence_done(&fence);
>>       dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, 
>> DMA_BIDIRECTIONAL);
>> @@ -402,7 +403,8 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk 
>> *chunk)
>>           }
>>       }
>> -    nouveau_fence_new(chunk->drm->dmem->migrate.chan, false, &fence);
>> +    if (!nouveau_fence_new(&fence))
>> +        nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
>>       migrate_device_pages(src_pfns, dst_pfns, npages);
>>       nouveau_dmem_fence_done(&fence);
>>       migrate_device_finalize(src_pfns, dst_pfns, npages);
>> @@ -675,7 +677,8 @@ static void nouveau_dmem_migrate_chunk(struct 
>> nouveau_drm *drm,
>>           addr += PAGE_SIZE;
>>       }
>> -    nouveau_fence_new(drm->dmem->migrate.chan, false, &fence);
>> +    if (!nouveau_fence_new(&fence))
>> +        nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
>>       migrate_vma_pages(args);
>>       nouveau_dmem_fence_done(&fence);
>>       nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c 
>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> index ee5e9d40c166..e946408f945b 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> @@ -210,6 +210,9 @@ nouveau_fence_emit(struct nouveau_fence *fence, 
>> struct nouveau_channel *chan)
>>       struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
>>       int ret;
>> +    if (unlikely(!chan->fence))
>> +        return -ENODEV;
>> +
>>       fence->channel  = chan;
>>       fence->timeout  = jiffies + (15 * HZ);
>> @@ -396,25 +399,16 @@ nouveau_fence_unref(struct nouveau_fence **pfence)
>>   }
>>   int
>> -nouveau_fence_new(struct nouveau_channel *chan, bool sysmem,
>> -          struct nouveau_fence **pfence)
>> +nouveau_fence_new(struct nouveau_fence **pfence)
>>   {
>>       struct nouveau_fence *fence;
>> -    int ret = 0;
>> -
>> -    if (unlikely(!chan->fence))
>> -        return -ENODEV;
>>       fence = kzalloc(sizeof(*fence), GFP_KERNEL);
>>       if (!fence)
>>           return -ENOMEM;
>> -    ret = nouveau_fence_emit(fence, chan);
>> -    if (ret)
>> -        nouveau_fence_unref(&fence);
>> -
>>       *pfence = fence;
>> -    return ret;
>> +    return 0;
>>   }
>>   static const char *nouveau_fence_get_get_driver_name(struct 
>> dma_fence *fence)
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h 
>> b/drivers/gpu/drm/nouveau/nouveau_fence.h
>> index 0ca2bc85adf6..7c73c7c9834a 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
>> @@ -17,8 +17,7 @@ struct nouveau_fence {
>>       unsigned long timeout;
>>   };
>> -int  nouveau_fence_new(struct nouveau_channel *, bool sysmem,
>> -               struct nouveau_fence **);
>> +int  nouveau_fence_new(struct nouveau_fence **);
>>   void nouveau_fence_unref(struct nouveau_fence **);
>>   int  nouveau_fence_emit(struct nouveau_fence *, struct 
>> nouveau_channel *);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c 
>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> index a48f42aaeab9..9c8d1b911a01 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> @@ -873,8 +873,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, 
>> void *data,
>>           }
>>       }
>> -    ret = nouveau_fence_new(chan, false, &fence);
>> +    ret = nouveau_fence_new(&fence);
>> +    if (!ret)
>> +        ret = nouveau_fence_emit(fence, chan);
>>       if (ret) {
>> +        nouveau_fence_unref(&fence);
>>           NV_PRINTK(err, cli, "error fencing pushbuf: %d\n", ret);
>>           WIND_RING(chan);
>>           goto out;
> 

