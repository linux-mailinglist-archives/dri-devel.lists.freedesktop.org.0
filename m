Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29B3D32F12
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 15:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F91910E8BC;
	Fri, 16 Jan 2026 14:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b="JRRe8+up";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D3510E1FA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 11:04:48 +0000 (UTC)
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
 (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 60GB3irm058698
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 16 Jan 2026 20:04:18 +0900 (JST)
 (envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=X4sYktL6UAbdnenp9p4psVjcYQsGiR2GgSRqS2ZtQys=; 
 c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
 h=Message-ID:Date:Subject:To:From;
 s=rs20250326; t=1768561459; v=1;
 b=JRRe8+uploRjjgOZXBrdO46Wf5xaAl0mER09RJ2NajW8XKcNAD3rygQXP/G+WlcY
 G4ietk1npoX5NrW5urpLcPUFbdhBnolg8b8J9ObIAtMmNdW+4WnEZg1bUwplsFj2
 HB3oJ7I2oUv67EHjH8YY6JRP+FYdaSEQuCt7Ja5mZqV58qrlyEHvwrsIc7+VbGPs
 4XfUKPZM+XeQBD23QmN5IKxrNrn3vULNmCOx/EY2w594iRs+ncUAoMhQ0KH8seTS
 LyDV6c+O/imJ1x9j/5QuA3hqkum8z5f9UeIX1uR3Qkcwd+XupPT7VHzX81Dr80lF
 w60HQEj6FSBFW8P252RRWw==
Message-ID: <2c9cb801-3163-42ae-98bd-afcb9a6a3a5a@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 16 Jan 2026 20:03:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] virtio-gpu: Add userptr support for compute
 workloads
To: Honglei Huang <honghuan@amd.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 Honglei Huang <honglei1.huang@amd.com>,
 David Airlie <airlied@redhat.com>, Ray.Huang@amd.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20260115075851.173318-1-honglei1.huang@amd.com>
 <5b66df7d-374c-4e9c-88d5-bb514f9a7725@rsg.ci.i.u-tokyo.ac.jp>
 <2ae03f22-740d-4a48-b5f3-114eef92fb29@amd.com>
 <cc444faa-af80-4bab-ac3b-a013fef4a695@rsg.ci.i.u-tokyo.ac.jp>
 <4aff513b-eb38-494d-a4f8-78dbc18d0062@amd.com>
 <9874a952-e084-4594-a397-cb4fbe5cc3b7@rsg.ci.i.u-tokyo.ac.jp>
 <17a563f0-14ad-49bf-a734-648615b822fc@amd.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <17a563f0-14ad-49bf-a734-648615b822fc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 16 Jan 2026 14:55:55 +0000
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

On 2026/01/16 19:32, Honglei Huang wrote:
> 
> 
> On 2026/1/16 18:01, Akihiko Odaki wrote:
>> On 2026/01/16 18:39, Honglei Huang wrote:
>>>
>>>
>>> On 2026/1/16 16:54, Akihiko Odaki wrote:
>>>> On 2026/01/16 16:20, Honglei Huang wrote:
>>>>>
>>>>>
>>>>> On 2026/1/15 17:20, Akihiko Odaki wrote:
>>>>>> On 2026/01/15 16:58, Honglei Huang wrote:
>>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>>
>>>>>>> Hello,
>>>>>>>
>>>>>>> This series adds virtio-gpu userptr support to enable ROCm native
>>>>>>> context for compute workloads. The userptr feature allows the 
>>>>>>> host to
>>>>>>> directly access guest userspace memory without memcpy overhead, 
>>>>>>> which is
>>>>>>> essential for GPU compute performance.
>>>>>>>
>>>>>>> The userptr implementation provides buffer-based zero-copy memory 
>>>>>>> access.
>>>>>>> This approach pins guest userspace pages and exposes them to the 
>>>>>>> host
>>>>>>> via scatter-gather tables, enabling efficient compute operations.
>>>>>>
>>>>>> This description looks identical with what 
>>>>>> VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST does so there should be some 
>>>>>> explanation how it makes difference.
>>>>>>
>>>>>> I have already pointed out this when reviewing the QEMU 
>>>>>> patches[1], but I note that here too, since QEMU is just a 
>>>>>> middleman and this matter is better discussed by Linux and 
>>>>>> virglrenderer developers.
>>>>>>
>>>>>> [1] https://lore.kernel.org/qemu-devel/35a8add7-da49-4833-9e69- 
>>>>>> d213f52c771a@amd.com/
>>>>>>
>>>>>
>>>>> Thanks for raising this important point about the distinction between
>>>>> VIRTGPU_BLOB_FLAG_USE_USERPTR and VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST.
>>>>> I might not have explained it clearly previously.
>>>>>
>>>>> The key difference is memory ownership and lifecycle:
>>>>>
>>>>> BLOB_MEM_HOST3D_GUEST:
>>>>>    - Kernel allocates memory (drm_gem_shmem_create)
>>>>>    - Userspace accesses via mmap(GEM_BO)
>>>>>    - Use case: Graphics resources (Vulkan/OpenGL)
>>>>>
>>>>> BLOB_FLAG_USE_USERPTR:
>>>>>    - Userspace pre-allocates memory (malloc/mmap)
>>>>
>>>> "Kernel allocates memory" and "userspace pre-allocates memory" is a 
>>>> bit ambiguous phrasing. Either way, the userspace requests the 
>>>> kernel to map memory with a system call, brk() or mmap().
>>>
>>> They are different:
>>> BLOB_MEM_HOST3D_GUEST (kernel-managed pages):
>>>    - Allocated via drm_gem_shmem_create() as GFP_KERNEL pages
>>>    - Kernel guarantees pages won't swap or migrate while GEM object 
>>> exists
>>>    - Physical addresses remain stable → safe for DMA
>>>
>>> BLOB_FLAG_USE_USERPTR (userspace pages):
>>>    - From regular malloc/mmap - subject to MM policies
>>>    - Can be swapped, migrated, or compacted by kernel
>>>    - Requires FOLL_LONGTERM pinning to make DMA-safe
>>>
>>> The device must treat them differently. Kernel-managed pages have 
>>> stable physical
>>> addresses. Userspace pages need explicit pinning and the device must 
>>> be prepared
>>> for potential invalidation.
>>>
>>> This is why all compute drivers (amdgpu, i915, nouveau) implement 
>>> userptr - to
>>> make arbitrary userspace allocations DMA-accessible while respecting 
>>> their different
>>> page mobility characteristics.
>>> And the drm already has a better frame work for it: SVM, and this 
>>> verions is a super simplified verion.
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>>> tree/ drivers/gpu/drm/ 
>>> drm_gpusvm.c#:~:text=*%20GPU%20Shared%20Virtual%20Memory%20(GPU%20SVM)%20layer%20for%20the%20Direct%20Rendering%20Manager%20(DRM)
>>
>> I referred to phrasing "kernel allocates" vs "userspace allocates". 
>> Using GFP_KERNEL, swapping, migrating, or pinning is all what the 
>> kernel does.
> 
> I am talking about the virtio gpu driver side, the virtio gpu driver 
> need handle those two type memory differently.
> 
>>
>>>
>>>
>>>>
>>>>>    - Kernel only get existing pages
>>>>>    - Use case: Compute workloads (ROCm/CUDA) with large datasets, like
>>>>> GPU needs load a big model file 10G+, UMD mmap the fd file, then 
>>>>> give the mmap ptr into userspace then driver do not need a another 
>>>>> copy.
>>>>> But if the shmem is used, the userspace needs copy the file data 
>>>>> into a shmem mmap ptr there is a copy overhead.
>>>>>
>>>>> Userptr:
>>>>>
>>>>> file -> open/mmap -> userspace ptr -> driver
>>>>>
>>>>> shmem:
>>>>>
>>>>> user alloc shmem ──→ mmap shmem ──→ shmem userspace ptr -> driver
>>>>>                                                ↑
>>>>>                                                │ copy
>>>>>                                                │
>>>>> file ──→ open/mmap ──→ file userptr ──────────┘
>>>>>
>>>>>
>>>>> For compute workloads, this matters significantly:
>>>>>    Without userptr: malloc(8GB) → alloc GEM BO → memcpy 8GB → 
>>>>> compute → memcpy 8GB back
>>>>>    With userptr:    malloc(8GB) → create userptr BO → compute 
>>>>> (zero- copy)
>>>>
>>>> Why don't you alloc GEM BO first and read the file into there?
>>>
>>> Because that defeats the purpose of zero-copy.
>>>
>>> With GEM-BO-first (what you suggest):
>>>
>>> void *gembo = virtgpu_gem_create(10GB);     // Allocate GEM buffer
>>> void *model = mmap(..., model_file_fd, 0);  // Map model file
>>> memcpy(gembo, model, 10GB);                 // Copy 10GB - NOT zero-copy
>>> munmap(model, 10GB);
>>> gpu_compute(gembo);
>>>
>>> Result: 10GB copy overhead + double memory usage during copy.
>>
>> How about:
>>
>> void *gembo = virtgpu_gem_create(10GB);
>> read(model_file_fd, gembo, 10GB);
> 
> I believe there is still memory copy in read operation
> model_file_fd -> gembo, they have different physical pages,
> but the userptr/SVM feature will access the model_file_fd physical pages 
> directly.

You can use O_DIRECT if you want.

> 
> 
>>
>> Result: zero-copy + simpler code.
>>
>>>
>>> With userptr (zero-copy):
>>>
>>> void *model = mmap(..., model_file_fd, 0);  // Map model file
>>> hsa_memory_register(model, 10GB);           // Pin pages, create 
>>> userptr BO
>>> gpu_compute(model);                         // GPU reads directly 
>>> from file pages
>>>
>>>
>>>>
>>>>>
>>>>> The explicit flag serves three purposes:
>>>>>
>>>>> 1. Although both send scatter-gather entries to host. The flag 
>>>>> makes the intent unambiguous.
>>>>
>>>> Why will the host care?
>>>
>>> The flag tells host this is a userptr, host side need handle it 
>>> specially.
>>
>> Please provide the concrete requirement. What is the special handling 
>> the host side needs to perform?
> 
> Every hardware has it own special API to handle userptr, for amdgpu ROCm
> it is hsaKmtRegisterMemoryWithFlags.

On the host side, BLOB_MEM_HOST3D_GUEST will always result in a 
userspace pointer. Below is how the address is translated:

1) (with the ioctl you are adding)
    Guest kernel translates guest userspace pointer to guest PA.
