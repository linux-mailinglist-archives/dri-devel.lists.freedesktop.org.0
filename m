Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42D77CC472
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 15:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BEF10E2F2;
	Tue, 17 Oct 2023 13:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4971C10E2EB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697548706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSDCThVMKQCFxzqiWQfQEUEQKvusAuTk/t5OleFl9og=;
 b=MSGVibPTBUwScfh4wJDI+71E7RlohssOUHsWP4uRWvmWNYzg2EW+aA6+A3pUF2IPsPoNrI
 bQ8wZzVOm1zkKR1ZoeSgd0LlVpe8iAA/RtBwpcD2YCr8QcEOnwn2aStgEBQT6qWDvIijZ7
 YRZQ5Ijgo0+Ymnu8p/iOgUWgoYdjJ1A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-kJAmQzlWNrCCQwqymqOK2Q-1; Tue, 17 Oct 2023 09:18:24 -0400
X-MC-Unique: kJAmQzlWNrCCQwqymqOK2Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso39205705e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 06:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697548703; x=1698153503;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tSDCThVMKQCFxzqiWQfQEUEQKvusAuTk/t5OleFl9og=;
 b=wEYCyQvUiA8xiD3E/tEXmYRvRWegDEtRb4LoNBaaocUrlNlzoQ2K0HlbK5iSq6qFL5
 wmYzPRVg6w1M9X/NcdUQmyOx1r2c/VVIqWvr1wkjhmUVYYkqNO3JsvtR8JV01iwMC+sY
 X15mZQxQWYl1YGlxQkw/hpBG+Bx5paG4vulfAE62oNnTjeqzvOYQ09HbiILRgVcb1Mb2
 U+E3n5ga9A7WjqL7w61BM7RYoxJ9dvwZmGJJH5Z/Cu4V6lcK1YX8kShwH1sJRfldx0JR
 iI7sX/AN2geK+FU/VJ07WjUVqKJwQPMOVMk/16o2kbfue2tKd0yc1lCUIXk4uw44GdDh
 a9yw==
X-Gm-Message-State: AOJu0YzGeZWoBP4EZyT/j98rhLlBksRx1l3OSHNHFYhZPpK8vVNiC81p
 dRbDcqHfOwnnrWa1yDCreRctwtgjBDNgH2D6ng9RwR3GlZNvVcBPeMyzG4/Q6MXIvPFFz9vmhLP
 EaZT30x8fuuUwPtm/HKa8q8JK5BeI
X-Received: by 2002:a05:600c:19c6:b0:407:8e85:899f with SMTP id
 u6-20020a05600c19c600b004078e85899fmr1684916wmq.16.1697548702887; 
 Tue, 17 Oct 2023 06:18:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3Tj9kqPQlNn1u3th/1xXAhRP9637rUy1wj50ZhBwl/PLcnhJlng6UrdoSTQ2K69K3RbKcEw==
X-Received: by 2002:a05:600c:19c6:b0:407:8e85:899f with SMTP id
 u6-20020a05600c19c600b004078e85899fmr1684871wmq.16.1697548701851; 
 Tue, 17 Oct 2023 06:18:21 -0700 (PDT)
Received: from [10.0.20.172] (198.red-81-39-42.dynamicip.rima-tde.net.
 [81.39.42.198]) by smtp.gmail.com with ESMTPSA id
 bg5-20020a05600c3c8500b00405bbfd5d16sm1977218wmb.7.2023.10.17.06.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 06:18:21 -0700 (PDT)
Message-ID: <9ab3b403-5837-4449-b26a-5af49a016f0f@redhat.com>
Date: Tue, 17 Oct 2023 15:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v6 1/6] drm/gpuvm: add common dma-resv per
 struct drm_gpuvm
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231008233212.13815-1-dakr@redhat.com>
 <20231008233212.13815-2-dakr@redhat.com>
 <65e96c3465a47440ca44b3182e257cb40e745f8b.camel@linux.intel.com>
 <d3409417-444b-4a7a-adde-8d6fab8f1e77@redhat.com>
 <7e57e077c2a56689a07be7da06d78b049125dfe7.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <7e57e077c2a56689a07be7da06d78b049125dfe7.camel@linux.intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/13/23 15:00, Thomas Hellström wrote:
