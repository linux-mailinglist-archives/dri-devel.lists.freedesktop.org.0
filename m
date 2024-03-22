Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C87886E85
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101351124EB;
	Fri, 22 Mar 2024 14:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aM6gExit";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC1F1124EA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711117801; x=1742653801;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h4lzmuNFS7l+99Y88R6twbDpMQfqptlBGMQp4jbIZws=;
 b=aM6gExitbnr7s5VTr2Tzu9gFPWjaoTufoW1MZoXokUx32afcVhA4pbTI
 rA/WIy9X2ReawjJXn2Mkk0Dn+q4A302KTKTfUA8gzF/kLfASrfJX8meMS
 Sm1RdTO8BZuv5NpveRP7A/D9/TGVitRrY2WUU7jJBookNywfMVpzFzBX2
 YkKrWAEXCdzTM7Z0PqgVt4cq6fsptiJ4+LmXNy+4QXKE/l93SPaPnWfEO
 IFaLNE15oaPBzABBo5IRKiWey7OnhaCt6zA3+8MMKRfTjqNt5W8wXNtyt
 dyhnF0LZGf5A3zddXnnSeVvwtAJgT2PyitBDREx1CXwuXZEXea5rK841x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6022794"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6022794"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19398509"
Received: from unknown (HELO kdrobnik-desk.toya.net.pl) ([10.245.245.72])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:29:58 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v10 0/9] Improve test coverage of TTM
Date: Fri, 22 Mar 2024 15:29:49 +0100
Message-Id: <cover.1711117249.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce tests for ttm_bo_validate()/ttm_bo_init_validate() that exercise
simple BO placement as well as eviction (including the case where the evict
domain also requires eviction to fit the incoming buffer). Prepare KUnit
helpers to handle such scenarios and add a mock VRAM manager. This series also
includes some updates to the helpers and more definitions used to define
"special" memory domains (e.g., one that can't allocate resources or is busy),
as well as drive-by fixes for the tests.

There are a couple of areas in which this test suite can be improved.
Suggestions for future work can be found in the TODO file.

Use kunit_tool script to manually run all the tests:

$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests

To build a kernel with TTM KUnit tests, use a UML configuration,
enable CONFIG_KUNIT, and then select CONFIG_DRM_TTM_KUNIT_TEST.

Many thanks,
Karolina

v10:
  Many things have happened over the course of three months, so the series
  had to be slightly reworked and expanded to accommodate these changes:
   - Set DMA coherent mapping mask in the KUnit device so ttm_pool_alloc
     tests can be executed
   - Update ttm_bo_validate_invalid_placement() test case to check against
     the right return error. It's no longer -EINVAL (which only is returned
     for pinned buffers), but -ENOMEM. The behaviour has changed in
     commit cc941c70df39 ("drm/ttm: improve idle/busy handling v5")
   - Rework ttm_placement_kunit_init() to accept only one array of places
     and update the tests that use that helper
   - Set fallback flags in eviction domains defined in TTM KUnit helpers
   - Fix a warning raised by ttm_bo_unreserve_bulk() test case
   - Scrap all r-bs and tested-by, as many things were updated and should
     be checked again

v9:
 - Drop tests with basic test cases, they are merged now
 - Add three final patches -- tests for ttm_tt_(un)populate, eviction testing
   and a TODO file, with suggestions on how to improve these tests
 - Delete the initialization of spinlock in
   ttm_bo_validate_move_fence_signaled(), it not used at all (Andi)
 - Just return the error code threaded_fence_signal(), don't save it to a
   local variable (Andi)
 - Use ttm_bo_unreserve() in tests checking different move fence states (Andi)

v8:
 - Add Tested-by tags to commits that introduce tests
 - Improve the comment for ttm_bo_reserve_deadlock() subtest (Andi)
 - Actually clean up the resource when "error_free_blocks" is hit in
   ttm_mock_manager_alloc(). Without that change, we hit
   DEBUG_LOCKS_WARN_ON(lock->magic != lock) warning when cleaning up
   the resource manager because we try clean up an incomplete, orphaned
   resource. That's not good, and this could bite us back in the future.

Karolina Stolarek (9):
  drm/ttm/tests: Set DMA mask in KUnit device
  drm/ttm/tests: Use an init function from the helpers lib
  drm/ttm/tests: Test simple BO creation and validation
  drm/ttm/tests: Add tests with mock resource managers
  drm/ttm/tests: Add test cases dependent on fence signaling
  drm/ttm/tests: Add eviction testing
  drm/ttm/tests: Add tests for ttm_tt_populate
  drm/ttm/tests: Add TODO file
  drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk

 drivers/gpu/drm/Kconfig                       |    1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig        |    1 +
 drivers/gpu/drm/ttm/tests/Makefile            |    2 +
 drivers/gpu/drm/ttm/tests/TODO                |   24 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |    3 +
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 1213 +++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  173 ++-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   11 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |  235 ++++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |   33 +
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       |  134 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |    3 +
 12 files changed, 1810 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/TODO
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h

-- 
2.34.1

