Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D06F116A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 07:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C44E10E058;
	Fri, 28 Apr 2023 05:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AC610E058;
 Fri, 28 Apr 2023 05:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682660792; x=1714196792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hdxBrm7xf6ar5Mr4+nhO4eS33M+cFvP27mVjcD5ZxAw=;
 b=TgT96l42kqQybdkjQCaKTjEhagQWmhFOlXIgNJENqgIKSq6NpEQ1I0oe
 Nn1QLmxdLTTBecifnExd3bZKj8V5yUp3G1t8DazY66d2LcXy8CYwPbu7Z
 yXQDLZdk49XmlsBQtq/5vToOcNXLhnyFfZbmTDrOKQrckFYTr7tj6jBhm
 ETpdIR9HESlVVZpWSW3sMAbUX6/TkEVFD7pmTqnNcx+by5JgmYK05YtKc
 Z5WgCY9/b68YeqkOv4sET72tOd2iVthFQKonEJvjVIvBtpwXq5JZSqjPv
 HCV0usPLQA53F+R7mnZTZU5YRFG7PXyFc8ATjug27YNveru5B/Dwfqg8z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="413040410"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="413040410"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:46:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806251805"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="806251805"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:46:31 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/5] drm/i915: Allow user to set cache at BO creation
Date: Thu, 27 Apr 2023 22:47:32 -0700
Message-Id: <20230428054737.1765778-1-fei.yang@intel.com>
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

Fei Yang (5):
  drm/i915: preparation for using PAT index
  drm/i915: use pat_index instead of cache_level
  drm/i915: make sure correct pte encode is used
  drm/i915/mtl: end support for set caching ioctl
  drm/i915: Allow user to set cache at BO creation

 drivers/gpu/drm/i915/display/intel_dpt.c      | 12 +--
 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 36 +++++++++
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 46 ++++++-----
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 67 +++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 26 +++++-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  9 ++-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 16 ++--
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 10 ++-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 73 +++++++++--------
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |  3 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 76 +++++++++---------
 drivers/gpu/drm/i915/gt/intel_gtt.h           | 20 +++--
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 47 ++++++-----
 drivers/gpu/drm/i915/gt/intel_migrate.h       | 13 ++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  6 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    | 47 +++++------
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++-
 drivers/gpu/drm/i915/i915_debugfs.c           | 55 ++++++++++---
 drivers/gpu/drm/i915/i915_gem.c               | 16 +++-
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
 44 files changed, 621 insertions(+), 243 deletions(-)

-- 
2.25.1

