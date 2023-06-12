Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DEC72C0FA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 12:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF3B10E1F9;
	Mon, 12 Jun 2023 10:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD7810E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 10:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686567349; x=1718103349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qdeLeN4XBA569AHag1fXYSBQi9rbIHZzTPwKmjdWUbk=;
 b=Mq/VGmne0xTq6yfxdPpYld0d0TqCeT9m7WyumUDfE5gT+jC3B2K0ehNp
 Hq8GTbSF/P94YYAUwqrWg34qFsccrKN3nly8Ahf0aycHZPVq4vT/39tqU
 Gr0mziOdZ418acCvqwGJiP9RPdK4j5BqcGpSbdogi/hIxlaxqYFTOWrJb
 GzNeA5mNVfH14bS+j7H7kD2b0ggLv/T7lmKt3k1vpMBo6FI3yNfs8iroI
 6i8MrlpAhBxwxJCWoQ4MYu6kuRmOYWPBWpIIdy4MAa+BHF43F1rZQxd4X
 UM2m3WyWyRFEbipbFZN+G1DwrgFz52nlo78G4RbUlmRTJo0kxLBxo0b9e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="360490056"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="360490056"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 03:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="1041283221"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="1041283221"
Received: from gdampc-mobl.ger.corp.intel.com (HELO kdrobnik-desk.toya.net.pl)
 ([10.213.11.114])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 03:55:43 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/3] Introduce KUnit tests for TTM subsystem 
Date: Mon, 12 Jun 2023 12:55:24 +0200
Message-Id: <cover.1686563485.git.karolina.stolarek@intel.com>
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
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Shuah Khan <shuah@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
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

To build a kernel with TTM KUnit tests, enable CONFIG_DRM_TTM_KUNIT_TEST
symbol.

As for now, tests are architecture-agnostic (i.e. KUnit runner uses UML
kernel), which means that we have limited coverage in some places. For
example, we can't fully test the initialization of global page pools,
such as global_write_combined. It is to be decided if we want to stick
to UML or use CONFIG_X86 (at least to some extent).

These patches are just a beginning of the work to improve the test
coverage of TTM. Feel free to suggest changes, test cases or priorities.

Many thanks,
Karolina
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
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 213 ++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  80 ++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  34 ++
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 401 ++++++++++++++++++
 8 files changed, 754 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c

-- 
2.25.1