2) (with IOMMU)
    Guest kernel translates guest PA to device VA
3) The host VMM translates device VA to host userspace pointer
4) virglrenderer passes userspace pointer to the GPU API (ROCm)

BLOB_FLAG_USE_USERPTR tells 1) happened. But the succeeding process is 
not affected by that.

> 
>>
>>>
>>>
>>>>
>>>>>
>>>>> 2. Ensures consistency between flag and userptr address field.
>>>>
>>>> Addresses are represented with the nr_entries and following struct 
>>>> virtio_gpu_mem_entry entries, whenever 
>>>> VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB or 
>>>> VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING is used. Having a special 
>>>> flag introduces inconsistency.
>>>
>>> For this part I am talking about the virito gpu guest UMD side, in 
>>> blob create io ctrl we need this flag to
>>> check the userptr address and is it a read-only attribute:
>>>      if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USE_USERPTR) {
>>>          if (!rc_blob->userptr)
>>>              return -EINVAL;
>>>      } else {
>>>          if (rc_blob->userptr)
>>>              return -EINVAL;
>>>
>>>          if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USERPTR_RDONLY)
>>>              return -EINVAL;
>>>      }
>>
>> I see. That shows VIRTGPU_BLOB_FLAG_USE_USERPTR is necessary for the 
>> ioctl.
>>
>>>
>>>>
>>>>>
>>>>> 3. Future HMM support: There is a plan to upgrade userptr 
>>>>> implementation to use Heterogeneous Memory Management for better 
>>>>> GPU coherency and dynamic page migration. The flag provides a clean 
>>>>> path to future upgrade.
>>>>
>>>> How will the upgrade path with the flag and the one without the flag 
>>>> look like, and in what aspect the upgrade path with the flag is 
>>>> "cleaner"?
>>>
>>> As I mentioned above the userptr handling is different with shmem/GEM 
>>> BO.
>>
>> All the above describes the guest-internal behavior. What about the 
>> interaction between the guest and host? How will virtio as a guest- 
>> host interface having VIRTIO_GPU_BLOB_FLAG_USE_USERPTR ease future 
>> upgrade?
> 
> It depends on how we implement it, the current version is the simplest 
> implementation, similar to the implementation in Intel's i915.
> If virtio side needs HMM to implement a SVM type userptr feature
> I think VIRTIO_GPU_BLOB_FLAG_USE_USERPTR is must needed, stack needs to 
> know if it is a userptr resource, and to perform advanced operations 
> such as updating page tables, splitting BOs, etc.

