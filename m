Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75FD475678
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637DB10E1BE;
	Wed, 15 Dec 2021 10:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D037B10E1BE;
 Wed, 15 Dec 2021 10:36:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="219214503"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="219214503"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 02:36:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="682442073"
Received: from asparren-mobl2.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.165])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 02:36:25 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: Asynchronous vma unbinding
Date: Wed, 15 Dec 2021 11:36:04 +0100
Message-Id: <20211215103611.777665-1-thomas.hellstrom@linux.intel.com>
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
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  67 +++-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  27 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 303 ++-------------
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  37 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  19 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  37 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   9 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  70 ++--
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   4 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  18 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c       |  24 +-
 drivers/gpu/drm/i915/gt/intel_migrate.h       |   9 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  22 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   3 +-
 drivers/gpu/drm/i915/i915_deps.c              | 249 ++++++++++++
 drivers/gpu/drm/i915/i915_deps.h              |  46 +++
 drivers/gpu/drm/i915/i915_drv.h               |   1 +
 drivers/gpu/drm/i915/i915_gem.c               |   3 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |  87 ++---
 drivers/gpu/drm/i915/i915_request.c           |  34 +-
 drivers/gpu/drm/i915/i915_request.h           |   8 +-
 drivers/gpu/drm/i915/i915_vma.c               | 207 +++++++++-
 drivers/gpu/drm/i915/i915_vma.h               |  33 +-
 drivers/gpu/drm/i915/i915_vma_resource.c      | 357 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma_resource.h      | 223 +++++++++++
 drivers/gpu/drm/i915/i915_vma_snapshot.c      | 134 -------
 drivers/gpu/drm/i915/i915_vma_snapshot.h      | 112 ------
 drivers/gpu/drm/i915/i915_vma_types.h         |   5 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 159 +++++---
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  12 +-
 34 files changed, 1528 insertions(+), 836 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_deps.c
 create mode 100644 drivers/gpu/drm/i915/i915_deps.h
 create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.c
 create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.h
 delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
 delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h

-- 
2.31.1

