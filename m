Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E686B7DEBC5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6009910E805;
	Thu,  2 Nov 2023 04:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFD810E7F9;
 Thu,  2 Nov 2023 04:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899071; x=1730435071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sbP01WetmXxj7LqBWcsPMb/1xOxKhEIT3oMKfr8mlmo=;
 b=dkEysH/AFc+xkFSAJoj5IjdWqghOzpX64/dJbNW81qIeTW3Ecs3CFRI1
 3fOIsWCR3r35+00P5Gro3yZztLSVxbitspzJJaQNSv9GD46ZQKJ4U8cdB
 +OPSzhIlLZ1WQ82+JwptiC1h1bk4dnl2ZJCj5rtkAI8uQVezmRoDuy0QE
 BGpx3j0VOEJ+tT6iUA/i8DG5y6ZXmsmdv40B+ftraZaE9mkO/NE5iBnwm
 88NS38ct7y1VebJva/65c6Urq4BOKl2/XW74rCimoUbDxYa+m1KfGBgjU
 9WQOd13Gda4fPjPK7EATUyvoEd4lBQMQg0VsWElB/GJc1NlqMLIL1AQ9v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930898"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930898"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762610"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762610"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 00/11] Introduce drm evictable lru
Date: Thu,  2 Nov 2023 00:32:55 -0400
Message-Id: <20231102043306.2931989-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
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
Cc: Thomas.Hellstrom@linux.intel.com, felix.kuehling@amd.com,
 brian.welty@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We plan to implement xe driver's shared virtual memory
manager (aka SVM) without buffer object concept. This
means we won't build our shared virtual memory manager
upon TTM infrastructure like amdgpu does.

Even though this approach is more efficient, it does
create a problem for memory eviction when there is
memory pressure: memory allocated by SVM and memory
allocated by TTM should be able to mutually evict
from each other. TTM's resource manager maintains
a LRU list for each memory type and this list is used
to pick up the memory eviction victim. Since we don't
use TTM for SVM implementation, SVM allocated memory
can't be added to TTM resource manager's LRU list. Thus
SVM allocated memory and TTM allocated memory are not
mutually evictable.

See more discussion on this topic here:
https://www.spinics.net/lists/dri-devel/msg410740.html

This series solve this problem by creating a shared
LRU list b/t SVM and TTM, or any other resource manager.

The basic idea is, abstract a drm_lru_entity structure
which is supposed to be embedded in ttm_resource structure,
or any other resource manager. The resource LRU list is a 
list of drm_lru_entity. drm_lru_entity has eviction function
pointers which can be used to call back drivers' specific
eviction function to evict a memory resource.

Introduce global drm_lru_manager to struct drm_device
to manage LRU lists. Each memory type or memory region
can have a LRU list. TTM resource manager's LRU list functions
including bulk move functions are moved to drm lru manager.
drm lru manager provides a evict_first function to evict
the first memory resource from LRU list. This function can
be called from TTM, SVM or any other resource manager, so
all the memory allocated in the drm sub-system can be mutually
evicted.

The lru_lock is also moved from struct ttm_device to struct 
drm_device.

Opens:
1) memory accounting: currently the ttm resource manager's
memory accounting functions is kept at ttm resource manager.
Since memory accounting should be cross TTM and SVM, it should
be ideally in the drm lru manager layer. This will be polished
in the future.

2) eviction callback function interface: The current eviction
function interface is designed to meet TTM memory eviction
requirements. When SVM is in the picture, this interface
need to be futher tunned to meet SVM requirement also. 

This series is not tested and it is only compiled for xe
driver. Some minor changes are needed for other driver
such as amdgpu, nouveau etc. I intended to send this out
as a request for comment series to get some early feedback,
to see whether this is the right direction to go. I will
futher polish this series after a direction is agreed.

Oak Zeng (11):
  drm/ttm: re-parameter ttm_device_init
  drm: move lru_lock from ttm_device to drm_device
  drm: introduce drm evictable LRU
  drm: Add evict function pointer to drm lru entity
  drm: Replace ttm macros with drm macros
  drm/ttm: Set lru manager to ttm resource manager
  drm/ttm: re-parameterize a few ttm functions
  drm: Initialize drm lru manager
  drm/ttm: Use drm LRU manager iterator
  drm/ttm: Implement ttm memory evict functions
  drm/ttm: Write ttm functions using drm lru manager functions

 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |   6 +
 .../gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c   |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  10 +-
 drivers/gpu/drm/drm_drv.c                     |   1 +
 drivers/gpu/drm/drm_evictable_lru.c           | 266 ++++++++++++++++++
 drivers/gpu/drm/drm_gem_vram_helper.c         |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   6 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  10 +
 drivers/gpu/drm/i915/intel_region_ttm.c       |   4 +-
 drivers/gpu/drm/i915/selftests/mock_region.c  |   2 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c           |  10 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  22 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                 |   6 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           |  10 +-
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   |   2 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 247 ++++++++++++----
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  20 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |   2 +-
 drivers/gpu/drm/ttm/ttm_device.c              |  55 ++--
 drivers/gpu/drm/ttm/ttm_module.h              |   3 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c       |  14 +-
 drivers/gpu/drm/ttm/ttm_resource.c            | 242 +++-------------
 drivers/gpu/drm/ttm/ttm_sys_manager.c         |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h            |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   6 +-
 .../gpu/drm/vmwgfx/vmwgfx_system_manager.c    |   6 +
 drivers/gpu/drm/xe/xe_bo.c                    |  48 ++--
 drivers/gpu/drm/xe/xe_bo.h                    |   5 +-
 drivers/gpu/drm/xe/xe_device.c                |   2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c               |   4 +-
 drivers/gpu/drm/xe/xe_exec.c                  |   6 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   6 +-
 drivers/gpu/drm/xe/xe_res_cursor.h            |  10 +-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |   8 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  18 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   6 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |   2 +-
 include/drm/drm_device.h                      |  12 +
 include/drm/drm_evictable_lru.h               | 260 +++++++++++++++++
 include/drm/ttm/ttm_bo.h                      |  10 +-
 include/drm/ttm/ttm_device.h                  |  13 +-
 include/drm/ttm/ttm_range_manager.h           |  17 +-
 include/drm/ttm/ttm_resource.h                | 117 +++-----
 49 files changed, 1042 insertions(+), 501 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_evictable_lru.c
 create mode 100644 include/drm/drm_evictable_lru.h

-- 
2.26.3

