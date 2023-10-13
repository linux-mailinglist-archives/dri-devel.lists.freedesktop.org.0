Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F9E7C8507
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 13:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7033210E5E2;
	Fri, 13 Oct 2023 11:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2D210E5DF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697197912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k15a/eSEnRUDzX9VIx45t87KeriXMFMcLVUO1ZQ/290=;
 b=K4BO9mG6NxGDOcBy0mmu7LsrlhbUwU8fH6X42DIw70JPF0ggSp73WhkxuwfaYhwRicyESI
 TQWrWK6gMccxli9QOgkuUONAKZySQVEjnqm5ses/NxW5JZaUzmUcnWs+8XIcd13N0RtztH
 xqwq38RkDxReaktWVS9wrq5KC5ShxgQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-5gvgbueUObmGD_gD2mHhUg-1; Fri, 13 Oct 2023 07:51:51 -0400
X-MC-Unique: 5gvgbueUObmGD_gD2mHhUg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9bd91ce3033so121147866b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 04:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697197910; x=1697802710;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k15a/eSEnRUDzX9VIx45t87KeriXMFMcLVUO1ZQ/290=;
 b=TfBI0vOAbyIs3rYsyWUGuA9fepMbhTixTnxUDL64Ewn+HrptNpGOQuKIhgckzixXLC
 KvPXkVPtK966o7URLo+7gP6Ftssk2kJlqYcx6Ivz43xibEWUkDFhqW3WA+xnmqDOJZ/8
 oXnt0UZmaUUycCQqt91EdOgdMT79HfBytdfswm+f68DRV//a7wlNSl9aex7VX72Lep9D
 JUkUiS1AD6ruZlFgfcV2K3GOFIw8IL3wO4/6PUTR4QCEvgw0bytO4oebN3E2J2WgXM9l
 E23n3HQ9Q0itZPgw/uYyd7qOJD/AFIZSv22xuBUDEKikLduxPKrsLvJwwnazc8EtBKxr
 F0lw==
X-Gm-Message-State: AOJu0Yzq0w+PuktTsgCXtDTVKr47DOKGPGwuveQhut/fJhGVQlwLAw8P
 czbLAZec6Q3GR5C6dkivPxumnHcDr2ztUVKN2mBu1jouTZ6FxOiMe23TffJAqiloZlEhnwgzkpy
 KWcDtWBTP+HDWgDb+12H4ljcFv9a0
X-Received: by 2002:a17:906:5357:b0:9ae:7681:f62a with SMTP id
 j23-20020a170906535700b009ae7681f62amr24867542ejo.44.1697197910143; 
 Fri, 13 Oct 2023 04:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE3saJaTvY6itOl/Nh8bKAbn8xVDSiFBGs8ZjQ0IKGJpUxvodSPdOw8siiENqh5aCZbIj1+w==
X-Received: by 2002:a17:906:5357:b0:9ae:7681:f62a with SMTP id
 j23-20020a170906535700b009ae7681f62amr24867527ejo.44.1697197909757; 
 Fri, 13 Oct 2023 04:51:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 bd19-20020a056402207300b0053e31113ff7sm1169253edb.94.2023.10.13.04.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 04:51:49 -0700 (PDT)
Message-ID: <d3409417-444b-4a7a-adde-8d6fab8f1e77@redhat.com>
Date: Fri, 13 Oct 2023 13:51:47 +0200
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
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <65e96c3465a47440ca44b3182e257cb40e745f8b.camel@linux.intel.com>
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

On 10/13/23 13:38, Thomas Hellström wrote:
> On Mon, 2023-10-09 at 01:32 +0200, Danilo Krummrich wrote:
>> Provide a common dma-resv for GEM objects not being used outside of
>> this
>> GPU-VM. This is used in a subsequent patch to generalize dma-resv,
>> external and evicted object handling and GEM validation.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c            | 56
>> +++++++++++++++++++++++++-
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 13 +++++-
>>   include/drm/drm_gpuvm.h                | 35 +++++++++++++++-
>>   3 files changed, 99 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>> b/drivers/gpu/drm/drm_gpuvm.c
>> index 02ecb45a2544..ebda9d594165 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -61,6 +61,15 @@
>>    * contained within struct drm_gpuva already. Hence, for inserting
>> &drm_gpuva
>>    * entries from within dma-fence signalling critical sections it is
>> enough to
>>    * pre-allocate the &drm_gpuva structures.
>> + *
>> + * &drm_gem_objects which are private to a single VM can share a
>> common
>> + * &dma_resv in order to improve locking efficiency (e.g. with
>> &drm_exec).
>> + * For this purpose drivers must pass a &drm_gem_object to
>> drm_gpuvm_init(), in
>> + * the following called 'root object', which serves as the container
> 
> Nit: Perhaps resv object altough it might typically be the root page-
> table object, that doesn't have any meaning to drm_gpuvm, which uses it
> solely as a container for the resv?

