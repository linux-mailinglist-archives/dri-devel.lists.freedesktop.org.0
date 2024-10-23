Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322B59AC0E8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 10:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E45210E78B;
	Wed, 23 Oct 2024 08:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED9910E784
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:00:54 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 0/7] kernel/cgroups: Add "dev" memory accounting cgroup.
Date: Wed, 23 Oct 2024 09:52:53 +0200
Message-ID: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
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

New submission!
I've added documentation for each call, and integrated the renaming from
drm cgroup to dev cgroup, based on maxime ripard's work.

Maxime has been testing this with dma-buf heaps and v4l2 too, and it seems to work.
In the initial submission, I've decided to only add the smallest enablement possible,
to have less chance of breaking things.

The API has been changed slightly, from "$name region.$regionname=$limit" in a file called
dev.min/low/max to "$subsystem/$name $regionname=$limit" in a file called dev.region.min/low/max.

This hopefully allows us to perhaps extend the API later on with the possibility to
set scheduler weights on the device, like in

https://blogs.igalia.com/tursulin/drm-scheduling-cgroup-controller/

Maarten Lankhorst (5):
  kernel/cgroup: Add "dev" memory accounting cgroup
  drm/ttm: Handle cgroup based eviction in TTM
  drm/xe: Implement cgroup for vram
  drm/amdgpu: Add cgroups implementation
  [HACK] drm/xe: Hack to test with mapped pages instead of vram.

Maxime Ripard (2):
  drm/drv: Add drmm cgroup registration for dev cgroups.
  [DISCUSSION] drm/gem: Add cgroup memory accounting

 Documentation/admin-guide/cgroup-v2.rst       |  51 +
 Documentation/core-api/cgroup.rst             |   9 +
 Documentation/core-api/index.rst              |   1 +
 Documentation/gpu/drm-compute.rst             |  54 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +
 drivers/gpu/drm/drm_drv.c                     |  32 +-
 drivers/gpu/drm/drm_gem.c                     |   4 +
 drivers/gpu/drm/drm_gem_dma_helper.c          |   4 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  18 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |   4 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  57 +-
 drivers/gpu/drm/ttm/ttm_resource.c            |  24 +-
 drivers/gpu/drm/xe/xe_device.c                |   4 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |  14 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  10 +
 include/drm/drm_device.h                      |   4 +
 include/drm/drm_drv.h                         |   4 +
 include/drm/drm_gem.h                         |   2 +
 include/drm/ttm/ttm_resource.h                |  16 +-
 include/linux/cgroup_dev.h                    |  91 ++
 include/linux/cgroup_subsys.h                 |   4 +
 include/linux/page_counter.h                  |   2 +-
 init/Kconfig                                  |   7 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/dev.c                           | 893 ++++++++++++++++++
 mm/page_counter.c                             |   4 +-
 30 files changed, 1307 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/core-api/cgroup.rst
 create mode 100644 Documentation/gpu/drm-compute.rst
 create mode 100644 include/linux/cgroup_dev.h
 create mode 100644 kernel/cgroup/dev.c

-- 
2.45.2

