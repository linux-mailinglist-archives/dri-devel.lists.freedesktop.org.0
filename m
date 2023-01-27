Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F00867E641
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 14:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DD010E468;
	Fri, 27 Jan 2023 13:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22E410E466
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674825127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZtjC2dy2Wy6Hpv7UHFM/MOBlnI0EEGSdEfpoOWKxw+g=;
 b=GxW9+tV6Gyo3Rsfb+suRWLKecM1MKnW3nGFmIkHdRPmlGC8/ZUVHgG4JCvJAfY1XIKZWck
 tQZ6t0banWKSPuCuKvECO/eRJvGVrGCgp7RrZu29En7cj5YLaNNL3YWnx3eyvDLFIN77ee
 5QKGCs/2AbG1v0e20QejPICeC/jY5zY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-Su-EauW4P0ensmgqEiU-qg-1; Fri, 27 Jan 2023 08:12:06 -0500
X-MC-Unique: Su-EauW4P0ensmgqEiU-qg-1
Received: by mail-ed1-f71.google.com with SMTP id
 s3-20020a50ab03000000b0049ec3a108beso3551216edc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 05:12:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZtjC2dy2Wy6Hpv7UHFM/MOBlnI0EEGSdEfpoOWKxw+g=;
 b=tRLP6Pm7Ev0wdpT1EQtFioOK5pbs76hgeFQpAPmGPo51ePuvxnEXp6bteEzOGugtZW
 cQ6B2dLhUMttK5YUWjVYZAnSthojFsikzHAqHSujWYOANBmJPLw8UQi45VtpWl1l+FQ2
 58YHIbqqGTkserON8na3VC3RionvISi7mO47L5UPkN2XlrVWd1cyWDEW4vN+rff7urd8
 miminargZ2KsKMZHbkGRC5hckc/ZbVFp1GFJ3EuwmeaUgS8ShRzWTlBlohls4hIFg4cz
 izKpyEx4w9RwKr7ybqQthDhjCPgVNlVbByxSqpRAji3iWAq4W2R0VJUyvipZK4iAv8bU
 qF+Q==
X-Gm-Message-State: AO0yUKWcy8vXPfQEZ1cRDT0LRHg1KUMPPcQzNl21KvoF3c03yeEBlD8X
 dH/0i/IN1Oi75QiIUIC/tdH057nGGxR+4JVT8jgQDyfJYRYd/JuucMtfZS1N5qLAlrRRuAwLVWz
 WuYYZ5Et8RzFwV/joxX1N6uFc2Ywn
X-Received: by 2002:a05:6402:378:b0:4a0:e442:5df8 with SMTP id
 s24-20020a056402037800b004a0e4425df8mr4854343edw.18.1674825124941; 
 Fri, 27 Jan 2023 05:12:04 -0800 (PST)
X-Google-Smtp-Source: AK7set9aTe2G6KaIe3jpvyugrVzTz3WcWIJ8kVL2A0mAt9+8S1nMkIYX7wSEi3n6ABXI/0//bw68KA==
X-Received: by 2002:a05:6402:378:b0:4a0:e442:5df8 with SMTP id
 s24-20020a056402037800b004a0e4425df8mr4854306edw.18.1674825124527; 
 Fri, 27 Jan 2023 05:12:04 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a056402054100b0049ef05260besm2287127edx.59.2023.01.27.05.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 05:12:04 -0800 (PST)
Message-ID: <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
Date: Fri, 27 Jan 2023 14:12:02 +0100
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
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
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