> On Fri, 2023-10-13 at 13:51 +0200, Danilo Krummrich wrote:
>> On 10/13/23 13:38, Thomas Hellström wrote:
>>> On Mon, 2023-10-09 at 01:32 +0200, Danilo Krummrich wrote:
>>>> Provide a common dma-resv for GEM objects not being used outside
>>>> of
>>>> this
>>>> GPU-VM. This is used in a subsequent patch to generalize dma-
>>>> resv,
>>>> external and evicted object handling and GEM validation.
>>>>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_gpuvm.c            | 56
>>>> +++++++++++++++++++++++++-
>>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c | 13 +++++-
>>>>    include/drm/drm_gpuvm.h                | 35 +++++++++++++++-
>>>>    3 files changed, 99 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>>>> b/drivers/gpu/drm/drm_gpuvm.c
>>>> index 02ecb45a2544..ebda9d594165 100644
>>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>>> @@ -61,6 +61,15 @@
>>>>     * contained within struct drm_gpuva already. Hence, for
>>>> inserting
>>>> &drm_gpuva
>>>>     * entries from within dma-fence signalling critical sections
>>>> it is
>>>> enough to
>>>>     * pre-allocate the &drm_gpuva structures.
>>>> + *
>>>> + * &drm_gem_objects which are private to a single VM can share a
>>>> common
>>>> + * &dma_resv in order to improve locking efficiency (e.g. with
>>>> &drm_exec).
>>>> + * For this purpose drivers must pass a &drm_gem_object to
>>>> drm_gpuvm_init(), in
>>>> + * the following called 'root object', which serves as the
>>>> container
>>>
>>> Nit: Perhaps resv object altough it might typically be the root
>>> page-
>>> table object, that doesn't have any meaning to drm_gpuvm, which
>>> uses it
>>> solely as a container for the resv?
>>
>> With "root" I didn't want to refer to the object representing the
>> root
>> page-table object, but being *the* object every other (internal)
>> object
>> needs to keep a reference to.
> 
> OK, yes but the reason they need a reference is because of the shared
> resv, so IMO resv_object is a good fit. (I later noticed there's even
> the function name drm_gpuvm_resv_obj()). And it will probably get
> confused with the driver's "root" page table object, but up to you.

Yeah, maybe 'resv object' is better, gonna change it.

