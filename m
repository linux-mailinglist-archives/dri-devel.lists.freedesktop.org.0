Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D25D7DCD16
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 13:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C2210E11D;
	Tue, 31 Oct 2023 12:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C50F10E11D;
 Tue, 31 Oct 2023 12:38:51 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 548D666073A3;
 Tue, 31 Oct 2023 12:38:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698755930;
 bh=CUoxGhlVd6jYsDuuATdbi+tc7UVUEDIHrFb8+QfclKw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mee3++hIdBgR35N3mIlOJGmWWJ2rINg5K32mJqZ8L2cvLIn86jpMVXWiFXhxYsMF7
 hli4eKV95M0V2qx/8/pxtHleqR344vReYf7nfMRkFhyawXUD/GGbvSyNF1PBTV0PUz
 UmwTqZ2WOB4nPT6sY4iBJ2TFitRfvWZVx5BiXfB6QbahZjS7hvIj7mywPPtnxcgWQs
 zkqbDWGdw93AciSKz6gF0UqdW6blJ7FTc54xSZ4REW/fY75luZR8Y2Zqg8eLXBhm5J
 6xGQCDE9kxO3dr6H/+PpvsufHcMnuEcHZWDM5i/bPbt1bX0SfaiCyR5PsH1wVJA5dP
 KTjxHdeb+V60g==
Date: Tue, 31 Oct 2023 13:38:45 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v7 0/7] [RFC] DRM GPUVM features
Message-ID: <20231031133845.7915c814@collabora.com>
In-Reply-To: <20231023201659.25332-1-dakr@redhat.com>
References: <20231023201659.25332-1-dakr@redhat.com>
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
 faith@gfxstrand.net, donald.robson@imgtec.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Oct 2023 22:16:46 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> Currently GPUVM offers common infrastructure to track GPU VA allocations
> and mappings, generically connect GPU VA mappings to their backing
> buffers and perform more complex mapping operations on the GPU VA space.
> 
> However, there are more design patterns commonly used by drivers, which
> can potentially be generalized in order to make GPUVM represent the
> basis of a VM implementation. In this context, this patch series aims at
> generalizing the following elements.
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
> This patch series is also available at [3].
> 
> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/gpuvm-next
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
> Changes in V5:
> ==============
>   - use a root drm_gem_object provided by the driver as a base for the VM's
>     common dma-resv (Christian)
>   - provide a helper to allocate a "dummy" root GEM object in case a driver
>     specific root GEM object isn't available
>   - add a dedicated patch for nouveau to make use of the GPUVM's shared dma-resv
>   - improve documentation (Boris)
>   - the following patches are removed from the series, since they already landed
>     in drm-misc-next
>     - f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm")
>     - fe7acaa727e1 ("drm/gpuvm: allow building as module")
>     - 78f54469b871 ("drm/nouveau: uvmm: rename 'umgr' to 'base'")
> 
> Changes in V6:
> ==============
>   - add drm_gpuvm_bo::evicted field protected by the drm_gem_object's dma-resv
>     lock (Thomas)
>     - additionally to the original proposal, always use drm_gpuvm_bo::evicted
>       regardless of the used locking scheme and always keep it up to date
>   - remove unneccesary get->put dance in drm_gpuva_unlink() (Thomas)
>   - fix commit message wording (Thomas)
>   - fix kernel doc warnings (kernel test robot)
> 
> Changes in V7:
> ==============
>   - add a patch converting WARN() macros to drm_WARN() variants
>   - allow drivers to pass the number of fences to reserve and the drm_exec flags
>     through struct drm_gpuvm_exec
>   - rename 'root' GEM object to 'resv' GEM object
>   - fix order of private_usage and extobj_usage in drm_gpuvm_resv_add_fence()
>   - always set drm_gpuvm_bo::evicted accordingly
>   - explicitly clear drm_gpuvm_bo from evict list after successful validation
>   - group reference get() calls with pointer assignments
>   - call drm_gem_object_put() after vm_bo_free() callback
>   - make lockdep checks explicit for drm_gpuvm_bo_* functions
>   - improve documentation of struct drm_gpuvm_bo
>   - fix a few documentation typos and style issues
>   - use BIT() instead of shift ops for enum drm_gpuvm_flags
> 
> Danilo Krummrich (7):
>   drm/gpuvm: convert WARN() to drm_WARN() variants
>   drm/gpuvm: add common dma-resv per struct drm_gpuvm
>   drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
>   drm/gpuvm: add an abstraction for a VM / BO combination
>   drm/gpuvm: track/lock/validate external/evicted objects
>   drm/nouveau: make use of the GPUVM's shared dma-resv
>   drm/nouveau: use GPUVM common infrastructure

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
>  drivers/gpu/drm/drm_gpuvm.c             | 1054 +++++++++++++++++++++--
>  drivers/gpu/drm/nouveau/nouveau_bo.c    |   15 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.h    |    5 +
>  drivers/gpu/drm/nouveau/nouveau_exec.c  |   57 +-
>  drivers/gpu/drm/nouveau/nouveau_exec.h  |    4 -
>  drivers/gpu/drm/nouveau/nouveau_gem.c   |   10 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c |    9 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.h |    7 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  189 ++--
>  drivers/gpu/drm/nouveau/nouveau_uvmm.h  |    1 -
>  include/drm/drm_gem.h                   |   32 +-
>  include/drm/drm_gpuvm.h                 |  492 ++++++++++-
>  12 files changed, 1673 insertions(+), 202 deletions(-)
> 
> 
> base-commit: f5b55f32ce4ba953c270b2e9c3f5d4cd6951b1a1

