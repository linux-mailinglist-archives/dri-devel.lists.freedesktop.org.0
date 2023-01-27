Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3739767E888
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 15:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309BD10E477;
	Fri, 27 Jan 2023 14:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1C810E477
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 14:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674830654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgyUzbW5VO7wi4+o+0G4wAzbN510PHzCyFsvHroOWX8=;
 b=CsAONW1dcZF0u6kHs5cckYCn/hKxtnS5H0qbAUe44V2HszYimG0Zmoot405M4Zqsnp+gEQ
 avTURBeL/TG6g/19aGhlr1zLWeiyWaz36rtaf9c+K1SsIy3EJ+x2MOQqNyfCFf1B0K2aVU
 mfxLuTelp7kAHSn4Uzuq5vPtxjMVGQI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-EhS266SxPdWJmREhlffzBw-1; Fri, 27 Jan 2023 09:44:13 -0500
X-MC-Unique: EhS266SxPdWJmREhlffzBw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso3706844edd.14
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 06:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LgyUzbW5VO7wi4+o+0G4wAzbN510PHzCyFsvHroOWX8=;
 b=pcJeDK4FBicg404jzH5vu+KwmQcTNzXf9T2+ECfjcelDf45Mf5vj+4DYc2oC1/t17l
 c8eHLvaKcBRprDpI3dH7xT6Tws4S6fYCi8ag7roIR5C4wyM+kO1tdTuND/DG/VeD+qqe
 ePGfrPsXJ6f6ZplHusGgEaNMg9cd9sodEAeXZgzPC9NFrHKTQW03zEuLUYcek2ZWbh6R
 nelgDdQYz+sARoBQJABtxoDVE+GnNHuQ6GxSR/uYN+KOgW/2V828isn+nDXIKXfH7Yo/
 uLBWqlZFXoUzlyuKiqASIFupqumXYfFxJEPFG+xzBcct+GO1qLOuTTfHv9LitN0WsgaS
 xp3g==
X-Gm-Message-State: AO0yUKVwFnxUo3tD2fCJcXE940wb+vQ42oqL3/XMuYofPCWaus/4gdA9
 FDOMZx+F/gFpAc4Yujq1ZAUBtRcjuSWMwy2jR/HpzToUvKfBP+xXlU9EMysWaq2iFkhkGk7/8Ae
 PK0n2a91WkZfoOnjbD5Jj1k65a2/S
X-Received: by 2002:a17:907:6d9b:b0:87c:db2:f658 with SMTP id
 sb27-20020a1709076d9b00b0087c0db2f658mr1437583ejc.40.1674830651919; 
 Fri, 27 Jan 2023 06:44:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9mD8aQL+X9TxOVUe05KrGTCI+fOlCBF0hrKGtRVaQ8Wj6ppDv8pQJab0SPWdZgiGJE+txSQA==
X-Received: by 2002:a17:907:6d9b:b0:87c:db2:f658 with SMTP id
 sb27-20020a1709076d9b00b0087c0db2f658mr1437552ejc.40.1674830651616; 
 Fri, 27 Jan 2023 06:44:11 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a1709067b5200b00878530f5324sm2375166ejo.90.2023.01.27.06.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 06:44:11 -0800 (PST)
Message-ID: <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
Date: Fri, 27 Jan 2023 15:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi interfaces
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
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
Cc: corbet@lwn.net, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bskeggs@redhat.com,
 jason@jlekstrand.net, nouveau@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/27/23 14:23, Christian König wrote:
> 
> 
> Am 27.01.23 um 14:12 schrieb Danilo Krummrich:
>> On 1/27/23 08:55, Christian König wrote:
>>> Am 27.01.23 um 02:26 schrieb Danilo Krummrich:
>>>> On 1/27/23 02:05, Matthew Brost wrote:
>>>>> On Wed, Jan 18, 2023 at 07:12:47AM +0100, Danilo Krummrich wrote:
>>>>>> This commit provides the interfaces for the new UAPI motivated by the
>>>>>> Vulkan API. It allows user mode drivers (UMDs) to:
>>>>>>
>>>>>> 1) Initialize a GPU virtual address (VA) space via the new
>>>>>>     DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel 
>>>>>> reserved
>>>>>>     VA area.
>>>>>>
>>>>>> 2) Bind and unbind GPU VA space mappings via the new
>>>>>>     DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>>>>>>
>>>>>> 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
>>>>>>
>>>>>> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
>>>>>> asynchronous processing with DRM syncobjs as synchronization 
>>>>>> mechanism.
>>>>>>
>>>>>> The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
>>>>>> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
>>>>>>
>>>>>> Co-authored-by: Dave Airlie <airlied@redhat.com>
>>>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>>>> ---
>>>>>>   Documentation/gpu/driver-uapi.rst |   8 ++
>>>>>>   include/uapi/drm/nouveau_drm.h    | 216 
>>>>>> ++++++++++++++++++++++++++++++
>>>>>>   2 files changed, 224 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/gpu/driver-uapi.rst 
>>>>>> b/Documentation/gpu/driver-uapi.rst
>>>>>> index 4411e6919a3d..9c7ca6e33a68 100644
>>>>>> --- a/Documentation/gpu/driver-uapi.rst
>>>>>> +++ b/Documentation/gpu/driver-uapi.rst
>>>>>> @@ -6,3 +6,11 @@ drm/i915 uAPI
>>>>>>   =============
>>>>>>     .. kernel-doc:: include/uapi/drm/i915_drm.h
>>>>>> +
>>>>>> +drm/nouveau uAPI
>>>>>> +================
>>>>>> +
>>>>>> +VM_BIND / EXEC uAPI
>>>>>> +-------------------
>>>>>> +
>>>>>> +.. kernel-doc:: include/uapi/drm/nouveau_drm.h
>>>>>> diff --git a/include/uapi/drm/nouveau_drm.h 
>>>>>> b/include/uapi/drm/nouveau_drm.h
>>>>>> index 853a327433d3..f6e7d40201d4 100644
>>>>>> --- a/include/uapi/drm/nouveau_drm.h
>>>>>> +++ b/include/uapi/drm/nouveau_drm.h
>>>>>> @@ -126,6 +126,216 @@ struct drm_nouveau_gem_cpu_fini {
>>>>>>       __u32 handle;
>>>>>>   };
>>>>>>   +/**
>>>>>> + * struct drm_nouveau_sync - sync object
>>>>>> + *
>>>>>> + * This structure serves as synchronization mechanism for 
>>>>>> (potentially)
>>>>>> + * asynchronous operations such as EXEC or VM_BIND.
>>>>>> + */
>>>>>> +struct drm_nouveau_sync {
>>>>>> +    /**
>>>>>> +     * @flags: the flags for a sync object
>>>>>> +     *
>>>>>> +     * The first 8 bits are used to determine the type of the 
>>>>>> sync object.
>>>>>> +     */
>>>>>> +    __u32 flags;
>>>>>> +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
>>>>>> +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
>>>>>> +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
>>>>>> +    /**
>>>>>> +     * @handle: the handle of the sync object
>>>>>> +     */
>>>>>> +    __u32 handle;
>>>>>> +    /**
>>>>>> +     * @timeline_value:
>>>>>> +     *
>>>>>> +     * The timeline point of the sync object in case the syncobj 
>>>>>> is of
>>>>>> +     * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
>>>>>> +     */
>>>>>> +    __u64 timeline_value;
>>>>>> +};
>>>>>> +
>>>>>> +/**
>>>>>> + * struct drm_nouveau_vm_init - GPU VA space init structure
>>>>>> + *
>>>>>> + * Used to initialize the GPU's VA space for a user client, 
>>>>>> telling the kernel
>>>>>> + * which portion of the VA space is managed by the UMD and kernel 
>>>>>> respectively.
>>>>>> + */
>>>>>> +struct drm_nouveau_vm_init {
>>>>>> +    /**
>>>>>> +     * @unmanaged_addr: start address of the kernel managed VA 
>>>>>> space region
>>>>>> +     */
>>>>>> +    __u64 unmanaged_addr;
>>>>>> +    /**
>>>>>> +     * @unmanaged_size: size of the kernel managed VA space 
>>>>>> region in bytes
>>>>>> +     */
>>>>>> +    __u64 unmanaged_size;
>>>>>> +};
>>>>>> +
>>>>>> +/**
>>>>>> + * struct drm_nouveau_vm_bind_op - VM_BIND operation
>>>>>> + *
>>>>>> + * This structure represents a single VM_BIND operation. UMDs 
>>>>>> should pass
>>>>>> + * an array of this structure via struct drm_nouveau_vm_bind's 
>>>>>> &op_ptr field.
>>>>>> + */
>>>>>> +struct drm_nouveau_vm_bind_op {
>>>>>> +    /**
>>>>>> +     * @op: the operation type
>>>>>> +     */
>>>>>> +    __u32 op;
>>>>>> +/**
>>>>>> + * @DRM_NOUVEAU_VM_BIND_OP_ALLOC:
>>>>>> + *
>>>>>> + * The alloc operation is used to reserve a VA space region 
>>>>>> within the GPU's VA
>>>>>> + * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be 
>>>>>> passed to
>>>>>> + * instruct the kernel to create sparse mappings for the given 
>>>>>> region.
>>>>>> + */
>>>>>> +#define DRM_NOUVEAU_VM_BIND_OP_ALLOC 0x0
>>>>>
>>>>> Do you really need this operation? We have no concept of this in Xe,
>>>>> e.g. we can create a VM and the entire address space is managed 
>>>>> exactly
>>>>> the same.
>>>>
>>>> The idea for alloc/free is to let UMDs allocate a portion of the VA 
>>>> space (which I call a region), basically the same thing Vulkan 
>>>> represents with a VKBuffer.
>>>
>>> If that's mangled into the same component/interface then I can say 
>>> from experience that this is a pretty bad idea. We have tried 
>>> something similar with radeon and it turned out horrible.
>>
>> What was the exact constellation in radeon and which problems did 
>> arise from it?
>>
>>>
>>> What you want is one component for tracking the VA allocations 
>>> (drm_mm based) and a different component/interface for tracking the 
>>> VA mappings (probably rb tree based).
>>
>> That's what the GPUVA manager is doing. There are gpuva_regions which 
>> correspond to VA allocations and gpuvas which represent the mappings. 
>> Both are tracked separately (currently both with a separate drm_mm, 
>> though). However, the GPUVA manager needs to take regions into account 
>> when dealing with mappings to make sure the GPUVA manager doesn't 
>> propose drivers to merge over region boundaries. Speaking from 
>> userspace PoV, the kernel wouldn't merge mappings from different 
>> VKBuffer objects even if they're virtually and physically contiguous.
> 
> That are two completely different things and shouldn't be handled in a 
> single component.

They are different things, but they're related in a way that for 
handling the mappings (in particular merging and sparse) the GPUVA 
manager needs to know the VA allocation (or region) boundaries.

I have the feeling there might be a misunderstanding. Userspace is in 
charge to actually allocate a portion of VA space and manage it. The 
GPUVA manager just needs to know about those VA space allocations and 
hence keeps track of them.

The GPUVA manager is not meant to be an allocator in the sense of 
finding and providing a hole for a given request.

Maybe the non-ideal choice of using drm_mm was implying something else.

> 
> We should probably talk about the design of the GPUVA manager once more 
> when this should be applicable to all GPU drivers.

That's what I try to figure out with this RFC, how to make it appicable 
for all GPU drivers, so I'm happy to discuss this. :-)

> 
>>
>> For sparse residency the kernel also needs to know the region 
>> boundaries to make sure that it keeps sparse mappings around.
> 
> What?

When userspace creates a new VKBuffer with the 
VK_BUFFER_CREATE_SPARSE_BINDING_BIT the kernel may need to create sparse 
mappings in order to ensure that using this buffer without any memory 
backed mappings doesn't fault the GPU.

Currently, the implementation does this the following way:

1. Userspace creates a new VKBuffer and hence allocates a portion of the 
VA space for it. It calls into the kernel indicating the new VA space 
region and the fact that the region is sparse.

2. The kernel picks up the region and stores it in the GPUVA manager, 
the driver creates the corresponding sparse mappings / page table entries.

3. Userspace might ask the driver to create a couple of memory backed 
mappings for this particular VA region. The GPUVA manager stores the 
mapping parameters, the driver creates the corresponding page table entries.

4. Userspace might ask to unmap all the memory backed mappings from this 
particular VA region. The GPUVA manager removes the mapping parameters, 
the driver cleans up the corresponding page table entries. However, the 
driver also needs to re-create the sparse mappings, since it's a sparse 
buffer, hence it needs to know the boundaries of the region it needs to 
create the sparse mappings in.

> 
> Regards,
> Christian.
> 
>>
>>>
>>> amdgpu has even gotten so far that the VA allocations are tracked in 
>>> libdrm in userspace
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> It serves two purposes:
>>>>
>>>> 1. It gives the kernel (in particular the GPUVA manager) the bounds 
>>>> in which it is allowed to merge mappings. E.g. when a user request 
>>>> asks for a new mapping and we detect we could merge this mapping 
>>>> with an existing one (used in another VKBuffer than the mapping 
>>>> request came for) the driver is not allowed to change the page table 
>>>> for the existing mapping we want to merge with (assuming that some 
>>>> drivers would need to do this in order to merge), because the 
>>>> existing mapping could already be in use and by re-mapping it we'd 
>>>> potentially cause a fault on the GPU.
>>>>
>>>> 2. It is used for sparse residency in a way that such an allocated 
>>>> VA space region can be flagged as sparse, such that the kernel 
>>>> always keeps sparse mappings around for the parts of the region that 
>>>> do not contain actual memory backed mappings.
>>>>
>>>> If for your driver merging is always OK, creating a single huge 
>>>> region would do the trick I guess. Otherwise, we could also add an 
>>>> option to the GPUVA manager (or a specific region, which could also 
>>>> be a single huge one) within which it never merges.
>>>>
>>>>>
>>>>> If this can be removed then the entire concept of regions in the GPUVA
>>>>> can be removed too (drop struct drm_gpuva_region). I say this because
>>>>> in Xe as I'm porting over to GPUVA the first thing I'm doing after
>>>>> drm_gpuva_manager_init is calling drm_gpuva_region_insert on the 
>>>>> entire
>>>>> address space. To me this seems kinda useless but maybe I'm missing 
>>>>> why
>>>>> you need this for Nouveau.
>>>>>
>>>>> Matt
>>>>>
>>>>>> +/**
>>>>>> + * @DRM_NOUVEAU_VM_BIND_OP_FREE: Free a reserved VA space region.
>>>>>> + */
>>>>>> +#define DRM_NOUVEAU_VM_BIND_OP_FREE 0x1
>>>>>> +/**
>>>>>> + * @DRM_NOUVEAU_VM_BIND_OP_MAP:
>>>>>> + *
>>>>>> + * Map a GEM object to the GPU's VA space. The mapping must be 
>>>>>> fully enclosed by
>>>>>> + * a previously allocated VA space region. If the region is 
>>>>>> sparse, existing
>>>>>> + * sparse mappings are overwritten.
>>>>>> + */
>>>>>> +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x2
>>>>>> +/**
>>>>>> + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
>>>>>> + *
>>>>>> + * Unmap an existing mapping in the GPU's VA space. If the region 
>>>>>> the mapping
>>>>>> + * is located in is a sparse region, new sparse mappings are 
>>>>>> created where the
>>>>>> + * unmapped (memory backed) mapping was mapped previously.
>>>>>> + */
>>>>>> +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x3
>>>>>> +    /**
>>>>>> +     * @flags: the flags for a &drm_nouveau_vm_bind_op
>>>>>> +     */
>>>>>> +    __u32 flags;
>>>>>> +/**
>>>>>> + * @DRM_NOUVEAU_VM_BIND_SPARSE:
>>>>>> + *
>>>>>> + * Indicates that an allocated VA space region should be sparse.
>>>>>> + */
>>>>>> +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
>>>>>> +    /**
>>>>>> +     * @handle: the handle of the DRM GEM object to map
>>>>>> +     */
>>>>>> +    __u32 handle;
>>>>>> +    /**
>>>>>> +     * @addr:
>>>>>> +     *
>>>>>> +     * the address the VA space region or (memory backed) mapping 
>>>>>> should be mapped to
>>>>>> +     */
>>>>>> +    __u64 addr;
>>>>>> +    /**
>>>>>> +     * @bo_offset: the offset within the BO backing the mapping
>>>>>> +     */
>>>>>> +    __u64 bo_offset;
>>>>>> +    /**
>>>>>> +     * @range: the size of the requested mapping in bytes
>>>>>> +     */
>>>>>> +    __u64 range;
>>>>>> +};
>>>>>> +
>>>>>> +/**
>>>>>> + * struct drm_nouveau_vm_bind - structure for 
>>>>>> DRM_IOCTL_NOUVEAU_VM_BIND
>>>>>> + */
>>>>>> +struct drm_nouveau_vm_bind {
>>>>>> +    /**
>>>>>> +     * @op_count: the number of &drm_nouveau_vm_bind_op
>>>>>> +     */
>>>>>> +    __u32 op_count;
>>>>>> +    /**
>>>>>> +     * @flags: the flags for a &drm_nouveau_vm_bind ioctl
>>>>>> +     */
>>>>>> +    __u32 flags;
>>>>>> +/**
>>>>>> + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
>>>>>> + *
>>>>>> + * Indicates that the given VM_BIND operation should be executed 
>>>>>> asynchronously
>>>>>> + * by the kernel.
>>>>>> + *
>>>>>> + * If this flag is not supplied the kernel executes the 
>>>>>> associated operations
>>>>>> + * synchronously and doesn't accept any &drm_nouveau_sync objects.
>>>>>> + */
>>>>>> +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
>>>>>> +    /**
>>>>>> +     * @wait_count: the number of wait &drm_nouveau_syncs
>>>>>> +     */
>>>>>> +    __u32 wait_count;
>>>>>> +    /**
>>>>>> +     * @sig_count: the number of &drm_nouveau_syncs to signal 
>>>>>> when finished
>>>>>> +     */
>>>>>> +    __u32 sig_count;
>>>>>> +    /**
>>>>>> +     * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>>>>>> +     */
>>>>>> +    __u64 wait_ptr;
>>>>>> +    /**
>>>>>> +     * @sig_ptr: pointer to &drm_nouveau_syncs to signal when 
>>>>>> finished
>>>>>> +     */
>>>>>> +    __u64 sig_ptr;
>>>>>> +    /**
>>>>>> +     * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
>>>>>> +     */
>>>>>> +    __u64 op_ptr;
>>>>>> +};
>>>>>> +
>>>>>> +/**
>>>>>> + * struct drm_nouveau_exec_push - EXEC push operation
>>>>>> + *
>>>>>> + * This structure represents a single EXEC push operation. UMDs 
>>>>>> should pass an
>>>>>> + * array of this structure via struct drm_nouveau_exec's 
>>>>>> &push_ptr field.
>>>>>> + */
>>>>>> +struct drm_nouveau_exec_push {
>>>>>> +    /**
>>>>>> +     * @va: the virtual address of the push buffer mapping
>>>>>> +     */
>>>>>> +    __u64 va;
>>>>>> +    /**
>>>>>> +     * @va_len: the length of the push buffer mapping
>>>>>> +     */
>>>>>> +    __u64 va_len;
>>>>>> +};
>>>>>> +
>>>>>> +/**
>>>>>> + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
>>>>>> + */
>>>>>> +struct drm_nouveau_exec {
>>>>>> +    /**
>>>>>> +     * @channel: the channel to execute the push buffer in
>>>>>> +     */
>>>>>> +    __u32 channel;
>>>>>> +    /**
>>>>>> +     * @push_count: the number of &drm_nouveau_exec_push ops
>>>>>> +     */
>>>>>> +    __u32 push_count;
>>>>>> +    /**
>>>>>> +     * @wait_count: the number of wait &drm_nouveau_syncs
>>>>>> +     */
>>>>>> +    __u32 wait_count;
>>>>>> +    /**
>>>>>> +     * @sig_count: the number of &drm_nouveau_syncs to signal 
>>>>>> when finished
>>>>>> +     */
>>>>>> +    __u32 sig_count;
>>>>>> +    /**
>>>>>> +     * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>>>>>> +     */
>>>>>> +    __u64 wait_ptr;
>>>>>> +    /**
>>>>>> +     * @sig_ptr: pointer to &drm_nouveau_syncs to signal when 
>>>>>> finished
>>>>>> +     */
>>>>>> +    __u64 sig_ptr;
>>>>>> +    /**
>>>>>> +     * @push_ptr: pointer to &drm_nouveau_exec_push ops
>>>>>> +     */
>>>>>> +    __u64 push_ptr;
>>>>>> +};
>>>>>> +
>>>>>>   #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
>>>>>>   #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>>>>>>   #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
>>>>>> @@ -136,6 +346,9 @@ struct drm_nouveau_gem_cpu_fini {
>>>>>>   #define DRM_NOUVEAU_NVIF               0x07
>>>>>>   #define DRM_NOUVEAU_SVM_INIT           0x08
>>>>>>   #define DRM_NOUVEAU_SVM_BIND           0x09
>>>>>> +#define DRM_NOUVEAU_VM_INIT            0x10
>>>>>> +#define DRM_NOUVEAU_VM_BIND            0x11
>>>>>> +#define DRM_NOUVEAU_EXEC               0x12
>>>>>>   #define DRM_NOUVEAU_GEM_NEW            0x40
>>>>>>   #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>>>>>>   #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
>>>>>> @@ -197,6 +410,9 @@ struct drm_nouveau_svm_bind {
>>>>>>   #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW 
>>>>>> (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct 
>>>>>> drm_nouveau_gem_cpu_fini)
>>>>>>   #define DRM_IOCTL_NOUVEAU_GEM_INFO DRM_IOWR(DRM_COMMAND_BASE + 
>>>>>> DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>>>>>>   +#define DRM_IOCTL_NOUVEAU_VM_INIT DRM_IOWR(DRM_COMMAND_BASE + 
>>>>>> DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
>>>>>> +#define DRM_IOCTL_NOUVEAU_VM_BIND DRM_IOWR(DRM_COMMAND_BASE + 
>>>>>> DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
>>>>>> +#define DRM_IOCTL_NOUVEAU_EXEC DRM_IOWR(DRM_COMMAND_BASE + 
>>>>>> DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>>>>>>   #if defined(__cplusplus)
>>>>>>   }
>>>>>>   #endif
>>>>>> -- 
>>>>>> 2.39.0
>>>>>>
>>>>>
>>>>
>>>
>>
> 

