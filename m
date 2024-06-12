Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401029051EF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF04889A5C;
	Wed, 12 Jun 2024 12:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vx1YjeNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3266089A5C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 12:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718193804; x=1749729804;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zB4oK3hyaUsF7QAxrHcz4QGg2LzHmLsmMIx/gw9o+x4=;
 b=Vx1YjeNHWQw3kswwMgMwNwLZlILRQXEkMugaKgU3d5wHy5q8rJZ65Eow
 Jh0UYmxTD0+fsElKd+FJjT92Zo4LD10T3KtIBhMxJrOu4wEc77oxCHZwW
 IWsSaTf7oivHgsGk+EJlAAW6brG7oyiWm+m+7u7r9S/FHjPqTCgO2BkcG
 gttWdvDIs/U1fhRICX/Hu+GJYmro6c/xWburny9/d8w3hTLD5M4nB/jt8
 u3VjLN8EtiqpU1NbiaQsJJYQuli4Yqa4rnk9nnSGIEQ4V2AGi3v+uFbwQ
 V+yuXFEGuD8lckjRAAR0EQ4V4hQqs5Xq0VVle0QuPrRz7XQMLUNvNTt/b w==;
X-CSE-ConnectionGUID: 0g7vNu89QXuVMr4dJjXKDg==
X-CSE-MsgGUID: ZuDQCmkfRh+U21NfGQyWgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="15077582"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15077582"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:23 -0700
X-CSE-ConnectionGUID: VEoP5ALETJuYydQIRHbBng==
X-CSE-MsgGUID: FV8/LvdASia58B3Vy+ivng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="70573987"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.214])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:20 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v14 00/12] Improve test coverage of TTM
Date: Wed, 12 Jun 2024 14:02:54 +0200
Message-Id: <cover.1718192625.git.karolina.stolarek@intel.com>
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

v14:
  - Merge checks for system <-> TT move into one (Thomas)

v13 (all suggestions by Thomas):
  - Drop CONFIG_DRM_BUDDY=y from .kunitconfig
  - Remove ttm_bo_wait_ctx(bo, ctx) call from the mock move, it's not needed
  - Update MODULE_LICENSE descriptions (also respectively, 11/12)
  - Use u32 and u64 types instead uint(32|64)_t (also respectively, 12/12)
  - Update TODO to describe how the mock manager can be rewritten

v12:
  - Rewrite "drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk" patch to
    extend ttm_bo_kunit_init() helper to accept a dma_resv object and update
    calls to that helper (Christian)
  - Update drm_buddy_free_list() calls with an extra argument


Karolina Stolarek (12):
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
  drm/ttm/tests: Correct modules' licenses
  drm/ttm/tests: Use u32 and u64 over uint*_t types

 drivers/gpu/drm/Kconfig                       |    1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig        |    1 -
 drivers/gpu/drm/ttm/tests/Makefile            |    2 +
 drivers/gpu/drm/ttm/tests/TODO                |   27 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |   54 +-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 1224 +++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   |    2 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  175 ++-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   17 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |  233 ++++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |   30 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |    8 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |   20 +-
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       |  168 ++-
 drivers/gpu/drm/ttm/ttm_tt.c                  |    3 +
 15 files changed, 1877 insertions(+), 88 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/TODO
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h

-- 
2.34.1

