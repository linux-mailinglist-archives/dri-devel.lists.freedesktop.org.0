Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE53869ACF6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A8C10EFF4;
	Fri, 17 Feb 2023 13:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC7810EFDE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LwLShPp83DT/SjdrQ8e0j5FoWk8xRUBiFNvXjirXtcY=;
 b=HroHOIdwNI/D/w8U+vQawkcKxQJ/orvTWduG2s9Mqq0lDtUOVIWkWoviDytukOlDyqNkTu
 i0D6SnU6rC8l6m29r65oSh87sZlUKib5lwrstdS42/QECAjG/JQ7bgo6tm5ivrCJOHp0Mu
 bVKQVIWYzP9mLi1EeYE2RWDXipyyCmc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-bwqIFjS5M9SQqnI15kjhfw-1; Fri, 17 Feb 2023 08:44:30 -0500
X-MC-Unique: bwqIFjS5M9SQqnI15kjhfw-1
Received: by mail-ed1-f71.google.com with SMTP id
 v3-20020a056402174300b004aab6614de9so1090666edx.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LwLShPp83DT/SjdrQ8e0j5FoWk8xRUBiFNvXjirXtcY=;
 b=R8h0LzqFXFFGtklBfkGU3cvET8VSmKIrT6HSIyw6t4qyPFazNpChpdrxAISNoEcue2
 +wcaFC9eEbpkO/j+Gamww4sKEPP+vBmqotsVKR1tXYNBRlZ147QVbf3KyiwjnBN3sFvl
 o7XlVLnQtPwwsT7toip2DmI+/HFTzv81M7gzMDmvgiMpB1/VQ/N+cgNrRekVLkqoSQ24
 V+M21Hjd/KUf0KXFUDIiwhRL/rhocxKB1h+HDn7gLb4y5SKRQ9DYsPVpZ8z+jY6L1YuK
 sUQTrNJCwIWHt0srdiODVdlONh/ywPyFSOSEaje8DVqPaRiXYsc8KREcW1o75RBk/u1T
 nI/Q==
X-Gm-Message-State: AO0yUKWIg+535tDmivOaJxbnwprCEc1e8xnJhp1X4/WyTKJSD6tp72I2
 hS/VmXG54JFXqKz9r7EhQ6IYm+LkfkKS9FLnIEkpGSiLnq+TKC+FLY/ng1ul3ieotADw3gyqAE9
 YhfdAnramBJEVYt46w5fb61mYFwkl
X-Received: by 2002:a17:906:d104:b0:8b1:279c:82c7 with SMTP id
 b4-20020a170906d10400b008b1279c82c7mr855057ejz.50.1676641469591; 
 Fri, 17 Feb 2023 05:44:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9bwPc8c8ahszSaP/wQTMd4R9rpXWxJ4wDJVBZN063mM6nFIe9FLzQVWxLMjS8msuQDnJMLeg==
X-Received: by 2002:a17:906:d104:b0:8b1:279c:82c7 with SMTP id
 b4-20020a170906d10400b008b1279c82c7mr855038ejz.50.1676641469294; 
 Fri, 17 Feb 2023 05:44:29 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a508d18000000b004acb2c8aeaesm2326370eds.85.2023.02.17.05.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:44:28 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 00/16] [RFC] DRM GPUVA Manager & Nouveau VM_BIND
 UAPI
Date: Fri, 17 Feb 2023 14:44:06 +0100
Message-Id: <20230217134422.14116-1-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series provides a new UAPI for the Nouveau driver in order to
support Vulkan features, such as sparse bindings and sparse residency.

Furthermore, with the DRM GPUVA manager it provides a new DRM core feature to
keep track of GPU virtual address (VA) mappings in a more generic way.

The DRM GPUVA manager is indented to help drivers implement userspace-manageable
GPU VA spaces in reference to the Vulkan API. In order to achieve this goal it
serves the following purposes in this context.

    1) Provide infrastructure to track GPU VA allocations and mappings,
       making use of the maple_tree.

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

