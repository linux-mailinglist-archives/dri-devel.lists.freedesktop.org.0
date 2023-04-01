Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9F36D2E9F
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 08:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DEC10E130;
	Sat,  1 Apr 2023 06:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A130010E04A;
 Sat,  1 Apr 2023 06:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680331021; x=1711867021;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/kAlfC9k+PLdshUGMM0GnNYUulmjKHmdT3mpko4ndNM=;
 b=G1vfxIUK6uZg5a5SIvpFpuI3hmPBEYjiuq7R+eCgvVatIdqAHYoS921w
 XeU+HNSlEdqjgcO6C8p2TrA2b7paUAAztw/wBo1gR32u1aL7u1yetNdB5
 hDWBGtUmcn3BAIFwh/iiBdcwbpGFGda/K4X+7NF49Y3dcpeDAr1lahTXe
 nhjPTtPIspGxY+MbTTK1uZez14xL3taCs/xr7AlxU74s1eTyz+/K/t+DT
 /pVrLw0T13BhOmy6z7StJ/AguQs3iH+ovyE84cX1PM88PQ0lZgEpoM8lZ
 usY+CousNE/w9Ml3Qvz1mVsUyGefij9xVwdVVg50SMpXSjdQjKC1vvAgo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340349505"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="340349505"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 23:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="635539617"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="635539617"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 23:37:00 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915/mtl: Define MOCS and PAT tables for MTL
Date: Fri, 31 Mar 2023 23:38:23 -0700
Message-Id: <20230401063830.438127-1-fei.yang@intel.com>
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

Fei Yang (7):
  drm/i915/mtl: Define MOCS and PAT tables for MTL
  drm/i915/mtl: workaround coherency issue for Media
  drm/i915/mtl: end support for set caching ioctl
  drm/i915: preparation for using PAT index
  drm/i915: use pat_index instead of cache_level
  drm/i915: make sure correct pte encode is used
  drm/i915: Allow user to set cache at BO creation

 drivers/gpu/drm/i915/display/intel_dpt.c      | 14 ++--
 drivers/gpu/drm/i915/gem/i915_gem_create.c    | 33 ++++++++
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 30 +++----
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 48 ++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 19 +++--
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  5 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  9 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 16 ++--
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 10 ++-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 81 +++++++++++++-----
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |  6 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 84 +++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gtt.c           | 23 ++++-
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
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 18 ++--
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
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  6 ++
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  8 +-
 include/uapi/drm/i915_drm.h                   | 36 ++++++++
 tools/include/uapi/drm/i915_drm.h             | 36 ++++++++
 51 files changed, 763 insertions(+), 233 deletions(-)

-- 
2.25.1

