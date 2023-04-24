Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5176EC415
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 05:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D6D10E235;
	Mon, 24 Apr 2023 03:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2894210E15A;
 Mon, 24 Apr 2023 03:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682307775; x=1713843775;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+BZ0DBpkXGeUXGZfCwjwT2m/8m5dxGZ/TsIfP681Rjg=;
 b=BKN9yZi8aESlhQzD4kHuddlIDCii9FSZ8FF4LEeoJKC7dvBV2B4G1jRl
 DIUlytKnM4OCxxCBFbn86hR2Cv4A9Ah7hzSK3IqVUfnFnZPyiN9fnl+xa
 +bkBq1B9fAp+t+sJCUN1F1W472NhD2kcHwAtdlRnSJDxSHt1bbThhhTEQ
 bYFHP7kvk+RWxcyzqt2mf9IVsYMqhVqUmmudmzCQI9FNgW4ddQPXMnHo8
 QXcn+OArT0WT/Tnbjp+TL55ylmES8/RBoOfC8lCvA6+ajVY8Yirser4X0
 Ewtfiu+AnYA8Qwa5cfhrvhllCCI206LIIE1BXWDYhHcCVh8wNJvFuV4Bh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="349149199"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; d="scan'208";a="349149199"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2023 20:42:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="817096670"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; d="scan'208";a="817096670"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2023 20:42:54 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 0/4] drm/i915/mtl: add PTE encode function
Date: Sun, 23 Apr 2023 20:43:59 -0700
Message-Id: <20230424034403.3390144-1-fei.yang@intel.com>
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

These patches are extracted from series
https://patchwork.freedesktop.org/series/115980/

This series start with adding PTE encode functions for MTL as it can no
longer reuse the PTE encode functions for GEN8 due to PAT index changes.
Then there are patches refactoring the cache policy programming so that
the PTE encode functions can be unified across all GEN12 platforms.
This refactor is also important in implementing the design which allows
uerspace to directly set cache policy for each Buffer Object.

Fei Yang (4):
  drm/i915/mtl: Add PTE encode function
  drm/i915: preparation for using PAT index
  drm/i915: use pat_index instead of cache_level
  drm/i915: make sure correct pte encode is used

 drivers/gpu/drm/i915/display/intel_dpt.c      | 14 ++--
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 27 ++----
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 61 +++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 26 +++++-
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
 drivers/gpu/drm/i915/gt/intel_gtt.h           | 31 ++++---
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 47 ++++++-----
 drivers/gpu/drm/i915/gt/intel_migrate.h       | 13 ++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  6 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    | 47 ++++++-----
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++-
 drivers/gpu/drm/i915/i915_debugfs.c           | 55 +++++++++---
 drivers/gpu/drm/i915/i915_gem.c               | 16 +++-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +-
 drivers/gpu/drm/i915/i915_pci.c               | 79 +++++++++++++++--
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
 40 files changed, 527 insertions(+), 219 deletions(-)

-- 
2.25.1

