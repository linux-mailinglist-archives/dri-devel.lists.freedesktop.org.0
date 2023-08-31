Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFB778EB30
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 12:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2F010E60B;
	Thu, 31 Aug 2023 10:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D038110E5FA
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693479518; x=1725015518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rkLbeDVwUD3defb7wXr6SISI4rkD6Ys9gAQmquW1MXU=;
 b=NwCY2uyEWDyuzGBcU6NfLxbIA+wiIU69nU91rf0Qlop5To9OPa7+CX3X
 kAK+OtdaMGAuBRqXZKumpeZmGUDufTCJYYHF5kQ92izay3ugsNVAGvNBa
 QHdcGVN1vcXREiS9VPZ37CPI4bJ5u+zzhAbasls2tFGLC/C7ejV10+/Es
 nWLeocbzYQlvPK9JUp6cD8r+/LB4K816E3DPGQrdkeOYhXMzoc20LqnHa
 afOOLjjfR9B6PPAe1TM6v1BFeF1F5Tm5KNuESasCCUSuntIwNr1rlaqfz
 /jzWXvi7lsSXRdnHWZDooiuUqf3RYWlHkJFsV3UZvxFbvuP/8Sisd54K/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442263924"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="442263924"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809550328"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="809550328"
Received: from kmartek-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.15.132])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:58:36 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Improve test coverage of TTM
Date: Thu, 31 Aug 2023 12:58:18 +0200
Message-Id: <cover.1693479161.git.karolina.stolarek@intel.com>
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

Karolina Stolarek (3):
  drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
  drm/ttm/tests: Add tests for ttm_tt
  drm/ttm/tests: Add tests for ttm_bo functions

 drivers/gpu/drm/ttm/tests/Makefile            |   3 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 616 ++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  48 ++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 277 ++++++++
 6 files changed, 1283 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c

-- 
2.25.1

