Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B8844D254
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 08:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C0E6E92C;
	Thu, 11 Nov 2021 07:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5007C6E8B6;
 Thu, 11 Nov 2021 07:15:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="212896378"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="212896378"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 23:15:19 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="452627294"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.199])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 23:15:17 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm/i915/ttm: Async migration
Date: Thu, 11 Nov 2021 08:14:56 +0100
Message-Id: <20211111071502.16826-1-thomas.hellstrom@linux.intel.com>
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

This patch series deals with async migration and async vram management.
It still leaves an important part out, which is async unbinding which
will reduce latency further, at least when trying to migrate already active
objects.

Patches 1/6 and 2/6 deal with accessing and waiting for the TTM moving
fence from i915 GEM.
Patch 3 is pure code reorganization, no functional change.
Patch 4 breaks a refcounting loop involving the TTM moving fence.
Patch 5 uses TTM to implement the ttm move() callback async, it also
introduces a utility to collect dependencies and turn them into a
single dma_fence, which is needed for the intel_migrate code.
This also affects the gem object migrate code so.
Patch 6 makes the object copy utility async as well, mainly for future
users since the only current user, suspend backup and restore, typically
will want to sync anyway.

Maarten Lankhorst (2):
  drm/i915: Add functions to set/get moving fence
  drm/i915: Add support for asynchronous moving fence waiting

Thomas Hellström (4):
  drm/i915/ttm: Move the i915_gem_obj_copy_ttm() function
  drm/i915/ttm: Break refcounting loops at device region unref time
  drm/i915/ttm: Implement asynchronous TTM moves
  drm/i915/ttm: Update i915_gem_obj_copy_ttm() to be asynchronous

 drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  37 ++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  58 +--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 396 ++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h  |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |   4 +-
 .../i915/gem/selftests/i915_gem_coherency.c   |   4 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  18 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |   1 +
 drivers/gpu/drm/i915/i915_vma.c               |  39 +-
 drivers/gpu/drm/i915/i915_vma.h               |   3 +
 drivers/gpu/drm/i915/intel_memory_region.c    |   5 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   1 +
 drivers/gpu/drm/i915/intel_region_ttm.c       |  28 ++
 drivers/gpu/drm/i915/intel_region_ttm.h       |   2 +
 drivers/gpu/drm/i915/selftests/i915_vma.c     |   4 +-
 21 files changed, 535 insertions(+), 108 deletions(-)

-- 
2.31.1

