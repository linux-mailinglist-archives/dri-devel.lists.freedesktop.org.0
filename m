Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA466FBB94
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 01:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD4010E19A;
	Mon,  8 May 2023 23:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B18D10E0F5;
 Mon,  8 May 2023 23:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683589915; x=1715125915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E1JQUeDlkpgWTutZr35njSpII0Lyl2dNXe8gGC+fG8s=;
 b=hQFqbJfQ6TbZObQ59CvPw/KhN6SWg6hfkyCvqdPsymcYgEaYZPc/W5dD
 EDcp+9FBzxWA+V/YiFJoo3mjX0tYG4A8wCrwcBAi6F9EQfMC4t5QvNiPr
 z2/Pb67bgYR9u0278ry86BzpXVLtMWlvBNFo55ZUB5R5IXfvVcLgiqO/Y
 ghYx4nVePBfJsJH5eXeEiQb+71DD4dlTm4EN/qzE2F6yBd90eWefNuV9s
 ZXHYQLrHhu4c0QlA7HSDx+CoyJg6PtW+qMsBrgHjUqWIUKZe4spUuuYDU
 P7sB/O4NPRlOyoZpUoTKjiNGpAxV2z/JzxSkAs///1wM6OpLNM1lX/jY0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348605477"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="348605477"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 16:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="701613514"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="701613514"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 16:51:54 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 0/4] drm/i915: Allow user to set cache at BO creation
Date: Mon,  8 May 2023 16:52:46 -0700
Message-Id: <20230508235250.4028749-1-fei.yang@intel.com>
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

The first three patches in this series are taken from
https://patchwork.freedesktop.org/series/116868/
These patches are included here because the last patch
has dependency on the pat_index refactor.

This series is focusing on uAPI changes,
1. end support for set caching ioctl [PATCH 4/5]
2. add set_pat extension for gem_create [PATCH 5/5]

v2: drop one patch that was merged separately
    341ad0e8e254 drm/i915/mtl: Add PTE encode function
v3: rebase on https://patchwork.freedesktop.org/series/117082/
v4: fix missing unlock introduced in v3, and
    solve a rebase conflict
v5: replace obj->cache_level with pat_set_by_user,
    fix i915_cache_level_str() for legacy platforms.
v6: rebased on https://patchwork.freedesktop.org/series/117480/

Fei Yang (4):
  drm/i915: preparation for using PAT index
  drm/i915: use pat_index instead of cache_level
  drm/i915/mtl: end support for set caching ioctl
  drm/i915: Allow user to set cache at BO creation

 drivers/gpu/drm/i915/display/intel_dpt.c      | 12 +--
 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 36 +++++++++
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 61 +++++++++-----
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 +++-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 11 ++-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 66 +++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 51 +++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  9 ++-
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
 include/uapi/drm/i915_drm.h                   | 36 +++++++++
 tools/include/uapi/drm/i915_drm.h             | 36 +++++++++
 44 files changed, 680 insertions(+), 238 deletions(-)

-- 
2.25.1

