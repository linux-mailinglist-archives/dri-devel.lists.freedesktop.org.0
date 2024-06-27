Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D938F91AC0E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A9010EB0E;
	Thu, 27 Jun 2024 15:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B7610E6AA;
 Thu, 27 Jun 2024 15:57:54 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [RFC PATCH 0/6] DRM resource management cgroup, try 2.
Date: Thu, 27 Jun 2024 17:47:19 +0200
Message-ID: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

A new version of my attempt at managing VRAM through cgroups.
Even though it's called the DRM resource management cgroup, it would be trivial
to rename it to devmem or whatever, since there is nothing DRM specific about it.

This series allows setting limits on VRAM similar to system memory,
with min/low/max limits.
This allows various cgroups to have their own limits for usage.

It sounds very abstract, but it can be used to prioritise the foreground
application (by setting low), or hard partition memory so multiple processes
sharing a single GPU use a proportional amount of memory each in a fair way,
or to prevent long running compute jobs from having their memory evicted.

This is a minimal proof of concept to get discussion going again. It works,
but it only tracks active use of VRAM. In the ideal world, we would track
it better in a way that also integrates better with the memory cgroup
controller. Ideally for every VRAM allocation, we would know we could push
it out to swap if needed, charging the original process not the process evicting.

I'm hoping to restart the discussion, so that we can plug the holes and finally move forward.

New in this version:
- Complete rewrite using page_counter.
- Support setting min/low/max, respected in the same way as memory cgroup.
  (Could be useful to add/allow high? To go over limit for temporary bindings
   during eviction on GART.)
- Locking reworked. Fastpath should now be lockless with RCU.
- Add a second implementation for AMD, to show how easy it is to make it work.
  (Should we completely move this to TTM instead?)
- TTM now always respects min/low when evicting, bailing out with -ENOSPC instead
  where required.

I'm hoping for some good feedback on the path forward for upstreaming. I feel this
version has a lot better chance of being upstreamed than the previous. It should
be a lot more scalable thanks to the usage of RCU and page_counter.

Cheers,
Maarten

Maarten Lankhorst (6):
  mm/page_counter: Move calculating protection values to page_counter
  drm/cgroup: Add memory accounting DRM cgroup
  drm/ttm: Handle cgroup based eviction in TTM
  drm/xe: Implement cgroup for vram
  drm/amdgpu: Add cgroups implementation
  drm/xe: Hack to test with mapped pages instead of vram.

 Documentation/admin-guide/cgroup-v2.rst       |  51 ++
 Documentation/gpu/drm-compute.rst             |  54 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  18 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  38 +-
 drivers/gpu/drm/ttm/ttm_resource.c            |  28 +-
 drivers/gpu/drm/xe/xe_device.c                |   4 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |  14 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  10 +
 include/drm/ttm/ttm_bo.h                      |   3 +-
 include/drm/ttm/ttm_resource.h                |  16 +-
 include/linux/cgroup_drm.h                    | 115 +++
 include/linux/cgroup_subsys.h                 |   4 +
 include/linux/page_counter.h                  |   4 +
 init/Kconfig                                  |   7 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/drm.c                           | 813 ++++++++++++++++++
 mm/memcontrol.c                               | 154 +---
 mm/page_counter.c                             | 173 ++++
 23 files changed, 1355 insertions(+), 172 deletions(-)
 create mode 100644 Documentation/gpu/drm-compute.rst
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

-- 
2.45.2

