Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38630926503
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3182D10E96D;
	Wed,  3 Jul 2024 15:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9xY3ziS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3F510E96A;
 Wed,  3 Jul 2024 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720021105; x=1751557105;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n5yZnMPFzW51ESk/Sm9/Uxoirn4Gvhvr2A5nVnd00Mk=;
 b=N9xY3ziSmhhaVtYefdug0u2AKsymLQ2LqeE62OCyxOVdtPwJL3rdcsp9
 fao0YdctI7ZESi4FMwoPk+7ycYUDuglK+u7KM02Jeu5gNuW28DMy9F5os
 Jg3A4BlaynqEZeyDtyGFKMN3eTP+7kl4FZp7eBixPoaEPyph9bI9UCtXF
 pmik3z+SHHMthCChavKAwKJQJWFX3/zmIdKlgIB/GomwQ5W5XQbc19G+c
 El4zZOK7nUPs9Ocu71PVK27EZA1Tk8FLzmZylbaJOeGB1LlT6dTo3dUY0
 CF+QPZ/TTXfZV0SB9CwFogqye8yLdbsWoY94egOcP17qdkCXbR0tFyhI5 g==;
X-CSE-ConnectionGUID: gK/T8Da9SRSTqDIwZTk1JQ==
X-CSE-MsgGUID: nGRwTGx2TW2NHPnCINSzbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20162582"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="20162582"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:38:24 -0700
X-CSE-ConnectionGUID: vo0kirXzTmWGhF01jgLJJg==
X-CSE-MsgGUID: wcJvUxcdQtWc8vbwWtAHuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46359345"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fedora..) ([10.245.244.226])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:38:22 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v6 00/12] TTM shrinker helpers and xe buffer object shrinker
Date: Wed,  3 Jul 2024 17:38:01 +0200
Message-ID: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
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

v6:
- Address review comments from Matthew Brost as detailed in patches
  4/12, 5/12, 6/12, 7/12, 8/12.

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
 drivers/gpu/drm/ttm/ttm_bo.c                  | 458 ++++++++----------
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 223 +++++++++
 drivers/gpu/drm/ttm/ttm_device.c              |  29 +-
 drivers/gpu/drm/ttm/ttm_pool.c                | 412 +++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c            | 268 ++++++++--
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
 include/drm/ttm/ttm_backup.h                  | 137 ++++++
 include/drm/ttm/ttm_bo.h                      |  51 +-
 include/drm/ttm/ttm_pool.h                    |   5 +
 include/drm/ttm/ttm_resource.h                |  99 +++-
 include/drm/ttm/ttm_tt.h                      |  20 +
 29 files changed, 2149 insertions(+), 377 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