On 1/27/23 08:55, Christian König wrote:
> Am 27.01.23 um 02:26 schrieb Danilo Krummrich:
>> On 1/27/23 02:05, Matthew Brost wrote:
>>> On Wed, Jan 18, 2023 at 07:12:47AM +0100, Danilo Krummrich wrote:
>>>> This commit provides the interfaces for the new UAPI motivated by the
>>>> Vulkan API. It allows user mode drivers (UMDs) to:
>>>>
>>>> 1) Initialize a GPU virtual address (VA) space via the new
>>>>     DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel reserved
>>>>     VA area.
>>>>
>>>> 2) Bind and unbind GPU VA space mappings via the new
>>>>     DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>>>>
>>>> 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
>>>>
>>>> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
>>>> asynchronous processing with DRM syncobjs as synchronization mechanism.
>>>>
>>>> The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
>>>> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
>>>>
>>>> Co-authored-by: Dave Airlie <airlied@redhat.com>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>>   Documentation/gpu/driver-uapi.rst |   8 ++
>>>>   include/uapi/drm/nouveau_drm.h    | 216 
>>>> ++++++++++++++++++++++++++++++
>>>>   2 files changed, 224 insertions(+)
>>>>
>>>> diff --git a/Documentation/gpu/driver-uapi.rst 
>>>> b/Documentation/gpu/driver-uapi.rst
>>>> index 4411e6919a3d..9c7ca6e33a68 100644
>>>> --- a/Documentation/gpu/driver-uapi.rst
>>>> +++ b/Documentation/gpu/driver-uapi.rst
>>>> @@ -6,3 +6,11 @@ drm/i915 uAPI
>>>>   =============
>>>>     .. kernel-doc:: include/uapi/drm/i915_drm.h
>>>> +
>>>> +drm/nouveau uAPI
>>>> +================
>>>> +
>>>> +VM_BIND / EXEC uAPI
>>>> +-------------------
>>>> +
>>>> +.. kernel-doc:: include/uapi/drm/nouveau_drm.h
>>>> diff --git a/include/uapi/drm/nouveau_drm.h 
>>>> b/include/uapi/drm/nouveau_drm.h
>>>> index 853a327433d3..f6e7d40201d4 100644
>>>> --- a/include/uapi/drm/nouveau_drm.h
>>>> +++ b/include/uapi/drm/nouveau_drm.h
>>>> @@ -126,6 +126,216 @@ struct drm_nouveau_gem_cpu_fini {
>>>>       __u32 handle;
>>>>   };
>>>>   +/**
>>>> + * struct drm_nouveau_sync - sync object
>>>> + *
>>>> + * This structure serves as synchronization mechanism for 
>>>> (potentially)
>>>> + * asynchronous operations such as EXEC or VM_BIND.
>>>> + */
>>>> +struct drm_nouveau_sync {
>>>> +    /**
>>>> +     * @flags: the flags for a sync object
>>>> +     *
>>>> +     * The first 8 bits are used to determine the type of the sync 
>>>> object.
>>>> +     */
>>>> +    __u32 flags;
>>>> +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
>>>> +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
>>>> +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
>>>> +    /**
>>>> +     * @handle: the handle of the sync object
>>>> +     */
>>>> +    __u32 handle;
>>>> +    /**
>>>> +     * @timeline_value:
>>>> +     *
>>>> +     * The timeline point of the sync object in case the syncobj is of
>>>> +     * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
>>>> +     */
>>>> +    __u64 timeline_value;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_nouveau_vm_init - GPU VA space init structure
>>>> + *
>>>> + * Used to initialize the GPU's VA space for a user client, telling 
>>>> the kernel
>>>> + * which portion of the VA space is managed by the UMD and kernel 
>>>> respectively.
>>>> + */
>>>> +struct drm_nouveau_vm_init {
>>>> +    /**
>>>> +     * @unmanaged_addr: start address of the kernel managed VA 
>>>> space region
>>>> +     */
>>>> +    __u64 unmanaged_addr;
>>>> +    /**
>>>> +     * @unmanaged_size: size of the kernel managed VA space region 
>>>> in bytes
>>>> +     */
>>>> +    __u64 unmanaged_size;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_nouveau_vm_bind_op - VM_BIND operation
>>>> + *
>>>> + * This structure represents a single VM_BIND operation. UMDs 
>>>> should pass
>>>> + * an array of this structure via struct drm_nouveau_vm_bind's 
>>>> &op_ptr field.
>>>> + */
>>>> +struct drm_nouveau_vm_bind_op {
>>>> +    /**
>>>> +     * @op: the operation type
>>>> +     */
>>>> +    __u32 op;
>>>> +/**
>>>> + * @DRM_NOUVEAU_VM_BIND_OP_ALLOC:
>>>> + *
>>>> + * The alloc operation is used to reserve a VA space region within 
>>>> the GPU's VA
>>>> + * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be 
>>>> passed to
>>>> + * instruct the kernel to create sparse mappings for the given region.
>>>> + */
>>>> +#define DRM_NOUVEAU_VM_BIND_OP_ALLOC 0x0
>>>
>>> Do you really need this operation? We have no concept of this in Xe,
>>> e.g. we can create a VM and the entire address space is managed exactly
>>> the same.
>>
>> The idea for alloc/free is to let UMDs allocate a portion of the VA 
>> space (which I call a region), basically the same thing Vulkan 
>> represents with a VKBuffer.
> 
> If that's mangled into the same component/interface then I can say from 
> experience that this is a pretty bad idea. We have tried something 
> similar with radeon and it turned out horrible.

What was the exact constellation in radeon and which problems did arise 
from it?

> 
> What you want is one component for tracking the VA allocations (drm_mm 
> based) and a different component/interface for tracking the VA mappings 
> (probably rb tree based).

That's what the GPUVA manager is doing. There are gpuva_regions which 
correspond to VA allocations and gpuvas which represent the mappings. 
Both are tracked separately (currently both with a separate drm_mm, 
though). However, the GPUVA manager needs to take regions into account 
when dealing with mappings to make sure the GPUVA manager doesn't 
propose drivers to merge over region boundaries. Speaking from userspace 
PoV, the kernel wouldn't merge mappings from different VKBuffer objects 
even if they're virtually and physically contiguous.

For sparse residency the kernel also needs to know the region boundaries 
to make sure that it keeps sparse mappings around.

> 
> amdgpu has even gotten so far that the VA allocations are tracked in 
> libdrm in userspace
> 
> Regards,
> Christian.
> 
>>
>> It serves two purposes:
>>
>> 1. It gives the kernel (in particular the GPUVA manager) the bounds in 
>> which it is allowed to merge mappings. E.g. when a user request asks 
>> for a new mapping and we detect we could merge this mapping with an 
>> existing one (used in another VKBuffer than the mapping request came 
>> for) the driver is not allowed to change the page table for the 
>> existing mapping we want to merge with (assuming that some drivers 
>> would need to do this in order to merge), because the existing mapping 
>> could already be in use and by re-mapping it we'd potentially cause a 
>> fault on the GPU.
>>
>> 2. It is used for sparse residency in a way that such an allocated VA 
>> space region can be flagged as sparse, such that the kernel always 
>> keeps sparse mappings around for the parts of the region that do not 
>> contain actual memory backed mappings.
>>
>> If for your driver merging is always OK, creating a single huge region 
>> would do the trick I guess. Otherwise, we could also add an option to 
>> the GPUVA manager (or a specific region, which could also be a single 
>> huge one) within which it never merges.
>>
>>>
>>> If this can be removed then the entire concept of regions in the GPUVA
>>> can be removed too (drop struct drm_gpuva_region). I say this because
>>> in Xe as I'm porting over to GPUVA the first thing I'm doing after
>>> drm_gpuva_manager_init is calling drm_gpuva_region_insert on the entire
>>> address space. To me this seems kinda useless but maybe I'm missing why
>>> you need this for Nouveau.
>>>
>>> Matt
>>>
>>>> +/**
>>>> + * @DRM_NOUVEAU_VM_BIND_OP_FREE: Free a reserved VA space region.
>>>> + */
>>>> +#define DRM_NOUVEAU_VM_BIND_OP_FREE 0x1
>>>> +/**
>>>> + * @DRM_NOUVEAU_VM_BIND_OP_MAP:
>>>> + *
>>>> + * Map a GEM object to the GPU's VA space. The mapping must be 
>>>> fully enclosed by
>>>> + * a previously allocated VA space region. If the region is sparse, 
>>>> existing
>>>> + * sparse mappings are overwritten.
>>>> + */
>>>> +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x2
>>>> +/**
>>>> + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
>>>> + *
>>>> + * Unmap an existing mapping in the GPU's VA space. If the region 
>>>> the mapping
>>>> + * is located in is a sparse region, new sparse mappings are 
>>>> created where the
>>>> + * unmapped (memory backed) mapping was mapped previously.
>>>> + */
>>>> +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x3
>>>> +    /**
>>>> +     * @flags: the flags for a &drm_nouveau_vm_bind_op
>>>> +     */
>>>> +    __u32 flags;
>>>> +/**
>>>> + * @DRM_NOUVEAU_VM_BIND_SPARSE:
>>>> + *
>>>> + * Indicates that an allocated VA space region should be sparse.
>>>> + */
>>>> +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
>>>> +    /**
>>>> +     * @handle: the handle of the DRM GEM object to map
>>>> +     */
>>>> +    __u32 handle;
>>>> +    /**
>>>> +     * @addr:
>>>> +     *
>>>> +     * the address the VA space region or (memory backed) mapping 
>>>> should be mapped to
>>>> +     */
>>>> +    __u64 addr;
>>>> +    /**
>>>> +     * @bo_offset: the offset within the BO backing the mapping
>>>> +     */
>>>> +    __u64 bo_offset;
>>>> +    /**
>>>> +     * @range: the size of the requested mapping in bytes
>>>> +     */
>>>> +    __u64 range;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_nouveau_vm_bind - structure for 
>>>> DRM_IOCTL_NOUVEAU_VM_BIND
>>>> + */
>>>> +struct drm_nouveau_vm_bind {
>>>> +    /**
>>>> +     * @op_count: the number of &drm_nouveau_vm_bind_op
>>>> +     */
>>>> +    __u32 op_count;
>>>> +    /**
>>>> +     * @flags: the flags for a &drm_nouveau_vm_bind ioctl
>>>> +     */
>>>> +    __u32 flags;
>>>> +/**
>>>> + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
>>>> + *
>>>> + * Indicates that the given VM_BIND operation should be executed 
>>>> asynchronously
>>>> + * by the kernel.
>>>> + *
>>>> + * If this flag is not supplied the kernel executes the associated 
>>>> operations
>>>> + * synchronously and doesn't accept any &drm_nouveau_sync objects.
>>>> + */
>>>> +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
>>>> +    /**
>>>> +     * @wait_count: the number of wait &drm_nouveau_syncs
>>>> +     */
>>>> +    __u32 wait_count;
>>>> +    /**
>>>> +     * @sig_count: the number of &drm_nouveau_syncs to signal when 
>>>> finished
>>>> +     */
>>>> +    __u32 sig_count;
>>>> +    /**
>>>> +     * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>>>> +     */
>>>> +    __u64 wait_ptr;
>>>> +    /**
>>>> +     * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
>>>> +     */
>>>> +    __u64 sig_ptr;
>>>> +    /**
>>>> +     * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
>>>> +     */
>>>> +    __u64 op_ptr;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_nouveau_exec_push - EXEC push operation
>>>> + *
>>>> + * This structure represents a single EXEC push operation. UMDs 
>>>> should pass an
>>>> + * array of this structure via struct drm_nouveau_exec's &push_ptr 
>>>> field.
>>>> + */
>>>> +struct drm_nouveau_exec_push {
>>>> +    /**
>>>> +     * @va: the virtual address of the push buffer mapping
>>>> +     */
>>>> +    __u64 va;
>>>> +    /**
>>>> +     * @va_len: the length of the push buffer mapping
>>>> +     */
>>>> +    __u64 va_len;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
>>>> + */
>>>> +struct drm_nouveau_exec {
>>>> +    /**
>>>> +     * @channel: the channel to execute the push buffer in
>>>> +     */
>>>> +    __u32 channel;
>>>> +    /**
>>>> +     * @push_count: the number of &drm_nouveau_exec_push ops
>>>> +     */
>>>> +    __u32 push_count;
>>>> +    /**
>>>> +     * @wait_count: the number of wait &drm_nouveau_syncs
>>>> +     */
>>>> +    __u32 wait_count;
>>>> +    /**
>>>> +     * @sig_count: the number of &drm_nouveau_syncs to signal when 
>>>> finished
>>>> +     */
>>>> +    __u32 sig_count;
>>>> +    /**
>>>> +     * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>>>> +     */
>>>> +    __u64 wait_ptr;
>>>> +    /**
>>>> +     * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
>>>> +     */
>>>> +    __u64 sig_ptr;
>>>> +    /**
>>>> +     * @push_ptr: pointer to &drm_nouveau_exec_push ops
>>>> +     */
>>>> +    __u64 push_ptr;
>>>> +};
>>>> +
>>>>   #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
>>>>   #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>>>>   #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
>>>> @@ -136,6 +346,9 @@ struct drm_nouveau_gem_cpu_fini {
>>>>   #define DRM_NOUVEAU_NVIF               0x07
>>>>   #define DRM_NOUVEAU_SVM_INIT           0x08
>>>>   #define DRM_NOUVEAU_SVM_BIND           0x09
>>>> +#define DRM_NOUVEAU_VM_INIT            0x10
>>>> +#define DRM_NOUVEAU_VM_BIND            0x11
>>>> +#define DRM_NOUVEAU_EXEC               0x12
>>>>   #define DRM_NOUVEAU_GEM_NEW            0x40
>>>>   #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>>>>   #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
>>>> @@ -197,6 +410,9 @@ struct drm_nouveau_svm_bind {
>>>>   #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW 
>>>> (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct 
>>>> drm_nouveau_gem_cpu_fini)
>>>>   #define DRM_IOCTL_NOUVEAU_GEM_INFO DRM_IOWR(DRM_COMMAND_BASE + 
>>>> DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>>>>   +#define DRM_IOCTL_NOUVEAU_VM_INIT DRM_IOWR(DRM_COMMAND_BASE + 
>>>> DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
>>>> +#define DRM_IOCTL_NOUVEAU_VM_BIND DRM_IOWR(DRM_COMMAND_BASE + 
>>>> DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
>>>> +#define DRM_IOCTL_NOUVEAU_EXEC DRM_IOWR(DRM_COMMAND_BASE + 
>>>> DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>>>>   #if defined(__cplusplus)
>>>>   }
>>>>   #endif
>>>> -- 
>>>> 2.39.0
>>>>
>>>
>>
> 