> 
>>   Maybe I should be more explicit here and say
>> that drivers need to make sure every internal object requires a
>> reference
>> to take a reference to this root object.
>>
>>>
>>>> of the
>>>> + * GPUVM's shared &dma_resv. This root object can be a driver
>>>> specific
>>>> + * &drm_gem_object, such as the &drm_gem_object containing the
>>>> root
>>>> page table,
>>>> + * but it can also be a 'dummy' object, which can be allocated
>>>> with
>>>> + * drm_gpuvm_root_object_alloc().
>>>>     */
>>>>    
>>>>    /**
>>>> @@ -652,9 +661,47 @@ drm_gpuvm_range_valid(struct drm_gpuvm
>>>> *gpuvm,
>>>>                  !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
>>>>    }
>>>>    
>>>> +static void
>>>> +drm_gpuvm_gem_object_free(struct drm_gem_object *obj)
>>>> +{
>>>> +       drm_gem_object_release(obj);
>>>> +       kfree(obj);
>>>> +}
>>>> +
>>>> +static const struct drm_gem_object_funcs drm_gpuvm_object_funcs
>>>> = {
>>>> +       .free = drm_gpuvm_gem_object_free,
>>>> +};
>>>> +
>>>> +/**
>>>> + * drm_gpuvm_root_object_alloc() - allocate a dummy
>>>> &drm_gem_object
>>>> + * @drm: the drivers &drm_device
>>>> + *
>>>> + * Allocates a dummy &drm_gem_object which can be passed to
>>>> drm_gpuvm_init() in
>>>> + * order to serve as root GEM object providing the &drm_resv
>>>> shared
>>>> across
>>>> + * &drm_gem_objects local to a single GPUVM.
>>>> + *
>>>> + * Returns: the &drm_gem_object on success, NULL on failure
>>>> + */
>>>> +struct drm_gem_object *
>>>> +drm_gpuvm_root_object_alloc(struct drm_device *drm)
>>>> +{
>>>> +       struct drm_gem_object *obj;
>>>> +
>>>> +       obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>>>> +       if (!obj)
>>>> +               return NULL;
>>>> +
>>>> +       obj->funcs = &drm_gpuvm_object_funcs;
>>>> +       drm_gem_private_object_init(drm, obj, 0);
>>>> +
>>>> +       return obj;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_root_object_alloc);
>>>> +
>>>>    /**
>>>>     * drm_gpuvm_init() - initialize a &drm_gpuvm
>>>>     * @gpuvm: pointer to the &drm_gpuvm to initialize
>>>> + * @r_obj: the root &drm_gem_object providing the GPUVM's common
>>>> &dma_resv
>>>>     * @name: the name of the GPU VA space
>>>>     * @start_offset: the start offset of the GPU VA space
>>>>     * @range: the size of the GPU VA space
>>>> @@ -668,7 +715,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm
>>>> *gpuvm,
>>>>     * &name is expected to be managed by the surrounding driver
>>>> structures.
>>>>     */
>>>>    void
>>>> -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>>> +drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_gem_object
>>>> *r_obj,
>>>>                  const char *name,
>>>>                  u64 start_offset, u64 range,
>>>>                  u64 reserve_offset, u64 reserve_range,
>>>> @@ -683,6 +730,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>>>    
>>>>           gpuvm->name = name ? name : "unknown";
>>>>           gpuvm->ops = ops;
>>>> +       gpuvm->r_obj = r_obj;
>>>> +
>>>> +       drm_gem_object_get(r_obj);
>>>>    
>>>>           memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct
>>>> drm_gpuva));
>>>>    
>>>> @@ -713,7 +763,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>>                   __drm_gpuva_remove(&gpuvm->kernel_alloc_node);
>>>>    
>>>>           WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
>>>> -            "GPUVA tree is not empty, potentially leaking
>>>> memory.");
>>>> +            "GPUVA tree is not empty, potentially leaking
>>>> memory.\n");
>>>
>>> Should we cache the drm device in struct drm_gpuvm and use
>>> drm_warn()
>>> here instead of WARN?
>>
>> I'd guess the additional backtrace of WARN() isn't overly useful in
>> this
>> case. However, it might be a bit more obvious in dmesg due to its
>> verboseness. Not a strong opinion on that, though.
> 
> My bad. I meant drm_WARN(). In a multi-gpu environment it's nice to
> have the extra device info.

Sure, gonna add a separate patch to change that in all places.

