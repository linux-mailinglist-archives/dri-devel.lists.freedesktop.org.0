Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A529B7E582D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E8210E75B;
	Wed,  8 Nov 2023 13:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDA910E75B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699451817; x=1730987817;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=htdf4NwHS6MFnMgQcxMZRZ3JtloggzdBncwe0FHULJs=;
 b=OoLZD09TIb+5ZTUv6itoZmfBMNirk2wRO+BfAOPpFrvCh/G7YZUSQ2SI
 Ykhz0GFoFJlC3ryvh49xOnzxaRqFGdchx9TMqDSYK1g3JfZH67ZFekkab
 2wcXslHYcw2EQXE+4GCW1OOGg7z2Tz3VipE8vWnza98HvTECKQMaYM0lC
 nKXkkE2bDBMHi5mp0UR+WBZc2qht1zfhigOmUKcmyj8UVjvUDBUGh4NyJ
 B/yppGrSZsW2XhXqy/nyDsVgiTe2ttzD/pcvNPijWlAMJkZx55G/R44Ee
 oci+5MwhHw66/plj+1p2kdjGEJHpT9Pnxlk9MQKnKv6EThboyumyRNUnm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="475993603"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="475993603"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:56:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="880212923"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="880212923"
Received: from asawoscx-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.23.233])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:56:55 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/8] Improve test coverage of TTM
Date: Wed,  8 Nov 2023 14:56:22 +0100
Message-Id: <cover.1699445194.git.karolina.stolarek@intel.com>
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
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 792 ++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 110 ++-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   8 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 194 +++++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  30 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 282 +++++++
 drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
 drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
 14 files changed, 2383 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c

-- 
2.25.1

