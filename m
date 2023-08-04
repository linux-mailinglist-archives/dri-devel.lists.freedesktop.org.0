Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3601D7707C1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 20:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D314D10E744;
	Fri,  4 Aug 2023 18:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA33D10E021
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 18:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691173456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nSjDGft3El8smQtPJx5y3CBnAPRfUi+IQODVPZetbZE=;
 b=ROTr9k3fL4u2rqxf3v6dHg3mp2awRdCnO1bC4cSu7FwK0ZBRIn1UfhVg54MpnrDVtJDjZu
 7cLBGk0FB9VOw5r1hCWibNNkKs9rbPRyOmglMR53ta0oOmWzpNTs9i6OFKZJYZB9n4w7ta
 NUkceHwrl/QhSwphhnZc8z9CkOIvcFE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-q7bNUlOVPBmPiUZfKE7q4Q-1; Fri, 04 Aug 2023 14:24:13 -0400
X-MC-Unique: q7bNUlOVPBmPiUZfKE7q4Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-52310058f1eso2978192a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 11:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691173452; x=1691778252;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nSjDGft3El8smQtPJx5y3CBnAPRfUi+IQODVPZetbZE=;
 b=ci9IkQKkD7eVgHUM8rh+/wCU9VrSXOWFKP4YhMH+WZwOnS9Zyd8fbsZvaNSKnSz3zK
 zu4GlxNK6mk1dnvfXxCcPZk7jrqDdLy8hcv/2JolpfmCYTivc7syyAutrt7JLRTiUy7Z
 w36oRyoTC4yk4lNwLOKgVVbIE8K60Jub3nlLasx6+MamjzV6F8WkAXeBo39TZMWq9M2X
 LYfkI+kRtHyMlBWJ5qOMvik9hP0VS0lyWdRinc9HZaK92QUMGrRJfZ6esn2FnS39XKbV
 LSdQyv2/WZ4hcZzDOsimbHC7nA4JLT2640ySPE0ld1kMD6/TiDBrGbhTIUnXpdukqfNz
 T9zg==
X-Gm-Message-State: AOJu0YzZY68Q16njagSXrPN+wHW52afeWJ3liiA6ZuCEibTCdtIOfhcu
 B85vIeLgNYvxajgKMe/ntl84Mbt11asBn0Dji3pOGf90vwN02ftZlV0LosTKNWAHyisoBYdhHUB
 gwwi93jP7YOOOn/RsW9DrORuu3Hsf
X-Received: by 2002:a05:6402:180e:b0:523:e25:5656 with SMTP id
 g14-20020a056402180e00b005230e255656mr622808edy.5.1691173452177; 
 Fri, 04 Aug 2023 11:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkCFOPmTLahrFiNjWyJ53oWCpbxMuXv6Bsdq+G24zgxMoB1prWZEpy8CaemauuenYj+fqDgg==
X-Received: by 2002:a05:6402:180e:b0:523:e25:5656 with SMTP id
 g14-20020a056402180e00b005230e255656mr622793edy.5.1691173451807; 
 Fri, 04 Aug 2023 11:24:11 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a056402064f00b00523228f615dsm485983edx.88.2023.08.04.11.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 11:24:11 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Subject: [PATCH drm-misc-next v10 00/12] Nouveau VM_BIND UAPI & DRM GPUVA
 Manager (merged)
Date: Fri,  4 Aug 2023 20:23:40 +0200
Message-ID: <20230804182406.5222-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series provides a new UAPI for the Nouveau driver in order to
support Vulkan features, such as sparse bindings and sparse residency.

Furthermore, with the DRM GPUVA manager it provides a new DRM core feature to
keep track of GPU virtual address (VA) mappings in a more generic way (merged
into drm-misc/drm-misc-next since V8).

The DRM GPUVA manager is indented to help drivers implement userspace-manageable
GPU VA spaces in reference to the Vulkan API. In order to achieve this goal it
serves the following purposes in this context.

    1) Provide infrastructure to track GPU VA allocations and mappings,
       using an interval tree (RB-tree).

    2) Generically connect GPU VA mappings to their backing buffers, in
       particular DRM GEM objects.

    3) Provide a common implementation to perform more complex mapping
       operations on the GPU VA space. In particular splitting and merging
       of GPU VA mappings, e.g. for intersecting mapping requests or partial
       unmap requests.

