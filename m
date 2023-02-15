Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507ED69804B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C33510E254;
	Wed, 15 Feb 2023 16:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A511A10E236;
 Wed, 15 Feb 2023 16:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477668; x=1708013668;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=63jEmIdqFGbeZAGy9F/2+7ZHTEwokckWrPhHLYhSYF4=;
 b=lJupWhVks3MWYEcl511pRsqRdLzveROoTFICuH5EdHt+ka8BytduP1Z3
 6OOriuKVapODYjh+++QgVFezfsNZQvIahpaF/jDpxM1fY6p8GbtLeqEwO
 7eCag19oHSYrw1y/wGaNPpPsttjVPfCWVxahr3SoXeJRQLt5V5epGCz+d
 VMAla4gN5/nYEGJ6wb940UmodoXI7/xGKIHSMs0bxhPzoNYhE57wK/khP
 mQ+4du4vR6a4A942mA72MXOpU4NB3DvqVZhIrkzHBK7ZmMz0jJMA40dEz
 jd3BggPmMKRzUyPbjx9q/eQljazG0hf07+T+oKgaJjVrTDB8lR6PttCtb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393870616"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393870616"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:14:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758471611"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758471611"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:14:22 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 00/16] Add a TTM shrinker
Date: Wed, 15 Feb 2023 17:13:49 +0100
Message-Id: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
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
Cc: Miaohe Lin <linmiaohe@huawei.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, NeilBrown <neilb@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Dave Hansen <dave.hansen@intel.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 linux-graphics-maintainer@vmware.com, Peter Xu <peterx@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces a TTM shrinker.

Currently the TTM subsystem allows a certain watermark fraction of
system memory to be pinned by GPUs. Any allocation beyond that will
cause TTM to attempt to copy memory to shmem objects for possible
later swapout so that that fraction is fulfilled. That unnecessarily
happens also on systems where swapping is not available, but still
works reasonably well in many cases.

However there is no way for the system to swap out all of graphics
memory even in situatons where graphics processes are suspended.

So add a TTM shrinker capable of moving graphics memory pages to the
swap cache for later laundring and free, and, in the case there is no
swap available, freeing graphics memory that is kept around for
caching purposes.

For devices where the shrinker is active, the watermark
fraction is disabled, but for devices not (yet) supporting shrinking
or using dma_alloced memory which we can't insert into the swap-cache,
keep it around.

Each driver needs to implement a callback to enable the shrinker for
its devices. Enable it for i915 as a POC. Will also be used by the
new Intel xe driver if accepted.

The parts of the series mostly needing consideration and feecback is

*) The mm part, inserting pages into the swap-cache. Is it acceptable and,
   if so, correct? It *might* be possible we can do without this part,
   but then we'd have to be able to call read_mapping_page() and
   trylock_page() on non-isolated shmem pages from reclaim context,
   and need to be able to recover from failures.

*) The TTM driver callback for shrinking

*) The additional TTM functions to mark buffer-objects as not needed, but
   good to have around for caching purposes.

*) Swapin doesn't lose content on error and is also interruptible or at
   least killable ATM. This complicates helpers. Should we
   drop this and just drop content on error, and wait for swapin
   uninterruptible? The TTM pool code could indeed do without additional
   complication...

*) Is there a better way to do shrink throttling to avoid filling the
   swap-cache completely.

*) Is it good enough for real-world workloads?

The series has been tested using the i915 driver with a 4GiB
VRAM DG1 on a system with 14GiB system memory and 16GiB SSD Swap, and using
an old igt-gpu-tools version, 8c0bb07b7b4d, of gem_lmem_swapping
which overcommits system memory quite extensively

Patch walkthrough:

Initial bugfixes, could be decoupled from the series.
drm/ttm: Fix a NULL pointer dereference.
drm/ttm/pool: Fix ttm_pool_alloc error path.

Cleanups and restructuring:
drm/ttm: Use the BIT macro for the TTM_TT_FLAGs
drm/ttm, drm/vmwgfx: Update the TTM swapout interface
drm/ttm: Unexport ttm_global_swapout()

Adding shrinker without enabling it:
drm/ttm: Don't use watermark accounting on shrinkable pools
drm/ttm: Reduce the number of used allocation orders for TTM pages
drm/ttm: Add a shrinker and shrinker accounting
drm/ttm: Introduce shrink throttling
drm/ttm: Remove pinned bos from shrinkable accounting
drm/ttm: Add a simple api to set/ clear purgeable ttm_tt content

Adding the core mm part to insert and read-back pages from the swap-cache:
mm: Add interfaces to back up and recover folio contents using swap.

TTM helpers for shrinking:
drm/ttm: Make the call to ttm_tt_populate() interruptible when faulting.
drm/ttm: Provide helpers for shrinking.
drm/ttm: Use fault-injection to test error paths.

Enable i915:
drm/i915, drm/ttm: Use the TTM shrinker rather than the external shmem pool

Any feedback greatly appreciated.
Thomas

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: NeilBrown <neilb@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: <linux-graphics-maintainer@vmware.com>
Cc: <linux-mm@kvack.org>
Cc: <intel-gfx@lists.freedesktop.org>


Thomas Hellström (16):
  drm/ttm: Fix a NULL pointer dereference
  drm/ttm/pool: Fix ttm_pool_alloc error path
  drm/ttm: Use the BIT macro for the TTM_TT_FLAGs
  drm/ttm, drm/vmwgfx: Update the TTM swapout interface
  drm/ttm: Unexport ttm_global_swapout()
  drm/ttm: Don't use watermark accounting on shrinkable pools
  drm/ttm: Reduce the number of used allocation orders for TTM pages
  drm/ttm: Add a shrinker and shrinker accounting
  drm/ttm: Introduce shrink throttling.
  drm/ttm: Remove pinned bos from shrinkable accounting
  drm/ttm: Add a simple api to set / clear purgeable ttm_tt content
  mm: Add interfaces to back up and recover folio contents using swap
  drm/ttm: Make the call to ttm_tt_populate() interruptible when
    faulting
  drm/ttm: Provide helpers for shrinking
  drm/ttm: Use fault-injection to test error paths
  drm/i915, drm/ttm: Use the TTM shrinker rather than the external shmem
    pool

 drivers/gpu/drm/Kconfig                       |  11 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   6 -
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 -
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 273 ++-------
 drivers/gpu/drm/i915/i915_gem.c               |   3 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  45 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  19 +-
 drivers/gpu/drm/ttm/ttm_device.c              |  85 ++-
 drivers/gpu/drm/ttm/ttm_pool.c                | 522 ++++++++++++++++--
 drivers/gpu/drm/ttm/ttm_tt.c                  | 336 +++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   3 +-
 include/drm/ttm/ttm_bo.h                      |   4 +-
 include/drm/ttm/ttm_device.h                  |  36 +-
 include/drm/ttm/ttm_pool.h                    |  19 +
 include/drm/ttm/ttm_tt.h                      |  57 +-
 include/linux/swap.h                          |  10 +
 mm/Kconfig                                    |  18 +
 mm/Makefile                                   |   2 +
 mm/swap_backup_folio.c                        | 178 ++++++
 mm/swap_backup_folio_test.c                   | 111 ++++
 21 files changed, 1361 insertions(+), 388 deletions(-)
 create mode 100644 mm/swap_backup_folio.c
 create mode 100644 mm/swap_backup_folio_test.c

-- 
2.34.1