With "root" I didn't want to refer to the object representing the root
page-table object, but being *the* object every other (internal) object
needs to keep a reference to. Maybe I should be more explicit here and say
that drivers need to make sure every internal object requires a reference
to take a reference to this root object.

> 
>> of the
>> + * GPUVM's shared &dma_resv. This root object can be a driver
>> specific
>> + * &drm_gem_object, such as the &drm_gem_object containing the root
>> page table,
>> + * but it can also be a 'dummy' object, which can be allocated with
>> + * drm_gpuvm_root_object_alloc().
>>    */
>>   
>>   /**
>> @@ -652,9 +661,47 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>>                 !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
>>   }
>>   
>> +static void
>> +drm_gpuvm_gem_object_free(struct drm_gem_object *obj)
>> +{
>> +       drm_gem_object_release(obj);
>> +       kfree(obj);
>> +}
>> +
>> +static const struct drm_gem_object_funcs drm_gpuvm_object_funcs = {
>> +       .free = drm_gpuvm_gem_object_free,
>> +};
>> +
>> +/**
>> + * drm_gpuvm_root_object_alloc() - allocate a dummy &drm_gem_object
>> + * @drm: the drivers &drm_device
>> + *
>> + * Allocates a dummy &drm_gem_object which can be passed to
>> drm_gpuvm_init() in
>> + * order to serve as root GEM object providing the &drm_resv shared
>> across
>> + * &drm_gem_objects local to a single GPUVM.
>> + *
>> + * Returns: the &drm_gem_object on success, NULL on failure
>> + */
>> +struct drm_gem_object *
>> +drm_gpuvm_root_object_alloc(struct drm_device *drm)
>> +{
>> +       struct drm_gem_object *obj;
>> +
>> +       obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>> +       if (!obj)
>> +               return NULL;
>> +
>> +       obj->funcs = &drm_gpuvm_object_funcs;
>> +       drm_gem_private_object_init(drm, obj, 0);
>> +
>> +       return obj;
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gpuvm_root_object_alloc);
>> +
>>   /**
>>    * drm_gpuvm_init() - initialize a &drm_gpuvm
>>    * @gpuvm: pointer to the &drm_gpuvm to initialize
>> + * @r_obj: the root &drm_gem_object providing the GPUVM's common
>> &dma_resv
>>    * @name: the name of the GPU VA space
>>    * @start_offset: the start offset of the GPU VA space
>>    * @range: the size of the GPU VA space
>> @@ -668,7 +715,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>>    * &name is expected to be managed by the surrounding driver
>> structures.
>>    */
>>   void
>> -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>> +drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_gem_object
>> *r_obj,
>>                 const char *name,
>>                 u64 start_offset, u64 range,
>>                 u64 reserve_offset, u64 reserve_range,
>> @@ -683,6 +730,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>   
>>          gpuvm->name = name ? name : "unknown";
>>          gpuvm->ops = ops;
>> +       gpuvm->r_obj = r_obj;
>> +
>> +       drm_gem_object_get(r_obj);
>>   
>>          memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct
>> drm_gpuva));
>>   
>> @@ -713,7 +763,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>                  __drm_gpuva_remove(&gpuvm->kernel_alloc_node);
>>   
>>          WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
>> -            "GPUVA tree is not empty, potentially leaking memory.");
>> +            "GPUVA tree is not empty, potentially leaking
>> memory.\n");
> 
> Should we cache the drm device in struct drm_gpuvm and use drm_warn()
> here instead of WARN?