The new VM_BIND Nouveau UAPI build on top of the DRM GPUVA manager, itself
providing the following new interfaces.

    1) Initialize a GPU VA space via the new DRM_IOCTL_NOUVEAU_VM_INIT ioctl
       for UMDs to specify the portion of VA space managed by the kernel and
       userspace, respectively.

    2) Allocate and free a VA space region as well as bind and unbind memory
       to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.

    3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.

Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, make use of the DRM
scheduler to queue jobs and support asynchronous processing with DRM syncobjs
as synchronization mechanism.

By default DRM_IOCTL_NOUVEAU_VM_BIND does synchronous processing,
DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.

The new VM_BIND UAPI for Nouveau makes also use of drm_exec (execution context
for GEM buffers) by Christian König. Since the patch implementing drm_exec was
not yet merged into drm-next it is part of this series, as well as a small fix
for this patch, which was found while testing this series.

This patch series is also available at [1].

There is a Mesa NVK merge request by Dave Airlie [2] implementing the
corresponding userspace parts for this series.

The Vulkan CTS test suite passes the sparse binding and sparse residency test
cases for the new UAPI together with Dave's Mesa work.

There are also some test cases in the igt-gpu-tools project [3] for the new UAPI
and hence the DRM GPU VA manager. However, most of them are testing the DRM GPU
VA manager's logic through Nouveau's new UAPI and should be considered just as
helper for implementation.

However, I absolutely intend to change those test cases to proper kunit test
cases for the DRM GPUVA manager, once and if we agree on it's usefulness and
design.

[1] https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next /
    https://gitlab.freedesktop.org/nouvelles/kernel/-/merge_requests/1
[2] https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/150/
[3] https://gitlab.freedesktop.org/dakr/igt-gpu-tools/-/tree/wip_nouveau_vm_bind

Changes in V2:
==============
  Nouveau:
    - Reworked the Nouveau VM_BIND UAPI to avoid memory allocations in fence
      signalling critical sections. Updates to the VA space are split up in three
      separate stages, where only the 2. stage executes in a fence signalling
      critical section:

        1. update the VA space, allocate new structures and page tables
        2. (un-)map the requested memory bindings
        3. free structures and page tables

    - Separated generic job scheduler code from specific job implementations.
    - Separated the EXEC and VM_BIND implementation of the UAPI.
    - Reworked the locking parts of the nvkm/vmm RAW interface, such that
      (un-)map operations can be executed in fence signalling critical sections.

  GPUVA Manager:
    - made drm_gpuva_regions optional for users of the GPUVA manager
    - allow NULL GEMs for drm_gpuva entries
    - swichted from drm_mm to maple_tree for track drm_gpuva / drm_gpuva_region
      entries
    - provide callbacks for users to allocate custom drm_gpuva_op structures to
      allow inheritance
    - added user bits to drm_gpuva_flags
    - added a prefetch operation type in order to support generating prefetch
      operations in the same way other operations generated
    - hand the responsibility for mutual exclusion for a GEM's
      drm_gpuva list to the user; simplified corresponding (un-)link functions

  Maple Tree:
    - I added two maple tree patches to the series, one to support custom tree
      walk macros and one to hand the locking responsibility to the user of the
      GPUVA manager without pre-defined lockdep checks.

Changes in V3:
==============
  Nouveau:
    - Reworked the Nouveau VM_BIND UAPI to do the job cleanup (including page
      table cleanup) within a workqueue rather than the job_free() callback of
      the scheduler itself. A job_free() callback can stall the execution (run()
      callback) of the next job in the queue. Since the page table cleanup
      requires to take the same locks as need to be taken for page table
      allocation, doing it directly in the job_free() callback would still
      violate the fence signalling critical path.
    - Separated Nouveau fence allocation and emit, such that we do not violate
      the fence signalling critical path in EXEC jobs.
    - Implement "regions" (for handling sparse mappings through PDEs and dual
      page tables) within Nouveau.
    - Drop the requirement for every mapping to be contained within a region.
    - Add necassary synchronization of VM_BIND job operation sequences in order
      to work around limitations in page table handling. This will be addressed
      in a future re-work of Nouveau's page table handling.
    - Fixed a couple of race conditions found through more testing. Thanks to
      Dave for consitently trying to break it. :-)

  GPUVA Manager:
    - Implement pre-allocation capabilities for tree modifications within fence
      signalling critical sections.
    - Implement accessors to to apply tree modification while walking the GPUVA
      tree in order to actually support processing of drm_gpuva_ops through
      callbacks in fence signalling critical sections rather than through
      pre-allocated operation lists.
    - Remove merging of GPUVAs; the kernel has limited to none knowlege about
      the semantics of mapping sequences. Hence, merging is purely speculative.
      It seems that gaining a significant (or at least a measurable) performance
      increase through merging is way more likely to happen when userspace is
      responsible for merging mappings up to the next larger page size if
      possible.
    - Since merging was removed, regions pretty much loose their right to exist.
      They might still be useful for handling dual page tables or similar
      mechanisms, but since Nouveau seems to be the only driver having a need
      for this for now, regions were removed from the GPUVA manager.
    - Fixed a couple of maple_tree related issues; thanks to Liam for helping me
      out.

