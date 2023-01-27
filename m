Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 607E667DCB1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 04:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC86E10E3E6;
	Fri, 27 Jan 2023 03:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2355110E3E7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 03:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674790392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHRdQcQF+bSHdElZ6gdn7dE3jtj2ec0pEUu9RLUqDJk=;
 b=JhtONH+52qLKkI4o/3sWhYhaI1oUWfc/c0fuKa8+x1enel5cQFpsRwzmRF6cFtoP+mgvL0
 SLxgV5HA1d7o/oTxULMCpDO23D3ZuB0pUNnGkG2KzXPkxw97DX4z/+80MtqdrSVklBpARF
 UKhtle/6g4tk2Z0Vr9mNkzJ6jK/2uxg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190-jO3BxR-gPUaTVvOhOnU_Sw-1; Thu, 26 Jan 2023 22:33:11 -0500
X-MC-Unique: jO3BxR-gPUaTVvOhOnU_Sw-1
Received: by mail-ed1-f71.google.com with SMTP id
 t17-20020a056402525100b0049e0d2dd9b1so2722571edd.11
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RHRdQcQF+bSHdElZ6gdn7dE3jtj2ec0pEUu9RLUqDJk=;
 b=L3tHtuo0jV0oUd2eK5OX1ASll0vyuqaMYo5D01TtGmIRAkPLJ8EhbzHxzRDN80YHOL
 IxKIKru8RUPO/5tmLoGevW8Jy2R81CnvmG+OLcObvj4fxatGRsRQ3Ucyq0NcGvTYgjlc
 c/fwbbCkDDerEFhaMDaXkAGmcoPGxlbEu4BiF7Ymiu5DqRCwyU+xCv5Hgh0/Y+wc9MlE
 f8em19fb4DKtyRgGWGNEZlLNqClx5BGiY6YU/Yl9OcYkktFjVp7As3JeCJtH/fYCK6qg
 7njSEWeAhAUIRll1O9WIVukrnzoEkNi/YgAwDmcKtyhKd/thCR7JqLF10uGIrS7CDNsF
 1KTA==
X-Gm-Message-State: AFqh2kqaQ/sIk1kffloli+ZFff9ibpYn5VWp03t1vrwM5gj/s0XIESly
 ibsvEJtrq0p578Y1ei2B6SZW4ql59ruLTE/AGKZYIQjhwIboiSEJ7nplR0pASN3VunasJCdbk7e
 fvgCch++gk/YIuFBmgGSzV9deCJ9q
X-Received: by 2002:a05:6402:120a:b0:472:d867:4c3d with SMTP id
 c10-20020a056402120a00b00472d8674c3dmr50547329edw.40.1674790390413; 
 Thu, 26 Jan 2023 19:33:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXshyvwrdTLB6bmSx2mqT51bxtJDTNlSsfKg8Qt5FN0yvn+pXKo+91ENaz2L/oh1DD3/5FPoig==
X-Received: by 2002:a05:6402:120a:b0:472:d867:4c3d with SMTP id
 c10-20020a056402120a00b00472d8674c3dmr50547305edw.40.1674790390156; 
 Thu, 26 Jan 2023 19:33:10 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ch28-20020a0564021bdc00b0049e1f167956sm1651208edb.9.2023.01.26.19.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 19:33:09 -0800 (PST)
Message-ID: <c684cbed-c6a9-f863-fac0-a9ee6af35b23@redhat.com>
Date: Fri, 27 Jan 2023 04:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi interfaces
To: Matthew Brost <matthew.brost@intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <0bf3fec7-5aac-d3cb-8953-a332f84bdf8a@redhat.com>
 <Y9NDTrGhSXomICEE@DUT025-TGLU.fm.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y9NDTrGhSXomICEE@DUT025-TGLU.fm.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: tzimmermann@suse.de, corbet@lwn.net, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bskeggs@redhat.com, jason@jlekstrand.net,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/27/23 04:21, Matthew Brost wrote:
> On Fri, Jan 27, 2023 at 02:43:30AM +0100, Danilo Krummrich wrote:
>>
>>
>> On 1/27/23 02:05, Matthew Brost wrote:
>>> On Wed, Jan 18, 2023 at 07:12:47AM +0100, Danilo Krummrich wrote:
>>>> This commit provides the interfaces for the new UAPI motivated by the
>>>> Vulkan API. It allows user mode drivers (UMDs) to:
>>>>
>>>> 1) Initialize a GPU virtual address (VA) space via the new
>>>>      DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel reserved
>>>>      VA area.
>>>>
>>>> 2) Bind and unbind GPU VA space mappings via the new
>>>>      DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
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
>>>>    Documentation/gpu/driver-uapi.rst |   8 ++
>>>>    include/uapi/drm/nouveau_drm.h    | 216 ++++++++++++++++++++++++++++++
>>>>    2 files changed, 224 insertions(+)
>>>>
>>>> diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
>>>> index 4411e6919a3d..9c7ca6e33a68 100644
>>>> --- a/Documentation/gpu/driver-uapi.rst
>>>> +++ b/Documentation/gpu/driver-uapi.rst
>>>> @@ -6,3 +6,11 @@ drm/i915 uAPI
>>>>    =============
>>>>    .. kernel-doc:: include/uapi/drm/i915_drm.h
>>>> +
>>>> +drm/nouveau uAPI
>>>> +================
>>>> +
>>>> +VM_BIND / EXEC uAPI
>>>> +-------------------
>>>> +
>>>> +.. kernel-doc:: include/uapi/drm/nouveau_drm.h
>>>> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
>>>> index 853a327433d3..f6e7d40201d4 100644
>>>> --- a/include/uapi/drm/nouveau_drm.h
>>>> +++ b/include/uapi/drm/nouveau_drm.h
>>>> @@ -126,6 +126,216 @@ struct drm_nouveau_gem_cpu_fini {
>>>>    	__u32 handle;
>>>>    };
>>>> +/**
>>>> + * struct drm_nouveau_sync - sync object
>>>> + *
>>>> + * This structure serves as synchronization mechanism for (potentially)
>>>> + * asynchronous operations such as EXEC or VM_BIND.
>>>> + */
>>>> +struct drm_nouveau_sync {
>>>> +	/**
>>>> +	 * @flags: the flags for a sync object
>>>> +	 *
>>>> +	 * The first 8 bits are used to determine the type of the sync object.
>>>> +	 */
>>>> +	__u32 flags;
>>>> +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
>>>> +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
>>>> +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
>>>> +	/**
>>>> +	 * @handle: the handle of the sync object
>>>> +	 */
>>>> +	__u32 handle;
>>>> +	/**
>>>> +	 * @timeline_value:
>>>> +	 *
>>>> +	 * The timeline point of the sync object in case the syncobj is of
>>>> +	 * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
>>>> +	 */
>>>> +	__u64 timeline_value;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_nouveau_vm_init - GPU VA space init structure
>>>> + *
>>>> + * Used to initialize the GPU's VA space for a user client, telling the kernel
>>>> + * which portion of the VA space is managed by the UMD and kernel respectively.
>>>> + */
>>>> +struct drm_nouveau_vm_init {
>>>> +	/**
>>>> +	 * @unmanaged_addr: start address of the kernel managed VA space region
>>>> +	 */
>>>> +	__u64 unmanaged_addr;
>>>> +	/**
>>>> +	 * @unmanaged_size: size of the kernel managed VA space region in bytes
>>>> +	 */
>>>> +	__u64 unmanaged_size;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_nouveau_vm_bind_op - VM_BIND operation
>>>> + *
>>>> + * This structure represents a single VM_BIND operation. UMDs should pass
>>>> + * an array of this structure via struct drm_nouveau_vm_bind's &op_ptr field.
>>>> + */
>>>> +struct drm_nouveau_vm_bind_op {
>>>> +	/**
>>>> +	 * @op: the operation type
>>>> +	 */
>>>> +	__u32 op;
>>>> +/**
>>>> + * @DRM_NOUVEAU_VM_BIND_OP_ALLOC:
>>>> + *
>>>> + * The alloc operation is used to reserve a VA space region within the GPU's VA
>>>> + * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to
>>>> + * instruct the kernel to create sparse mappings for the given region.
>>>> + */
>>>> +#define DRM_NOUVEAU_VM_BIND_OP_ALLOC 0x0
>>>
>>> Do you really need this operation? We have no concept of this in Xe,
>>> e.g. we can create a VM and the entire address space is managed exactly
>>> the same.
>>>
>>> If this can be removed then the entire concept of regions in the GPUVA
>>> can be removed too (drop struct drm_gpuva_region). I say this because
>>> in Xe as I'm porting over to GPUVA the first thing I'm doing after
>>> drm_gpuva_manager_init is calling drm_gpuva_region_insert on the entire
>>> address space.
>>
>> Also, since you've been starting to use the code, this [1] is the branch I'm
>> pushing my fixes for a v2 to. It already contains the changes for the GPUVA
>> manager except for switching away from drm_mm.
>>
>> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-fixes
>>
> 
> I will take a look at this branch. I believe you are on our Xe gitlab
> project (working on getting this public) so you can comment on any MR I
> post there, I expect to have something posted early next week to port Xe
> to the gpuva.
> 

Yes, I am.

> Also I assume you are dri-devel IRC, what is your handle? Mine is
> mbrost. It might be useful to chat in real time.

Mine is dakr, I just pinged you in #dri-devel, but it seems your client 
timed out shortly after, so I expect it didn't reach you.

- Danilo

> 
> Matt
> 
>>> To me this seems kinda useless but maybe I'm missing why
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
>>>> + * Map a GEM object to the GPU's VA space. The mapping must be fully enclosed by
>>>> + * a previously allocated VA space region. If the region is sparse, existing
>>>> + * sparse mappings are overwritten.
>>>> + */
>>>> +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x2
>>>> +/**
>>>> + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
>>>> + *
>>>> + * Unmap an existing mapping in the GPU's VA space. If the region the mapping
>>>> + * is located in is a sparse region, new sparse mappings are created where the
>>>> + * unmapped (memory backed) mapping was mapped previously.
>>>> + */
>>>> +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x3
>>>> +	/**
>>>> +	 * @flags: the flags for a &drm_nouveau_vm_bind_op
>>>> +	 */
>>>> +	__u32 flags;
>>>> +/**
>>>> + * @DRM_NOUVEAU_VM_BIND_SPARSE:
>>>> + *
>>>> + * Indicates that an allocated VA space region should be sparse.
>>>> + */
>>>> +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
>>>> +	/**
>>>> +	 * @handle: the handle of the DRM GEM object to map
>>>> +	 */
>>>> +	__u32 handle;
>>>> +	/**
>>>> +	 * @addr:
>>>> +	 *
>>>> +	 * the address the VA space region or (memory backed) mapping should be mapped to
>>>> +	 */
>>>> +	__u64 addr;
>>>> +	/**
>>>> +	 * @bo_offset: the offset within the BO backing the mapping
>>>> +	 */
>>>> +	__u64 bo_offset;
>>>> +	/**
>>>> +	 * @range: the size of the requested mapping in bytes
>>>> +	 */
>>>> +	__u64 range;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND
>>>> + */
>>>> +struct drm_nouveau_vm_bind {
>>>> +	/**
>>>> +	 * @op_count: the number of &drm_nouveau_vm_bind_op
>>>> +	 */
>>>> +	__u32 op_count;
>>>> +	/**
>>>> +	 * @flags: the flags for a &drm_nouveau_vm_bind ioctl
>>>> +	 */
>>>> +	__u32 flags;
>>>> +/**
>>>> + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
>>>> + *
>>>> + * Indicates that the given VM_BIND operation should be executed asynchronously
>>>> + * by the kernel.
>>>> + *
>>>> + * If this flag is not supplied the kernel executes the associated operations
>>>> + * synchronously and doesn't accept any &drm_nouveau_sync objects.
>>>> + */
>>>> +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
>>>> +	/**
>>>> +	 * @wait_count: the number of wait &drm_nouveau_syncs
>>>> +	 */
>>>> +	__u32 wait_count;
>>>> +	/**
>>>> +	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
>>>> +	 */
>>>> +	__u32 sig_count;
>>>> +	/**
>>>> +	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>>>> +	 */
>>>> +	__u64 wait_ptr;
>>>> +	/**
>>>> +	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
>>>> +	 */
>>>> +	__u64 sig_ptr;
>>>> +	/**
>>>> +	 * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
>>>> +	 */
>>>> +	__u64 op_ptr;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_nouveau_exec_push - EXEC push operation
>>>> + *
>>>> + * This structure represents a single EXEC push operation. UMDs should pass an
>>>> + * array of this structure via struct drm_nouveau_exec's &push_ptr field.
>>>> + */
>>>> +struct drm_nouveau_exec_push {
>>>> +	/**
>>>> +	 * @va: the virtual address of the push buffer mapping
>>>> +	 */
>>>> +	__u64 va;
>>>> +	/**
>>>> +	 * @va_len: the length of the push buffer mapping
>>>> +	 */
>>>> +	__u64 va_len;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
>>>> + */
>>>> +struct drm_nouveau_exec {
>>>> +	/**
>>>> +	 * @channel: the channel to execute the push buffer in
>>>> +	 */
>>>> +	__u32 channel;
>>>> +	/**
>>>> +	 * @push_count: the number of &drm_nouveau_exec_push ops
>>>> +	 */
>>>> +	__u32 push_count;
>>>> +	/**
>>>> +	 * @wait_count: the number of wait &drm_nouveau_syncs
>>>> +	 */
>>>> +	__u32 wait_count;
>>>> +	/**
>>>> +	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
>>>> +	 */
>>>> +	__u32 sig_count;
>>>> +	/**
>>>> +	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>>>> +	 */
>>>> +	__u64 wait_ptr;
>>>> +	/**
>>>> +	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
>>>> +	 */
>>>> +	__u64 sig_ptr;
>>>> +	/**
>>>> +	 * @push_ptr: pointer to &drm_nouveau_exec_push ops
>>>> +	 */
>>>> +	__u64 push_ptr;
>>>> +};
>>>> +
>>>>    #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
>>>>    #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>>>>    #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
>>>> @@ -136,6 +346,9 @@ struct drm_nouveau_gem_cpu_fini {
>>>>    #define DRM_NOUVEAU_NVIF               0x07
>>>>    #define DRM_NOUVEAU_SVM_INIT           0x08
>>>>    #define DRM_NOUVEAU_SVM_BIND           0x09
>>>> +#define DRM_NOUVEAU_VM_INIT            0x10
>>>> +#define DRM_NOUVEAU_VM_BIND            0x11
>>>> +#define DRM_NOUVEAU_EXEC               0x12
>>>>    #define DRM_NOUVEAU_GEM_NEW            0x40
>>>>    #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>>>>    #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
>>>> @@ -197,6 +410,9 @@ struct drm_nouveau_svm_bind {
>>>>    #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
>>>>    #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>>>> +#define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
>>>> +#define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
>>>> +#define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>>>>    #if defined(__cplusplus)
>>>>    }
>>>>    #endif
>>>> -- 
>>>> 2.39.0
>>>>
>>>
>>
> 