I'd guess the additional backtrace of WARN() isn't overly useful in this
case. However, it might be a bit more obvious in dmesg due to its
verboseness. Not a strong opinion on that, though.

> 
>> +
>> +       drm_gem_object_put(gpuvm->r_obj);
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> index 5cf892c50f43..4dea847ef989 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> @@ -1808,8 +1808,9 @@ int
>>   nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli
>> *cli,
>>                    u64 kernel_managed_addr, u64 kernel_managed_size)
>>   {
>> -       int ret;
>> +       struct drm_gem_object *r_obj;
>>          u64 kernel_managed_end = kernel_managed_addr +
>> kernel_managed_size;
>> +       int ret;
>>   
>>          mutex_init(&uvmm->mutex);
>>          dma_resv_init(&uvmm->resv);
>> @@ -1833,14 +1834,22 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm,
>> struct nouveau_cli *cli,
>>                  goto out_unlock;
>>          }
>>   
>> +       r_obj = drm_gpuvm_root_object_alloc(cli->drm->dev);
>> +       if (!r_obj) {
>> +               ret = -ENOMEM;
>> +               goto out_unlock;
>> +       }
>> +
>>          uvmm->kernel_managed_addr = kernel_managed_addr;
>>          uvmm->kernel_managed_size = kernel_managed_size;
>>   
>> -       drm_gpuvm_init(&uvmm->base, cli->name,
>> +       drm_gpuvm_init(&uvmm->base, r_obj, cli->name,
>>                         NOUVEAU_VA_SPACE_START,
>>                         NOUVEAU_VA_SPACE_END,
>>                         kernel_managed_addr, kernel_managed_size,
>>                         NULL);
>> +       /* GPUVM takes care from here on. */
>> +       drm_gem_object_put(r_obj);
>>   
>>          ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
>>                              cli->vmm.vmm.object.oclass, RAW,
>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>> index c7ed6bf441d4..0aec14d8b259 100644
>> --- a/include/drm/drm_gpuvm.h
>> +++ b/include/drm/drm_gpuvm.h
>> @@ -238,9 +238,15 @@ struct drm_gpuvm {
>>           * @ops: &drm_gpuvm_ops providing the split/merge steps to
>> drivers
>>           */
>>          const struct drm_gpuvm_ops *ops;
>> +
>> +       /**
>> +        * @r_obj: Root GEM object; representing the GPUVM's common
>> &dma_resv.
>> +        */
>> +       struct drm_gem_object *r_obj;
>>   };
>>   
>> -void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>> +void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_gem_object
>> *r_obj,
>> +                   const char *name,
>>                      u64 start_offset, u64 range,
>>                      u64 reserve_offset, u64 reserve_range,
>>                      const struct drm_gpuvm_ops *ops);
>> @@ -248,6 +254,33 @@ void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
>>   
>>   bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64
>> range);
>>   
>> +struct drm_gem_object *
>> +drm_gpuvm_root_object_alloc(struct drm_device *drm);
>> +
>> +/**
>> + * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
>> + * @gpuvm__: the &drm_gpuvm
>> + *
>> + * Returns: a pointer to the &drm_gpuvm's shared &dma_resv
>> + */
>> +#define drm_gpuvm_resv(gpuvm__) ((gpuvm__)->r_obj->resv)
>> +
>> +/**
>> + * drm_gpuvm_resv_obj() - returns the &drm_gem_object holding the
>> &drm_gpuvm's
>> + * &dma_resv
>> + * @gpuvm__: the &drm_gpuvm
>> + *
>> + * Returns: a pointer to the &drm_gem_object holding the
>> &drm_gpuvm's shared
>> + * &dma_resv
>> + */
>> +#define drm_gpuvm_resv_obj(gpuvm__) ((gpuvm__)->r_obj)
>> +
>> +#define drm_gpuvm_resv_held(gpuvm__) \
>> +       dma_resv_held(drm_gpuvm_resv(gpuvm__))
>> +
>> +#define drm_gpuvm_resv_assert_held(gpuvm__) \
>> +       dma_resv_assert_held(drm_gpuvm_resv(gpuvm__))
>> +
>>   static inline struct drm_gpuva *
>>   __drm_gpuva_next(struct drm_gpuva *va)
>>   {
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 