Changes in V4:
==============
  Nouveau:
    - Refactored how specific VM_BIND and EXEC jobs are created and how their
      arguments are passed to the generic job implementation.
    - Fixed a UAF race condition where bind job ops could have been freed
      already while still waiting for a job cleanup to finish. This is due to
      in certain cases we need to wait for mappings actually being unmapped
      before creating sparse regions in the same area.
    - Re-based the code onto drm_exec v4 patch.

  GPUVA Manager:
    - Fixed a maple tree related bug when pre-allocating MA states.
      (Boris Brezillion)
    - Made struct drm_gpuva_fn_ops a const object in all occurrences.
      (Boris Brezillion)

Changes in V5:
==============
  Nouveau:
    - Link and unlink GPUVAs outside the fence signalling critical path in
      nouveau_uvmm_bind_job_submit() holding the dma-resv lock. Mutual exclusion
      of BO evicts causing mapping invalidation and regular mapping operations
      is ensured with dma-fences.

  GPUVA Manager:
    - Removed the separate GEMs GPUVA list lock. Link and unlink as well as
      iterating the GEM's GPUVA list should be protected with the GEM's dma-resv
      lock instead.
    - Renamed DRM_GPUVA_EVICTED flag to DRM_GPUVA_INVALIDATED. Mappings do not
      get eviced, they might get invalidated due to eviction.
    - Maple tree uses the 'unsinged long' type for node entries. While this
      works for GPU VA spaces larger than 32-bit on 64-bit kernel, the GPU VA
      space is limited to 32-bit on 32-bit kernels as well.
      As long as we do not have a 64-bit capable maple tree for 32-bit kernels,
      the GPU VA manager contains checks to throw warnings when GPU VA entries
      exceed the maple tree's storage capabilities.
    - Extended the Documentation and added example code as requested by Donald
      Robson.

Changes in V6
=============

  Nouveau:
    - Re-based the code onto drm_exec v5 patch.

  GPUVA Manager:
    - Switch from maple tree to RB-tree.

      It turned out that mas_preallocate() requires the maple tree not to change
      in between pre-allocating nodes with mas_preallocate() and inserting an
      entry with the help of the pre-allocated memory (mas_insert_prealloc()).

      However, considering that drivers typically implement interfaces where
      jobs to create GPU mappings can be submitted by userspace, are queued up
      by the kernel and are processed asynchronously in dma-fence signalling
      critical paths, this is a major issue. In the ioctl() used to submit a job
      we'd need to pre-allocated memory with mas_preallocate(), however,
      previously queued up jobs could concurrently alter the maple tree
      resulting in potentially insufficient pre-allocated memory for the
      currently submitted job on execution time.

      There is a detailed and still ongoing discussion about this topic one the
      -mm list [1]. So far the only solution seems to be to use GFP_ATOMIC
      and allocate memory directly in the fence signalling critical path, where
      we need it. However, I think that is not what we want to rely on.

      I think we should definitely continue in trying to find a solution on how
      to fit in the maple tree (or how to make the maple tree fit in). However,
      for now it seems to be more expedient to move on using a RB-tree.

      [1] https://lore.kernel.org/lkml/20230612203953.2093911-15-Liam.Howlett@oracle.com/

    - Provide a flag to let driver optionally provide their own lock to lock
      linking and unlinking of GPUVAs to GEM objects. The DRM GPUVA manager
      still does not take the locks itself, but rather contains lockdep checks
      on either the GEMs dma-resv lock (default) or, if
      DRM_GPUVA_MANAGER_LOCK_EXTERN is set, the driver provided lock.
      (Boris Brezillon)