Why do the device need to know if it is a userptr resource to perform 
operations when the device always get device VAs?

> 
>>
>>>
>>>>
>>>>>
>>>>> I understand the concern about API complexity. I'll defer to the 
>>>>> virtio- gpu maintainers for the final decision on whether this 
>>>>> design is acceptable or if they prefer an alternative approach.
>>>>
>>>> It is fine to have API complexity. The problem here is the lack of 
>>>> clear motivation and documentation.
>>>>
>>>> Another way to put this is: how will you explain the flag in the 
>>>> virtio specification? It should say "the driver MAY/SHOULD/MUST do 
>>>> something" and/or "the device MAY/SHOULD/MUST do something", and 
>>>> then Linux and virglrenderer can implement the flag accordingly.
>>>
>>> you're absolutely right that the specification should
>>> be written in proper virtio spec language. The draft should be:
>>>
>>> VIRTIO_GPU_BLOB_FLAG_USE_USERPTR:
>>>
>>> Linux virtio driver requirements:
>>> - MUST set userptr to valid guest userspace VA in 
>>> drm_virtgpu_resource_create_blob
>>> - SHOULD keep VA mapping valid until resource destruction
>>> - MUST pin pages or use HMM at blob creation time
>>
>> These descriptions are not for the virtio specification. The virtio 
>> specification describes the interaction between the driver and device. 
>> These statements describe the interaction between the guest userspace 
>> and the guest kernel.
>>
>>>
>>> Virglrenderer requirements:
>>> - must use correspoonding API for userptr resource
>>
>> What is the "corresponding API"?
> 
> It may can be:
> **VIRTIO_GPU_BLOB_FLAG_USE_USERPTR specification:**
> 
> Driver requirements:
> - MUST populate mem_entry[] with valid guest physical addresses of 
> pinned userspace pages

