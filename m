Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F04773975
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 11:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBF110E3A2;
	Tue,  8 Aug 2023 09:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCFA10E3A2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 09:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691488325; x=1723024325;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iGBS8jaY6l2onPPaRAQ1+5IZ/8lFQluixLY8+p1a7Xc=;
 b=jOAHmA6gYzA2KPFf9WHov0J41fwNoXe2HEBoceKLhz/MU/k2/6z/JNCC
 UkzTUHDdszGdguq5N3Ia5caQjRlJftcwdAt2t9qr120jB6UkNxVkDdF76
 dUzFKqFj09+4d9EUgqmxd0XyxP4S7fZgKFEaLZkcToVQDBxauGFtSl63c
 RkcqvDK/NEXgHQEJOo7ojvyIY0KcHCrZBlLhK+SAhRL4qc2J48OBWIswf
 aI5gJPAwv8BApRNNEaTQ3mJSW4asnU/Y5uYGdXLjDxKO5dzTcSSbTCnG5
 gPLGDrtpTFTvkREuKqIev7XBUIrEald0NxCO6frFRUjWZloKj5cNe1XM9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457161057"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="457161057"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 02:51:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061945171"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="1061945171"
Received: from czapiews-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.30.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 02:51:19 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v6 0/3] Introduce KUnit tests for TTM subsystem
Date: Tue,  8 Aug 2023 11:51:11 +0200
Message-Id: <cover.1691487006.git.karolina.stolarek@intel.com>
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

Many thanks,
Karolina

v6:
  - Rebase the series on the top of drm-misc-next (Christian)
  - Remove drm_dev_put() call from ttm_test_devices_put, the drm device is 
    already freed in drm_kunit_helper_free_device()
  - Remove an unnecessary priv assignment in ttm_test_devices_all()
  - Delete ttm_bo_put() from ttm_pool_test_fini() (as for now, we don't count
    krefs for dummy BOs)

v5:
  - Drop unnecessary brackets in 2/3
  - Rebase KConfig file on the top of drm-tip

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
  drm/ttm: Introduce KUnit test
  drm/ttm/tests: Add tests for ttm_device
  drm/ttm/tests: Add tests for ttm_pool

 drivers/gpu/drm/Kconfig                       |  15 +
 drivers/gpu/drm/ttm/Makefile                  |   1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig        |   4 +
 drivers/gpu/drm/ttm/tests/Makefile            |   6 +
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 212 +++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 113 +++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  41 ++
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 437 ++++++++++++++++++
 8 files changed, 829 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c

-- 
2.25.1

