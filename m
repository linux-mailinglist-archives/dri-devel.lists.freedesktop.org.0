Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11717A9557
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 16:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852B310E5D3;
	Thu, 21 Sep 2023 14:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAC510E5D4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695307096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkHFfbf/ZTFOoIFuqGa85GazmdlDm6edHrXHnYQgl0Q=;
 b=B2vCLImLoEVLAanlEXVAchtGz/qMl1iETJtYhnt/+qV4KP8HYBbDfhpR+6kubqmwHpnngG
 a5k+o8xoT6Qy8RuLxg2mmj4cKDX2YRbSVprf/6jxwl4ULLmaffR6JHw3AxY3zxcimEkpp+
 o1lx/M2BtAlVbOGnWHMyrz5LKjjuVFQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-AfQ7U8uXNUmt0aoevUcuoA-1; Thu, 21 Sep 2023 10:38:14 -0400
X-MC-Unique: AfQ7U8uXNUmt0aoevUcuoA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fe182913c5so8242825e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 07:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695307093; x=1695911893;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bkHFfbf/ZTFOoIFuqGa85GazmdlDm6edHrXHnYQgl0Q=;
 b=hq9D940aOloqKBFCi7vyTGtxJSuZFU1VE2AwMu5+8+wlaH11N2CwGcUgHvW2G4yC2Z
 uJ551vFWVF6Nkkj/rk74DPqo79bOCwKPZNIGvjJKR8TFXl9RK1hHy8IMw/0pbtp1kRe9
 NKQwMkAAgWBLLL0h/zVrSyXm9rBt9jmtffn3jtMeIhzJNPO0+lWZF4uEzRLVoDkQvxtb
 CzNK1go36a3bAysm9gBRVxghx8DyuX3mdR4O/fVfThzCTzUuNPFGRlIe1GdaM7LDWrfq
 hVQeW6Zn67IcfnuFWZqKMCT3LO+W7ui/37fKUJmhmWZsshU8bpfwWJ8L+tSyv/mpFdcZ
 zdrg==
X-Gm-Message-State: AOJu0Yykk8pWgKPKch8Z3m2oeK0w12tIEhmgKapDOwDpJ2+GwdQD8Bwu
 Uey+glZ7q8Cz+xn8q66uYj/zLjxMB7MhiP47yxdb22djahKA3j7yg1TteMKkdiCoYKf0NcHFOXq
 AG8QmPtLV0dsEQb95L4fXweEW8bbu
X-Received: by 2002:a05:600c:2a41:b0:405:1c14:9227 with SMTP id
 x1-20020a05600c2a4100b004051c149227mr5682670wme.33.1695307093433; 
 Thu, 21 Sep 2023 07:38:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbrKfOcZLrs93IQniuXuejhGT188/4BVcBUTOQCzgVMgciO13Y3byKebIcjb+fBASC8IWBXQ==
X-Received: by 2002:a05:600c:2a41:b0:405:1c14:9227 with SMTP id
 x1-20020a05600c2a4100b004051c149227mr5682648wme.33.1695307092877; 
 Thu, 21 Sep 2023 07:38:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a05600c0ac300b004047ac770d1sm4976095wmr.8.2023.09.21.07.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 07:38:12 -0700 (PDT)
Message-ID: <55a55ed5-0c67-a26f-df5f-18d3b2be278e@redhat.com>
Date: Thu, 21 Sep 2023 16:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v4 4/8] drm/gpuvm: add common dma-resv per
 struct drm_gpuvm
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-5-dakr@redhat.com>
 <7951dc11-6047-6beb-8ef8-98c862e26ec3@amd.com>
 <964a1bdd-549d-7850-9a8c-8278c4cd32ec@redhat.com>
 <20230921162510.10903d90@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230921162510.10903d90@collabora.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/21/23 16:25, Boris Brezillon wrote:
