Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC68A83AC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D3810F608;
	Wed, 17 Apr 2024 13:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keN3dZQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818A110F608
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713359033; x=1744895033;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bHjL6UNWrq6eoKomSDucih85JChCuI0z0yNppwLxRSk=;
 b=keN3dZQ5DsiJrISyxV4pFckVx5XtQ1qeosmHmCXPECIWrzS7fG6Tbdz/
 5nLRLvD+PpNKlUhZWpxo14x75VgSV1g4SQA7bLWD+CMLnKb9isJtiFzJt
 1M9/T0J5m/Ii+QQn4bwjIfJZ/336MKNSAo1yn0zcEdBPfIb7lsR/PsDoG
 xjhVSts+59EUiNFUVMO0WWjbXLHL3x4TMzoRRxFzR1YAcO0ed8y1Q+ca+
 DcjaiVam7epACCli7r9VYEr/14mXyXto8V2V2kKULrhhcmuOs0vVd9S4m
 pKmGvJQooBSiIXJQ89YUAQfVINAcA5IDLkSeVtgvoBo9+3XoIIO31vm6W g==;
X-CSE-ConnectionGUID: j3hMyKDhRUeydapoagWx8w==
X-CSE-MsgGUID: XaRPN5LSRE+mWQBj7hLJHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20268266"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="20268266"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:03:39 -0700
X-CSE-ConnectionGUID: mhNIvoTpQzOboQORKbWQtQ==
X-CSE-MsgGUID: AXq+jb/pQSuYh/sfK/+biw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53568958"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.244.75])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:03:37 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v11 00/10] Improve test coverage of TTM
Date: Wed, 17 Apr 2024 15:03:13 +0200
Message-Id: <cover.1713357042.git.karolina.stolarek@intel.com>
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

v11:
  - Delete CONFIG_DRM_KUNIT_TEST_HELPERS from .kunitconfig file, as it gets
    automatically selected when TTM KUnit tests are enabled
  - Call ttm_bo_put() in ttm_bo_validate_pinned() test case (Matt)
  - Fix a copy-paste mistake in ttm_mem_type_cases definition (Matt)
  - Update mock_move definition to do a hop on VRAM -> sysmem move and
    delete a dummy multihop domain. Fix the eviction tests accordingly (Matt)
  - Update ttm_bo_validate_swapout() to use TT domain instead of VRAM
  - Update eviction test cases to create TT domain, so they can perform multihop
  - Update TODO file, as it got outdated already

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

Karolina Stolarek (10):
  drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk
  drm/ttm/tests: Delete unnecessary config option
  drm/ttm/tests: Set DMA mask in KUnit device
  drm/ttm/tests: Use an init function from the helpers lib
  drm/ttm/tests: Test simple BO creation and validation
  drm/ttm/tests: Add tests with mock resource managers
  drm/ttm/tests: Add test cases dependent on fence signaling
  drm/ttm/tests: Add eviction testing
  drm/ttm/tests: Add tests for ttm_tt_populate
  drm/ttm/tests: Add TODO file

 drivers/gpu/drm/Kconfig                       |    1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig        |    2 +-
 drivers/gpu/drm/ttm/tests/Makefile            |    2 +
 drivers/gpu/drm/ttm/tests/TODO                |   25 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |    3 +
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 1225 +++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  171 ++-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   10 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |  235 ++++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |   33 +
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       |  134 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |    3 +
 12 files changed, 1820 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/TODO
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h

-- 
2.34.1

