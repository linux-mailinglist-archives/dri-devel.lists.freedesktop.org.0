Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB181B70F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 14:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353E710E6CE;
	Thu, 21 Dec 2023 13:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D7810E6C9;
 Thu, 21 Dec 2023 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703164363; x=1734700363;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QSOjoEbB8/433LtyJ7GGVvd7TWmC8vJSHwhnl322DEk=;
 b=WjyWGvb9Uek8k6Slrk2dHi/RUgQBkBTHP7IoFKXES0Gi1FiEifc4pSaJ
 gBHG9C8Ewq+A5Z+vQ3iNa7F1E1Wa3MGLy+IhLHOJGxWOHJ3ZJJ+ovTLd3
 lNrDgs7h7WwZAsV54ZakahVkCDNro7rJEdx2mefKadvK/DWlyloDc03TH
 Mlyn8/KtAgMFqP0/HgjpL3mzdli0RD0xObIUlZkjTJhunetfTHAIgLueH
 qtRzEhChUprMei4MLuEUWdix2MHWDxNHIuPY7d3XfVTo0U9iY7rB7oZYq
 poiTCwBM/R0FzQAvnSBC/UTvMMVZtdrVK2O7uw7NGxXoUMqYMhqUZZTAN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427123865"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427123865"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 05:12:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="24953399"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.203])
 ([10.249.254.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 05:12:40 -0800
Message-ID: <9e9df7dc-5b6f-8eeb-4580-51244c135946@linux.intel.com>
Date: Thu, 21 Dec 2023 14:12:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/11] Introduce drm evictable lru
To: Oak Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20231102043306.2931989-1-oak.zeng@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231102043306.2931989-1-oak.zeng@intel.com>
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
Cc: felix.kuehling@amd.com, brian.welty@intel.com, airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oak, Christian

On 11/2/23 05:32, Oak Zeng wrote:
> We plan to implement xe driver's shared virtual memory
> manager (aka SVM) without buffer object concept. This
> means we won't build our shared virtual memory manager
> upon TTM infrastructure like amdgpu does.
>
> Even though this approach is more efficient, it does
> create a problem for memory eviction when there is
> memory pressure: memory allocated by SVM and memory
> allocated by TTM should be able to mutually evict
> from each other. TTM's resource manager maintains
> a LRU list for each memory type and this list is used
> to pick up the memory eviction victim. Since we don't
> use TTM for SVM implementation, SVM allocated memory
> can't be added to TTM resource manager's LRU list. Thus
> SVM allocated memory and TTM allocated memory are not
> mutually evictable.
>
> See more discussion on this topic here:
> https://www.spinics.net/lists/dri-devel/msg410740.html
>
> This series solve this problem by creating a shared
> LRU list b/t SVM and TTM, or any other resource manager.
>
> The basic idea is, abstract a drm_lru_entity structure
> which is supposed to be embedded in ttm_resource structure,
> or any other resource manager. The resource LRU list is a
> list of drm_lru_entity. drm_lru_entity has eviction function
> pointers which can be used to call back drivers' specific
> eviction function to evict a memory resource.
>
> Introduce global drm_lru_manager to struct drm_device
> to manage LRU lists. Each memory type or memory region
> can have a LRU list. TTM resource manager's LRU list functions
> including bulk move functions are moved to drm lru manager.
> drm lru manager provides a evict_first function to evict
> the first memory resource from LRU list. This function can
> be called from TTM, SVM or any other resource manager, so
> all the memory allocated in the drm sub-system can be mutually
> evicted.
>
> The lru_lock is also moved from struct ttm_device to struct
> drm_device.
>
> Opens:
> 1) memory accounting: currently the ttm resource manager's
> memory accounting functions is kept at ttm resource manager.
> Since memory accounting should be cross TTM and SVM, it should
> be ideally in the drm lru manager layer. This will be polished
> in the future.
>
> 2) eviction callback function interface: The current eviction
> function interface is designed to meet TTM memory eviction
> requirements. When SVM is in the picture, this interface
> need to be futher tunned to meet SVM requirement also.
>
> This series is not tested and it is only compiled for xe
> driver. Some minor changes are needed for other driver
> such as amdgpu, nouveau etc. I intended to send this out
> as a request for comment series to get some early feedback,
> to see whether this is the right direction to go. I will
> futher polish this series after a direction is agreed.
>
> Oak Zeng (11):
>    drm/ttm: re-parameter ttm_device_init
>    drm: move lru_lock from ttm_device to drm_device
>    drm: introduce drm evictable LRU
>    drm: Add evict function pointer to drm lru entity
>    drm: Replace ttm macros with drm macros
>    drm/ttm: Set lru manager to ttm resource manager
>    drm/ttm: re-parameterize a few ttm functions
>    drm: Initialize drm lru manager
>    drm/ttm: Use drm LRU manager iterator
>    drm/ttm: Implement ttm memory evict functions
>    drm/ttm: Write ttm functions using drm lru manager functions
>
>   drivers/gpu/drm/Makefile                      |   1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |   6 +
>   .../gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c   |   6 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  10 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  10 +-
>   drivers/gpu/drm/drm_drv.c                     |   1 +
>   drivers/gpu/drm/drm_evictable_lru.c           | 266 ++++++++++++++++++
>   drivers/gpu/drm/drm_gem_vram_helper.c         |  10 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   6 +-
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  10 +
>   drivers/gpu/drm/i915/intel_region_ttm.c       |   4 +-
>   drivers/gpu/drm/i915/selftests/mock_region.c  |   2 +-
>   drivers/gpu/drm/loongson/lsdc_ttm.c           |  10 +-
>   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  22 +-
>   drivers/gpu/drm/qxl/qxl_ttm.c                 |   6 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c           |  10 +-
>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   |   2 +-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |   2 +-
>   drivers/gpu/drm/ttm/ttm_bo.c                  | 247 ++++++++++++----
>   drivers/gpu/drm/ttm/ttm_bo_util.c             |  20 +-
>   drivers/gpu/drm/ttm/ttm_bo_vm.c               |   2 +-
>   drivers/gpu/drm/ttm/ttm_device.c              |  55 ++--
>   drivers/gpu/drm/ttm/ttm_module.h              |   3 +-
>   drivers/gpu/drm/ttm/ttm_range_manager.c       |  14 +-
>   drivers/gpu/drm/ttm/ttm_resource.c            | 242 +++-------------
>   drivers/gpu/drm/ttm/ttm_sys_manager.c         |   8 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |   2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.h            |   2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   6 +-
>   .../gpu/drm/vmwgfx/vmwgfx_system_manager.c    |   6 +
>   drivers/gpu/drm/xe/xe_bo.c                    |  48 ++--
>   drivers/gpu/drm/xe/xe_bo.h                    |   5 +-
>   drivers/gpu/drm/xe/xe_device.c                |   2 +-
>   drivers/gpu/drm/xe/xe_dma_buf.c               |   4 +-
>   drivers/gpu/drm/xe/xe_exec.c                  |   6 +-
>   drivers/gpu/drm/xe/xe_migrate.c               |   6 +-
>   drivers/gpu/drm/xe/xe_res_cursor.h            |  10 +-
>   drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |   8 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  18 +-
>   drivers/gpu/drm/xe/xe_vm.c                    |   6 +-
>   drivers/gpu/drm/xe/xe_vm_types.h              |   2 +-
>   include/drm/drm_device.h                      |  12 +
>   include/drm/drm_evictable_lru.h               | 260 +++++++++++++++++
>   include/drm/ttm/ttm_bo.h                      |  10 +-
>   include/drm/ttm/ttm_device.h                  |  13 +-
>   include/drm/ttm/ttm_range_manager.h           |  17 +-
>   include/drm/ttm/ttm_resource.h                | 117 +++-----
>   49 files changed, 1042 insertions(+), 501 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_evictable_lru.c
>   create mode 100644 include/drm/drm_evictable_lru.h
>
Some additional comments after looking through this patchset and the 
comments.

