Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978EA9E3BB6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 14:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3626310E1A5;
	Wed,  4 Dec 2024 13:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 543 seconds by postgrey-1.36 at gabe;
 Wed, 04 Dec 2024 13:53:21 UTC
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D97710E1A5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 13:53:21 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, Maxime Ripard <mripard@kernel.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting cgroup.
Date: Wed,  4 Dec 2024 14:44:00 +0100
Message-ID: <20241204134410.1161769-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.43.0
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

New update. Instead of calling it the 'dev' cgroup, it's now the 'dmem' cgroup.

Because it only deals with memory regions, the UAPI has been updated to use dmem.min/low/max/current, and to make the API cleaner, the names are changed too.

dmem.current could contain a line like:
"drm/0000:03:00.0/vram0 1073741824"

But I think using "drm/card0/vram0" instead of PCIID would perhaps be good too. I'm open to changing it to that based on feedback.

I've created an IGT test for min and max, and found the changes
from Friedrich Vock sent as feedback were needed.
I've integrated those into the first patch.

Maarten Lankhorst (5):
  kernel/cgroup: Add "dmem" memory accounting cgroup
  drm/ttm: Handle cgroup based eviction in TTM
  drm/xe: Implement cgroup for vram
  drm/amdgpu: Add cgroups implementation
  drm/xe: Hack to test with mapped pages instead of vram.

Maxime Ripard (2):
  drm/drv: Add drmm managed registration helper for dmem cgroups.
  drm/gem: Add cgroup memory accounting for VRAM helper.

 Documentation/admin-guide/cgroup-v2.rst       |  58 +-
 Documentation/core-api/cgroup.rst             |   9 +
 Documentation/core-api/index.rst              |   1 +
 Documentation/gpu/drm-compute.rst             |  54 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   4 +
 drivers/gpu/drm/drm_drv.c                     |  32 +
 drivers/gpu/drm/drm_gem_vram_helper.c         |  15 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  18 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |   4 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  54 +-
 drivers/gpu/drm/ttm/ttm_resource.c            |  23 +-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |   5 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   8 +
 include/drm/drm_drv.h                         |   5 +
 include/drm/ttm/ttm_resource.h                |  12 +-
 include/linux/cgroup_dmem.h                   |  67 ++
 include/linux/cgroup_subsys.h                 |   4 +
 include/linux/page_counter.h                  |   2 +-
 init/Kconfig                                  |  10 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/dmem.c                          | 861 ++++++++++++++++++
 mm/page_counter.c                             |   4 +-
 23 files changed, 1219 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/core-api/cgroup.rst
 create mode 100644 Documentation/gpu/drm-compute.rst
 create mode 100644 include/linux/cgroup_dmem.h
 create mode 100644 kernel/cgroup/dmem.c

-- 
2.43.0
