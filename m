Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4861A7A66EC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 16:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FC210E3DF;
	Tue, 19 Sep 2023 14:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6EC10E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 14:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695134461; x=1726670461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2rkaMwVN76+7tGbBWimhzpF2lJ1aG3wCURdJqTPyIEw=;
 b=Gp54mCJIDzX9e3FCIgDnUBaqH5NE9PCNbOa75WeiNJg/l3yYWDLcI6x9
 +xoDXPPZSt7J6P0Am82zzYRsuj+dWCWm9SLEzpDvpm4ANdTCy6+ZTDmmu
 32bN/qLlDX9CLQcKHOvNQpRo41xkMcEwYiOI+TNQHCRDNvuoHCsSseHza
 l2KjDaV8LTqnzGAE87CHfWCZSNuG6UsiGoEDtRHx40XfkjwmhRRlI44eM
 xPoaQ52A7FYA6CpFXAR5F7rsEDK4+rb8wI1c2r82hor0RjoPyaETRJ8SV
 ok1G46AcyYr7r+ONVVZzfczBABwglYXJsNWDk7IcI+87qXy2Sn28/NXoG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410886780"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="410886780"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="811743007"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="811743007"
Received: from jbrzezin-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.17.188])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:39:59 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/4] Improve test coverage of TTM
Date: Tue, 19 Sep 2023 16:39:41 +0200
Message-Id: <cover.1695133574.git.karolina.stolarek@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

Karolina Stolarek (4):
  drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
  drm/ttm/tests: Add tests for ttm_tt
  drm/ttm/tests: Add tests for ttm_bo functions
  drm/ttm/tests: Fix argument in ttm_tt_kunit_init()

 drivers/gpu/drm/ttm/tests/Makefile            |   3 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 ++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  51 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 295 +++++++++
 drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
 drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
 9 files changed, 1313 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c

-- 
2.25.1

