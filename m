Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D093745695
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 09:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3C510E19D;
	Mon,  3 Jul 2023 07:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841B410E19D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 07:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688371127; x=1719907127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zjpDmKXjkjgBEijtr8R/2ADYK4BL+d5AiQFslJy0pb8=;
 b=N4s72YSGab/G8lqXAWHzsgeUB1J/PhP5rTtXE0te/iNvh4mYaa3JMksK
 1WmuRHzAcqNztj7k4HVzpytVo39e7+p4ow9GFAshLO11lYzqU0KSAQu1u
 EwHCDsLlYrF1UorFDapz4IIAz6w4MNb5JC67JoIvegBEGG4zKRnnXNuQZ
 324BWlIYz5hfHUXMJV6tCdio4Axbq09ZC8GxXm6emzvhey5qMCFfG0x3X
 +hPMn8QNlj51QhCEzcOrCaiIAfFrb22NXlh6IISxtzDFcbcMInILs5wKa
 G/rKZy28mTFTZKPg4yD3wfFSxlH9wrHSfqSBHjppG7bqJNAhCSl9MTXud g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="365390899"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="365390899"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 00:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="842571630"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="842571630"
Received: from lszczep-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.28.239])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 00:58:43 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v3 0/3] Introduce KUnit tests for TTM subsystem
Date: Mon,  3 Jul 2023 09:58:27 +0200
Message-Id: <cover.1688131205.git.karolina.stolarek@intel.com>
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

The kunit tool might not work with older python versions. To fix that,
apply [2] patch.

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
[2] - https://lore.kernel.org/lkml/20230610175618.82271-1-sj@kernel.org/T/

Karolina Stolarek (3):
  drm/ttm: Introduce KUnit tests
  drm/ttm/tests: Add tests for ttm_device
  drm/ttm/tests: Add tests for ttm_pool

 drivers/gpu/drm/Kconfig                       |  15 +
 drivers/gpu/drm/ttm/Makefile                  |   1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig        |   4 +
 drivers/gpu/drm/ttm/tests/Makefile            |   6 +
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 213 +++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  74 ++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  33 ++
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 405 ++++++++++++++++++
 8 files changed, 751 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c

-- 
2.25.1

