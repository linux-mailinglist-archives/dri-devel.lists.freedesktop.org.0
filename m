Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911237B1BC1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 14:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B5210E62F;
	Thu, 28 Sep 2023 12:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1512610E63C;
 Thu, 28 Sep 2023 12:09:18 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5D9386607258;
 Thu, 28 Sep 2023 13:09:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695902956;
 bh=4SQfgoV1qW88VdwbXWTBFfkkuuF4YeX23YRc99KNEf8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T8sH1BElvvUZlZXPA23mY91V+Yqhaxu6Bvch+ZEuK1bv7gIcvF+bTwRfLlikw40f6
 nv88v76dGQZ8Muq+MCWgfQe6ytW/i/SryWr/eAsdypH5Anwtp61sW9U+NK6t9nqPMY
 P89TovH+DkO0PS7ML+R+GzNQurINj4S2iOK0pDz/ME/EaCg/1hc4697QKVxIUYQV6C
 b1x58dGL5SXPUGGwF9w2Fq5c7QY1HfzXtlPL0n4MNlMchTkHiIlv3gllINXgsCc2f6
 pMatOYdwCVNXbwL2Cj8o/qlg9lDg3UgbxQs9eIMm3pcVINx2ODVRCuUxXH8ynsFrkJ
 VNv36VR6ylqig==
Date: Thu, 28 Sep 2023 14:09:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v4 0/8] [RFC] DRM GPUVA Manager GPU-VM
 features
Message-ID: <20230928140913.7cb78ed4@collabora.com>
In-Reply-To: <20230920144343.64830-1-dakr@redhat.com>
References: <20230920144343.64830-1-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Sep 2023 16:42:33 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> So far the DRM GPUVA manager offers common infrastructure to track GPU VA
> allocations and mappings, generically connect GPU VA mappings to their
> backing buffers and perform more complex mapping operations on the GPU VA
> space.
> 
> However, there are more design patterns commonly used by drivers, which
> can potentially be generalized in order to make the DRM GPUVA manager
> represent a basic GPU-VM implementation. In this context, this patch series
> aims at generalizing the following elements.
> 
> 1) Provide a common dma-resv for GEM objects not being used outside of
>    this GPU-VM.
> 
> 2) Provide tracking of external GEM objects (GEM objects which are
>    shared with other GPU-VMs).
> 
> 3) Provide functions to efficiently lock all GEM objects dma-resv the
>    GPU-VM contains mappings of.
> 
> 4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
>    of, such that validation of evicted GEM objects is accelerated.
> 
> 5) Provide some convinience functions for common patterns.
> 
> The implementation introduces struct drm_gpuvm_bo, which serves as abstraction
> combining a struct drm_gpuvm and struct drm_gem_object, similar to what
> amdgpu does with struct amdgpu_bo_vm. While this adds a bit of complexity it
> improves the efficiency of tracking external and evicted GEM objects.
> 
> This patch series also renames struct drm_gpuva_manager to struct drm_gpuvm
> including corresponding functions. This way the GPUVA manager's structures align
> better with the documentation of VM_BIND [1] and VM_BIND locking [2]. It also
> provides a better foundation for the naming of data structures and functions
> introduced for implementing the features of this patch series.
> 
> This patch series is also available at [3].
> 
> [1] Documentation/gpu/drm-vm-bind-async.rst
> [2] Documentation/gpu/drm-vm-bind-locking.rst
> [3] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/gpuvm-next
> 
> Changes in V2:
> ==============
>   - rename 'drm_gpuva_manager' -> 'drm_gpuvm' which generally leads to more
>     consistent naming
>   - properly separate commits (introduce common dma-resv, drm_gpuvm_bo
>     abstraction, etc.)
>   - remove maple tree for tracking external objects, use a list drm_gpuvm_bos
>     per drm_gpuvm instead
>   - rework dma-resv locking helpers (Thomas)
>   - add a locking helper for a given range of the VA space (Christian)
>   - make the GPUVA manager buildable as module, rather than drm_exec
>     builtin (Christian)
> 
> Changes in V3:
> ==============
>   - rename missing function and files (Boris)
>   - warn if vm_obj->obj != obj in drm_gpuva_link() (Boris)
>   - don't expose drm_gpuvm_bo_destroy() (Boris)
>   - unlink VM_BO from GEM in drm_gpuvm_bo_destroy() rather than
>     drm_gpuva_unlink() and link within drm_gpuvm_bo_obtain() to keep
>     drm_gpuvm_bo instances unique
>   - add internal locking to external and evicted object lists to support drivers
>     updating the VA space from within the fence signalling critical path (Boris)
>   - unlink external objects and evicted objects from the GPUVM's list in
>     drm_gpuvm_bo_destroy()
>   - add more documentation and fix some kernel doc issues
> 
> Changes in V4:
> ==============
>   - add a drm_gpuvm_resv() helper (Boris)
>   - add a drm_gpuvm::<list_name>::local_list field (Boris)
>   - remove drm_gpuvm_bo_get_unless_zero() helper (Boris)
>   - fix missing NULL assignment in get_next_vm_bo_from_list() (Boris)
>   - keep a drm_gem_object reference on potential vm_bo destroy (alternatively we
>     could free the vm_bo and drop the vm_bo's drm_gem_object reference through
>     async work)
>   - introduce DRM_GPUVM_RESV_PROTECTED flag to indicate external locking through
>     the corresponding dma-resv locks to optimize for drivers already holding
>     them when needed; add the corresponding lock_assert_held() calls (Thomas)
>   - make drm_gpuvm_bo_evict() per vm_bo and add a drm_gpuvm_bo_gem_evict()
>     helper (Thomas)
>   - pass a drm_gpuvm_bo in drm_gpuvm_ops::vm_bo_validate() (Thomas)
>   - documentation fixes
> 
> Danilo Krummrich (8):
>   drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm
>   drm/gpuvm: allow building as module
>   drm/nouveau: uvmm: rename 'umgr' to 'base'
>   drm/gpuvm: add common dma-resv per struct drm_gpuvm
>   drm/gpuvm: add an abstraction for a VM / BO combination
>   drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
>   drm/gpuvm: generalize dma_resv/extobj handling and GEM validation

