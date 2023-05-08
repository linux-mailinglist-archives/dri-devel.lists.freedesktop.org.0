Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12456FBB80
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 01:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5433B10E0F2;
	Mon,  8 May 2023 23:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA0510E027;
 Mon,  8 May 2023 23:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683589682; x=1715125682;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NNkN5IWy5LTzg1C1c8AmgDMorU4jy5uxyppXwbqsI7A=;
 b=BJONnp6kX+2b7SzYXwZxuhp18KQXTy3Y8TKs026u8ET5hiAqhiPHw0kQ
 jtZnnZc+oFdZCtOR51d4+95FPVWVVXct6zx/3cv1zm/nRPdBgtyzuVqQa
 8r1lroOvGsGlux3O8Mh9+Vj5krrpY9L9hcghgOiCvJnEj2OEoYw0F8BBc
 j/J1+hnj4ePw/2nSNDZtVdEQQpQ7YNZqxKoQWWNfybnGA/VWb/c9e0lJ8
 0x9ElbMjBrKW9F0KiwFBXShqc81t7Q85qs8wcfmzDQLiR3uyd+BlDbuIC
 SENbx0vP/SsV9Ja0ZfAiA0n9xigXF+q4LxnMKAZKyizQaDEY9oRaXqOKM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330135876"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="330135876"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 16:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="768246549"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="768246549"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 16:48:01 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 0/2] drm/i915: use pat_index instead of cache_level
Date: Mon,  8 May 2023 16:48:52 -0700
Message-Id: <20230508234854.4028658-1-fei.yang@intel.com>
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

This patch set was posted at
https://patchwork.freedesktop.org/series/116868/
Change title since the PTE patch was merged separately.

These patches are extracted from series
https://patchwork.freedesktop.org/series/115980/

This series refactor the cache policy programming so that the PTE
encode functions can be unified across all GEN12 platforms. This
refactor is also important in implementing the design which allows
uerspace to directly set cache policy for each Buffer Object.

v2: drop one patch that was merged separately
    341ad0e8e254 drm/i915/mtl: Add PTE encode function
v3: disable {get, set}_caching ioctl
v4: fix missing unlock introduced in v3, and
    solve a rebase conflict
v5: replace obj->cache_level with pat_set_by_user,
    fix i915_cache_level_str() for legacy platforms.
v6: squash the pte_encode patch because separating them causes
    bisect probelm. Also addressing some review comments from
    Tvrtko and Matt.
v7: fix checkpatch errors and warnings.

Fei Yang (2):
  drm/i915: preparation for using PAT index
  drm/i915: use pat_index instead of cache_level

 drivers/gpu/drm/i915/display/intel_dpt.c      | 12 +--
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 58 +++++++++-----
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 +++-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 11 ++-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 60 +++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 51 +++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  8 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 10 ++-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 78 +++++++++---------
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |  3 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 76 +++++++++---------
 drivers/gpu/drm/i915/gt/intel_gtt.h           | 18 ++---
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 47 ++++++-----
 drivers/gpu/drm/i915/gt/intel_migrate.h       | 13 ++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  4 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    | 47 +++++------
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++-
 drivers/gpu/drm/i915/i915_debugfs.c           | 53 ++++++++++---
 drivers/gpu/drm/i915/i915_gem.c               | 27 ++++++-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +-
 drivers/gpu/drm/i915/i915_pci.c               | 79 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_vma.c               | 16 ++--
 drivers/gpu/drm/i915/i915_vma.h               |  2 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |  2 -
 drivers/gpu/drm/i915/intel_device_info.h      |  5 ++
 drivers/gpu/drm/i915/selftests/i915_gem.c     |  5 +-
 .../gpu/drm/i915/selftests/i915_gem_evict.c   |  4 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 15 ++--
 .../drm/i915/selftests/intel_memory_region.c  |  4 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  9 +++
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  8 +-
 40 files changed, 555 insertions(+), 237 deletions(-)

-- 
2.25.1

