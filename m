Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092D8399119
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 19:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8148C6EDCE;
	Wed,  2 Jun 2021 17:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A726EDCE;
 Wed,  2 Jun 2021 17:08:36 +0000 (UTC)
IronPort-SDR: oE0TPF7jlW3TiacaOHKC0Uk7YkMxuXNMFgxbCM+NQ2anE2e1zNJEK3w1PEMNE2HAAz95rXS1gw
 Tie5tuuXzb1Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="225133278"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="225133278"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 10:07:39 -0700
IronPort-SDR: oTLFTLqhIwEcncCAwN8v1eZpGeRIO1tA8+kg8hsB2dtbQV6e02FKFKAHlRUp3uK8qMTouFcCNC
 H7UV1UcXlx/Q==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="550220217"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.50])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 10:07:38 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/i915: Move system memory to TTM for discrete
Date: Wed,  2 Jun 2021 19:07:11 +0200
Message-Id: <20210602170716.280491-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Early implementation of moving system memory for discrete cards over to
TTM. We first add the notion of objects being migratable under the object
lock to i915 gem, and add some asserts to verify that objects are either
locked or pinned when the placement is checked by the gem code.

Patch 2 and 3 deals with updating the i915 gem bookkeeping after a TTM move,
Patch 4 moves system over from shmem to TTM for discrete and finally the
last patch is more to be considered an RFC for migration implementation.

Much of this code is not testing covered, so we might have to add some
selftests as well. Meanwhile this should not be merged but may well be
reviewed.

Note that the mock device doesn't consider itself discrete so the TTM
system path is not checked by the mock selftests.

Also testing if CI can handle base-commit: and prerequisite-patch-id:

Thomas Hellström (5):
  drm/i915: Update object placement flags to be mutable
  drm/i915/ttm: Adjust gem flags and caching settings after a move
  drm/i915/ttm: Calculate the object placement at get_pages time
  drm/i915/ttm: Use TTM for system memory
  drm/i915/ttm: Implement object migration

 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 138 +++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  24 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  27 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 267 +++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   4 +-
 .../drm/i915/gem/selftests/huge_gem_object.c  |   4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   5 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   4 +-
 .../drm/i915/gem/selftests/i915_gem_phys.c    |   3 +-
 drivers/gpu/drm/i915/i915_drv.h               |   3 -
 drivers/gpu/drm/i915/intel_memory_region.c    |   7 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   8 +
 drivers/gpu/drm/i915/intel_region_ttm.c       |   8 +-
 drivers/gpu/drm/i915/intel_region_ttm.h       |   2 +
 19 files changed, 437 insertions(+), 92 deletions(-)


base-commit: cd6eb5f605478f2fff85ec7ac39b7cf445d3deb9
prerequisite-patch-id: b3e7766bc492d04a5ace71fd0d4259689f3bd749
prerequisite-patch-id: 7978430e513e204addd7bc9bef63fd3a9ea25d7c
prerequisite-patch-id: f6aa8d141b22b8e532f8152e53f9c913f98458df
prerequisite-patch-id: 6486c9db619d88a3e9a4ffc01a89bdc722941a67
prerequisite-patch-id: b71878b47e3be71748aacb5d1b3955853bf80de5
prerequisite-patch-id: 1b67c82c32c02dfdb1217f224652276e044fb549
prerequisite-patch-id: 5229db39ec27eb77a8417ed7c9d54af40e0e9f33
prerequisite-patch-id: b66b1893401cc526b4466ea3c427512261d33dfd
prerequisite-patch-id: 706521b6f4858cf4d9ecd83102b347e695b96bb7
prerequisite-patch-id: 686dc7cfea6361c4adabc963996dc3d0d41b28b1
prerequisite-patch-id: 7be87140130a9c2d62a190ceafdacdebd51c5196
-- 
2.31.1

