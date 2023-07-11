Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC2A74EBC9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 12:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3511710E35D;
	Tue, 11 Jul 2023 10:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125DF10E35E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 10:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689071735; x=1720607735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=87VVGwkDGSqUlRu2pcfZZcwf+Wg5W3JLY8RjLXQ0iC0=;
 b=FL8HtFQQL/zviweB9QhnaY6kfY4048CI0UTy3lVVo8WyA3b5jgA2vpXW
 1yImbqNj5fielCzI+JvR+aGMTpOXEK0YPmhyA1Z53NrvO+Ok2Om9jD91j
 naItsi51rVP+ZTaS2mZBPrCT9CyJZ3VK5r0JXKBBIcPei5YX2gyfKg0Np
 9B683+RdRfmTsyW5d1jI7IC6GeYRAb04zCpKemW5FKXj9dxizbJr63QU6
 lTIY+gjjTCCQ+qCQ7unmQKKvPwuxFDxw8HsIWsecmiDbOtLW7/zT4kBC9
 bBbQHuAQI3lGCVTCgfAb9johZtL64l/rsvKJr8GFGJJ6elTfCfjwTZ0Zm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="362046461"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="362046461"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:35:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="698386239"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="698386239"
Received: from kaszymec-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.16.58])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:35:29 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v4 0/3] Introduce KUnit tests for TTM subsystem
Date: Tue, 11 Jul 2023 12:34:22 +0200
Message-Id: <cover.1689060814.git.karolina.stolarek@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces KUnit[1] tests for TTM (Translation Table Manager)
subsystem, a memory manager used by graphics drivers to create and manage
memory buffers across different memory domains, such as system memory
or VRAM.

Unit tests implemented here cover two data structures:
  - ttm_device -- referred as a buffer object device, which stores
    resource managers and page pools
  - ttm_pool -- a struct of pools (ttm_pool_type) of different page
    orders and caching attributes, with pages that can be reused on
    the next buffer allocation

Use kunit_tool script to manually run the tests:

$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests

To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and then
CONFIG_DRM_TTM_KUNIT_TEST.

As for now, tests are architecture-agnostic (i.e. KUnit runner uses UML
kernel), which means that we have limited coverage in some places. For
example, we can't fully test the initialization of global page pools,
such as global_write_combined. It is to be decided if we want to stick
to UML or use CONFIG_X86 (at least to some extent).

These patches are just a beginning of the work to improve the test
coverage of TTM. Feel free to suggest changes, test cases or priorities.

I dropped ack from 2/3, as I had to update it after helpers refactor.
The functionality of the test was not changed, but it would good to
double-check the patch.

Many thanks,
Karolina

v4:
  - Test helpers have been changed to make the creation of init/fini
    functions for each test suite easier:
    + Decouple device creation from test initialization by adding 
      helpers that initialize ttm_test_devices, a struct which stores
      DRM/TTM devices, and can be used in test-specific init/finis
      (see ttm_pool_tests.c for an example)
    + Introduce generic init/fini functions for tests that only need
      devices
    + Add ttm_device field to ttm_test_devices (previously
      ttm_test_devices_priv)
  - Make TTM buffer object outlive its TT (Christian)
  - Add a dedicated struct for ttm_pool_test (struct ttm_pool_test_priv)
  - Rename functions and structs:
    + struct ttm_test_devices_priv   --> struct ttm_test_devices
    + ttm_kunit_helper_init_device() --> ttm_device_kunit_init()
    + ttm_kunit_helper_ttm_bo_init() --> ttm_bo_kunit_init()
  - Split ttm_kunit_helper_init() into full config (with ttm_device
    init) and basic (init only with device/drm_device) initialization
    functions

v3:
  - Rename ttm_kunit_helper_alloc_device() to ttm_kunit_helper_init_device()
    (Christian)
  - Don't leak a full-blown drm_gem_object in ttm_kunit_helper_ttm_bo_init().
    (Christian). Create a small mock object just to get ttm_tt_init_fields()
    to init the right number of pages
  - As a follow up to the change above, delete ttm_kunit_helper_ttm_bo_fini()
    and just use ttm_bo_put()

v2:
  - Add missing symbol exports in ttm_kunit_helpers.c
  - Update helpers include to fix compilation issues (didn't catch it as
    KUnit tests weren't enabled in the kernel I tested, an oversight
    on my part)
  - Add checks for ttm_pool fields in ttm_pool_alloc_basic(), including the
    one for NUMA node id
  - Rebase the changes on the top of drm-tip

--------------------------------
[1] - https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html

Karolina Stolarek (3):
  drm/ttm: Introduce KUnit tests
  drm/ttm/tests: Add tests for ttm_device
  drm/ttm/tests: Add tests for ttm_pool

 drivers/gpu/drm/Kconfig                       |  15 +
 drivers/gpu/drm/ttm/Makefile                  |   1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig        |   4 +
 drivers/gpu/drm/ttm/tests/Makefile            |   6 +
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 213 +++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 112 +++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  39 ++
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 441 ++++++++++++++++++
 8 files changed, 831 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c

-- 
2.25.1

