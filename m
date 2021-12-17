Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8AE478E79
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D3B112872;
	Fri, 17 Dec 2021 14:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F7D112871;
 Fri, 17 Dec 2021 14:52:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="300540399"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="300540399"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 06:52:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="506789744"
Received: from olindum-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.180])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 06:52:43 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/7] drm/i915: Asynchronous vma unbinding
Date: Fri, 17 Dec 2021 15:52:21 +0100
Message-Id: <20211217145228.10987-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series introduces infrastructure for asynchronous vma
unbinding. The single enabled use-case is initially at buffer object
migration where we otherwise sync when unbinding vmas before migration.
This in theory allows us to pipeline any number of migrations, but in
practice the number is restricted by a sync wait when filling the
migration context ring. We might want to look at that moving forward if
needed.

The other main use-case is to be able to pipeline vma evictions, for
example with softpinning where a new vma wants to reuse the vm range
of an already active vma. We can't support this just yet because we
need dma_resv locking around vma eviction for that, which is under
implementation.

Patch 1 and 2 are mainly a fix and a subsequent rearrangement of code,
Patch 3 is needed for consistent bind locking,
Patch 4 introduces vma resource first for error capture purposes.
Patch 5 changes the vm backend interface to take vma resources rather than vmas,
Patch 6 introduces the async unbinding itself, and finally
Patch 7 realizes we have duplicated functionality and removes the vma snapshots.

v2:
-- Some kernel test robot reports addressed.
-- kmem cache for vma resources, See patch 6
-- Various fixes all over the place. See separate commit messages.
v3:
-- Re-add a missing i915_vma_resource_put()
-- Remove a stray debug printout

Thomas Hellström (7):
  drm/i915: Avoid using the i915_fence_array when collecting
    dependencies
  drm/i915: Break out the i915_deps utility
  drm/i915: Require the vm mutex for i915_vma_bind()
  drm/i915: Initial introduction of vma resources
  drm/i915: Use the vma resource as argument for gtt binding / unbinding
  drm/i915: Use vma resources for async unbinding
  drm/i915: Use struct vma_resource instead of struct vma_snapshot

 drivers/gpu/drm/i915/Makefile                 |   3 +-
 drivers/gpu/drm/i915/display/intel_dpt.c      |  27 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  67 ++-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  27 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 304 ++------------
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  37 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  19 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  37 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   9 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  72 ++--
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   4 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  18 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c       |  24 +-
 drivers/gpu/drm/i915/gt/intel_migrate.h       |   9 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  22 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   3 +-
 drivers/gpu/drm/i915/i915_deps.c              | 244 +++++++++++
 drivers/gpu/drm/i915/i915_deps.h              |  46 +++
 drivers/gpu/drm/i915/i915_drv.h               |   1 +
 drivers/gpu/drm/i915/i915_gem.c               |   3 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |  87 ++--
 drivers/gpu/drm/i915/i915_module.c            |   3 +
 drivers/gpu/drm/i915/i915_request.c           |  34 +-
 drivers/gpu/drm/i915/i915_request.h           |   8 +-
 drivers/gpu/drm/i915/i915_vma.c               | 214 +++++++++-
 drivers/gpu/drm/i915/i915_vma.h               |  33 +-
 drivers/gpu/drm/i915/i915_vma_resource.c      | 387 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma_resource.h      | 232 +++++++++++
 drivers/gpu/drm/i915/i915_vma_snapshot.c      | 134 ------
 drivers/gpu/drm/i915/i915_vma_snapshot.h      | 112 -----
 drivers/gpu/drm/i915/i915_vma_types.h         |   5 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 159 ++++---
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  12 +-
 35 files changed, 1571 insertions(+), 840 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_deps.c
 create mode 100644 drivers/gpu/drm/i915/i915_deps.h
 create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.c
 create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.h
 delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
 delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h

-- 
2.31.1