1) General: IMO a good start.

2) Where should this reside? I'm not a big fan of *prescribing* that a 
component should be part of a specific device structure. IMO that leads 
to dumping the whole drm namespace into this component rather than to 
keep it isolated with as few dependencies as possible. I would make the 
part that should reside in the drm device a "struct drm_lru_device", and 
the resource base class a "struct drm_lru_resource". Whether the drm 
device then wants to embed the struct drm_lru_device (nice if you need 
this component) or have a pointer to it (nice if you don't need this 
component) and whether the ttm_device should subclass the drm device 
becomes pretty orthogonal to the actual implementation, and we'd avoid 
hard to follow code cross-references all over the place. The drm_gpuvm 
IMO did a good job with this, but I know there are other opinions on 
this, and I don't want it to become a blocker.

3) Christian's comment about cursors into the LRU for LRU traversal restart
This is quickly becoming a must for the Xe driver, and a very-nice to 
have for a working TTM shrinker, but I think we should start to bring 
what we have in TTM currently over and do the cursors as a separate 
task. I have it pretty much on top of my priority list currently. Both 
downstream i915 and drm_gpuvm have a way to handle this nicely by 
permutating the LRU list just before the lock needs to be released, so I 
was thinking something similar. The complication would be the bulk move 
tracking.

4) The struct drm_lru_evict_ctx - This one needs to be common across all 
users since it's set up by the evictor and used by the evictee ops.

/Thomas


