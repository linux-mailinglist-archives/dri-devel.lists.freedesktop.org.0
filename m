Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F1479A72F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCBD10E1D0;
	Mon, 11 Sep 2023 10:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9475610E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694427500; x=1725963500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Il5rY8wmcFyIMFou2Bt/bwDWaxLkIMHapFNsjcrxt7A=;
 b=Nsm66HWTmfIMeKd9aFswNhVKtI04WKWT6XZENAlTy0rwgFhaiHoM6C+d
 y6qgAkJhulsIBhchok6r2mpToFbDJ1wZdpvbWTH8+/BeNgNYjr54oBu94
 GztKzLIi7TGOIp71q0GG4tPOZ35tJAP4FZ1IbJdjjMH+FDKv42xOY0TWa
 5pBvB5QEAvcdR5JE+C2gANQlhOUTd7qHsdXB7Ns+z9AIRkGgiERN9ptEJ
 8/N4tFdLwwuXgbtWLN6YRSLYldziFBgrDGZMR2s6onUhRqBGH5aotokuM
 wEGG11i2oAL1ratC9nW/kWCsVws58FUfwuR2Kls8nwkT7EYamXItA4Ari Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="409013044"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="409013044"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:18:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="772533018"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="772533018"
Received: from adolasin-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.intel.com) ([10.213.28.224])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:18:17 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/5] Improve test coverage of TTM
Date: Mon, 11 Sep 2023 12:17:55 +0200
Message-Id: <cover.1694422112.git.karolina.stolarek@intel.com>
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

v2:
  - Remove Makefile for KUnit tests and move the definitions to the
    TTM's one
  - Switch on CONFIG_DRM_TTM_KUNIT_TEST=m so the tests and TTM module
    are built as one. This allows building the tests as a module, even
    if it uses functions that are not exported
  - Fix ttm_pool_pre_populated(); a wrong flag was passed to
    ttm_tt_kunit_init() function

Karolina Stolarek (5):
  drm/ttm: Update Makefile for KUnit
  drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
  drm/ttm/tests: Add tests for ttm_tt
  drm/ttm/tests: Add tests for ttm_bo functions
  drm/ttm/tests: Don't pass order as page flags

 drivers/gpu/drm/ttm/Makefile                  |  19 +-
 drivers/gpu/drm/ttm/tests/Makefile            |   6 -
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 620 ++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  48 ++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 277 ++++++++
 8 files changed, 1299 insertions(+), 13 deletions(-)
 delete mode 100644 drivers/gpu/drm/ttm/tests/Makefile
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c

-- 
2.25.1

