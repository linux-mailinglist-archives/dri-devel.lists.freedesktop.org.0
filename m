Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C24D8A67C1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 12:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C7510E063;
	Tue, 16 Apr 2024 10:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OS/U/8A6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF6910E063;
 Tue, 16 Apr 2024 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713262116; x=1744798116;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g8OikHnRhv4Cpw0bk8TjOC7U6ItOEuRtnah85rtKDLk=;
 b=OS/U/8A6fbMM+hOrb3c87g0jX0BcsTdA0jEwo5LU+Pn2P/XvMKu3xY3q
 ll56NSN8T91pQat4eLOO5zPmn8kHrs2X4NDcmFzWIp/fi13HXcvQKstTA
 VeHj+Sddnsa/tXhquk/aM+Z/OMausmoHvwEzKOw5H3Iu06OMWwsMYzkLc
 BimRASKfQXFqUf3RwOgmRkTFbGcoIUmq11HeGYBffPH31N5Rs7YemvdST
 +XLnaTNz5N0HGU3Zz+Zct5tXTpTgYI0MaguTceTr9rZcWHKBTukhESqQr
 fU3ay8IpxYmhyNYUgKSoX8ClCHAsTQEQEcMMOj5B1Dvu6gpglGDfkYLx8 Q==;
X-CSE-ConnectionGUID: BiLIYcWNQxebXYgBn1yRGA==
X-CSE-MsgGUID: gkNfbCNuSH6hS/Qtc+CBeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20112361"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="20112361"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:08:35 -0700
X-CSE-ConnectionGUID: 3W1g9X7vQiOYHF6yAY6sIw==
X-CSE-MsgGUID: rtocg7ymSwymMlC2nXWrtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22620245"
Received: from fcgoea-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 03:08:33 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/9] TTM shrinker helpers and xe buffer object shrinker
Date: Tue, 16 Apr 2024 12:07:21 +0200
Message-ID: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

This series implements TTM shrinker / eviction helpers and an xe bo
shrinker. It builds on two previous series, *and obsoletes these*. First

https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg484425.html

for patch 1-4, which IMO still could be reviewed and pushed as a
separate series.

Second the previous TTM shrinker series

https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/

Where the comment about layering
https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9

now addressed, and this version also implements shmem objects for backup
rather than direct swap-cache insertions, which was used in the previuos
series. It turns out that with per-page backup / shrinking, shmem objects
appears to work just as well as direct swap-cache insertions with the
added benefit that was introduced in the previous TTM shrinker series to
avoid running out of swap entries isn't really needed.

In any case, patch 1-4 are better described in their separate series.
(RFC is removed for those).

Patch 5 could in theory be skipped but introduces a possibility to easily
add or test multiple backup backends, like the direct swap-cache
insertion or even files into fast dedicated nvme storage for for example.

Patch 6 introduces helpers in the ttm_pool code for page-by-page shrinking
and recovery. It avoids having to temporarily allocate a huge amount of
memory to be able to shrink a buffer object. It also introduces the
possibility to immediately write-back pages if needed, since that tends
to be a bit delayed when left to kswapd.

Patch 7 Adds a simple error injection to the above code to help increase
test coverage.

Patch 8 introduces a LRU walk helper for eviction and shrinking. It's
currently xe-only but not xe-specific and can easily be moved to TTM when
used by more than one driver or when eviction is implemented using it.

Patch 9 introduces a helper callback for shrinking (Also ready to be
moved to TTM) and an xe-specific shrinker implementation. It also
adds a kunit test to test the shrinker functionality by trying to
allocate twice the available amount of RAM as buffer objects. If there
is no swap-space available, the buffer objects are marked
purgeable.

v2:
- Squash obsolete revision history in the patch commit messages.
- Fix a couple of review comments by Christian
- Don't store the mem_type in the TTM managers but in the
  resource cursor.
- Rename introduced TTM *back_up* function names to *backup*
- Add ttm pool recovery fault injection.
- Shrinker xe kunit test
- Various bugfixes

Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (8):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Allow continued swapout after -ENOSPC falure
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages.
  drm/xe, drm/ttm: Provide a generic LRU walker helper
  drm/xe: Add a shrinker for xe bos

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   4 +
 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 137 +++++++++
 drivers/gpu/drm/ttm/ttm_bo.c           |   1 +
 drivers/gpu/drm/ttm/ttm_device.c       |  33 ++-
 drivers/gpu/drm/ttm/ttm_pool.c         | 391 ++++++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c     | 231 ++++++++++++---
 drivers/gpu/drm/ttm/ttm_tt.c           |  34 +++
 drivers/gpu/drm/xe/Makefile            |   2 +
 drivers/gpu/drm/xe/xe_bo.c             | 123 ++++++--
 drivers/gpu/drm/xe/xe_bo.h             |   3 +
 drivers/gpu/drm/xe/xe_device.c         |   8 +
 drivers/gpu/drm/xe/xe_device_types.h   |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c       | 237 +++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h       |  18 ++
 drivers/gpu/drm/xe/xe_ttm_helpers.c    | 224 ++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_helpers.h    |  63 ++++
 drivers/gpu/drm/xe/xe_vm.c             |   4 +
 include/drm/ttm/ttm_backup.h           | 136 +++++++++
 include/drm/ttm/ttm_device.h           |   2 +
 include/drm/ttm/ttm_pool.h             |   4 +
 include/drm/ttm/ttm_resource.h         |  96 +++++-
 include/drm/ttm/ttm_tt.h               |  19 ++
 23 files changed, 1683 insertions(+), 91 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0



Thomas Hellström (9):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Allow continued swapout after -ENOSPC falure
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages.
  drm/ttm: Use fault-injection to test error paths
  drm/xe, drm/ttm: Provide a generic LRU walker helper
  drm/xe: Add a shrinker for xe bos

 drivers/gpu/drm/Kconfig                |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   4 +
 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 137 ++++++++
 drivers/gpu/drm/ttm/ttm_bo.c           |   1 +
 drivers/gpu/drm/ttm/ttm_device.c       |  33 +-
 drivers/gpu/drm/ttm/ttm_pool.c         | 412 ++++++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c     | 229 +++++++++++---
 drivers/gpu/drm/ttm/ttm_tt.c           |  37 +++
 drivers/gpu/drm/xe/Makefile            |   2 +
 drivers/gpu/drm/xe/tests/xe_bo.c       | 118 +++++++
 drivers/gpu/drm/xe/tests/xe_bo_test.c  |   1 +
 drivers/gpu/drm/xe/tests/xe_bo_test.h  |   1 +
 drivers/gpu/drm/xe/xe_bo.c             | 145 ++++++++-
 drivers/gpu/drm/xe/xe_bo.h             |   4 +
 drivers/gpu/drm/xe/xe_device.c         |   8 +
 drivers/gpu/drm/xe/xe_device_types.h   |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c       | 226 ++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h       |  18 ++
 drivers/gpu/drm/xe/xe_ttm_helpers.c    | 224 ++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_helpers.h    |  50 +++
 drivers/gpu/drm/xe/xe_vm.c             |   4 +
 include/drm/ttm/ttm_backup.h           | 136 ++++++++
 include/drm/ttm/ttm_pool.h             |   5 +
 include/drm/ttm/ttm_resource.h         |  99 +++++-
 include/drm/ttm/ttm_tt.h               |  20 ++
 26 files changed, 1839 insertions(+), 89 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