> 
> /Thomas
> 
> 
>>
>>>
>>>> +
>>>> +       drm_gem_object_put(gpuvm->r_obj);
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>>>    
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> index 5cf892c50f43..4dea847ef989 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> @@ -1808,8 +1808,9 @@ int
>>>>    nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli
>>>> *cli,
>>>>                     u64 kernel_managed_addr, u64
>>>> kernel_managed_size)
>>>>    {
>>>> -       int ret;
>>>> +       struct drm_gem_object *r_obj;
>>>>           u64 kernel_managed_end = kernel_managed_addr +
>>>> kernel_managed_size;
>>>> +       int ret;
>>>>    
>>>>           mutex_init(&uvmm->mutex);
>>>>           dma_resv_init(&uvmm->resv);
>>>> @@ -1833,14 +1834,22 @@ nouveau_uvmm_init(struct nouveau_uvmm
>>>> *uvmm,
>>>> struct nouveau_cli *cli,
>>>>                   goto out_unlock;
>>>>           }
>>>>    
>>>> +       r_obj = drm_gpuvm_root_object_alloc(cli->drm->dev);
>>>> +       if (!r_obj) {
>>>> +               ret = -ENOMEM;
>>>> +               goto out_unlock;
>>>> +       }
>>>> +
>>>>           uvmm->kernel_managed_addr = kernel_managed_addr;
>>>>           uvmm->kernel_managed_size = kernel_managed_size;
>>>>    
>>>> -       drm_gpuvm_init(&uvmm->base, cli->name,
>>>> +       drm_gpuvm_init(&uvmm->base, r_obj, cli->name,
>>>>                          NOUVEAU_VA_SPACE_START,
>>>>                          NOUVEAU_VA_SPACE_END,
>>>>                          kernel_managed_addr, kernel_managed_size,
>>>>                          NULL);
>>>> +       /* GPUVM takes care from here on. */
>>>> +       drm_gem_object_put(r_obj);
>>>>    
>>>>           ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
>>>>                               cli->vmm.vmm.object.oclass, RAW,
>>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>>> index c7ed6bf441d4..0aec14d8b259 100644
>>>> --- a/include/drm/drm_gpuvm.h
>>>> +++ b/include/drm/drm_gpuvm.h
>>>> @@ -238,9 +238,15 @@ struct drm_gpuvm {
>>>>            * @ops: &drm_gpuvm_ops providing the split/merge steps
>>>> to
>>>> drivers
>>>>            */
>>>>           const struct drm_gpuvm_ops *ops;
>>>> +
>>>> +       /**
>>>> +        * @r_obj: Root GEM object; representing the GPUVM's
>>>> common
>>>> &dma_resv.
>>>> +        */
>>>> +       struct drm_gem_object *r_obj;
>>>>    };
>>>>    
>>>> -void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>>>> +void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct
>>>> drm_gem_object
>>>> *r_obj,
>>>> +                   const char *name,
>>>>                       u64 start_offset, u64 range,
>>>>                       u64 reserve_offset, u64 reserve_range,
>>>>                       const struct drm_gpuvm_ops *ops);
>>>> @@ -248,6 +254,33 @@ void drm_gpuvm_destroy(struct drm_gpuvm
>>>> *gpuvm);
>>>>    
>>>>    bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64
>>>> addr, u64
>>>> range);
>>>>    
>>>> +struct drm_gem_object *
>>>> +drm_gpuvm_root_object_alloc(struct drm_device *drm);
>>>> +
>>>> +/**
>>>> + * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
>>>> + * @gpuvm__: the &drm_gpuvm
>>>> + *
>>>> + * Returns: a pointer to the &drm_gpuvm's shared &dma_resv
>>>> + */
>>>> +#define drm_gpuvm_resv(gpuvm__) ((gpuvm__)->r_obj->resv)
>>>> +
>>>> +/**
>>>> + * drm_gpuvm_resv_obj() - returns the &drm_gem_object holding
>>>> the
>>>> &drm_gpuvm's
>>>> + * &dma_resv
>>>> + * @gpuvm__: the &drm_gpuvm
>>>> + *
>>>> + * Returns: a pointer to the &drm_gem_object holding the
>>>> &drm_gpuvm's shared
>>>> + * &dma_resv
>>>> + */
>>>> +#define drm_gpuvm_resv_obj(gpuvm__) ((gpuvm__)->r_obj)
>>>> +
>>>> +#define drm_gpuvm_resv_held(gpuvm__) \
>>>> +       dma_resv_held(drm_gpuvm_resv(gpuvm__))
>>>> +
>>>> +#define drm_gpuvm_resv_assert_held(gpuvm__) \
>>>> +       dma_resv_assert_held(drm_gpuvm_resv(gpuvm__))
>>>> +
>>>>    static inline struct drm_gpuva *
>>>>    __drm_gpuva_next(struct drm_gpuva *va)
>>>>    {
>>>
>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>
>>>
>>
> 