> On Thu, 21 Sep 2023 15:34:44 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> On 9/21/23 09:39, Christian König wrote:
>>> Am 20.09.23 um 16:42 schrieb Danilo Krummrich:
>>>> Provide a common dma-resv for GEM objects not being used outside of this
>>>> GPU-VM. This is used in a subsequent patch to generalize dma-resv,
>>>> external and evicted object handling and GEM validation.
>>>>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_gpuvm.c            |  9 +++++++--
>>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
>>>>    include/drm/drm_gpuvm.h                | 17 ++++++++++++++++-
>>>>    3 files changed, 24 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>>>> index bfea4a8a19ec..cbf4b738a16c 100644
>>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>>> @@ -655,6 +655,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
>>>>    /**
>>>>     * drm_gpuvm_init() - initialize a &drm_gpuvm
>>>>     * @gpuvm: pointer to the &drm_gpuvm to initialize
>>>> + * @drm: the drivers &drm_device
>>>>     * @name: the name of the GPU VA space
>>>>     * @start_offset: the start offset of the GPU VA space
>>>>     * @range: the size of the GPU VA space
>>>> @@ -668,7 +669,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
>>>>     * &name is expected to be managed by the surrounding driver structures.
>>>>     */
>>>>    void
>>>> -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>>> +drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
>>>>               const char *name,
>>>>               u64 start_offset, u64 range,
>>>>               u64 reserve_offset, u64 reserve_range,
>>>> @@ -694,6 +695,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>>>                                 reserve_range)))
>>>>                __drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
>>>>        }
>>>> +
>>>> +    drm_gem_private_object_init(drm, &gpuvm->d_obj, 0);
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>>>> @@ -713,7 +716,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>>            __drm_gpuva_remove(&gpuvm->kernel_alloc_node);
>>>>        WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
>>>> -         "GPUVA tree is not empty, potentially leaking memory.");
>>>> +         "GPUVA tree is not empty, potentially leaking memory.\n");
>>>> +
>>>> +    drm_gem_private_object_fini(&gpuvm->d_obj);
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> index 6c86b64273c3..a80ac8767843 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> @@ -1836,7 +1836,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
>>>>        uvmm->kernel_managed_addr = kernel_managed_addr;
>>>>        uvmm->kernel_managed_size = kernel_managed_size;
>>>> -    drm_gpuvm_init(&uvmm->base, cli->name,
>>>> +    drm_gpuvm_init(&uvmm->base, cli->drm->dev, cli->name,
>>>>                   NOUVEAU_VA_SPACE_START,
>>>>                   NOUVEAU_VA_SPACE_END,
>>>>                   kernel_managed_addr, kernel_managed_size,
>>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>>> index 0e802676e0a9..6666c07d7c3e 100644
>>>> --- a/include/drm/drm_gpuvm.h
>>>> +++ b/include/drm/drm_gpuvm.h
>>>> @@ -240,14 +240,29 @@ struct drm_gpuvm {
>>>>         * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
>>>>         */
>>>>        const struct drm_gpuvm_ops *ops;
>>>> +
>>>> +    /**
>>>> +     * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
>>>> +     * dma-resv to &drm_exec. Provides the GPUVM's &dma-resv.
>>>> +     */
>>>> +    struct drm_gem_object d_obj;
>>>
>>> Yeah, as pointed out in the other mail that won't work like this.
>>
>> Which one? Seems that I missed it.
>>
>>>
>>> The GPUVM contains GEM objects and therefore should probably have a reference to those objects.
>>>
>>> When those GEM objects now use the dma-resv object embedded inside the GPUVM then they also need a reference to the GPUVM to make sure the dma-resv object won't be freed before they are freed.
>>
>> My assumption here is that GEM objects being local to a certain VM never out-live the VM. We never share it with anyone, otherwise it would be external and hence wouldn't carray the VM's dma-resv. The only references I see are from the VM itself (which is fine) and from userspace. The latter isn't a problem as long as all GEM handles are closed before the VM is destroyed on FD close.
> 
> But we don't want to rely on userspace doing the right thing (calling
> GEM_CLOSE before releasing the VM), do we?

I assume VM's are typically released on postclose() and drm_gem_release() is
called previously. But yeah, I guess there are indeed other issues.

> 
> BTW, even though my private BOs have a ref to their exclusive VM, I just
> ran into a bug because drm_gem_shmem_free() acquires the resv lock
> (which is questionable, but that's not the topic :-)) and
> I was calling vm_put(bo->exclusive_vm) before drm_gem_shmem_free(),
> leading to a use-after-free when the gem->resv is acquired. This has
> nothing to do with drm_gpuvm, but it proves that this sort of bug is
> likely to happen if we don't pay attention.
> 
>>
>> Do I miss something? Do we have use cases where this isn't true?
> 
> The other case I can think of is GEM being v[un]map-ed (kernel
> mapping) after the VM was released.
> 
>>
>>>
>>> This is a circle reference dependency.
> 
> FWIW, I solved that by having a vm_destroy() function that kills all the
> mappings in a VM, which in turn releases all the refs the VM had on
> private BOs. Then, it's just a matter of waiting for all private GEMs
> to be destroyed to get the final steps of the VM destruction, which is
> really just about releasing resources (it's called panthor_vm_release()
> in my case) executed when the VM refcount drops to zero.
> 
>>>
>>> The simplest solution I can see is to let the driver provide the GEM object to use. Amdgpu uses the root page directory object for this.
>>
>> Sure, we can do that, if we see cases where VM local GEM objects can out-live the VM.
>>>
>>> Apart from that I strongly think that we shouldn't let the GPUVM code create a driver GEM object. We did that in TTM for the ghost objects and it turned out to be a bad idea.
> 
> Would that really solve the circular ref issue? I mean, if you're
> taking the root page dir object as your VM resv, you still have to make
> sure it outlives the private GEMs, which means, you either need
> to take a ref on the object, leading to the same circular ref mess, or
> you need to reset private GEMs resvs before destroying this root page
> dir GEM (whose lifecyle is likely the same as your VM object which
> embeds the drm_gpuvm instance).
> 
> Making it driver-specific just moves the responsibility back to drivers
> (and also allows re-using an real GEM object instead of a dummy one,
> but I'm not sure we care about saving a few hundreds bytes at that
> point), which is a good way to not take the blame if the driver does
> something wrong, but also doesn't really help people do the right thing.
> 