Changes in V7
=============
  Nouveau:
    - Rebase to drm_exec v7.
    - Move drm_gem_gpuva_init() before ttm_bo_init_validate(), but after
      initialization of the corresponding dma-resv.

  GPUVA Manager:
    - Fix drm_gpuva_find_first() range parameter in drm_gpuva_for_each_va*
      macros. (Boris)
    - Simplify drm_gpuva_for_each_va* macros using a __drm_gpuva_next() helper.
      (Boris)
    - Move lockdep checks for an optional external GEM gpuva list lock out of
      the GPUVA Manager to drm_gem.h. (Boris)
    - Fix code style issues pointed out by Thomas.
    - Switch to EXPORT_SYMBOL_GPL(). (Christoph)

Changes in V8
=============
  Nouveau:
    - n/a

  GPUVA Manager:
    - Fix documentation about locking the GEMs GPUVA list. (Donald)
    - Fix a few minor checkpatch warnings.

Changes in V9
=============
  Nouveau:
    - uAPI header (Faith, Dave):
      - documented preconditions to successfully initialize the VM_BIND uAPI
      - renamed drm_nouveau_vm_init unmanaged_{addr,size} to
        kernel_managed_{addr,size}
      - add NOUVEAU_GEM_DOMAIN_NO_SHARE flag
    - allow VM_BIND and EXEC jobs with op_count == 0 (Faith)
    - add a common dma-resv object for the VM and handle
      NOUVEAU_GEM_DOMAIN_NO_SHARE accordingly
    - add armed_submit() callback to nouveau_job
    - make use of drm_gpuva_map() rather than open code the GPUVA initialization

  GPUVA Manager:
    - n/a (merged into drm-misc/drm-misc-next since V8)

  DRM GEM:
    - added a patch to fix lockdep checks of GEM GPUVA locks

Changes in V10
==============
  Nouveau:
    - remove license boilerplate text (keep SPDX only), copyright and authorship
      from nouveau_uvmm.c, nouveau_sched.c and nouveau_exec.c
    - rebase on Dave's uAPI header fixup patch

  GPUVA Manager:
    - n/a (merged into drm-misc/drm-misc-next since V8)

Danilo Krummrich (11):
  drm/gem: fix lockdep check for dma-resv lock
  drm/nouveau: new VM_BIND uAPI interfaces
  drm/nouveau: get vmm via nouveau_cli_vmm()
  drm/nouveau: bo: initialize GEM GPU VA interface
  drm/nouveau: move usercopy helpers to nouveau_drv.h
  drm/nouveau: fence: separate fence alloc and emit
  drm/nouveau: fence: fail to emit when fence context is killed
  drm/nouveau: chan: provide nouveau_channel_kill()
  drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
  drm/nouveau: implement new VM_BIND uAPI
  drm/nouveau: debugfs: implement DRM GPU VA debugfs

Dave Airlie (1):
  drm/nouveau: fixup the uapi header file.

 Documentation/gpu/driver-uapi.rst             |   11 +
 drivers/gpu/drm/nouveau/Kbuild                |    3 +
 drivers/gpu/drm/nouveau/Kconfig               |    2 +
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |    9 +-
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   26 +-
 drivers/gpu/drm/nouveau/include/nvif/vmm.h    |   19 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   20 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |   24 +
 drivers/gpu/drm/nouveau/nouveau_abi16.h       |   42 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  219 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h          |    3 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        |   22 +-
 drivers/gpu/drm/nouveau/nouveau_chan.h        |    1 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   39 +
 drivers/gpu/drm/nouveau/nouveau_dmem.c        |    9 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   27 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |   93 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c        |  411 ++++
 drivers/gpu/drm/nouveau/nouveau_exec.h        |   54 +
 drivers/gpu/drm/nouveau/nouveau_fence.c       |   23 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h       |    5 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   86 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h         |    3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h         |    5 +
 drivers/gpu/drm/nouveau/nouveau_prime.c       |   13 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |  419 ++++
 drivers/gpu/drm/nouveau/nouveau_sched.h       |  127 ++
 drivers/gpu/drm/nouveau/nouveau_svm.c         |    2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 1921 +++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |  108 +
 drivers/gpu/drm/nouveau/nouveau_vmm.c         |    4 +-
 drivers/gpu/drm/nouveau/nvif/vmm.c            |  100 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  213 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  197 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   25 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgf100.c    |   16 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   16 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c |   27 +-
 include/drm/drm_gem.h                         |   15 +-
 include/uapi/drm/nouveau_drm.h                |  265 ++-
 40 files changed, 4330 insertions(+), 294 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h


base-commit: a5ae331edb02b6645514f7632478733439e28b34
-- 
2.41.0

