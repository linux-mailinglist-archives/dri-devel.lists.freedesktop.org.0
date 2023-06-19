Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE777360DF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 02:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3614D10E253;
	Tue, 20 Jun 2023 00:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0EE10E253
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687222115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDQWM2aDr+OeqFPT+z/4DALOoS7AmWo5spSpen2FmzQ=;
 b=Mmga7q+Bs46BqqNyT7ueByqTdkmdKGcKySwKpKn76PNRgBSf7sRKYBNRfkKybX6i+1ukll
 uDh/eALXgxf411I+Y93Qvs/Sb8BCt5hgZXA7rEYcoePLXuxeXbcuzcvAbp/4Rh3XjvN88H
 YEH2T3iz/LN86YX5IEQ+KIRsK0cIrLE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-KU0nEbwOOCKPUZJ3SR5djQ-1; Mon, 19 Jun 2023 20:48:33 -0400
X-MC-Unique: KU0nEbwOOCKPUZJ3SR5djQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-982180ac15cso320712466b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 17:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687222112; x=1689814112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZDQWM2aDr+OeqFPT+z/4DALOoS7AmWo5spSpen2FmzQ=;
 b=R3pjgnMoUT9QIi4swE/zGZ3T10sLzDvr+cb35CXah8JdR+mySd2C8DTB4QgWDumcHB
 FjnNRhEtWmlTgb88xWhq8JMJpiXtEE/NZKjuqNWGwWoB5A4+N1m+buYeTdDc1XGbfzi0
 WeCJyLoGx6zoFln3Zaei+kbpYd1+negnVvtyUbtBNsKvEwqiS1SDU14PgzWsmOwa6fpx
 MNy6fMDOqnW1LGhlx5xLHJoC71aRot8T22PVF9+m25kSXHildMOiEJtlrAEJG7xc88Tc
 RAQ2KeSlkTGwFq8St6/Ahh5EkDzqp0Ou0YuiEE6X/1+Dxnm3IqQPqPSI9sfQZU5AOhcD
 srFA==
X-Gm-Message-State: AC+VfDx8t1rmg+v5YfiZ+LrkTUk6RnHYOweC3vnRIlZ0LgpjpS8lpY08
 8h4fGycB9Z2Gvx3LEQTBLD2/fzscsRzOtHFwsp8pmPFCF3mWZLZpn7u/v80fN2I6Yyj34TqGFCH
 qy3Qww6OXeGrnlmDpFX9bgt1AXHKZ
X-Received: by 2002:a17:907:d0f:b0:94e:4489:f24d with SMTP id
 gn15-20020a1709070d0f00b0094e4489f24dmr11327348ejc.61.1687222112446; 
 Mon, 19 Jun 2023 17:48:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ42OjmMvE3Onvllx2Aq3Pk+EMeLbZnm80fdv5X2IOXDO3SmC+408YMjs0UvwENSO30x1ThOlA==
X-Received: by 2002:a17:907:d0f:b0:94e:4489:f24d with SMTP id
 gn15-20020a1709070d0f00b0094e4489f24dmr11327318ejc.61.1687222112047; 
 Mon, 19 Jun 2023 17:48:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906274b00b009783791b1a1sm390497ejd.121.2023.06.19.17.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 17:48:31 -0700 (PDT)
Message-ID: <2c92bae3-0003-3c53-8ef1-6e12e5413995@redhat.com>
Date: Tue, 20 Jun 2023 01:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH drm-next v5 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
To: Donald Robson <Donald.Robson@imgtec.com>
References: <20230620004217.4700-1-dakr@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, boris.brezillon@collabora.com,
 bskeggs@redhat.com, tzimmermann@suse.de, Liam.Howlett@oracle.com,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Donald,

forgot to add your email address to the patch series - sorry about that.

This series (v5) contains the Documentation changes you requested.

- Danilo

