Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 454A173F74D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A66D10E2B1;
	Tue, 27 Jun 2023 08:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CA710E2AF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687854748; x=1719390748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Op58+ZvTceJA/kBcs3lFW+Ix7CRRpdSR8m11slUrXk8=;
 b=nrpS82bS4KznlmGp13Yace83TJCTLtnGcfvpqdVkPL6cVVdhruZo48l1
 OMAWyIVz8fBmdIstdKR2zBrFbGcz7whtM54h0XnNET1mifyBkPddOI74a
 /Zg5PBoi8n+BAzsnm8N3OkpnIN79yUqRrAy4W2l357x4gfJowbDlE0/fy
 ac2dnshPLarSrf5RyGHyFmOgDgDZ67FcEdCsLNEez28PrJu28AeYG/tVW
 oE6efR2iyNXBpilgyQSlhk7NbKqLdjfUURUM1ZMKVXMqbGz4HXPF2ZV6b
 Nz0WwcacwxVYZGpVisOEJNJRQMIxXyyGda8Gdh7QbxMKlRJ3Vbu+D4rQi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="364965667"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="364965667"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 01:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890600869"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="890600869"
Received: from aludkiew-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.28.47])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 01:32:25 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v2 0/3] Introduce KUnit tests for TTM subsystem
Date: Tue, 27 Jun 2023 10:32:07 +0200
Message-Id: <cover.1687779215.git.karolina.stolarek@intel.com>
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
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  88 ++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  34 ++
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 406 ++++++++++++++++++
 8 files changed, 767 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c

-- 
2.25.1

