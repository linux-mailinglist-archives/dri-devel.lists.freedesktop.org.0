Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DB190C42C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBC910E4F5;
	Tue, 18 Jun 2024 07:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+hU50Au";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432A210E4F5;
 Tue, 18 Jun 2024 07:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718695116; x=1750231116;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iQLIBF95FCs0qzZ+14IJJqLsIlylf2FOK1qbw0U2c10=;
 b=i+hU50AuqzdY788M2LcyQnlnTsYxaLN3Ay65sPy0UTEVWD3kuuEkcjCl
 6/r0SeZ/VdjFZ25ZkzEOxmenENazzRr3hTlhJO7A335mM1IjH1z4gEmwe
 fdJUCyDlapXaXHv++CzVXkV4XQ0T9ISgxyFSriDy4gCPClCRsKNZw3XPn
 Oz6a5BGI2Pq4g4onQIW4J5+vmyi+uR/C0czyjspsC8D+JCMfxDQ75VomG
 u9BhCg9o9s/C0w2nPdH5edx5QhUyFnKyT+VjORp4rn0pZ7MYC0WVWNbtw
 1wSeQu7ldy2QM3DaijMSkJVQ1z31J3sHhKeYWQCYpRpHX7i3LMGA3jIsb A==;
X-CSE-ConnectionGUID: E6Z9uq6ERQ27KvdGZfRqCw==
X-CSE-MsgGUID: Y3vFTJ/US6WPlNaiZsND9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15389281"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15389281"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:35 -0700
X-CSE-ConnectionGUID: 5Pklxi2YRDSm+1w2eNNTMA==
X-CSE-MsgGUID: r+ioE52uQoa45eIRd6UupQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="78910604"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.51])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/12] TTM shrinker helpers and xe buffer object shrinker
Date: Tue, 18 Jun 2024 09:18:08 +0200
Message-ID: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
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

Patch 1-4 implements restartable LRU list iteration.

Patch 5 implements a LRU walker + resv locking helper

Patch 6 moves TTM swapping over to the walker.

Patch 7 moves TTM eviction over to the walker.

Patch 8 could in theory be skipped but introduces a possibility to easily
add or test multiple backup backends, like the direct swap-cache
insertion or even files into fast dedicated nvme storage for for example.

Patch 9 introduces helpers in the ttm_pool code for page-by-page shrinking
and recovery. It avoids having to temporarily allocate a huge amount of
memory to be able to shrink a buffer object. It also introduces the
possibility to immediately write-back pages if needed, since that tends
to be a bit delayed when left to kswapd.

Patch 10 Adds a simple error injection to the above code to help increase
test coverage.

Patch 11 Implements an xe bo shrinker and a common helper in TTM for
shrinking.

Patch 12-21 are really a separate POC series, for introducing drm_exec locking
in TTM. The patch touches both drm_exec and dma-buf and is for now marked as
an RFC:

Patch 12 Increases (removes) the XE_PL_TT watermark.

v2:
- Squash obsolete revision history in the patch commit messages.
- Fix a couple of review comments by Christian
- Don't store the mem_type in the TTM managers but in the
  resource cursor.
- Rename introduced TTM *back_up* function names to *backup*
- Add ttm pool recovery fault injection.
- Shrinker xe kunit test
- Various bugfixes

v3:
- Address some review comments from Matthew Brost and Christian König.
- Use the restartable LRU walk for TTM swapping and eviction.
- Provide a POC drm_exec locking implementation for exhaustive
  eviction. (Christian König).

v4:
- Remove the RFC exhaustive eviction part. While the path to exhaustive
  eviction is pretty clear and demonstrated in v3, there is still some
  drm_exec work that needs to be agreed and implemented.
- Add shrinker power management. On some hw we need to wake when shrinking.
- Fix the lru walker helper for -EALREADY errors.
- Add drm/xe: Increase the XE_PL_TT watermark.

v5:
- Update also TTM kunit tests
- Handle ghost- and zombie objects in the shrinker.
- A couple of compile- and UAF fixes reported by Kernel Build Robot and
  Dan Carpenter.

Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (12):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Slightly clean up LRU list iteration
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Provide a generic LRU walker helper
  drm/ttm: Use the LRU walker helper for swapping
  drm/ttm: Use the LRU walker for eviction
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages
  drm/ttm: Use fault-injection to test error paths
  drm/ttm, drm/xe: Add a shrinker for xe bos
  drm/xe: Increase the XE_PL_TT watermark

 drivers/gpu/drm/Kconfig                       |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   4 +
 drivers/gpu/drm/ttm/Makefile                  |   2 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |   6 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c        | 139 ++++++
 drivers/gpu/drm/ttm/ttm_bo.c                  | 463 ++++++++----------
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 212 ++++++++
 drivers/gpu/drm/ttm/ttm_device.c              |  29 +-
 drivers/gpu/drm/ttm/ttm_pool.c                | 412 +++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c            | 264 ++++++++--
 drivers/gpu/drm/ttm/ttm_tt.c                  |  37 ++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c              | 118 +++++
 drivers/gpu/drm/xe/tests/xe_bo_test.c         |   1 +
 drivers/gpu/drm/xe/tests/xe_bo_test.h         |   1 +
 drivers/gpu/drm/xe/xe_bo.c                    | 155 +++++-
 drivers/gpu/drm/xe/xe_bo.h                    |  26 +
 drivers/gpu/drm/xe/xe_device.c                |   8 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c              | 287 +++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h              |  18 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |   3 +-
 drivers/gpu/drm/xe/xe_vm.c                    |   4 +
 include/drm/ttm/ttm_backup.h                  | 136 +++++
 include/drm/ttm/ttm_bo.h                      |  48 +-
 include/drm/ttm/ttm_pool.h                    |   5 +
 include/drm/ttm/ttm_resource.h                |  99 +++-
 include/drm/ttm/ttm_tt.h                      |  20 +
 29 files changed, 2133 insertions(+), 379 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