"Userspace" is a the guest-internal concepts and irrelevant with the 
interaction between the driver and device.

> - MUST set blob_mem to VIRTIO_GPU_BLOB_FLAG_USE_USERPTR when using this 
> flag

When should the driver use the flag?

> - SHOULD keep pages pinned until VIRTIO_GPU_CMD_RESOURCE_UNREF

It is not a new requirement. The page must stay at the same position 
whether VIRTIO_GPU_BLOB_FLAG_USE_USERPTR is used or not.

> 
> Device requirements:
> - MUST establish IOMMU mappings using the provided iovec array with 
> specific API.(hsaKmtRegisterMemoryWithFlags for ROCm)

This should be also true even when VIRTIO_GPU_BLOB_FLAG_USE_USERPTR is 
not set.

> 
> 
> 
> Really thanks for your comments, and I believe we need some input of
> virito gpu maintainers.
> 
> VIRTIO_GPU_BLOB_FLAG_USE_USERPTR flag is a flag for how to use, and it 
> doen't conflict with VIRTGPU_BLOB_MEM_HOST3D_GUEST. Just like a resource 
> is used for VIRTGPU_BLOB_FLAG_USE_SHAREABLE but it can be a guest 
> resource or a host resource.
> 
> If we don't have VIRTIO_GPU_BLOB_FLAG_USE_USERPTR flag, we may have some
> resource conflict in host side, guest kernel can use 'userptr' param to 
> identify. But in host side the 'userptr' param is lost, we only know it 
> is just a guest flag resource.

I still don't see why knowing it is a guest resource is insufficient for 
the host.

Regards,
AKihiko Odaki
