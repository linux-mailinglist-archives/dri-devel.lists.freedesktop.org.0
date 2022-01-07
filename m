Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435F64878DB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 15:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED4411B14D;
	Fri,  7 Jan 2022 14:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BA111B126;
 Fri,  7 Jan 2022 14:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641565435; x=1673101435;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B8y+lCtuFN85QF63xuaNiIZJb4wn6fUONUNh6zNpPZk=;
 b=ZeAU2RStsCNraynHQrVBvwwrU4otugm34Nv09/O57bk0kwCsSTFBZ6+D
 45uvAeiuUpKRFjVPu1LaxuL8R9xI4fOHYp68uY1z0sh5ZY15+QtGd595q
 ILY/kbbNUzFrMy3jGbqJg1iTFIpzgoTtiVcx9li/U7z7QL0b/hkB1D7be
 dSPVXzkhwHmvAL+PTDdfqTnm8cg3K0g14rD5AnY9Z5ZKb8bpKCbENojlp
 KLcNvJwMS0kw38itfVhQfknRtKVKewkN27WqdeHEo3cU+63VSOJucUIjh
 9ty4BZj4wpBC3dst+wNRP8tVecvF//6g5bKZ8p9NcY2IYpWWuwathtBvG g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="230214611"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="230214611"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 06:23:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="473331620"
Received: from skofoed-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 06:23:52 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/6] drm/i915: Asynchronous vma unbinding 
Date: Fri,  7 Jan 2022 15:23:37 +0100
Message-Id: <20220107142343.56811-1-thomas.hellstrom@linux.intel.com>
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

Patch 1 introduces vma resource first for error capture purposes
Patch 2 changes the vm backend interface to take vma resources rather than vmas
Patch 3 removes and unneeded page pinning
Patch 4 introduces the async unbinding itself, and finally
Patch 5 introduces a selftest
Patch 6 realizes we have duplicated functionality and removes the vma snapshots

v2:
-- Some kernel test robot reports addressed.
-- kmem cache for vma resources, See patch 4
-- Various fixes all over the place. See separate commit messages.
v3:
-- Re-add a missing i915_vma_resource_put()
-- Remove a stray debug printout
v4:
-- Patch series split in two. This is the second part.
-- Take cache coloring into account when searching for vma_resources
   pending unbind. (Matthew Auld)
v5:
-- Add a selftest.
-- Remove page pinning while sync binding.
-- A couple of fixes in i915_vma_resource_bind_dep_await()
v6:
-- Some documentation updates
-- Remove I915_VMA_ALLOC_BIT (Matthew Auld)
-- Change some members of struct i915_vma_resource from unsigned long to u64
   (Matthew Auld)
-- Fix up the cache coloring adjustment. (Kernel test robot <lkp@intel.com>)
-- Don't allow async unbinding if the vma_res pages are not the same as
   the object pages. (Matthew Auld)

Thomas Hellström (6):
  drm/i915: Initial introduction of vma resources
  drm/i915: Use the vma resource as argument for gtt binding / unbinding
  drm/i915: Don't pin the object pages during pending vma binds
  drm/i915: Use vma resources for async unbinding
  drm/i915: Asynchronous migration selftest
  drm/i915: Use struct vma_resource instead of struct vma_snapshot

 drivers/gpu/drm/i915/Makefile                 |   2 +-
 drivers/gpu/drm/i915/display/intel_dpt.c      |  27 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  17 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  12 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   3 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  27 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  11 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  37 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c | 192 +++++++-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  19 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  37 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   9 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  72 +--
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   4 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  19 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  22 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   3 +-
 drivers/gpu/drm/i915/i915_drv.h               |   1 +
 drivers/gpu/drm/i915/i915_gem.c               |  12 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  87 ++--
 drivers/gpu/drm/i915/i915_module.c            |   3 +
 drivers/gpu/drm/i915/i915_request.c           |  12 +-
 drivers/gpu/drm/i915/i915_request.h           |   6 +-
 drivers/gpu/drm/i915/i915_vma.c               | 241 +++++++++-
 drivers/gpu/drm/i915/i915_vma.h               |  33 +-
 drivers/gpu/drm/i915/i915_vma_resource.c      | 417 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma_resource.h      | 234 ++++++++++
 drivers/gpu/drm/i915/i915_vma_snapshot.c      | 134 ------
 drivers/gpu/drm/i915/i915_vma_snapshot.h      | 112 -----
 drivers/gpu/drm/i915/i915_vma_types.h         |  19 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 159 ++++---
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  12 +-
 34 files changed, 1421 insertions(+), 589 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.c
 create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.h
 delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
 delete mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h

-- 
2.31.1

