Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF267EEDC9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 09:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13D010E726;
	Fri, 17 Nov 2023 08:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A52E10E726
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 08:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700211001; x=1731747001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GW6YyoDSEqUwCyD7NfGKCaZgGqkhBfL1HSyM6h3TNjU=;
 b=KRedvw82ALIzBjioGFhlMdYN+sICh+WWBLwJuZx9bDCf3eEQvB9yoHAh
 XRgFor8B77OQUKlG1wbYAmHi8artvmoRTvKkJXtmbXPHdCULI2kgg5L/J
 nm0Fl9Ow9IlTOxZwKlm0FvaekzR/vtO3emgYH/NM1+R9nKfxDAXWf4+YA
 SNKuQns6h9eLFuz0Fi393YaQIbQyxONP4fI8jqiM6sX+1czSZwHmFn3rU
 0BGK5Tao+gyKVksMiI1AEwg1bHkea+WdDUZOlXrefhwyt2BmgMhneLQWf
 6Vr3SKfbPgNB3oeHWOd7PtSvqq9qzGhZ6TxgQyU9MYya+9LmWjP+nn7d5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422358646"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="422358646"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 00:50:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="13430909"
Received: from karentow-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.intel.com) ([10.213.28.161])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 00:49:58 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/8] Improve test coverage of TTM
Date: Fri, 17 Nov 2023 09:49:35 +0100
Message-Id: <cover.1700207346.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add tests for building blocks of the TTM subsystem, such as ttm_resource,
ttm_resource_manager, ttm_tt and ttm_buffer_object. This series covers
basic functions such as initialization, allocation and clean-up of each
struct. Testing of ttm_buffer_object also includes locking and unlocking
the object for validation, with special scenarios such as an interrupted
wait or deadlock.

Some of the test cases check the bulk move mechanism and how it interacts
with pinned buffers. This is to be seen if we want to add dedicated testing
for bulk move or not. The resource allocation subtests use ttm_sys_manager
for now. Resources that don't use system memory will be indirectly tested
via tests for ttm_bo_validate()/ttm_bo_init_validate(), using a mock
resource manager.

Use kunit_tool script to manually run all the tests:

$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests

To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and
then CONFIG_DRM_TTM_KUNIT_TEST.

Many thanks,
Karolina

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
  drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
  drm/ttm/tests: Add tests for ttm_tt
  drm/ttm/tests: Add tests for ttm_bo functions
  drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
  drm/ttm/tests: Use an init function from the helpers lib
  drm/ttm/tests: Test simple BO creation and validation
  drm/ttm/tests: Add tests with mock resource managers
  drm/ttm/tests: Add test cases dependent on fence signaling

 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig        |   1 +
 drivers/gpu/drm/ttm/tests/Makefile            |   5 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 ++++++++++++++
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 795 ++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 109 ++-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   7 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 206 +++++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  31 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 282 +++++++
 drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
 drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
 14 files changed, 2397 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c

-- 
2.25.1

