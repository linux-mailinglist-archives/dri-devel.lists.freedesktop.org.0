Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3EA8132C8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 15:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DB910E09F;
	Thu, 14 Dec 2023 14:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3893710E082
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 14:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702563439; x=1734099439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RCdCqHM4qU+mnHM77pEoiSASXioHkrFj825jFLpghOk=;
 b=faIBF/ymxBHH2sEkIIkh83tIc/msEEPtbU6Rw4se9nnbyvce6MiqC12l
 7x+nWsMO0M66UEvyhbQV0gz0AIDMHihNt4sxmUYOTHijytHfhcT4IewJc
 w3Dn7eCOV0PYLmWovT9XRBwT+MWZAYz5s0XH2+/i9CZsFk6ASFHGetGrz
 VnTsI4e5Ywt107KpKdoIPWSU4eqyu6NFwvxwMoLYFGkHRU7Wdcpmkw2oM
 KkvQGvuynvbRpbHSD8sY2aGBixJG5shDv8AqyVwajRpkV8TKWqzw/pfLl
 hc1jpvWu+RJiQk4BSLOicNqiyN/9sRuYACwF0UkZYbsXEP1V4AM4mb+pX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1977689"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1977689"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 06:17:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="777910689"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="777910689"
Received: from kceranow-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.24.253])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 06:17:17 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 0/8] Improve test coverage of TTM
Date: Thu, 14 Dec 2023 15:17:12 +0100
Message-Id: <cover.1702552875.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce tests for ttm_bo_validate()/ttm_bo_init_validate() that exercise
simple BO placement as well as eviction (including the case where the evict
domain also requires eviction to fit the incoming buffer). Prepare KUnit
helpers to handle such scenarios and add a mock VRAM manager. This series also
includes some updates to the helpers and more definitions used to define
"special" memory domains (e.g., one that can't allocate resources or is busy),
as well as a drive-by fix for one of the tests.

There are a couple of areas in which this test suite can be improved.
Suggestions for future work can be found in the TODO file, added as the final
patch in the series.

Use kunit_tool script to manually run all the tests:

$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests

To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and
then CONFIG_DRM_TTM_KUNIT_TEST.

Many thanks,
Karolina

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

v7:
 - Drop size argument from ttm_place_kunit_init(), it's no longer needed
 - Delete a TODO comment from ttm_bo_validate_tests.c
 - First evict BOs before calling ttm_resource_manager_set_used() in
   ttm_mock_manager_fini()
 - Stop calling ttm_resource_manager_cleanup() as a part of the mock manager
   fini sequence. It frees a move fence that is allocated via KUnit allocator,
   which gets freed again as a part of the test cleanup
 - Set use_tt to true in mock manager and stop passing in the flag for it
 - Make ttm_dev_empty_funcs static
   (drivers/gpu/drm/ttm/tests/ttm_tt_test.c:232:25: sparse: sparse:
   symbol 'ttm_dev_empty_funcs' was not declared. Should it be static?)
 - Cast bo->base.resv->fences to a generic pointer before it's checked by
   KUnit (drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:98:9:
   sparse: sparse: incompatible types in comparison expression (different
   base types))
 - Clean up mock managers in ttm_bo_validate_move_fence_not_signaled subtest

v6:
  - Include tests for ttm_bo_init_reserved() and ttm_bo_validate(), with
    a mock resource manager (patches 6-8; no eviction testing)
  - Add ttm_test_devices_all_init() helper to also init ttm_device instance
  - Remove fpfn and lpfn from ttm_place_kunit_init() helper -- these fields
    are neither used nor tested

v5:
  - Actually use the page_flags parameter in ttm_tt_simple_create()

v4:
  - First unreserve the object before calling ww_acquire_fini() in
    ttm_bo_reserve_double_resv subtest
  - Silence lockdep in ttm_bo_reserve_deadlock subtest (open to suggestions
    how to fix it in a different way)
  - Use a genuine GEM object in ttm_buffer_object instead of an empty one

v3:
  - Instead of modifying the main TTM Makefile, use
    EXPORT_SYMBOL_FOR_TESTS_ONLY() macro for symbols that are tested but
    not widely exported. Thanks to this change, TTM tests can be built
    as modules, even when non-exported functions are used
  - Change the description of a patch that fixes ttm_pool_pre_populated()

v2:
  - Remove Makefile for KUnit tests and move the definitions to the
    TTM's one
  - Switch on CONFIG_DRM_TTM_KUNIT_TEST=m so the tests and TTM module
    are built as one. This allows building the tests as a module, even
    if it uses functions that are not exported
  - Fix ttm_pool_pre_populated(); a wrong flag was passed to
    ttm_tt_kunit_init() function

Karolina Stolarek (8):
  drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
  drm/ttm/tests: Use an init function from the helpers lib
  drm/ttm/tests: Test simple BO creation and validation
  drm/ttm/tests: Add tests with mock resource managers
  drm/ttm/tests: Add test cases dependent on fence signaling
  drm/ttm/tests: Add eviction testing
  drm/ttm/tests: Add tests for ttm_tt_populate
  drm/ttm/tests: Add TODO file

 drivers/gpu/drm/Kconfig                       |    1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig        |    1 +
 drivers/gpu/drm/ttm/tests/Makefile            |    2 +
 drivers/gpu/drm/ttm/tests/TODO                |   24 +
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 1218 +++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  176 ++-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   11 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |  235 ++++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |   33 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |    3 +-
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       |  134 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |    3 +
 12 files changed, 1816 insertions(+), 25 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/TODO
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h

-- 
2.34.1

