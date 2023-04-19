Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323F36E831A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 23:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C81710EAEA;
	Wed, 19 Apr 2023 21:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA9C10E20D;
 Wed, 19 Apr 2023 21:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681938668; x=1713474668;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z3f6He2fvOdVhaMng7tBiHDllBeQCB4z6Z03KnFE43Y=;
 b=GSXWzyyyN+VUdaE3XS1d4CNa6YB69Oh4bjt+dGwYMPzjaCE+CEFimx6i
 g1SVwuK6W6B0oMKcINM/2iPoy9xHpGIMfx6l6jIb+YPL296R+5ptojuWV
 i1ZBurIwNE6+Wp7J8N0B/DVNppAxxI6GuXFemZQ1OiZOAC4mO0YY91hRf
 z/TW6D11EuAtVUDWTXQGo087qDhud8oT3Yt/ZAViaBztmomO+iSglvYoO
 FW9lHNFtyvAARuvcPohzvCrG6yX4FuZnSrRv7ULdtNyyLtEjcWawATLhg
 LOdKMDzSlzz367uPVfrQDTMNM0MTtmjW888SQsLf/4UoUG+a1zz33eisa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="343042854"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="343042854"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="685098934"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="685098934"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 14:11:07 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] drm/i915/mtl: Define MOCS and PAT tables for MTL
Date: Wed, 19 Apr 2023 14:12:11 -0700
Message-Id: <20230419211219.2574008-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Fei Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

The series includes patches needed to enable MTL.
Also add new extension for GEM_CREATE uAPI to let
user space set cache policy for buffer objects.

v2: addressing review comments and checkpatch warnings
v3: make mtl_ggtt_pte_encode static

Fei Yang (7):
  drm/i915/mtl: Set has_llc=0
  drm/i915/mtl: Add PTE encode function
  drm/i915/mtl: workaround coherency issue for Media
  drm/i915/mtl: end support for set caching ioctl
  drm/i915: preparation for using PAT index
  drm/i915: use pat_index instead of cache_level
  drm/i915: Allow user to set cache at BO creation

Madhumitha Tolakanahalli Pradeep (1):
  drm/i915/mtl: Define MOCS and PAT tables for MTL

 drivers/gpu/drm/i915/display/intel_dpt.c      | 14 ++--
 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 36 ++++++++
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 30 +++----
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 67 ++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 26 +++++-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  5 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  9 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 16 ++--
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 10 ++-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 76 ++++++++++++-----
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |  3 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 84 +++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  6 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           | 47 ++++++++++-
 drivers/gpu/drm/i915/gt/intel_gtt.h           | 38 ++++++---
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 47 ++++++-----
 drivers/gpu/drm/i915/gt/intel_migrate.h       | 13 ++-
 drivers/gpu/drm/i915/gt/intel_mocs.c          | 76 ++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  6 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    | 47 ++++++-----
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |  2 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     | 13 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  7 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++-
 drivers/gpu/drm/i915/i915_debugfs.c           | 55 +++++++++---
 drivers/gpu/drm/i915/i915_gem.c               | 16 +++-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +-
 drivers/gpu/drm/i915/i915_pci.c               | 76 +++++++++++++++--
 drivers/gpu/drm/i915/i915_vma.c               | 16 ++--
 drivers/gpu/drm/i915/i915_vma.h               |  2 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |  2 -
 drivers/gpu/drm/i915/intel_device_info.h      |  5 ++
 drivers/gpu/drm/i915/selftests/i915_gem.c     |  5 +-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |  4 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 15 ++--
 .../drm/i915/selftests/intel_memory_region.c  |  4 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  9 ++
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  8 +-
 include/uapi/drm/i915_drm.h                   | 36 ++++++++
 tools/include/uapi/drm/i915_drm.h             | 36 ++++++++
 52 files changed, 812 insertions(+), 226 deletions(-)

-- 
2.25.1