Tested-by: Boris Brezillon <boris.brezillon@collabora.com>

>   drm/nouveau: GPUVM dma-resv/extobj handling, GEM validation
> 
>  drivers/gpu/drm/Kconfig                   |    7 +
>  drivers/gpu/drm/Makefile                  |    2 +-
>  drivers/gpu/drm/drm_debugfs.c             |   16 +-
>  drivers/gpu/drm/drm_gpuva_mgr.c           | 1725 --------------
>  drivers/gpu/drm/drm_gpuvm.c               | 2600 +++++++++++++++++++++
>  drivers/gpu/drm/nouveau/Kconfig           |    1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.c      |    4 +-
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_exec.c    |   52 +-
>  drivers/gpu/drm/nouveau/nouveau_exec.h    |    4 -
>  drivers/gpu/drm/nouveau/nouveau_gem.c     |    5 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.h   |    4 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c    |  207 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.h    |    8 +-
>  include/drm/drm_debugfs.h                 |    6 +-
>  include/drm/drm_gem.h                     |   32 +-
>  include/drm/drm_gpuva_mgr.h               |  706 ------
>  include/drm/drm_gpuvm.h                   | 1142 +++++++++
>  18 files changed, 3934 insertions(+), 2589 deletions(-)
>  delete mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>  create mode 100644 drivers/gpu/drm/drm_gpuvm.c
>  delete mode 100644 include/drm/drm_gpuva_mgr.h
>  create mode 100644 include/drm/drm_gpuvm.h
> 
> 
> base-commit: 1c7a387ffef894b1ab3942f0482dac7a6e0a909c