On 6/20/23 02:42, Danilo Krummrich wrote:
> This patch series provides a new UAPI for the Nouveau driver in order to
> support Vulkan features, such as sparse bindings and sparse residency.
> 
> Furthermore, with the DRM GPUVA manager it provides a new DRM core feature to
> keep track of GPU virtual address (VA) mappings in a more generic way.
> 
> The DRM GPUVA manager is indented to help drivers implement userspace-manageable
> GPU VA spaces in reference to the Vulkan API. In order to achieve this goal it
> serves the following purposes in this context.
> 
>      1) Provide infrastructure to track GPU VA allocations and mappings,
>         making use of the maple_tree.
> 
>      2) Generically connect GPU VA mappings to their backing buffers, in
>         particular DRM GEM objects.
> 
>      3) Provide a common implementation to perform more complex mapping
>         operations on the GPU VA space. In particular splitting and merging
>         of GPU VA mappings, e.g. for intersecting mapping requests or partial
>         unmap requests.
> 
> The new VM_BIND Nouveau UAPI build on top of the DRM GPUVA manager, itself
> providing the following new interfaces.
> 
>      1) Initialize a GPU VA space via the new DRM_IOCTL_NOUVEAU_VM_INIT ioctl
>         for UMDs to specify the portion of VA space managed by the kernel and
>         userspace, respectively.
> 
>      2) Allocate and free a VA space region as well as bind and unbind memory
>         to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
> 
>      3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
> 
> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, make use of the DRM
> scheduler to queue jobs and support asynchronous processing with DRM syncobjs
> as synchronization mechanism.
> 
> By default DRM_IOCTL_NOUVEAU_VM_BIND does synchronous processing,
> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
> 
> The new VM_BIND UAPI for Nouveau makes also use of drm_exec (execution context
> for GEM buffers) by Christian König. Since the patch implementing drm_exec was
> not yet merged into drm-next it is part of this series, as well as a small fix
> for this patch, which was found while testing this series.
> 
> This patch series is also available at [1].
> 
> There is a Mesa NVK merge request by Dave Airlie [2] implementing the
> corresponding userspace parts for this series.
> 
> The Vulkan CTS test suite passes the sparse binding and sparse residency test
> cases for the new UAPI together with Dave's Mesa work.
> 
> There are also some test cases in the igt-gpu-tools project [3] for the new UAPI
> and hence the DRM GPU VA manager. However, most of them are testing the DRM GPU
> VA manager's logic through Nouveau's new UAPI and should be considered just as
> helper for implementation.
> 
> However, I absolutely intend to change those test cases to proper kunit test
> cases for the DRM GPUVA manager, once and if we agree on it's usefulness and
> design.
> 
> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next /
>      https://gitlab.freedesktop.org/nouvelles/kernel/-/merge_requests/1
> [2] https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/150/
> [3] https://gitlab.freedesktop.org/dakr/igt-gpu-tools/-/tree/wip_nouveau_vm_bind
> 
> Changes in V2:
> ==============
>    Nouveau:
>      - Reworked the Nouveau VM_BIND UAPI to avoid memory allocations in fence
>        signalling critical sections. Updates to the VA space are split up in three
>        separate stages, where only the 2. stage executes in a fence signalling
>        critical section:
> 
>          1. update the VA space, allocate new structures and page tables
>          2. (un-)map the requested memory bindings
>          3. free structures and page tables
> 
>      - Separated generic job scheduler code from specific job implementations.
>      - Separated the EXEC and VM_BIND implementation of the UAPI.
>      - Reworked the locking parts of the nvkm/vmm RAW interface, such that
>        (un-)map operations can be executed in fence signalling critical sections.
> 
>    GPUVA Manager:
>      - made drm_gpuva_regions optional for users of the GPUVA manager
>      - allow NULL GEMs for drm_gpuva entries
>      - swichted from drm_mm to maple_tree for track drm_gpuva / drm_gpuva_region
>        entries
>      - provide callbacks for users to allocate custom drm_gpuva_op structures to
>        allow inheritance
>      - added user bits to drm_gpuva_flags
>      - added a prefetch operation type in order to support generating prefetch
>        operations in the same way other operations generated
>      - hand the responsibility for mutual exclusion for a GEM's
>        drm_gpuva list to the user; simplified corresponding (un-)link functions
> 
>    Maple Tree:
>      - I added two maple tree patches to the series, one to support custom tree
>        walk macros and one to hand the locking responsibility to the user of the
>        GPUVA manager without pre-defined lockdep checks.
> 
> Changes in V3:
> ==============
>    Nouveau:
>      - Reworked the Nouveau VM_BIND UAPI to do the job cleanup (including page
>        table cleanup) within a workqueue rather than the job_free() callback of
>        the scheduler itself. A job_free() callback can stall the execution (run()
>        callback) of the next job in the queue. Since the page table cleanup
>        requires to take the same locks as need to be taken for page table
>        allocation, doing it directly in the job_free() callback would still
>        violate the fence signalling critical path.
>      - Separated Nouveau fence allocation and emit, such that we do not violate
>        the fence signalling critical path in EXEC jobs.
>      - Implement "regions" (for handling sparse mappings through PDEs and dual
>        page tables) within Nouveau.
>      - Drop the requirement for every mapping to be contained within a region.
>      - Add necassary synchronization of VM_BIND job operation sequences in order
>        to work around limitations in page table handling. This will be addressed
>        in a future re-work of Nouveau's page table handling.
>      - Fixed a couple of race conditions found through more testing. Thanks to
>        Dave for consitently trying to break it. :-)
> 
>    GPUVA Manager:
>      - Implement pre-allocation capabilities for tree modifications within fence
>        signalling critical sections.
>      - Implement accessors to to apply tree modification while walking the GPUVA
>        tree in order to actually support processing of drm_gpuva_ops through
>        callbacks in fence signalling critical sections rather than through
>        pre-allocated operation lists.
>      - Remove merging of GPUVAs; the kernel has limited to none knowlege about
>        the semantics of mapping sequences. Hence, merging is purely speculative.
>        It seems that gaining a significant (or at least a measurable) performance
>        increase through merging is way more likely to happen when userspace is
>        responsible for merging mappings up to the next larger page size if
>        possible.
>      - Since merging was removed, regions pretty much loose their right to exist.
>        They might still be useful for handling dual page tables or similar
>        mechanisms, but since Nouveau seems to be the only driver having a need
>        for this for now, regions were removed from the GPUVA manager.
>      - Fixed a couple of maple_tree related issues; thanks to Liam for helping me
>        out.
> 
> Changes in V4:
> ==============
>    Nouveau:
>      - Refactored how specific VM_BIND and EXEC jobs are created and how their
>        arguments are passed to the generic job implementation.
>      - Fixed a UAF race condition where bind job ops could have been freed
>        already while still waiting for a job cleanup to finish. This is due to
>        in certain cases we need to wait for mappings actually being unmapped
>        before creating sparse regions in the same area.
>      - Re-based the code onto drm_exec v4 patch.
> 
>    GPUVA Manager:
>      - Fixed a maple tree related bug when pre-allocating MA states.
>        (Boris Brezillion)
>      - Made struct drm_gpuva_fn_ops a const object in all occurrences.
>        (Boris Brezillion)
> 
> Changes in V5:
> ==============
>    Nouveau:
>      - Link and unlink GPUVAs outside the fence signalling critical path in
>        nouveau_uvmm_bind_job_submit() holding the dma-resv lock. Mutual exclusion
>        of BO evicts causing mapping invalidation and regular mapping operations
>        is ensured with dma-fences.
> 
>    GPUVA Manager:
>      - Removed the separate GEMs GPUVA list lock. Link and unlink as well as
>        iterating the GEM's GPUVA list should be protected with the GEM's dma-resv
>        lock instead.
>      - Renamed DRM_GPUVA_EVICTED flag to DRM_GPUVA_INVALIDATED. Mappings do not
>        get eviced, they might get invalidated due to eviction.
>      - Maple tree uses the 'unsinged long' type for node entries. While this
>        works for GPU VA spaces larger than 32-bit on 64-bit kernel, the GPU VA
>        space is limited to 32-bit on 32-bit kernels as well.
>        As long as we do not have a 64-bit capable maple tree for 32-bit kernels,
>        the GPU VA manager contains checks to throw warnings when GPU VA entries
>        exceed the maple tree's storage capabilities.
>      - Extended the Documentation and added example code as requested by Donald
>        Robson.
> 
> Christian König (1):
>    drm: execution context for GEM buffers v4
> 
> Danilo Krummrich (13):
>    maple_tree: split up MA_STATE() macro
>    drm: manager to keep track of GPUs VA mappings
>    drm: debugfs: provide infrastructure to dump a DRM GPU VA space
>    drm/nouveau: new VM_BIND uapi interfaces
>    drm/nouveau: get vmm via nouveau_cli_vmm()
>    drm/nouveau: bo: initialize GEM GPU VA interface
>    drm/nouveau: move usercopy helpers to nouveau_drv.h
>    drm/nouveau: fence: separate fence alloc and emit
>    drm/nouveau: fence: fail to emit when fence context is killed
>    drm/nouveau: chan: provide nouveau_channel_kill()
>    drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
>    drm/nouveau: implement new VM_BIND uAPI
>    drm/nouveau: debugfs: implement DRM GPU VA debugfs
> 
>   Documentation/gpu/driver-uapi.rst             |   11 +
>   Documentation/gpu/drm-mm.rst                  |   54 +
>   drivers/gpu/drm/Kconfig                       |    6 +
>   drivers/gpu/drm/Makefile                      |    3 +
>   drivers/gpu/drm/drm_debugfs.c                 |   41 +
>   drivers/gpu/drm/drm_exec.c                    |  278 +++
>   drivers/gpu/drm/drm_gem.c                     |    3 +
>   drivers/gpu/drm/drm_gpuva_mgr.c               | 1971 ++++++++++++++++
>   drivers/gpu/drm/nouveau/Kbuild                |    3 +
>   drivers/gpu/drm/nouveau/Kconfig               |    2 +
>   drivers/gpu/drm/nouveau/dispnv04/crtc.c       |    9 +-
>   drivers/gpu/drm/nouveau/include/nvif/if000c.h |   26 +-
>   drivers/gpu/drm/nouveau/include/nvif/vmm.h    |   19 +-
>   .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   20 +-
>   drivers/gpu/drm/nouveau/nouveau_abi16.c       |   24 +
>   drivers/gpu/drm/nouveau/nouveau_abi16.h       |    1 +
>   drivers/gpu/drm/nouveau/nouveau_bo.c          |  204 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.h          |    2 +-
>   drivers/gpu/drm/nouveau/nouveau_chan.c        |   22 +-
>   drivers/gpu/drm/nouveau/nouveau_chan.h        |    1 +
>   drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   39 +
>   drivers/gpu/drm/nouveau/nouveau_dmem.c        |    9 +-
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |   27 +-
>   drivers/gpu/drm/nouveau/nouveau_drv.h         |   94 +-
>   drivers/gpu/drm/nouveau/nouveau_exec.c        |  418 ++++
>   drivers/gpu/drm/nouveau/nouveau_exec.h        |   54 +
>   drivers/gpu/drm/nouveau/nouveau_fence.c       |   23 +-
>   drivers/gpu/drm/nouveau/nouveau_fence.h       |    5 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c         |   62 +-
>   drivers/gpu/drm/nouveau/nouveau_mem.h         |    5 +
>   drivers/gpu/drm/nouveau/nouveau_prime.c       |    2 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c       |  461 ++++
>   drivers/gpu/drm/nouveau/nouveau_sched.h       |  123 +
>   drivers/gpu/drm/nouveau/nouveau_svm.c         |    2 +-
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 1979 +++++++++++++++++
>   drivers/gpu/drm/nouveau/nouveau_uvmm.h        |  107 +
>   drivers/gpu/drm/nouveau/nouveau_vmm.c         |    4 +-
>   drivers/gpu/drm/nouveau/nvif/vmm.c            |  100 +-
>   .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  213 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  197 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   25 +
>   .../drm/nouveau/nvkm/subdev/mmu/vmmgf100.c    |   16 +-
>   .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   16 +-
>   .../gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c |   27 +-
>   include/drm/drm_debugfs.h                     |   25 +
>   include/drm/drm_drv.h                         |    6 +
>   include/drm/drm_exec.h                        |  119 +
>   include/drm/drm_gem.h                         |   52 +
>   include/drm/drm_gpuva_mgr.h                   |  682 ++++++
>   include/linux/maple_tree.h                    |    7 +-
>   include/uapi/drm/nouveau_drm.h                |  209 ++
>   51 files changed, 7566 insertions(+), 242 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_exec.c
>   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
>   create mode 100644 include/drm/drm_exec.h
>   create mode 100644 include/drm/drm_gpuva_mgr.h
> 
> 
> base-commit: 2222dcb0775d36de28992f56455ab3967b30d380

