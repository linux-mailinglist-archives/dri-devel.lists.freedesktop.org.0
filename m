Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301F3919A9
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5496ED22;
	Wed, 26 May 2021 14:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6496C6ED15;
 Wed, 26 May 2021 14:15:33 +0000 (UTC)
IronPort-SDR: DcVxs3+/FHVgpmGVXspvauMKi7RNHRbOg8yEvh/vdEFIWa4yPoblou4BVXvyZM1PfxQhHFri1F
 Ns0fkRIpTpoA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223660530"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223660530"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:04 -0700
IronPort-SDR: uK9YQsx/Bg0lta8X7brxz4DyqflVLUgjPQYqlEptUFzyZQq7sUAgIc0tpc6TAon4ke19C5KD4s
 9vBDoTj3fCxg==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547206240"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:03 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/12] Catchup with a few dropped patches
Date: Wed, 26 May 2021 15:14:44 +0100
Message-Id: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

A small chunk of dropped and mostly already reviewed patches (a couple need
review updated due rebasing I had to do) with the goal of getting to actual
fixes in the next round.

Chris Wilson (12):
  drm/i915: Take rcu_read_lock for querying fence's driver/timeline
    names
  drm/i915: Remove notion of GEM from i915_gem_shrinker_taints_mutex
  drm/i915: Lift marking a lock as used to utils
  drm/i915: Wrap cmpxchg64 with try_cmpxchg64() helper
  drm/i915/selftests: Set cache status for huge_gem_object
  drm/i915/selftests: Use a coherent map to setup scratch batch buffers
  drm/i915/selftests: Replace the unbounded set-domain with an explicit
    wait
  drm/i915/selftests: Remove redundant set-to-gtt-domain
  drm/i915/selftests: Replace unbound set-domain waits with explicit
    timeouts
  drm/i915/selftests: Replace an unbounded set-domain wait with a
    timeout
  drm/i915/selftests: Remove redundant set-to-gtt-domain before batch
    submission
  drm/i915/gem: Manage all set-domain waits explicitly

 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.h   |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 163 +++++-------------
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  12 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  14 --
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.h  |   2 -
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  22 +--
 .../i915/gem/selftests/i915_gem_client_blt.c  |  26 ++-
 .../i915/gem/selftests/i915_gem_coherency.c   |  31 +++-
 .../drm/i915/gem/selftests/i915_gem_context.c |  18 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  16 --
 .../drm/i915/gem/selftests/i915_gem_phys.c    |   8 +-
 .../drm/i915/gem/selftests/igt_gem_utils.c    |   3 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  13 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |   2 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    | 107 +++++-------
 drivers/gpu/drm/i915/i915_gem.c               |   4 +-
 drivers/gpu/drm/i915/i915_sw_fence.c          |   2 +
 drivers/gpu/drm/i915/i915_utils.c             |  28 +++
 drivers/gpu/drm/i915/i915_utils.h             |  41 +++++
 drivers/gpu/drm/i915/selftests/i915_vma.c     |   6 -
 .../drm/i915/selftests/intel_memory_region.c  |   7 +-
 26 files changed, 240 insertions(+), 312 deletions(-)

-- 
2.30.2

