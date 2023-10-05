Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C097B9C35
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 11:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35E410E1CF;
	Thu,  5 Oct 2023 09:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08EA10E1CF;
 Thu,  5 Oct 2023 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696498568; x=1728034568;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=s+8GEIU8kbyVPJj5X0oIaH9jUge71VFa1cd57LE7Cdg=;
 b=DKHIg4RL9s1TWwFr5J8M5ELL3RnbYrQhB/mIgpdn/F7IK4CrwUOvVxC7
 LeuJ2u8RKq6oUtyjIMCRgC/pZ3Rn3A9bFYXteoxwqZ5xyy3keVIS8zTpV
 YSh6wltJ5CzDupuY6ZqUU43kTniIQDn30tTCyIgEZIjCSo0dWnVWnnYL7
 Vuci1bDF1PUQmDwzLIiSsa9KGcZNh7BiR26gMEgAFyJRU9XOGHPJDJxjL
 ZaXw0LuYElayoT3cHfgVH3N0vNe23kIah58+BrtkzdRKdKwt3GFCYvgpU
 xTSiysheuBNZwVnD8P3N4dg7VJqd62YmbCzf5ajqMXJgMNFq1EzpQ2dm0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368525746"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="368525746"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 02:36:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="822058580"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="822058580"
Received: from vstill-mobl.ger.corp.intel.com (HELO [10.249.254.26])
 ([10.249.254.26])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 02:36:01 -0700
Message-ID: <95bfbf5c-286c-57a4-0170-19d775cf8d6b@linux.intel.com>
Date: Thu, 5 Oct 2023 11:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v5 0/6] [RFC] DRM GPUVM features
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20230928191624.13703-1-dakr@redhat.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230928191624.13703-1-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Danilo

On 9/28/23 21:16, Danilo Krummrich wrote:
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
>     this GPU-VM.
>
> 2) Provide tracking of external GEM objects (GEM objects which are
>     shared with other GPU-VMs).
>
> 3) Provide functions to efficiently lock all GEM objects dma-resv the
>     GPU-VM contains mappings of.
>
> 4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
>     of, such that validation of evicted GEM objects is accelerated.
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
>    - rename 'drm_gpuva_manager' -> 'drm_gpuvm' which generally leads to more
>      consistent naming
>    - properly separate commits (introduce common dma-resv, drm_gpuvm_bo
>      abstraction, etc.)
>    - remove maple tree for tracking external objects, use a list drm_gpuvm_bos
>      per drm_gpuvm instead
>    - rework dma-resv locking helpers (Thomas)
>    - add a locking helper for a given range of the VA space (Christian)
>    - make the GPUVA manager buildable as module, rather than drm_exec
>      builtin (Christian)
>
> Changes in V3:
> ==============
>    - rename missing function and files (Boris)
>    - warn if vm_obj->obj != obj in drm_gpuva_link() (Boris)
>    - don't expose drm_gpuvm_bo_destroy() (Boris)
>    - unlink VM_BO from GEM in drm_gpuvm_bo_destroy() rather than
>      drm_gpuva_unlink() and link within drm_gpuvm_bo_obtain() to keep
>      drm_gpuvm_bo instances unique
>    - add internal locking to external and evicted object lists to support drivers
>      updating the VA space from within the fence signalling critical path (Boris)
>    - unlink external objects and evicted objects from the GPUVM's list in
>      drm_gpuvm_bo_destroy()
>    - add more documentation and fix some kernel doc issues
>
> Changes in V4:
> ==============
>    - add a drm_gpuvm_resv() helper (Boris)
>    - add a drm_gpuvm::<list_name>::local_list field (Boris)
>    - remove drm_gpuvm_bo_get_unless_zero() helper (Boris)
>    - fix missing NULL assignment in get_next_vm_bo_from_list() (Boris)
>    - keep a drm_gem_object reference on potential vm_bo destroy (alternatively we
>      could free the vm_bo and drop the vm_bo's drm_gem_object reference through
>      async work)
>    - introduce DRM_GPUVM_RESV_PROTECTED flag to indicate external locking through
>      the corresponding dma-resv locks to optimize for drivers already holding
>      them when needed; add the corresponding lock_assert_held() calls (Thomas)
>    - make drm_gpuvm_bo_evict() per vm_bo and add a drm_gpuvm_bo_gem_evict()
>      helper (Thomas)
>    - pass a drm_gpuvm_bo in drm_gpuvm_ops::vm_bo_validate() (Thomas)
>    - documentation fixes
>
> Changes in V5:
> ==============
>    - use a root drm_gem_object provided by the driver as a base for the VM's
>      common dma-resv (Christian)
>    - provide a helper to allocate a "dummy" root GEM object in case a driver
>      specific root GEM object isn't available
>    - add a dedicated patch for nouveau to make use of the GPUVM's shared dma-resv
>    - improve documentation (Boris)
>    - the following patches are removed from the series, since they already landed
>      in drm-misc-next
>      - f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm")
>      - fe7acaa727e1 ("drm/gpuvm: allow building as module")
>      - 78f54469b871 ("drm/nouveau: uvmm: rename 'umgr' to 'base'")
>
> Danilo Krummrich (6):
>    drm/gpuvm: add common dma-resv per struct drm_gpuvm
>    drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
>    drm/gpuvm: add an abstraction for a VM / BO combination
>    drm/gpuvm: track/lock/validate external/evicted objects
>    drm/nouveau: make use of the GPUVM's shared dma-resv
>    drm/nouveau: use GPUVM common infrastructure
>
>   drivers/gpu/drm/drm_gpuvm.c             | 1036 +++++++++++++++++++++--
>   drivers/gpu/drm/nouveau/nouveau_bo.c    |   15 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.h    |    5 +
>   drivers/gpu/drm/nouveau/nouveau_exec.c  |   52 +-
>   drivers/gpu/drm/nouveau/nouveau_exec.h  |    4 -
>   drivers/gpu/drm/nouveau/nouveau_gem.c   |   10 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.h |    4 +-
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  183 ++--
>   drivers/gpu/drm/nouveau/nouveau_uvmm.h  |    1 -
>   include/drm/drm_gem.h                   |   32 +-
>   include/drm/drm_gpuvm.h                 |  465 +++++++++-
>   11 files changed, 1625 insertions(+), 182 deletions(-)
>
>
> base-commit: a4ead6e37e3290cff399e2598d75e98777b69b37

One comment I had before on the GPUVM code in general was the licensing, 
but I'm not sure there was a reply. Is it possible to have this code 
dual MIT / GPLV2?

Thanks,

Thomas