TODO
====
  Maple Tree:
    - Maple tree uses the 'unsinged long' type for node entries. While this
      works for 64bit, it's incompatible with the DRM GPUVA Manager on 32bit,
      since the DRM GPUVA Manager uses the u64 type and so do drivers using it.
      While it's questionable whether a 32bit kernel and a > 32bit GPU address
      space make any sense, it creates tons of compiler warnings when compiling
      for 32bit. Maybe it makes sense to expand the maple tree API to let users
      decide which size to pick - other ideas / proposals are welcome.

Christian König (1):
  drm: execution context for GEM buffers

Danilo Krummrich (15):
  drm/exec: fix memory leak in drm_exec_prepare_obj()
  maple_tree: split up MA_STATE() macro
  maple_tree: add flag MT_FLAGS_LOCK_NONE
  drm: manager to keep track of GPUs VA mappings
  drm: debugfs: provide infrastructure to dump a DRM GPU VA space
  drm/nouveau: new VM_BIND uapi interfaces
  drm/nouveau: get vmm via nouveau_cli_vmm()
  drm/nouveau: bo: initialize GEM GPU VA interface
  drm/nouveau: move usercopy helpers to nouveau_drv.h
  drm/nouveau: fence: fail to emit when fence context is killed
  drm/nouveau: chan: provide nouveau_channel_kill()
  drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
  drm/nouveau: implement uvmm for user mode bindings
  drm/nouveau: implement new VM_BIND UAPI
  drm/nouveau: debugfs: implement DRM GPU VA debugfs

 Documentation/gpu/driver-uapi.rst             |   11 +
 Documentation/gpu/drm-mm.rst                  |   43 +
 drivers/gpu/drm/Kconfig                       |    6 +
 drivers/gpu/drm/Makefile                      |    3 +
 drivers/gpu/drm/amd/amdgpu/Kconfig            |    1 +
 drivers/gpu/drm/drm_debugfs.c                 |   56 +
 drivers/gpu/drm/drm_exec.c                    |  294 +++
 drivers/gpu/drm/drm_gem.c                     |    3 +
 drivers/gpu/drm/drm_gpuva_mgr.c               | 1704 +++++++++++++++++
 drivers/gpu/drm/nouveau/Kbuild                |    3 +
 drivers/gpu/drm/nouveau/Kconfig               |    2 +
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   26 +-
 drivers/gpu/drm/nouveau/include/nvif/vmm.h    |   19 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   20 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |   23 +
 drivers/gpu/drm/nouveau/nouveau_abi16.h       |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  152 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h          |    2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        |   16 +-
 drivers/gpu/drm/nouveau/nouveau_chan.h        |    1 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   24 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   26 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |   92 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c        |  322 ++++
 drivers/gpu/drm/nouveau/nouveau_exec.h        |   39 +
 drivers/gpu/drm/nouveau/nouveau_fence.c       |    7 +
 drivers/gpu/drm/nouveau/nouveau_fence.h       |    2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   57 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h         |    5 +
 drivers/gpu/drm/nouveau/nouveau_prime.c       |    2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |  467 +++++
 drivers/gpu/drm/nouveau/nouveau_sched.h       |   96 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         |    2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 1536 +++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |  138 ++
 drivers/gpu/drm/nouveau/nouveau_vmm.c         |    4 +-
 drivers/gpu/drm/nouveau/nvif/vmm.c            |  100 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  213 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  197 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   25 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgf100.c    |   16 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   16 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c |   27 +-
 include/drm/drm_debugfs.h                     |   25 +
 include/drm/drm_drv.h                         |    6 +
 include/drm/drm_exec.h                        |  144 ++
 include/drm/drm_gem.h                         |   75 +
 include/drm/drm_gpuva_mgr.h                   |  714 +++++++
 include/linux/maple_tree.h                    |   27 +-
 include/uapi/drm/nouveau_drm.h                |  220 +++
 lib/maple_tree.c                              |    7 +-
 51 files changed, 6808 insertions(+), 209 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
 create mode 100644 include/drm/drm_exec.h
 create mode 100644 include/drm/drm_gpuva_mgr.h


base-commit: 48075a66fca613477ac1969b576a93ef5db0164f
-- 
2.39.1

